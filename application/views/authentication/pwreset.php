<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo !empty($global_config['institute_name']) ? html_escape($global_config['institute_name']) : 'স্কুল ম্যানেজমেন্ট সিস্টেম'; ?> | নতুন পাসওয়ার্ড নির্ধারণ</title>

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
            --border-color: #e2e8f0;
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
            margin-bottom: 20px;
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

        .login-hero-side {
            flex: 1.15;
            background: linear-gradient(145deg, #051d1a 0%, #0a2d2a 35%, #0d3835 70%, #061e1b 100%);
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 64px 72px;
            color: #ffffff;
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
                <span>পাসওয়ার্ড পরিবর্তন</span>
            </div>
        </div>

        <div class="form-container">
            <div class="login-title-area">
                <h1>নতুন পাসওয়ার্ড দিন</h1>
                <p>আপনার অ্যাকাউন্টের জন্য একটি শক্তিশালী নতুন পাসওয়ার্ড নির্ধারণ করুন।</p>
            </div>

            <form method="post" accept-charset="utf-8" id="pwResetForm">
                <?php echo $this->app_lib->generateCSRF(); ?>

                <div class="form-group">
                    <label class="form-label" for="newPassword">
                        নতুন পাসওয়ার্ড <span style="color: #dc2626;">*</span>
                    </label>
                    <div class="input-group-custom">
                        <i class="far fa-lock input-icon-left"></i>
                        <input 
                            type="password" 
                            id="newPassword" 
                            name="password" 
                            class="form-control-custom" 
                            placeholder="নতুন পাসওয়ার্ড লিখুন" 
                            required 
                            autofocus
                        >
                    </div>
                    <?php if (form_error('password')): ?>
                        <div style="color: #dc2626; font-size: 12px; margin-top: 6px;">
                            <?php echo strip_tags(form_error('password')); ?>
                        </div>
                    <?php endif; ?>
                </div>

                <div class="form-group">
                    <label class="form-label" for="confirmPassword">
                        পাসওয়ার্ড নিশ্চিত করুন <span style="color: #dc2626;">*</span>
                    </label>
                    <div class="input-group-custom">
                        <i class="far fa-lock input-icon-left"></i>
                        <input 
                            type="password" 
                            id="confirmPassword" 
                            name="c_password" 
                            class="form-control-custom" 
                            placeholder="পুনরায় পাসওয়ার্ড লিখুন" 
                            required
                        >
                    </div>
                    <?php if (form_error('c_password')): ?>
                        <div style="color: #dc2626; font-size: 12px; margin-top: 6px;">
                            <?php echo strip_tags(form_error('c_password')); ?>
                        </div>
                    <?php endif; ?>
                </div>

                <button type="submit" class="btn-login-submit">
                    <span>পাসওয়ার্ড পরিবর্তন করুন</span>
                    <i class="fas fa-check-circle"></i>
                </button>
            </form>

            <div style="text-align: center; margin-top: 24px;">
                <a href="<?php echo base_url("{$this->authentication_model->getSegment(1)}authentication"); ?>" style="color: var(--primary-accent); text-decoration: none; font-weight: 600;">
                    <i class="fas fa-arrow-left"></i> লগইন পেজে ফিরে যান
                </a>
            </div>

        </div>

        <div style="margin-top: 24px; font-size: 13px; color: #94a3b8;">
            &copy; <?php echo date('Y'); ?> সর্বস্বত্ব সংরক্ষিত
        </div>

    </div>

    <div class="login-hero-side">
        <h2 style="font-size: 38px; font-weight: 700; margin-bottom: 20px;">
            নিরাপদ <span style="color: #2dd4bf;">পাসওয়ার্ড পলিসি</span>
        </h2>
        <p style="color: #cbd5e1; font-size: 16px; line-height: 1.8;">
            কমপক্ষে ৮ অক্ষরের জটিল পাসওয়ার্ড ব্যবহার করুন যাতে অক্ষর, সংখ্যা ও বিশেষ চিহ্নের মিশ্রণ থাকে।
        </p>
    </div>

</div>

</body>
</html>
