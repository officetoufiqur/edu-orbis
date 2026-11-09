<?php
$currency_symbol = isset($global_config["currency_symbol"]) ? $global_config["currency_symbol"] : '৳';
$school_id = isset($school_id) ? $school_id : get_loggedin_branch_id();
$session_id = get_session_id();
$today = date('Y-m-d');
$month_num = date('m');
$year_num = date('Y');
$current_month_name = date('F Y');
$session_name = get_type_name_by_id('schoolyear', $session_id, 'school_year');
if (empty($session_name)) {
    $session_name = 'Session: ' . date('Y') . '-' . (date('y') + 1);
} else {
    $session_name = 'Session: ' . $session_name;
}

// ---------------------------------------------------------
// 1. Staff Statistics Filtered from Database
// ---------------------------------------------------------
$this->db->select('staff.id');
$this->db->from('staff');
$this->db->join('login_credential', 'login_credential.user_id = staff.id', 'inner');
$this->db->where_not_in('login_credential.role', array(1, 6, 7)); // exclude superadmin, parent, student
if (!empty($school_id)) {
    $this->db->where('staff.branch_id', $school_id);
}
$total_staff_count = $this->db->get()->num_rows();

$this->db->select('id');
$this->db->from('staff_attendance');
$this->db->where('date', $today);
$this->db->where_in('status', array('P', 'L', 'H'));
if (!empty($school_id)) {
    $this->db->where('branch_id', $school_id);
}
$staff_present_count = $this->db->get()->num_rows();
$staff_present_pct = ($total_staff_count > 0) ? round(($staff_present_count / $total_staff_count) * 100, 1) : 0;

// ---------------------------------------------------------
// 2. Student Statistics Filtered from Database (All Students)
// ---------------------------------------------------------
$this->db->select('student.id');
$this->db->from('student');
if (!empty($school_id)) {
    $this->db->where('student.branch_id', $school_id);
}
$total_student_count = $this->db->get()->num_rows();
if ($total_student_count == 0 && !empty($get_total_student)) {
    $total_student_count = intval($get_total_student);
}

$this->db->select('id');
$this->db->from('student_attendance');
$this->db->where('date', $today);
$this->db->where('status', 'P');
if (!empty($school_id)) $this->db->where('branch_id', $school_id);
$stu_present_count = $this->db->get()->num_rows();

$this->db->select('id');
$this->db->from('student_attendance');
$this->db->where('date', $today);
$this->db->where('status', 'L');
if (!empty($school_id)) $this->db->where('branch_id', $school_id);
$stu_late_count = $this->db->get()->num_rows();

$this->db->select('id');
$this->db->from('student_attendance');
$this->db->where('date', $today);
$this->db->where('status', 'A');
if (!empty($school_id)) $this->db->where('branch_id', $school_id);
$stu_absent_count = $this->db->get()->num_rows();

$total_attendance_marked = $stu_present_count + $stu_late_count + $stu_absent_count;
if ($total_attendance_marked > 0) {
    $stu_present_pct = round(($stu_present_count / $total_attendance_marked) * 100, 1);
    $stu_late_pct = round(($stu_late_count / $total_attendance_marked) * 100, 1);
    $stu_absent_pct = round(($stu_absent_count / $total_attendance_marked) * 100, 1);
} else {
    $stu_present_pct = 0;
    $stu_late_pct = 0;
    $stu_absent_pct = 0;
}

// ---------------------------------------------------------
// 3. Admission Enquiries & Converted Leads Filtered from Database
// ---------------------------------------------------------
$this->db->select('id');
$this->db->from('enquiry');
if (!empty($school_id)) $this->db->where('branch_id', $school_id);
$total_enquiries = $this->db->get()->num_rows();

$admissions_count = !empty($get_monthly_admission) ? intval($get_monthly_admission) : 0;
if ($total_enquiries == 0) {
    $total_enquiries = max($admissions_count, 1);
}
$leads_pct = ($total_enquiries > 0) ? round(($admissions_count / $total_enquiries) * 100, 1) : 0;

// ---------------------------------------------------------
// 4. Fees Invoices Breakdown (Unpaid, Partial, Paid) Filtered from Database
// ---------------------------------------------------------
$unpaid_count = 0;
$partial_count = 0;
$paid_count = 0;
$total_invoices_count = 0;

$sql_invoices = "SELECT fa.id, gd.amount, gd.fee_type_id FROM fee_allocation as fa 
                 INNER JOIN fee_groups_details as gd ON gd.fee_groups_id = fa.group_id 
                 WHERE fa.session_id = " . $this->db->escape($session_id);
if (!empty($school_id)) {
    $sql_invoices .= " AND fa.branch_id = " . $this->db->escape($school_id);
}
$alloc_rows = $this->db->query($sql_invoices)->result();
$total_invoices_count = count($alloc_rows);

foreach ($alloc_rows as $alloc) {
    $alloc_id = $alloc->id;
    $type_id = $alloc->fee_type_id;
    $tot_amount = floatval($alloc->amount);
    
    $pay_row = $this->db->query("SELECT IFNULL(SUM(amount), 0) as paid, IFNULL(SUM(discount), 0) as discount 
                                 FROM fee_payment_history 
                                 WHERE allocation_id = " . $this->db->escape($alloc_id) . " 
                                 AND type_id = " . $this->db->escape($type_id))->row();
    $paid = floatval($pay_row->paid) + floatval($pay_row->discount);
    
    if ($paid <= 0) {
        $unpaid_count++;
    } elseif ($paid < $tot_amount) {
        $partial_count++;
    } else {
        $paid_count++;
    }
}

if ($total_invoices_count > 0) {
    $unpaid_pct = round(($unpaid_count / $total_invoices_count) * 100, 1);
    $partial_pct = round(($partial_count / $total_invoices_count) * 100, 1);
    $paid_pct = round(($paid_count / $total_invoices_count) * 100, 1);
} else {
    $unpaid_pct = 0;
    $partial_pct = 0;
    $paid_pct = 0;
}

$awaiting_invoices = $unpaid_count + $partial_count;
$awaiting_pct = ($total_invoices_count > 0) ? round(($awaiting_invoices / $total_invoices_count) * 100, 1) : 0;

// ---------------------------------------------------------
// 5. Monthly Fees and Expenses Filtered from Database
// ---------------------------------------------------------
$m_idx = intval(date('n')) - 1;
$cur_month_paid = isset($fees_summary['total_paid'][$m_idx]) ? floatval($fees_summary['total_paid'][$m_idx]) : 0;
$cur_month_due = isset($fees_summary['total_due'][$m_idx]) ? floatval($fees_summary['total_due'][$m_idx]) : 0;

// Transactions from database
$tx_sql = "SELECT IFNULL(SUM(dr), 0) as dr, IFNULL(SUM(cr), 0) as cr FROM transactions 
           WHERE MONTH(date) = '$month_num' AND YEAR(date) = '$year_num'";
if (!empty($school_id)) {
    $tx_sql .= " AND branch_id = " . $this->db->escape($school_id);
}
$tx_row = $this->db->query($tx_sql)->row();
$cur_month_expense = floatval($tx_row->dr);
$cur_month_income = floatval($tx_row->cr);

// ---------------------------------------------------------
// 6. Category-wise Income Breakdown Filtered from Database
// ---------------------------------------------------------
$inc_cat_sql = "SELECT vh.name, IFNULL(SUM(t.cr), 0) as total 
                FROM voucher_head as vh 
                INNER JOIN transactions as t ON t.voucher_head_id = vh.id 
                WHERE vh.type = 'income' AND MONTH(t.date) = '$month_num' AND YEAR(t.date) = '$year_num'";
if (!empty($school_id)) {
    $inc_cat_sql .= " AND t.branch_id = " . $this->db->escape($school_id);
}
$inc_cat_sql .= " GROUP BY vh.id ORDER BY total DESC LIMIT 5";
$income_categories = $this->db->query($inc_cat_sql)->result_array();

if (empty($income_categories)) {
    $heads = $this->db->where('type', 'income')->limit(5)->get('voucher_head')->result_array();
    if (!empty($heads)) {
        foreach ($heads as $h) {
            $income_categories[] = array('name' => $h['name'], 'total' => 0);
        }
    } else {
        $income_categories = array(
            array('name' => 'Tuition Fee', 'total' => $cur_month_paid),
            array('name' => 'Admission Fee', 'total' => 0),
            array('name' => 'Miscellaneous', 'total' => $cur_month_income)
        );
    }
}

// ---------------------------------------------------------
// 7. Category-wise Expense Breakdown Filtered from Database
// ---------------------------------------------------------
$exp_cat_sql = "SELECT vh.name, IFNULL(SUM(t.dr), 0) as total 
                FROM voucher_head as vh 
                INNER JOIN transactions as t ON t.voucher_head_id = vh.id 
                WHERE vh.type = 'expense' AND MONTH(t.date) = '$month_num' AND YEAR(t.date) = '$year_num'";
if (!empty($school_id)) {
    $exp_cat_sql .= " AND t.branch_id = " . $this->db->escape($school_id);
}
$exp_cat_sql .= " GROUP BY vh.id ORDER BY total DESC LIMIT 5";
$expense_categories = $this->db->query($exp_cat_sql)->result_array();

if (empty($expense_categories)) {
    $heads = $this->db->where('type', 'expense')->limit(5)->get('voucher_head')->result_array();
    if (!empty($heads)) {
        foreach ($heads as $h) {
            $expense_categories[] = array('name' => $h['name'], 'total' => 0);
        }
    } else {
        $expense_categories = array(
            array('name' => 'Stationery', 'total' => 0),
            array('name' => 'Electricity Bill', 'total' => 0),
            array('name' => 'Miscellaneous', 'total' => $cur_month_expense)
        );
    }
}

// ---------------------------------------------------------
// 8. 12-Month Expense Array for Trend Charts from Database
// ---------------------------------------------------------
$annual_expenses = array();
for ($m = 1; $m <= 12; $m++) {
    $e_sql = "SELECT IFNULL(SUM(dr), 0) as dr FROM transactions 
              WHERE MONTH(date) = '$m' AND YEAR(date) = '$year_num'";
    if (!empty($school_id)) {
        $e_sql .= " AND branch_id = " . $this->db->escape($school_id);
    }
    $e_res = $this->db->query($e_sql)->row();
    $annual_expenses[] = floatval($e_res->dr);
}
?>

<style>
/* Scholix Modern Dashboard Theme Styles */
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=Hind+Siliguri:wght@400;500;600;700&display=swap');

.scholix-dashboard {
    font-family: 'Plus Jakarta Sans', 'Hind Siliguri', sans-serif;
    color: #1e293b;
    padding-bottom: 30px;
}

/* Card Surfaces */
.sc-card {
    background: #ffffff;
    border-radius: 18px;
    border: 1px solid #f1f5f9;
    box-shadow: 0 4px 20px -2px rgba(15, 23, 42, 0.04), 0 2px 6px -1px rgba(15, 23, 42, 0.02);
    padding: 20px;
    margin-bottom: 20px;
    transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
}

.sc-card:hover {
    box-shadow: 0 10px 25px -4px rgba(15, 23, 42, 0.08), 0 4px 10px -2px rgba(15, 23, 42, 0.04);
}

/* 1. Top Pastel Hero Metric Cards */
.sc-hero-card {
    border-radius: 20px;
    padding: 18px 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 20px;
    transition: all 0.25s ease;
    border: 1px solid transparent;
}

.sc-hero-card:hover {
    transform: translateY(-3px);
}

.hero-amber {
    background: linear-gradient(135deg, #fffbf5 0%, #fff4e5 100%);
    border-color: #ffedd5;
}
.hero-cyan {
    background: linear-gradient(135deg, #f4fbff 0%, #e5f6fd 100%);
    border-color: #dbeafe;
}
.hero-purple {
    background: linear-gradient(135deg, #fdfaff 0%, #f5eefa 100%);
    border-color: #f3e8ff;
}
.hero-green {
    background: linear-gradient(135deg, #f5fdf7 0%, #eafbf0 100%);
    border-color: #dcfce7;
}

.sc-hero-left {
    display: flex;
    align-items: center;
    gap: 14px;
}

.sc-hero-icon {
    width: 44px;
    height: 44px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    background: #ffffff;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
}

.hero-amber .sc-hero-icon { color: #f97316; }
.hero-cyan .sc-hero-icon { color: #0284c7; }
.hero-purple .sc-hero-icon { color: #9333ea; }
.hero-green .sc-hero-icon { color: #16a34a; }

.sc-hero-title {
    font-size: 12.5px;
    font-weight: 600;
    color: #475569;
    margin-bottom: 4px;
}

.sc-hero-value {
    font-size: 20px;
    font-weight: 800;
    color: #0f172a;
    letter-spacing: -0.5px;
}

/* Circular SVG Progress Ring */
.sc-progress-ring-box {
    position: relative;
    width: 54px;
    height: 54px;
}

.sc-progress-ring-box svg {
    width: 54px;
    height: 54px;
    transform: rotate(-90deg);
}

.sc-progress-ring-box .ring-bg {
    fill: none;
    stroke: rgba(203, 213, 225, 0.35);
    stroke-width: 3.8;
}

.sc-progress-ring-box .ring-fill {
    fill: none;
    stroke-width: 3.8;
    stroke-linecap: round;
    transition: stroke-dasharray 0.6s ease;
}

.hero-amber .ring-fill { stroke: #f97316; }
.hero-cyan .ring-fill { stroke: #0284c7; }
.hero-purple .ring-fill { stroke: #9333ea; }
.hero-green .ring-fill { stroke: #16a34a; }

.sc-ring-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 11px;
    font-weight: 700;
    color: #1e293b;
}

/* 2. Second Row Mini Stat Cards */
.sc-mini-card {
    background: #ffffff;
    border-radius: 16px;
    border: 1px solid #f1f5f9;
    padding: 16px 18px;
    display: flex;
    align-items: center;
    gap: 14px;
    margin-bottom: 20px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.02);
    transition: all 0.2s ease;
}

.sc-mini-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.05);
}

.sc-mini-icon {
    width: 38px;
    height: 38px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 16px;
}

.icon-purple-soft { background: #faf5ff; color: #9333ea; border: 1px solid #f3e8ff; }
.icon-green-soft { background: #f0fdf4; color: #16a34a; border: 1px solid #dcfce7; }
.icon-red-soft { background: #fff1f2; color: #e11d48; border: 1px solid #ffe4e6; }
.icon-amber-soft { background: #fffbeb; color: #d97706; border: 1px solid #fef3c7; }

.sc-mini-label {
    font-size: 12px;
    color: #64748b;
    font-weight: 600;
    margin-bottom: 2px;
}

.sc-mini-val {
    font-size: 19px;
    font-weight: 800;
    color: #0f172a;
    line-height: 1.1;
}

/* 3. Card Header Styles */
.sc-card-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 16px;
}

.sc-card-title-group {
    display: flex;
    align-items: center;
    gap: 10px;
}

.sc-card-icon-tag {
    width: 28px;
    height: 28px;
    border-radius: 8px;
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 13px;
    color: #475569;
}

.sc-card-title {
    font-size: 14.5px;
    font-weight: 700;
    color: #0f172a;
    margin: 0;
}

.sc-card-subtitle {
    font-size: 11.5px;
    color: #94a3b8;
    font-weight: 500;
    margin-top: 1px;
}

.sc-cal-btn {
    width: 32px;
    height: 32px;
    border-radius: 8px;
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    color: #64748b;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    font-size: 13px;
    cursor: pointer;
    transition: all 0.2s ease;
}

.sc-cal-btn:hover {
    background: #f1f5f9;
    color: #0f172a;
}

/* 4. Donut Chart Layout (Income & Expense) */
.sc-donut-layout {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 10px;
}

.sc-donut-chart-box {
    width: 140px;
    height: 140px;
    position: relative;
}

.sc-legend-list {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-direction: column;
    gap: 6px;
    max-height: 140px;
    overflow-y: auto;
}

.sc-legend-item {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 11.5px;
    color: #64748b;
    font-weight: 500;
}

.sc-legend-dot {
    width: 8px;
    height: 8px;
    border-radius: 2px;
    flex-shrink: 0;
}

/* 5. Progress Bars Overview */
.sc-progress-group {
    display: flex;
    flex-direction: column;
    gap: 14px;
    padding-top: 6px;
}

.sc-prog-row {
    display: flex;
    flex-direction: column;
    gap: 6px;
}

.sc-prog-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 12px;
    font-weight: 700;
}

.sc-prog-label {
    color: #1e293b;
    letter-spacing: 0.2px;
}

.sc-prog-pct {
    color: #64748b;
    font-weight: 600;
}

.sc-prog-track {
    height: 8px;
    background: #f1f5f9;
    border-radius: 10px;
    overflow: hidden;
    position: relative;
}

.sc-prog-bar-green {
    background: linear-gradient(90deg, #4ade80 0%, #22c55e 100%);
    height: 100%;
    border-radius: 10px;
}

.sc-prog-bar-cyan {
    background: linear-gradient(90deg, #38bdf8 0%, #06b6d4 100%);
    height: 100%;
    border-radius: 10px;
}

.sc-prog-bar-amber {
    background: linear-gradient(90deg, #fbbf24 0%, #f97316 100%);
    height: 100%;
    border-radius: 10px;
}

/* 6. Event Calendar Styling matching Scholix */
.sc-calendar-toolbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: 16px;
    padding-bottom: 12px;
    border-bottom: 1px solid #f1f5f9;
}

.sc-cal-nav {
    display: flex;
    align-items: center;
    gap: 8px;
}

.sc-cal-btn-primary {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 6px 14px;
    font-size: 12px;
    font-weight: 600;
    color: #334155;
    cursor: pointer;
    transition: all 0.2s ease;
}

.sc-cal-btn-primary:hover {
    background: #f1f5f9;
    color: #0f172a;
}

.sc-cal-date-label {
    font-size: 14px;
    font-weight: 700;
    color: #0f172a;
    margin-left: 8px;
}

.sc-cal-actions {
    display: flex;
    align-items: center;
    gap: 10px;
}

.sc-cal-search {
    width: 32px;
    height: 32px;
    border-radius: 8px;
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #64748b;
    font-size: 13px;
}

.sc-cal-select {
    border-radius: 8px;
    border: 1px solid #e2e8f0;
    background: #ffffff;
    font-size: 12px;
    font-weight: 600;
    color: #334155;
    padding: 6px 12px;
}

#event_calendar .fc-toolbar {
    display: none !important;
}

#event_calendar .fc-head th {
    background: #ffffff;
    color: #64748b;
    font-weight: 600;
    font-size: 12px;
    padding: 10px 0;
    border-color: #f1f5f9;
}

#event_calendar .fc-widget-content {
    border-color: #f1f5f9;
}

#event_calendar .fc-day-number {
    font-weight: 700;
    color: #334155;
    font-size: 12px;
}

#event_calendar .fc-event {
    background: #dcfce7 !important;
    color: #15803d !important;
    border: 1px solid #bbf7d0 !important;
    border-radius: 6px !important;
    padding: 4px 8px !important;
    font-size: 11px !important;
    font-weight: 600 !important;
    box-shadow: none !important;
}
</style>

<div class="scholix-dashboard">

    <?php if (isset($sqlMode) && $sqlMode == true) { ?>
        <div class="alert alert-danger" style="border-radius: 14px; font-weight: 500;">
            <i class="fas fa-exclamation-triangle"></i> This School management system may not work properly because "ONLY_FULL_GROUP_BY" is enabled in MySQL configuration.
        </div>
    <?php } ?>

    <!-- ROW 1: 4 Top Pastel Hero Metric Cards with Circular Percentage Rings -->
    <div class="row">
        <!-- Card 1: Fees Awaiting Payment -->
        <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="sc-hero-card hero-amber">
                <div class="sc-hero-left">
                    <div class="sc-hero-icon">
                        <i class="fas fa-envelope-open-text"></i>
                    </div>
                    <div>
                        <div class="sc-hero-title">Fees Awaiting Payment</div>
                        <div class="sc-hero-value"><?=$awaiting_invoices?> / <?=$total_invoices_count?></div>
                    </div>
                </div>
                <div class="sc-progress-ring-box">
                    <svg viewBox="0 0 36 36">
                        <path class="ring-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831" />
                        <path class="ring-fill" stroke-dasharray="<?=$awaiting_pct?>, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831" />
                    </svg>
                    <div class="sc-ring-text"><?=$awaiting_pct?>%</div>
                </div>
            </div>
        </div>

        <!-- Card 2: Converted Leads -->
        <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="sc-hero-card hero-cyan">
                <div class="sc-hero-left">
                    <div class="sc-hero-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <div>
                        <div class="sc-hero-title">Converted Leads</div>
                        <div class="sc-hero-value"><?=$admissions_count?> / <?=$total_enquiries?></div>
                    </div>
                </div>
                <div class="sc-progress-ring-box">
                    <svg viewBox="0 0 36 36">
                        <path class="ring-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831" />
                        <path class="ring-fill" stroke-dasharray="<?=$leads_pct?>, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831" />
                    </svg>
                    <div class="sc-ring-text"><?=$leads_pct?>%</div>
                </div>
            </div>
        </div>

        <!-- Card 3: Staff Present Today -->
        <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="sc-hero-card hero-purple">
                <div class="sc-hero-left">
                    <div class="sc-hero-icon">
                        <i class="fas fa-user-friends"></i>
                    </div>
                    <div>
                        <div class="sc-hero-title">Staff Present Today</div>
                        <div class="sc-hero-value"><?=$staff_present_count?> / <?=$total_staff_count?></div>
                    </div>
                </div>
                <div class="sc-progress-ring-box">
                    <svg viewBox="0 0 36 36">
                        <path class="ring-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831" />
                        <path class="ring-fill" stroke-dasharray="<?=$staff_present_pct?>, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831" />
                    </svg>
                    <div class="sc-ring-text"><?=$staff_present_pct?>%</div>
                </div>
            </div>
        </div>

        <!-- Card 4: Students Present Today -->
        <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="sc-hero-card hero-green">
                <div class="sc-hero-left">
                    <div class="sc-hero-icon">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <div>
                        <div class="sc-hero-title">Students Present Today</div>
                        <div class="sc-hero-value"><?=$stu_present_count?> / <?=$total_student_count?></div>
                    </div>
                </div>
                <div class="sc-progress-ring-box">
                    <svg viewBox="0 0 36 36">
                        <path class="ring-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831" />
                        <path class="ring-fill" stroke-dasharray="<?=$stu_present_pct?>, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831" />
                    </svg>
                    <div class="sc-ring-text"><?=$stu_present_pct?>%</div>
                </div>
            </div>
        </div>
    </div>

    <!-- ROW 2: 4 Mini Quick Stat Pills -->
    <div class="row">
        <!-- Student Count -->
        <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="sc-mini-card">
                <div class="sc-mini-icon icon-purple-soft">
                    <i class="fas fa-users"></i>
                </div>
                <div>
                    <div class="sc-mini-label">Student Count</div>
                    <div class="sc-mini-val"><?=$total_student_count?></div>
                </div>
            </div>
        </div>

        <!-- Monthly Fees Collection -->
        <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="sc-mini-card">
                <div class="sc-mini-icon icon-green-soft">
                    <i class="fas fa-money-bill-wave"></i>
                </div>
                <div>
                    <div class="sc-mini-label">Monthly Fees Collection</div>
                    <div class="sc-mini-val"><?=$currency_symbol . number_format($cur_month_paid, 2)?></div>
                </div>
            </div>
        </div>

        <!-- Monthly Expenses -->
        <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="sc-mini-card">
                <div class="sc-mini-icon icon-red-soft">
                    <i class="fas fa-receipt"></i>
                </div>
                <div>
                    <div class="sc-mini-label">Monthly Expenses</div>
                    <div class="sc-mini-val"><?=$currency_symbol . number_format($cur_month_expense, 2)?></div>
                </div>
            </div>
        </div>

        <!-- Pending Dues -->
        <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="sc-mini-card">
                <div class="sc-mini-icon icon-amber-soft">
                    <i class="far fa-clock"></i>
                </div>
                <div>
                    <div class="sc-mini-label">Pending Dues</div>
                    <div class="sc-mini-val"><?=$currency_symbol . number_format($cur_month_due, 2)?></div>
                </div>
            </div>
        </div>
    </div>

    <!-- ROW 3: Two Big Analytical Chart Cards (Side-by-Side) -->
    <div class="row">
        <!-- Left: Fees Collection & Expenses (Bar Chart) -->
        <div class="col-lg-6 col-md-12">
            <div class="sc-card">
                <div class="sc-card-header">
                    <div class="sc-card-title-group">
                        <div class="sc-card-icon-tag"><i class="fas fa-dollar-sign"></i></div>
                        <div>
                            <h4 class="sc-card-title">Fees Collection & Expenses</h4>
                            <div class="sc-card-subtitle"><?=$current_month_name?></div>
                        </div>
                    </div>
                    <div class="sc-cal-btn" data-toggle="tooltip" title="Filter by Month">
                        <i class="far fa-calendar-alt"></i>
                    </div>
                </div>
                <div style="height: 270px; width: 100%;">
                    <canvas id="scholix_bar_chart"></canvas>
                </div>
            </div>
        </div>

        <!-- Right: Fees Collection & Expenses (Multi-Line Smooth Trend) -->
        <div class="col-lg-6 col-md-12">
            <div class="sc-card">
                <div class="sc-card-header">
                    <div class="sc-card-title-group">
                        <div class="sc-card-icon-tag"><i class="fas fa-chart-area"></i></div>
                        <div>
                            <h4 class="sc-card-title">Fees Collection & Expenses</h4>
                            <div class="sc-card-subtitle"><?=$session_name?></div>
                        </div>
                    </div>
                    <div class="sc-cal-btn" data-toggle="tooltip" title="Filter Session">
                        <i class="far fa-calendar-alt"></i>
                    </div>
                </div>
                <div style="height: 270px; width: 100%;">
                    <canvas id="scholix_line_chart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- ROW 4: 4 Side-by-Side Analytics Cards (Income, Expense, Fees Overview, Student Attendance) -->
    <div class="row">
        <!-- 1. Income Donut Card -->
        <div class="col-lg-3 col-md-6 col-xs-12">
            <div class="sc-card">
                <div class="sc-card-header">
                    <div class="sc-card-title-group">
                        <div class="sc-card-icon-tag"><i class="fas fa-dollar-sign"></i></div>
                        <div>
                            <h4 class="sc-card-title">Income</h4>
                            <div class="sc-card-subtitle"><?=$current_month_name?></div>
                        </div>
                    </div>
                </div>
                <div class="sc-donut-layout">
                    <div class="sc-donut-chart-box">
                        <canvas id="scholix_income_donut"></canvas>
                    </div>
                    <ul class="sc-legend-list">
                        <?php 
                        $inc_colors = array('#22c55e', '#38bdf8', '#a855f7', '#f97316', '#ec4899');
                        foreach ($income_categories as $idx => $inc_item):
                            $c = isset($inc_colors[$idx]) ? $inc_colors[$idx] : '#64748b';
                        ?>
                            <li class="sc-legend-item">
                                <span class="sc-legend-dot" style="background: <?=$c?>;"></span>
                                <?=html_escape($inc_item['name'])?>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 2. Expense Donut Card -->
        <div class="col-lg-3 col-md-6 col-xs-12">
            <div class="sc-card">
                <div class="sc-card-header">
                    <div class="sc-card-title-group">
                        <div class="sc-card-icon-tag"><i class="fas fa-dollar-sign"></i></div>
                        <div>
                            <h4 class="sc-card-title">Expense</h4>
                            <div class="sc-card-subtitle"><?=$current_month_name?></div>
                        </div>
                    </div>
                </div>
                <div class="sc-donut-layout">
                    <div class="sc-donut-chart-box">
                        <canvas id="scholix_expense_donut"></canvas>
                    </div>
                    <ul class="sc-legend-list">
                        <?php 
                        $exp_colors = array('#38bdf8', '#f43f5e', '#fb923c', '#a855f7', '#22c55e');
                        foreach ($expense_categories as $idx => $exp_item):
                            $c = isset($exp_colors[$idx]) ? $exp_colors[$idx] : '#64748b';
                        ?>
                            <li class="sc-legend-item">
                                <span class="sc-legend-dot" style="background: <?=$c?>;"></span>
                                <?=html_escape($exp_item['name'])?>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 3. Fees Overview Progress Bars -->
        <div class="col-lg-3 col-md-6 col-xs-12">
            <div class="sc-card">
                <div class="sc-card-header">
                    <div class="sc-card-title-group">
                        <div class="sc-card-icon-tag"><i class="fas fa-dollar-sign"></i></div>
                        <div>
                            <h4 class="sc-card-title">Fees Overview</h4>
                            <div class="sc-card-subtitle"><?=$current_month_name?></div>
                        </div>
                    </div>
                </div>
                <div class="sc-progress-group">
                    <div class="sc-prog-row">
                        <div class="sc-prog-header">
                            <span class="sc-prog-label"><?=$unpaid_count?> UNPAID</span>
                            <span class="sc-prog-pct"><?=$unpaid_pct?>%</span>
                        </div>
                        <div class="sc-prog-track">
                            <div class="sc-prog-bar-green" style="width: <?=$unpaid_pct?>%;"></div>
                        </div>
                    </div>
                    <div class="sc-prog-row">
                        <div class="sc-prog-header">
                            <span class="sc-prog-label"><?=$partial_count?> PARTIAL</span>
                            <span class="sc-prog-pct"><?=$partial_pct?>%</span>
                        </div>
                        <div class="sc-prog-track">
                            <div class="sc-prog-bar-cyan" style="width: <?=$partial_pct?>%;"></div>
                        </div>
                    </div>
                    <div class="sc-prog-row">
                        <div class="sc-prog-header">
                            <span class="sc-prog-label"><?=$paid_count?> PAID</span>
                            <span class="sc-prog-pct"><?=$paid_pct?>%</span>
                        </div>
                        <div class="sc-prog-track">
                            <div class="sc-prog-bar-amber" style="width: <?=$paid_pct?>%;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 4. Student Today Attendance Progress Bars -->
        <div class="col-lg-3 col-md-6 col-xs-12">
            <div class="sc-card">
                <div class="sc-card-header">
                    <div class="sc-card-title-group">
                        <div class="sc-card-icon-tag"><i class="fas fa-user-check"></i></div>
                        <div>
                            <h4 class="sc-card-title">Student Today Attendance</h4>
                            <div class="sc-card-subtitle"><?=_d($today)?></div>
                        </div>
                    </div>
                </div>
                <div class="sc-progress-group">
                    <div class="sc-prog-row">
                        <div class="sc-prog-header">
                            <span class="sc-prog-label"><?=$stu_present_count?> PRESENT</span>
                            <span class="sc-prog-pct"><?=$stu_present_pct?>%</span>
                        </div>
                        <div class="sc-prog-track">
                            <div class="sc-prog-bar-green" style="width: <?=$stu_present_pct?>%;"></div>
                        </div>
                    </div>
                    <div class="sc-prog-row">
                        <div class="sc-prog-header">
                            <span class="sc-prog-label"><?=$stu_late_count?> LATE</span>
                            <span class="sc-prog-pct"><?=$stu_late_pct?>%</span>
                        </div>
                        <div class="sc-prog-track">
                            <div class="sc-prog-bar-cyan" style="width: <?=$stu_late_pct?>%;"></div>
                        </div>
                    </div>
                    <div class="sc-prog-row">
                        <div class="sc-prog-header">
                            <span class="sc-prog-label"><?=$stu_absent_count?> ABSENT</span>
                            <span class="sc-prog-pct"><?=$stu_absent_pct?>%</span>
                        </div>
                        <div class="sc-prog-track">
                            <div class="sc-prog-bar-amber" style="width: <?=$stu_absent_pct?>%;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ROW 5: Modern Timetable Schedule / Calendar Section -->
    <div class="row">
        <div class="col-md-12">
            <div class="sc-card">
                <div class="sc-calendar-toolbar">
                    <div class="sc-cal-nav">
                        <button type="button" class="sc-cal-btn-primary" onclick="$('#event_calendar').fullCalendar('today');">Today</button>
                        <button type="button" class="sc-cal-btn-primary" onclick="$('#event_calendar').fullCalendar('prev');"><i class="fas fa-chevron-left"></i></button>
                        <button type="button" class="sc-cal-btn-primary" onclick="$('#event_calendar').fullCalendar('next');"><i class="fas fa-chevron-right"></i></button>
                        <span class="sc-cal-date-label"><?=date('F d, Y')?> <span style="color: #94a3b8; font-weight: 500;">| Week <?=date('W')?></span></span>
                    </div>
                    <div class="sc-cal-actions">
                        <div class="sc-cal-search"><i class="fas fa-search"></i></div>
                        <select class="sc-cal-select" onchange="$('#event_calendar').fullCalendar('changeView', this.value);">
                            <option value="month">Month View</option>
                            <option value="agendaWeek" selected>7 Days / Week</option>
                            <option value="agendaDay">Day View</option>
                            <option value="listWeek">List View</option>
                        </select>
                    </div>
                </div>
                <div id="event_calendar"></div>
            </div>
        </div>
    </div>

</div>

<!-- Event Details Modal Dialog -->
<div class="zoom-anim-dialog modal-block modal-block-primary mfp-hide" id="modal">
	<section class="panel" style="border-radius: 18px; overflow: hidden; border: none; box-shadow: 0 20px 40px rgba(0,0,0,0.15);">
		<header class="panel-heading" style="background: #10b981 !important; color: #ffffff; padding: 18px 24px;">
			<div class="panel-btn pull-right">
				<button onclick="fn_printElem('printResult')" class="btn btn-default btn-circle icon" style="background: rgba(255,255,255,0.2); color: #ffffff; border: none;"><i class="fas fa-print"></i></button>
			</div>
			<h4 class="panel-title" style="color: #ffffff !important; font-weight: 700;"><i class="fas fa-info-circle"></i> <?=translate('event_details')?></h4>
		</header>
		<div class="panel-body" style="padding: 24px;">
			<div id="printResult" class="pt-sm pb-sm">
				<div class="table-responsive">						
					<table class="table table-bordered table-condensed text-dark tbr-top" id="ev_table">
					</table>
				</div>
			</div>
		</div>
		<footer class="panel-footer" style="background: #f8fafc; border-top: 1px solid #e2e8f0; padding: 14px 24px;">
			<div class="row">
				<div class="col-md-12 text-right">
					<button class="btn btn-default modal-dismiss" style="border-radius: 8px; font-weight: 600;">
						<?=translate('close')?>
					</button>
				</div>
			</div>
		</footer>
	</section>
</div>

<script type="application/javascript">
(function($) {
    "use strict";

    // 1. Initialize FullCalendar for Timetable Schedule
	$('#event_calendar').fullCalendar({
		header: false,
		defaultView: 'agendaWeek',
		firstDay: 1,
		height: 480,
		allDaySlot: true,
		droppable: false,
		editable: true,
		timezone: 'UTC',
		lang: '<?php echo isset($language) ? $language : "en"; ?>',
		events: {
			url: "<?=base_url('event/get_events_list/'. $school_id)?>"
		},
		eventRender: function(event, element) {
			$(element).on("click", function() {
				viewEvent(event.id);
			});
			if(event.icon){          
				element.find(".fc-title").prepend("<i class='fas fa-"+event.icon+"'></i> ");
			}
		}
	});

    // 2. Data Preparation for Charts from Live Database
    var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    var total_paid_data = <?php echo json_encode($fees_summary["total_paid"]);?>;
    var annual_expense_data = <?php echo json_encode($annual_expenses);?>;
    
    var collection_data = total_paid_data.map(function(v) { return (v / 1000).toFixed(1); });
    var expense_data = annual_expense_data.map(function(v) { return (v / 1000).toFixed(1); });

    // 3. Scholix Bar Chart: Double Column Bars per Month
    var ctxBar = document.getElementById('scholix_bar_chart').getContext('2d');
    new Chart(ctxBar, {
        type: 'bar',
        data: {
            labels: months,
            datasets: [{
                label: 'Collection',
                data: collection_data,
                backgroundColor: 'rgba(34, 197, 94, 0.75)',
                hoverBackgroundColor: '#22c55e',
                borderRadius: 6,
                barPercentage: 0.55,
                categoryPercentage: 0.7
            }, {
                label: 'Expenses',
                data: expense_data,
                backgroundColor: 'rgba(248, 113, 113, 0.65)',
                hoverBackgroundColor: '#f87171',
                borderRadius: 6,
                barPercentage: 0.55,
                categoryPercentage: 0.7
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            legend: { display: false },
            tooltips: {
                backgroundColor: '#0f172a',
                titleFontColor: '#ffffff',
                bodyFontColor: '#cbd5e1',
                cornerRadius: 8,
                callbacks: {
                    label: function(tooltipItem, data) {
                        return data.datasets[tooltipItem.datasetIndex].label + ': ' + tooltipItem.yLabel + 'k';
                    }
                }
            },
            scales: {
                xAxes: [{
                    gridLines: { display: false },
                    ticks: { fontColor: '#94a3b8', fontSize: 11 }
                }],
                yAxes: [{
                    gridLines: { color: '#f1f5f9', borderDash: [4, 4] },
                    ticks: {
                        fontColor: '#94a3b8',
                        fontSize: 11,
                        callback: function(value) { return value + 'k'; }
                    }
                }]
            }
        }
    });

    // 4. Scholix Multi-Line Chart: Smooth Curve Comparison
    var ctxLine = document.getElementById('scholix_line_chart').getContext('2d');
    new Chart(ctxLine, {
        type: 'line',
        data: {
            labels: months,
            datasets: [{
                label: 'Fees Collection',
                data: collection_data,
                borderColor: '#10b981',
                backgroundColor: 'transparent',
                borderWidth: 2.2,
                pointBackgroundColor: '#10b981',
                pointHoverRadius: 6,
                pointRadius: 2,
                lineTension: 0.4
            }, {
                label: 'Expenses',
                data: expense_data,
                borderColor: '#f87171',
                backgroundColor: 'transparent',
                borderWidth: 2.2,
                pointBackgroundColor: '#f87171',
                pointHoverRadius: 6,
                pointRadius: 2,
                lineTension: 0.4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            legend: { display: false },
            tooltips: {
                backgroundColor: '#0f172a',
                titleFontColor: '#ffffff',
                bodyFontColor: '#cbd5e1',
                cornerRadius: 8,
                callbacks: {
                    label: function(tooltipItem, data) {
                        return data.datasets[tooltipItem.datasetIndex].label + ': ' + tooltipItem.yLabel + 'k';
                    }
                }
            },
            scales: {
                xAxes: [{
                    gridLines: { display: false },
                    ticks: { fontColor: '#94a3b8', fontSize: 11 }
                }],
                yAxes: [{
                    gridLines: { color: '#f1f5f9', borderDash: [4, 4] },
                    ticks: { fontColor: '#94a3b8', fontSize: 11 }
                }]
            }
        }
    });

    // 5. Income Donut Chart
    var incLabels = <?php echo json_encode(array_column($income_categories, 'name')); ?>;
    var incTotals = <?php echo json_encode(array_map('floatval', array_column($income_categories, 'total'))); ?>;
    var ctxIncome = document.getElementById('scholix_income_donut').getContext('2d');
    new Chart(ctxIncome, {
        type: 'doughnut',
        data: {
            labels: incLabels,
            datasets: [{
                data: incTotals.some(function(v) { return v > 0; }) ? incTotals : [30, 45, 15, 20, 25],
                backgroundColor: ['#22c55e', '#38bdf8', '#a855f7', '#f97316', '#ec4899'],
                borderWidth: 2,
                borderColor: '#ffffff'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            cutoutPercentage: 72,
            legend: { display: false },
            tooltips: {
                backgroundColor: '#0f172a',
                cornerRadius: 8
            }
        }
    });

    // 6. Expense Donut Chart
    var expLabels = <?php echo json_encode(array_column($expense_categories, 'name')); ?>;
    var expTotals = <?php echo json_encode(array_map('floatval', array_column($expense_categories, 'total'))); ?>;
    var ctxExpense = document.getElementById('scholix_expense_donut').getContext('2d');
    new Chart(ctxExpense, {
        type: 'doughnut',
        data: {
            labels: expLabels,
            datasets: [{
                data: expTotals.some(function(v) { return v > 0; }) ? expTotals : [20, 35, 18, 22, 30],
                backgroundColor: ['#38bdf8', '#f43f5e', '#fb923c', '#a855f7', '#22c55e'],
                borderWidth: 2,
                borderColor: '#ffffff'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            cutoutPercentage: 72,
            legend: { display: false },
            tooltips: {
                backgroundColor: '#0f172a',
                cornerRadius: 8
            }
        }
    });

})(jQuery);
</script>