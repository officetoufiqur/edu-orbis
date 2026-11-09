<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo !empty($global_config['institute_name']) ? html_escape($global_config['institute_name']) : 'স্কুল ম্যানেজমেন্ট সিস্টেম'; ?> | পাসওয়ার্ড পুনরুদ্ধার</title>

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
            --font-bn: 'Hind Siliguri', 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, sans-serif;
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
            font-size: 30px;
            font-weight: 700;
            color: var(--text-main);
            margin-bottom: 8px;
        }

        .login-title-area p {
            color: var(--text-muted);
            font-size: 15px;
        }

        .form-group {
            margin-bottom: 22px;
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
        }

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

        .hero-glow-1 {
            position: absolute;
            width: 450px;
            height: 450px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(20, 184, 166, 0.15) 0%, rgba(20, 184, 166, 0) 70%);
            top: -100px;
            right: -100px;
            filter: blur(40px);
        }

        .hero-main-content {
            margin: 36px 0;
            z-index: 1;
            max-width: 540px;
        }

        .hero-headline {
            font-size: 38px;
            font-weight: 700;
            line-height: 1.3;
            margin-bottom: 20px;
            color: #ffffff;
        }

        .hero-headline span {
            background: linear-gradient(135deg, #5eead4 0%, #2dd4bf 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        @media (max-width: 1024px) {
            .login-wrapper { flex-direction: column; }
            .login-form-side { padding: 40px 32px; }
            .login-hero-side { display: none; }
        }
    </style>
</head>
<body>

<div class="login-wrapper">

    <div class="login-form-side">
        
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
                <span>পাসওয়ার্ড পুনরুদ্ধার পোর্টাল</span>
            </div>
        </div>

        <div class="form-container">
            <div class="login-title-area">
                <h1>পাসওয়ার্ড ভুলে গেছেন?</h1>
                <p>আপনার নিবন্ধিত ইমেইল বা ইউজারনেম দিন। পাসওয়ার্ড রিসেট লিঙ্ক আপনার ইমেইলে পাঠানো হবে।</p>
            </div>

            <?php 
                if ($this->session->flashdata('reset_res')) {
                    if ($this->session->flashdata('reset_res') == 'true') {
                        echo '<div class="alert-box alert-box-success"><i class="fas fa-circle-check"></i> <div>পাসওয়ার্ড রিসেট ইমেইল সফলভাবে পাঠানো হয়েছে। অনুগ্রহ করে আপনার ইনবক্স চেক করুন।</div></div>';
                    } elseif ($this->session->flashdata('reset_res') == 'false') {
                        echo '<div class="alert-box alert-box-danger"><i class="fas fa-circle-exclamation"></i> <div>আপনার প্রদত্ত ইমেইল বা ইউজারনেম খুঁজে পাওয়া যায়নি।</div></div>';
                    }
                }
            ?>

            <?php echo form_open($this->uri->uri_string(), array('id' => 'forgotForm')); ?>
                
                <div class="form-group">
                    <label class="form-label" for="username">
                        ইমেইল বা ইউজারনেম <span style="color: #dc2626;">*</span>
                    </label>
                    <div class="input-group-custom">
                        <i class="far fa-envelope input-icon-left"></i>
                        <input 
                            type="text" 
                            id="username" 
                            name="username" 
                            value="<?php echo set_value('username'); ?>" 
                            class="form-control-custom" 
                            placeholder="আপনার ইমেইল বা ইউজারনেম লিখুন" 
                            required 
                            autofocus
                        >
                    </div>
                    <?php if (form_error('username')): ?>
                        <div style="color: #dc2626; font-size: 12px; margin-top: 6px;">
                            <?php echo strip_tags(form_error('username')); ?>
                        </div>
                    <?php endif; ?>
                </div>

                <button type="submit" class="btn-login-submit" id="submitForgotBtn">
                    <span>রিসেট লিঙ্ক পাঠান</span>
                    <i class="fas fa-paper-plane"></i>
                </button>

            <?php echo form_close(); ?>

            <div style="text-align: center; margin-top: 24px;">
                <a href="<?php echo base_url("{$this->authentication_model->getSegment(1)}authentication"); ?>" class="back-home-link">
                    <i class="fas fa-arrow-left"></i> লগইন পেজে ফিরে যান
                </a>
            </div>

        </div>

        <div class="login-footer-links">
            <a href="<?php echo base_url(); ?>" class="back-home-link">
                <i class="fas fa-home"></i> মূল ওয়েবসাইট
            </a>
            <span style="color: #94a3b8;">
                &copy; <?php echo date('Y'); ?> সর্বস্বত্ব সংরক্ষিত
            </span>
        </div>

    </div>

    <div class="login-hero-side">
        <div class="hero-glow-1"></div>
        <div class="hero-main-content">
            <h2 class="hero-headline">
                নিরাপদ ও নির্ভরযোগ্য <span>অ্যাকাউন্ট ব্যবস্থাপনা</span>
            </h2>
            <p style="color: #cbd5e1; font-size: 16px; line-height: 1.8;">
                আপনার অ্যাকাউন্টের নিরাপত্তা নিশ্চিত করতে আমরা দ্বি-স্তরীয় যাচাইকরণ ও এনক্রিপ্টেড পাসওয়ার্ড সুরক্ষা প্রদান করি।
            </p>
        </div>
    </div>

</div>

</body>
</html>
