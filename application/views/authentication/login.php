<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo !empty($global_config['institute_name']) ? html_escape($global_config['institute_name']) : 'স্কুল ম্যানেজমেন্ট সিস্টেম'; ?> | লগইন</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="<?php echo base_url('assets/images/favicon.png');?>" type="image/x-icon">

    <!-- Google Fonts: Hind Siliguri (Bangla) & Plus Jakarta Sans (English) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hind+Siliguri:wght@400;500;600;700&family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary-dark: #092c28;
            --primary-teal: #0d3835;
            --primary-accent: #0f766e;
            --primary-light: #14b8a6;
            --accent-glow: rgba(20, 184, 166, 0.18);
            --text-main: #0f172a;
            --text-muted: #64748b;
            --text-light: #94a3b8;
            --border-color: #e2e8f0;
            --border-focus: #0d3835;
            --bg-light: #f8fafc;
            --bg-card: #ffffff;
            --font-bn: 'Hind Siliguri', 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, sans-serif;
            --font-en: 'Plus Jakarta Sans', 'Hind Siliguri', sans-serif;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: var(--font-bn);
            background-color: #f1f5f9;
            color: var(--text-main);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            line-height: 1.6;
            -webkit-font-smoothing: antialiased;
        }

        .login-wrapper {
            width: 100%;
            min-height: 100vh;
            display: flex;
            background: #ffffff;
        }

        /* ---------------- Left Form Column ---------------- */
        .login-form-side {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 44px 56px;
            background: #ffffff;
            overflow-y: auto;
            position: relative;
        }

        .login-header-brand {
            display: flex;
            align-items: center;
            gap: 14px;
            margin-bottom: 28px;
        }

        .brand-logo {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: #f0fdfa;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(13, 56, 53, 0.08);
            border: 1px solid #ccfbf1;
        }

        .brand-logo img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }

        .brand-info h2 {
            font-size: 20px;
            font-weight: 700;
            color: var(--primary-dark);
            margin: 0;
            line-height: 1.2;
            letter-spacing: -0.3px;
        }

        .brand-info span {
            font-size: 12px;
            font-weight: 500;
            color: var(--primary-accent);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-container {
            width: 100%;
            max-width: 440px;
            margin: 0 auto;
            align-self: center;
        }

        .login-title-area {
            margin-bottom: 28px;
        }

        .login-title-area h1 {
            font-size: 32px;
            font-weight: 700;
            color: var(--text-main);
            margin-bottom: 8px;
            letter-spacing: -0.5px;
        }

        .login-title-area p {
            color: var(--text-muted);
            font-size: 15px;
            line-height: 1.5;
        }

        /* Form Controls */
        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 8px;
        }

        .input-group-custom {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-icon-left {
            position: absolute;
            left: 16px;
            color: #94a3b8;
            font-size: 16px;
            pointer-events: none;
            transition: color 0.2s ease;
            z-index: 2;
        }

        .form-control-custom {
            width: 100%;
            height: 50px;
            padding: 12px 16px 12px 46px;
            font-size: 15px;
            font-family: var(--font-bn);
            color: var(--text-main);
            background-color: #ffffff;
            border: 1.5px solid var(--border-color);
            border-radius: 12px;
            outline: none;
            transition: all 0.2s ease;
        }

        .form-control-custom:focus {
            border-color: var(--primary-teal);
            box-shadow: 0 0 0 4px var(--accent-glow);
        }

        .form-control-custom:focus + .input-icon-left,
        .input-group-custom:focus-within .input-icon-left {
            color: var(--primary-teal);
        }

        .form-control-custom::placeholder {
            color: #94a3b8;
            font-size: 14px;
        }

        .btn-toggle-password {
            position: absolute;
            right: 12px;
            background: none;
            border: none;
            color: #94a3b8;
            cursor: pointer;
            padding: 8px;
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            transition: color 0.2s ease, background 0.2s ease;
            z-index: 2;
        }

        .btn-toggle-password:hover {
            color: var(--text-main);
            background: #f1f5f9;
        }

        /* Form Footer / Remember & Forgot */
        .form-options-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 22px;
            font-size: 14px;
        }

        .remember-checkbox {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            user-select: none;
            color: #475569;
            font-weight: 500;
        }

        .remember-checkbox input[type="checkbox"] {
            width: 17px;
            height: 17px;
            accent-color: var(--primary-teal);
            cursor: pointer;
            border-radius: 4px;
        }

        .forgot-link {
            color: var(--primary-accent);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s ease;
        }

        .forgot-link:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        /* Submit Button */
        .btn-login-submit {
            width: 100%;
            height: 50px;
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary-teal) 100%);
            color: #ffffff;
            font-family: var(--font-bn);
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            box-shadow: 0 4px 14px rgba(13, 56, 53, 0.25);
            transition: all 0.25s ease;
        }

        .btn-login-submit:hover {
            background: linear-gradient(135deg, #071f1c 0%, var(--primary-dark) 100%);
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(13, 56, 53, 0.35);
        }

        .btn-login-submit:active {
            transform: translateY(1px);
            box-shadow: 0 2px 8px rgba(13, 56, 53, 0.25);
        }

        .btn-login-submit i {
            transition: transform 0.2s ease;
        }

        .btn-login-submit:hover i {
            transform: translateX(4px);
        }

        /* Quick Demo Roles Selector */
        .quick-roles-section {
            margin-top: 24px;
            padding-top: 20px;
            border-top: 1px dashed #e2e8f0;
        }

        .quick-roles-title {
            font-size: 13px;
            font-weight: 600;
            color: #64748b;
            text-align: center;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .quick-roles-title::before,
        .quick-roles-title::after {
            content: '';
            flex: 1;
            height: 1px;
            background: #e2e8f0;
        }

        .quick-roles-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 8px;
        }

        .role-badge-btn {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 8px 6px;
            font-size: 12px;
            font-weight: 600;
            color: #334155;
            cursor: pointer;
            text-align: center;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }

        .role-badge-btn:hover {
            background: #f0fdfa;
            border-color: #99f6e4;
            color: var(--primary-accent);
            transform: translateY(-1px);
        }

        /* Bottom Footer */
        .login-footer-links {
            margin-top: 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 13px;
            color: #64748b;
        }

        .back-home-link {
            color: var(--primary-accent);
            text-decoration: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: color 0.2s ease;
        }

        .back-home-link:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        .copyright-text {
            color: #94a3b8;
        }

        /* Error / Alert Styles */
        .alert-box {
            padding: 12px 16px;
            border-radius: 10px;
            font-size: 14px;
            margin-bottom: 20px;
            display: flex;
            align-items: flex-start;
            gap: 12px;
        }

        .alert-box-danger {
            background: #fef2f2;
            border: 1px solid #fecaca;
            color: #991b1b;
        }

        .alert-box-success {
            background: #f0fdf4;
            border: 1px solid #bbf7d0;
            color: #166534;
        }

        .field-error-text {
            color: #dc2626;
            font-size: 12px;
            font-weight: 500;
            margin-top: 6px;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        /* ---------------- Right Hero Showcase Column ---------------- */
        .login-hero-side {
            flex: 1.15;
            background: linear-gradient(145deg, #051d1a 0%, #0a2d2a 35%, #0d3835 70%, #061e1b 100%);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 64px 72px;
            position: relative;
            overflow: hidden;
            color: #ffffff;
        }

        /* Subtle glowing background orbs */
        .hero-glow-1 {
            position: absolute;
            width: 450px;
            height: 450px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(20, 184, 166, 0.15) 0%, rgba(20, 184, 166, 0) 70%);
            top: -100px;
            right: -100px;
            filter: blur(40px);
            pointer-events: none;
        }

        .hero-glow-2 {
            position: absolute;
            width: 500px;
            height: 500px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(13, 148, 136, 0.18) 0%, rgba(13, 148, 136, 0) 70%);
            bottom: -150px;
            left: -100px;
            filter: blur(50px);
            pointer-events: none;
        }

        .hero-top-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 30px;
            font-size: 13px;
            font-weight: 600;
            color: #99f6e4;
            width: fit-content;
            z-index: 1;
        }

        .hero-top-badge i {
            color: #2dd4bf;
        }

        .hero-main-content {
            margin: 36px 0;
            z-index: 1;
            max-width: 540px;
        }

        .hero-headline {
            font-size: 40px;
            font-weight: 700;
            line-height: 1.3;
            margin-bottom: 24px;
            color: #ffffff;
            letter-spacing: -0.5px;
        }

        .hero-headline span {
            background: linear-gradient(135deg, #5eead4 0%, #2dd4bf 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        /* Testimonial / Highlight Card */
        .hero-quote-card {
            background: rgba(255, 255, 255, 0.06);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 20px;
            padding: 26px 30px;
            position: relative;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
            margin-bottom: 24px;
        }

        .quote-icon {
            font-size: 28px;
            color: #2dd4bf;
            opacity: 0.8;
            margin-bottom: 10px;
        }

        .quote-text {
            font-size: 15px;
            line-height: 1.7;
            color: #e2e8f0;
            font-weight: 400;
            margin-bottom: 18px;
        }

        .quote-author-row {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .author-avatar {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            background: linear-gradient(135deg, #14b8a6, #0d9488);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
            font-size: 18px;
            font-weight: 700;
            border: 2px solid rgba(255, 255, 255, 0.3);
        }

        .author-meta h4 {
            font-size: 15px;
            font-weight: 600;
            color: #ffffff;
            margin: 0;
        }

        .author-meta p {
            font-size: 13px;
            color: #94a3b8;
            margin: 0;
        }

        /* Bottom Feature Highlights */
        .hero-footer-features {
            z-index: 1;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 20px;
        }

        .features-title {
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #94a3b8;
            font-weight: 600;
            margin-bottom: 12px;
        }

        .features-chips-list {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .feature-chip {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 6px 12px;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 20px;
            font-size: 12px;
            color: #cbd5e1;
            font-weight: 500;
        }

        .feature-chip i {
            color: #2dd4bf;
            font-size: 11px;
        }

        /* ---------------- Responsive Styles ---------------- */
        @media (max-width: 1024px) {
            .login-wrapper {
                flex-direction: column;
            }

            .login-form-side {
                padding: 40px 32px;
                order: 1;
            }

            .login-hero-side {
                display: none;
            }

            .form-container {
                max-width: 480px;
            }
        }

        @media (max-width: 640px) {
            .login-form-side {
                padding: 28px 20px;
            }

            .login-title-area h1 {
                font-size: 26px;
            }

            .quick-roles-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .form-options-row {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
            }
        }
    </style>
</head>
<body>

<div class="login-wrapper">

    <!-- Left Column: Bengali Login Form -->
    <div class="login-form-side">
        
        <!-- Header / Logo -->
        <div class="login-header-brand">
            <div class="brand-logo">
                <?php 
                    $logo_url = $this->application_model->getBranchImage($branch_id, 'logo');
                    if (!empty($logo_url)): 
                ?>
                    <img src="<?php echo $logo_url; ?>" alt="Logo">
                <?php else: ?>
                    <i class="fas fa-graduation-cap" style="font-size: 24px; color: var(--primary-teal);"></i>
                <?php endif; ?>
            </div>
            <div class="brand-info">
                <h2><?php echo !empty($global_config['institute_name']) ? html_escape($global_config['institute_name']) : 'স্মার্ট স্কুল ইআরপি'; ?></h2>
                <span>শিক্ষা ব্যবস্থাপনা পোর্টাল</span>
            </div>
        </div>

        <!-- Main Form Area -->
        <div class="form-container">
            <div class="login-title-area">
                <h1>স্বাগতম!</h1>
                <p>আপনার ড্যাশবোর্ডে প্রবেশ করতে লগইন তথ্য প্রদান করুন।</p>
            </div>

            <!-- Flash Error / Success Alerts -->
            <?php 
                $alert_error = $this->session->flashdata('alert-message-error');
                $alert_success = $this->session->flashdata('alert-message-success');
                if (!empty($alert_error)): 
            ?>
                <div class="alert-box alert-box-danger">
                    <i class="fas fa-circle-exclamation" style="font-size: 18px; margin-top: 2px;"></i>
                    <div>
                        <strong>লগইন ব্যর্থ হয়েছে!</strong><br>
                        <?php echo $alert_error; ?>
                    </div>
                </div>
            <?php endif; ?>

            <?php if (!empty($alert_success)): ?>
                <div class="alert-box alert-box-success">
                    <i class="fas fa-circle-check" style="font-size: 18px; margin-top: 2px;"></i>
                    <div>
                        <strong>সফল!</strong><br>
                        <?php echo $alert_success; ?>
                    </div>
                </div>
            <?php endif; ?>

            <!-- Login Form -->
            <?php echo form_open($this->uri->uri_string(), array('id' => 'schoolLoginForm', 'autocomplete' => 'on')); ?>
                
                <!-- Email or Username Input -->
                <div class="form-group">
                    <label class="form-label" for="userEmail">
                        ইমেইল বা ইউজারনেম <span style="color: #dc2626;">*</span>
                    </label>
                    <div class="input-group-custom">
                        <i class="far fa-envelope input-icon-left"></i>
                        <input 
                            type="text" 
                            id="userEmail" 
                            name="email" 
                            value="<?php echo set_value('email'); ?>" 
                            class="form-control-custom" 
                            placeholder="আপনার ইমেইল বা ইউজারনেম লিখুন" 
                            required 
                            autofocus
                        >
                    </div>
                    <?php if (form_error('email')): ?>
                        <div class="field-error-text">
                            <i class="fas fa-exclamation-circle"></i> <?php echo strip_tags(form_error('email')); ?>
                        </div>
                    <?php endif; ?>
                </div>

                <!-- Password Input -->
                <div class="form-group">
                    <label class="form-label" for="userPassword">
                        পাসওয়ার্ড <span style="color: #dc2626;">*</span>
                    </label>
                    <div class="input-group-custom">
                        <i class="far fa-lock input-icon-left"></i>
                        <input 
                            type="password" 
                            id="userPassword" 
                            name="password" 
                            class="form-control-custom" 
                            placeholder="আপনার পাসওয়ার্ড লিখুন" 
                            autocomplete="current-password"
                            required
                        >
                        <button type="button" class="btn-toggle-password" id="togglePasswordBtn" title="পাসওয়ার্ড দেখুন বা লুকান">
                            <i class="far fa-eye" id="togglePasswordIcon"></i>
                        </button>
                    </div>
                    <?php if (form_error('password')): ?>
                        <div class="field-error-text">
                            <i class="fas fa-exclamation-circle"></i> <?php echo strip_tags(form_error('password')); ?>
                        </div>
                    <?php endif; ?>
                </div>

                <!-- Options Row: Remember Me & Forgot Password -->
                <div class="form-options-row">
                    <label class="remember-checkbox" for="rememberMeCheckbox">
                        <input type="checkbox" id="rememberMeCheckbox" name="remember">
                        লগইন মনে রাখুন
                    </label>
                    <a href="<?php echo base_url("{$this->authentication_model->getSegment(1)}forgot"); ?>" class="forgot-link">
                        পাসওয়ার্ড ভুলে গেছেন?
                    </a>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn-login-submit" id="submitBtn">
                    <span>লগইন করুন</span>
                    <i class="fas fa-arrow-right"></i>
                </button>

            <?php echo form_close(); ?>

            <!-- Quick Role Autofill for Easy Testing -->
            <div class="quick-roles-section">
                <div class="quick-roles-title">
                    <span>কুইক ডেমো লগইন নির্বাচন</span>
                </div>
                <div class="quick-roles-grid">
                    <button type="button" class="role-badge-btn" onclick="quickFill('superadmin', 'password')">
                        <i class="fas fa-user-shield"></i> সুপারঅ্যাডমিন
                    </button>
                    <button type="button" class="role-badge-btn" onclick="quickFill('admin', 'password')">
                        <i class="fas fa-user-tie"></i> অ্যাডমিন
                    </button>
                    <button type="button" class="role-badge-btn" onclick="quickFill('teacher', 'password')">
                        <i class="fas fa-chalkboard-teacher"></i> শিক্ষক
                    </button>
                    <button type="button" class="role-badge-btn" onclick="quickFill('accountant', 'password')">
                        <i class="fas fa-calculator"></i> হিসাবরক্ষক
                    </button>
                    <button type="button" class="role-badge-btn" onclick="quickFill('student', 'password')">
                        <i class="fas fa-user-graduate"></i> শিক্ষার্থী
                    </button>
                    <button type="button" class="role-badge-btn" onclick="quickFill('parent', 'password')">
                        <i class="fas fa-users"></i> অভিভাবক
                    </button>
                </div>
            </div>

        </div>

        <!-- Footer Links -->
        <div class="login-footer-links">
            <a href="<?php echo base_url(); ?>" class="back-home-link">
                <i class="fas fa-arrow-left"></i> মূল ওয়েবসাইটে ফিরে যান
            </a>
            <span class="copyright-text">
                &copy; <?php echo date('Y'); ?> সর্বস্বত্ব সংরক্ষিত
            </span>
        </div>

    </div>

    <!-- Right Column: Modern Hero Showcase (Deep Teal Gradient) -->
    <div class="login-hero-side">
        
        <div class="hero-glow-1"></div>
        <div class="hero-glow-2"></div>

        <!-- Top Badge -->
        <div class="hero-top-badge">
            <i class="fas fa-sparkles"></i>
            <span>স্মার্ট এডুকেশন প্ল্যাটফর্ম</span>
        </div>

        <!-- Center Headline & Testimonial Card -->
        <div class="hero-main-content">
            <h2 class="hero-headline">
                স্মার্ট অটোমেশনে <span>শিক্ষা প্রতিষ্ঠানের</span> সম্পূর্ণ ব্যবস্থাপনা
            </h2>

            <div class="hero-quote-card">
                <div class="quote-icon">
                    <i class="fas fa-quote-left"></i>
                </div>
                <p class="quote-text">
                    "ডিজিটাল প্রযুক্তির মাধ্যমে শিক্ষা প্রতিষ্ঠান পরিচালনা, অনলাইন ক্লাস, স্বয়ংক্রিয় ফি কালেকশন, ফলাফল ও উপস্থিতি ব্যবস্থাপনা এখন আরও সহজ, দ্রুত ও নির্ভরযোগ্য।"
                </p>
                <div class="quote-author-row">
                    <div class="author-avatar">
                        <i class="fas fa-school"></i>
                    </div>
                    <div class="author-meta">
                        <h4><?php echo !empty($global_config['institute_name']) ? html_escape($global_config['institute_name']) : 'স্কুল ইআরপি সিস্টেম'; ?></h4>
                        <p>ক্লাউড-ভিত্তিক শিক্ষা প্রশাসন</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bottom Feature Chips -->
        <div class="hero-footer-features">
            <div class="features-title">সিস্টেমের প্রধান সুবিধাসমূহ</div>
            <div class="features-chips-list">
                <div class="feature-chip"><i class="fas fa-check-circle"></i> অনলাইন ভর্তি</div>
                <div class="feature-chip"><i class="fas fa-check-circle"></i> লাইভ হাজিরা</div>
                <div class="feature-chip"><i class="fas fa-check-circle"></i> ফি ও হিসাবরক্ষণ</div>
                <div class="feature-chip"><i class="fas fa-check-circle"></i> অনলাইন পরীক্ষা</div>
                <div class="feature-chip"><i class="fas fa-check-circle"></i> অটোমেটেড মার্কশিট</div>
                <div class="feature-chip"><i class="fas fa-check-circle"></i> এসএমএস নোটিফিকেশন</div>
            </div>
        </div>

    </div>

</div>

<!-- Scripts: Toggle Password Visibility & Quick Role Autofill -->
<script>
    // Password Toggle Functionality
    const toggleBtn = document.getElementById('togglePasswordBtn');
    const passwordInput = document.getElementById('userPassword');
    const toggleIcon = document.getElementById('togglePasswordIcon');

    if (toggleBtn && passwordInput && toggleIcon) {
        toggleBtn.addEventListener('click', function() {
            const isPassword = passwordInput.getAttribute('type') === 'password';
            passwordInput.setAttribute('type', isPassword ? 'text' : 'password');
            toggleIcon.classList.toggle('fa-eye', !isPassword);
            toggleIcon.classList.toggle('fa-eye-slash', isPassword);
        });
    }

    // Quick Autofill Function for Demo / Roles
    function quickFill(username, password) {
        const emailField = document.getElementById('userEmail');
        const passField = document.getElementById('userPassword');
        if (emailField && passField) {
            emailField.value = username;
            passField.value = password;
            emailField.focus();
        }
    }

    // Form Submit Feedback
    const form = document.getElementById('schoolLoginForm');
    const submitBtn = document.getElementById('submitBtn');
    if (form && submitBtn) {
        form.addEventListener('submit', function() {
            submitBtn.innerHTML = '<span>যাচাই করা হচ্ছে...</span> <i class="fas fa-spinner fa-spin"></i>';
            submitBtn.style.opacity = '0.85';
            submitBtn.style.pointerEvents = 'none';
        });
    }
</script>

</body>
</html>
