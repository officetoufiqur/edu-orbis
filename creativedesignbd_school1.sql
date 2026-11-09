-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 01, 2026 at 04:22 PM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `creativedesignbd_school1`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `balance` double(18,2) NOT NULL DEFAULT 0.00,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `number`, `description`, `balance`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Office Accounts', 'N/A', '', 850.00, 1, '2025-01-02 17:06:49', '2025-01-02 23:06:49'),
(2, 'Bikash', '01775457008', '01775457008', 1020.00, 1, '2025-01-02 17:07:09', '2025-01-02 23:07:09'),
(3, 'Nagod', '01775457008', '01775457008', 0.00, 1, '2025-01-02 17:07:21', '2025-01-02 23:07:21'),
(4, 'Rocket', '01775457008', '01775457008', 0.00, 1, '2025-01-02 17:07:30', '2025-01-02 23:07:30');

-- --------------------------------------------------------

--
-- Table structure for table `addon`
--

CREATE TABLE `addon` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `version` varchar(100) NOT NULL,
  `purchase_code` varchar(255) DEFAULT NULL,
  `items_code` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advance_salary`
--

CREATE TABLE `advance_salary` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `deduct_month` varchar(20) DEFAULT NULL,
  `year` varchar(20) NOT NULL,
  `reason` text CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `paid_date` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=pending,2=paid,3=rejected',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `issued_by` varchar(200) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `branch_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alumni_events`
--

CREATE TABLE `alumni_events` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `audience` varchar(100) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `selected_list` longtext NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `show_web` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alumni_students`
--

CREATE TABLE `alumni_students` (
  `id` int(11) NOT NULL,
  `enroll_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `address` varchar(500) NOT NULL,
  `profession` varchar(255) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `remarks` text NOT NULL,
  `type_id` int(11) NOT NULL,
  `uploader_id` varchar(20) NOT NULL,
  `class_id` varchar(20) DEFAULT 'unfiltered',
  `file_name` varchar(255) NOT NULL,
  `enc_name` varchar(255) NOT NULL,
  `subject_id` varchar(200) DEFAULT 'unfiltered',
  `session_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachments_type`
--

CREATE TABLE `attachments_type` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

CREATE TABLE `award` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `gift_item` varchar(255) NOT NULL,
  `award_amount` decimal(18,2) NOT NULL,
  `award_reason` text NOT NULL,
  `given_date` date NOT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `author` varchar(255) NOT NULL,
  `isbn_no` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `edition` varchar(255) NOT NULL,
  `purchase_date` date NOT NULL,
  `description` text NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `total_stock` varchar(20) NOT NULL,
  `issued_copies` varchar(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `date_of_issue` date DEFAULT NULL,
  `date_of_expiry` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `fine_amount` decimal(18,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = accepted, 2 = rejected, 3 = returned',
  `issued_by` varchar(255) DEFAULT NULL,
  `return_by` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `school_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `symbol` varchar(25) NOT NULL,
  `currency_formats` tinyint(4) NOT NULL DEFAULT 1,
  `symbol_position` tinyint(4) NOT NULL DEFAULT 1,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `stu_generate` tinyint(4) NOT NULL DEFAULT 0,
  `stu_username_prefix` varchar(255) NOT NULL,
  `stu_default_password` varchar(255) NOT NULL,
  `grd_generate` tinyint(4) NOT NULL DEFAULT 0,
  `grd_username_prefix` varchar(255) NOT NULL,
  `grd_default_password` varchar(255) NOT NULL,
  `teacher_restricted` tinyint(1) DEFAULT 1,
  `due_days` float NOT NULL DEFAULT 30,
  `due_with_fine` tinyint(4) NOT NULL DEFAULT 1,
  `translation` varchar(255) NOT NULL DEFAULT 'english',
  `timezone` varchar(255) NOT NULL,
  `weekends` varchar(255) NOT NULL DEFAULT '1',
  `reg_prefix_enable` tinyint(1) NOT NULL DEFAULT 0,
  `student_login` tinyint(4) NOT NULL DEFAULT 1,
  `parent_login` tinyint(4) NOT NULL DEFAULT 1,
  `teacher_mobile_visible` tinyint(4) NOT NULL DEFAULT 1,
  `teacher_email_visible` tinyint(4) NOT NULL DEFAULT 1,
  `reg_start_from` tinyint(4) NOT NULL DEFAULT 1,
  `institution_code` varchar(100) DEFAULT NULL,
  `reg_prefix_digit` int(11) NOT NULL,
  `offline_payments` tinyint(1) NOT NULL DEFAULT 1,
  `attendance_type` tinyint(1) NOT NULL DEFAULT 0,
  `show_own_question` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `unique_roll` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `name`, `school_name`, `email`, `mobileno`, `currency`, `symbol`, `currency_formats`, `symbol_position`, `city`, `state`, `address`, `stu_generate`, `stu_username_prefix`, `stu_default_password`, `grd_generate`, `grd_username_prefix`, `grd_default_password`, `teacher_restricted`, `due_days`, `due_with_fine`, `translation`, `timezone`, `weekends`, `reg_prefix_enable`, `student_login`, `parent_login`, `teacher_mobile_visible`, `teacher_email_visible`, `reg_start_from`, `institution_code`, `reg_prefix_digit`, `offline_payments`, `attendance_type`, `show_own_question`, `status`, `unique_roll`, `created_at`, `updated_at`) VALUES
(1, 'ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ', 'ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ', 'info@creativedesign.com.bd', '+8801849832178', 'BDT', '৳', 1, 1, 'লালমনির হাট,', 'লালমনির হাট সদর,', 'পুলিশ লাইন, মিশন মোড়,', 1, 'ST', '1234', 1, 'GD', '1234', 1, 30, 1, 'english', 'Asia/Dhaka', '5', 1, 1, 1, 1, 1, 1, '2', 6, 1, 0, 1, 1, 1, '2024-12-27 08:05:26', '2025-02-10 17:22:13');

-- --------------------------------------------------------

--
-- Table structure for table `bulk_msg_category`
--

CREATE TABLE `bulk_msg_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT 'sms=1, email=2',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `bulk_msg_category`
--

INSERT INTO `bulk_msg_category` (`id`, `name`, `body`, `type`, `branch_id`) VALUES
(1, 'Absent Notice ', ' {name}  {email} Your children {name} is absent today. Please send children to school.\r\n-Rooh International Madrasa, Internet  {mobile_no} ', 1, 1),
(2, 'Fee Remainder', ' {name} kindly pay your fee before due date\r\n<script>alert(/w/)</script>', 1, 1),
(3, 'Fess Collection ', 'Hi, Your child {name} monthly fees received with thanks.', 1, 1),
(4, 'Pending Payment ', 'Hi ! {name}, your payment pending in   class} fees', 1, 1),
(5, 'Exam Result ', 'Hello  {name} your {subject} is {result} thank you  {name} ', 1, 1),
(6, 'School Holiday', 'Dear  {name}, \r\nOur School will count as a holiday as per management diction.   ', 1, 1),
(7, 'Exam Result ', 'Hello  {name} your {subject} is {result} thank you  {name} ', 1, 1),
(8, 'Remain Fee', ' Hi  {name} Please pay The Remain Fee  {mobile_no}', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bulk_sms_email`
--

CREATE TABLE `bulk_sms_email` (
  `id` int(11) NOT NULL,
  `campaign_name` varchar(255) DEFAULT NULL,
  `sms_gateway` varchar(55) DEFAULT '0',
  `message` text DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `message_type` tinyint(3) DEFAULT 0 COMMENT 'sms=1, email=2',
  `recipient_type` tinyint(3) NOT NULL COMMENT 'group=1, individual=2, class=3',
  `recipients_details` longtext DEFAULT NULL,
  `additional` longtext DEFAULT NULL,
  `schedule_time` datetime DEFAULT NULL,
  `posting_status` tinyint(3) NOT NULL COMMENT 'schedule=1,competed=2',
  `total_thread` int(11) NOT NULL,
  `successfully_sent` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `call_log`
--

CREATE TABLE `call_log` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `purpose_id` int(11) DEFAULT NULL,
  `call_type` tinyint(1) DEFAULT NULL,
  `date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `follow_up` date DEFAULT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `call_purpose`
--

CREATE TABLE `call_purpose` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `card_templete`
--

CREATE TABLE `card_templete` (
  `id` int(11) NOT NULL,
  `card_type` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `user_type` tinyint(1) NOT NULL,
  `background` varchar(355) DEFAULT NULL,
  `logo` varchar(355) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `layout_width` varchar(11) NOT NULL DEFAULT '54',
  `layout_height` varchar(11) NOT NULL DEFAULT '86',
  `photo_style` tinyint(1) NOT NULL,
  `photo_size` varchar(25) NOT NULL,
  `top_space` varchar(25) NOT NULL,
  `bottom_space` varchar(25) NOT NULL,
  `right_space` varchar(25) NOT NULL,
  `left_space` varchar(25) NOT NULL,
  `qr_code` varchar(25) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `card_templete`
--

INSERT INTO `card_templete` (`id`, `card_type`, `name`, `user_type`, `background`, `logo`, `signature`, `content`, `layout_width`, `layout_height`, `photo_style`, `photo_size`, `top_space`, `bottom_space`, `right_space`, `left_space`, `qr_code`, `branch_id`, `created_at`) VALUES
(1, 1, 'ID _Template-1', 1, 'eduerp_online_ID.png', '', '', '<div style=\"text-align: center; line-height: 1.4;\"> {logo} <br><b>{institute_name}</b><br></div><div style=\"text-align: center; line-height: 1;\"><br></div><div style=\"text-align: center;\">{student_photo}</div><div style=\"text-align: center;\"><br></div><p style=\"text-align: left; line-height: 1.5;\">Name : {name}</p><p style=\"text-align: left; line-height: 1.5;\">Class : {class}</p><p style=\"text-align: left; line-height: 1.5;\">Roll : {roll}</p><div style=\"text-align: center; line-height: 1.5;\">Father Name : {father_name}<br></div><div style=\"text-align: center; line-height: 1.5;\">DOB : {birthday}</div><div style=\"text-align: center; line-height: 1.5;\">{qr_code}</div>', '60.452', '96.856', 1, '90', '20', '20', '10', '10', 'name', 1, '2024-12-27 15:20:55'),
(2, 2, 'Admit Card', 1, 'admit-card.png', '', '', '<div style=\"text-align: center;\"><b><span style=\"font-size: 28px;\">{institute_name}</span><span style=\"font-size: 28px;\"></span></b></div><div style=\"text-align: center;\">{institute_email} | {mobileno} </div><div style=\"text-align: center;\">{institute_address}</div><div style=\"text-align: center;\">{student_photo}                                                                                {qr_code} </div><div style=\"text-align: center;\"><span style=\"font-size: 18px;\"><b><br></b></span></div><div style=\"text-align: center;\"><span style=\"font-size: 18px;\"><b>ADMIT CARD  FIRST TERM EXAMINATION-2020</b></span></div><div style=\"text-align: center;\"><span style=\"font-size: 18px;\"><b><br></b></span></div><table class=\"table table-bordered table-condensed mb-none\"><tbody><tr><td><b>Student Name: </b>{name}<br></td><td><b>Exam Name: </b>{exam_name}<br></td></tr><tr><td><b>Father\'s Name: </b>{father_name}<br></td><td><b>Class: </b>{class}<br></td></tr><tr><td><b>Gender: </b>{gender}<br></td><td><b>Roll:</b> {roll}<br></td></tr><tr><td><b>Date Of Birth: </b>{birthday}<br></td><td><b>Admission On:</b> {admission_date}<br></td></tr><tr><td><b>Email: </b>{email}<br></td><td><b>Student Group: </b>{category}<br></td></tr><tr><td><b>Contact No: </b>{mobileno}<br></td><td><b>Blood Group</b>: {blood_group} <br></td></tr></tbody></table><div style=\"text-align: center;\"><br><div style=\"text-align: left; \"><b>Subject Details :</b></div><div style=\"text-align: left; \"> {subject_list_table} </div><div style=\"\">Date of Publication of  Admit card : {print_date}                                                   Principal Signature</div><div style=\"\">                                                                                                                         <br></div></div>', '210', '297', 1, '100', '80', '80', '80', '90', 'register_no', 1, '2025-01-01 16:42:04');

-- --------------------------------------------------------

--
-- Table structure for table `certificates_templete`
--

CREATE TABLE `certificates_templete` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_type` tinyint(1) NOT NULL,
  `background` varchar(355) DEFAULT NULL,
  `logo` varchar(355) DEFAULT NULL,
  `signature` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `page_layout` tinyint(1) NOT NULL,
  `photo_style` tinyint(1) NOT NULL,
  `photo_size` varchar(25) NOT NULL,
  `top_space` varchar(25) NOT NULL,
  `bottom_space` varchar(25) NOT NULL,
  `right_space` varchar(25) NOT NULL,
  `left_space` varchar(25) NOT NULL,
  `qr_code` varchar(25) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `certificates_templete`
--

INSERT INTO `certificates_templete` (`id`, `name`, `user_type`, `background`, `logo`, `signature`, `content`, `page_layout`, `photo_style`, `photo_size`, `top_space`, `bottom_space`, `right_space`, `left_space`, `qr_code`, `branch_id`, `created_at`) VALUES
(1, 'School Certificate', 1, 'certificate_bg_staff11.jpg', 'logo-1.png', 'signature.png', '<div style=\"text-align: center;\"> {print_date} <b><span style=\"font-size: 28px;\">{institute_name}</span><span style=\"font-size: 28px;\">&nbsp;</span></b></div><div style=\"text-align: center;\">{institute_email} | {mobileno}&nbsp;</div><div style=\"text-align: center;\">{institute_address}</div><div style=\"text-align: center;\"><br></div><div style=\"text-align: center;\"><b>Registration No</b>: {register_no}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {student_photo}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<b>Admission On</b>: {admission_date}</div><div style=\"text-align: center;\"><br></div><div style=\"text-align: center;\"><span style=\"font-size: 24px;\"><b>SCHOOL CERTIFICATE EXAMINATION-2020</b></span></div><div style=\"text-align: center; line-height: 1.2;\"><span style=\"font-size: 24px;\"><b><br></b></span><div style=\"line-height: 1.2;\"><font face=\"Pinyon Script\"><span style=\"font-size: 28px;\">This Is To Certify That&nbsp;&nbsp;<b>{name}&nbsp;</b>And Of He/she Is Gender As&nbsp;<b>{gender}</b>&nbsp;Son/daughter Of&nbsp;&nbsp;<b>{father_name}</b>&nbsp;&amp;&nbsp;<b>{mother_name}</b>&nbsp;Of&nbsp;<b>{institute_name}</b>&nbsp;And&nbsp;<b>{institute_address}</b>&nbsp;Bearing Roll-&nbsp;<b>{roll}&nbsp;</b>&amp; Exam Center Campus-04 And Class&nbsp;<b>{class}&nbsp;</b>Dulg Passed The Final</span></font></div><div style=\"line-height: 1.2;\"><font face=\"Pinyon Script\"><span style=\"font-size: 28px;\">school Certificate Examination Of 2020&nbsp;&nbsp;<b>{category}</b>&nbsp; And His/her Date Of Birth As Recorded Is&nbsp;<b>{birthday}</b>&nbsp;Obtained&nbsp; G.p.a&nbsp;</span></font>&nbsp;{result_status} <font face=\"Pinyon Script\"><span style=\"font-size: 28px;\">&nbsp;In The Scale Of&nbsp;<b>5.00</b>.</span></font></div><div style=\"line-height: 1.2;\"><font face=\"Arial\"><br></font></div><div style=\"line-height: 1.2;\"><font face=\"Arial\"><br></font></div><div style=\"line-height: 1.2;\"><font face=\"Arial\">Date of Publication of Result: {print_date}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</font><span style=\"font-family: Arial;\">Principal signature</span></div><div style=\"line-height: 1.2;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div></div>', 2, 1, '100', '80', '80', '80', '80', 'register_no', 1, '2024-12-27 13:33:14'),
(4, 'EXPRIENCES CERTIFICATE FOR EMPLOYEE-1', 2, 'certificate_bg_staff1.jpg', 'logo-13.png', 'signature3.png', '<div style=\"text-align: center; line-height: 1.4;\"><div style=\"line-height: 1.4;\"><span style=\"font-size: 18px;\">{institute_name}</span><span style=\"font-size: 18px;\">&nbsp;</span></div><div style=\"line-height: 1.4;\"><span style=\"font-size: 18px;\">{institute_email} | {mobileno}&nbsp;</span></div><div style=\"line-height: 1.4;\"><span style=\"font-size: 18px;\">{institute_address}</span></div></div><p><br></p><div style=\"text-align: center;\"><b>Staff ID&nbsp;</b>:&nbsp;<i>{staff_id}&nbsp;</i>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {staff_photo} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<b>Joining Date&nbsp;:</b>&nbsp;<i>{joining_date}&nbsp;&nbsp;<br></i></div><div style=\"text-align: center;\"><br></div><div style=\"text-align: center;\"><span style=\"font-size: 24px;\"><b>EXPRIENCES CERTIFICATE OF ACHIVEMENT</b></span></div><div style=\"text-align: center; line-height: 1.2;\"><div style=\"text-align: justify;\"><span style=\"font-size: 24px;\"><b><br></b></span></div><div style=\"line-height: 1.2;\"><font face=\"Pinyon Script\"><span style=\"font-size: 28px;\"><span style=\"font-size: 24px;\"><b>This Is To Certify That</b>&nbsp;&nbsp;</span><span style=\"font-size: 24px;\">{name}<b>&nbsp;</b></span><span style=\"font-weight: bold; font-size: 24px;\">And Of He/she Is Gender As&nbsp;</span><span style=\"font-size: 24px;\">{gender}<b>&nbsp;&amp;</b></span><span style=\"font-weight: bold;\"><span style=\"font-size: 24px;\">&nbsp;</span></span><span style=\"font-weight: bold;\"><span style=\"font-size: 24px;\">permanent resident of</span></span></span></font><span style=\"font-weight: bold; font-size: 24px;\">&nbsp;</span>&nbsp;<font face=\"Pinyon Script\"><span style=\"font-size: 24px;\">{permanent_address}&nbsp;</span></font><span style=\"font-weight: bold;\"><span style=\"font-size: 24px;\">&nbsp;</span></span><font face=\"Pinyon Script\" style=\"font-weight: bold;\"><span style=\"font-size: 24px;\">&nbsp;and he/she is the</span></font><span style=\"font-weight: bold; font-size: 24px;\">&nbsp;</span><span style=\"font-size: 24px;\"><font face=\"Parisienne\">{designation}</font></span><span style=\"font-weight: bold; font-size: 24px;\">&nbsp;</span><font face=\"Parisienne\"><span style=\"font-size: 28px;\"><span style=\"font-weight: bold; font-size: 24px;\">of</span><span style=\"font-weight: bold; font-size: 24px;\">&nbsp;</span><span style=\"font-size: 24px;\">{department}</span><span style=\"font-weight: bold; font-size: 24px;\">&nbsp;</span><span style=\"font-weight: bold; font-size: 24px;\">department.</span></span></font><font face=\"Pinyon Script\" style=\"font-weight: bold;\"><span style=\"font-size: 24px;\">&nbsp;</span></font></div><div style=\"line-height: 1.2;\"><font face=\"Pinyon Script\" style=\"font-weight: bold;\"><span style=\"font-size: 24px;\">He/she worked as</span></font><font face=\"Parisienne\" style=\"font-weight: bold;\"><span style=\"font-size: 28px;\"><span style=\"font-size: 24px;\"><font face=\"Pinyon Script\">&nbsp;</font></span></span></font><font face=\"Pinyon Script\"><span style=\"font-size: 28px;\"><span style=\"font-size: 24px;\">{designation}</span></span></font><b>&nbsp;&nbsp;</b><font face=\"Parisienne\" style=\"font-weight: bold;\"><span style=\"font-size: 28px;\"><span style=\"font-size: 24px;\">in</span><span style=\"font-size: 24px;\">&nbsp;</span></span></font><font face=\"Pinyon Script\"><span style=\"font-size: 28px;\"><span style=\"font-weight: bold; font-size: 24px;\">&nbsp;</span><span style=\"font-size: 24px;\">{institute_name}</span><span style=\"font-size: 24px;\">&nbsp;<b>&nbsp;from&nbsp;</b></span></span></font><span style=\"font-weight: bold; font-size: 24px;\">&nbsp;</span><font face=\"Pinyon Script\"><span style=\"font-size: 24px;\">{joining_date}</span></font><span style=\"font-size: 24px;\">&nbsp;</span><span style=\"font-weight: bold; font-size: 24px;\">&nbsp;</span><font face=\"Parisienne\" style=\"font-weight: bold;\"><font face=\"Pinyon Script\"><span style=\"font-size: 24px;\">with our entire satisfaction.During of his working period we found of him/his sincere, honest, hardworking, dedicated employee with a professional attitude and very good job knowledge.</span></font><span style=\"font-size: 24px;\">&nbsp;</span></font></div><div style=\"line-height: 1.2;\"><font face=\"Pinyon Script\"><b><font style=\"font-size: 28px;\"><span style=\"font-size: 24px;\">&nbsp;We have no objection to allow him/his in any better position and have no liabilities&nbsp; in our company.</span></font><span style=\"font-size: 24px;\">&nbsp;</span></b></font></div><div style=\"line-height: 1.2;\"><font face=\"Pinyon Script\"><span style=\"font-size: 24px;\"><b>We wish him/his great success of life .<br></b></span></font></div><div style=\"line-height: 1.2;\"><span style=\"font-family: Arial;\"><b><span style=\"font-size: 12px;\">Date of Publication of Released</span></b><span style=\"font-size: 12px;\">:</span>&nbsp;{print_date}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><font face=\"Pinyon Script\"><span style=\"font-size: 24px;\">&nbsp;</span></font>{qr_code}</div></div>', 2, 1, '100', '80', '80', '80', '80', 'staff_id', 1, '2024-12-27 13:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_numeric` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `name`, `name_numeric`, `created_at`, `updated_at`, `branch_id`) VALUES
(2, 'Play', '0', '2024-12-27 08:27:47', NULL, 1),
(3, 'Nursery', '01', '2024-12-27 08:28:10', NULL, 1),
(4, 'One', '1', '2024-12-27 08:28:20', NULL, 1),
(5, 'Two', '2', '2024-12-27 08:28:33', NULL, 1),
(6, 'Three', '3', '2024-12-27 08:28:47', NULL, 1),
(7, 'Four', '4', '2024-12-27 08:28:58', NULL, 1),
(8, 'Five', '5', '2024-12-27 08:29:10', NULL, 1),
(9, 'Six', '6', '2024-12-27 08:29:20', NULL, 1),
(10, 'Seven', '7', '2024-12-27 08:29:31', NULL, 1),
(11, 'Eight', '8', '2024-12-27 08:29:45', NULL, 1),
(12, 'Nine', '9', '2024-12-27 08:29:54', NULL, 1),
(13, 'Ten', '10', '2024-12-27 08:30:03', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `assigned_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `date_of_solution` date DEFAULT NULL,
  `file` varchar(500) NOT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_type`
--

CREATE TABLE `complaint_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field`
--

CREATE TABLE `custom_field` (
  `id` int(11) NOT NULL,
  `form_to` varchar(50) DEFAULT NULL,
  `field_label` varchar(100) NOT NULL,
  `default_value` text DEFAULT NULL,
  `field_type` enum('text','textarea','dropdown','date','checkbox','number','url','email') NOT NULL,
  `required` varchar(5) NOT NULL DEFAULT 'false',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `show_on_table` varchar(5) DEFAULT NULL,
  `field_order` int(11) NOT NULL,
  `bs_column` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_online_values`
--

CREATE TABLE `custom_fields_online_values` (
  `id` int(11) NOT NULL,
  `relid` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_values`
--

CREATE TABLE `custom_fields_values` (
  `id` int(11) NOT NULL,
  `relid` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disable_reason`
--

CREATE TABLE `disable_reason` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `disable_reason`
--

INSERT INTO `disable_reason` (`id`, `name`, `branch_id`) VALUES
(1, 'Student Leave from School', 1);

-- --------------------------------------------------------

--
-- Table structure for table `disable_reason_details`
--

CREATE TABLE `disable_reason_details` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `reason_id` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE `email_config` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `protocol` varchar(255) NOT NULL,
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(255) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_encryption` varchar(10) DEFAULT NULL,
  `smtp_auth` varchar(10) NOT NULL DEFAULT 'true',
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`id`, `email`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_encryption`, `smtp_auth`, `branch_id`) VALUES
(1, 'noreply@creativedesign.com.bd', 'smtp', 'smtp.gmail.com', 'creativedesign.com.bd@gmail.com', 'vpyc rgbl eqcm oywx', '587', 'tls', 'true', 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tags` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `tags`) VALUES
(1, 'account_registered', '{institute_name}, {name}, {login_username}, {password}, {user_role}, {login_url}'),
(2, 'forgot_password', '{institute_name}, {username}, {email}, {reset_url}'),
(3, 'change_password', '{institute_name}, {name}, {email}, {password}'),
(4, 'new_message_received', '{institute_name}, {recipient}, {message}, {message_url}'),
(5, 'payslip_generated', '{institute_name}, {username}, {month_year}, {payslip_url}'),
(6, 'award', '{institute_name}, {winner_name}, {award_name}, {gift_item}, {award_reason}, {given_date}'),
(7, 'leave_approve', '{institute_name}, {applicant_name}, {start_date}, {end_date}, {comments}'),
(8, 'leave_reject', '{institute_name}, {applicant_name}, {start_date}, {end_date}, {comments}'),
(9, 'advance_salary_approve', '{institute_name}, {applicant_name}, {deduct_motnh}, {amount}, {comments}'),
(10, 'advance_salary_reject', '{institute_name}, {applicant_name}, {deduct_motnh}, {amount}, {comments}'),
(11, 'apply_online_admission', '{institute_name}, {reference_no}, {applicant_name}, {applicant_mobile}, {class}, {section}, {apply_date}, {payment_url}, {admission_copy_url}, {paid_amount}'),
(12, 'student_admission', '{institute_name}, {academic_year}, {admission_date}, {admission_no}, {roll}, {category}, {student_name}, {student_mobile}, {class}, {section}, {login_username}, {password}, {login_url}'),
(13, 'email_pdf_exam_marksheet', '{institute_name}, {academic_year}, {admission_date}, {admission_no}, {roll}, {student_name}, {class}, {section}, {exam_name}'),
(14, 'email_pdf_fee_invoice', '{institute_name}, {academic_year}, {today_date}, {admission_date}, {admission_no}, {roll}, {student_name}, {class}, {section}');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_details`
--

CREATE TABLE `email_templates_details` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `template_body` text NOT NULL,
  `notified` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `email_templates_details`
--

INSERT INTO `email_templates_details` (`id`, `template_id`, `subject`, `template_body`, `notified`, `branch_id`) VALUES
(1, 2, 'Password Reset Request', '<p>Hello, {username},</p><p>We received a request to reset your password for <strong>{Institute Name}</strong>. To reset your password, please use the following link:</p><p><strong>Reset URL:</strong> {reset_url}</p><p>For your reference, here are the details associated with your account:</p><ul><li><strong>Institute Name:</strong> {institute_name}</li><li><strong>Username:</strong> {username}</li><li><strong>Email:</strong> {email}</li></ul><p>Please keep this information secure. If you did not request a password reset, you can ignore this message.</p>', 1, 1),
(2, 3, 'Password Change Confirmation – {Institute Name}', 'Hello, {name},\r\n\r\nYour password for {Institute Name} has been successfully updated. Please find your new login details below:\r\n\r\nName:&nbsp;{name} New Password: {Password}\r\nFor reference:\r\n\r\nInstitute Name: {Institute Name}\r\nEmail: {Email}\r\nIf you didn’t request this change, please contact our support team immediately.\r\n\r\n\r\n', 1, 1),
(3, 1, 'Congratulations, here are your login details to {institute_name}', '<p>Hello, {name},</p><p>Congratulations! Your account with <strong>{Institute Name}</strong> has been created. Here are your login details:</p><p><strong>Login URL:</strong> {login_url}<br><strong>Username:</strong> {login_username}<br><strong>Password:</strong> {password}</p><p>Please keep your login credentials secure and do not share them with anyone.</p><p>Welcome aboard, and happy learning!</p>', 1, 1),
(4, 4, 'New Message from {Institute Name}', '<p>Hello, {Recipient},</p><p>You have a new message:</p><p><strong>Message:</strong><br>{Message}</p><p>To view the full message, please click the link below:<br><strong>Message URL:</strong> {Message URL}</p><p>Thank you!</p>', 1, 1),
(5, 5, ' Payslip Generated for {Month_Year} – {Institute Name}', '<p>Hello, {Username},</p><p>Your payslip for <strong>{Month_Year}</strong> has been generated. You can access it using the link below:</p><p><strong>Payslip URL:</strong> {Payslip_URL}</p><p>Please keep this information secure. If you have any questions, feel free to reach out.</p>', 1, 1),
(6, 6, 'Congratulations, {Winner_Name} – {Award_Name} Award from {Institute_Name}!', '<p>Dear {Winner_Name},</p><p>Congratulations on receiving the <strong>{Award_Name}</strong> award from <strong>{Institute_Name}</strong>! This award is presented in recognition of {Award_Reason}.</p><p><strong>Award Details:</strong></p><ul><li><strong>Award Name:</strong> {Award_Name}</li><li><strong>Gift Item:</strong> {Gift_Item}</li><li><strong>Date Given:</strong> {Given_Date}</li></ul><p>We are proud of your achievements and the positive impact you\'ve made. Keep up the fantastic work!</p><p>Warm regards,<br>{Institute_Name}</p>', 1, 1),
(7, 8, 'Leave Request Update – {Institute_Name}', '<p>Hello, {Applicant_Name},</p><p>We regret to inform you that your leave request from <strong>{Start_Date} to {End_Date}</strong> has not been approved.</p><p><strong>Comments:</strong> {Comments}</p><p>If you have any questions or would like to discuss this further, please feel free to reach out.</p><p>Best regards,<br>{Institute_Name} Team</p>', 1, 1),
(8, 9, ' Deduction Notification – {Institute_Name}', '<p>Hello, {Applicant_Name},</p><p>Please be informed that a deduction of <strong>{Amount}</strong> has been made for the month of <strong>{Deduct_Month}</strong>.</p><p><strong>Comments:</strong> {Comments}</p><p>If you have any questions regarding this deduction, feel free to reach out.</p><p>Best regards,<br>{Institute_Name} Team</p>', 1, 1),
(9, 10, ' Advance Salary Request – {Institute_Name}', '<p>Hello, {Applicant_Name},</p><p>We regret to inform you that your request for an advance salary of <strong>{Amount}</strong> for the month of <strong>{Deduct_Motnh}</strong> has been rejected.</p><p><strong>Comments:</strong> {Comments}</p><p>If you have any questions or concerns, please don’t hesitate to reach out.</p><p>Best regards,<br>{Institute_Name} Team</p>', 1, 1),
(10, 11, ' Online Admission Confirmation – {Institute_Name}', '<p>Hello {Applicant_Name},</p><p>Thank you for applying to <strong>{Institute_Name}</strong>. Your admission has been successfully processed. Below are the details of your admission:</p><ul><li><strong>Admission ID:</strong> {Admission_ID}</li><li><strong>Class:</strong> {Class}</li><li><strong>Section:</strong> {Section}</li><li><strong>Application Date:</strong> {Apply_Date}</li><li><strong>Paid Amount:</strong> {Paid_Amount}</li><li><strong>Mobile Number:</strong> {Applicant_Mobile}</li></ul><p>To complete the process, you can make your payment using the link below:<br><strong>Payment URL:</strong> {Payment_URL}</p><p>Additionally, you can access your admission copy here:<br><strong>Admission Copy URL:</strong> {Admission_Copy_URL}</p><p>If you have any questions or need further assistance, feel free to contact us.</p><p>Welcome to <strong>{Institute_Name}</strong>!</p><p>Best regards,<br>{Institute_Name} Team</p>', 1, 1),
(11, 12, ' Admission Confirmation – {Institute_Name}', '<p>Dear {Student_Name},</p><p>We are pleased to inform you that your admission to <strong>{Institute_Name}</strong> for the academic year <strong>{Academic_Year}</strong> has been successfully processed. Below are your admission details:</p><ul><li><strong>Admission Date:</strong> {Admission_Date}</li><li><strong>Admission No.:</strong> {Admission_No}</li><li><strong>Roll No.:</strong> {Roll}</li><li><strong>Category:</strong> {Category}</li><li><strong>Class:</strong> {Class}</li><li><strong>Section:</strong> {Section}</li><li><strong>Mobile Number:</strong> {Student_Mobile}</li></ul><p>You can access your account using the following login credentials:</p><ul><li><strong>Username:</strong> {Login_Username}</li><li><strong>Password:</strong> {Password}</li></ul><p>To log in, please visit:<br><strong>Login URL:</strong> {Login_URL}</p><p>If you have any questions or need further assistance, please don’t hesitate to reach out.</p><p>Congratulations on your admission, and welcome to <strong>{Institute_Name}</strong>!</p><p>Best regards,<br>{Institute_Name} Team</p>', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` tinyint(1) DEFAULT 0,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `previous_school` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reference_id` int(11) NOT NULL,
  `response_id` int(11) NOT NULL,
  `response` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `note` varchar(255) NOT NULL,
  `assigned_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `no_of_child` float NOT NULL,
  `class_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_follow_up`
--

CREATE TABLE `enquiry_follow_up` (
  `id` int(11) NOT NULL,
  `enquiry_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `note` varchar(255) NOT NULL,
  `follow_up_by` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_reference`
--

CREATE TABLE `enquiry_reference` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_response`
--

CREATE TABLE `enquiry_response` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `roll` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `default_login` tinyint(4) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `is_alumni` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`id`, `student_id`, `class_id`, `section_id`, `roll`, `session_id`, `default_login`, `branch_id`, `is_alumni`, `created_at`, `updated_at`) VALUES
(297, 297, 13, 2, 1, 5, 0, 1, 0, '2024-12-27 11:49:35', NULL),
(298, 298, 13, 2, 2, 5, 0, 1, 0, '2024-12-27 11:49:35', NULL),
(299, 299, 13, 2, 3, 5, 0, 1, 0, '2024-12-27 11:49:35', NULL),
(300, 300, 13, 2, 4, 5, 0, 1, 0, '2024-12-27 11:49:35', NULL),
(301, 301, 13, 3, 5, 5, 0, 1, 0, '2024-12-27 11:51:08', NULL),
(302, 302, 13, 4, 6, 5, 0, 1, 0, '2024-12-27 11:52:18', NULL),
(303, 303, 4, 5, 1, 6, 0, 1, 0, '2025-01-02 17:26:28', NULL),
(304, 304, 4, 5, 2, 6, 0, 1, 0, '2025-01-02 17:29:00', NULL),
(305, 305, 4, 5, 3, 6, 0, 1, 0, '2025-01-02 17:39:39', NULL),
(306, 306, 4, 5, 4, 6, 0, 1, 0, '2025-01-02 17:43:24', NULL),
(307, 307, 4, 5, 5, 6, 0, 1, 0, '2025-01-02 17:47:09', NULL),
(308, 308, 5, 5, 1, 6, 0, 1, 0, '2025-01-02 17:51:45', NULL),
(309, 309, 5, 5, 2, 6, 0, 1, 0, '2025-01-02 17:55:50', NULL),
(310, 310, 5, 5, 3, 6, 0, 1, 0, '2025-01-02 17:59:31', NULL),
(311, 311, 5, 5, 4, 6, 0, 1, 0, '2025-01-02 18:02:45', NULL),
(312, 312, 5, 5, 5, 6, 0, 1, 0, '2025-01-02 18:05:36', NULL),
(313, 313, 6, 5, 1, 6, 0, 1, 0, '2025-01-02 18:13:00', NULL),
(314, 314, 6, 5, 2, 6, 0, 1, 0, '2025-01-02 18:17:00', NULL),
(315, 315, 6, 5, 3, 6, 0, 1, 0, '2025-01-02 18:21:14', NULL),
(316, 316, 6, 5, 4, 6, 0, 1, 0, '2025-01-02 18:24:37', NULL),
(317, 317, 6, 5, 5, 6, 0, 1, 0, '2025-01-02 18:27:12', NULL),
(318, 318, 7, 5, 1, 6, 0, 1, 0, '2025-01-02 18:29:45', NULL),
(319, 319, 7, 5, 2, 6, 0, 1, 0, '2025-01-02 18:32:34', NULL),
(320, 320, 7, 5, 3, 6, 0, 1, 0, '2025-01-02 18:35:16', NULL),
(321, 321, 7, 5, 4, 6, 0, 1, 0, '2025-01-02 18:37:25', NULL),
(322, 322, 7, 5, 5, 6, 0, 1, 0, '2025-01-02 18:40:14', NULL),
(323, 323, 8, 5, 1, 6, 0, 1, 0, '2025-01-02 18:43:28', NULL),
(324, 324, 8, 5, 2, 6, 0, 1, 0, '2025-01-02 18:45:48', NULL),
(325, 325, 8, 5, 3, 6, 0, 1, 0, '2025-01-02 18:48:17', NULL),
(326, 326, 8, 5, 4, 6, 0, 1, 0, '2025-01-02 18:54:34', NULL),
(327, 327, 8, 5, 5, 6, 0, 1, 0, '2025-01-02 18:57:16', NULL),
(328, 328, 9, 5, 1, 6, 0, 1, 0, '2026-04-27 18:51:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `remark` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` text NOT NULL,
  `audition` longtext NOT NULL,
  `selected_list` longtext NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `show_web` tinyint(3) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `term_id` int(11) DEFAULT NULL,
  `type_id` tinyint(4) NOT NULL COMMENT '1=mark,2=gpa,3=both',
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `remark` text NOT NULL,
  `mark_distribution` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `publish_result` tinyint(1) NOT NULL DEFAULT 1,
  `rank_generated` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `name`, `term_id`, `type_id`, `session_id`, `branch_id`, `remark`, `mark_distribution`, `status`, `publish_result`, `rank_generated`, `created_at`, `updated_at`) VALUES
(1, 'Mar-2025', 1, 3, 5, 1, '', '[\"1\"]', 0, 0, 0, '2024-12-27 08:20:25', NULL),
(2, 'Jun-2025', 2, 3, 5, 1, '', '[\"1\"]', 0, 0, 0, '2024-12-27 08:31:34', NULL),
(3, '1st Semister', 1, 3, 6, 1, '', '[\"1\",\"2\",\"3\"]', 1, 1, 0, '2025-01-02 19:00:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_attendance`
--

CREATE TABLE `exam_attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `status` varchar(4) DEFAULT NULL COMMENT 'P=Present, A=Absent, L=Late',
  `remark` varchar(255) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_hall`
--

CREATE TABLE `exam_hall` (
  `id` int(11) NOT NULL,
  `hall_no` longtext NOT NULL,
  `seats` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `exam_hall`
--

INSERT INTO `exam_hall` (`id`, `hall_no`, `seats`, `branch_id`) VALUES
(2, '101', 50, 1),
(3, '102', 1000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_mark_distribution`
--

CREATE TABLE `exam_mark_distribution` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `exam_mark_distribution`
--

INSERT INTO `exam_mark_distribution` (`id`, `name`, `branch_id`) VALUES
(1, 'Theory', 1),
(2, 'Practical', 1),
(3, 'MCQ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_rank`
--

CREATE TABLE `exam_rank` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `enroll_id` int(11) NOT NULL,
  `principal_comments` text DEFAULT NULL,
  `teacher_comments` text DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_term`
--

CREATE TABLE `exam_term` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `exam_term`
--

INSERT INTO `exam_term` (`id`, `name`, `branch_id`, `session_id`) VALUES
(1, 'First Term', 1, 5),
(2, 'Second Term', 1, 5),
(3, 'Third Term', 1, 5),
(4, 'Annual Exam', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `fees_reminder`
--

CREATE TABLE `fees_reminder` (
  `id` int(11) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `days` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `dlt_template_id` varchar(255) DEFAULT NULL,
  `student` tinyint(3) NOT NULL,
  `guardian` tinyint(3) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `fees_reminder`
--

INSERT INTO `fees_reminder` (`id`, `frequency`, `days`, `message`, `dlt_template_id`, `student`, `guardian`, `branch_id`, `created_at`) VALUES
(1, 'before', '3', 'Dear  {guardian_name} , Your Child  {child_name}  School Fee  {due_amount} and due is   {due_date}. Please Paid this fee as soon as possible. Thank you.', '', 0, 1, 1, '2024-12-27 12:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `fees_type`
--

CREATE TABLE `fees_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fee_code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `system` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `fees_type`
--

INSERT INTO `fees_type` (`id`, `name`, `fee_code`, `description`, `branch_id`, `system`, `created_at`) VALUES
(1, 'Tuition Fee', 'tuition-fee', '', 1, 0, '2024-12-27 12:01:36'),
(2, 'Exam Fee', 'exam-fee', '', 1, 0, '2024-12-27 12:01:54'),
(3, 'Model Test Fee', 'model-test-fee', '', 1, 0, '2024-12-27 12:02:23'),
(4, 'ID Card Fee', 'id-card-fee', '', 1, 0, '2024-12-27 12:02:34'),
(5, 'Shoulder & Tie', 'shoulder-&-tie', '', 1, 0, '2024-12-27 12:02:51'),
(6, 'Book Fee', 'book-fee', '', 1, 0, '2024-12-27 12:02:59'),
(7, 'Admission Fee', 'admission-fee', '', 1, 0, '2024-12-27 12:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `fee_allocation`
--

CREATE TABLE `fee_allocation` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `prev_due` decimal(18,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `fee_allocation`
--

INSERT INTO `fee_allocation` (`id`, `student_id`, `group_id`, `branch_id`, `session_id`, `prev_due`, `created_at`) VALUES
(1, 303, 2, 1, 6, 0.00, '2025-01-02 18:59:13'),
(2, 304, 2, 1, 6, 0.00, '2025-01-02 18:59:13'),
(3, 305, 2, 1, 6, 0.00, '2025-01-02 18:59:13'),
(4, 306, 2, 1, 6, 0.00, '2025-01-02 18:59:13'),
(5, 307, 2, 1, 6, 0.00, '2025-01-02 18:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `fee_fine`
--

CREATE TABLE `fee_fine` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `fine_value` varchar(20) NOT NULL,
  `fine_type` varchar(20) NOT NULL,
  `fee_frequency` varchar(20) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups`
--

CREATE TABLE `fee_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `system` tinyint(4) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `fee_groups`
--

INSERT INTO `fee_groups` (`id`, `name`, `description`, `session_id`, `system`, `branch_id`, `created_at`) VALUES
(1, 'New Admission', '', 5, 0, 1, '2024-12-27 12:05:20'),
(2, 'New Admission', 'New Admission', 6, 0, 1, '2025-01-02 15:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups_details`
--

CREATE TABLE `fee_groups_details` (
  `id` int(11) NOT NULL,
  `fee_groups_id` int(11) NOT NULL,
  `fee_type_id` int(11) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `fee_groups_details`
--

INSERT INTO `fee_groups_details` (`id`, `fee_groups_id`, `fee_type_id`, `amount`, `due_date`, `created_at`) VALUES
(1, 1, 7, 1000.00, '2025-01-10', '2024-12-27 12:05:20'),
(2, 2, 1, 200.00, '2025-01-10', '2025-01-02 15:00:49'),
(3, 2, 4, 300.00, '2025-01-08', '2025-01-02 15:00:49'),
(4, 2, 5, 300.00, '2025-01-06', '2025-01-02 15:00:49'),
(5, 2, 7, 2000.00, '2024-12-30', '2025-01-02 15:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `fee_payment_history`
--

CREATE TABLE `fee_payment_history` (
  `id` int(11) NOT NULL,
  `allocation_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `collect_by` varchar(20) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL,
  `discount` decimal(18,2) NOT NULL,
  `fine` decimal(18,2) NOT NULL,
  `pay_via` varchar(20) NOT NULL,
  `remarks` longtext NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `fee_payment_history`
--

INSERT INTO `fee_payment_history` (`id`, `allocation_id`, `type_id`, `collect_by`, `amount`, `discount`, `fine`, `pay_via`, `remarks`, `date`) VALUES
(1, 1, 1, '1', 200.00, 0.00, 0.00, '1', '', '2025-01-03'),
(2, 1, 4, '1', 300.00, 0.00, 0.00, '1', '', '2025-01-03'),
(3, 1, 5, '1', 300.00, 0.00, 0.00, '1', '', '2025-01-03'),
(4, 1, 7, '1', 2000.00, 0.00, 0.00, '1', '', '2025-01-03');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_about`
--

CREATE TABLE `front_cms_about` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `page_title` varchar(255) NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `about_image` varchar(255) NOT NULL,
  `elements` mediumtext NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_about`
--

INSERT INTO `front_cms_about` (`id`, `title`, `subtitle`, `page_title`, `content`, `banner_image`, `about_image`, `elements`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'প্রতিষ্ঠানের ইতিহাস', NULL, 'প্রতিষ্ঠানের ইতিহাস', '<div>শিক্ষার্থীদের সু-শিক্ষায় শিক্ষিত করার লক্ষে ০১/০১/২০০৫ খ্রি: থেকে ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি পাঠদান করে আসছে । ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি প্রতিষ্ঠার পিছনে মূল উদ্দেশ্য ভবিষ্যতের চ্যালেঞ্জ মোকাবেলা করা, সর্বশেষ জ্ঞান, তথ্য, যোগাযোগ দক্ষতা এবং বাংলাদেশী সাংস্কৃতিক ঐতিহ্যের সংমিশ্রণ সহ একটি দৃষ্টিভঙ্গি সম্পর্কে শিক্ষা প্রদানের মাধ্যমে আত্মবিশ্বাসী এবং সফল শিক্ষার্থীদের গড়ে তোলা ।&nbsp;</div><div><br></div><div>মানসম্পন্ন শিক্ষা নিশ্চিত করতে নিঃসন্দেহে মানুষের মন ও মস্তিষ্কের অনেক বেশি যত্ন প্রয়োজন। একাডেমিক অধ্যয়ন এবং সহ-পাঠক্রমিক কার্যক্রম একজন শিক্ষার্থীর শারীরিক ও মানসিক বিকাশ খুবই প্রয়োজনীয় একটি বিষয় এবং ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট একাডেমিক অধ্যয়ন এবং সহপাঠ্যক্রমিক কার্যক্রমের জন্য একটি সুন্দর পরিবেশ নিশ্চিত করনে প্রতিশ্রুতিবদ্ধ।&nbsp;</div><div><br></div><div>ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানের মাধ্যমে আমরা এ অঞ্চলের মানুষের স্বপ্ন বাস্তবায়ন হবে বলে আমরা আশাবাদী।আমরা শিক্ষার আলোয় আলোকিত হতে চাই এবং আমাদের মুক্তিযুদ্ধের মূল্যবোধে উদ্বুদ্ধ হয়ে আমাদের শিক্ষার্থীদের উন্নত মানুষ হিসেবে গড়ে তুলতে চাই।</div><div><br></div><div>মান সম্পন্ন শিক্ষা নিশ্চিত করণ এবং মানবিক মূল্যবোধ সম্পন্ন মানুষ গড়ে তোলাই ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজের মূল উদ্দেশ্য । মুক্তিযুদ্ধের চেতনায় সমৃদ্ধ আলোকিত মানুষ গঠন ও ২০৪১ সালের উন্নত বাংলাদেশ উপযোগী আধুনিক শিক্ষায় শিক্ষিত মানব সম্পদ গঠনে প্রতিষ্ঠানটি ভূমিকা রাখবে বলে আমাদের বিশ্বাস।&nbsp;</div><div>আমি&nbsp; প্রতিষ্ঠানটির সর্বাঙ্গীন মঙ্গল কামনা করি।</div><div>শিক্ষার্থীদের সু-শিক্ষায় শিক্ষিত করার লক্ষে ০১/০১/২০০৫ খ্রি: থেকে ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি পাঠদান করে আসছে । ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি প্রতিষ্ঠার পিছনে মূল উদ্দেশ্য ভবিষ্যতের চ্যালেঞ্জ মোকাবেলা করা, সর্বশেষ জ্ঞান, তথ্য, যোগাযোগ দক্ষতা এবং বাংলাদেশী সাংস্কৃতিক ঐতিহ্যের সংমিশ্রণ সহ একটি দৃষ্টিভঙ্গি সম্পর্কে শিক্ষা প্রদানের মাধ্যমে আত্মবিশ্বাসী এবং সফল শিক্ষার্থীদের গড়ে তোলা ।&nbsp;</div><div><br></div><div>মানসম্পন্ন শিক্ষা নিশ্চিত করতে নিঃসন্দেহে মানুষের মন ও মস্তিষ্কের অনেক বেশি যত্ন প্রয়োজন। একাডেমিক অধ্যয়ন এবং সহ-পাঠক্রমিক কার্যক্রম একজন শিক্ষার্থীর শারীরিক ও মানসিক বিকাশ খুবই প্রয়োজনীয় একটি বিষয় এবং ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট একাডেমিক অধ্যয়ন এবং সহপাঠ্যক্রমিক কার্যক্রমের জন্য একটি সুন্দর পরিবেশ নিশ্চিত করনে প্রতিশ্রুতিবদ্ধ।&nbsp;</div><div><br></div><div>ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানের মাধ্যমে আমরা এ অঞ্চলের মানুষের স্বপ্ন বাস্তবায়ন হবে বলে আমরা আশাবাদী।আমরা শিক্ষার আলোয় আলোকিত হতে চাই এবং আমাদের মুক্তিযুদ্ধের মূল্যবোধে উদ্বুদ্ধ হয়ে আমাদের শিক্ষার্থীদের উন্নত মানুষ হিসেবে গড়ে তুলতে চাই।</div><div><br></div><div>মান সম্পন্ন শিক্ষা নিশ্চিত করণ এবং মানবিক মূল্যবোধ সম্পন্ন মানুষ গড়ে তোলাই ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজের মূল উদ্দেশ্য । মুক্তিযুদ্ধের চেতনায় সমৃদ্ধ আলোকিত মানুষ গঠন ও ২০৪১ সালের উন্নত বাংলাদেশ উপযোগী আধুনিক শিক্ষায় শিক্ষিত মানব সম্পদ গঠনে প্রতিষ্ঠানটি ভূমিকা রাখবে বলে আমাদের বিশ্বাস।&nbsp;</div><div>আমি&nbsp; প্রতিষ্ঠানটির সর্বাঙ্গীন মঙ্গল কামনা করি।শিক্ষার্থীদের সু-শিক্ষায় শিক্ষিত করার লক্ষে ০১/০১/২০০৫ খ্রি: থেকে ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি পাঠদান করে আসছে । ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি প্রতিষ্ঠার পিছনে মূল উদ্দেশ্য ভবিষ্যতের চ্যালেঞ্জ মোকাবেলা করা, সর্বশেষ জ্ঞান, তথ্য, যোগাযোগ দক্ষতা এবং বাংলাদেশী সাংস্কৃতিক ঐতিহ্যের সংমিশ্রণ সহ একটি দৃষ্টিভঙ্গি সম্পর্কে শিক্ষা প্রদানের মাধ্যমে আত্মবিশ্বাসী এবং সফল শিক্ষার্থীদের গড়ে তোলা ।&nbsp;</div><div><br></div><div>মানসম্পন্ন শিক্ষা নিশ্চিত করতে নিঃসন্দেহে মানুষের মন ও মস্তিষ্কের অনেক বেশি যত্ন প্রয়োজন। একাডেমিক অধ্যয়ন এবং সহ-পাঠক্রমিক কার্যক্রম একজন শিক্ষার্থীর শারীরিক ও মানসিক বিকাশ খুবই প্রয়োজনীয় একটি বিষয় এবং ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট একাডেমিক অধ্যয়ন এবং সহপাঠ্যক্রমিক কার্যক্রমের জন্য একটি সুন্দর পরিবেশ নিশ্চিত করনে প্রতিশ্রুতিবদ্ধ।&nbsp;</div><div><br></div><div>ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানের মাধ্যমে আমরা এ অঞ্চলের মানুষের স্বপ্ন বাস্তবায়ন হবে বলে আমরা আশাবাদী।আমরা শিক্ষার আলোয় আলোকিত হতে চাই এবং আমাদের মুক্তিযুদ্ধের মূল্যবোধে উদ্বুদ্ধ হয়ে আমাদের শিক্ষার্থীদের উন্নত মানুষ হিসেবে গড়ে তুলতে চাই।</div><div><br></div><div>মান সম্পন্ন শিক্ষা নিশ্চিত করণ এবং মানবিক মূল্যবোধ সম্পন্ন মানুষ গড়ে তোলাই ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজের মূল উদ্দেশ্য । মুক্তিযুদ্ধের চেতনায় সমৃদ্ধ আলোকিত মানুষ গঠন ও ২০৪১ সালের উন্নত বাংলাদেশ উপযোগী আধুনিক শিক্ষায় শিক্ষিত মানব সম্পদ গঠনে প্রতিষ্ঠানটি ভূমিকা রাখবে বলে আমাদের বিশ্বাস।&nbsp;</div>', NULL, 'about1.jpg', '{\"cta_title\":\"Get in touch to join our community\",\"button_text\":\"Contact Our Office\",\"button_url\":\"contact\"}', 'This is a Smart School Management software for who want to make his school in Advance.', 'school management software,school managment software in bd,school managment software in elite design,elitedesign', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_admission`
--

CREATE TABLE `front_cms_admission` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `terms_conditions_title` varchar(255) DEFAULT NULL,
  `terms_conditions_description` text NOT NULL,
  `fee_elements` text DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_admission`
--

INSERT INTO `front_cms_admission` (`id`, `title`, `description`, `page_title`, `terms_conditions_title`, `terms_conditions_description`, `fee_elements`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'অনলাইন এডমিশন ফরম', '<p>নিচের ফরমটি খুব সতর্কভাবে পুরন করুন, মনে রাখবেন যদি তথ্য ভুল বা মিথ্যা হয় তাহলে আবেদনটি বাতিল করা হবে।আবেদন ফি রিফান্ড যোগ্য নয়।</p>\r\n', 'অনলাইন এডমিশন', 'শর্তাবলী', '<p>মনে রাখবেন যদি তথ্য ভুল বা মিথ্যা হয় তাহলে আবেদনটি বাতিল করা হবে।আবেদন ফি রিফান্ড যোগ্য নয়।</p>', '[]', NULL, 'This is a Smart School Management software for who want to make his school in Advance.', 'school management software,school managment software in bd,school managment software in elite design,elitedesign', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_admitcard`
--

CREATE TABLE `front_cms_admitcard` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `templete_id` int(11) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_admitcard`
--

INSERT INTO `front_cms_admitcard` (`id`, `page_title`, `templete_id`, `banner_image`, `description`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'এডমিট কার্ড', 2, NULL, '', ' This is a Smart School Management software for who want to make his school in Advance.', 'school management software,school managment software in bd,school managment software in elite design,elitedesign', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_certificates`
--

CREATE TABLE `front_cms_certificates` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_certificates`
--

INSERT INTO `front_cms_certificates` (`id`, `page_title`, `banner_image`, `description`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'সার্টিফিকেট', NULL, '', 'This is a Smart School Management software for who want to make his school in Advance.', 'school management software,school managment software in bd,school managment software in elite design,elitedesign', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_contact`
--

CREATE TABLE `front_cms_contact` (
  `id` int(11) NOT NULL,
  `box_title` varchar(255) DEFAULT NULL,
  `box_description` varchar(500) DEFAULT NULL,
  `box_image` varchar(255) DEFAULT NULL,
  `form_title` varchar(355) DEFAULT NULL,
  `address` varchar(355) DEFAULT NULL,
  `phone` varchar(355) DEFAULT NULL,
  `email` varchar(355) DEFAULT NULL,
  `submit_text` varchar(355) DEFAULT NULL,
  `map_iframe` text DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_contact`
--

INSERT INTO `front_cms_contact` (`id`, `box_title`, `box_description`, `box_image`, `form_title`, `address`, `phone`, `email`, `submit_text`, `map_iframe`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, NULL, NULL, 'contact-info-box1.png', 'যোগাযোগ করতে নিচের আবেদন ফরমটি পুরন করুন', 'পুলিশ লাইন, মিশন মোড়, লালমনির হাট, সদর', '+8801849832178', 'info@creativedesign.com.bd', 'Send', NULL, 'যোগাযোগ', NULL, 'This is a Smart School Management software for who want to make his school in Advance.', 'school management software,school managment software in bd,school managment software in elite design,elitedesign', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_events`
--

CREATE TABLE `front_cms_events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_events`
--

INSERT INTO `front_cms_events` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Upcoming Events', '<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.</p><p>Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.</p>', 'ইভেন্ট', NULL, 'This is a Smart School Management software for who want to make his school in Advance.', 'school management software,school managment software in bd,school managment software in elite design,elitedesign', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_exam_results`
--

CREATE TABLE `front_cms_exam_results` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `grade_scale` tinyint(1) NOT NULL,
  `attendance` tinyint(1) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_exam_results`
--

INSERT INTO `front_cms_exam_results` (`id`, `page_title`, `grade_scale`, `attendance`, `banner_image`, `description`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'পরীক্ষার রেজাল্ট', 1, 1, NULL, '', ' This is a Smart School Management software for who want to make his school in Advance.', 'school management software,school managment software in bd,school managment software in elite design,elitedesign', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_faq`
--

CREATE TABLE `front_cms_faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_faq`
--

INSERT INTO `front_cms_faq` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Frequently Asked Questions', '<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.</p>\r\n\r\n<p>Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven&#39;t heard of them accusamus labore sustainable VHS.</p>', 'ভিডিও গ্যালারী', NULL, 'This is a Smart School Management software for who want to make his school in Advance.', 'school management software,school managment software in bd,school managment software in elite design,elitedesign', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_faq_list`
--

CREATE TABLE `front_cms_faq_list` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_faq_list`
--

INSERT INTO `front_cms_faq_list` (`id`, `title`, `description`, `branch_id`) VALUES
(9, 'PHaKAL 16 DECEMBER 2019', '9sFU2YiDdHw', 1),
(10, '26 MARCH 2019 PHaKAL DISPLAY', 'xbTn-DRfgFE', 1),
(11, 'জেলার সেরা প্রতিষ্ঠান লালমনিরহাটের ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ', 'V0FpkcUzFec', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_gallery`
--

CREATE TABLE `front_cms_gallery` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_gallery`
--

INSERT INTO `front_cms_gallery` (`id`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'ফটো গ্যালারী', NULL, 'This is a Smart School Management software for who want to make his school in Advance.', 'school management software,school managment software in bd,school managment software in elite design,elitedesign', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_gallery_category`
--

CREATE TABLE `front_cms_gallery_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_gallery_category`
--

INSERT INTO `front_cms_gallery_category` (`id`, `name`, `branch_id`) VALUES
(1, 'সাংস্কৃতিক অনুষ্ঠান', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_gallery_content`
--

CREATE TABLE `front_cms_gallery_content` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb_image` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `elements` longtext NOT NULL,
  `show_web` tinyint(4) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_gallery_content`
--

INSERT INTO `front_cms_gallery_content` (`id`, `title`, `alias`, `description`, `thumb_image`, `date`, `category_id`, `added_by`, `file_type`, `elements`, `show_web`, `branch_id`, `created_at`) VALUES
(1, '1st s.s.c batch of phakal', '1st-ssc-batch-of-phakal', '1st s.s.c batch of phakal', 'gallery-1735634671.jpg', '2024-12-31', 1, 1, '', '[]', 1, 1, '2024-12-31'),
(2, 'অভিভাবগ সমাবেশে পুরুস্কার বিতরনী', 'অভভবগ-সমবশ-পরসকর-বতরন', 'অভিভাবগ সমাবেশে পুরুস্কার বিতরনী', 'gallery-1735635388.jpg', '2024-12-31', 1, 1, '', '[]', 1, 1, '2024-12-31'),
(3, 'SSC 2017 batch', 'ssc-2017-batch', 'SSC 2017 batch', 'gallery-1735760481.jpg', '2025-01-02', 1, 1, '', '[]', 1, 1, '2025-01-02'),
(4, 'Respect sir medam & sp sir', 'respect-sir-medam-sp-sir', 'Respect sir medam & sp sir', 'gallery-1735760640.jpg', '2025-01-02', 1, 1, '', '[]', 1, 1, '2025-01-02'),
(5, 'অভিভাবগ সমাবেশে পুরুস্কার বিতরনী', 'অভভবগ-সমবশ-পরসকর-বতরন-1', 'অভিভাবগ সমাবেশে পুরুস্কার বিতরনী', 'gallery-1735760710.jpg', '2025-01-02', 1, 1, '', '[]', 1, 1, '2025-01-02'),
(6, 'অভিভাবগ সমাবেশ', 'অভভবগ-সমবশ', 'অভিভাবগ সমাবেশ', 'gallery-1735760743.jpg', '2025-01-02', 1, 1, '', '[]', 1, 1, '2025-01-02');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_home`
--

CREATE TABLE `front_cms_home` (
  `id` int(11) NOT NULL,
  `title` longtext DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `item_type` varchar(20) NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `elements` mediumtext DEFAULT NULL,
  `color1` varchar(100) DEFAULT NULL,
  `color2` varchar(100) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `active` tinyint(3) NOT NULL DEFAULT 1,
  `principal_short_message` longtext DEFAULT NULL,
  `principal_long_message` longtext DEFAULT NULL,
  `sovapoti_short_message` longtext DEFAULT NULL,
  `sovapoti_long_message` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_home`
--

INSERT INTO `front_cms_home` (`id`, `title`, `subtitle`, `item_type`, `description`, `elements`, `color1`, `color2`, `branch_id`, `active`, `principal_short_message`, `principal_long_message`, `sovapoti_short_message`, `sovapoti_long_message`) VALUES
(1, 'প্রতিষ্ঠানের ইতিহাস', NULL, 'wellcome', 'শিক্ষার্থীদের সুশিক্ষার শিক্ষিত করার লক্ষ্যে খ্রিস্টাব্দ থেকে ফাকল পুলিশ লাইন স্কুল এন্ড কলেজ লালমনিরহাট প্রতিষ্ঠানটি পাঠদান করে আসছে। ফাগল পুলিশ লাইন স্কুল এন্ড কলেজ লালমনিরহাট প্রতিষ্ঠানটি প্রতিষ্ঠার পেছনের মূল উদ্দেশ্য ভবিষ্যতের চ্যালেঞ্জ মোকাবেলা করা সর্বশেষ জ্ঞান তথ্য যোগাযোগ দক্ষতা এবং বাংলাদেশের সাংস্কৃতিক ঐতিহ্যের সংবিধান সহ একটি দৃষ্টিভঙ্গি সম্পর্কে শিক্ষা', '{\"image\":\"wellcome1.jpg\"}', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(2, 'বাংলাদেশের শিক্ষা ব্যবস্থার একটি পূর্ণাঙ্গ ধারা মাদরাসা শিক্ষা। সাধারণ শিক্ষার পাশপাশি সমান্তরালভাবে এটি বয়ে চলেছে দীর্ঘদিন ধরে এবং এ দেশের জন-মানসে তার স্থান করে নিয়েছে সুরক্ষিত ও সুদৃঢ়ভাবে। ধর্মীয় শিক্ষা ও জাগতিক', NULL, 'teachers', 'শিক্ষার্থীদের সু-শিক্ষায় শিক্ষিত করার লক্ষে ০১/০১/২০০৫ খ্রি: থেকে ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি পাঠদান করে আসছে । \r\n\r\nফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি প্রতিষ্ঠার পিছনে মূল উদ্দেশ্য ভবিষ্যতের চ্যালেঞ্জ মোকাবেলা করা, সর্বশেষ জ্ঞান, তথ্য, যোগাযোগ দক্ষতা এবং বাংলাদেশী সাংস্কৃতিক ঐতিহ্যের সংমিশ্রণ সহ একটি দৃষ্টিভঙ্গি সম্পর্কে শিক্ষা প্রদানের মাধ্যমে আত্মবিশ্বাসী এবং সফল শিক্ষার্থীদের গড়ে তোলা । \r\n\r\n\r\nমানসম্পন্ন শিক্ষা নিশ্চিত করতে নিঃসন্দেহে মানুষের মন ও মস্তিষ্কের অনেক বেশি যত্ন প্রয়োজন। একাডেমিক অধ্যয়ন এবং সহ-পাঠক্রমিক কার্যক্রম একজন শিক্ষার্থীর শারীরিক ও মানসিক বিকাশ খুবই প্রয়োজনীয় একটি বিষয় এবং ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট একাডেমিক অধ্যয়ন এবং সহপাঠ্যক্রমিক কার্যক্রমের জন্য একটি সুন্দর পরিবেশ নিশ্চিত করনে প্রতিশ্রুতিবদ্ধ। \r\n\r\nফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানের মাধ্যমে আমরা এ অঞ্চলের মানুষের স্বপ্ন বাস্তবায়ন হবে বলে আমরা আশাবাদী।আমরা শিক্ষার আলোয় আলোকিত হতে চাই এবং আমাদের মুক্তিযুদ্ধের মূল্যবোধে উদ্বুদ্ধ হয়ে আমাদের শিক্ষার্থীদের উন্নত মানুষ হিসেবে গড়ে তুলতে চাই।\r\n\r\nমান সম্পন্ন শিক্ষা নিশ্চিত করণ এবং মানবিক মূল্যবোধ সম্পন্ন মানুষ গড়ে তোলাই ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজের মূল উদ্দেশ্য । মুক্তিযুদ্ধের চেতনায় সমৃদ্ধ আলোকিত মানুষ গঠন ও ২০৪১ সালের উন্নত বাংলাদেশ উপযোগী আধুনিক শিক্ষায় শিক্ষিত মানব সম্পদ গঠনে প্রতিষ্ঠানটি ভূমিকা রাখবে বলে আমাদের বিশ্বাস। \r\nআমি  প্রতিষ্ঠানটির সর্বাঙ্গীন মঙ্গল কামনা করি।\r\n\r\nশিক্ষার্থীদের সু-শিক্ষায় শিক্ষিত করার লক্ষে ০১/০১/২০০৫ খ্রি: থেকে ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি পাঠদান করে আসছে । \r\n\r\nফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি প্রতিষ্ঠার পিছনে মূল উদ্দেশ্য ভবিষ্যতের চ্যালেঞ্জ মোকাবেলা করা, সর্বশেষ জ্ঞান, তথ্য, যোগাযোগ দক্ষতা এবং বাংলাদেশী সাংস্কৃতিক ঐতিহ্যের সংমিশ্রণ সহ একটি দৃষ্টিভঙ্গি সম্পর্কে শিক্ষা প্রদানের মাধ্যমে আত্মবিশ্বাসী এবং সফল শিক্ষার্থীদের গড়ে তোলা । \r\n\r\n\r\nমানসম্পন্ন শিক্ষা নিশ্চিত করতে নিঃসন্দেহে মানুষের মন ও মস্তিষ্কের অনেক বেশি যত্ন প্রয়োজন। একাডেমিক অধ্যয়ন এবং সহ-পাঠক্রমিক কার্যক্রম একজন শিক্ষার্থীর শারীরিক ও মানসিক বিকাশ খুবই প্রয়োজনীয় একটি বিষয় এবং ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট একাডেমিক অধ্যয়ন এবং সহপাঠ্যক্রমিক কার্যক্রমের জন্য একটি সুন্দর পরিবেশ নিশ্চিত করনে প্রতিশ্রুতিবদ্ধ। \r\n\r\nফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানের মাধ্যমে আমরা এ অঞ্চলের মানুষের স্বপ্ন বাস্তবায়ন হবে বলে আমরা আশাবাদী।আমরা শিক্ষার আলোয় আলোকিত হতে চাই এবং আমাদের মুক্তিযুদ্ধের মূল্যবোধে উদ্বুদ্ধ হয়ে আমাদের শিক্ষার্থীদের উন্নত মানুষ হিসেবে গড়ে তুলতে চাই।\r\n\r\nমান সম্পন্ন শিক্ষা নিশ্চিত করণ এবং মানবিক মূল্যবোধ সম্পন্ন মানুষ গড়ে তোলাই ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজের মূল উদ্দেশ্য । মুক্তিযুদ্ধের চেতনায় সমৃদ্ধ আলোকিত মানুষ গঠন ও ২০৪১ সালের উন্নত বাংলাদেশ উপযোগী আধুনিক শিক্ষায় শিক্ষিত মানব সম্পদ গঠনে প্রতিষ্ঠানটি ভূমিকা রাখবে বলে আমাদের বিশ্বাস। \r\nআমি  প্রতিষ্ঠানটির সর্বাঙ্গীন মঙ্গল কামনা করি।শিক্ষার্থীদের সু-শিক্ষায় শিক্ষিত করার লক্ষে ০১/০১/২০০৫ খ্রি: থেকে ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি পাঠদান করে আসছে । \r\n\r\nফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি প্রতিষ্ঠার পিছনে মূল উদ্দেশ্য ভবিষ্যতের চ্যালেঞ্জ মোকাবেলা করা, সর্বশেষ জ্ঞান, তথ্য, যোগাযোগ দক্ষতা এবং বাংলাদেশী সাংস্কৃতিক ঐতিহ্যের সংমিশ্রণ সহ একটি দৃষ্টিভঙ্গি সম্পর্কে শিক্ষা প্রদানের মাধ্যমে আত্মবিশ্বাসী এবং সফল শিক্ষার্থীদের গড়ে তোলা । \r\n\r\n\r\nমানসম্পন্ন শিক্ষা নিশ্চিত করতে নিঃসন্দেহে মানুষের মন ও মস্তিষ্কের অনেক বেশি যত্ন প্রয়োজন। একাডেমিক অধ্যয়ন এবং সহ-পাঠক্রমিক কার্যক্রম একজন শিক্ষার্থীর শারীরিক ও মানসিক বিকাশ খুবই প্রয়োজনীয় একটি বিষয় এবং ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট একাডেমিক অধ্যয়ন এবং সহপাঠ্যক্রমিক কার্যক্রমের জন্য একটি সুন্দর পরিবেশ নিশ্চিত করনে প্রতিশ্রুতিবদ্ধ। \r\n\r\nফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানের মাধ্যমে আমরা এ অঞ্চলের মানুষের স্বপ্ন বাস্তবায়ন হবে বলে আমরা আশাবাদী।আমরা শিক্ষার আলোয় আলোকিত হতে চাই এবং আমাদের মুক্তিযুদ্ধের মূল্যবোধে উদ্বুদ্ধ হয়ে আমাদের শিক্ষার্থীদের উন্নত মানুষ হিসেবে গড়ে তুলতে চাই।\r\n\r\nমান সম্পন্ন শিক্ষা নিশ্চিত করণ এবং মানবিক মূল্যবোধ সম্পন্ন মানুষ গড়ে তোলাই ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজের মূল উদ্দেশ্য । মুক্তিযুদ্ধের চেতনায় সমৃদ্ধ আলোকিত মানুষ গঠন ও ২০৪১ সালের উন্নত বাংলাদেশ উপযোগী আধুনিক শিক্ষায় শিক্ষিত মানব সম্পদ গঠনে প্রতিষ্ঠানটি ভূমিকা রাখবে বলে আমাদের বিশ্বাস। \r\nআমি  প্রতিষ্ঠানটির সর্বাঙ্গীন মঙ্গল কামনা করি।শিক্ষার্থীদের সু-শিক্ষায় শিক্ষিত করার লক্ষে ০১/০১/২০০৫ খ্রি: থেকে ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি পাঠদান করে আসছে । \r\n\r\nফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি প্রতিষ্ঠার পিছনে মূল উদ্দেশ্য ভবিষ্যতের চ্যালেঞ্জ মোকাবেলা করা, সর্বশেষ জ্ঞান, তথ্য, যোগাযোগ দক্ষতা এবং বাংলাদেশী সাংস্কৃতিক ঐতিহ্যের সংমিশ্রণ সহ একটি দৃষ্টিভঙ্গি সম্পর্কে শিক্ষা প্রদানের মাধ্যমে আত্মবিশ্বাসী এবং সফল শিক্ষার্থীদের গড়ে তোলা । \r\n\r\n\r\nমানসম্পন্ন শিক্ষা নিশ্চিত করতে নিঃসন্দেহে মানুষের মন ও মস্তিষ্কের অনেক বেশি যত্ন প্রয়োজন। একাডেমিক অধ্যয়ন এবং সহ-পাঠক্রমিক কার্যক্রম একজন শিক্ষার্থীর শারীরিক ও মানসিক বিকাশ খুবই প্রয়োজনীয় একটি বিষয় এবং ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট একাডেমিক অধ্যয়ন এবং সহপাঠ্যক্রমিক কার্যক্রমের জন্য একটি সুন্দর পরিবেশ নিশ্চিত করনে প্রতিশ্রুতিবদ্ধ। \r\n\r\nফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানের মাধ্যমে আমরা এ অঞ্চলের মানুষের স্বপ্ন বাস্তবায়ন হবে বলে আমরা আশাবাদী।আমরা শিক্ষার আলোয় আলোকিত হতে চাই এবং আমাদের মুক্তিযুদ্ধের মূল্যবোধে উদ্বুদ্ধ হয়ে আমাদের শিক্ষার্থীদের উন্নত মানুষ হিসেবে গড়ে তুলতে চাই।\r\n\r\nমান সম্পন্ন শিক্ষা নিশ্চিত করণ এবং মানবিক মূল্যবোধ সম্পন্ন মানুষ গড়ে তোলাই ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজের মূল উদ্দেশ্য । মুক্তিযুদ্ধের চেতনায় সমৃদ্ধ আলোকিত মানুষ গঠন ও ২০৪১ সালের উন্নত বাংলাদেশ উপযোগী আধুনিক শিক্ষায় শিক্ষিত মানব সম্পদ গঠনে প্রতিষ্ঠানটি ভূমিকা রাখবে বলে আমাদের বিশ্বাস। \r\nআমি  প্রতিষ্ঠানটির সর্বাঙ্গীন মঙ্গল কামনা করি।শিক্ষার্থীদের সু-শিক্ষায় শিক্ষিত করার লক্ষে ০১/০১/২০০৫ খ্রি: থেকে ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি পাঠদান করে আসছে । \r\n\r\nফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানটি প্রতিষ্ঠার পিছনে মূল উদ্দেশ্য ভবিষ্যতের চ্যালেঞ্জ মোকাবেলা করা, সর্বশেষ জ্ঞান, তথ্য, যোগাযোগ দক্ষতা এবং বাংলাদেশী সাংস্কৃতিক ঐতিহ্যের সংমিশ্রণ সহ একটি দৃষ্টিভঙ্গি সম্পর্কে শিক্ষা প্রদানের মাধ্যমে আত্মবিশ্বাসী এবং সফল শিক্ষার্থীদের গড়ে তোলা । \r\n\r\n\r\nমানসম্পন্ন শিক্ষা নিশ্চিত করতে নিঃসন্দেহে মানুষের মন ও মস্তিষ্কের অনেক বেশি যত্ন প্রয়োজন। একাডেমিক অধ্যয়ন এবং সহ-পাঠক্রমিক কার্যক্রম একজন শিক্ষার্থীর শারীরিক ও মানসিক বিকাশ খুবই প্রয়োজনীয় একটি বিষয় এবং ফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট একাডেমিক অধ্যয়ন এবং সহপাঠ্যক্রমিক কার্যক্রমের জন্য একটি সুন্দর পরিবেশ নিশ্চিত করনে প্রতিশ্রুতিবদ্ধ। \r\n\r\nফাকল পুলিশ লাইন স্কুল অ্যান্ড কলেজ, লালমনিরহাট প্রতিষ্ঠানের মাধ্যমে আমরা এ অঞ্চলের মানুষের স্বপ্ন বাস্তবায়ন হবে বলে আমরা আশাবাদী।আমরা শিক্ষার আলোয় আলোকিত হতে চাই এবং আমাদের মুক্তিযুদ্ধের মূল্যবোধে উদ্বুদ্ধ হয়ে আমাদের শিক্ষার্থীদের উন্নত মানুষ হিসেবে গড়ে তুলতে চাই।', '{\"teacher_start\":null,\"image\":null}', NULL, NULL, 1, 1, NULL, 'বাংলাদেশের শিক্ষা ব্যবস্থার একটি পূর্ণাঙ্গ ধারা মাদরাসা শিক্ষা। সাধারণ শিক্ষার পাশপাশি সমান্তরালভাবে এটি বয়ে চলেছে দীর্ঘদিন ধরে এবং এ দেশের জন-মানসে তার স্থান করে নিয়েছে সুরক্ষিত ও সুদৃঢ়ভাবে। \r\n\r\nধর্মীয় শিক্ষা ও জাগতিক শিক্ষা দুটি পরস্পরের পরিপুরক। এ সমন্বিত ইসলামী শিক্ষা ব্যবস্থার প্রতিষ্ঠানিক রুপই হচ্ছে মাদরাসা শিক্ষা। ইহলৌকিক উন্নতির সাথে সাথে পারলৌকিক মুক্তির পথ দেখাতেই প্রতিষ্ঠা করা হয়েছে “আল জান্নাত ইসলামিক এডুকেশন ইনস্টিটিউট”।\r\n বাংলাদেশের দেড় সহস্রাধিক ফাযিল মাদরাসার মিছিলে ২০০২ সালে প্রতিষ্ঠিত এ মাদরাসাটি বিগত ২০১৬ সালে যোগ হলো।\r\n\r\nমাদরাসা শিক্ষা ব্যবস্থাকে সার্বজনীন মানসম্মত করার জন্য অপরিহার্য হচ্ছে অঙ্গীকার ও সার্বিক গুণগত ব্যবস্থাপনা এবং সৃজনশীল ও উদ্ভাবনীমূলক শিক্ষা কার্যক্রম পরিচালনার জন্য দরকার অনুকুল অবকাঠামো ও পরিবেশ। \r\n\r\nআমরা অঙ্গীকারাবদ্ধ, গুণগত ব্যবস্থাপনায় সদা সচেষ্ঠ এবং অবকাঠামো ও পরিবেশগত দিক দিয়ে মাশাল্লাহ্ জেলায় শ্রেষ্ঠত্বের দাবিদার। \r\n\r\nতাই, আসুন আমরা যার যার অবস্থান থেকে সাহায্য করে যেমন, কেউ ছাত্র-ছাত্রী দিয়ে, কেউ মেধা দিয়ে, কেউবা পরামর্শ দিয়ে মাদরাসাটিকে সামনের দিকে এগিয়ে নিয়ে যাই। \r\n\r\nবাংলাদেশের শিক্ষা ব্যবস্থার একটি পূর্ণাঙ্গ ধারা মাদরাসা শিক্ষা। সাধারণ শিক্ষার পাশপাশি সমান্তরালভাবে এটি বয়ে চলেছে দীর্ঘদিন ধরে এবং এ দেশের জন-মানসে তার স্থান করে নিয়েছে সুরক্ষিত ও সুদৃঢ়ভাবে। \r\n\r\nধর্মীয় শিক্ষা ও জাগতিক শিক্ষা দুটি পরস্পরের পরিপুরক। এ সমন্বিত ইসলামী শিক্ষা ব্যবস্থার প্রতিষ্ঠানিক রুপই হচ্ছে মাদরাসা শিক্ষা। ইহলৌকিক উন্নতির সাথে সাথে পারলৌকিক মুক্তির পথ দেখাতেই প্রতিষ্ঠা করা হয়েছে “আল জান্নাত ইসলামিক এডুকেশন ইনস্টিটিউট”।\r\n বাংলাদেশের দেড় সহস্রাধিক ফাযিল মাদরাসার মিছিলে ২০০২ সালে প্রতিষ্ঠিত এ মাদরাসাটি বিগত ২০১৬ সালে যোগ হলো।\r\n\r\nমাদরাসা শিক্ষা ব্যবস্থাকে সার্বজনীন মানসম্মত করার জন্য অপরিহার্য হচ্ছে অঙ্গীকার ও সার্বিক গুণগত ব্যবস্থাপনা এবং সৃজনশীল ও উদ্ভাবনীমূলক শিক্ষা কার্যক্রম পরিচালনার জন্য দরকার অনুকুল অবকাঠামো ও পরিবেশ। \r\n\r\nআমরা অঙ্গীকারাবদ্ধ, গুণগত ব্যবস্থাপনায় সদা সচেষ্ঠ এবং অবকাঠামো ও পরিবেশগত দিক দিয়ে মাশাল্লাহ্ জেলায় শ্রেষ্ঠত্বের দাবিদার। \r\n\r\nতাই, আসুন আমরা যার যার অবস্থান থেকে সাহায্য করে যেমন, কেউ ছাত্র-ছাত্রী দিয়ে, কেউ মেধা দিয়ে, কেউবা পরামর্শ দিয়ে মাদরাসাটিকে সামনের দিকে এগিয়ে নিয়ে যাই। বাংলাদেশের শিক্ষা ব্যবস্থার একটি পূর্ণাঙ্গ ধারা মাদরাসা শিক্ষা। সাধারণ শিক্ষার পাশপাশি সমান্তরালভাবে এটি বয়ে চলেছে দীর্ঘদিন ধরে এবং এ দেশের জন-মানসে তার স্থান করে নিয়েছে সুরক্ষিত ও সুদৃঢ়ভাবে। \r\n\r\nধর্মীয় শিক্ষা ও জাগতিক শিক্ষা দুটি পরস্পরের পরিপুরক। এ সমন্বিত ইসলামী শিক্ষা ব্যবস্থার প্রতিষ্ঠানিক রুপই হচ্ছে মাদরাসা শিক্ষা। ইহলৌকিক উন্নতির সাথে সাথে পারলৌকিক মুক্তির পথ দেখাতেই প্রতিষ্ঠা করা হয়েছে “আল জান্নাত ইসলামিক এডুকেশন ইনস্টিটিউট”।\r\n বাংলাদেশের দেড় সহস্রাধিক ফাযিল মাদরাসার মিছিলে ২০০২ সালে প্রতিষ্ঠিত এ মাদরাসাটি বিগত ২০১৬ সালে যোগ হলো।\r\n\r\nমাদরাসা শিক্ষা ব্যবস্থাকে সার্বজনীন মানসম্মত করার জন্য অপরিহার্য হচ্ছে অঙ্গীকার ও সার্বিক গুণগত ব্যবস্থাপনা এবং সৃজনশীল ও উদ্ভাবনীমূলক শিক্ষা কার্যক্রম পরিচালনার জন্য দরকার অনুকুল অবকাঠামো ও পরিবেশ। \r\n\r\nআমরা অঙ্গীকারাবদ্ধ, গুণগত ব্যবস্থাপনায় সদা সচেষ্ঠ এবং অবকাঠামো ও পরিবেশগত দিক দিয়ে মাশাল্লাহ্ জেলায় শ্রেষ্ঠত্বের দাবিদার। \r\n\r\nতাই, আসুন আমরা যার যার অবস্থান থেকে সাহায্য করে যেমন, কেউ ছাত্র-ছাত্রী দিয়ে, কেউ মেধা দিয়ে, কেউবা পরামর্শ দিয়ে মাদরাসাটিকে সামনের দিকে এগিয়ে নিয়ে যাই। বাংলাদেশের শিক্ষা ব্যবস্থার একটি পূর্ণাঙ্গ ধারা মাদরাসা শিক্ষা। সাধারণ শিক্ষার পাশপাশি সমান্তরালভাবে এটি বয়ে চলেছে দীর্ঘদিন ধরে এবং এ দেশের জন-মানসে তার স্থান করে নিয়েছে সুরক্ষিত ও সুদৃঢ়ভাবে। \r\n\r\nধর্মীয় শিক্ষা ও জাগতিক শিক্ষা দুটি পরস্পরের পরিপুরক। এ সমন্বিত ইসলামী শিক্ষা ব্যবস্থার প্রতিষ্ঠানিক রুপই হচ্ছে মাদরাসা শিক্ষা। ইহলৌকিক উন্নতির সাথে সাথে পারলৌকিক মুক্তির পথ দেখাতেই প্রতিষ্ঠা করা হয়েছে “আল জান্নাত ইসলামিক এডুকেশন ইনস্টিটিউট”।\r\n বাংলাদেশের দেড় সহস্রাধিক ফাযিল মাদরাসার মিছিলে ২০০২ সালে প্রতিষ্ঠিত এ মাদরাসাটি বিগত ২০১৬ সালে যোগ হলো।\r\n\r\nমাদরাসা শিক্ষা ব্যবস্থাকে সার্বজনীন মানসম্মত করার জন্য অপরিহার্য হচ্ছে অঙ্গীকার ও সার্বিক গুণগত ব্যবস্থাপনা এবং সৃজনশীল ও উদ্ভাবনীমূলক শিক্ষা কার্যক্রম পরিচালনার জন্য দরকার অনুকুল অবকাঠামো ও পরিবেশ। \r\n\r\nআমরা অঙ্গীকারাবদ্ধ, গুণগত ব্যবস্থাপনায় সদা সচেষ্ঠ এবং অবকাঠামো ও পরিবেশগত দিক দিয়ে মাশাল্লাহ্ জেলায় শ্রেষ্ঠত্বের দাবিদার। \r\n\r\nতাই, আসুন আমরা যার যার অবস্থান থেকে সাহায্য করে যেমন, কেউ ছাত্র-ছাত্রী দিয়ে, কেউ মেধা দিয়ে, কেউবা পরামর্শ দিয়ে মাদরাসাটিকে সামনের দিকে এগিয়ে নিয়ে যাই। ', 'বাংলাদেশের শিক্ষা ব্যবস্থার একটি পূর্ণাঙ্গ ধারা মাদরাসা শিক্ষা। সাধারণ শিক্ষার পাশপাশি সমান্তরালভাবে এটি বয়ে চলেছে দীর্ঘদিন ধরে এবং এ দেশের জন-মানসে তার স্থান করে নিয়েছে সুরক্ষিত ও সুদৃঢ়ভাবে। ধর্মীয় শিক্ষা ও জাগতিক', NULL),
(3, 'WHY CHOOSE US', NULL, 'services', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(4, 'Request for a free Education Class', 'Medical Services', 'cta', '', '{\"mobile_no\":\"+2484-398-8987\",\"button_text\":\"Request Now\",\"button_url\":\"http:\\/\\/localhost\\/multi_pro\\/home\\/admission\\/\"}', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(7, 'Online Classes', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fas fa-video\"}', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(8, 'Scholarship', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fas fa-graduation-cap\"}', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(9, 'Books & Liberary', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fas fa-book-reader\"}', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(10, 'Trending Courses', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fab fa-discourse\"}', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(11, 'WHAT PEOPLE SAYS', NULL, 'testimonial', 'Fusce sem dolor, interdum in efficitur at, faucibus nec lorem. Sed nec molestie justo.', '', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(12, '20 years experience in the field of study', NULL, 'statistics', 'Lorem Ipsum is simply dummy text printer took a galley of type and scrambled it to make a type specimen book.', '{\"image\":\"counter-parallax1.jpg\",\"widget_title_1\":\"Certified Teachers\",\"widget_icon_1\":\"fas fa-user-tie\",\"type_1\":\"teacher\",\"widget_title_2\":\"Students Enrolled\",\"widget_icon_2\":\"fas fa-user-graduate\",\"type_2\":\"student\",\"widget_title_3\":\"Classes\",\"widget_icon_3\":\"fas fa-graduation-cap\",\"type_3\":\"class\",\"widget_title_4\":\"Section\",\"widget_icon_4\":\"fas fa-award\",\"type_4\":\"section\"}', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(13, 'ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ', NULL, 'slider', NULL, '{\"position\":null,\"button_text1\":null,\"button_url1\":null,\"button_text2\":null,\"button_url2\":null,\"image\":\"home-slider-1735579176.jpg\"}', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(14, 'সুবিশাল আধুনিক কম্পিউটার ল্যাব', NULL, 'slider', NULL, '{\"position\":null,\"button_text1\":null,\"button_url1\":null,\"button_text2\":null,\"button_url2\":null,\"image\":\"home-slider-1735579541.jpg\"}', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(15, 'সুবিশাল বইয়ের লাইব্রেরী (হরেক রকম বইয়ের সমাহার)', NULL, 'slider', NULL, '{\"position\":null,\"button_text1\":null,\"button_url1\":null,\"button_text2\":null,\"button_url2\":null,\"image\":\"home-slider-1735579608.jpg\"}', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_home_seo`
--

CREATE TABLE `front_cms_home_seo` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_home_seo`
--

INSERT INTO `front_cms_home_seo` (`id`, `page_title`, `meta_keyword`, `meta_description`, `branch_id`) VALUES
(1, 'ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ', 'school management software,school managment software in bd,school managment software in elite design,elitedesign', 'This is a Smart School Management software for who want to make his school in Advance.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu`
--

CREATE TABLE `front_cms_menu` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `open_new_tab` int(11) NOT NULL DEFAULT 0,
  `ext_url` tinyint(3) NOT NULL DEFAULT 0,
  `ext_url_address` text DEFAULT NULL,
  `publish` tinyint(3) NOT NULL,
  `system` tinyint(3) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_menu`
--

INSERT INTO `front_cms_menu` (`id`, `title`, `alias`, `ordering`, `parent_id`, `open_new_tab`, `ext_url`, `ext_url_address`, `publish`, `system`, `branch_id`, `created_at`) VALUES
(1, 'Home', '', 1, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(2, 'Events', 'events', 3, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(3, 'Teachers', 'teachers', 2, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(4, 'About Us', 'about', 4, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(5, 'FAQ', 'faq', 5, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(6, 'Online Admission', 'admission', 6, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(7, 'Contact Us', 'contact', 13, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(8, 'Pages', 'pages', 9, 0, 0, 1, '#', 1, 1, 0, '2019-08-09 12:18:54'),
(9, 'Admit Card', 'admit_card', 10, 8, 0, 0, '', 1, 1, 0, '2021-03-16 04:24:32'),
(10, 'Exam Results', 'exam_results', 11, 8, 0, 0, '', 1, 1, 0, '2021-03-16 04:24:32'),
(11, 'Certificates', 'certificates', 12, 8, 0, 0, '', 1, 1, 0, '2021-03-21 12:04:44'),
(12, 'Gallery', 'gallery', 7, 0, 0, 0, '', 1, 1, 0, '2021-03-21 12:04:44'),
(13, 'News', 'news', 8, 0, 0, 0, '', 1, 1, 0, '2024-05-12 14:50:05');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu_visible`
--

CREATE TABLE `front_cms_menu_visible` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `menu_id` int(11) NOT NULL,
  `parent_id` varchar(11) DEFAULT NULL,
  `ordering` varchar(20) DEFAULT NULL,
  `invisible` tinyint(2) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_menu_visible`
--

INSERT INTO `front_cms_menu_visible` (`id`, `name`, `menu_id`, `parent_id`, `ordering`, `invisible`, `branch_id`) VALUES
(2, 'হোম', 1, '0', '0', 1, 1),
(3, 'শিক্ষক', 3, '0', '2', 0, 1),
(4, 'ইভেন্ট', 2, '0', '3', 1, 1),
(5, 'প্রতিষ্ঠানের ইতিহাস', 4, '0', '1', 0, 1),
(6, 'ভিডিও গ্যালারী', 5, '0', '8', 0, 1),
(7, 'অনলাইন এডমিশন', 6, '0', '6', 0, 1),
(8, 'ফটো গ্যালারী', 12, '0', '7', 0, 1),
(9, 'নোটিশ', 13, '0', '8', 0, 1),
(10, 'একাডেমিক তথ্য', 8, NULL, '9', 0, 1),
(11, 'এডমিট কার্ড', 9, '8', '10', 0, 1),
(12, 'পরীক্ষার রেজাল্ট', 10, '8', '11', 0, 1),
(13, 'সার্টিফিকেট', 11, '8', '12', 0, 1),
(14, 'যোগাযোগ', 7, '0', '13', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_news`
--

CREATE TABLE `front_cms_news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_news`
--

INSERT INTO `front_cms_news` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, '', '', 'নোটিশ', NULL, 'This is a Smart School Management software for who want to make his school in Advance.', 'school management software,school managment software in bd,school managment software in elite design,elitedesign', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_news_list`
--

CREATE TABLE `front_cms_news_list` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `alias` varchar(500) DEFAULT NULL,
  `date` date NOT NULL,
  `show_web` tinyint(4) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_news_list`
--

INSERT INTO `front_cms_news_list` (`id`, `title`, `description`, `image`, `alias`, `date`, `show_web`, `branch_id`, `created_at`) VALUES
(16, 'Regarding admission to class 1 for the 2025 academic year', '<p>২০২৫ শিক্ষাবর্ষের জন্য সরকারি স্কুলে ভর্তি বিজ্ঞপ্তি প্রকাশ করেছে মাধ্যমিক ও উচ্চ শিক্ষা অধিদপ্তর (মাউশি)। এই বছরে সরকারি স্কুলে ভর্তির প্রক্রিয়া সম্পূর্ণভাবে অনলাইনে হবে। আগ্রহী শিক্ষার্থীদের নির্ধারিত ওয়েবসাইটে (gsa.teletalk.com.bd) গিয়ে আবেদন করতে হবে।</p><p>সরকারি স্কুলে ভর্তি আবেদন ২০২৫ সময়সীমা ও ফি</p><p>ভর্তি আবেদন ১২ নভেম্বর ২০২৪ থেকে শুরু হয়ে চলবে ৩০ নভেম্বর ২০২৪ পর্যন্ত। আবেদনের শেষ তারিখ ৩০ নভেম্বর বিকেল ৫টা পর্যন্ত। আবেদনকারী শিক্ষার্থীদের জন্য ভর্তি আবেদন ফি ১১০ টাকা নির্ধারণ করা হয়েছে। এই ফি শুধুমাত্র টেলিটক প্রি-পেইড মোবাইল থেকে SMS এর মাধ্যমে প্রদান করতে হবে।</p><p><br></p><p>এবারের ভর্তি প্রক্রিয়া সবার জন্য কিছুটা ভিন্ন। আবেদনকারীদেরকে লটারির মাধ্যমে নির্বাচিত করা হবে। অর্থাৎ, কোনো স্কুল থেকে সরাসরি ভর্তি ফরম বিতরণ করা হবে না। শিক্ষার্থীদের একমাত্র সুযোগ হল অনলাইনে আবেদন করা এবং পরে লটারি প্রক্রিয়ার মাধ্যমে তারা ভর্তি হতে পারবেন।</p><p>যে সব স্কুলে ভর্তি আবেদন করা যাবে</p><p>২০২৫ শিক্ষাবর্ষে ভর্তি হওয়া যাবে দেশের সকল জাতীয়করণকৃত সরকারি মাধ্যমিক স্কুল ও বেসরকারি স্কুল-এ। ঢাকা মহানগরী এবং বিভাগীয় শহরের মেট্রোপলিটান এলাকা ও জেলা সদর উপজেলা পর্যায়ের স্কুলগুলোও এই প্রক্রিয়ার আওতায় থাকবে।</p><p><br></p><p>আবেদন প্রক্রিয়া</p><p><br></p><p>১. প্রথমে আবেদনকারীরা ওয়েবসাইট gsa.teletalk.com.bd এ গিয়ে নিজেদের তথ্য দিয়ে আবেদন করবেন।</p><p>২. অনলাইনে আবেদন করার সময় শিক্ষার্থীরা সর্বোচ্চ ৫টি স্কুলে আবেদন করতে পারবেন।</p><p>৩. আবেদন ফি ১১০ টাকা প্রদান করতে হবে।</p><p>৪. আবেদন করার পর শিক্ষার্থীদের তথ্য ও স্কুলের স্থান অনুযায়ী লটারির মাধ্যমে নির্বাচিত করা হবে।</p>', '99a95d414144b25978c4491b24977f3e.jpg', 'regarding-admission-to-class-1-for-the-2025-academic-year', '2025-01-01', 1, 1, '2025-01-01 11:23:38'),
(17, 'Regarding payment of salary for the month of December 2024 (including previous arrears)', '<p>২০২৫ শিক্ষাবর্ষের জন্য সরকারি স্কুলে ভর্তি বিজ্ঞপ্তি প্রকাশ করেছে মাধ্যমিক ও উচ্চ শিক্ষা অধিদপ্তর (মাউশি)। এই বছরে সরকারি স্কুলে ভর্তির প্রক্রিয়া সম্পূর্ণভাবে অনলাইনে হবে। আগ্রহী শিক্ষার্থীদের নির্ধারিত ওয়েবসাইটে (gsa.teletalk.com.bd) গিয়ে আবেদন করতে হবে।</p><p>সরকারি স্কুলে ভর্তি আবেদন ২০২৫ সময়সীমা ও ফি</p><p>ভর্তি আবেদন ১২ নভেম্বর ২০২৪ থেকে শুরু হয়ে চলবে ৩০ নভেম্বর ২০২৪ পর্যন্ত। আবেদনের শেষ তারিখ ৩০ নভেম্বর বিকেল ৫টা পর্যন্ত। আবেদনকারী শিক্ষার্থীদের জন্য ভর্তি আবেদন ফি ১১০ টাকা নির্ধারণ করা হয়েছে। এই ফি শুধুমাত্র টেলিটক প্রি-পেইড মোবাইল থেকে SMS এর মাধ্যমে প্রদান করতে হবে।</p><p><br></p><p>এবারের ভর্তি প্রক্রিয়া সবার জন্য কিছুটা ভিন্ন। আবেদনকারীদেরকে লটারির মাধ্যমে নির্বাচিত করা হবে। অর্থাৎ, কোনো স্কুল থেকে সরাসরি ভর্তি ফরম বিতরণ করা হবে না। শিক্ষার্থীদের একমাত্র সুযোগ হল অনলাইনে আবেদন করা এবং পরে লটারি প্রক্রিয়ার মাধ্যমে তারা ভর্তি হতে পারবেন।</p><p>যে সব স্কুলে ভর্তি আবেদন করা যাবে</p><p>২০২৫ শিক্ষাবর্ষে ভর্তি হওয়া যাবে দেশের সকল জাতীয়করণকৃত সরকারি মাধ্যমিক স্কুল ও বেসরকারি স্কুল-এ। ঢাকা মহানগরী এবং বিভাগীয় শহরের মেট্রোপলিটান এলাকা ও জেলা সদর উপজেলা পর্যায়ের স্কুলগুলোও এই প্রক্রিয়ার আওতায় থাকবে।</p><p><br></p><p>আবেদন প্রক্রিয়া</p><p><br></p><p>১. প্রথমে আবেদনকারীরা ওয়েবসাইট gsa.teletalk.com.bd এ গিয়ে নিজেদের তথ্য দিয়ে আবেদন করবেন।</p><p>২. অনলাইনে আবেদন করার সময় শিক্ষার্থীরা সর্বোচ্চ ৫টি স্কুলে আবেদন করতে পারবেন।</p><p>৩. আবেদন ফি ১১০ টাকা প্রদান করতে হবে।</p><p>৪. আবেদন করার পর শিক্ষার্থীদের তথ্য ও স্কুলের স্থান অনুযায়ী লটারির মাধ্যমে নির্বাচিত করা হবে।</p>', 'e42c81bc25739a338be90bdde0b69eab.jpg', 'regarding-payment-of-salary-for-the-month-of-december-2024-including-previous-arrears', '2025-01-01', 1, 1, '2025-01-01 11:31:31'),
(18, 'Regarding payment of board and other fees for filling out the form for 2025 SSC examinees', '<p>২০২৫ শিক্ষাবর্ষের জন্য সরকারি স্কুলে ভর্তি বিজ্ঞপ্তি প্রকাশ করেছে মাধ্যমিক ও উচ্চ শিক্ষা অধিদপ্তর (মাউশি)। এই বছরে সরকারি স্কুলে ভর্তির প্রক্রিয়া সম্পূর্ণভাবে অনলাইনে হবে। আগ্রহী শিক্ষার্থীদের নির্ধারিত ওয়েবসাইটে (gsa.teletalk.com.bd) গিয়ে আবেদন করতে হবে।</p><p>সরকারি স্কুলে ভর্তি আবেদন ২০২৫ সময়সীমা ও ফি</p><p>ভর্তি আবেদন ১২ নভেম্বর ২০২৪ থেকে শুরু হয়ে চলবে ৩০ নভেম্বর ২০২৪ পর্যন্ত। আবেদনের শেষ তারিখ ৩০ নভেম্বর বিকেল ৫টা পর্যন্ত। আবেদনকারী শিক্ষার্থীদের জন্য ভর্তি আবেদন ফি ১১০ টাকা নির্ধারণ করা হয়েছে। এই ফি শুধুমাত্র টেলিটক প্রি-পেইড মোবাইল থেকে SMS এর মাধ্যমে প্রদান করতে হবে।</p><p><br></p><p>এবারের ভর্তি প্রক্রিয়া সবার জন্য কিছুটা ভিন্ন। আবেদনকারীদেরকে লটারির মাধ্যমে নির্বাচিত করা হবে। অর্থাৎ, কোনো স্কুল থেকে সরাসরি ভর্তি ফরম বিতরণ করা হবে না। শিক্ষার্থীদের একমাত্র সুযোগ হল অনলাইনে আবেদন করা এবং পরে লটারি প্রক্রিয়ার মাধ্যমে তারা ভর্তি হতে পারবেন।</p><p>যে সব স্কুলে ভর্তি আবেদন করা যাবে</p><p>২০২৫ শিক্ষাবর্ষে ভর্তি হওয়া যাবে দেশের সকল জাতীয়করণকৃত সরকারি মাধ্যমিক স্কুল ও বেসরকারি স্কুল-এ। ঢাকা মহানগরী এবং বিভাগীয় শহরের মেট্রোপলিটান এলাকা ও জেলা সদর উপজেলা পর্যায়ের স্কুলগুলোও এই প্রক্রিয়ার আওতায় থাকবে।</p><p><br></p><p>আবেদন প্রক্রিয়া</p><p><br></p><p>১. প্রথমে আবেদনকারীরা ওয়েবসাইট gsa.teletalk.com.bd এ গিয়ে নিজেদের তথ্য দিয়ে আবেদন করবেন।</p><p>২. অনলাইনে আবেদন করার সময় শিক্ষার্থীরা সর্বোচ্চ ৫টি স্কুলে আবেদন করতে পারবেন।</p><p>৩. আবেদন ফি ১১০ টাকা প্রদান করতে হবে।</p><p>৪. আবেদন করার পর শিক্ষার্থীদের তথ্য ও স্কুলের স্থান অনুযায়ী লটারির মাধ্যমে নির্বাচিত করা হবে।</p>', '7da41f45a05ab0f9f6b2a8cc1fe6923c.jpg', 'regarding-payment-of-board-and-other-fees-for-filling-out-the-form-for-2025-ssc-examinees', '2025-01-01', 1, 1, '2025-01-01 11:33:30'),
(19, 'Regarding school bus service in the 2025 academic year', '<p>২০২৫ শিক্ষাবর্ষের জন্য সরকারি স্কুলে ভর্তি বিজ্ঞপ্তি প্রকাশ করেছে মাধ্যমিক ও উচ্চ শিক্ষা অধিদপ্তর (মাউশি)। এই বছরে সরকারি স্কুলে ভর্তির প্রক্রিয়া সম্পূর্ণভাবে অনলাইনে হবে। আগ্রহী শিক্ষার্থীদের নির্ধারিত ওয়েবসাইটে (gsa.teletalk.com.bd) গিয়ে আবেদন করতে হবে।</p><p>সরকারি স্কুলে ভর্তি আবেদন ২০২৫ সময়সীমা ও ফি</p><p>ভর্তি আবেদন ১২ নভেম্বর ২০২৪ থেকে শুরু হয়ে চলবে ৩০ নভেম্বর ২০২৪ পর্যন্ত। আবেদনের শেষ তারিখ ৩০ নভেম্বর বিকেল ৫টা পর্যন্ত। আবেদনকারী শিক্ষার্থীদের জন্য ভর্তি আবেদন ফি ১১০ টাকা নির্ধারণ করা হয়েছে। এই ফি শুধুমাত্র টেলিটক প্রি-পেইড মোবাইল থেকে SMS এর মাধ্যমে প্রদান করতে হবে।</p><p><br></p><p>এবারের ভর্তি প্রক্রিয়া সবার জন্য কিছুটা ভিন্ন। আবেদনকারীদেরকে লটারির মাধ্যমে নির্বাচিত করা হবে। অর্থাৎ, কোনো স্কুল থেকে সরাসরি ভর্তি ফরম বিতরণ করা হবে না। শিক্ষার্থীদের একমাত্র সুযোগ হল অনলাইনে আবেদন করা এবং পরে লটারি প্রক্রিয়ার মাধ্যমে তারা ভর্তি হতে পারবেন।</p><p>যে সব স্কুলে ভর্তি আবেদন করা যাবে</p><p>২০২৫ শিক্ষাবর্ষে ভর্তি হওয়া যাবে দেশের সকল জাতীয়করণকৃত সরকারি মাধ্যমিক স্কুল ও বেসরকারি স্কুল-এ। ঢাকা মহানগরী এবং বিভাগীয় শহরের মেট্রোপলিটান এলাকা ও জেলা সদর উপজেলা পর্যায়ের স্কুলগুলোও এই প্রক্রিয়ার আওতায় থাকবে।</p><p><br></p><p>আবেদন প্রক্রিয়া</p><p><br></p><p>১. প্রথমে আবেদনকারীরা ওয়েবসাইট gsa.teletalk.com.bd এ গিয়ে নিজেদের তথ্য দিয়ে আবেদন করবেন।</p><p>২. অনলাইনে আবেদন করার সময় শিক্ষার্থীরা সর্বোচ্চ ৫টি স্কুলে আবেদন করতে পারবেন।</p><p>৩. আবেদন ফি ১১০ টাকা প্রদান করতে হবে।</p><p>৪. আবেদন করার পর শিক্ষার্থীদের তথ্য ও স্কুলের স্থান অনুযায়ী লটারির মাধ্যমে নির্বাচিত করা হবে।</p>', 'e1777b6ea353b6847ea1043c164b894d.jpg', 'regarding-school-bus-service-in-the-2025-academic-year', '2025-01-01', 1, 1, '2025-01-01 11:34:44'),
(20, 'Regarding the payment of salaries for the month of September 2024 (including previous arrears).', '<p>২০২৫ শিক্ষাবর্ষের জন্য সরকারি স্কুলে ভর্তি বিজ্ঞপ্তি প্রকাশ করেছে মাধ্যমিক ও উচ্চ শিক্ষা অধিদপ্তর (মাউশি)। এই বছরে সরকারি স্কুলে ভর্তির প্রক্রিয়া সম্পূর্ণভাবে অনলাইনে হবে। আগ্রহী শিক্ষার্থীদের নির্ধারিত ওয়েবসাইটে (gsa.teletalk.com.bd) গিয়ে আবেদন করতে হবে।</p><p>সরকারি স্কুলে ভর্তি আবেদন ২০২৫ সময়সীমা ও ফি</p><p>ভর্তি আবেদন ১২ নভেম্বর ২০২৪ থেকে শুরু হয়ে চলবে ৩০ নভেম্বর ২০২৪ পর্যন্ত। আবেদনের শেষ তারিখ ৩০ নভেম্বর বিকেল ৫টা পর্যন্ত। আবেদনকারী শিক্ষার্থীদের জন্য ভর্তি আবেদন ফি ১১০ টাকা নির্ধারণ করা হয়েছে। এই ফি শুধুমাত্র টেলিটক প্রি-পেইড মোবাইল থেকে SMS এর মাধ্যমে প্রদান করতে হবে।</p><p><br></p><p>এবারের ভর্তি প্রক্রিয়া সবার জন্য কিছুটা ভিন্ন। আবেদনকারীদেরকে লটারির মাধ্যমে নির্বাচিত করা হবে। অর্থাৎ, কোনো স্কুল থেকে সরাসরি ভর্তি ফরম বিতরণ করা হবে না। শিক্ষার্থীদের একমাত্র সুযোগ হল অনলাইনে আবেদন করা এবং পরে লটারি প্রক্রিয়ার মাধ্যমে তারা ভর্তি হতে পারবেন।</p><p>যে সব স্কুলে ভর্তি আবেদন করা যাবে</p><p>২০২৫ শিক্ষাবর্ষে ভর্তি হওয়া যাবে দেশের সকল জাতীয়করণকৃত সরকারি মাধ্যমিক স্কুল ও বেসরকারি স্কুল-এ। ঢাকা মহানগরী এবং বিভাগীয় শহরের মেট্রোপলিটান এলাকা ও জেলা সদর উপজেলা পর্যায়ের স্কুলগুলোও এই প্রক্রিয়ার আওতায় থাকবে।</p><p><br></p><p>আবেদন প্রক্রিয়া</p><p><br></p><p>১. প্রথমে আবেদনকারীরা ওয়েবসাইট gsa.teletalk.com.bd এ গিয়ে নিজেদের তথ্য দিয়ে আবেদন করবেন।</p><p>২. অনলাইনে আবেদন করার সময় শিক্ষার্থীরা সর্বোচ্চ ৫টি স্কুলে আবেদন করতে পারবেন।</p><p>৩. আবেদন ফি ১১০ টাকা প্রদান করতে হবে।</p><p>৪. আবেদন করার পর শিক্ষার্থীদের তথ্য ও স্কুলের স্থান অনুযায়ী লটারির মাধ্যমে নির্বাচিত করা হবে।</p>', '5f88194ef89bb4e1950bc6b678555c41.jpg', 'regarding-the-payment-of-salaries-for-the-month-of-september-2024-including-previous-arrears', '2025-01-01', 1, 1, '2025-01-01 11:36:06'),
(21, 'Regarding caution against being deceived by fraudsters regarding scholarships', '<p>২০২৫ শিক্ষাবর্ষের জন্য সরকারি স্কুলে ভর্তি বিজ্ঞপ্তি প্রকাশ করেছে মাধ্যমিক ও উচ্চ শিক্ষা অধিদপ্তর (মাউশি)। এই বছরে সরকারি স্কুলে ভর্তির প্রক্রিয়া সম্পূর্ণভাবে অনলাইনে হবে। আগ্রহী শিক্ষার্থীদের নির্ধারিত ওয়েবসাইটে (gsa.teletalk.com.bd) গিয়ে আবেদন করতে হবে।</p><p>সরকারি স্কুলে ভর্তি আবেদন ২০২৫ সময়সীমা ও ফি</p><p>ভর্তি আবেদন ১২ নভেম্বর ২০২৪ থেকে শুরু হয়ে চলবে ৩০ নভেম্বর ২০২৪ পর্যন্ত। আবেদনের শেষ তারিখ ৩০ নভেম্বর বিকেল ৫টা পর্যন্ত। আবেদনকারী শিক্ষার্থীদের জন্য ভর্তি আবেদন ফি ১১০ টাকা নির্ধারণ করা হয়েছে। এই ফি শুধুমাত্র টেলিটক প্রি-পেইড মোবাইল থেকে SMS এর মাধ্যমে প্রদান করতে হবে।</p><p><br></p><p>এবারের ভর্তি প্রক্রিয়া সবার জন্য কিছুটা ভিন্ন। আবেদনকারীদেরকে লটারির মাধ্যমে নির্বাচিত করা হবে। অর্থাৎ, কোনো স্কুল থেকে সরাসরি ভর্তি ফরম বিতরণ করা হবে না। শিক্ষার্থীদের একমাত্র সুযোগ হল অনলাইনে আবেদন করা এবং পরে লটারি প্রক্রিয়ার মাধ্যমে তারা ভর্তি হতে পারবেন।</p><p>যে সব স্কুলে ভর্তি আবেদন করা যাবে</p><p>২০২৫ শিক্ষাবর্ষে ভর্তি হওয়া যাবে দেশের সকল জাতীয়করণকৃত সরকারি মাধ্যমিক স্কুল ও বেসরকারি স্কুল-এ। ঢাকা মহানগরী এবং বিভাগীয় শহরের মেট্রোপলিটান এলাকা ও জেলা সদর উপজেলা পর্যায়ের স্কুলগুলোও এই প্রক্রিয়ার আওতায় থাকবে।</p><p><br></p><p>আবেদন প্রক্রিয়া</p><p><br></p><p>১. প্রথমে আবেদনকারীরা ওয়েবসাইট gsa.teletalk.com.bd এ গিয়ে নিজেদের তথ্য দিয়ে আবেদন করবেন।</p><p>২. অনলাইনে আবেদন করার সময় শিক্ষার্থীরা সর্বোচ্চ ৫টি স্কুলে আবেদন করতে পারবেন।</p><p>৩. আবেদন ফি ১১০ টাকা প্রদান করতে হবে।</p><p>৪. আবেদন করার পর শিক্ষার্থীদের তথ্য ও স্কুলের স্থান অনুযায়ী লটারির মাধ্যমে নির্বাচিত করা হবে।</p>', '0b9c5a8ec84aa8acbd7a909aacf3c599.jpg', 'regarding-caution-against-being-deceived-by-fraudsters-regarding-scholarships', '2025-01-01', 1, 1, '2025-01-01 11:37:52');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_pages`
--

CREATE TABLE `front_cms_pages` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `menu_id` int(11) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_services`
--

CREATE TABLE `front_cms_services` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `parallax_image` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_services`
--

INSERT INTO `front_cms_services` (`id`, `title`, `subtitle`, `parallax_image`, `branch_id`) VALUES
(1, 'Get Well Soon', 'Our Best <span>Services</span>', 'service_parallax1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_services_list`
--

CREATE TABLE `front_cms_services_list` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_services_list`
--

INSERT INTO `front_cms_services_list` (`id`, `title`, `description`, `icon`, `branch_id`) VALUES
(1, 'Online Course Facilities', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.', 'fas fa-headphones', 1),
(2, 'Modern Book Library', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover.', 'fas fa-book-open', 1),
(3, 'Be Industrial Leader', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model.', 'fas fa-industry', 1),
(4, 'Programming Courses', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will.', 'fas fa-code', 1),
(5, 'Foreign Languages', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover.', 'fas fa-language', 1),
(6, 'Alumni Directory', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a for \'lorem ipsum\' will uncover.', 'fas fa-user-graduate', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_setting`
--

CREATE TABLE `front_cms_setting` (
  `id` int(11) NOT NULL,
  `application_title` varchar(255) NOT NULL,
  `url_alias` varchar(255) DEFAULT NULL,
  `cms_active` tinyint(4) NOT NULL DEFAULT 0,
  `online_admission` tinyint(4) NOT NULL DEFAULT 0,
  `theme` varchar(255) NOT NULL,
  `captcha_status` varchar(20) NOT NULL,
  `recaptcha_site_key` varchar(255) NOT NULL,
  `recaptcha_secret_key` varchar(255) NOT NULL,
  `address` varchar(350) NOT NULL,
  `mobile_no` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `copyright_text` varchar(255) NOT NULL,
  `fav_icon` varchar(255) NOT NULL,
  `google_analytics` text DEFAULT NULL,
  `primary_color` varchar(100) NOT NULL DEFAULT '#ff685c',
  `menu_color` varchar(100) NOT NULL DEFAULT '#fff',
  `hover_color` varchar(100) DEFAULT '#f04133',
  `text_color` varchar(100) DEFAULT '#232323',
  `text_secondary_color` varchar(100) DEFAULT '#383838',
  `footer_background_color` varchar(100) DEFAULT '#383838',
  `footer_text_color` varchar(100) DEFAULT '#8d8d8d',
  `copyright_bg_color` varchar(100) DEFAULT '#262626',
  `copyright_text_color` varchar(100) DEFAULT '#8d8d8d',
  `border_radius` varchar(100) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL,
  `main_logo` varchar(255) DEFAULT NULL,
  `mobile_logo` varchar(255) DEFAULT NULL,
  `eienn_code` varchar(255) DEFAULT NULL,
  `college_code` varchar(255) DEFAULT NULL,
  `emergency_notice` longtext DEFAULT NULL,
  `principal_images` varchar(255) DEFAULT NULL,
  `sovapoti_images` varchar(255) DEFAULT NULL,
  `facebook_page_url` varchar(255) DEFAULT NULL,
  `terms` longtext DEFAULT NULL,
  `privacy` longtext DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `youtube_url` varchar(255) DEFAULT NULL,
  `google_plus` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `pinterest_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_setting`
--

INSERT INTO `front_cms_setting` (`id`, `application_title`, `url_alias`, `cms_active`, `online_admission`, `theme`, `captcha_status`, `recaptcha_site_key`, `recaptcha_secret_key`, `address`, `mobile_no`, `email`, `copyright_text`, `fav_icon`, `google_analytics`, `primary_color`, `menu_color`, `hover_color`, `text_color`, `text_secondary_color`, `footer_background_color`, `footer_text_color`, `copyright_bg_color`, `copyright_text_color`, `border_radius`, `branch_id`, `main_logo`, `mobile_logo`, `eienn_code`, `college_code`, `emergency_notice`, `principal_images`, `sovapoti_images`, `facebook_page_url`, `terms`, `privacy`, `facebook_url`, `twitter_url`, `youtube_url`, `google_plus`, `linkedin_url`, `pinterest_url`, `instagram_url`) VALUES
(1, 'ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ', 'demo', 1, 1, 'red', 'disable', '', '', 'হাউজঃ মুন্সি বাড়ি, নয়ার হাট স্কুল সংলগ্ন, বড়বাড়ি, লালমনির হাট।', '+8801849832178', 'info@creativedesign.com.bd', '© সকল কিছুর স্বত্বাধিকারঃ ফাকল পুলিশ লাইন্স স্কুল অ্যান্ড কলেজ', 'fav_icon1.png', '', '#051939', '#051939', '#000000', NULL, NULL, '#141414', NULL, '#1c1c1c', NULL, '0', 1, 'main_logo1.jpg', 'mobile_logo1.png', '১৩১০১৫', '৭২৫৮', 'আমাদের ওয়েব সাইটের সার্বিক উন্নয়ন এর কাজ চলছে। কাজ চলাকালীন অবস্থায় , আপনাদের সাময়িকভাবে কিছুটা অসুবিধা হতে পারে এর জন্য আমরা আন্তরিকভাবে দুক্ষিত । আমাদের ওয়েবসাইট উন্নয়নের কাজটি আগামিকাল শেষ হবে। আমাদের সাথে থাকার জন্য ধন্যবাদ।', 'principal_images1.jpg', 'sovapoti_images1.jpg', 'official.creativedesign', 'These terms and conditions outline the rules and regulations for the use of Phakal police lines school and college\'s Website, located at www.phakal.edu.bd.\r\nBy accessing this website we assume you accept these terms and conditions. Do not continue to use Phakal police lines school and college if you do not agree to take all of the terms and conditions stated on this page.\r\n\r\nThe following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: \"Client\", \"You\" and \"Your\" refers to you, the person log on this website and compliant to the Company\'s terms and conditions. \"The Company\", \"Ourselves\", \"We\", \"Our\" and \"Us\", refers to our Company. \"Party\", \"Parties\", or \"Us\", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client\'s needs in respect of provision of the Company\'s stated services, in accordance with and subject to, prevailing law of bd. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.\r\n\r\nCookies\r\nWe employ the use of cookies. By accessing Phakal police lines school and college, you agreed to use cookies in agreement with the Phakal police lines school and college\'s Privacy Policy.\r\n\r\nMost interactive websites use cookies to let us retrieve the user\'s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.\r\n\r\nLicense\r\nUnless otherwise stated, Phakal police lines school and college and/or its licensors own the intellectual property rights for all material on Phakal police lines school and college. All intellectual property rights are reserved. You may access this from Phakal police lines school and college for your own personal use subjected to restrictions set in these terms and conditions.\r\n\r\nYou must not:\r\n\r\nRepublish material from Phakal police lines school and college\r\nSell, rent or sub-license material from Phakal police lines school and college\r\nReproduce, duplicate or copy material from Phakal police lines school and college\r\nRedistribute content from Phakal police lines school and college\r\nParts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Phakal police lines school and college does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Phakal police lines school and college,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Phakal police lines school and college shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.\r\n\r\nPhakal police lines school and college reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.\r\n\r\nYou warrant and represent that:\r\n\r\nYou are entitled to post the Comments on our website and have all necessary licenses and consents to do so;\r\nThe Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;\r\nThe Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy\r\nThe Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.\r\nYou hereby grant Phakal police lines school and college a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.\r\n\r\nHyperlinking to our Content\r\nThe following organizations may link to our Website without prior written approval:\r\n\r\nGovernment agencies;\r\nSearch engines;\r\nNews organizations;\r\nOnline directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and\r\nSystem wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.\r\nThese organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party\'s site.\r\n\r\nWe may consider and approve other link requests from the following types of organizations:\r\n\r\ncommonly-known consumer and/or business information sources;\r\ndot.com community sites;\r\nassociations or other groups representing charities;\r\nonline directory distributors;\r\ninternet portals;\r\naccounting, law and consulting firms; and\r\neducational institutions and trade associations.\r\nWe will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of Phakal police lines school and college; and (d) the link is in the context of general resource information.\r\n\r\nThese organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party\'s site.\r\n\r\nIf you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to Phakal police lines school and college. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.\r\n\r\nApproved organizations may hyperlink to our Website as follows:\r\n\r\nBy use of our corporate name; or\r\nBy use of the uniform resource locator being linked to; or\r\nBy use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party\'s site.\r\nNo use of Phakal police lines school and college\'s logo or other artwork will be allowed for linking absent a trademark license agreement.\r\n\r\niFrames\r\nWithout prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.\r\n\r\nContent Liability\r\nWe shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.\r\n\r\nReservation of Rights\r\nWe reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it\'s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.\r\n\r\nRemoval of links from our website\r\nIf you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.\r\n\r\nWe do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.\r\n\r\nDisclaimer\r\nTo the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:\r\n\r\nlimit or exclude our or your liability for death or personal injury;\r\nlimit or exclude our or your liability for fraud or fraudulent misrepresentation;\r\nlimit any of our or your liabilities in any way that is not permitted under applicable law; or\r\nexclude any of our or your liabilities that may not be excluded under applicable law.\r\nThe limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.\r\n\r\nAs long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.', 'At Phakal police lines school and college, accessible from www.phakal.edu.bd, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Phakal police lines school and college and how we use it.\r\nIf you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.\r\n\r\nThis Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Phakal police lines school and college. This policy is not applicable to any information collected offline or via channels other than this website.\r\n\r\nConsent\r\nBy using our website, you hereby consent to our Privacy Policy and agree to its terms.\r\n\r\nInformation we collect\r\nThe personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.\r\n\r\nIf you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.\r\n\r\nWhen you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.\r\n\r\nHow we use your information\r\nWe use the information we collect in various ways, including to:\r\n\r\nProvide, operate, and maintain our website\r\nImprove, personalize, and expand our website\r\nUnderstand and analyze how you use our website\r\nDevelop new products, services, features, and functionality\r\nCommunicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes\r\nSend you emails\r\nFind and prevent fraud\r\nLog Files\r\nPhakal police lines school and college follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.\r\n\r\nCookies and Web Beacons\r\nLike any other website, Phakal police lines school and college uses \"cookies\". These cookies are used to store information including visitors\' preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimize the users\' experience by customizing our web page content based on visitors\' browser type and/or other information.\r\n\r\nOur Advertising Partners\r\nSome of advertisers on our site may use cookies and web beacons. Our advertising partners are listed below. Each of our advertising partners has their own Privacy Policy for their policies on user data. For easier access, we hyperlinked to their Privacy Policies below.\r\n\r\nGoogle\r\n\r\nhttps://policies.google.com/technologies/ads\r\n\r\nAdvertising Partners Privacy Policies\r\nYou may consult this list to find the Privacy Policy for each of the advertising partners of Phakal police lines school and college.\r\n\r\nThird-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Phakal police lines school and college, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.\r\n\r\nNote that Phakal police lines school and college has no access to or control over these cookies that are used by third-party advertisers.\r\n\r\nThird Party Privacy Policies\r\nPhakal police lines school and college\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.\r\n\r\nYou can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.\r\n\r\nCCPA Privacy Rights (Do Not Sell My Personal Information)\r\nUnder the CCPA, among other rights, California consumers have the right to:\r\n\r\nRequest that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.\r\n\r\nRequest that a business delete any personal data about the consumer that a business has collected.\r\n\r\nRequest that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.\r\n\r\nIf you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.\r\n\r\nGDPR Data Protection Rights\r\nWe would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:\r\n\r\nThe right to access – You have the right to request copies of your personal data. We may charge you a small fee for this service.\r\n\r\nThe right to rectification – You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.\r\n\r\nThe right to erasure – You have the right to request that we erase your personal data, under certain conditions.\r\n\r\nThe right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions.\r\n\r\nThe right to object to processing – You have the right to object to our processing of your personal data, under certain conditions.\r\n\r\nThe right to data portability – You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.\r\n\r\nIf you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.\r\n\r\nChildren\'s Information\r\nAnother part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.\r\n\r\nPhakal police lines school and college does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.\r\n\r\nChanges to This Privacy Policy\r\nWe may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.\r\n\r\nContact Us\r\nIf you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_teachers`
--

CREATE TABLE `front_cms_teachers` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_teachers`
--

INSERT INTO `front_cms_teachers` (`id`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'শিক্ষকগন', NULL, 'This is a Smart School Management software for who want to make his school in Advance.', 'school management software,school managment software in bd,school managment software in elite design,elitedesign', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_testimonial`
--

CREATE TABLE `front_cms_testimonial` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(355) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `rank` int(5) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `front_cms_testimonial`
--

INSERT INTO `front_cms_testimonial` (`id`, `name`, `surname`, `image`, `description`, `rank`, `branch_id`, `created_by`, `created_at`) VALUES
(1, 'Gartrell Wright', 'Los Angeles', 'defualt.png', 'Intexure have done an excellent job presenting the analysis & insights. I am confident in saying  have helped encounter  is to be welcomed and every pain avoided”.', 1, 1, 1, '2019-08-23 12:26:42'),
(2, 'Clifton Hyde', 'Newyork City', 'defualt.png', '“Owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted always holds”.', 4, 1, 1, '2019-08-23 12:26:42'),
(3, 'Emily Lemus', 'Los Angeles', 'defualt.png', '“Intexure have done an excellent job presenting the analysis & insights. I am confident in saying  have helped encounter  is to be welcomed and every pain avoided”.', 5, 1, 1, '2019-08-23 12:26:42'),
(4, 'Michel Jhon', 'CEO', 'defualt.png', '“Owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted always holds”.', 3, 2, 1, '2019-08-23 12:26:42'),
(5, 'Hilda Howard', 'Chicago City', 'defualt.png', '“Owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted always holds”.', 4, 2, 1, '2019-08-23 12:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` int(11) NOT NULL,
  `institute_name` varchar(255) NOT NULL,
  `institution_code` varchar(255) NOT NULL,
  `reg_prefix` varchar(255) NOT NULL,
  `institute_email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `currency_formats` tinyint(4) NOT NULL DEFAULT 1,
  `symbol_position` tinyint(4) NOT NULL DEFAULT 1,
  `sms_service_provider` varchar(100) NOT NULL,
  `session_id` int(11) NOT NULL,
  `translation` varchar(100) NOT NULL,
  `footer_text` varchar(255) NOT NULL,
  `animations` varchar(100) NOT NULL,
  `timezone` varchar(100) NOT NULL,
  `date_format` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `facebook_url` varchar(255) NOT NULL,
  `twitter_url` varchar(255) NOT NULL,
  `linkedin_url` varchar(255) NOT NULL,
  `youtube_url` varchar(255) NOT NULL,
  `cron_secret_key` varchar(255) DEFAULT NULL,
  `preloader_backend` tinyint(1) NOT NULL DEFAULT 1,
  `footer_branch_switcher` tinyint(1) NOT NULL DEFAULT 1,
  `cms_default_branch` int(11) NOT NULL,
  `image_extension` text DEFAULT NULL,
  `image_size` float NOT NULL DEFAULT 1024,
  `file_extension` text DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `file_size` float DEFAULT 1024,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `institute_name`, `institution_code`, `reg_prefix`, `institute_email`, `address`, `mobileno`, `currency`, `currency_symbol`, `currency_formats`, `symbol_position`, `sms_service_provider`, `session_id`, `translation`, `footer_text`, `animations`, `timezone`, `date_format`, `facebook_url`, `twitter_url`, `linkedin_url`, `youtube_url`, `cron_secret_key`, `preloader_backend`, `footer_branch_switcher`, `cms_default_branch`, `image_extension`, `image_size`, `file_extension`, `pid`, `file_size`, `created_at`, `updated_at`) VALUES
(1, 'Phakal Police Lines School & College', 'PPLSC-', 'on', 'info@creativedesign.com.bd', 'Police Lines, Mission More, Lalmonir Hat Sadar, Bangladesh', '01775457008', 'BDT', 'TK', 1, 1, 'disabled', 6, 'english', '© 2025 All Rights Reserved By Phakal Police Lines School & College', 'fadeInUp', 'Asia/Dhaka', 'd.M.Y', 'https://www.facebook.com/official.creativedesign', 'https://www.facebook.com/official.creativedesign', 'https://www.facebook.com/official.creativedesign', 'https://www.facebook.com/official.creativedesign', 'de96a5c5c83213e9ae3efbc08d512290', 2, 0, 1, 'jpeg, jpg, bmp, png', 2048, 'txt, pdf, doc, xls, docx, xlsx, jpg, jpeg, png, gif, bmp, zip, mp4, 7z, wmv, rar', 'YWNjZmExNmMtMjhmNi00Njc3LTgyOWQtMDY1MzZlNjg0ZjQz', 2048, '2024-12-27 07:30:59', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `grade_point` varchar(255) NOT NULL,
  `lower_mark` int(11) NOT NULL,
  `upper_mark` int(11) NOT NULL,
  `remark` text NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`id`, `name`, `grade_point`, `lower_mark`, `upper_mark`, `remark`, `branch_id`) VALUES
(1, 'A+', '5.0', 80, 100, 'Excellent!', 1),
(2, 'A', '4', 70, 19, 'Very Good', 1),
(3, 'A-', '3.5', 60, 69, 'Good', 1),
(4, 'B', '3', 50, 59, 'Average', 1),
(5, 'C', '2.5', 40, 49, 'Adequate', 1),
(6, 'D', '2', 33, 39, 'Poor', 1),
(7, 'F', '0', 0, 32, 'Fail', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hall_allocation`
--

CREATE TABLE `hall_allocation` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `hall_no` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE `homework` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `date_of_homework` date NOT NULL,
  `date_of_submission` date NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `sms_notification` tinyint(2) NOT NULL,
  `schedule_date` date DEFAULT NULL,
  `document` varchar(255) NOT NULL,
  `evaluation_date` date DEFAULT NULL,
  `evaluated_by` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homework_evaluation`
--

CREATE TABLE `homework_evaluation` (
  `id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `remark` text NOT NULL,
  `rank` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homework_submit`
--

CREATE TABLE `homework_submit` (
  `id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `message` varchar(355) NOT NULL,
  `enc_name` varchar(355) DEFAULT NULL,
  `file_name` varchar(355) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `category_id` int(11) NOT NULL,
  `address` longtext NOT NULL,
  `watchman` longtext NOT NULL,
  `remarks` longtext DEFAULT NULL,
  `branch_id` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_category`
--

CREATE TABLE `hostel_category` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `description` longtext DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_room`
--

CREATE TABLE `hostel_room` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `hostel_id` int(11) NOT NULL,
  `no_beds` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `bed_fee` decimal(18,2) NOT NULL,
  `remarks` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `word` varchar(255) NOT NULL,
  `english` varchar(255) NOT NULL,
  `bengali` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `word`, `english`, `bengali`) VALUES
(1, 'language', 'Language', 'ভাষা'),
(2, 'attendance_overview', 'Attendance Overview', 'উপস্থিতি পরিদর্শন'),
(3, 'annual_fee_summary', 'Annual Fee Summary', 'বার্ষিক ফি সংক্ষিপ্ত বিবরণ'),
(4, 'my_annual_attendance_overview', 'My Annual Attendance Overview', 'আমার বার্ষিক উপস্থিতি পরিদর্শন'),
(5, 'schedule', 'Schedule', 'সময়সূচী'),
(6, 'student_admission', 'Student Admission', 'ছাত্র ভর্তি'),
(7, 'returned', 'Returned', 'ফেরৎ'),
(8, 'user_name', 'User Name', 'ব্যবহারকারীর নাম'),
(9, 'rejected', 'Rejected', 'প্রত্যাখ্যাত'),
(10, 'route_name', 'Route Name', 'রুট নাম'),
(11, 'route_fare', 'Route Fare', 'রুট ভাড়া'),
(12, 'edit_route', 'Edit Route', 'সম্পাদন করা রুট'),
(13, 'this_value_is_required', 'This value is required.', 'এই মান প্রয়োজন'),
(14, 'vehicle_no', 'Vehicle No', 'যানবাহন নং'),
(15, 'insurance_renewal_date', 'Insurance Renewal Date', 'বীমা নবায়ন তারিখ'),
(16, 'driver_name', 'Driver Name', 'ড্রাইভারের নাম'),
(17, 'driver_license', 'Driver License', 'চালকের অনুমোদন'),
(18, 'select_route', 'Select Route', 'রুট নির্বাচন করুন'),
(19, 'edit_vehicle', 'Edit Vehicle', 'যানবাহন সম্পাদনা করুন'),
(20, 'add_students', 'Add Students', 'ছাত্রদের যোগ করুন'),
(21, 'vehicle_number', 'Vehicle Number', 'যানবাহন সংখ্যা'),
(22, 'select_route_first', 'Select Route First', 'রুট প্রথম নির্বাচন করুন'),
(23, 'transport_fee', 'Transport Fee', 'পরিবহন ফি'),
(24, 'control', 'Control', 'নিয়ন্ত্রণ'),
(25, 'set_students', 'Set Students', 'ছাত্রদের সেট করুন'),
(26, 'hostel_list', 'Hostel List', 'হোস্টেল তালিকা'),
(27, 'watchman_name', 'Watchman Name', 'ওয়াচম্যান নাম'),
(28, 'hostel_address', 'Hostel Address', 'হোস্টেল ঠিকানা'),
(29, 'edit_hostel', 'Edit Hostel', 'হোস্টেল সম্পাদনা করুন'),
(30, 'room_name', 'Room Name', 'রুমের নাম'),
(31, 'no_of_beds', 'No Of Beds', 'শয্যা সংখ্যা'),
(32, 'select_hostel_first', 'Select Hostel First', 'হোস্টেল প্রথম নির্বাচন করুন'),
(33, 'remaining', 'Remaining', 'অবশিষ্ট'),
(34, 'hostel_fee', 'Hostel Fee', 'হোস্টেল ফি'),
(35, 'accountant_list', 'Accountant List', 'অ্যাকাউন্টেন্ট তালিকা'),
(36, 'students_fees', 'Students Fees', 'ছাত্র ফি'),
(37, 'fees_status', 'Fees Status', 'ফি স্থিতি'),
(38, 'books', 'Books', 'বই'),
(39, 'home_page', 'Home Page', 'হোম পেজ'),
(40, 'collected', 'Collected', 'সংগৃহীত'),
(41, 'student_mark', 'Student Mark', 'ছাত্র মার্ক'),
(42, 'select_exam_first', 'Select Exam First', 'নির্বাচন প্রথম নির্বাচন করুন'),
(43, 'transport_details', 'Transport Details', 'পরিবহন বিবরণ'),
(44, 'no_of_teacher', 'No of Teacher', 'শিক্ষকের সংখ্যা'),
(45, 'basic_details', 'Basic Details', 'মৌলিক বিবরণ'),
(46, 'fee_progress', 'Fee Progress', 'ফি অগ্রগতি'),
(47, 'word', 'Word', 'শব্দ'),
(48, 'book_category', 'Book Category', 'বই বিভাগ'),
(49, 'driver_phone', 'Driver Phone', 'ড্রাইভার ফোন'),
(50, 'invalid_csv_file', 'Invalid / Corrupted CSV File', 'অবৈধ / দূষিত CSV ফাইল'),
(51, 'requested_book_list', 'Requested Book List', 'অনুরোধকৃত বইয়ের তালিকা'),
(52, 'request_status', 'Request Status', 'অনুরোধ স্থিতি'),
(53, 'book_request', 'Book Request', 'বইয়ের অনুরোধ'),
(54, 'logout', 'Logout', 'প্রস্থান'),
(55, 'select_payment_method', 'Select Payment Method', 'পেমেন্ট পদ্ধতি নির্বাচন করুন'),
(56, 'select_method', 'Select Method', 'পদ্ধতি নির্বাচন করুন'),
(57, 'payment', 'Payment', 'প্রদান'),
(58, 'filter', 'Filter', 'ছাঁকনি'),
(59, 'status', 'Status', 'অবস্থা'),
(60, 'paid', 'Paid', 'অর্থ প্রদান'),
(61, 'unpaid', 'Unpaid', 'অবৈতনিক'),
(62, 'method', 'Method', 'পদ্ধতি'),
(63, 'cash', 'Cash', 'নগদ'),
(64, 'check', 'Check', 'চেক'),
(65, 'card', 'Card', 'কার্ড'),
(66, 'payment_history', 'Payment History', 'অর্থ প্রদান ইতিহাস'),
(67, 'category', 'Category', 'বিভাগ'),
(68, 'book_list', 'Book List', 'পাঠ্যতালিকা'),
(69, 'author', 'Author', 'লেখক'),
(70, 'price', 'Price', 'মূল্য'),
(71, 'available', 'Available', 'সহজলভ্য'),
(72, 'unavailable', 'Unavailable', 'অপ্রাপ্য'),
(73, 'transport_list', 'Transport List', 'পরিবহন তালিকা'),
(74, 'edit_transport', 'Edit Transport', 'পরিবহন সম্পাদনা'),
(75, 'hostel_name', 'Hostel Name', 'হোস্টেল নাম'),
(76, 'number_of_room', 'Hostel Of Room', 'রুম নম্বর'),
(77, 'yes', 'Yes', 'হাঁ'),
(78, 'no', 'No', 'না'),
(79, 'messages', 'Messages', 'বার্তা'),
(80, 'compose', 'Compose', 'নতুন বার্তা লিখতে'),
(81, 'recipient', 'Recipient', 'প্রাপক'),
(82, 'select_a_user', 'Select A User', 'নির্বাচন একটি ব্যবহারকারী'),
(83, 'send', 'Send', 'পাঠান'),
(84, 'global_settings', 'Global Settings', 'সার্বজনীন নির্ধারণ'),
(85, 'currency', 'Currency', 'মুদ্রা'),
(86, 'system_email', 'System Email', 'সিস্টেম ইমেইল'),
(87, 'create', 'Create', 'সৃষ্টি'),
(88, 'save', 'Save', 'সংরক্ষণ করুন'),
(89, 'file', 'File', 'ফাইল'),
(90, 'theme_settings', 'Theme Settings', 'থিম সেটিংস'),
(91, 'default', 'Default', 'ডিফল্ট'),
(92, 'select_theme', 'Select Theme', 'থিম নির্বাচন কর'),
(93, 'upload_logo', 'Upload Logo', 'লোগো আপলোড করুন'),
(94, 'upload', 'Upload', 'আপলোড'),
(95, 'remember', 'Remember', 'স্মরণ করা'),
(96, 'not_selected', 'Not Selected', 'অনির্বাচিত'),
(97, 'disabled', 'Disabled', 'অক্ষম'),
(98, 'inactive_account', 'Inactive Account', 'নিষ্ক্রিয় অ্যাকাউন্ট'),
(99, 'update_translations', 'Update Translations', 'আপডেট অনুবাদ'),
(100, 'language_list', 'Language List', 'নতুন ভাষাটি তালিকায় আগে'),
(101, 'option', 'Option', 'পছন্দ'),
(102, 'edit_word', 'Edit Word', 'শব্দ সম্পাদনা করুন'),
(103, 'update_profile', 'Update Profile', 'প্রফাইল হালনাগাদ'),
(104, 'current_password', 'Current Password', 'বর্তমান পাসওয়ার্ড'),
(105, 'new_password', 'New Password', 'নতুন পাসওয়ার্ড'),
(106, 'login', 'Login', 'লগইন'),
(107, 'reset_password', 'Reset Password', 'পাসওয়ার্ড রিসেট করুন'),
(108, 'present', 'Present', 'হাজির'),
(109, 'absent', 'Absent', 'অনুপস্থিত'),
(110, 'update_attendance', 'Update Attendance', 'আপডেট এ্যাটেনডেন্স'),
(111, 'undefined', 'Undefined', 'অনির্দিষ্ট'),
(112, 'back', 'Back', 'পিছনে'),
(113, 'save_changes', 'Save Changes', 'পরিবর্তনগুলোর সংরক্ষন'),
(114, 'uploader', 'Uploader', 'আপলোডার'),
(115, 'download', 'Download', 'ডাউনলোড'),
(116, 'remove', 'Remove', 'অপসারণ'),
(117, 'print', 'Print', 'ছাপানো'),
(118, 'select_file_type', 'Select File Type', 'নির্বাচন ফাইল টাইপ'),
(119, 'excel', 'Excel', 'সীমা অতিক্রম করা'),
(120, 'other', 'Other', 'অন্যান্য'),
(121, 'students_of_class', 'Students Of Class', 'ক্লাস ছাত্রদের'),
(122, 'marks_obtained', 'Marks Obtained', 'প্রাপ্ত নম্বর'),
(123, 'attendance_for_class', 'Attendance For Class', 'এ্যাটেনডেন্স বর্গ জন্য'),
(124, 'receiver', 'Receiver', 'গ্রাহক'),
(125, 'please_select_receiver', 'Please Select Receiver', 'দয়া করে রিসিভার নির্বাচন'),
(126, 'session_changed', 'Session Changed', 'সেশন পরিবর্তিত'),
(127, 'exam_marks', 'Exam Marks', 'পরীক্ষার মার্কস'),
(128, 'total_mark', 'Total Mark', 'মোট মার্ক'),
(129, 'mark_obtained', 'Mark Obtained', 'মার্ক প্রাপ্ত'),
(130, 'invoice/payment_list', 'Invoice / Payment List', 'ইনভয়েস / পেমেন্ট তালিকা'),
(131, 'obtained_marks', 'Obtained Marks', 'প্রাপ্ত মার্কস'),
(132, 'highest_mark', 'Highest Mark', 'সর্বোচ্চ মার্ক'),
(133, 'grade', 'Grade (GPA)', 'শ্রেণী'),
(134, 'dashboard', 'Dashboard', 'ড্যাশবোর্ড'),
(135, 'student', 'Student', 'ছাত্র'),
(136, 'rename', 'Rename', 'নামান্তর'),
(137, 'class', 'Class', 'শ্রেণী'),
(138, 'teacher', 'Teacher', 'শিক্ষক'),
(139, 'parents', 'Parents', 'মাতাপিতা'),
(140, 'subject', 'Subject', 'বিষয়'),
(141, 'student_attendance', 'Student Attendance', 'ছাত্র উপস্থিতি'),
(142, 'exam_list', 'Exam List', 'পরীক্ষার তালিকা'),
(143, 'grades_range', 'Grades Range', 'গ্রেড পরিসীমা'),
(144, 'loading', 'Loading', 'বোঝাই'),
(145, 'library', 'Library', 'লাইব্রেরি'),
(146, 'hostel', 'Hostel', 'ছাত্রাবাস'),
(147, 'events', 'Events', 'সূচনাফলক'),
(148, 'message', 'Message', 'বার্তা'),
(149, 'translations', 'Translations', 'অনুবাদের'),
(150, 'account', 'Account', 'হিসাব'),
(151, 'selected_session', 'Selected Session', 'নির্বাচিত সেশন'),
(152, 'change_password', 'Change Password', 'পাসওয়ার্ড পরিবর্তন করুন'),
(153, 'section', 'Section', 'অধ্যায়'),
(154, 'edit', 'Edit', 'সম্পাদন করা'),
(155, 'delete', 'Delete', 'মুছে ফেলা'),
(156, 'cancel', 'Cancel', 'বাতিল'),
(157, 'parent', 'Parent', 'মাতা'),
(158, 'attendance', 'Attendance', 'উপস্থিতি'),
(159, 'addmission_form', 'Admission Form', 'ভর্তির ফর্ম'),
(160, 'name', 'Name', 'নাম'),
(161, 'select', 'Select', 'নির্বাচন করা'),
(162, 'roll', 'Roll', 'রোল'),
(163, 'birthday', 'Date Of Birth', 'জন্ম তারিখ'),
(164, 'gender', 'Gender', 'লিঙ্গ'),
(165, 'male', 'Male', 'পুরুষ'),
(166, 'female', 'Female', 'মহিলা'),
(167, 'address', 'Address', 'ঠিকানা'),
(168, 'phone', 'Phone', 'ফোন'),
(169, 'email', 'Email', 'ই-মেইল'),
(170, 'password', 'Password', 'পাসওয়ার্ড'),
(171, 'transport_route', 'Transport Route', 'পরিবহন রুট'),
(172, 'photo', 'Photo', 'ছবি'),
(173, 'select_class', 'Select Class', 'ক্লাস নির্বাচন'),
(174, 'username_password_incorrect', 'Username Or Password Is Incorrect', 'ব্যাবহারকারীর নাম অথবা গোপন নাম্বারটি ভুল'),
(175, 'select_section', 'Select Section', 'অনুচ্ছেদ নির্বাচন'),
(176, 'options', 'Options', 'বিকল্প'),
(177, 'mark_sheet', 'Mark Sheet', 'নাম্বার শিট'),
(178, 'profile', 'Profile', 'প্রোফাইলে'),
(179, 'select_all', 'Select All', 'সবগুলো নির্বাচন করা'),
(180, 'select_none', 'Select None', 'কিছুই না'),
(181, 'average', 'Average', 'গড়'),
(182, 'transfer', 'Transfer', 'হস্তান্তর'),
(183, 'edit_teacher', 'Edit Teacher', 'গুরু সম্পাদনা'),
(184, 'sex', 'Sex', 'লিঙ্গ'),
(185, 'marksheet_for', 'Marksheet For', 'মার্ক শীট'),
(186, 'total_marks', 'Total Marks', 'মোট মার্কস'),
(187, 'parent_phone', 'Parent Phone', 'পেরেন্ট ফোন'),
(188, 'subject_author', 'Subject Author', 'বিষয় লেখক'),
(189, 'update', 'Update', 'হালনাগাদ'),
(190, 'class_list', 'Class List', 'ক্লাস তালিকা'),
(191, 'class_name', 'Class Name', 'শ্রেণির নাম'),
(192, 'name_numeric', 'Name Numeric', 'নাম সংখ্যাসূচক'),
(193, 'select_teacher', 'Select Teacher', 'গুরু নির্বাচন'),
(194, 'edit_class', 'Edit Class', 'ক্লাস সম্পাদনা'),
(195, 'section_name', 'Section Name', 'অনুচ্ছেদ নাম'),
(196, 'add_section', 'Add Section', 'অনুচ্ছেদ যোগ'),
(197, 'subject_list', 'Subject List', 'বিষয় তালিকা'),
(198, 'subject_name', 'Subject Name', 'বিষয় নাম'),
(199, 'edit_subject', 'Edit Subject', 'বিষয় সম্পাদনা'),
(200, 'day', 'Day', 'দিন'),
(201, 'starting_time', 'Starting Time', 'সময় শুরু'),
(202, 'hour', 'Hour', 'ঘন্টা'),
(203, 'minutes', 'Minutes', 'মিনিট'),
(204, 'ending_time', 'Ending Time', 'সময় শেষ'),
(205, 'select_subject', 'Select Subject', 'বিষয় নির্বাচন করুন'),
(206, 'select_date', 'Select Date', 'তারিখ নির্বাচন করুন'),
(207, 'select_month', 'Select Month', 'মাস নির্বাচন করুন'),
(208, 'select_year', 'Select Year', 'নির্বাচন বছর'),
(209, 'add_language', 'Add Language', 'ভাষা যোগ করুন'),
(210, 'exam_name', 'Exam Name', 'পরীক্ষার নাম'),
(211, 'date', 'Date', 'তারিখ'),
(212, 'comment', 'Comment', 'মন্তব্য'),
(213, 'edit_exam', 'Edit Exam', 'পরীক্ষার সম্পাদনা'),
(214, 'grade_list', 'Grade List', 'গ্রেড তালিকা'),
(215, 'grade_name', 'Grade Name', 'গ্রেড নাম'),
(216, 'grade_point', 'Grade Point', 'গ্রেড পয়েন্ট'),
(217, 'select_exam', 'Select Exam', 'পরীক্ষার নির্বাচন'),
(218, 'students', 'Students', 'শিক্ষার্থীরা'),
(219, 'subjects', 'Subjects', 'প্রজাদের'),
(220, 'total', 'Total', 'মোট'),
(221, 'select_academic_session', 'Select Academic Session', 'একাডেমিক সেশন নির্বাচন'),
(222, 'invoice_informations', 'Invoice Informations', 'চালান ইনফরমেশন'),
(223, 'title', 'Title', 'খেতাব'),
(224, 'description', 'Description', 'বিবরণ'),
(225, 'payment_informations', 'Payment Informations', 'পেমেন্ট তথ্য'),
(226, 'view_invoice', 'View Invoice', 'দেখুন চালান'),
(227, 'payment_to', 'Payment To', 'পরিশোদ করা'),
(228, 'bill_to', 'Bill To', 'বিল করতে'),
(229, 'total_amount', 'Total Amount', 'সর্বমোট পরিমাণ'),
(230, 'paid_amount', 'Paid Amount', 'দেওয়া পরিমাণ'),
(231, 'due', 'Due', 'দরুন'),
(232, 'amount_paid', 'Amount Paid', 'পরিমাণ অর্থ প্রদান করা'),
(233, 'payment_successfull', 'Payment has been successful', 'পেমেন্ট সফল হয়েছে'),
(234, 'add_invoice/payment', 'Add Invoice/payment', 'ইনভয়েস / পেমেন্ট যোগ'),
(235, 'invoices', 'Invoices', 'ইনভয়েস বা চালান'),
(236, 'action', 'Action', 'কর্ম'),
(237, 'required', 'Required', 'প্রয়োজনীয়'),
(238, 'info', 'Info', 'তথ্য'),
(239, 'month', 'Month', 'মাস'),
(240, 'details', 'Details', 'বিস্তারিত'),
(241, 'new', 'New', 'নতুন'),
(242, 'reply_message', 'Reply Message', 'বার্তা উত্তর'),
(243, 'message_sent', 'Message Sent', 'বার্তা পাঠানো'),
(244, 'search', 'Search', 'অনুসন্ধান'),
(245, 'religion', 'Religion', 'ধর্ম'),
(246, 'blood_group', 'Blood group', 'রক্তের গ্রুপ'),
(247, 'database_backup', 'Database Backup', 'ডাটাবেজ ব্যাকআপ'),
(248, 'search', 'Search', 'অনুসন্ধান'),
(249, 'payments_history', 'Fees Pay / Invoice', 'ফি পরিশোধ / চালান'),
(250, 'message_restore', 'Message Restore', 'বার্তা পুনরুদ্ধার'),
(251, 'write_new_message', 'Write New Message', 'নতুন বার্তা লিখতে'),
(252, 'attendance_sheet', 'Attendance Sheet', 'এ্যাটেনডেন্স শীট'),
(253, 'holiday', 'Holiday', 'ছুটির দিন'),
(254, 'exam', 'Exam', 'পরীক্ষা'),
(255, 'successfully', 'Successfully', 'সফলভাবে'),
(256, 'admin', 'Admin', 'অ্যাডমিন'),
(257, 'inbox', 'Inbox', 'ইনবক্স'),
(258, 'sent', 'Sent', 'প্রেরিত'),
(259, 'important', 'Important', 'গুরুত্বপূর্ণ'),
(260, 'trash', 'Trash', 'আবর্জনা'),
(261, 'error', 'Unsuccessful', 'ব্যার্থ'),
(262, 'sessions_list', 'Sessions List', 'সেশন তালিকা'),
(263, 'session_settings', 'Session Settings', 'সেশন সেটিংস'),
(264, 'add_designation', 'Add Designation', 'পদবী যোগ করুন'),
(265, 'users', 'Users', 'ব্যবহারকারীরা'),
(266, 'librarian', 'Librarian', 'গ্রন্থাগারিক'),
(267, 'accountant', 'Accountant', 'হিসাবরক্ষক'),
(268, 'academics', 'Academics', 'বিদ্যালয় সংক্রান্ত'),
(269, 'employees_attendance', 'Employees Attendance', 'কর্মচারী উপস্থিতি'),
(270, 'set_exam_term', 'Set Exam Term', 'টার্ম সেট করুন'),
(271, 'set_attendance', 'Set Attendance', 'উপস্থিতি সেট করুন'),
(272, 'marks', 'Marks', 'মার্কস'),
(273, 'books_category', 'Books Category', 'বই বিভাগ'),
(274, 'transport', 'Transport', 'পরিবহন'),
(275, 'fees', 'Fees', 'ফি'),
(276, 'fees_allocation', 'Fees Allocation', 'ফি বরাদ্দকরণ'),
(277, 'fee_category', 'Fee Category', 'ফি বিভাগ'),
(278, 'report', 'Report', 'প্রতিবেদন'),
(279, 'employee', 'Employee', 'কর্মচারী'),
(280, 'invoice', 'Invoice', 'চালান'),
(281, 'event_catalogue', 'Event Catalogue', 'ইভেন্ট ক্যাটালগ'),
(282, 'total_paid', 'Total Paid', 'মোট দেওয়া'),
(283, 'total_due', 'Total Due', 'মোট বাকি'),
(284, 'fees_collect', 'Fees Collect', 'ফি সংগ্রহ'),
(285, 'total_school_students_attendance', 'Total School Students Attendance', 'মোট স্কুলের ছাত্র উপস্থিতি'),
(286, 'overview', 'Overview', 'সংক্ষিপ্ত বিবরণ'),
(287, 'currency_symbol', 'Currency Symbol', 'মুদ্রা প্রতীক'),
(288, 'enable', 'Enable', 'সক্ষম করা'),
(289, 'disable', 'Disable', 'অক্ষম'),
(290, 'payment_settings', 'Payment Settings', 'পেমেন্ট সেটিংস'),
(291, 'student_attendance_report', 'Student Attendance Report', 'ছাত্র উপস্থিতি রিপোর্ট'),
(292, 'attendance_type', 'Attendance Type', 'উপস্থিতি প্রকার'),
(293, 'late', 'Late', 'বিলম্বে'),
(294, 'employees_attendance_report', 'Employees Attendance Report', 'কর্মচারী উপস্থিতি রিপোর্ট'),
(295, 'attendance_report_of', 'Attendance Report Of', 'উপস্থিতি রিপোর্ট'),
(296, 'fee_paid_report', 'Fee Paid Report', 'ফি প্রদান প্রতিবেদন'),
(297, 'invoice_no', 'Invoice No', 'চালান নং'),
(298, 'payment_mode', 'Payment Mode', 'পরিশোধের মাধ্যম'),
(299, 'payment_type', 'Payment Type', 'পেমেন্ট টাইপ'),
(300, 'done', 'Done', 'সম্পন্ন'),
(301, 'select_fee_category', 'Select Fee Category', 'ফি বিভাগ নির্বাচন করুন'),
(302, 'discount', 'Discount', 'ডিসকাউন্ট'),
(303, 'enter_discount_amount', 'Enter Discount Amount', 'ছাড়ের পরিমাণ লিখুন'),
(304, 'online_payment', 'Online Payment', 'দূরবর্তী অর্থ প্রদান'),
(305, 'student_name', 'Student Name', 'শিক্ষার্থীর নাম'),
(306, 'invoice_history', 'Invoice History', 'চালান ইতিহাস'),
(307, 'discount_amount', 'Discount Amount', 'হ্রাসকৃত মুল্য'),
(308, 'invoice_list', 'Invoice List', 'চালান তালিকা'),
(309, 'partly_paid', 'Partly Paid', 'আংশিক পরিশোধিত'),
(310, 'fees_list', 'Fees List', 'ফি তালিকা'),
(311, 'voucher_id', 'Voucher ID', 'ভউচার আইডি'),
(312, 'transaction_date', 'Transaction Date', 'লেনদেন তারিখ'),
(313, 'admission_date', 'Admission Date', 'ভর্তির তারিখ'),
(314, 'user_status', 'User Status', 'ব্যবহারকারীর স্থিতি'),
(315, 'nationality', 'Nationality', 'জাতীয়তা'),
(316, 'register_no', 'Register No', 'রেজিস্টার নং'),
(317, 'first_name', 'First Name', 'প্রথম নাম'),
(318, 'last_name', 'Last Name', 'নামের শেষাংশ'),
(319, 'state', 'State', 'রাষ্ট্র'),
(320, 'transport_vehicle_no', 'Transport Vehicle No', 'পরিবহন যানবাহন নং'),
(321, 'percent', 'Percent', 'শতাংশ'),
(322, 'average_result', 'Average Result', 'গড় ফলাফল'),
(323, 'student_category', 'Student Category', 'ছাত্র বিভাগ'),
(324, 'category_name', 'Category Name', 'বিভাগ নাম'),
(325, 'category_list', 'Category List', 'বিভাগ তালিকা'),
(326, 'please_select_student_first', 'Please Select Students First', 'প্রথমে ছাত্রদের দয়া করে নির্বাচন করুন'),
(327, 'designation', 'Designation', 'উপাধি'),
(328, 'qualification', 'Qualification', 'যোগ্যতা'),
(329, 'account_deactivated', 'Account Deactivated', 'অ্যাকাউন্ট নিষ্ক্রিয়'),
(330, 'account_activated', 'Account Activated', 'অ্যাকাউন্ট সক্রিয়'),
(331, 'designation_list', 'Designation List', 'পদবী তালিকা'),
(332, 'joining_date', 'Joining Date', 'যোগদান তারিখ'),
(333, 'relation', 'Relation', 'সম্পর্ক'),
(334, 'father_name', 'Father Name', 'বাবার নাম'),
(335, 'librarian_list', 'Librarian List', 'গ্রন্থাগারিক তালিকা'),
(336, 'class_numeric', 'Class Numeric', 'ক্লাস সাংখ্যিক'),
(337, 'maximum_students', 'Maximum Students', 'সর্বোচ্চ ছাত্র'),
(338, 'class_room', 'Class Room', 'ক্লাস রুমে'),
(339, 'pass_mark', 'Pass Mark', 'পাশ নম্বর'),
(340, 'exam_time', 'Exam Time (Min)', 'পরীক্ষার সময় (মিনিট)'),
(341, 'time', 'Time', 'সময়'),
(342, 'subject_code', 'Subject Code', 'বিষয় কোড'),
(343, 'full_mark', 'Full Mark', 'পুরো নম্বর'),
(344, 'subject_type', 'Subject Type', 'বিষয় প্রকার'),
(345, 'date_of_publish', 'Date Of Publish', 'প্রকাশের তারিখ'),
(346, 'file_name', 'File Name', 'ফাইলের নাম'),
(347, 'students_list', 'Students List', 'ছাত্র তালিকা'),
(348, 'start_date', 'Start Date', 'শুরুর তারিখ'),
(349, 'end_date', 'End Date', 'শেষ তারিখ'),
(350, 'term_name', 'Term Name', 'টার্ম নাম'),
(351, 'grand_total', 'Grand Total', 'সর্বমোট'),
(352, 'result', 'Result', 'ফল'),
(353, 'books_list', 'Books List', 'বই তালিকা'),
(354, 'book_isbn_no', 'Book ISBN No', 'বই ISBN নং'),
(355, 'total_stock', 'Total Stock', 'মোট স্টক'),
(356, 'issued_copies', 'Issued Copies', 'ইস্যু করা কপি'),
(357, 'publisher', 'Publisher', 'প্রকাশক'),
(358, 'books_issue', 'Books Issue', 'বই ইস্যু'),
(359, 'user', 'User', 'ব্যবহারকারী'),
(360, 'fine', 'Fine', 'জরিমানা'),
(361, 'pending', 'Pending', 'অনিষ্পন্ন'),
(362, 'return_date', 'Return Date', 'প্রত্যাবর্তন তারিখ'),
(363, 'accept', 'Accept', 'গ্রহণ করা'),
(364, 'reject', 'Reject', 'প্রত্যাখ্যান'),
(365, 'issued', 'Issued', 'ইস্যু করা'),
(366, 'return', 'Return', 'প্রত্যাবর্তন'),
(367, 'renewal', 'Renewal', 'পুনরারম্ভ'),
(368, 'fine_amount', 'Fine Amount', 'জরিমানা পরিমাণ'),
(369, 'password_mismatch', 'Password Mismatch', 'পাসওয়ার্ড মেলেনি'),
(370, 'settings_updated', 'Settings Update', 'সেটিংস আপডেট করুন'),
(371, 'pass', 'Pass', 'পাস'),
(372, 'event_to', 'Event To', 'ইভেন্টের জন্য'),
(373, 'all_users', 'All Users', 'সকল ব্যবহারকারী'),
(374, 'employees_list', 'Employees List', 'কর্মচারী তালিকা'),
(375, 'on', 'On', 'উপর'),
(376, 'timezone', 'Timezone', 'সময় অঞ্চল'),
(377, 'get_result', 'Get Result', 'ফলাফল পেতে'),
(378, 'apply', 'Apply', 'প্রয়োগ করা'),
(379, 'hrm', 'Human Resource', 'মানব সম্পদ'),
(380, 'payroll', 'Payroll', 'বেতনের'),
(381, 'salary_assign', 'Salary Assign', 'বেতন বরাদ্দ'),
(382, 'employee_salary', 'Payment Salary', 'পেমেন্ট বেতন'),
(383, 'application', 'Application', 'আবেদন'),
(384, 'award', 'Award', 'পুরস্কার'),
(385, 'basic_salary', 'Basic Salary', 'মূল বেতন'),
(386, 'employee_name', 'Employee Name', 'কর্মকর্তার নাম'),
(387, 'name_of_allowance', 'Name Of Allowance', 'ভাতা নাম'),
(388, 'name_of_deductions', 'Name Of Deductions', 'কর্তনের নাম'),
(389, 'all_employees', 'All Employees', 'সমস্ত কর্মচারী'),
(390, 'total_allowance', 'Total Allowance', 'মোট ভাতা'),
(391, 'total_deduction', 'Total Deductions', 'মোট কর্তন'),
(392, 'net_salary', 'Net Salary', 'মোট বেতন'),
(393, 'payslip', 'Payslip', 'স্লিপে'),
(394, 'days', 'Days', 'দিন'),
(395, 'category_name_already_used', 'Category Name Already Used', 'বিভাগের নাম ইতিমধ্যে ব্যবহৃত'),
(396, 'leave_list', 'Leave List', 'তালিকা ছেড়ে'),
(397, 'leave_category', 'Leave Category', 'বিভাগ ছেড়ে'),
(398, 'applied_on', 'Applied On', 'প্রয়োগ করা'),
(399, 'accepted', 'Accepted', 'গৃহীত'),
(400, 'leave_statistics', 'Leave Statistics', 'ছুটি পরিসংখ্যান'),
(401, 'leave_type', 'Leave Type', 'ছুটি টাইপ'),
(402, 'reason', 'Reason', 'কারণ'),
(403, 'close', 'Close', 'বন্ধ'),
(404, 'give_award', 'Give Award', 'পুরস্কার দাও'),
(405, 'list', 'List', 'তালিকা'),
(406, 'award_name', 'Award Name', 'পুরস্কারের নাম'),
(407, 'gift_item', 'Gift Item', 'উপহার আইটেম'),
(408, 'cash_price', 'Cash Price', 'নগদ মূল্য'),
(409, 'award_reason', 'Award Reason', 'পুরস্কার কারণ'),
(410, 'given_date', 'Given Date', 'প্রদত্ত তারিখ'),
(411, 'apply_leave', 'Apply Leave', 'ছুটি প্রয়োগ করুন'),
(412, 'leave_application', 'Leave Application', 'ছুটি আবেদন'),
(413, 'allowances', 'Allowances', 'তৃপ্তি'),
(414, 'add_more', 'Add More', 'আরো যোগ করো'),
(415, 'deductions', 'Deductions', 'কর্তন'),
(416, 'salary_details', 'Salary Details', 'বেতন বিবরণ'),
(417, 'salary_month', 'Salary Month', 'বেতন মাস'),
(418, 'leave_data_update_successfully', 'Leave Data Updated Successfully', 'ছুটি ডেটা সফলভাবে আপডেট করা হয়েছে'),
(419, 'fees_history', 'Fees History', 'ফি ইতিহাস'),
(420, 'bank_name', 'Bank Name', 'ব্যাংকের নাম'),
(421, 'branch', 'Branch', 'শাখা'),
(422, 'bank_address', 'Bank Address', 'ব্যাংকের ঠিকানা'),
(423, 'ifsc_code', 'IFSC Code', 'আইএফসিসি কোড'),
(424, 'account_no', 'Account No', 'হিসাব নাম্বার'),
(425, 'add_bank', 'Add Bank', 'ব্যাংক জুড়ুন'),
(426, 'account_name', 'Account Holder', 'হিসাবের নাম'),
(427, 'database_backup_completed', 'Database Backup Completed', 'ডাটাবেস ব্যাকআপ সম্পন্ন'),
(428, 'restore_database', 'Restore Database', 'ডাটাবেস পুনঃস্থাপন'),
(429, 'template', 'Template', 'টেমপ্লেট'),
(430, 'time_and_date', 'Time And Date', 'সময় এবং তারিখ'),
(431, 'everyone', 'Everyone', 'সবাই'),
(432, 'invalid_amount', 'Invalid Amount', 'অকার্যকর পরিমাণ'),
(433, 'leaving_date_is_not_available_for_you', 'Leaving Date Is Not Available For You', 'তারিখ রেখে আপনার জন্য উপলব্ধ নয়'),
(434, 'animations', 'Animations', 'অ্যানিমেশন'),
(435, 'email_settings', 'Email Settings', 'ইমেল সেটিংস'),
(436, 'deduct_month', 'Deduct Month', 'কেটে মাস'),
(437, 'no_employee_available', 'No Employee Available', 'কোন কর্মচারী প্রাপ্তিসাধ্য'),
(438, 'advance_salary_application_submitted', 'Advance Salary Application Submitted', 'অগ্রিম বেতন আবেদন জমা'),
(439, 'date_format', 'Date Format', 'তারিখ বিন্যাস'),
(440, 'id_card_generate', 'ID Card Generate', 'আইডি কার্ড তৈরি করুন'),
(441, 'issue_salary', 'Issue Salary', 'বেতন ইস্যু'),
(442, 'advance_salary', 'Advance Salary', 'বেতন অগ্রিম'),
(443, 'logo', 'Logo', 'লোগো'),
(444, 'book_request', 'Book Request', 'বই অনুরোধ'),
(445, 'reporting', 'Reporting', 'প্রতিবেদন'),
(446, 'paid_salary', 'Paid Salary', 'বেতন দেওয়া'),
(447, 'due_salary', 'Due Salary', 'বাকি বেতন'),
(448, 'route', 'Route', 'রুট'),
(449, 'academic_details', 'Academic Details', 'একাডেমিক বিবরণ'),
(450, 'guardian_details', 'Guardian Details', 'অভিভাবক বিস্তারিত'),
(451, 'due_amount', 'Due Amount', 'বাকি টাকা'),
(452, 'fee_due_report', 'Fee Due Report', 'ফি প্রতিবেদনের রিপোর্ট'),
(453, 'other_details', 'Other Details', 'অন্যান্য বিস্তারিত'),
(454, 'last_exam_report', 'Last Exam Report', 'শেষ পরীক্ষার রিপোর্ট'),
(455, 'book_issued', 'Book Issued', 'বই ইস্যু করা'),
(456, 'interval_month', 'Interval 30 Days', 'অন্তর 30 দিন'),
(457, 'attachments', 'Attachments', 'সংযুক্তিসমূহ'),
(458, 'fees_payment', 'Fees Payment', 'ফি প্রদান'),
(459, 'fees_summary', 'Fees Summary', 'ফি সংক্ষিপ্ত বিবরণ'),
(460, 'total_fees', 'Total Fees', 'মোট ফি'),
(461, 'weekend_attendance_inspection', 'Weekend Attendance Inspection', 'সপ্তাহান্তে উপস্থিতি পরিদর্শন'),
(462, 'book_issued_list', 'Book Issued List', 'বুক ইস্যু তালিকা'),
(463, 'lose_your_password', 'Lose Your Password?', 'আপনার পাসওয়ার্ড হারান?'),
(464, 'all_branch_dashboard', 'All Branch Dashboard', 'সমস্ত শাখা ড্যাশবোর্ড'),
(465, 'academic_session', 'Academic Session', 'একাডেমিক সেশন'),
(466, 'all_branches', 'All Branches', 'সমস্ত শাখা'),
(467, 'admission', 'Admission', 'ভর্তি'),
(468, 'create_admission', 'Create Admission', 'ভর্তি তৈরি করুন'),
(469, 'multiple_import', 'Multiple Import', 'একাধিক আমদানি'),
(470, 'student_details', 'Student Details', 'ছাত্র বিস্তারিত'),
(471, 'student_list', 'Student List', 'ছাত্র তালিকা'),
(472, 'login_deactivate', 'Login Deactivate', 'লগইন নিষ্ক্রিয় করুন'),
(473, 'parents_list', 'Parents List', 'পিতামাতার তালিকা'),
(474, 'add_parent', 'Add Parent', 'মূল যোগ করুন'),
(475, 'employee_list', 'Employee List', 'কর্মচারী তালিকা'),
(476, 'add_department', 'Add Department', 'বিভাগ যোগ করুন'),
(477, 'add_employee', 'Add Employee', 'কর্মচারী যোগ করুন'),
(478, 'salary_template', 'Salary Template', 'বেতন টেমপ্লেট'),
(479, 'salary_payment', 'Salary Payment', 'বেতন পেমেন্ট'),
(480, 'payroll_summary', 'Payroll Summary', 'বেতন সারসংক্ষেপ'),
(481, 'academic', 'Academic', 'বিদ্যালয় সংক্রান্ত'),
(482, 'control_classes', 'Control Classes', 'নিয়ন্ত্রণ ক্লাস'),
(483, 'assign_class_teacher', 'Assign Class Teacher', 'ক্লাস শিক্ষক নিয়োগ\n\n'),
(484, 'class_assign', 'Class Assign', 'ক্লাস বরাদ্দ'),
(485, 'assign', 'Assign', 'দায়িত্ব অর্পণ করা'),
(486, 'promotion', 'Promotion', 'পদোন্নতি'),
(487, 'attachments_book', 'Attachments Book', 'সংযুক্তি বই'),
(488, 'upload_content', 'Upload Content', 'আপলোড কন্টেন্ট'),
(489, 'attachment_type', 'Attachment Type', 'সংযুক্তি প্রকার'),
(490, 'exam_master', 'Exam Master', 'পরীক্ষা মাস্টার'),
(491, 'exam_hall', 'Exam Hall', 'পরীক্ষা হল'),
(492, 'mark_entries', 'Mark Entries', 'মার্ক এন্ট্রি'),
(493, 'tabulation_sheet', 'Tabulation Sheet', 'ট্যাবলেট শীট'),
(494, 'supervision', 'Supervision', 'রক্ষণাবেক্ষণ'),
(495, 'hostel_master', 'Hostel Master', 'হোস্টেল মাস্টার'),
(496, 'hostel_room', 'Hostel Room', 'হোস্টেল রুম'),
(497, 'allocation_report', 'Allocation Report', 'বরাদ্দ রিপোর্ট'),
(498, 'route_master', 'Route Master', 'রুট মাস্টার'),
(499, 'vehicle_master', 'Vehicle Master', 'যানবাহন মাস্টার'),
(500, 'stoppage', 'Stoppage', 'বিরতি'),
(501, 'assign_vehicle', 'Assign Vehicle', 'যানবাহন বরাদ্দ করুন'),
(502, 'reports', 'Reports', 'প্রতিবেদন'),
(503, 'books_entry', 'Books Entry', 'বই এন্ট্রি'),
(504, 'event_type', 'Event Type', 'ইভেন্টের ধরণ'),
(505, 'add_events', 'Add Events', 'ইভেন্ট যোগ করুন'),
(506, 'student_accounting', 'Student Accounting', 'ছাত্র অ্যাকাউন্টিং'),
(507, 'create_single_invoice', 'Create Single Invoice', 'একক চালান মোট রুট তৈরি করুন'),
(508, 'create_multi_invoice', 'Create Multi Invoice', 'মাল্টি চালান তৈরি করুন'),
(509, 'summary_report', 'Summary Report', 'সারসংক্ষেপ প্রতিবেদন'),
(510, 'office_accounting', 'Office Accounting', 'অফিস একাউন্টিং'),
(511, 'under_group', 'Under Group', 'দলের অধীনে'),
(512, 'bank_account', 'Bank Account', 'ব্যাংক হিসাব'),
(513, 'ledger_account', 'Ledger Account', 'লেজার অ্যাকাউন্ট'),
(514, 'create_voucher', 'Create Voucher', 'ভাউচার তৈরি করুন'),
(515, 'day_book', 'Day Book', 'জাবেদা'),
(516, 'cash_book', 'Cash Book', 'নগদ বই'),
(517, 'bank_book', 'Bank Book', 'ব্যাংক বই'),
(518, 'ledger_book', 'Ledger Book', 'খতিয়ান বই'),
(519, 'trial_balance', 'Trial Balance', 'ট্রায়াল ব্যালেন্স'),
(520, 'settings', 'Settings', 'স্থাপন'),
(521, 'sms_settings', 'Sms Settings', 'এসএমএস সেটিংস'),
(522, 'cash_book_of', 'Cash Book Of', 'ক্যাশ বুক'),
(523, 'by_cash', 'By Cash', 'নগদে'),
(524, 'by_bank', 'By Bank', 'ব্যাংক দ্বারা'),
(525, 'total_strength', 'Total Strength', 'মোট শক্তি'),
(526, 'teachers', 'Teachers', 'শিক্ষক'),
(527, 'student_quantity', 'Student Quantity', 'ছাত্র পরিমাণ'),
(528, 'voucher', 'Voucher', 'রসিদ'),
(529, 'total_number', 'Total Number', 'মোট সংখ্যা'),
(530, 'total_route', 'Total Route', 'মোট রুট'),
(531, 'total_room', 'Total Room', 'মোট কক্ষ'),
(532, 'amount', 'Amount', 'পরিমাণ'),
(533, 'branch_dashboard', 'Branch Dashboard', 'শাখা ড্যাশবোর্ড'),
(534, 'branch_list', 'Branch List', 'শাখা তালিকা'),
(535, 'create_branch', 'Create Branch', 'শাখা তৈরি করুন'),
(536, 'branch_name', 'Branch Name', 'শাখার নাম'),
(537, 'school_name', 'School Name', 'স্কুল নাম'),
(538, 'mobile_no', 'Mobile No', 'মোবাইল নাম্বার'),
(539, 'symbol', 'Symbol', 'পরিমাণ'),
(540, 'city', 'City', 'শহর'),
(541, 'academic_year', 'Academic Year', 'একাডেমিক বছর'),
(542, 'select_branch_first', 'First Select The Branch', 'প্রথমে শাখা নির্বাচন করুন'),
(543, 'select_class_first', 'Select Class First', 'ক্লাস প্রথম নির্বাচন করুন'),
(544, 'select_country', 'Select Country', 'দেশ নির্বাচন করুন'),
(545, 'mother_tongue', 'Mother Tongue', 'মাতৃভাষা'),
(546, 'caste', 'Caste', 'বর্ণ'),
(547, 'present_address', 'Present Address', 'বর্তমান ঠিকানা'),
(548, 'permanent_address', 'Permanent Address', 'স্থায়ী ঠিকানা'),
(549, 'profile_picture', 'Profile Picture', 'প্রোফাইল ছবি'),
(550, 'login_details', 'Login Details', 'লগ ইন তথ্য'),
(551, 'retype_password', 'Retype Password', 'পাসওয়ার্ড আবার টাইপ'),
(552, 'occupation', 'Occupation', 'পেশা'),
(553, 'income', 'Income', 'আয়'),
(554, 'education', 'Education', 'শিক্ষা'),
(555, 'first_select_the_route', 'First Select The Route', 'প্রথম রুট নির্বাচন করুন'),
(556, 'hostel_details', 'Hostel Details', 'হোটেল বিবরণ'),
(557, 'first_select_the_hostel', 'First Select The Hostel', 'প্রথম ছাত্রাবাস নির্বাচন'),
(558, 'previous_school_details', 'Previous School Details', 'পূর্ববর্তী স্কুল বিবরণ'),
(559, 'book_name', 'Book Name', 'বইয়ের নাম'),
(560, 'select_ground', 'Select Ground', 'গ্রাউন্ড নির্বাচন করুন'),
(561, 'import', 'Import', 'আমদানি'),
(562, 'add_student_category', 'Add Student Category', 'ছাত্র বিভাগ যোগ করুন'),
(563, 'id', 'Id', 'আইডি'),
(564, 'edit_category', 'Edit Category', 'বিভাগ সম্পাদনা করুন'),
(565, 'deactivate_account', 'Deactivate Account', 'অ্যাকাউন্ট নিষ্ক্রিয় করুন'),
(566, 'all_sections', 'All Sections', 'সব বিভাগ'),
(567, 'authentication_activate', 'Authentication Activate', 'প্রমাণীকরণ সক্রিয় করুন'),
(568, 'department', 'Department', 'বিভাগ'),
(569, 'salary_grades', 'Salary Grades', 'বেতন গ্রেড'),
(570, 'overtime', 'Overtime Rate (Per Hour)', 'ওভারটাইম হার (প্রতি ঘন্টা)'),
(571, 'salary_grade', 'Salary Grade', 'বেতন গ্রেড'),
(572, 'payable_type', 'Payable Type', 'প্রদেয় প্রকার'),
(573, 'edit_type', 'Edit Type', 'টাইপ সম্পাদনা করুন'),
(574, 'role', 'Role', 'ভূমিকা'),
(575, 'remuneration_info_for', 'Remuneration Info For', 'বেতন জন্য তথ্য'),
(576, 'salary_paid', 'Salary Paid', 'বেতন দেওয়া'),
(577, 'salary_unpaid', 'Salary Unpaid', 'বেতন পরিশোধ না'),
(578, 'pay_now', 'Pay Now', 'এখন পরিশোধ করুন'),
(579, 'employee_role', 'Employee Role', 'কর্মচারী ভূমিকা'),
(580, 'create_at', 'Create At', 'এ তৈরি করুন'),
(581, 'select_employee', 'Select Employee', 'কর্মচারী নির্বাচন করুন'),
(582, 'review', 'Review', 'পর্যালোচনা'),
(583, 'reviewed_by', 'Reviewed By', 'দ্বারা পর্যালোচনা'),
(584, 'submitted_by', 'Submitted By', 'দ্বারা জমা দেওয়া'),
(585, 'employee_type', 'Employee Type', 'কর্মচারী টাইপ'),
(586, 'approved', 'Approved', 'অনুমোদিত'),
(587, 'unreviewed', 'Unreviewed', 'পর্যালোচনা না করা'),
(588, 'creation_date', 'Creation Date', 'তৈরির তারিখ'),
(589, 'no_information_available', 'No Information Available', 'কোন তথ্য নেই'),
(590, 'continue_to_payment', 'Continue To Payment', 'পেমেন্ট অবিরত'),
(591, 'overtime_total_hour', 'Overtime Total Hour', 'ওভারটাইম মোট ঘন্টা'),
(592, 'overtime_amount', 'Overtime Amount', 'ওভারটাইম পরিমাণ'),
(593, 'remarks', 'Remarks', 'মন্তব্য'),
(594, 'view', 'View', 'দৃশ্য'),
(595, 'leave_appeal', 'Leave Appeal', 'আবেদন ছেড়ে'),
(596, 'create_leave', 'Create Leave', 'ছুটি তৈরি করুন'),
(597, 'user_role', 'User Role', 'ব্যবহারকারী ভূমিকা'),
(598, 'date_of_start', 'Date Of Start', 'শুরু তারিখ'),
(599, 'date_of_end', 'Date Of End', 'শেষ তারিখ'),
(600, 'winner', 'Winner', 'বিজয়ী'),
(601, 'select_user', 'Select User', 'ব্যবহারকারী নির্বাচন করুন'),
(602, 'create_class', 'Create Class', 'ক্লাস তৈরি করুন'),
(603, 'class_teacher_allocation', 'Class Teacher Allocation', 'ক্লাস শিক্ষক বরাদ্দ'),
(604, 'class_teacher', 'Class Teacher', 'শ্রেণী শিক্ষক'),
(605, 'create_subject', 'Create Subject', 'সাবজেক্ট তৈরি করুন'),
(606, 'select_multiple_subject', 'Select Multiple Subject', 'একাধিক বিষয় নির্বাচন করুন'),
(607, 'teacher_assign', 'Teacher Assign', 'শিক্ষক নিয়োগ'),
(608, 'teacher_assign_list', 'Teacher Assign List', 'শিক্ষক নিয়োগ তালিকা'),
(609, 'select_department_first', 'Select Department First', 'প্রথম বিভাগ নির্বাচন করুন'),
(610, 'create_book', 'Create Book', 'বই তৈরি করুন'),
(611, 'book_title', 'Book Title', 'বইয়ের শিরোনাম'),
(612, 'cover', 'Cover', 'আবরণ'),
(613, 'edition', 'Edition', 'সংস্করণ'),
(614, 'isbn_no', 'ISBN No', 'আইএসবিএন নং'),
(615, 'purchase_date', 'Purchase Date', 'ক্রয় তারিখ'),
(616, 'cover_image', 'Cover Image', 'চিত্র কভার'),
(617, 'book_issue', 'Book Issue', 'বই ইস্যু'),
(618, 'date_of_issue', 'Date Of Issue', 'প্রদান এর তারিখ'),
(619, 'date_of_expiry', 'Date Of Expiry', 'মেয়াদ শেষ হওয়ার তারিখ'),
(620, 'select_category_first', 'Select Category First', 'প্রথম বিভাগ নির্বাচন করুন'),
(621, 'type_name', 'Type Name', 'নাম টাইপ করুন'),
(622, 'type_list', 'Type List', 'প্রকারের তালিকা'),
(623, 'icon', 'Icon', 'আইকন'),
(624, 'event_list', 'Event List', 'ইভেন্ট তালিকা'),
(625, 'create_event', 'Create Event', 'ইভেন্ট তৈরি করা'),
(626, 'type', 'Type', 'আদর্শ'),
(627, 'audience', 'Audience', 'শ্রোতা'),
(628, 'created_by', 'Created By', 'দ্বারা সৃষ্টি'),
(629, 'publish', 'Publish', 'প্রকাশ করা'),
(630, 'everybody', 'Everybody', 'সবাই'),
(631, 'selected_class', 'Selected Class', 'নির্বাচিত ক্লাস'),
(632, 'selected_section', 'Selected Section', 'নির্বাচিত বিভাগ'),
(633, 'information_has_been_updated_successfully', 'Information Has Been Updated Successfully', 'তথ্য সফলভাবে আপডেট হয়েছে Updated'),
(634, 'create_invoice', 'Create Invoice', 'চালান তৈরি করুন'),
(635, 'invoice_entry', 'Invoice Entry', 'চালানের এন্ট্রি'),
(636, 'quick_payment', 'Quick Payment', 'দ্রুত অর্থ প্রদান'),
(637, 'write_your_remarks', 'Write Your Remarks', 'আপনার মন্তব্য লিখুন'),
(638, 'reset', 'Reset', 'রিসেট'),
(639, 'fees_payment_history', 'Fees Payment History', 'ফি প্রদানের ইতিহাস'),
(640, 'fees_summary_report', 'Fees Summary Report', 'ফি সংক্ষিপ্তসার প্রতিবেদন'),
(641, 'add_account_group', 'Add Account Group', 'অ্যাকাউন্ট গ্রুপ যুক্ত করুন'),
(642, 'account_group', 'Account Group', 'অ্যাকাউন্ট গ্রুপ'),
(643, 'account_group_list', 'Account Group List', 'অ্যাকাউন্ট গ্রুপ তালিকা'),
(644, 'mailbox', 'Mailbox', 'ডাকবাক্স'),
(645, 'refresh_mail', 'Refresh Mail', 'রিফ্রেশ মেল'),
(646, 'sender', 'Sender', 'প্রেরকের'),
(647, 'general_settings', 'General Settings', 'সাধারণ সেটিংস'),
(648, 'institute_name', 'Institute Name', 'প্রতিষ্ঠানের নাম'),
(649, 'institution_code', 'Institution Code', 'প্রতিষ্ঠান কোড'),
(650, 'sms_service_provider', 'Sms Service Provider', 'এসএমএস পরিষেবা সরবরাহকারী'),
(651, 'footer_text', 'Footer Text', 'পাদচরণ'),
(652, 'payment_control', 'Payment Control', 'পেমেন্ট কন্ট্রোল'),
(653, 'sms_config', 'Sms Config', 'এসএমএস কনফিগার'),
(654, 'sms_triggers', 'Sms Triggers', 'এসএমএস ট্রিগার'),
(655, 'authentication_token', 'Authentication Token', 'প্রমাণীকরণ টোকেন'),
(656, 'sender_number', 'Sender Number', 'প্রেরকের নম্বর'),
(657, 'username', 'Username', 'ব্যবহারকারীর নাম'),
(658, 'api_key', 'Api Key', 'এপি কি'),
(659, 'authkey', 'Authkey', 'Authkey'),
(660, 'sender_id', 'Sender Id', 'প্রেরকের আইডি'),
(661, 'sender_name', 'Sender Name', 'প্রেরক নাম'),
(662, 'hash_key', 'Hash Key', 'হ্যাশ কী'),
(663, 'notify_enable', 'Notify Enable', 'সক্ষমকে অবহিত করুন'),
(664, 'exam_attendance', 'Exam Attendance', 'পরীক্ষার উপস্থিতি'),
(665, 'exam_results', 'Exam Results', 'পরীক্ষার ফলাফল'),
(666, 'email_config', 'Email Config', 'ইমেল কনফিগারেশন'),
(667, 'email_triggers', 'Email Triggers', 'ইমেল ট্রিগার'),
(668, 'account_registered', 'Account Registered', 'অ্যাকাউন্ট নিবন্ধিত'),
(669, 'forgot_password', 'Forgot Password', 'পাসওয়ার্ড ভুলে গেছেন'),
(670, 'new_message_received', 'New Message Received', 'নতুন বার্তা গৃহীত হয়েছে'),
(671, 'payslip_generated', 'Payslip Generated', 'পেইলিপ জেনারেটেড'),
(672, 'leave_approve', 'Leave Approve', 'ছাড়ুন'),
(673, 'leave_reject', 'Leave Reject', 'প্রত্যাখ্যান ছেড়ে দিন'),
(674, 'advance_salary_approve', 'Leave Reject', 'প্রত্যাখ্যান ছেড়ে দিন'),
(675, 'advance_salary_reject', 'Advance Salary Reject', 'অগ্রিম বেতন প্রত্যাখ্যান'),
(676, 'add_session', 'Add Session', 'সেশন যোগ করুন'),
(677, 'session', 'Session', 'সেশন'),
(678, 'created_at', 'Created At', 'এ নির্মিত'),
(679, 'sessions', 'Sessions', 'দায়রা'),
(680, 'flag', 'Flag', 'পতাকা'),
(681, 'stats', 'Stats', 'পরিসংখ্যান'),
(682, 'updated_at', 'Updated At', 'এ আপডেট'),
(683, 'flag_icon', 'Flag Icon', 'পতাকা আইকন'),
(684, 'password_restoration', 'Password Restoration', 'পাসওয়ার্ড পুনরুদ্ধার'),
(685, 'forgot', 'Forgot', 'ভুলে গেছেন'),
(686, 'back_to_login', 'Back To Login', 'প্রবেশ করতে পেছান'),
(687, 'database_list', 'Database List', 'ডাটাবেস তালিকা'),
(688, 'create_backup', 'Create Backup', 'ব্যাকআপ তৈরি'),
(689, 'backup', 'Backup', 'ব্যাকআপ'),
(690, 'backup_size', 'Backup Size', 'ব্যাকআপ আকার'),
(691, 'file_upload', 'File Upload', 'ফাইল আপলোড'),
(692, 'parents_details', 'Parents Details', 'পিতামাতার বিশদ'),
(693, 'social_links', 'Social Links', 'সামাজিক বন্ধন'),
(694, 'create_hostel', 'Create Hostel', 'হোস্টেল তৈরি করুন'),
(695, 'allocation_list', 'Allocation List', 'বরাদ্দ তালিকা'),
(696, 'payslip_history', 'Payslip History', 'পেইলিপ ইতিহাস'),
(697, 'my_attendance_overview', 'My Attendance Overview', 'আমার উপস্থিতি ওভারভিউ'),
(698, 'total_present', 'Total Present', 'মোট উপস্থিত'),
(699, 'total_absent', 'Total Absent', 'মোট অনুপস্থিত'),
(700, 'total_late', 'Total Late', 'মোট লেট'),
(701, 'class_teacher_list', 'Class Teacher List', 'শ্রেণি শিক্ষকের তালিকা'),
(702, 'section_control', 'Section Control', 'বিভাগ নিয়ন্ত্রণ'),
(703, 'capacity ', 'Capacity', 'ধারণক্ষমতা'),
(704, 'request', 'Request', 'অনুরোধ'),
(705, 'salary_year', 'Salary Year', 'বেতন বছর'),
(706, 'create_attachments', 'Create Attachments', 'সংযুক্তি তৈরি করুন'),
(707, 'publish_date', 'Publish Date', 'প্রকাশের তারিখ'),
(708, 'attachment_file', 'Attachment File', 'উচ্চ স্বরে পড়া'),
(709, 'age', 'Age', 'Age'),
(710, 'student_profile', 'Student Profile', 'ছাত্র প্রোফাইল'),
(711, 'authentication', 'Authentication', 'প্রমাণীকরণ'),
(712, 'parent_information', 'Parent Information', 'মূল তথ্য'),
(713, 'full_marks', 'Full Marks', 'পুরোপুরি লক্ষ্য'),
(714, 'passing_marks', 'Passing Marks', 'পাসিং মার্কস'),
(715, 'highest_marks', 'Highest Marks', 'সর্বোচ্চ নম্বর'),
(716, 'unknown', 'Unknown', 'অজানা'),
(717, 'unpublish', 'Unpublish', 'অপ্রকাশিত'),
(718, 'login_authentication_deactivate', 'Login Authentication Deactivate', 'লগইন প্রমাণীকরণ নিষ্ক্রিয় করুন'),
(719, 'employee_profile', 'Employee Profile', 'কর্মচারী প্রোফাইল'),
(720, 'employee_details', 'Employee Details', 'কর্মচারীর বিবরণ'),
(721, 'salary_transaction', 'Salary Transaction', 'বেতন লেনদেন'),
(722, 'documents', 'Documents', 'কাগজপত্র'),
(723, 'actions', 'Actions', 'ক্রিয়াকলাপ'),
(724, 'activity', 'Activity', 'কার্যকলাপ'),
(725, 'department_list', 'Department List', 'বিভাগ তালিকা'),
(726, 'manage_employee_salary', 'Manage Employee Salary', 'কর্মচারীদের বেতন পরিচালনা করুন'),
(727, 'the_configuration_has_been_updated', 'The Configuration Has Been Updated', 'কনফিগারেশন আপডেট হয়েছে'),
(728, 'add', 'Add', 'যোগ'),
(729, 'create_exam', 'Create Exam', 'পরীক্ষা তৈরি করুন'),
(730, 'term', 'Term', 'শব্দ'),
(731, 'add_term', 'Add Term', 'টার্ম যুক্ত করুন'),
(732, 'create_grade', 'Create Grade', 'গ্রেড তৈরি করুন'),
(733, 'mark_starting', 'Mark Starting', 'শুরুর চিহ্ন'),
(734, 'mark_until', 'Mark Until', 'অবধি চিহ্নিত করুন'),
(735, 'room_list', 'Room List', 'রুম তালিকা'),
(736, 'room', 'Room', 'ঘর'),
(737, 'route_list', 'Route List', 'রুটের তালিকা'),
(738, 'create_route', 'Create Route', 'রুট তৈরি করুন'),
(739, 'vehicle_list', 'Vehicle List', 'যানবাহনের তালিকা'),
(740, 'create_vehicle', 'Create Vehicle', 'যানবাহন তৈরি করুন'),
(741, 'stoppage_list', 'Stoppage List', 'স্টপেজ তালিকা'),
(742, 'create_stoppage', 'Create Stoppage', 'স্টপেজ তৈরি করুন'),
(743, 'stop_time', 'Stop Time', 'সময় বন্ধ'),
(744, 'employee_attendance', 'Employee Attendance', 'কর্মচারী উপস্থিতি'),
(745, 'attendance_report', 'Attendance Report', 'উপস্থিতি রিপোর্ট'),
(746, 'opening_balance', 'Opening Balance', 'খোলার ভারসাম্য'),
(747, 'add_opening_balance', 'Add Opening Balance', 'উদ্বোধনী ব্যালেন্স যুক্ত করুন'),
(748, 'credit', 'Credit', 'ধার'),
(749, 'debit', 'Debit', 'খরচ'),
(750, 'opening_balance_list', 'Opening Balance List', 'খোলার ভারসাম্য তালিকা'),
(751, 'voucher_list', 'Voucher List', 'ভাউচার তালিকা'),
(752, 'voucher_head', 'Voucher Head', 'ভাউচার হেড'),
(753, 'payment_method', 'Payment Method', 'মূল্যপরিশোধ পদ্ধতি'),
(754, 'credit_ledger_account', 'Credit Ledger Account', 'ক্রেডিট লেজার অ্যাকাউন্ট'),
(755, 'debit_ledger_account', 'Debit Ledger Account', 'ডেবিট লেজার অ্যাকাউন্ট'),
(756, 'voucher_no', 'Voucher No', 'ভাউচার নং'),
(757, 'balance', 'Balance', 'ভারসাম্য'),
(758, 'event_details', 'Event Details', 'অনুষ্ঠানের বিবরণ'),
(759, 'welcome_to', 'Welcome To', 'স্বাগতম'),
(760, 'report_card', 'Report Card', 'রিপোর্ট কার্ড'),
(761, 'online_pay', 'Online Pay', 'অনলাইন পে'),
(762, 'annual_fees_summary', 'Annual Fees Summary', 'বার্ষিক ফি সংক্ষিপ্তসার'),
(763, 'my_children', 'My Children', 'আমার শিশু'),
(764, 'assigned', 'Assigned', 'বরাদ্দ'),
(765, 'confirm_password', 'Confirm Password', 'পাসওয়ার্ড নিশ্চিত করুন'),
(766, 'searching_results', 'Searching Results', 'অনুসন্ধান ফলাফল'),
(767, 'information_has_been_saved_successfully', 'Information Has Been Saved Successfully', 'তথ্য সাফল্যের সাথে সংরক্ষণ করা হয়েছে'),
(768, 'information_deleted', 'The information has been successfully deleted', 'তথ্য সফলভাবে মুছে ফেলা হয়েছে'),
(769, 'deleted_note', '*Note : This data will be permanently deleted', '* দ্রষ্টব্য: এই তথ্য স্থায়ীভাবে মুছে ফেলা হবে'),
(770, 'are_you_sure', 'Are You Sure?', 'তুমি কি নিশ্চিত?'),
(771, 'delete_this_information', 'Do You Want To Delete This Information?', 'আপনি এই তথ্য মুছে ফেলতে চান?'),
(772, 'yes_continue', 'Yes, Continue', 'হ্যাঁ, চালিয়ে যান'),
(773, 'deleted', 'Deleted', 'মুছে ফেলা'),
(774, 'collect', 'Collect', 'সংগ্রহ'),
(775, 'school_setting', 'School Setting', 'স্কুল সেটিং'),
(776, 'set', 'Set', 'সেট'),
(777, 'quick_view', 'Quick View', 'তারাতারি দেখা'),
(778, 'due_fees_invoice', 'Due Fees Invoice', 'পারিশ্রমিক ফি চালান'),
(779, 'my_application', 'My Application', 'আমার আবেদন'),
(780, 'manage_application', 'Manage Application', 'অ্যাপ্লিকেশন পরিচালনা করুন'),
(781, 'leave', 'Leave', 'ছুটি'),
(782, 'live_class_rooms', 'Live Class Rooms', 'লাইভ ক্লাস রুম'),
(783, 'homework', 'Homework', 'বাড়ির কাজ'),
(784, 'evaluation_report', 'Evaluation Report', 'মূল্যায়ন প্রতিবেদন'),
(785, 'exam_term', 'Exam Term', 'পরীক্ষার মেয়াদ'),
(786, 'distribution', 'Distribution', 'বিতরণ'),
(787, 'exam_setup', 'Exam Setup', 'পরীক্ষা সেটআপ'),
(788, 'sms', 'Sms', ''),
(789, 'fees_type', 'Fees Type', 'ফি প্রকার'),
(790, 'fees_group', 'Fees Group', 'ফি গ্রুপ'),
(791, 'fine_setup', 'Fine Setup', 'ফাইন সেটআপ'),
(792, 'fees_reminder', 'Fees Reminder', 'ফি অনুস্মারক'),
(793, 'new_deposit', 'New Deposit', 'নতুন আমানত'),
(794, 'new_expense', 'New Expense', 'নতুন ব্যয়'),
(795, 'all_transactions', 'All Transactions', 'সমস্ত লেনদেন'),
(796, 'head', 'Head', 'মাথা'),
(797, 'fees_reports', 'Fees Reports', 'ফি প্রতিবেদন'),
(798, 'fees_report', 'Fees Report', 'ফি রিপোর্ট'),
(799, 'receipts_report', 'Receipts Report', 'প্রাপ্তি রিপোর্ট'),
(800, 'due_fees_report', 'Due Fees Report', 'বকেয়া ফি রিপোর্ট'),
(801, 'fine_report', 'Fine Report', 'ফাইন রিপোর্ট'),
(802, 'financial_reports', 'Financial Reports', 'আর্থিক প্রতিবেদন'),
(803, 'statement', 'Statement', 'বিবৃতি'),
(804, 'repots', 'Repots', ''),
(805, 'expense', 'Expense', 'ব্যয়'),
(806, 'transitions', 'Transitions', 'স্থানান্তর'),
(807, 'sheet', 'Sheet', 'চাদর'),
(808, 'income_vs_expense', 'Income Vs Expense', 'আয় বনাম ব্যয়'),
(809, 'attendance_reports', 'Attendance Reports', 'উপস্থিতি রিপোর্ট'),
(810, 'examination', 'Examination', 'পরীক্ষা'),
(811, 'school_settings', 'School Settings', 'স্কুল সেটিংস'),
(812, 'role_permission', 'Role Permission', 'ভূমিকা অনুমতি'),
(813, 'cron_job', 'Cron Job', 'ক্রোন জব'),
(814, 'custom_field', 'Custom Field', 'কাস্টম ক্ষেত্র'),
(815, 'enter_valid_email', 'Enter Valid Email', 'সঠিক ইমেইল এড্রেস প্রদান করুন'),
(816, 'lessons', 'Lessons', 'পাঠ'),
(817, 'live_class', 'Live Class', 'লাইভ ক্লাস'),
(818, 'sl', 'Sl', ''),
(819, 'meeting_id', 'Meeting ID', 'লাইভ ক্লাস'),
(820, 'start_time', 'Start Time', ''),
(821, 'end_time', 'End Time', ''),
(822, 'zoom_meeting_id', 'Zoom Meeting Id', 'জুম মিটিং আইডি'),
(823, 'zoom_meeting_password', 'Zoom Meeting Password', 'জুম মিটিংয়ের পাসওয়ার্ড'),
(824, 'time_slot', 'Time Slot', 'সময় স্লট'),
(825, 'send_notification_sms', 'Send Notification Sms', 'বিজ্ঞপ্তি এসএমএস প্রেরণ করুন'),
(826, 'host', 'Host', 'নিমন্ত্রণকর্তা'),
(827, 'school', 'School', 'বিদ্যালয়'),
(828, 'accounting_links', 'Accounting Links', 'অ্যাকাউন্টিং লিংক'),
(829, 'applicant', 'Applicant', 'প্রার্থী'),
(830, 'apply_date', 'Apply Date', 'আবেদন করুন তারিখ'),
(831, 'add_leave', 'Add Leave', 'ছুটি যুক্ত করুন'),
(832, 'leave_date', 'Leave Date', 'ছেড়ে দিন'),
(833, 'attachment', 'Attachment', ''),
(834, 'comments', 'Comments', 'মন্তব্য'),
(835, 'staff_id', 'Staff Id', 'স্টাফ আইডি'),
(836, 'income_vs_expense_of', 'Income Vs Expense Of', 'আয় বনাম ব্যয়'),
(837, 'designation_name', 'Designation Name', 'পদবি নাম'),
(838, 'already_taken', 'This %s already exists.', ''),
(839, 'department_name', 'Department Name', 'বিভাগ নাম'),
(840, 'date_of_birth', 'Date Of Birth', ''),
(841, 'bulk_delete', 'Bulk Delete', 'বাল্ক মুছুন'),
(842, 'guardian_name', 'Guardian Name', 'অভিভাবকের নাম'),
(843, 'fees_progress', 'Fees Progress', 'ফি অগ্রগতি'),
(844, 'evaluate', 'Evaluate', 'মূল্যনির্ধারণ'),
(845, 'date_of_homework', 'Date Of Homework', 'হোম ওয়ার্কের তারিখ'),
(846, 'date_of_submission', 'Date Of Submission', 'জমা তারিখ'),
(847, 'student_fees_report', 'Student Fees Report', 'শিক্ষার্থী ফি রিপোর্ট'),
(848, 'student_fees_reports', 'Student Fees Reports', 'ছাত্র ফি প্রতিবেদন'),
(849, 'due_date', 'Due Date', 'নির্দিষ্ট তারিখ'),
(850, 'payment_date', 'Payment Date', 'টাকা প্রদানের তারিখ'),
(851, 'payment_via', 'Payment Via', 'অর্থ প্রদানের মাধ্যমে'),
(852, 'generate', 'Generate', 'জেনারেট করুন'),
(853, 'print_date', 'Print Date', 'মুদ্রণ তারিখ'),
(854, 'bulk_sms_and_email', 'Bulk Sms And Email', 'বাল্ক এসএমএস এবং ইমেল'),
(855, 'campaign_type', 'Campaign Type', 'প্রচারের ধরণ'),
(856, 'both', 'Both', 'উভয়'),
(857, 'regular', 'Regular', 'নিয়মিত'),
(858, 'Scheduled', 'Scheduled', 'তালিকাভুক্ত'),
(859, 'campaign', 'Campaign', 'ক্যাম্পেইন'),
(860, 'campaign_name', 'Campaign Name', 'প্রচারাভিযান নাম'),
(861, 'sms_gateway', 'Sms Gateway', 'এসএমএস গেটওয়ে'),
(862, 'recipients_type', 'Recipients Type', 'প্রাপক প্রকার'),
(863, 'recipients_count', 'Recipients Count', 'প্রাপকগণ গণনা করুন'),
(864, 'body', 'Body', 'শরীর'),
(865, 'guardian_already_exist', 'Guardian Already Exist', 'অভিভাবক ইতিমধ্যে বিদ্যমান'),
(866, 'guardian', 'Guardian', 'অভিভাবক'),
(867, 'mother_name', 'Mother Name', 'মা নাম'),
(868, 'bank_details', 'Bank Details', 'ব্যাংক বিবরণ'),
(869, 'skipped_bank_details', 'Skipped Bank Details', 'বাদ দেওয়া ব্যাঙ্কের বিশদ'),
(870, 'bank', 'Bank', 'ব্যাংক'),
(871, 'holder_name', 'Holder Name', 'ধারক নাম'),
(872, 'bank_branch', 'Bank Branch', 'ব্যাংকের শাখা'),
(873, 'custom_field_for', 'Custom Field For', 'কাস্টম ফিল্ড জন্য'),
(874, 'label', 'Label', 'লেবেল'),
(875, 'order', 'Order', 'ক্রম'),
(876, 'online_admission', 'Online Admission', 'অনলাইন ভর্তি'),
(877, 'field_label', 'Field Label', 'ফিল্ড লেবেল'),
(878, 'field_type', 'Field Label', 'ফিল্ড লেবেল'),
(879, 'default_value', 'Default Value', 'ডিফল্ট মান'),
(880, 'checked', 'Checked', 'সংযত'),
(881, 'unchecked', 'Unchecked', 'অবারিত'),
(882, 'roll_number', 'Roll Number', 'রোল নাম্বার'),
(883, 'add_rows', 'Add Rows', 'সারি যুক্ত করুন'),
(884, 'salary', 'Salary', 'বেতন'),
(885, 'basic', 'Basic', 'মৌলিক'),
(886, 'allowance', 'Allowance', ''),
(887, 'deduction', 'Deduction', ''),
(888, 'net', 'Net', 'নেট'),
(889, 'activated_sms_gateway', 'Activated Sms Gateway', 'সক্রিয় এসএমএস গেটওয়ে'),
(890, 'account_sid', 'Account Sid', 'অ্যাকাউন্ট সিড'),
(891, 'roles', 'Roles', 'ভূমিকা'),
(892, 'system_role', 'System Role', 'সিস্টেমের ভূমিকা'),
(893, 'permission', 'Permission', 'অনুমতি'),
(894, 'edit_session', 'Edit Session', 'সেশন সম্পাদনা করুন'),
(895, 'transactions', 'Transactions', 'লেনদেন'),
(896, 'default_account', 'Default Account', 'ডিফল্ট অ্যাকাউন্ট'),
(897, 'deposit', 'Deposit', 'আমানত'),
(898, 'acccount', 'Acccount', 'অ্যাকাউন্টে'),
(899, 'role_permission_for', 'Role Permission For', 'ভূমিকা জন্য অনুমতি'),
(900, 'feature', 'Feature', 'বৈশিষ্ট্য'),
(901, 'access_denied', 'Access Denied', 'অ্যাক্সেস অস্বীকৃত'),
(902, 'time_start', 'Time Start', 'সময় শুরু'),
(903, 'time_end', 'Time End', 'সময় শেষ'),
(904, 'month_of_salary', 'Month Of Salary', 'বেতন মাস'),
(905, 'add_documents', 'Add Documents', 'নথি যুক্ত করুন'),
(906, 'document_type', 'Document Type', 'নথিপত্র ধরণ'),
(907, 'document', 'Document', 'দলিল'),
(908, 'document_title', 'Document Title', 'নথির শিরোনাম'),
(909, 'document_category', 'Document Category', 'নথি বিভাগ'),
(910, 'exam_result', 'Exam Result', 'পরীক্ষার ফলাফল'),
(911, 'my_annual_fee_summary', 'My Annual Fee Summary', 'আমার বার্ষিক ফি সংক্ষিপ্তসার'),
(912, 'book_manage', 'Book Manage', 'বই পরিচালনা'),
(913, 'add_leave_category', 'Add Leave Category', 'ছাড়ার বিভাগ যুক্ত করুন'),
(914, 'edit_leave_category', 'Edit Leave Category', 'বিভাগ ছেড়ে যান'),
(915, 'staff_role', 'Staff Role', 'স্টাফ ভূমিকা'),
(916, 'edit_assign', 'Edit Assign', 'সম্পাদনা করুন'),
(917, 'view_report', 'View Report', ''),
(918, 'rank_out_of_5', 'Rank Out Of 5', 'র‌্যাঙ্ক আউট 5'),
(919, 'hall_no', 'Hall No', 'হল নং'),
(920, 'no_of_seats', 'No Of Seats', 'নং আসন'),
(921, 'mark_distribution', 'Mark Distribution', 'চিহ্ন বিতরণ'),
(922, 'exam_type', 'Exam Type', 'পরীক্ষার ধরণ'),
(923, 'marks_and_grade', 'Marks And Grade', 'চিহ্ন এবং গ্রেড'),
(924, 'min_percentage', 'Min Percentage', 'ন্যূনতম শতাংশ'),
(925, 'max_percentage', 'Max Percentage', 'সর্বোচ্চ শতাংশ'),
(926, 'cost_per_bed', 'Cost Per Bed', 'প্রতি বিছানা খরচ'),
(927, 'add_category', 'Add Category', 'বিভাগ যুক্ত করুন'),
(928, 'category_for', 'Category For', 'বিভাগের জন্য'),
(929, 'start_place', 'Start Place', 'স্টার্ট প্লেস'),
(930, 'stop_place', 'Stop Place', 'স্টপ প্লেস'),
(931, 'vehicle', 'Vehicle', 'বাহন'),
(932, 'select_multiple_vehicle', 'Select Multiple Vehicle', 'একাধিক যান নির্বাচন করুন'),
(933, 'book_details', 'Book Details', 'বইয়ের বিবরণ'),
(934, 'issued_by', 'Issued By', 'প্রদান করেছেন'),
(935, 'return_by', 'Return By', 'ফিরে আসুন'),
(936, 'group', 'Group', 'গ্রুপ'),
(937, 'individual', 'Individual', 'স্বতন্ত্র'),
(938, 'recipients', 'Recipients', 'প্রাপক'),
(939, 'group_name', 'Group Name', 'দলের নাম'),
(940, 'fee_code', 'Fee Code', 'ফি কোড'),
(941, 'fine_type', 'Fine Type', 'ফাইন টাইপ'),
(942, 'fine_value', 'Fine Value', 'সূক্ষ্ম মান'),
(943, 'late_fee_frequency', 'Late Fee Frequency', 'দেরিতে ফি ফ্রিকোয়েন্সি'),
(944, 'fixed_amount', 'Fixed Amount', 'নির্দিষ্ট পরিমাণ'),
(945, 'fixed', 'Fixed', 'ফিক্সড'),
(946, 'daily', 'Daily', 'দৈনন্দিন'),
(947, 'weekly', 'Weekly', 'সাপ্তাহিক'),
(948, 'monthly', 'Monthly', 'মাসিক'),
(949, 'annually', 'Annually', 'সালিয়ানা'),
(950, 'first_select_the_group', 'First Select The Group', 'প্রথমে গ্রুপটি নির্বাচন করুন');
INSERT INTO `languages` (`id`, `word`, `english`, `bengali`) VALUES
(951, 'percentage', 'Percentage', ''),
(952, 'value', 'Value', 'মান'),
(953, 'fee_group', 'Fee Group', 'ফি গ্রুপ'),
(954, 'due_invoice', 'Due Invoice', 'ইনভয়েস'),
(955, 'reminder', 'Reminder', 'অনুস্মারক'),
(956, 'frequency', 'Frequency', 'ফ্রিকোয়েন্সি'),
(957, 'notify', 'Notify', 'অবহিত'),
(958, 'before', 'Before', 'আগে'),
(959, 'after', 'After', 'পরে'),
(960, 'number', 'Number', 'সংখ্যা'),
(961, 'ref_no', 'Ref No', 'সুত্র নেই'),
(962, 'pay_via', 'Pay Via', 'ভায়া দিয়ে'),
(963, 'ref', 'Ref', ''),
(964, 'dr', 'Dr', ''),
(965, 'cr', 'Cr', ''),
(966, 'edit_book', 'Edit Book', 'সম্পাদনা বই'),
(967, 'leaves', 'Leaves', 'পত্রাদি'),
(968, 'leave_request', 'Leave Request', 'অনুরোধ ত্যাগ করুন'),
(969, 'this_file_type_is_not_allowed', 'This File Type Is Not Allowed', 'এই ফাইল টাইপ অনুমোদিত নয়'),
(970, 'error_reading_the_file', 'Error Reading The File', 'ফাইলটি পড়ার সময় ত্রুটি'),
(971, 'staff', 'Staff', 'কর্মী'),
(972, 'waiting', 'Waiting', 'অপেক্ষা'),
(973, 'live', 'Live', 'লাইভ দেখান'),
(974, 'by', 'By', ''),
(975, 'host_live_class', 'Host Live Class', 'হোস্ট লাইভ ক্লাস'),
(976, 'join_live_class', 'Join Live Class', 'লাইভ ক্লাসে যোগদান করুন'),
(977, 'system_logo', 'System Logo', 'সিস্টেম লোগো'),
(978, 'text_logo', 'Text Logo', 'পাঠ্য লোগো'),
(979, 'printing_logo', 'Printing Logo', 'মুদ্রণ লোগো'),
(980, 'expired', 'Expired', 'মেয়াদোত্তীর্ণ'),
(981, 'collect_fees', 'Collect Fees', 'ফি সংগ্রহ করুন'),
(982, 'fees_code', 'Fees Code', 'ফি কোড'),
(983, 'collect_by', 'Collect By', 'সংগ্রহ করুন'),
(984, 'fee_payment', 'Fee Payment', 'ফি জমাদান'),
(985, 'write_message', 'Write Message', 'বার্তা লিখুন'),
(986, 'discard', 'Discard', 'বাতিল করা'),
(987, 'message_sent_successfully', 'Message Sent Successfully', 'বার্তা সফলভাবে পাঠানো হয়েছে'),
(988, 'visit_home_page', 'Visit Home Page', ''),
(989, 'frontend', 'Frontend', ''),
(990, 'setting', 'Setting', ''),
(991, 'menu', 'Menu', ''),
(992, 'page', 'Page', ''),
(993, 'manage', 'Manage', ''),
(994, 'slider', 'Slider', ''),
(995, 'features', 'Features', ''),
(996, 'testimonial', 'Testimonial', ''),
(997, 'service', 'Service', ''),
(998, 'faq', 'Faq', ''),
(999, 'card_management', 'Card Management', ''),
(1000, 'id_card', 'Id Card', ''),
(1001, 'templete', 'Templete', ''),
(1002, 'admit_card', 'Admit Card', ''),
(1003, 'certificate', 'Certificate', ''),
(1004, 'system_update', 'System Update', ''),
(1005, 'url', 'Url', ''),
(1006, 'content', 'Content', ''),
(1007, 'banner_photo', 'Banner Photo', ''),
(1008, 'meta', 'Meta', ''),
(1009, 'keyword', 'Keyword', ''),
(1010, 'applicable_user', 'Applicable User', ''),
(1011, 'page_layout', 'Page Layout', ''),
(1012, 'background', 'Background', ''),
(1013, 'image', 'Image', ''),
(1014, 'width', 'Width', ''),
(1015, 'height', 'Height', ''),
(1016, 'signature', 'Signature', ''),
(1017, 'website', 'Website', ''),
(1018, 'cms', 'Cms', ''),
(1019, 'url_alias', 'Url Alias', ''),
(1020, 'cms_frontend', 'Cms Frontend', ''),
(1021, 'enabled', 'Enabled', ''),
(1022, 'receive_email_to', 'Receive Email To', ''),
(1023, 'captcha_status', 'Captcha Status', ''),
(1024, 'recaptcha_site_key', 'Recaptcha Site Key', ''),
(1025, 'recaptcha_secret_key', 'Recaptcha Secret Key', ''),
(1026, 'working_hours', 'Working Hours', ''),
(1027, 'fav_icon', 'Fav Icon', ''),
(1028, 'theme', 'Theme', ''),
(1029, 'fax', 'Fax', ''),
(1030, 'footer_about_text', 'Footer About Text', ''),
(1031, 'copyright_text', 'Copyright Text', ''),
(1032, 'facebook_url', 'Facebook Url', ''),
(1033, 'twitter_url', 'Twitter Url', ''),
(1034, 'youtube_url', 'Youtube Url', ''),
(1035, 'google_plus', 'Google Plus', ''),
(1036, 'linkedin_url', 'Linkedin Url', ''),
(1037, 'pinterest_url', 'Pinterest Url', ''),
(1038, 'instagram_url', 'Instagram Url', ''),
(1039, 'play', 'Play', ''),
(1040, 'video', 'Video', ''),
(1041, 'usename', 'Usename', ''),
(1042, 'experience_details', 'Experience Details', ''),
(1043, 'total_experience', 'Total Experience', ''),
(1044, 'class_schedule', 'Class Schedule', ''),
(1045, 'cms_default_branch', 'Cms Default Branch', ''),
(1046, 'website_page', 'Website Page', ''),
(1047, 'welcome', 'Welcome', ''),
(1048, 'services', 'Services', ''),
(1049, 'call_to_action_section', 'Call To Action Section', ''),
(1050, 'subtitle', 'Subtitle', ''),
(1051, 'cta', 'Cta', ''),
(1052, 'button_text', 'Button Text', ''),
(1053, 'button_url', 'Button Url', ''),
(1054, '_title', ' Title', ''),
(1055, 'contact', 'Contact', ''),
(1056, 'box_title', 'Box Title', ''),
(1057, 'box_description', 'Box Description', ''),
(1058, 'box_photo', 'Box Photo', ''),
(1059, 'form_title', 'Form Title', ''),
(1060, 'submit_button_text', 'Submit Button Text', ''),
(1061, 'map_iframe', 'Map Iframe', ''),
(1062, 'email_subject', 'Email Subject', ''),
(1063, 'prefix', 'Prefix', ''),
(1064, 'surname', 'Surname', ''),
(1065, 'rank', 'Rank', ''),
(1066, 'submit', 'Submit', ''),
(1067, 'certificate_name', 'Certificate Name', ''),
(1068, 'layout_width', 'Layout Width', ''),
(1069, 'layout_height', 'Layout Height', ''),
(1070, 'expiry_date', 'Expiry Date', ''),
(1071, 'position', 'Position', ''),
(1072, 'target_new_window', 'Target New Window', ''),
(1073, 'external_url', 'External Url', ''),
(1074, 'external_link', 'External Link', ''),
(1075, 'sms_notification', 'Sms Notification', ''),
(1076, 'scheduled_at', 'Scheduled At', ''),
(1077, 'published', 'Published', ''),
(1078, 'unpublished_on_website', 'Unpublished On Website', ''),
(1079, 'published_on_website', 'Published On Website', ''),
(1080, 'no_selection_available', 'No Selection Available', ''),
(1081, 'select_for_everyone', 'Select For Everyone', ''),
(1082, 'teacher_restricted', 'Teacher Restricted', ''),
(1083, 'guardian_relation', 'Guardian Relation', ''),
(1084, 'username_prefix', 'Username Prefix', ''),
(1085, 'default_password', 'Default Password', ''),
(1086, 'parents_profile', 'Parents Profile', ''),
(1087, 'childs', 'Childs', ''),
(1088, 'page_title', 'Page Title', ''),
(1089, 'select_menu', 'Select Menu', ''),
(1090, 'meta_keyword', 'Meta Keyword', ''),
(1091, 'meta_description', 'Meta Description', ''),
(1092, 'evaluation_date', 'Evaluation Date', ''),
(1093, 'evaluated_by', 'Evaluated By', ''),
(1094, 'complete', 'Complete', ''),
(1095, 'incomplete', 'Incomplete', ''),
(1096, 'payment_details', 'Payment Details', ''),
(1097, 'edit_attachments', 'Edit Attachments', ''),
(1098, 'live_classes', 'Live Classes', ''),
(1099, 'duration', 'Duration', ''),
(1100, 'metting_id', 'Metting Id', ''),
(1101, 'set_record', 'Set Record', ''),
(1102, 'set_mute_on_start', 'Set Mute On Start', ''),
(1103, 'button_text_1', 'Button Text 1', ''),
(1104, 'button_url_1', 'Button Url 1', ''),
(1105, 'button_text_2', 'Button Text 2', ''),
(1106, 'button_url_2', 'Button Url 2', ''),
(1107, 'left', 'Left', ''),
(1108, 'center', 'Center', ''),
(1109, 'right', 'Right', ''),
(1110, 'about', 'About', ''),
(1111, 'about_photo', 'About Photo', ''),
(1112, 'parallax_photo', 'Parallax Photo', ''),
(1113, 'decline', 'Decline', ''),
(1114, 'edit_grade', 'Edit Grade', ''),
(1115, 'mark', 'Mark', ''),
(1116, 'hall_room', 'Hall Room', ''),
(1117, 'student_promotion', 'Student Promotion', ''),
(1118, 'username_has_already_been_used', 'Username Has Already Been Used', ''),
(1119, 'fee_collection', 'Fee Collection', ''),
(1120, 'not_found_anything', 'Not Found Anything', ''),
(1121, 'preloader_backend', 'Preloader Backend', ''),
(1122, 'ive_class_method', 'Ive Class Method', ''),
(1123, 'live_class_method', 'Live Class Method', ''),
(1124, 'api_credential', 'Api Credential', ''),
(1125, 'translation_update', 'Translation Update', ''),
(1126, ' live_class_reports', ' Live Class Reports', ''),
(1127, 'live_class_reports', 'Live Class Reports', ''),
(1128, 'all', 'All', ''),
(1129, 'student_participation_report', 'Student Participation Report', ''),
(1130, 'joining_time', 'Joining Time', ''),
(1131, 'inventory', 'Inventory', ''),
(1132, 'product', 'Product', ''),
(1133, 'store', 'Store', ''),
(1134, 'supplier', 'Supplier', ''),
(1135, 'unit', 'Unit', ''),
(1136, 'purchase', 'Purchase', ''),
(1137, 'sales', 'Sales', ''),
(1138, 'issue', 'Issue', ''),
(1139, 'gallery', 'Gallery', ''),
(1140, 'news', 'News', ''),
(1141, 'reception', 'Reception', ''),
(1142, 'admission_enquiry', 'Admission Enquiry', ''),
(1143, 'postal_record', 'Postal Record', ''),
(1144, 'call_log', 'Call Log', ''),
(1145, 'visitor_log', 'Visitor Log', ''),
(1146, 'complaint', 'Complaint', ''),
(1147, 'multi_class', 'Multi Class', ''),
(1148, 'deactivate_reason', 'Deactivate Reason', ''),
(1149, 'marksheet', 'Marksheet', ''),
(1150, 'generate_position', 'Generate Position', ''),
(1151, 'online_exam', 'Online Exam', ''),
(1152, 'question_bank', 'Question Bank', ''),
(1153, 'question_group', 'Question Group', ''),
(1154, 'subject_wise', 'Subject Wise', ''),
(1155, 'my_issued_book', 'My Issued Book', ''),
(1156, 'book_issue/return', 'Book Issue/return', ''),
(1157, 'offline_payments', 'Offline Payments', ''),
(1158, 'payments', 'Payments', ''),
(1159, ' offline_payments', ' Offline Payments', ''),
(1160, 'login_credential', 'Login Credential', ''),
(1161, 'admission_report', 'Admission Report', ''),
(1162, 'class_&_section_report', 'Class & Section Report', ''),
(1163, 'sibling_report', 'Sibling Report', ''),
(1164, 'daily_reports', 'Daily Reports', ''),
(1165, 'overview_reports', 'Overview Reports', ''),
(1166, 'subject_wise_reports', 'Subject Wise Reports', ''),
(1167, 'subject_wise_by', 'Subject Wise By', ''),
(1168, 'progress', 'Progress', ''),
(1169, 'stock', 'Stock', ''),
(1170, 'issues', 'Issues', ''),
(1171, 'alumni', 'Alumni', ''),
(1172, 'manage_alumni', 'Manage Alumni', ''),
(1173, 'addon_manager', 'Addon Manager', ''),
(1174, 'modules', 'Modules', ''),
(1175, 'system_student_field', 'System Student Field', ''),
(1176, 'user_login_log', 'User Login Log', ''),
(1177, 'december', 'December', ''),
(1178, 'today_birthday', 'Today Birthday', ''),
(1179, 'currency_formats', 'Currency Formats', ''),
(1180, 'symbol_position', 'Symbol Position', ''),
(1181, 'edit_branch', 'Edit Branch', ''),
(1182, 'whatsapp_settings', 'Whatsapp Settings', ''),
(1183, 'general_setting', 'General Setting', ''),
(1184, 'weekends', 'Weekends', ''),
(1185, 'sunday', 'Sunday', ''),
(1186, 'monday', 'Monday', ''),
(1187, 'tuesday', 'Tuesday', ''),
(1188, 'wednesday', 'Wednesday', ''),
(1189, 'thursday', 'Thursday', ''),
(1190, 'friday', 'Friday', ''),
(1191, 'saturday', 'Saturday', ''),
(1192, 'select_weekends', 'Select Weekends', ''),
(1193, 'unique_roll', 'Unique Roll', ''),
(1194, 'classes_wise', 'Classes Wise', ''),
(1195, 'section_wise', 'Section Wise', ''),
(1196, 'start_from', 'Start From', ''),
(1197, 'digit', 'Digit', ''),
(1198, 'fees_carry_forward_setting', 'Fees Carry Forward Setting', ''),
(1199, 'due_days', 'Due Days', ''),
(1200, 'due_fees_calculation_with_fine_', 'Due Fees Calculation With Fine ', ''),
(1201, 'fields', 'Fields', ''),
(1202, 'active', 'Active', ''),
(1203, 'clear_userlog', 'Clear Userlog', ''),
(1204, 'browser', 'Browser', ''),
(1205, 'login_date_time', 'Login Date Time', ''),
(1206, 'platform', 'Platform', ''),
(1207, 'guardian_picture', 'Guardian Picture', ''),
(1208, 'publish_result', 'Publish Result', ''),
(1209, 'day_wise', 'Day Wise', ''),
(1210, 'header_title', 'Header Title', ''),
(1211, 'frontend_enable_chat', 'Frontend Enable Chat', ''),
(1212, 'backend_enable_chat', 'Backend Enable Chat', ''),
(1213, 'whatsapp_agent', 'Whatsapp Agent', ''),
(1214, 'agent', 'Agent', ''),
(1215, 'whataspp_number', 'Whataspp Number', ''),
(1216, 'weekend', 'Weekend', ''),
(1217, 'online_exam_publish', 'Online Exam Publish', ''),
(1218, 'student_birthday_wishes', 'Student Birthday Wishes', ''),
(1219, 'staff_birthday_wishes', 'Staff Birthday Wishes', ''),
(1220, 'alumni_event', 'Alumni Event', ''),
(1221, 'create_section', 'Create Section', ''),
(1222, 'section_list', 'Section List', ''),
(1223, 'edit_section', 'Edit Section', ''),
(1224, 'set_parameters_to_quickly_create_schedule', 'Set Parameters To Quickly Create Schedule', ''),
(1225, 'starting_date', 'Starting Date', ''),
(1226, 'interval', 'Interval', ''),
(1227, 'google_analytics', 'Google Analytics', ''),
(1228, 'addon', 'Addon', ''),
(1229, 'install', 'Install', ''),
(1230, 'version', 'Version', ''),
(1231, 'installed', 'Installed', ''),
(1232, 'last_upgrade', 'Last Upgrade', ''),
(1233, 'addon_purchase_code', 'Addon Purchase Code', ''),
(1234, 'install_now', 'Install Now', ''),
(1235, 'change', 'Change', ''),
(1236, 'class_&_section', 'Class & Section', ''),
(1237, 'admission_reports', 'Admission Reports', ''),
(1238, 'leave_days', 'Leave Days', ''),
(1239, 'advance_salary_request', 'Advance Salary Request', ''),
(1240, 'student_parent_panel', 'Student Parent Panel', ''),
(1241, 'privacy', 'Privacy', ''),
(1242, 'zoom_credentials', 'Zoom Credentials', ''),
(1243, 'set_zoom_redirect_url', 'Set Zoom Redirect Url', ''),
(1244, 'show_website', 'Show Website', ''),
(1245, 'exploring', 'Exploring', ''),
(1246, 'add_class', 'Add Class', ''),
(1247, 'enquiry', 'Enquiry', ''),
(1248, 'reference', 'Reference', ''),
(1249, 'next', 'Next', ''),
(1250, 'follow_up', 'Follow Up', ''),
(1251, 'previous_school', 'Previous School', ''),
(1252, 'no_of_child', 'No Of Child', ''),
(1253, 'response', 'Response', ''),
(1254, 'note', 'Note', ''),
(1255, 'class_applying_for', 'Class Applying For', ''),
(1256, 'confidential', 'Confidential', ''),
(1257, 'dispatch', 'Dispatch', ''),
(1258, 'receive', 'Receive', ''),
(1259, 'reference_no', 'Reference No', ''),
(1260, 'calling_purpose', 'Calling Purpose', ''),
(1261, 'call_type', 'Call Type', ''),
(1262, 'outgoing', 'Outgoing', ''),
(1263, 'incoming', 'Incoming', ''),
(1264, 'visitor', 'Visitor', ''),
(1265, 'visiting_purpose', 'Visiting Purpose', ''),
(1266, 'entry_time', 'Entry Time', ''),
(1267, 'exit_time', 'Exit Time', ''),
(1268, 'number_of_visitor', 'Number Of Visitor', ''),
(1269, 'token/pass', 'Token/pass', ''),
(1270, 'id_number', 'Id Number', ''),
(1271, 'complainant', 'Complainant', ''),
(1272, 'date_of_solution', 'Date Of Solution', ''),
(1273, 'assign_to', 'Assign To', ''),
(1274, 'action_taken', 'Action Taken', ''),
(1275, 'code', 'Code', ''),
(1276, 'purchase_unit', 'Purchase Unit', ''),
(1277, 'sale_unit', 'Sale Unit', ''),
(1278, 'unit_ratio', 'Unit Ratio', ''),
(1279, 'purchase_price', 'Purchase Price', ''),
(1280, 'sales_price', 'Sales Price', ''),
(1281, 'sales_unit', 'Sales Unit', ''),
(1282, 'store_code', 'Store Code', ''),
(1283, 'contact_number', 'Contact Number', ''),
(1284, 'company_name', 'Company Name', ''),
(1285, 'bill_no', 'Bill No', ''),
(1286, 'payable', 'Payable', ''),
(1287, 'ordered', 'Ordered', ''),
(1288, 'received', 'Received', ''),
(1289, 'add_products_to_stock_list', 'Add Products To Stock List', ''),
(1290, 'sale_to', 'Sale To', ''),
(1291, 'bill', 'Bill', ''),
(1292, 'summary', 'Summary', ''),
(1293, 'sub_total', 'Sub Total', ''),
(1294, 'enter_payment_amount', 'Enter Payment Amount', ''),
(1295, 'issue_to', 'Issue To', ''),
(1296, 'remark', 'Remark', ''),
(1297, 'quantity', 'Quantity', ''),
(1298, 'first_select_the_category', 'First Select The Category', ''),
(1299, 'net_total', 'Net Total', ''),
(1300, 'no_row_are_selected', 'No Row Are Selected', ''),
(1301, 'promotion_history', 'Promotion History', ''),
(1302, 'from_class', 'From Class', ''),
(1303, 'from_session', 'From Session', ''),
(1304, 'promoted_class', 'Promoted Class', ''),
(1305, 'promoted_session', 'Promoted Session', ''),
(1306, 'promoted_date', 'Promoted Date', ''),
(1307, 'sibling_information', 'Sibling Information', ''),
(1308, 'disable_reason', 'Disable Reason', ''),
(1309, 'the_next_session_was_transferred_to_the_students', 'The Next Session Was Transferred To The Students', ''),
(1310, 'promote_to_session', 'Promote To Session', ''),
(1311, 'promote_to_class', 'Promote To Class', ''),
(1312, 'promote_to_section', 'Promote To Section', ''),
(1313, 'mark_summary', 'Mark Summary', ''),
(1314, 'current_due_amount', 'Current Due Amount', ''),
(1315, 'with_fine', 'With Fine', ''),
(1316, 'running', 'Running', ''),
(1317, 'promoted', 'Promoted', ''),
(1318, 'questions_qty', 'Questions Qty', ''),
(1319, 'exam_status', 'Exam Status', ''),
(1320, 'limits_of_participation', 'Limits Of Participation', ''),
(1321, 'passing_mark', 'Passing Mark', ''),
(1322, 'instruction', 'Instruction', ''),
(1323, 'free', 'Free', ''),
(1324, 'question', 'Question', ''),
(1325, 'random', 'Random', ''),
(1326, 'result_publish', 'Result Publish', ''),
(1327, 'negative_mark', 'Negative Mark', ''),
(1328, 'applicable', 'Applicable', ''),
(1329, 'marks_display', 'Marks Display', ''),
(1330, 'make', 'Make', ''),
(1331, 'class_position', 'Class Position', ''),
(1332, 'exam_rank', 'Exam Rank', ''),
(1333, 'principal_comments', 'Principal Comments', ''),
(1334, 'teacher_comments', 'Teacher Comments', ''),
(1335, 'statistics', 'Statistics', ''),
(1336, 'employees', 'Employees', ''),
(1337, 'classes', 'Classes', ''),
(1338, 'parent_menu', 'Parent Menu', ''),
(1339, 'SMS configuration not found', 'SMS Configuration Not Found', ''),
(1340, 'thumb_image', 'Thumb Image', ''),
(1341, 'uploaded', 'Uploaded', ''),
(1342, 'no_sms_gateway_available', 'No Sms Gateway Available', ''),
(1343, 'send_wishes', 'Send Wishes', ''),
(1344, 'middle', 'Middle', ''),
(1345, 'header', 'Header', ''),
(1346, 'footer', 'Footer', ''),
(1347, 'grading_scale', 'Grading Scale', ''),
(1348, 'cumulative', 'Cumulative', ''),
(1349, 'background_file', 'Background File', ''),
(1350, 'purchase_code', 'Purchase Code', ''),
(1351, 'main_logo', 'Main Logo', ''),
(1352, 'Mobile_Logo', 'Mobile Logo', ''),
(1353, 'EIIN_No', 'EIIN No', ''),
(1354, 'College_Code', 'College Code', ''),
(1355, 'eiien_no', 'Eiien No', ''),
(1356, 'college_no', 'College No', ''),
(1357, 'password_has_been_changed', 'Password Has Been Changed', ''),
(1358, 'emergency_notice', 'Emergency Notice', ''),
(1359, 'Institute History Short', 'Institute History Short', ''),
(1360, 'Institute History', 'Institute History', ''),
(1361, 'Short', 'Short', ''),
(1362, 'Institute History Short Description', 'Institute History Short Description', ''),
(1363, 'Instititute History Tittle', 'Instititute History Tittle', ''),
(1364, 'Instititute History Short Description', 'Instititute History Short Description', ''),
(1365, 'Instititute Short Description', 'Instititute Short Description', ''),
(1366, 'Principal & Sovapoti', 'Principal & Sovapoti', ''),
(1367, 'Instititute Short', 'Instititute Short', ''),
(1368, 'Institute Photo', 'Institute Photo', ''),
(1369, 'Principal Message', 'Principal Message', ''),
(1370, 'Sovapoti Message', 'Sovapoti Message', ''),
(1371, 'Principal Short Message', 'Principal Short Message', ''),
(1372, 'Sovapoti Short Message', 'Sovapoti Short Message', ''),
(1373, 'Principal Long Message', 'Principal Long Message', ''),
(1374, 'Sovapoti Long Message', 'Sovapoti Long Message', ''),
(1375, 'Principal_photo', 'Principal Photo', ''),
(1376, 'Principal_images', 'Principal Images', ''),
(1377, 'Sovapoti_images', 'Sovapoti Images', ''),
(1378, 'Sovapotir_Images', 'Sovapotir Images', ''),
(1379, 'news_title', 'News Title', ''),
(1380, 'Facebook_Page_url', 'Facebook Page Url', ''),
(1381, 'URL_Embed_Link', 'URL Embed Link', ''),
(1382, 'Video_Gallery', 'Video Gallery', ''),
(1383, 'add_Video', 'Add Video', ''),
(1384, 'Youtube_Video_Embed_Link', 'Youtube Video Embed Link', ''),
(1385, 'Video Gallery', 'Video Gallery', ''),
(1386, 'Customization', 'Customization', ''),
(1387, 'gallery_title', 'Gallery Title', ''),
(1388, 'Terms_&_Condition', 'Terms & Condition', ''),
(1389, 'Privacy_Policy', 'Privacy Policy', ''),
(1390, 'SEO', 'SEO', ''),
(1391, 'Meta_tittle', 'Meta Tittle', ''),
(1392, 'fields_setting', 'Fields Setting', ''),
(1393, 'terms_conditions', 'Terms Conditions', ''),
(1394, 'online_addmission', 'Online Addmission', ''),
(1395, 'fee', 'Fee', ''),
(1396, 'pay', 'Pay', ''),
(1397, 'certificates', 'Certificates', ''),
(1398, 'Ivent', 'Ivent', ''),
(1399, 'Event', 'Event', ''),
(1400, 'default_template', 'Default Template', ''),
(1401, 'under_review', 'Under Review', ''),
(1402, 'january', 'January', ''),
(1403, 'Slug', 'Slug', ''),
(1404, 'alias', 'Alias', ''),
(1405, 'link', 'Link', ''),
(1406, 'Notice', 'Notice', ''),
(1407, 'add_Notice', 'Add Notice', ''),
(1408, 'edit_Notice', 'Edit Notice', ''),
(1409, 'all_days', 'All Days', ''),
(1410, 'mark_from', 'Mark From', ''),
(1411, 'mark_upto', 'Mark Upto', ''),
(1412, 'passing_session', 'Passing Session', ''),
(1413, 'send_confirmation_sms', 'Send Confirmation Sms', ''),
(1414, 'instructions', 'Instructions', ''),
(1415, 'payment_status', 'Payment Status', ''),
(1416, 'selected_revert', 'Selected Revert', ''),
(1417, 'invalid_marks', 'Invalid Marks', ''),
(1418, 'not_generated', 'Not Generated', ''),
(1419, 'apply_online_admission', 'Apply Online Admission', ''),
(1420, 'email_pdf_exam_marksheet', 'Email Pdf Exam Marksheet', ''),
(1421, 'email_pdf_fee_invoice', 'Email Pdf Fee Invoice', ''),
(1422, 'student_login_has_been_disabled', 'Student Login Has Been Disabled', ''),
(1423, 'february', 'February', ''),
(1424, 'march', 'March', ''),
(1425, 'profession', 'Profession', ''),
(1426, 'teachers_list', 'Teachers List', ''),
(1427, 'assignment', 'Assignment', ''),
(1428, 'approved_and_enroll', 'Approved And Enroll', ''),
(1429, 'half_day', 'Half Day', ''),
(1430, 'progress_reports', 'Progress Reports', ''),
(1431, 'hostels', 'Hostels', ''),
(1432, 'there_is_no_room_allocation', 'There Is No Room Allocation', ''),
(1433, 'room_category', 'Room Category', ''),
(1434, 'april', 'April', ''),
(1435, 'available_stock_quantity', 'Available Stock Quantity', ''),
(1436, 'payment_amount', 'Payment Amount', ''),
(1437, 'bill_view', 'Bill View', ''),
(1438, 'add_payment', 'Add Payment', ''),
(1439, 'sub', 'Sub', ''),
(1440, 'prepared_by', 'Prepared By', ''),
(1441, 'authorised_by', 'Authorised By', ''),
(1442, 'paid_on', 'Paid On', ''),
(1443, 'attach_document', 'Attach Document', ''),
(1444, 'zoom_configuration_not_found', 'Zoom Configuration Not Found', ''),
(1445, 'level', 'Level', ''),
(1446, 'single_choice', 'Single Choice', ''),
(1447, 'multiple_choice', 'Multiple Choice', ''),
(1448, 'true/false', 'True/false', ''),
(1449, 'descriptive', 'Descriptive', ''),
(1450, 'easy', 'Easy', ''),
(1451, 'medium', 'Medium', ''),
(1452, 'hard', 'Hard', ''),
(1453, 'may', 'May', ''),
(1454, 'recent', 'Recent', ''),
(1455, 'information', 'Information', ''),
(1456, 'album', 'Album', ''),
(1457, 'video_url', 'Video Url', ''),
(1458, 'file_size_shoud_be_less_than', 'File Size Shoud Be Less Than', '');

-- --------------------------------------------------------

--
-- Table structure for table `language_list`
--

CREATE TABLE `language_list` (
  `id` int(11) NOT NULL,
  `name` varchar(600) NOT NULL,
  `lang_field` varchar(600) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `rtl` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `language_list`
--

INSERT INTO `language_list` (`id`, `name`, `lang_field`, `status`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'english', 1, 0, '2018-11-15 11:36:31', '2020-04-18 20:05:12'),
(2, 'Bengali', 'bengali', 1, 0, '2018-11-15 11:36:31', '2018-12-04 15:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `leave_application`
--

CREATE TABLE `leave_application` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `category_id` int(2) NOT NULL,
  `reason` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `leave_days` varchar(20) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT 1 COMMENT '1=pending,2=accepted 3=rejected',
  `apply_date` date DEFAULT NULL,
  `approved_by` int(11) NOT NULL,
  `orig_file_name` varchar(255) NOT NULL,
  `enc_file_name` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_category`
--

CREATE TABLE `leave_category` (
  `id` int(2) NOT NULL,
  `name` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `role_id` tinyint(1) NOT NULL,
  `days` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `leave_category`
--

INSERT INTO `leave_category` (`id`, `name`, `role_id`, `days`, `branch_id`) VALUES
(1, 'Casual Leave', 3, 10, 1),
(2, 'Sick Leave', 3, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `live_class`
--

CREATE TABLE `live_class` (
  `id` int(11) NOT NULL,
  `live_class_method` tinyint(1) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `meeting_id` varchar(255) NOT NULL,
  `meeting_password` varchar(255) NOT NULL,
  `own_api_key` tinyint(1) NOT NULL DEFAULT 0,
  `duration` int(11) NOT NULL,
  `bbb` longtext NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` text NOT NULL,
  `remarks` text NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `live_class`
--

INSERT INTO `live_class` (`id`, `live_class_method`, `title`, `meeting_id`, `meeting_password`, `own_api_key`, `duration`, `bbb`, `class_id`, `section_id`, `remarks`, `date`, `start_time`, `end_time`, `created_by`, `status`, `created_at`, `branch_id`) VALUES
(1, 3, 'G', '', '', 0, 60, '{\"join_url\":\"G\"}', 2, '[\"5\"]', '', '2026-05-27', '13:30:00', '14:30:00', 1, 0, '2026-05-27 07:30:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `live_class_config`
--

CREATE TABLE `live_class_config` (
  `id` int(11) NOT NULL,
  `zoom_api_key` varchar(255) DEFAULT NULL,
  `zoom_api_secret` varchar(255) DEFAULT NULL,
  `bbb_salt_key` varchar(355) DEFAULT NULL,
  `bbb_server_base_url` varchar(355) DEFAULT NULL,
  `staff_api_credential` tinyint(1) NOT NULL DEFAULT 0,
  `student_api_credential` tinyint(1) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_class_reports`
--

CREATE TABLE `live_class_reports` (
  `id` int(11) NOT NULL,
  `live_class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_credential`
--

CREATE TABLE `login_credential` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` tinyint(2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1(active) 0(deactivate)',
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `login_credential`
--

INSERT INTO `login_credential` (`id`, `user_id`, `username`, `password`, `role`, `active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 1, 'info@creativedesign.com.bd', '$2y$10$9HcgKGXkrVxF/vGI5NF/fOwdUS10VEBSBFKh1bct2z3q8O78XZDzO', 1, 1, '2026-05-31 18:46:43', '2024-12-27 07:31:06', NULL),
(39, 19, '', '$2y$10$926qW11jTWEfLq2UONqoguVC/bd5eF7U/MwW3khsp3gHbwCcVdmea', 6, 1, NULL, '2024-12-27 10:53:05', NULL),
(41, 20, '', '$2y$10$PeVcxKXr85ejZI6k5RXdEuCGcPecMlWRZN85s7VXyjXiDzUQVHwWi', 6, 1, NULL, '2024-12-27 10:53:05', NULL),
(43, 21, '', '$2y$10$y76FU6a6/Gb5Xgj4pi/XNuVtfANEGCPEtDMb4R5Zj1X7gukhh7CT.', 6, 1, NULL, '2024-12-27 10:53:05', NULL),
(45, 22, '', '$2y$10$8KIBTZOjr45X/t3JEr5ekeMeiFu/Z6LBsU00.ZCddZc7aShygOKtG', 6, 1, NULL, '2024-12-27 10:53:06', NULL),
(47, 23, '', '$2y$10$r.S/fr5x95G4W0r4IuQuPOg2/SL1JMdt6O1qGNGaNlSnC8wP/YaRq', 6, 1, NULL, '2024-12-27 10:53:06', NULL),
(49, 24, '', '$2y$10$GW0KklSAGwDxQfCmu.Caiu3QsR9n7nq4EX0XAUwRtqWxeRiqAm7Xq', 6, 1, NULL, '2024-12-27 10:53:06', NULL),
(51, 25, '', '$2y$10$Pm9fhk2Uzwy.07dumIVCL.Wmm8PBhVgTCplBjwFooIxMFEKem.qrS', 6, 1, NULL, '2024-12-27 10:53:06', NULL),
(53, 26, '', '$2y$10$ic3iczg3cwcxxT11UTWFcuT8yAK5Nj3x0TdmrHFTYgKB4YBaHM5OG', 6, 1, NULL, '2024-12-27 10:53:06', NULL),
(55, 27, '', '$2y$10$3.YJk3C6V9naie/Rd6ywwuT03GUQqVfnwzuAnUGs98yXYQds0E7ES', 6, 1, NULL, '2024-12-27 10:53:06', NULL),
(57, 28, '', '$2y$10$gSVb4bWQbmMioBTygvwyUuLdTBsthb5m6vAl0jp7MKFxj5AdkjVW.', 6, 1, NULL, '2024-12-27 10:53:06', NULL),
(59, 29, '', '$2y$10$P/sv8BF/GuG2iE/LKwYwEOdMmD23lWv3DrB4aAzrYgHTNP4rmGUM.', 6, 1, NULL, '2024-12-27 10:53:06', NULL),
(61, 30, '', '$2y$10$3p7xZQhZ2ATB3E8xSuolku8ldCNQhU7pDi6BX6O46tvFX/Hqdn086', 6, 1, NULL, '2024-12-27 10:53:07', NULL),
(63, 31, '', '$2y$10$FY30lZeFBFqm2jLR7xm1OOcCBiApqEgNhQ9kjAxKn3/knyckIhbEy', 6, 1, NULL, '2024-12-27 10:53:07', NULL),
(65, 32, '', '$2y$10$swUE60esitGI0U1nGrEwW.aN3GEbbyIQ3lV42AqXarFzhBETMe1v2', 6, 1, NULL, '2024-12-27 10:53:07', NULL),
(67, 33, '', '$2y$10$KYCWVD3bU/zM8W9D5O8tieH5daq.dOWx/Sm.p3GFPbjDypIebiEra', 6, 1, NULL, '2024-12-27 10:53:07', NULL),
(69, 34, '', '$2y$10$5G0aVr5TOH1o6rG7C6xMM.VOuYwerWbPzqs46jRXrikqs672pgQny', 6, 1, NULL, '2024-12-27 10:53:07', NULL),
(71, 35, '', '$2y$10$t/t.vK4Y6cBdQdBJwQCxI.JPhhKBLfTP9xbTyTMM8MP8NMjDnk8dS', 6, 1, NULL, '2024-12-27 10:53:07', NULL),
(75, 37, '', '$2y$10$9l2ysfVlRgwbGcXudNCTvO/3H8hEx4hzGEZWc7fEmdl8yV5NH.PWO', 6, 1, NULL, '2024-12-27 10:53:07', NULL),
(77, 38, '', '$2y$10$pN5HgZ6qp.O7/ylxh18iQuXhyeLTZjpPnoiw.4POjENLZ0xq9tHke', 6, 1, NULL, '2024-12-27 10:53:08', NULL),
(81, 40, '', '$2y$10$.RIsqmv/pkoSZA6rePHzp.SnNHcaOZzC6Edb59dvWeys.gRMxhrOC', 6, 1, NULL, '2024-12-27 10:53:08', NULL),
(83, 41, '', '$2y$10$3Co1yf7jjLNJY1jYDLomo.8hXHXSwwwpMgMhLfMjZz0FUbRAkdV0i', 6, 1, NULL, '2024-12-27 10:53:08', NULL),
(85, 42, '', '$2y$10$JCM6FYbSCqEYT5wbO/Mtb.fEsKF.1rZFBIl4HriqX0vwkJs1HSD0W', 6, 1, NULL, '2024-12-27 10:53:08', NULL),
(87, 43, '', '$2y$10$u5Mvo2YqyCjgSUnn4l3X/OedMKTtBgB4L1TZqsmA.OVzmeokITnzO', 6, 1, NULL, '2024-12-27 10:53:08', NULL),
(91, 45, '', '$2y$10$MEnH2Aj2px1KrocD6PL7eORFzOomzmQ0ec7NFQIe7Q1pBrkSz3otC', 6, 1, NULL, '2024-12-27 10:53:09', NULL),
(95, 47, '', '$2y$10$j5UmVhSremZxQwY9J5y2qOHcFk/CBv8O3SwZHoRy8RbwJPGJrfotK', 6, 1, NULL, '2024-12-27 10:58:16', NULL),
(97, 48, '', '$2y$10$2RVmtMRO29rODCnM4pvJeej2O1N5SOVjpK4vKdUvtOyC58s8fQDNa', 6, 1, NULL, '2024-12-27 10:58:16', NULL),
(99, 49, '', '$2y$10$J4mHWyCJbW7ZpRkg6R3DaeO06DjFeS.BAfeaSXrS3UxUxJXLQKmDq', 6, 1, NULL, '2024-12-27 11:00:18', NULL),
(101, 50, '', '$2y$10$9h0E4nFiKdUF80Fc5Epj5OK6nFZPmhUxpLpXogVXEOg6r7QvVczvS', 6, 1, NULL, '2024-12-27 11:00:18', NULL),
(103, 51, '', '$2y$10$bYoscNV4p8ERm5sDWf0Ls.e8cfQiIeIcXvxxL2VAu79va0X7uwInu', 6, 1, NULL, '2024-12-27 11:00:18', NULL),
(105, 52, '', '$2y$10$YQgk1BIRlVcz06JYhESMpex6fywaBsCSIDN3udzr4vAvA3dbHwxk6', 6, 1, NULL, '2024-12-27 11:00:18', NULL),
(107, 53, '', '$2y$10$DVijPmA91MhK4iib2HIA2.xP/KkYCw/RY9nTxy2V32RKIdLzwqqwy', 6, 1, NULL, '2024-12-27 11:01:21', NULL),
(109, 54, '', '$2y$10$FT1oKL33TvKj/Y864vsZUuyk7yEb9UGjuc7X1LMwXoM1jBWrgco6e', 6, 1, NULL, '2024-12-27 11:01:21', NULL),
(111, 55, '', '$2y$10$kMQe2nAYGmAr/z00FpD4FOo0.cjGEU4BwgP2ZYPG0fcbqeNja1Bx6', 6, 1, NULL, '2024-12-27 11:01:21', NULL),
(113, 56, '', '$2y$10$56RCrJoDQvFqq/NNqBeS6uEFTkItLR.o031JTCw9tj.j2ULd0m7XW', 6, 1, NULL, '2024-12-27 11:19:37', NULL),
(114, 56, '', '$2y$10$Q8XoggXAI/3q/7r9pybo8uBKwYku4uygwiNXbz7vRJpmtz0SXapHG', 7, 1, NULL, '2024-12-27 11:19:37', NULL),
(115, 57, '', '$2y$10$ke4EYpTl1ljTuHtLbJwf8el6SOr2xOiXAWTUvvOkWuYPmLj7Evgwe', 6, 1, NULL, '2024-12-27 11:19:37', NULL),
(116, 57, '', '$2y$10$YpV8zEbrxKFT2TXUumiaOePBy6iRKtufEmxPwLBB9TxIdJO/XXHTS', 7, 1, NULL, '2024-12-27 11:19:37', NULL),
(117, 58, '', '$2y$10$jS7kJMInHHmtga.dcvIJ3udvqHVGKENOPU0N1vxZdUnQ3Ui8XyWFm', 6, 1, NULL, '2024-12-27 11:19:37', NULL),
(118, 58, '', '$2y$10$R1j/ertwwAMJoR4FjcWq3.ACBB0EWIUdBzVTIIR6uAMB2Kske2bCm', 7, 1, NULL, '2024-12-27 11:19:37', NULL),
(119, 59, '', '$2y$10$/k1JdjI0nQAZTChhImbfHuLymF61NubK0T7w6ERdTbxu.j5vN/Guq', 6, 1, NULL, '2024-12-27 11:19:37', NULL),
(120, 59, '', '$2y$10$nt1e9TBh/gaqenmcszLh6OvInfOoUYbD56bexzceQYQT/1lfs9iYO', 7, 1, NULL, '2024-12-27 11:19:37', NULL),
(121, 60, '', '$2y$10$0dOBgX7pTcF0DUIUN65u9O1PtMiW1KAP877bbYU8YK7vJI5gOvLvq', 6, 1, NULL, '2024-12-27 11:19:37', NULL),
(122, 60, '', '$2y$10$sQ5zV.NCRaIyWf3KCOHLy.c26tIAUeKNlSA1gzx.ECwDcIdEVLxa.', 7, 1, NULL, '2024-12-27 11:19:37', NULL),
(123, 61, '', '$2y$10$.a1rJU0CXN8gwxXA6MOaH.kPhFi/7XX26027USnLZU82m/D.P0S36', 6, 1, NULL, '2024-12-27 11:19:38', NULL),
(124, 61, '', '$2y$10$URSczvlEfAwIINm19QsEM.pfjHFI6jfvNl3QH91OLkfMpHU4MszYa', 7, 1, NULL, '2024-12-27 11:19:38', NULL),
(125, 62, '', '$2y$10$jxnr5yuEaQwoTWpxsRhFwO.jj8dQLEr2X.2z0.ZnfhMFlRr4A3/8G', 6, 1, NULL, '2024-12-27 11:19:38', NULL),
(126, 62, '', '$2y$10$9CgWlYXHRWeIF52Y31/f6ORKvguAIFBqlqqxeayhFWAZcihYzLRJS', 7, 1, NULL, '2024-12-27 11:19:38', NULL),
(127, 63, '', '$2y$10$HzU3onsz5BcnaYOrRTCYtedv3wMbhHXwaW1BE2ezpRFW1dGHtu4N2', 6, 1, NULL, '2024-12-27 11:19:38', NULL),
(128, 63, '', '$2y$10$sDk6n1LbP2I3kKD.lV8N7ul.L45xqk2beDrm6I.gE/9zsD02HX51y', 7, 1, NULL, '2024-12-27 11:19:38', NULL),
(129, 64, '', '$2y$10$QSJMDR790CVAulykx0f5ReOqdOQ5aaTRpL0CR2s7GQqbyMqJeQ2FO', 6, 1, NULL, '2024-12-27 11:19:38', NULL),
(130, 64, '', '$2y$10$UwL0A3ujzfba75XLDFfphuHsEhx7aKwlR1ICOXMN2nf.9.PLaY46y', 7, 1, NULL, '2024-12-27 11:19:38', NULL),
(131, 65, '', '$2y$10$zKtqYy/5HeZrjVNYs2ZrA.pAZrWw6U7biIVAqiuHLuXuz2H0214Lm', 6, 1, NULL, '2024-12-27 11:19:38', NULL),
(132, 65, '', '$2y$10$qsqGKOvR1ZbFeVdGcvLbR.bnN93bPCf9kOzZUhkpHYIgXM3aKTRSK', 7, 1, NULL, '2024-12-27 11:19:38', NULL),
(133, 66, '', '$2y$10$eTbsc8CCZtrQ3mvlVcP5RenIpe/spDUmmjjWYbNLWdtoLy5Xp5H4e', 6, 1, NULL, '2024-12-27 11:19:38', NULL),
(134, 66, '', '$2y$10$mrFiW2la4gBdAQ65QlNcseiZ0TidTm1DnlkKS/McUvbnNk0uHmUeC', 7, 1, NULL, '2024-12-27 11:19:38', NULL),
(135, 67, '', '$2y$10$WT96GsZiKoq5rvhvNZvzU.4Xg/9hLzLRb68m90cBUNocIOf6E5DnS', 6, 1, NULL, '2024-12-27 11:19:38', NULL),
(136, 67, '', '$2y$10$3wZEU.1ZuYSB.g/b331Jj.HPnCOsKD8kmkFtPnHcJyikrn0IUhos6', 7, 1, NULL, '2024-12-27 11:19:38', NULL),
(137, 68, '', '$2y$10$6ehU9B.qOLdcidW4TrQWgO4dQSwVuGw/JpW58oCpye/ICjKcFE7Le', 6, 1, NULL, '2024-12-27 11:19:38', NULL),
(138, 68, '', '$2y$10$bmSLv5uss6nBPo/gVTvAqOo.dcfa71fdVwPgYN7BdsdoTsfit1sye', 7, 1, NULL, '2024-12-27 11:19:38', NULL),
(139, 69, '', '$2y$10$YBt.pqzg2lMSDi7yEgvR2u/RXFwsZvYtv3CTlkVj1uU4yRwZAp6xG', 6, 1, NULL, '2024-12-27 11:19:39', NULL),
(140, 69, '', '$2y$10$5fXEH.Jcxk2pRldeNbryEeziKFovvZOBxhUzRq3/79ZQWXKe5HK42', 7, 1, NULL, '2024-12-27 11:19:39', NULL),
(141, 70, '', '$2y$10$XiBwma9ND2zHUD5ojex55uAYfK8K3OTP/Uec.9QOiHV6ud9pAOrVe', 6, 1, NULL, '2024-12-27 11:19:39', NULL),
(142, 70, '', '$2y$10$unX8CpHpc5b/iGRT0K7TjORXal0oTnXaR36kPOv5ju2RLWLzLD/7S', 7, 1, NULL, '2024-12-27 11:19:39', NULL),
(143, 71, '', '$2y$10$j7bHQtNMMPhTaSHgBo9nVuyTREYlnA0Qu83ioTIcipB.OuRMRKjO.', 6, 1, NULL, '2024-12-27 11:19:39', NULL),
(144, 71, '', '$2y$10$v6Kr4umbIhT.7BG3ZEGXQOLVlJxe6yUq8Ca7UwTswkdjgkGTeRCl6', 7, 1, NULL, '2024-12-27 11:19:39', NULL),
(145, 72, '', '$2y$10$8d5PIMj4PDQ1iNJ71DqXHOXPpI9O4cDArQwUXCTYQCwwcJeu6EytW', 6, 1, NULL, '2024-12-27 11:19:39', NULL),
(146, 72, '', '$2y$10$U2YABMN4aWV7.YaQNwaZS.6u2LL0MJfPqk0jmy6hj6qvM7W/x7yiW', 7, 1, NULL, '2024-12-27 11:19:39', NULL),
(147, 73, '', '$2y$10$DaAdNcP/6iiluHao2S00jO4LT8VxiE7zRBX5Ek1ybV31tuSi3wGGe', 6, 1, NULL, '2024-12-27 11:19:39', NULL),
(148, 73, '', '$2y$10$bRthG9/8Wkz5jcmE5DyMcOyWLDU.ZseDI9jxlGd/voTAQsIMQVmRq', 7, 1, NULL, '2024-12-27 11:19:39', NULL),
(149, 74, '', '$2y$10$RKmYVF7ubI2MgHOcnIvW9u/WJGdUtufhcq2UiXnDPhyoZOG1DOvwS', 6, 1, NULL, '2024-12-27 11:19:39', NULL),
(150, 74, '', '$2y$10$ZuyHiH/aa/u7r0EZSjYgyOlR9nbzzH4eis0.I.9oXsHqXH8z74W7q', 7, 1, NULL, '2024-12-27 11:19:39', NULL),
(151, 75, '', '$2y$10$faUnTV7.zhhxi1qipqKgDOgZLUzNJ7SJNPxmswW5ZYnypcfy.6JAy', 6, 1, NULL, '2024-12-27 11:19:39', NULL),
(152, 75, '', '$2y$10$mbVfECXl3gRNxTuyfxGLLeHwjW2xRDa/IxRsdMNes3RCvTCSH1f9G', 7, 1, NULL, '2024-12-27 11:19:39', NULL),
(153, 76, '', '$2y$10$fEQIu8trkdmjJ2gH1ilRuONK7VCeybkeIhpfqXsT.nSL5SstPa9yy', 6, 1, NULL, '2024-12-27 11:19:39', NULL),
(154, 76, '', '$2y$10$xvdInB/sJwWbsEP.HNuX7Oumt9IbnWOEiXOhwYBIPbOGVh9qVYPGW', 7, 1, NULL, '2024-12-27 11:19:39', NULL),
(155, 77, '', '$2y$10$TjEwaBvRnCmgDTtx0NfM5.T6Tqm8voiOl4QC0EwRH14wi.m52t.Yu', 6, 1, NULL, '2024-12-27 11:19:39', NULL),
(156, 77, '', '$2y$10$MTII6F9C74NwfAmfee2EsekD7wabHVHEYRJYaE08jpF5s6gNvt98i', 7, 1, NULL, '2024-12-27 11:19:40', NULL),
(157, 78, '', '$2y$10$D.Qt4S1df00focRK1AR1NeESyHToA/Wg/mPfP8u4lhRU1UwLTtS1a', 6, 1, NULL, '2024-12-27 11:19:40', NULL),
(158, 78, '', '$2y$10$zdKEV4FmWWGGoFMnl5KMne53i4WuJg/aKU7jOg7iTBVf82hEbnAwW', 7, 1, NULL, '2024-12-27 11:19:40', NULL),
(159, 79, '', '$2y$10$gmitMcFYoO9w9jQ2UO4LUu7.UW5CIkMLzpnq7LU66IvjNH6BWRftO', 6, 1, NULL, '2024-12-27 11:19:40', NULL),
(160, 79, '', '$2y$10$z5RFIUXh6WdAl1gv0fCtOOdFgQ014Vtv7eqTi2W3W1x6qIthTtvfm', 7, 1, NULL, '2024-12-27 11:19:40', NULL),
(161, 80, '', '$2y$10$q.L8lne48THYIJ5z50YnvuzGXFG3EuZDYDXubdZnBLQHUCXQ56nqe', 6, 1, NULL, '2024-12-27 11:19:40', NULL),
(162, 80, '', '$2y$10$apdWUIGiZMuOgupO5saChucKzwTNRwCR0Whg8YoECm34aNl9RWU.G', 7, 1, NULL, '2024-12-27 11:19:40', NULL),
(163, 81, '', '$2y$10$VvUqKxC3ytH.klT7eeHw6.WLk0rQT1uQRK0sql2Sx6FHoAR/7TJAS', 6, 1, NULL, '2024-12-27 11:19:40', NULL),
(164, 81, '', '$2y$10$JydZhNJWPi5ItNN3cw2BU.SFg8ZCB3wI4SlG2JoYQ.EIeSG71LyZy', 7, 1, NULL, '2024-12-27 11:19:40', NULL),
(165, 82, '', '$2y$10$fiHboSt5ABZQ9hnrYD.bwuJ2Y4G/ccrB18x.A7Jxcld0bvs8iNuo.', 6, 1, NULL, '2024-12-27 11:19:40', NULL),
(166, 82, '', '$2y$10$8.pKhf3WBXw8mlLzoGzl..PGCyaV0v2CNLEL7lnTXIdYQqv88UXem', 7, 1, NULL, '2024-12-27 11:19:40', NULL),
(167, 83, '', '$2y$10$Irb1qvYWGtPOw8g38ffaeeYzfyoB8pLamD5HmzLS.eo3xmCdMgRUq', 6, 1, NULL, '2024-12-27 11:19:40', NULL),
(168, 83, '', '$2y$10$.8MY8kEPBhcxjGHphsrkxOE0yDLRGXf9Tlk5PCCWroNdD1iPvKUfC', 7, 1, NULL, '2024-12-27 11:19:40', NULL),
(169, 84, '', '$2y$10$m0UKzCNZ.UArkJXFWLru4elb2Hm6M7I3mp4ZTTgwpFiEGK0QcMgKi', 6, 1, NULL, '2024-12-27 11:19:40', NULL),
(170, 84, '', '$2y$10$T60DM4wCHmQy6dgnI7iaM.3.brjqeVewK1f3OiRBNfS.MvGt7xgOG', 7, 1, NULL, '2024-12-27 11:19:40', NULL),
(171, 85, '', '$2y$10$2yC93UXYtpJqKR8qdPyjne4kZ3/ohS9eU62mKZ/0Jn2fIYCnNao.2', 6, 1, NULL, '2024-12-27 11:19:40', NULL),
(172, 85, '', '$2y$10$vFmch0MWSXAQIafHG0BjEOj0p/1nb9CNHn9IyGZUqPliGfEtDOmhO', 7, 1, NULL, '2024-12-27 11:19:41', NULL),
(173, 86, '', '$2y$10$3K8EJ7aR9pkTtlrWT9/gMOSMJh/sIGyqlP8mCaQi8h9.MEDATRFmW', 6, 1, NULL, '2024-12-27 11:19:41', NULL),
(174, 86, '', '$2y$10$W6TjlvIZSeTrhnYxe63UWu1IyuDxp0UWcHd1FozSJVfX/OvT6PqOm', 7, 1, NULL, '2024-12-27 11:19:41', NULL),
(175, 87, '', '$2y$10$6t1eR57XDJQzmbBOhvuWq.ff7NEW.H8OMqsivT/pz.x3Y0Qy9NVJK', 6, 1, NULL, '2024-12-27 11:19:41', NULL),
(176, 87, '', '$2y$10$UR/8e4J1d5Etds3j.8InKOaQZ8h30y1mWsjAG6dVuuWiZMdOY2fHG', 7, 1, NULL, '2024-12-27 11:19:41', NULL),
(177, 88, '', '$2y$10$hnWsMJO4MFksp3dGdphiJ.19DY8RZmXQE35F/QKg6JaorU2mVGtpO', 6, 1, NULL, '2024-12-27 11:19:41', NULL),
(178, 88, '', '$2y$10$jjVgDSsNCEcjladCNlFL3uICqFaO9Ng.9HVvgZuJQQUlFITSDRGLK', 7, 1, NULL, '2024-12-27 11:19:41', NULL),
(179, 89, '', '$2y$10$.RcuRxNWqJCwcSA44fd2E.uQOhOKnJjWY/W4fOnLOdDedzF1bMz1O', 6, 1, NULL, '2024-12-27 11:19:41', NULL),
(180, 89, '', '$2y$10$30jYgVYb4DershlRqN008OtLhcrW7RakNq4fGgB/NE4DCG9VvJffi', 7, 1, NULL, '2024-12-27 11:19:41', NULL),
(181, 90, '', '$2y$10$hzibzdqCiaQAPPy6wGXWKOdBSVrYSEmQtqRiXC3a3tIDJ4LYBB9UO', 6, 1, NULL, '2024-12-27 11:19:41', NULL),
(182, 90, '', '$2y$10$EzawnYbWVPqGTFLDLeOSA.SNTw9OrqM2GlgzTqs0XAY.CRS0o7o/i', 7, 1, NULL, '2024-12-27 11:19:41', NULL),
(183, 91, '', '$2y$10$yiSim9EEAGvmoNt7492.1.gbrDPO3kgohEAIuRAOLo8BUZvgVYstG', 6, 1, NULL, '2024-12-27 11:19:41', NULL),
(184, 91, '', '$2y$10$moYQ8Yl3pqUlnFxa/LUBk.WmcotFZVR9fBZgxngUwIQ0CKly2Ifji', 7, 1, NULL, '2024-12-27 11:19:41', NULL),
(185, 92, '', '$2y$10$NLtLI5aJ.EgUGHHNoWkk/OFl4GoT4WaauwUtckFHq9S08pf1Zvw6G', 6, 1, NULL, '2024-12-27 11:19:41', NULL),
(186, 92, '', '$2y$10$yxldUWGgQd5iJjymq4ajTOjMaosXZJsmoO6sICtYPtuoIXlDjzM1W', 7, 1, NULL, '2024-12-27 11:19:41', NULL),
(187, 93, '', '$2y$10$/U0SN/jmq3L3i3bzawASL.XSbD801wfoOBA8PwJ/9NyHGJBVyLg2.', 6, 1, NULL, '2024-12-27 11:19:41', NULL),
(188, 93, '', '$2y$10$A0.lwP39YyD.qYFKQj.68eTZD4X6zjqz17ps026nYr1oNkba17na6', 7, 1, NULL, '2024-12-27 11:19:41', NULL),
(189, 94, '', '$2y$10$l2Bb0W5UfGyjQwG7/6wRjesQokJoRIb.ZBFPjuDbnFzfN70bMYZri', 6, 1, NULL, '2024-12-27 11:19:42', NULL),
(190, 94, '', '$2y$10$QoXH6xy26Lgot0TiKm/VCuo1qFxwwRDAz09emhj7QCx2kWsMsYZfe', 7, 1, NULL, '2024-12-27 11:19:42', NULL),
(191, 95, '', '$2y$10$nBItvptjaG2iY.zdufk5x.Fc.2588YDyJj2yQKPkqPQpjh77Lg4MG', 6, 1, NULL, '2024-12-27 11:19:42', NULL),
(192, 95, '', '$2y$10$Aki21i/0a3qgf.siTVy08OKbDGG9qUFy676q9knDDCbRJyjQ.vRbi', 7, 1, NULL, '2024-12-27 11:19:42', NULL),
(193, 96, '', '$2y$10$3P9y0SmrWnPYk.IVUkLILu1zPlHwJcbUzJr5pvX/kB6AVLbcRy45m', 6, 1, NULL, '2024-12-27 11:19:42', NULL),
(194, 96, '', '$2y$10$VgHicRAVe41BK81k2e7auOhuDWqd1cO9JunYD9vYnKlTzCNOEeAti', 7, 1, NULL, '2024-12-27 11:19:42', NULL),
(195, 97, '', '$2y$10$tTlpYu/HaztlZrDK3xKGi.5QC9wL457F8ixZS62JzeJ6u6v3DWwlu', 6, 1, NULL, '2024-12-27 11:19:42', NULL),
(196, 97, '', '$2y$10$U8SJN5pREl5QyU3NLXAC1.J3fNoYeVz9O5gSqk.YahxCYOrSSKQgy', 7, 1, NULL, '2024-12-27 11:19:42', NULL),
(197, 98, '', '$2y$10$vCVO8rCS6vRBda/.epsDs.cvzoN1si3MhgK6tF3QI5TlVKeObPxu2', 6, 1, NULL, '2024-12-27 11:19:42', NULL),
(198, 98, '', '$2y$10$wBBCw4fI61.f.4RVU0fQ4.2fbEkZqfcU8ncd84vP/vp1N.RpdBxsm', 7, 1, NULL, '2024-12-27 11:19:42', NULL),
(199, 99, '', '$2y$10$UL/6mV10r0WgCgm5fUgX0.OMMv7cHJJiC6m1KjroBUe965JdsCFGe', 6, 1, NULL, '2024-12-27 11:19:42', NULL),
(200, 99, '', '$2y$10$QdPl0sB9S.WV01MNzUc7x.9hFZLNhi8Yl5q78jiQZg651L7jRiueu', 7, 1, NULL, '2024-12-27 11:19:42', NULL),
(201, 100, '', '$2y$10$sm6JA6BNORkOqcOCeoGnAujKMGfDjD3O2qiaDRVuGDJLalnLxpCai', 6, 1, NULL, '2024-12-27 11:19:42', NULL),
(202, 100, '', '$2y$10$HjnhHtZ9OZT7ueG7iPoEEOioFT/h5mYAr.hDPJ/pNg5FgylNuwyz2', 7, 1, NULL, '2024-12-27 11:19:42', NULL),
(203, 3, 'Mamun123', '$2y$10$X1YC3GRQ9fhENpopgcyB8OJzKimxprpeRLRJTKNcHwn2oboCE.1zS', 3, 1, NULL, '2024-12-27 11:22:00', NULL),
(204, 101, '', '$2y$10$vfBoMrdRkdjxbTHkOZF5quo6AISxFJg2oPK0bfu7DtJH8IwDdnvVe', 6, 1, NULL, '2024-12-27 11:22:37', NULL),
(205, 101, '', '$2y$10$Hyfm9pnTmpfaLOtIZnmPWe3smbno/eZj1KawS4eOrq/gltrxL58w6', 7, 1, NULL, '2024-12-27 11:22:37', NULL),
(206, 102, '', '$2y$10$M129jeNosN8/iM2Vi9lSh.EzaXUBVs2Xaw/DsUyvBWfai3Df8P/CK', 6, 1, NULL, '2024-12-27 11:22:37', NULL),
(207, 102, '', '$2y$10$fzR3pmFps/J31R.RonbDUuiRY6xV/mbyj./B14oHtbugt0LnL4T5m', 7, 1, NULL, '2024-12-27 11:22:37', NULL),
(208, 103, '', '$2y$10$zXertAIrsXRnbBIpO4adiugZuGuFLqZtMNkgFNlnX8uFlDCcNs2.G', 6, 1, NULL, '2024-12-27 11:22:37', NULL),
(209, 103, '', '$2y$10$QHPWhfoWbCvPAlofDUXFreqmIeY9LP1lRiuG6VNDgeMuhNNq.WWJW', 7, 1, NULL, '2024-12-27 11:22:37', NULL),
(210, 104, '', '$2y$10$Afwip88reUfiUnvClhl5XucVC9Zp6XoxhsC5eR4HvoGbJKufCUepO', 6, 1, NULL, '2024-12-27 11:24:24', NULL),
(211, 104, '', '$2y$10$lAGdlTK/IKOQnymt1Tu44uXJy3x4ObIwJhaz26t2U/atvAz/7bpUu', 7, 1, NULL, '2024-12-27 11:24:25', NULL),
(212, 105, '', '$2y$10$MhfoOGyBUJtE/jYYZoGa2u6T5P2rvyMEcmB2F1rJmf2hRMrw.7awW', 6, 1, NULL, '2024-12-27 11:24:25', NULL),
(213, 105, '', '$2y$10$54Vk6fchmqodmyrpjdwi1.mjUgDw7hHv83Gr658IOlRT0d9AoUz5i', 7, 1, NULL, '2024-12-27 11:24:25', NULL),
(214, 106, '', '$2y$10$6Epmwp/vKPPpp7d2usUiZe9YmAC0KR/KHb8lf1YssGzF82pxv1uvm', 6, 1, NULL, '2024-12-27 11:24:25', NULL),
(215, 106, '', '$2y$10$.ATlKSNR.b5W9cnuvZ9rlOq56YJ8L4h9dTP2g7/veQiUFAkYipYsC', 7, 1, NULL, '2024-12-27 11:24:25', NULL),
(216, 107, '', '$2y$10$7SzecZFGGTkiqkXM3zhZAuFMxplbbxmFU12.GgLVQdUYv0pj8fYn.', 6, 1, NULL, '2024-12-27 11:24:25', NULL),
(217, 107, '', '$2y$10$WlZk3i28eaMQ.parVGDZQuc7toUqpBk.LFuz.iM19KGAkw0QbM52m', 7, 1, NULL, '2024-12-27 11:24:25', NULL),
(218, 108, '', '$2y$10$7xjBR.0wXPeexN9Bui9Auu8S5BTpd4ya.o6YlL72OV4E0Gi2hWjLG', 6, 1, NULL, '2024-12-27 11:24:25', NULL),
(219, 108, '', '$2y$10$YQ4bgvx6s11GIeH5rTKFh.nM.tT6/5yH0txyPcS1ECydV/Zm69m2u', 7, 1, NULL, '2024-12-27 11:24:25', NULL),
(220, 109, '', '$2y$10$3MbarQ3frS8/QsGvproqQObeS/XBcpL3KlStVLKOkHlo6wdj/1ty2', 6, 1, NULL, '2024-12-27 11:24:25', NULL),
(221, 109, '', '$2y$10$kSPX6tRmrqN1FzLcXfqGWuHpaod3iS7xwc4I0xjFo/x9nPknULxSe', 7, 1, NULL, '2024-12-27 11:24:25', NULL),
(222, 110, '', '$2y$10$6RXxfHOjzjxTJDfOILpC0e3zcx5gkmoPtA0sgCvNM.SRLPIkxW58W', 6, 1, NULL, '2024-12-27 11:24:25', NULL),
(223, 110, '', '$2y$10$q1EoCVAXSS0Ix.nOfX2d/e18hbnzGC7cUrFu7XcDkkvpF36LREWxm', 7, 1, NULL, '2024-12-27 11:24:25', NULL),
(224, 111, '', '$2y$10$gD8Bo8lvgMYeHVwSOTRAtey76vdMofCZwaExaL.bQghSXXMkXAZCm', 6, 1, NULL, '2024-12-27 11:24:25', NULL),
(225, 111, '', '$2y$10$1.KeStWLWheHpEyjs4cZpeUmJAeRKA4wV8FCfkeY99YfZXneRiRJe', 7, 1, NULL, '2024-12-27 11:24:25', NULL),
(226, 112, '', '$2y$10$isWTZA2g8kd6h8nlQhsNmeBzAbqi3WlpVnkPKsIeZnp2KNEOXODHe', 6, 1, NULL, '2024-12-27 11:24:25', NULL),
(227, 112, '', '$2y$10$1Nah9aMaqj2WvCkycc8yZOVWQN0Glp2mxJQoI25A1sicLUa/LONRa', 7, 1, NULL, '2024-12-27 11:24:25', NULL),
(228, 113, '', '$2y$10$lVEfD5GUKDcsdoSPHFn.meZK15KOTVrUgmN88VDLw6LRhUhKx4OHe', 6, 1, NULL, '2024-12-27 11:24:26', NULL),
(229, 113, '', '$2y$10$rFMxaCcfb5D5FALlvmFf6Oc9bvR6jxL1K.5tdM.LLuQDA82TrPahG', 7, 1, NULL, '2024-12-27 11:24:26', NULL),
(230, 114, '', '$2y$10$Brt4gMCcRRrwB9WHVxvS8OYsOs6of1j9l7ocGbS8ev51PFRAFeJCC', 6, 1, NULL, '2024-12-27 11:24:26', NULL),
(231, 114, '', '$2y$10$B2TbubBkgG4YNuwxAfMUrupV1268SEF7yLUYx0n5gCIupiltg33yC', 7, 1, NULL, '2024-12-27 11:24:26', NULL),
(232, 115, '', '$2y$10$xWnxlAoyh9dNiB.b2.67r.D5SFiYmpK8jsTPGlgGeaaTAeY1DiH.e', 6, 1, NULL, '2024-12-27 11:24:26', NULL),
(233, 115, '', '$2y$10$DjVM/s9lqkAtYk0G7aMQiOFMTI9n0Ta4E723WE7efv5MK2eCNwNoi', 7, 1, NULL, '2024-12-27 11:24:26', NULL),
(234, 116, '', '$2y$10$Oa0qmXaIOuLlgLF5mOhIA.RxDsFq9tGM4S5iZk3GKFlbhSboMGReC', 6, 1, NULL, '2024-12-27 11:24:26', NULL),
(235, 116, '', '$2y$10$w1Y0tVSwLpNQaafZLzW0w.Pj13MlE648Q3RF3RocaIiVFH1.1iuG6', 7, 1, NULL, '2024-12-27 11:24:26', NULL),
(236, 117, '', '$2y$10$V38cAmN.iT.bI3IxYFpVvOwoWaFxGHgXMOgtk3pKgeQDCHpBiCN0a', 6, 1, NULL, '2024-12-27 11:24:26', NULL),
(237, 117, '', '$2y$10$jHCLAhwh8rlJbnUsnOnJaOfI2nYtFbsu9hpaMAC9nLxvqZSIQ7jXi', 7, 1, NULL, '2024-12-27 11:24:26', NULL),
(238, 118, '', '$2y$10$CZ8BZFHvcW2pKAX2LiOPMeyP4gYg/ZD4Kee5qLb8ibQoqvmCSYRwi', 6, 1, NULL, '2024-12-27 11:24:26', NULL),
(239, 118, '', '$2y$10$GyXtRdDnJ6IiuhZSwl.vneWpMHHgbfzc/o7cc6JVTqeM.0dKB4txu', 7, 1, NULL, '2024-12-27 11:24:26', NULL),
(240, 119, '', '$2y$10$BhfiPSDNr59hBFyAVIrUs.SCnjiswz.m81jX0ydEjdwOChm5xRhoy', 6, 1, NULL, '2024-12-27 11:24:26', NULL),
(241, 119, '', '$2y$10$eXWiPqK0xYZsl27H4/Xe0.nOhMa3vcR3GrYv5XMuaD4j3sjMWF82i', 7, 1, NULL, '2024-12-27 11:24:26', NULL),
(242, 120, '', '$2y$10$k/oWT31n7pqqQBsueNYZu.jgWk2lynP5q9AAA7vzDdDJXsxSQmhoK', 6, 1, NULL, '2024-12-27 11:24:26', NULL),
(243, 120, '', '$2y$10$wpSvFHWWU8PCgnforuPeOeRyzKzGyf5LstAgwd6TdTh4OqzG9dpIK', 7, 1, NULL, '2024-12-27 11:24:26', NULL),
(244, 121, '', '$2y$10$VBDFlc/q5f89AgBr64s23en2FJ/6LeHr8Bf.sS9rDawYYFD6pZyKW', 6, 1, NULL, '2024-12-27 11:24:27', NULL),
(245, 121, '', '$2y$10$InZRXW1/ZXdCa1vv5smr1OISSWMuarf4o2DuwKkNgNMWR0QJucP66', 7, 1, NULL, '2024-12-27 11:24:27', NULL),
(246, 122, '', '$2y$10$niJnIlu0QfpnuVUxW/ywx..5plJJlkH21Wbi4yKSG73R7cJXlNetS', 6, 1, NULL, '2024-12-27 11:24:27', NULL),
(247, 122, '', '$2y$10$TYyYt3adf7eiapoQpxBMKODXAhlJ4EjFq7pNUEJ6eqTrpOfYYshai', 7, 1, NULL, '2024-12-27 11:24:27', NULL),
(248, 123, '', '$2y$10$2TWlCZA7.BQslaJkMN5/P.U/LG7/IU5hMTpLfUpKJ4wwBUMgC20jG', 6, 1, NULL, '2024-12-27 11:24:27', NULL),
(249, 123, '', '$2y$10$1i/ZdRFEwPm5X5JO.uyMAuVa9I4lFU5E35L5wqwNYzFk9k6lqw9UO', 7, 1, NULL, '2024-12-27 11:24:27', NULL),
(250, 124, '', '$2y$10$I7/rVplXLjKnUXISET6fWeTEV/6k.l66ft6xaHmRL1nU/YWsyd/s6', 6, 1, NULL, '2024-12-27 11:24:27', NULL),
(251, 124, '', '$2y$10$yg1bQ9uVvJwNAPBgA94ykuxsvn/hEUpxQljPT/8HXZq8oSwXJVuum', 7, 1, NULL, '2024-12-27 11:24:27', NULL),
(252, 125, '', '$2y$10$9OfM92Xnau.6LQsDdFqgFOiWdUM6mpRPR/sYUWxLWEAROuclj0/uC', 6, 1, NULL, '2024-12-27 11:24:27', NULL),
(253, 125, '', '$2y$10$6TXBGWdrImfCjXOlZCEIBehT7/UgkYM1H0r7K4GRsjn8IVmxDoANW', 7, 1, NULL, '2024-12-27 11:24:27', NULL),
(254, 126, '', '$2y$10$sNCRBZQd7MRIpgK5Rl4De.If632fz4.iMiMCG47ZDgdFlEDxQa/fy', 6, 1, NULL, '2024-12-27 11:24:27', NULL),
(255, 126, '', '$2y$10$KZG1WLaEOywxcG0JYSPKTeRCkoy4mHASx1AdyEo3o9fduPAZm7Quu', 7, 1, NULL, '2024-12-27 11:24:27', NULL),
(256, 127, '', '$2y$10$Zk3/leEwygsP8PzWDmhmh.DMxK0gxR/zHR0fy3mTWtfC0/CXIYfCC', 6, 1, NULL, '2024-12-27 11:24:27', NULL),
(257, 127, '', '$2y$10$9LdVT4I2cTs0gqWlr5.fZOz9.Sbg6OjeizcdvPvvdpDvqDTTXrCP6', 7, 1, NULL, '2024-12-27 11:24:27', NULL),
(258, 128, '', '$2y$10$QvnYrK3xjdoBUD6b4vLBVeRJuBXGsyOjEVI8.fD.TS8TZgmyKqDNe', 6, 1, NULL, '2024-12-27 11:24:27', NULL),
(259, 128, '', '$2y$10$Ea3jhsZYjvZC4CrxA2uOq.CBiZv54RrANwJOevmJo28nUIZW4zmOq', 7, 1, NULL, '2024-12-27 11:24:27', NULL),
(260, 129, '', '$2y$10$fS6npviPVyRwCoNW2W5.je1AsP8fJE9/TEEWBD0tIHJsPAX8jr.mC', 6, 1, NULL, '2024-12-27 11:24:27', NULL),
(261, 129, '', '$2y$10$TFIQaHF0Kmll3fEOeuK9Lu0X6l3329EbEh3mBLvKvYSrtB.AfXDze', 7, 1, NULL, '2024-12-27 11:24:28', NULL),
(262, 130, '', '$2y$10$Wdirk.7TB58h9vVvVgyQouBTzwUYecqANe0L/.4142BylqZBwud1q', 6, 1, NULL, '2024-12-27 11:24:28', NULL),
(263, 130, '', '$2y$10$A29SH0e24rAvmlNgcVoORO8kYl7JEOV9zpdXdzf9Uk087AcfM/Jf6', 7, 1, NULL, '2024-12-27 11:24:28', NULL),
(264, 131, '', '$2y$10$EegQE53Rv7hhhCiS6gjyMuEdhCVtGe6jo8v76TZOR61T6zkTz8Wle', 6, 1, NULL, '2024-12-27 11:24:28', NULL),
(265, 131, '', '$2y$10$N7UyDofVw4Mk9Fz6I/u1pOdRaHGtLjcknXmrBjnYbRDVDORDbwCIe', 7, 1, NULL, '2024-12-27 11:24:28', NULL),
(266, 132, '', '$2y$10$plmrGJ1RWEuyePTmyFjauOPyEw/RAH.xs6S7vUTz2lp524YxHXsy.', 6, 1, NULL, '2024-12-27 11:24:28', NULL),
(267, 132, '', '$2y$10$wc0F19wz2pxd1T63uJ.qje4JIWYW3swzyHfZTpgr1PFI8Q0GfSRqa', 7, 1, NULL, '2024-12-27 11:24:28', NULL),
(268, 133, '', '$2y$10$A4p29jDP9RPD2FWt3vMgg.rwto0NAMNYroCQ1ILzDkcYki5PfsDVW', 6, 1, NULL, '2024-12-27 11:24:28', NULL),
(269, 133, '', '$2y$10$qjQBgtxbJfEiU8R9pM40TOZkH2Jj/mL5r.tK.1PjuvgXtykJuvo2q', 7, 1, NULL, '2024-12-27 11:24:28', NULL),
(270, 134, '', '$2y$10$E9KHcfRrUaUS7G5YyX3pyewzNI0nHDIPwBFcWuRYL/hfp3UCUdZbe', 6, 1, NULL, '2024-12-27 11:24:28', NULL),
(271, 134, '', '$2y$10$Y3TmJPJ9C9raqdigskp2Y.PmJopStGhnDvyfP9669fxOTEqnISf1q', 7, 1, NULL, '2024-12-27 11:24:28', NULL),
(272, 135, '', '$2y$10$kqK/YHJuBC24PwVnAtMKLO2mC4QUrCc5i2m//pTLU4XnWL7T1el9O', 6, 1, NULL, '2024-12-27 11:24:28', NULL),
(273, 135, '', '$2y$10$D8SQ8Ni/CW516W/c3P2J9eyicpOTSR5qyxq3W2hcf4igwqTbjuYfi', 7, 1, NULL, '2024-12-27 11:24:28', NULL),
(274, 136, '', '$2y$10$Vvc5ec0rouhuGClXO1be0.pY5n/aaoRHc0hZ4LaPik0HnKg2mIdkG', 6, 1, NULL, '2024-12-27 11:24:28', NULL),
(275, 136, '', '$2y$10$0mmwVcGR6eYZHdukSlIQi.MEYBzIVO5BCIOr4OVmqchKiD74hAStO', 7, 1, NULL, '2024-12-27 11:24:28', NULL),
(276, 137, '', '$2y$10$ZQnekBjjL2OQ8cqkwytwK.dLq13G7ani580wgrIVkueo/I52GnVW2', 6, 1, NULL, '2024-12-27 11:24:28', NULL),
(277, 137, '', '$2y$10$MHyLQYZU5ji5pqKl50dwueS21FmdNBoAMZWSrVBN/NHnDXxqn1Bme', 7, 1, NULL, '2024-12-27 11:24:28', NULL),
(278, 138, '', '$2y$10$EMQEp2fS9y2leTP6/eYFTeqSO3GFmGutLKFzhABcj3rDXJGo4nRSO', 6, 1, NULL, '2024-12-27 11:24:29', NULL),
(279, 138, '', '$2y$10$Es5iNrswNvFwszI1J5V4neMIic3FnlCGzKpMfxSoBm4qOHcn5jo3u', 7, 1, NULL, '2024-12-27 11:24:29', NULL),
(280, 139, '', '$2y$10$5GHzdX21RAcAmHYo3gC7TOBJHaxNeayB7mCZEhlKHyDVKUX8Adl1O', 6, 1, NULL, '2024-12-27 11:26:08', NULL),
(281, 139, '', '$2y$10$HOGjm.ZQNCeqMKDM19Mba.wIkB2uBklh4LEHV67.1eyJV6Y09ZMT.', 7, 1, NULL, '2024-12-27 11:26:08', NULL),
(282, 140, '', '$2y$10$HR/a21dxTeyr1purwEF3H.ik52dQQETM.8J960TK86NQ.Z6ecxN3C', 6, 1, NULL, '2024-12-27 11:26:08', NULL),
(283, 140, '', '$2y$10$cn28y8cMVf5qilQj1Qc96erHTIB4JTwcrdK/RO3SXZ..ciKWokwpi', 7, 1, NULL, '2024-12-27 11:26:08', NULL),
(284, 141, '', '$2y$10$vSgoHbuzE4sReQVpQP.Z..gsleIRj78wh3IrkRvFt4x1fO/4BcjNi', 6, 1, NULL, '2024-12-27 11:26:08', NULL),
(285, 141, '', '$2y$10$A7AOXjZidkV7dCaTBybg7Ot/WuoMSZqF3zoH6VUD1BCpKXyEPePP6', 7, 1, NULL, '2024-12-27 11:26:08', NULL),
(286, 142, '', '$2y$10$Bh6uw1cz/J8aKL3JCxtgAOrCdggOh1G8tn5iA1SfoJ8W3rLxWB2d6', 6, 1, NULL, '2024-12-27 11:26:08', NULL),
(287, 142, '', '$2y$10$c77nz2IZMFyixyQnRoBrmO2edO3SFHjNVqLNi0i551y1.RxIVjbbi', 7, 1, NULL, '2024-12-27 11:26:08', NULL),
(288, 143, '', '$2y$10$Mk.cK84g7s4til5Tro67UumVu9ahP1hagcAeCJ7FX4X4oHChV2Cx6', 6, 1, NULL, '2024-12-27 11:26:08', NULL),
(289, 143, '', '$2y$10$j7uZFp30GSn/Ezmm6yAF9.ymV41QTgIG8x5L38cC5HLbtpv/bhpJm', 7, 1, NULL, '2024-12-27 11:26:08', NULL),
(290, 144, '', '$2y$10$VQv9C6eGu0B82ZcBw0sbd.VNCkeUC2JN9NS/dVvWBs1bkGagPnqFC', 6, 1, NULL, '2024-12-27 11:26:08', NULL),
(291, 144, '', '$2y$10$p7oZu2Y7T0C6rIT4HsBjAurBaFiH4Ip7OK4EbDGo0adZ1FoT8aA9i', 7, 1, NULL, '2024-12-27 11:26:08', NULL),
(292, 145, '', '$2y$10$PIQC9g4mkx8afW3S943exOkzMgo8E/3Q2KuL7IpHwh6W3jGXN/Xv2', 6, 1, NULL, '2024-12-27 11:26:08', NULL),
(293, 145, '', '$2y$10$3tvrSi47OH.DU3ehdnicuOTRSPhoEpMaQhaj5gYML0i3A4rmIoMoS', 7, 1, NULL, '2024-12-27 11:26:08', NULL),
(294, 146, '', '$2y$10$.B.fkPYfsCAnvbHePom2NeRvNyScKOX01txBQ12VG5Vqqxjd.dnEi', 6, 1, NULL, '2024-12-27 11:26:08', NULL),
(295, 146, '', '$2y$10$AQm4msyQy5rAqtdu.9fP5OxviQqWyNWpPAnCvQTnfmhMUs4loHlY.', 7, 1, NULL, '2024-12-27 11:26:09', NULL),
(296, 147, '', '$2y$10$0AIwdVH/JxzVqYutwO0gie/IckgAEp/76CyH32HlS5KP4i.XCedge', 6, 1, NULL, '2024-12-27 11:26:09', NULL),
(297, 147, '', '$2y$10$D3d1SdTekMjUcufaEpp7uOveoFKJ1A6KB9sHBn1OuUDdA2zwrMfxe', 7, 1, NULL, '2024-12-27 11:26:09', NULL),
(298, 148, '', '$2y$10$enoaks/aO6UwVEweGlir..1kv7kiy0itH5Ao85Trv9ylD2kEMopHG', 6, 1, NULL, '2024-12-27 11:26:09', NULL),
(299, 148, '', '$2y$10$Oxx3QWIJsOvHePe4A0o13uKnSfmKLfHdLag/Mn9QTwKYqwm/3nr7u', 7, 1, NULL, '2024-12-27 11:26:09', NULL),
(300, 149, '', '$2y$10$cDRBgqQp4F1QLcqJxvEgc.V7fx4T4z2DDNsRTFtz8RjOQQw7kEKr2', 6, 1, NULL, '2024-12-27 11:26:09', NULL),
(301, 149, '', '$2y$10$VVgmY9T3N0O4m8XwzEcgSuWPy30m1JIz0rNK0m6nlpItCQ0je9cqS', 7, 1, NULL, '2024-12-27 11:26:09', NULL),
(302, 150, '', '$2y$10$NjJSAoi98dqDKX.woVG3pu0KtfJc56cM76A/aSvaiNv1gUJKngv0a', 6, 1, NULL, '2024-12-27 11:26:09', NULL),
(303, 150, '', '$2y$10$wyovMLeocPnVDE0LXnEwiO/9ZIRqnOrzbfPVJtyBkzVMzja1RxmNK', 7, 1, NULL, '2024-12-27 11:26:09', NULL),
(304, 151, '', '$2y$10$B5ai.iy1GauSOqrtH65xxuSvYg4auUxYWNN17UpL1IZ8A/7Q5X.YO', 6, 1, NULL, '2024-12-27 11:26:09', NULL),
(305, 151, '', '$2y$10$5KYPb8aAVLylJVWCBghNceNLsLd.Nxnjc3wUDI0HcnaGykZeR8zRG', 7, 1, NULL, '2024-12-27 11:26:09', NULL),
(306, 152, '', '$2y$10$l5QwJT76vdnLIAxh7kYHLunMXtTdXcq5qyXNvu.geM1mR1W8xL.by', 6, 1, NULL, '2024-12-27 11:26:09', NULL),
(307, 152, '', '$2y$10$YTx3WdhVaibebtijEmi9eOpMLwjzVX/iu/FfPL47Ys5MbsATRJ7s.', 7, 1, NULL, '2024-12-27 11:26:09', NULL),
(308, 153, '', '$2y$10$VOuD47QchD/pcRz.lT0vd.65YrR23f0EFYjqLJbIDv.mo3o1C43Ra', 6, 1, NULL, '2024-12-27 11:26:09', NULL),
(309, 153, '', '$2y$10$8xHClf1lcVzFCwtA8brwLOzQyk.MM48AKsGQfHGxcahX/EiNYkI72', 7, 1, NULL, '2024-12-27 11:26:09', NULL),
(310, 154, '', '$2y$10$1bdZJVNgUrslzIw6lWDrAO7IQo6py9IC1H.ESTWi06xxTjfzZ3swy', 6, 1, NULL, '2024-12-27 11:26:09', NULL),
(311, 154, '', '$2y$10$xsg6OeANrAriXSKwUY4joO4JRWSK4qOGsO9YLdKqqiJkdr2SdfYDi', 7, 1, NULL, '2024-12-27 11:26:09', NULL),
(312, 155, '', '$2y$10$kh5142UcXPRnpOmPTA.3sO24q3CMR0v1EEU5VO7CHFtyy8iHE4LwS', 6, 1, NULL, '2024-12-27 11:26:10', NULL),
(313, 155, '', '$2y$10$tJqxMBK4PH8RvjcRhQ14iuBNFO7A7D6EJ0X219I9bzDOJNGv.9YCS', 7, 1, NULL, '2024-12-27 11:26:10', NULL),
(314, 156, '', '$2y$10$n8baTCBg7aopl.j4G8JSouZR2LtoWCsTVMH3FOQK5cFfm1XS/2DNy', 6, 1, NULL, '2024-12-27 11:26:10', NULL),
(315, 156, '', '$2y$10$Vbp/a6XrWETCHzuvfnt31.67j9CWc3XsD7elZnbdhGvgbFUJITweK', 7, 1, NULL, '2024-12-27 11:26:10', NULL),
(316, 157, '', '$2y$10$tW2YdP9Pu/XBttDcEw65yOVpUgXJTRg.aTEbRkHPYFCblsZZXe48S', 6, 1, NULL, '2024-12-27 11:26:10', NULL),
(317, 157, '', '$2y$10$fArkUf6LDIMQSUA/QgT85.tdu1L8jb4VWmQ/FnBPTYT3mZBIueGda', 7, 1, NULL, '2024-12-27 11:26:10', NULL),
(318, 158, '', '$2y$10$nS3wBeZIdxmdRYHjjv1iXu.qS0q1mH8CynSRLvrfRA9Vdp7WG.qIq', 6, 1, NULL, '2024-12-27 11:26:10', NULL),
(319, 158, '', '$2y$10$8bMzDT/Oe9I17QkbRYGijuAyHf/ZN73eQyW8wEZOSsAf6NnbJfY0.', 7, 1, NULL, '2024-12-27 11:26:10', NULL),
(320, 159, '', '$2y$10$yK1SyfE2qBF/O7I21.qkhOfI7r.XltDrNizONB0vutWBjxjxcXXDq', 6, 1, NULL, '2024-12-27 11:26:10', NULL),
(321, 159, '', '$2y$10$at5T6P65tLU29jxLd4FR.OiE9wUjrUO3rwCQSzfa.8qqrVsI04PBS', 7, 1, NULL, '2024-12-27 11:26:10', NULL),
(322, 160, '', '$2y$10$lP35kqUR2YIeMXWir2j/pOi66dHNRlf9pf39ynsD6xj6RgpKGm3bq', 6, 1, NULL, '2024-12-27 11:26:10', NULL),
(323, 160, '', '$2y$10$jVbdABB/aL7R2AU11zX60u9jVlk0AxruYStSa9sNmViK20YlVBSrm', 7, 1, NULL, '2024-12-27 11:26:10', NULL),
(324, 161, '', '$2y$10$EihydWDgxwujPuHXxv9S5uM./tZY6WX/kwmOObmd1O8v4MHqDZd8e', 6, 1, NULL, '2024-12-27 11:26:10', NULL),
(325, 161, '', '$2y$10$sQvRjziJh52rEmKRVMnASOTZcrxopUci/LyOsjmWAMzhnbT3w0eGK', 7, 1, NULL, '2024-12-27 11:26:10', NULL),
(326, 162, '', '$2y$10$aehmnIdbQnln5lY7frksOO8rokF.1oqg4cXvwENv3EadIMzCg9f4a', 6, 1, NULL, '2024-12-27 11:26:10', NULL),
(327, 162, '', '$2y$10$sfRlYP1FjYAe8vmh9lB7/.EqYdcXlr1mhEaAG0qBHTap1uV6dTvJy', 7, 1, NULL, '2024-12-27 11:26:10', NULL),
(328, 163, '', '$2y$10$XInZzNbut7iT2cXxMeIpC.tD6pMuqhefQfQXKkNIAtXlndLjsduhy', 6, 1, NULL, '2024-12-27 11:26:11', NULL),
(329, 163, '', '$2y$10$DefWi.d/cKv1j/lLIyCqCOgJEFzVYkcEUF6iDT1J8uycnyIu0aK6K', 7, 1, NULL, '2024-12-27 11:26:11', NULL),
(330, 164, '', '$2y$10$ugetjN8zdlbbCSc7jI4bfeGyRmGbW8e4zRrOPXjblBjo.dmcGZnfy', 6, 1, NULL, '2024-12-27 11:26:11', NULL),
(331, 164, '', '$2y$10$dJ0.wpSJ5fRc9ZJscPDEfO0TgH6hJSEP/Jhe/FDTjWms34G.xkPq2', 7, 1, NULL, '2024-12-27 11:26:11', NULL),
(332, 165, '', '$2y$10$/4a1Ydvei3WbM.TI6PYlEuxnJbxq9vMl1AoU6bDezyucIDLlJcg9K', 6, 1, NULL, '2024-12-27 11:26:11', NULL),
(333, 165, '', '$2y$10$rkcoIPimW3u8HP.wGA5Am.dHKu/t2AngsX58BTXXPJBQl5Rf6TaLC', 7, 1, NULL, '2024-12-27 11:26:11', NULL),
(334, 166, '', '$2y$10$FJCivP8ll4W2DnnI9x7uIu/749AbF37p.VP0yyIzVlYAj8AstucbO', 6, 1, NULL, '2024-12-27 11:26:11', NULL),
(335, 166, '', '$2y$10$JClj8uKQlyK33UQ1lYbgLeG9Ime4BNGebiAt2LgEdClrWhnwZXpoe', 7, 1, NULL, '2024-12-27 11:26:11', NULL),
(336, 167, '', '$2y$10$62fxh1a3HLIHI0rtozMicOFtothfozCdrdQ0nH1qH5IqM/ZHbM/Uq', 6, 1, NULL, '2024-12-27 11:26:11', NULL),
(337, 167, '', '$2y$10$iFiz8je4XJWQ7Aea3dQpx.LT1Xj.TU1kZXprqO0CAJSXLitPAlADa', 7, 1, NULL, '2024-12-27 11:26:11', NULL),
(338, 168, '', '$2y$10$iGlmyQWQ1mfUuZ97HuDR3eFF04Xsqi78qwTjD/.y7p7FzVT3PaMe2', 6, 1, NULL, '2024-12-27 11:26:11', NULL),
(339, 168, '', '$2y$10$dMGEpxK/lbnD2vOZUwtbV.0/EV5.VjlUrkdcmhVyoT7Xe74xbiRmy', 7, 1, NULL, '2024-12-27 11:26:11', NULL),
(340, 169, '', '$2y$10$bir9WlEVPjkF5d7/XyetGe8f7k2AvVSvA3hphBxu0ZBrTzC90l0vy', 6, 1, NULL, '2024-12-27 11:26:11', NULL),
(341, 169, '', '$2y$10$HEBGB01sOEkbJiWOCOflc.uYecDrGEIDWK6bbo3s9QmHfo0o3ZdMO', 7, 1, NULL, '2024-12-27 11:26:11', NULL),
(342, 170, '', '$2y$10$.RA6bBHI/xUDzI29kpCtxelqQ.0rIx1RIbZLwBt9KXO6wJJRAKz.u', 6, 1, NULL, '2024-12-27 11:26:11', NULL),
(343, 170, '', '$2y$10$BIFWsGAZlPPxcT2gjzCz1.PsEumQSynP9/iYzB3zeLG8coFjy.zDq', 7, 1, NULL, '2024-12-27 11:26:11', NULL),
(344, 171, '', '$2y$10$aalBp8MMQ8xM2VjkbdYtiuLM0hJKSthxvQ.y5R2VDADEnYICOpjCe', 6, 1, NULL, '2024-12-27 11:26:12', NULL),
(345, 171, '', '$2y$10$TEGyNUuftsgiXKYTKeK4FuF6kRghgIEV1lV9N9.o7JPrFrHJZcIu2', 7, 1, NULL, '2024-12-27 11:26:12', NULL),
(346, 172, '', '$2y$10$nFVLkrSpxUJTfc1MlyKh9uj5.iVwE8kfzdxzDTLmxY5hxDvqUcZD2', 6, 1, NULL, '2024-12-27 11:26:12', NULL),
(347, 172, '', '$2y$10$3HnF7ufKMcqKzgQ1hCHgwe0qSDrAOYWUP.uc.j4/8Z1tNiVm8v8Wi', 7, 1, NULL, '2024-12-27 11:26:12', NULL),
(348, 173, '', '$2y$10$0gTJohpbAXziNyQXBqSF7OMeUin1D0/3/nHMJ7A2v.d9ny9qprIOO', 6, 1, NULL, '2024-12-27 11:26:12', NULL),
(349, 173, '', '$2y$10$6T0pXXYNphEFpCDjWDPhaO6GlbQZwJGVlqI6A6SHl38mdKWm59yKi', 7, 1, NULL, '2024-12-27 11:26:12', NULL),
(350, 174, '', '$2y$10$7f6vwOo1jx3GZwzU2ON7QO05QOYUBeEEyJe1Z2ji7.MYyZutSkY.u', 6, 1, NULL, '2024-12-27 11:26:12', NULL),
(351, 174, '', '$2y$10$IL/B8dnswaFMQ/r4Cmz7ueh6N6F9hEqrLHEI26C7H0177p95UzHbG', 7, 1, NULL, '2024-12-27 11:26:12', NULL),
(352, 175, '', '$2y$10$0KvQ9vVy.kPLZepnX.3BluP/mHt2ijLJuzakfFi8N0rnbePd0CtFm', 6, 1, NULL, '2024-12-27 11:26:12', NULL),
(353, 175, '', '$2y$10$JW288/06pAFTxZUIK2PvA.zhVzh2pQmQTseJCpLI/uV0hg8zeVmpu', 7, 1, NULL, '2024-12-27 11:26:12', NULL),
(354, 176, '', '$2y$10$Gmj/DazmFKtBOEeJbU3jVOQZWT7fdpXLz5Cu.Xv8Ny4CP5CU.JL8i', 6, 1, NULL, '2024-12-27 11:26:12', NULL),
(355, 176, '', '$2y$10$bezkRMJ2QQeHNT.JeFZytuugFkKVNZF..Z3ul2MZXn1LhzCNhlbOS', 7, 1, NULL, '2024-12-27 11:26:12', NULL),
(356, 177, '', '$2y$10$sqmIJacR8JKAwLmtWmsB3ePvcufbX40OvV77fR7NXnTdrX7b8qszC', 6, 1, NULL, '2024-12-27 11:26:12', NULL),
(357, 177, '', '$2y$10$M5R2EvFAAL8Jxj7SrXf1XulR8MpO.5fO2pBiNmSP6RTT4Wg1zs0my', 7, 1, NULL, '2024-12-27 11:26:12', NULL),
(358, 178, '', '$2y$10$Of/B8vGXMari7eNdV8yoA.Sc8iMkBFYulGa7eabbmmhVzPv3nTpou', 6, 1, NULL, '2024-12-27 11:26:12', NULL),
(359, 178, '', '$2y$10$ASRM8v1g.aaf/53K23Zr0eTEc/DkoSy6imQPQeImPLQoVoLlHzIqW', 7, 1, NULL, '2024-12-27 11:26:13', NULL),
(360, 179, '', '$2y$10$1G8l/S5jbagoZqmnmVfaUu60eklR68US.mVAIrvl2v0pJ3VVdQEXS', 6, 1, NULL, '2024-12-27 11:28:14', NULL),
(361, 179, '', '$2y$10$G3GaCzFJK/yYAEniPuFQYei80IwS7JgtHBX6VRj0z1dGSgWtJeCkO', 7, 1, NULL, '2024-12-27 11:28:14', NULL),
(362, 180, '', '$2y$10$Tn4ToAz9lC6oY7pIKxuQJe99oH9UOsA1o7e/fy21yBlC.sFQNRG9i', 6, 1, NULL, '2024-12-27 11:28:14', NULL),
(363, 180, '', '$2y$10$bhxvvbfEA2CPbhre34Q1jem7btilHwaAsU1o6uino1l117xvBIvK6', 7, 1, NULL, '2024-12-27 11:28:14', NULL),
(364, 181, '', '$2y$10$Z5SNUWUJWGsYXJ5D2RW62.vj0j7zjMsffgryxwFGB6wnCGwXxyHGC', 6, 1, NULL, '2024-12-27 11:28:14', NULL),
(365, 181, '', '$2y$10$8CJtTTWoJn.PJfhzxKNTKepc74LFTRKdUeU9M6PTQ/1nuTgbE.2E.', 7, 1, NULL, '2024-12-27 11:28:14', NULL),
(366, 182, '', '$2y$10$2cBOz0r6rGXqHpdOB1obd.gYEl3BpobJxm7BWdD2PfbAGqZaRkT7q', 6, 1, NULL, '2024-12-27 11:28:14', NULL),
(367, 182, '', '$2y$10$YFspsHz0JyQhFgGxE8qaR.l1QhtoZ8Fz7GdJxGwoY6PkbdBumKhgS', 7, 1, NULL, '2024-12-27 11:28:14', NULL),
(368, 183, '', '$2y$10$UZFHXxfm5m7uI/ZklIP06e65JDTfi6X8XhDDxGC4tEgo0GWaUlFGa', 6, 1, NULL, '2024-12-27 11:28:14', NULL),
(369, 183, '', '$2y$10$COI0uNvt.AD/Qsj8uDUjjOwMQgasmJ/Hb8kdslDp7zCmH25z04Pc2', 7, 1, NULL, '2024-12-27 11:28:14', NULL),
(370, 184, '', '$2y$10$MWeYdDZR.9pA7Wy7bjVhueVBiQSaIMqrOnOunPg2qfPeyBKQwfH6S', 6, 1, NULL, '2024-12-27 11:28:15', NULL),
(371, 184, '', '$2y$10$qUj.VtqgRVMauGlO6IotJu3KyDp87F4zhygjDJrVbphvwBAesFK7O', 7, 1, NULL, '2024-12-27 11:28:15', NULL),
(372, 185, '', '$2y$10$e6CqmH2ctvGojK94DEpFHO7PXw6GMsPqk3kyACBUppvgkRV.7UnVq', 6, 1, NULL, '2024-12-27 11:28:15', NULL),
(373, 185, '', '$2y$10$zoVX4XDqBafE0P7FbvgyhuvmiAUP/1U8FB36.7iMKYA.WRmk9Ekrq', 7, 1, NULL, '2024-12-27 11:28:15', NULL),
(374, 186, '', '$2y$10$NO7IAdafNg4YMjL/3cb8Nuwcf.aOFP1tbtrCxhhrx7bnLks.KuGP2', 6, 1, NULL, '2024-12-27 11:28:15', NULL),
(375, 186, '', '$2y$10$o2jxEdW5tN61caJwmnuPouUuVr4tDCMEjMZ7SeBJizEIW4uN33Z6S', 7, 1, NULL, '2024-12-27 11:28:15', NULL),
(376, 187, '', '$2y$10$IaSUiC7u0NvKwQIpVvf8ZeY338PARUno730JTjVDpTNWWk15S7cqW', 6, 1, NULL, '2024-12-27 11:28:15', NULL),
(377, 187, '', '$2y$10$L3NZ4s6iwBGpbD7d/qF6N.XhvkWV.zT2HS2/oOzV9ABPu43rj/J4y', 7, 1, NULL, '2024-12-27 11:28:15', NULL),
(378, 188, '', '$2y$10$1cosyRlQz51ei11tDucdNeejz6D957UVglRwYgHFtquIQT8c5i5Vm', 6, 1, NULL, '2024-12-27 11:28:15', NULL),
(379, 188, '', '$2y$10$5ZNxdAEw3YjWY4vICKaGaeEBIqQcDPPqahqVqV3EBelv.KeoV1.Ke', 7, 1, NULL, '2024-12-27 11:28:15', NULL),
(380, 189, '', '$2y$10$UiIe.0YfXo7hChFCEPh6iuCvkTMbDv1p/MslpTSAR1CyUPuNXK6fm', 6, 1, NULL, '2024-12-27 11:28:15', NULL),
(381, 189, '', '$2y$10$wt.44C92hXkIJL6JkAwYRuX0ZiJdL2VIMEmboyUX8JDMbRflTU9ka', 7, 1, NULL, '2024-12-27 11:28:15', NULL),
(382, 190, '', '$2y$10$B5d4fGzaALo4lAsLkH/cZOLR8uarIprKVg9WDNz31/O5CA8xlM4fG', 6, 1, NULL, '2024-12-27 11:28:15', NULL),
(383, 190, '', '$2y$10$rU98jLFXz1RmxnQd6JHCQu4jaV3q5eC6NkJuYLH.dS2cnmU9fVRSy', 7, 1, NULL, '2024-12-27 11:28:15', NULL),
(384, 191, '', '$2y$10$2M0TgxBhI6boBxIZlDZ6Re3Sv6B6SqI9emQzFhy7aOkYpcFoAPb9C', 6, 1, NULL, '2024-12-27 11:28:15', NULL),
(385, 191, '', '$2y$10$ZTWI59LOdbgZlBsEg3IjPei9wFSjAxpQHHb.tk7Wpy7e/viRKVOta', 7, 1, NULL, '2024-12-27 11:28:15', NULL),
(386, 192, '', '$2y$10$ZPJwhtiuMoeG4bE7Dsgv0.Vt7LNQ19..T8aqSSiOrgvkY11X7s9nK', 6, 1, NULL, '2024-12-27 11:28:15', NULL),
(387, 192, '', '$2y$10$A7Vh9Kww9pxq3wGvwKAKhe4m30UwRmS6KUoNqUoCx0a3yTafEnkvC', 7, 1, NULL, '2024-12-27 11:28:16', NULL),
(388, 193, '', '$2y$10$OraMCkSStHcaK4jtAUYS0OYp/YEmhpCsn7n3eByDSG4XzUbcTX9EW', 6, 1, NULL, '2024-12-27 11:28:16', NULL),
(389, 193, '', '$2y$10$FFjbxZdMHWftl8kwGDLbYu3.iqnSYdlf9tDNN3irpXUHtFU/zRSr.', 7, 1, NULL, '2024-12-27 11:28:16', NULL),
(390, 194, '', '$2y$10$8rPVp7wRoY6fKnQpdgtk5e5ZzjEueFQ1JVh5hOSrc3Gbbschq8ed.', 6, 1, NULL, '2024-12-27 11:28:16', NULL),
(391, 194, '', '$2y$10$rxEtxWKKfVwnJ57YV2eyQOTVbA1eXCLCpigVRZTGjlesVz4HcM6W6', 7, 1, NULL, '2024-12-27 11:28:16', NULL),
(392, 195, '', '$2y$10$ChXfYcQpjB7eUcaI5Lqb9.83QecvlF2MSRVrAB22qI5ca8vYuYtbO', 6, 1, NULL, '2024-12-27 11:28:16', NULL),
(393, 195, '', '$2y$10$MD4HEF8rAo5AUeYCIxBhCeq68rrLet7VJWZKsIM5O5OYbCFPL0I12', 7, 1, NULL, '2024-12-27 11:28:16', NULL),
(394, 196, '', '$2y$10$.TNKR.8NNTgCWr/5rzQ3ne5DyKWGWKG4YZZyh6iWomDrGyEqC4mHe', 6, 1, NULL, '2024-12-27 11:28:16', NULL),
(395, 196, '', '$2y$10$6JwwnNXVKMjEpDtqcQlm7.PcQj6TihHoaEhC5YitsWu/R/d3XUilS', 7, 1, NULL, '2024-12-27 11:28:16', NULL),
(396, 197, '', '$2y$10$LOk7vRUDVCjyTCqpOyIcxOdxl0LtYL.xXN.kLx1n0DTsE3FAB2w6y', 6, 1, NULL, '2024-12-27 11:28:16', NULL),
(397, 197, '', '$2y$10$gZgo6B7JtdGtdpMHc1AzD./ZAPItvxYhXAgHGmzjEi64MQdg0k2Ie', 7, 1, NULL, '2024-12-27 11:28:16', NULL),
(398, 198, '', '$2y$10$w3nBG2doAYV/zLqnZPPCfO3JQoDdIlMmPRrwW.ifLDprXQker8DnC', 6, 1, NULL, '2024-12-27 11:28:16', NULL),
(399, 198, '', '$2y$10$JysWpBy2ue5tyITB.0h8ce6rEbf3jb2aOIaVgovj5jSAPKpmnH/bG', 7, 1, NULL, '2024-12-27 11:28:16', NULL),
(400, 199, '', '$2y$10$4HFxMQQRtSNWgpYTWn79k.JHNXdWnjyM3WzGBvZiVdxi7GgOYhiK2', 6, 1, NULL, '2024-12-27 11:28:16', NULL),
(401, 199, '', '$2y$10$JSC.id0i9KY0eAKihKLXFeXafZvxb8wvtWn.jNU3QnxuqaT/TnYki', 7, 1, NULL, '2024-12-27 11:28:16', NULL),
(402, 200, '', '$2y$10$MxXMsf.fJSFl1DIHsywP8exYA.ykYOPrvFO0hHrIpdwiYcin/L.NO', 6, 1, NULL, '2024-12-27 11:28:17', NULL),
(403, 200, '', '$2y$10$YpfCT3IVInJCTi3s.MPCUOJI/ejn2QMzfFoiVPGyNLdF.UUuaPyQC', 7, 1, NULL, '2024-12-27 11:28:17', NULL),
(404, 201, '', '$2y$10$fkdGKBVjd2b0n5FzE5JD1.DaKqjdgx4Pf451OabjtmT0h9PVt2QO6', 6, 1, NULL, '2024-12-27 11:28:17', NULL),
(405, 201, '', '$2y$10$GAeKBwaAtCm4C.FGgBqV/uGP.1cuidLEAb3lyS/rkBCJp4XnqOgXS', 7, 1, NULL, '2024-12-27 11:28:17', NULL),
(406, 202, '', '$2y$10$U1rxkB6uesa3t8wV4Fro4efOOfxtfhtwuPkr0Gj/k6dFA7QeWzn6.', 6, 1, NULL, '2024-12-27 11:28:17', NULL),
(407, 202, '', '$2y$10$LPq97vuGUwEjjLrH6EE14uynQALBwQfYl0aN./QfjLvm3o1zMcQmS', 7, 1, NULL, '2024-12-27 11:28:17', NULL),
(408, 203, '', '$2y$10$7yQbgvo22LFVVDUG2fsRjO2aaMy7s1PXVsHExnsMEm016r6M1V.je', 6, 1, NULL, '2024-12-27 11:28:17', NULL),
(409, 203, '', '$2y$10$MBo.BokLVtDuge.ppI7EW.y6UAooIA7JY.NkM7UIofBeXX5Zt4h9.', 7, 1, NULL, '2024-12-27 11:28:17', NULL),
(410, 204, '', '$2y$10$coPgpowJZouN2xB380Kh.OfHTGxvNc4zfouhq0x55L4IC4SjccX2u', 6, 1, NULL, '2024-12-27 11:28:17', NULL),
(411, 204, '', '$2y$10$AY2fXTxmRmnJP10kkIDNiunipnBwLjLjn1EwShhijNAMjwnzyUYze', 7, 1, NULL, '2024-12-27 11:28:17', NULL),
(412, 205, '', '$2y$10$rnAHC4snRqQhxTBBn3k4YOXo.2aETI/.ZydwpCIcQqBxDCj31G0fy', 6, 1, NULL, '2024-12-27 11:28:17', NULL),
(413, 205, '', '$2y$10$5.UA.eqmlKzB8/STKDxQLe5fnFg2Jo5QXXES0UyblHbHw9r8BhkpC', 7, 1, NULL, '2024-12-27 11:28:17', NULL),
(414, 206, '', '$2y$10$ji6uR1Xy/rX.5omwybyciO9L5OV3Oj7PQDIgNlxZESYqq1qUNptf2', 6, 1, NULL, '2024-12-27 11:30:01', NULL),
(415, 206, '', '$2y$10$sxOgLZz6M1Af6xr3rBmbSOOBjN7LQQIYiohgKSh9/6ME/Sj0k6hiy', 7, 1, NULL, '2024-12-27 11:30:01', NULL),
(416, 207, '', '$2y$10$n10DiFSme33N7OU4HqtUkeuN5UMKmHgxh.0TQKguyBq/LpQloauAu', 6, 1, NULL, '2024-12-27 11:30:01', NULL),
(417, 207, '', '$2y$10$twnWBpPmE0fv1U/CtTN7Cu3r4uOSTMXRv3FhI1YKV3ajFEKtVXx2C', 7, 1, NULL, '2024-12-27 11:30:01', NULL),
(418, 208, '', '$2y$10$j5em69KX.5r/wBYcmdM00eLu7CAwX0mgfqdbspN20ioKQD7c7z9Ke', 6, 1, NULL, '2024-12-27 11:30:02', NULL),
(419, 208, '', '$2y$10$li.njKuLr48OfUpj7Csu.eEa8GJLYmpGdfoSOs1q9B2rSJdjX7CZG', 7, 1, NULL, '2024-12-27 11:30:02', NULL),
(420, 209, '', '$2y$10$.ryl/IYXZsDx.GnWcnchCeJZKHTAOxRa2Xj1cOzHECedu4Y0bnUte', 6, 1, NULL, '2024-12-27 11:30:02', NULL),
(421, 209, '', '$2y$10$zZ3d..qsWsWrVS06Qb2wye8CM72Jx2fIBmawy4uDagUGtwq/1wAf.', 7, 1, NULL, '2024-12-27 11:30:02', NULL),
(422, 210, '', '$2y$10$v4PDqiZDiW42t7KB6AKYxuLSJ.OISTptqs.J0gjANKSjOUDVsMk9W', 6, 1, NULL, '2024-12-27 11:30:02', NULL),
(423, 210, '', '$2y$10$v0rUJURKZAhk2qeh3/1Rbe2mr9rVh.IdbP.QhwdVoKTRufpDYthvO', 7, 1, NULL, '2024-12-27 11:30:02', NULL),
(424, 211, '', '$2y$10$WramoE741km.QtIUlKoA/uB1DZwXnTFQySTf5tycvhWZKjfdw/1l.', 6, 1, NULL, '2024-12-27 11:30:02', NULL),
(425, 211, '', '$2y$10$WgCs3yJay9CMhqL8b4.IIetxwjkQZaHSNwhA5jVeEzQsLWuvRUIcG', 7, 1, NULL, '2024-12-27 11:30:02', NULL),
(426, 212, '', '$2y$10$ACem9e9ftPHJ59b8dxwdfei/sgoJmYaQj0kKEqi699gVJiy8QrmL6', 6, 1, NULL, '2024-12-27 11:30:02', NULL),
(427, 212, '', '$2y$10$6hjpY0swUs5PIp4GemUX0.Y0oelQ3mJA.fHtnlzXGyoCJZU2h4xTu', 7, 1, NULL, '2024-12-27 11:30:02', NULL),
(428, 213, '', '$2y$10$6CnJZsRl26Qo.qkTLwzMWe/KwE1g1M1bwIMjqtRsWHbSh0klyqaD.', 6, 1, NULL, '2024-12-27 11:30:02', NULL),
(429, 213, '', '$2y$10$3NKR4OiS.f2b2fDOX2gCxONSPIPWcMtb8yhdRHy7hoS2Qhid7hqSy', 7, 1, NULL, '2024-12-27 11:30:02', NULL),
(430, 214, '', '$2y$10$HfniCng3.PgahVj7dXp4gezqL7rFrqSOdVrv138BZeQMQpDyAXBGG', 6, 1, NULL, '2024-12-27 11:30:03', NULL),
(431, 214, '', '$2y$10$1qGvrAnut3cLvdjNkn5rfuiiGgAR8tzgq0MBjef7yZmBtv/uRbwUi', 7, 1, NULL, '2024-12-27 11:30:03', NULL),
(432, 215, '', '$2y$10$zKlyOPxrs1OS7t7todLGF.YNXNG4zBU43cikbwDQtvYpGdZ1840Hm', 6, 1, NULL, '2024-12-27 11:30:03', NULL),
(433, 215, '', '$2y$10$SFRAmecQ1pE8OWK8n6QGF.WYerzrkHzUxk8LbFO1Q6no37CG.Hoe6', 7, 1, NULL, '2024-12-27 11:30:03', NULL),
(434, 216, '', '$2y$10$MzxdWevBJVRUH0TjRmw1tOSjkPQDIO6F242jz7CPd80IACo2WvXFG', 6, 1, NULL, '2024-12-27 11:30:03', NULL),
(435, 216, '', '$2y$10$asQi28jr/ypn43sfqLzMaeHZBDS4qtWoBV86r0qFvTqE85LnOBO4a', 7, 1, NULL, '2024-12-27 11:30:03', NULL),
(436, 217, '', '$2y$10$7.6.yKVd1vVvSZhPRJw6n.CS9kSrS6Q1beljBNne7sm/ZpiV4pYgm', 6, 1, NULL, '2024-12-27 11:30:03', NULL),
(437, 217, '', '$2y$10$TXKmlWL69TwtsMspZPqaje..kA0t8H0l1ZimTLEAdCnCqvxN6Doem', 7, 1, NULL, '2024-12-27 11:30:03', NULL),
(438, 218, '', '$2y$10$ynT2eyumcs3JA6G0IBIL2uJSF8tZBkNbvbUR2bfoH0HMaD/2GgJaa', 6, 1, NULL, '2024-12-27 11:30:03', NULL),
(439, 218, '', '$2y$10$EFtcqKRcItMHuwN0cBKT/OJv5DUSZKIBgBtBfUtVmnSbax/YIwGiO', 7, 1, NULL, '2024-12-27 11:30:03', NULL),
(440, 219, '', '$2y$10$4pTBxKc7zAHKdGcLoN5zMuqjyFkbVpI.l6PBumMpKHIRKEe97kSda', 6, 1, NULL, '2024-12-27 11:30:04', NULL),
(441, 219, '', '$2y$10$0fdIa1vUIuAzlBKJTyGfoOe7A/UIe7JPaFDbH/kNdKv0C46Z1/gFK', 7, 1, NULL, '2024-12-27 11:30:04', NULL),
(442, 220, '', '$2y$10$RaxFr93P0VG8B9jlMNU3AeJDGG7w/yNFKA.DI0aFawfSyZmj0uu6O', 6, 1, NULL, '2024-12-27 11:30:04', NULL),
(443, 220, '', '$2y$10$h1s8459Ml2jUtOmjfPl28OzVosbKhtb.ZpTuakXT7FuizukDIGc8y', 7, 1, NULL, '2024-12-27 11:30:04', NULL),
(444, 221, '', '$2y$10$OZi.UJAcylsi4aukyu309OCYrCyOcNhE8NbFpXAflheqQIQJYfvcm', 6, 1, NULL, '2024-12-27 11:30:04', NULL),
(445, 221, '', '$2y$10$KFLPKA6A8fsUIAc54LZ/TeSlCgAfiKPFDQliPE.KQ6xIfzb6wEfpe', 7, 1, NULL, '2024-12-27 11:30:04', NULL),
(446, 222, '', '$2y$10$fFWcQFIYLva.7BRVc3KOIev8r7.wdqgkewSQsvATWceWBgAo33C6W', 6, 1, NULL, '2024-12-27 11:30:04', NULL),
(447, 222, '', '$2y$10$MNPtGT82enIduK/3LEP/tOpg2loxB21lgxiWHEg2.q3UbmRKUPxmW', 7, 1, NULL, '2024-12-27 11:30:04', NULL),
(448, 223, '', '$2y$10$bi/TrYRocxGt.IjUga9eAO5BvE33EEw8kckbP.yTHBcIv9/4/UaKa', 6, 1, NULL, '2024-12-27 11:30:04', NULL),
(449, 223, '', '$2y$10$XIdxSUYKappC59elDfisnObqqaDOBSzuhbFYFe4bJhomZKKuTfnR2', 7, 1, NULL, '2024-12-27 11:30:04', NULL),
(450, 224, '', '$2y$10$Ci3PzPdUQ4MUaRkwJj/dve4xy/Zdkc3SGc3H0MUSYjd85TO9TsDlq', 6, 1, NULL, '2024-12-27 11:31:46', NULL),
(451, 224, '', '$2y$10$zDgDh82c9dBYvdoO6iM94e0CAjhy/y04WvE4AzVKNXikkOZmPFoXy', 7, 1, NULL, '2024-12-27 11:31:46', NULL),
(452, 225, '', '$2y$10$GfbKYry7buWi8PaqjZjET.Pltpnftl9xyk6oI.4gHxWdrMu6NZgpG', 6, 1, NULL, '2024-12-27 11:31:46', NULL),
(453, 225, '', '$2y$10$3vYDlP7fPjaFmLjyGHy8uehmEMva7XnPQoCv7oBoEaYOyCyuxn4by', 7, 1, NULL, '2024-12-27 11:31:46', NULL),
(454, 226, '', '$2y$10$t3lcQZaBUkvJPSv/dby/HeaLE3uBNTTkVwIJ./Ut5D6UNP2lU/Yaq', 6, 1, NULL, '2024-12-27 11:31:47', NULL),
(455, 226, '', '$2y$10$XpR2ryuIDKi05Q3Ys.ShmeqSuyaOTRXIWlF5VYBqeaca1PTxrjTju', 7, 1, NULL, '2024-12-27 11:31:47', NULL),
(456, 227, '', '$2y$10$TEVqn/iFCdp2NRX5JToUzeyft37Eu/hpNvne9chuBAqlyicTzg3I.', 6, 1, NULL, '2024-12-27 11:31:47', NULL),
(457, 227, '', '$2y$10$hAZcXWQUywGsRR.Ej8de.e.2xH5RwD3mpTLMN1W2vX1eyvxqxXy5S', 7, 1, NULL, '2024-12-27 11:31:47', NULL),
(458, 228, '', '$2y$10$JIDhSv4PDykUpYF32onv7eUjT70pC3iG49r7KByLQJWqS2qMKfFQK', 6, 1, NULL, '2024-12-27 11:31:47', NULL),
(459, 228, '', '$2y$10$6KopPSVLLXY5OAGHJfwB/ucMfOp4k/g8AXhAlP1xqfGrjGk9d7pCG', 7, 1, NULL, '2024-12-27 11:31:47', NULL),
(460, 229, '', '$2y$10$JC7HOWq4wAyCBT0amQuYRubbz0wZWlF.t.20IyPsFjQqYXvMYDcNm', 6, 1, NULL, '2024-12-27 11:31:47', NULL),
(461, 229, '', '$2y$10$uqOnovLHwAHxZP/f7UyYJ..LxjVHHe0tEc67HLNYD5/b7ZRRQT0Fu', 7, 1, NULL, '2024-12-27 11:31:47', NULL),
(462, 230, '', '$2y$10$FbQEvHkTTzAUCJC1swpbf.oboLZiH0qdM.LTwpozFqEyeLMG.mjBC', 6, 1, NULL, '2024-12-27 11:31:47', NULL),
(463, 230, '', '$2y$10$mKYGW2i6BWHcFQVNNaWde.woGdh49LZ3C3iXu9Cy0LU6UxVsj7jP.', 7, 1, NULL, '2024-12-27 11:31:47', NULL),
(464, 231, '', '$2y$10$4zRIwU2akzDOUdwZO/aJcu707o9zYMPlvFIjm9i8CnSaZA6ZQHvom', 6, 1, NULL, '2024-12-27 11:31:47', NULL),
(465, 231, '', '$2y$10$zPeSl8FI5fO3S99KzpYfyu3k1OBlEBuaeMkCWrt4O2OSZLewgo.A.', 7, 1, NULL, '2024-12-27 11:31:47', NULL),
(466, 232, '', '$2y$10$4T38dQuKCLwiFDkeTDTrauErzEFkuhbthmW6gbh7.O43f/aFh7SLu', 6, 1, NULL, '2024-12-27 11:31:47', NULL),
(467, 232, '', '$2y$10$UZP18wrUcS3wpgv3UtL3SOpw6sh0eQGJ4zFYEIIL7LE6cd.wXzKE2', 7, 1, NULL, '2024-12-27 11:31:47', NULL),
(468, 233, '', '$2y$10$pI80swzv5SKGoUUkzvAWVuv/20wl8jP7M4wf20P52y800CQ087hJO', 6, 1, NULL, '2024-12-27 11:31:47', NULL),
(469, 233, '', '$2y$10$rGxGX5IZHaIKt4IIEtAj6eSjYeX6OtRx/4HuDLzY/xMMjS2RIfjQu', 7, 1, NULL, '2024-12-27 11:31:47', NULL),
(470, 234, '', '$2y$10$V68FUmwhc27QT1JeD0dQHe.vtlcp6Py7smngduR2carp7puKIVIyy', 6, 1, NULL, '2024-12-27 11:31:48', NULL),
(471, 234, '', '$2y$10$9JR7tFhCOHbOx.nY3z.Jd.X3/rGFVfJ1c.9Q0iio05NYJ0/4FBnxu', 7, 1, NULL, '2024-12-27 11:31:48', NULL),
(472, 235, '', '$2y$10$mR/NYFenux9ZWwvCPaD0J.yPLFxbMcuS2rwmEbpPyVrywEGfBekn.', 6, 1, NULL, '2024-12-27 11:31:48', NULL),
(473, 235, '', '$2y$10$MVHmwRBAkV85qClSkCAjZuM3F5HSZKhG9ptk9U3bxqKde.F6KpMw.', 7, 1, NULL, '2024-12-27 11:31:48', NULL),
(474, 236, '', '$2y$10$oZnXb.IZZkm0.yIXp6mF1OKRe0.0nDPzNogGFLlNtelmKWDIqwrLq', 6, 1, NULL, '2024-12-27 11:31:48', NULL),
(475, 236, '', '$2y$10$RdCFweMYEQey98Ur0myO4.Jc92MjDuFQ/NdIuhmxI3ZM6WzPkpLUG', 7, 1, NULL, '2024-12-27 11:31:48', NULL),
(476, 237, '', '$2y$10$Rwgo42I/AIeCykrRgTOEA.ez4U9XQq0HYJKX821b1gBohNMaDV0E6', 6, 1, NULL, '2024-12-27 11:31:48', NULL),
(477, 237, '', '$2y$10$AVl9E2IJ3tOJwKpHub089.AbXy/RhY3vZoTGcsilZu1/dDVDOMmNe', 7, 1, NULL, '2024-12-27 11:31:48', NULL),
(478, 238, '', '$2y$10$2xoAVy/kuiGSZPp7WPbY8uOrGKNOVAIv1J55/ek5m76F5/mJ9Yd02', 6, 1, NULL, '2024-12-27 11:31:48', NULL),
(479, 238, '', '$2y$10$gxQbBVoJhwnTD2onwtqAJuvgIg5x/nzAGRdEln0J.VcOKp6XgyPk.', 7, 1, NULL, '2024-12-27 11:31:48', NULL),
(480, 239, '', '$2y$10$mjrhb1BsxDwFRDf4rAYPVuzON8Ua4..eLqI3lojo65L5tXlg5EsxW', 6, 1, NULL, '2024-12-27 11:33:06', NULL),
(481, 239, '', '$2y$10$lvHc7WsFny/4oFHoW3AMNuUafV0p/ZXxeW4PQ95RnJT9DO3UrIpj.', 7, 1, NULL, '2024-12-27 11:33:06', NULL),
(482, 240, '', '$2y$10$kBjJY0kBW8SQtNvHchiDS.Nz7tZQGMnojb4oiSn5ZxkGXzHqAzH9y', 6, 1, NULL, '2024-12-27 11:33:06', NULL),
(483, 240, '', '$2y$10$4plLFsoEgICqUftOzLg3xes1kzihibV3jsx8EKabSHpYaVbr87Fry', 7, 1, NULL, '2024-12-27 11:33:06', NULL),
(484, 241, '', '$2y$10$O6ryi5J7SJS0rXi58AhPl.UR074oj/phOtNHCKbQTnDtdH0Q10YyS', 6, 1, NULL, '2024-12-27 11:33:06', NULL),
(485, 241, '', '$2y$10$cI5CQww/.DYf4ndoWAKBCOEvdFz6Krrip3XxriSF8RAjA7/6iG94i', 7, 1, NULL, '2024-12-27 11:33:06', NULL),
(486, 242, '', '$2y$10$F.l3kug0eNYSbVF4KnaIke3lIycJeGaLW1F.GrlZwbWyYVUvVz01m', 6, 1, NULL, '2024-12-27 11:33:06', NULL),
(487, 242, '', '$2y$10$R.lrA6vraC7tVvK7dT1B4.tu.3rvuyBLt230inEvk7XUVtEmvtG3O', 7, 1, NULL, '2024-12-27 11:33:06', NULL),
(488, 243, '', '$2y$10$JPp/cE3EMJPVBba4S7wmruSVkBpuhyINoYXHeOrqrBBVFgowmBDvC', 6, 1, NULL, '2024-12-27 11:33:06', NULL),
(489, 243, '', '$2y$10$vDa761gtn6tKO6r5sQnHDeYb9aNZdhYhIeaeCAvXiipX.rCzhE2pC', 7, 1, NULL, '2024-12-27 11:33:06', NULL),
(490, 244, '', '$2y$10$liMHj0b4inTFB9cVnYXP9uZsywXRCAnI3jR46b2cnzd7APeo0uhxS', 6, 1, NULL, '2024-12-27 11:33:06', NULL),
(491, 244, '', '$2y$10$9n1KxQIEFePlFQ1lcl6ClOPfnLT6XkeRS5/6SG1UUgLZo0udJlC2a', 7, 1, NULL, '2024-12-27 11:33:06', NULL),
(492, 245, '', '$2y$10$B3ajL86KqIwDH4AYAIkkUedBnsscYx/IdALA4edHbqwajfU29FvK2', 6, 1, NULL, '2024-12-27 11:33:07', NULL),
(493, 245, '', '$2y$10$0PQuA1jLIRNUVaOXFrqLrOwSAPQk8cIyBLA9I9bRKmIk4CZoEi34y', 7, 1, NULL, '2024-12-27 11:33:07', NULL),
(494, 246, '', '$2y$10$in1AIUV.6Z7SvqPG/h3nTOrfGfQOlvqK0shuggx3kTp50tRlY0exa', 6, 1, NULL, '2024-12-27 11:33:07', NULL),
(495, 246, '', '$2y$10$S7JuB/arJW8A2P1BDRjEIerKv3cG2EfwyTuebOhI4A5pd.8y7LVwu', 7, 1, NULL, '2024-12-27 11:33:07', NULL),
(496, 247, '', '$2y$10$1qOkDoK4zI78mYBG0G/2hOMJut3lXHOJHGzjdNQkExj1V7GwII.1m', 6, 1, NULL, '2024-12-27 11:33:07', NULL),
(497, 247, '', '$2y$10$b3MBGxO4N.XmYC59qz2WjOdJwuy4EV/gE7e9CrH2BGR/069WKlEtm', 7, 1, NULL, '2024-12-27 11:33:07', NULL);
INSERT INTO `login_credential` (`id`, `user_id`, `username`, `password`, `role`, `active`, `last_login`, `created_at`, `updated_at`) VALUES
(498, 248, '', '$2y$10$S0BV7SGMIh1oJBk23uw/geguef49GZRb3aHFms98wOhHR5.K8unDq', 6, 1, NULL, '2024-12-27 11:33:07', NULL),
(499, 248, '', '$2y$10$meDzMI0Ivch4yuxnTIdi2eKecSURWHjyZ4rvDAkbQ3j589ajt3O02', 7, 1, NULL, '2024-12-27 11:33:07', NULL),
(500, 249, '', '$2y$10$IT4QEQaXKv4igVzxdnMCQuzq3rmv0uyxX2Z2Ck.iMw4T31xNx2LIm', 6, 1, NULL, '2024-12-27 11:33:07', NULL),
(501, 249, '', '$2y$10$qlSYaY5Hob4Wss0dyn/QbO5YcFLUJo0CVIc7i9qoL0FYgLtQ7azMS', 7, 1, NULL, '2024-12-27 11:33:07', NULL),
(502, 250, '', '$2y$10$.H9hT0z6I8SCBH98bcsC7eG./loFSS0FDy80t8hE/YkQD4keYkefG', 6, 1, NULL, '2024-12-27 11:33:07', NULL),
(503, 250, '', '$2y$10$WXja7MxXPhK8uQ2cZv0d5eBPpbkLucb3XmgLBm2LHvms6BgTE1xdG', 7, 1, NULL, '2024-12-27 11:33:07', NULL),
(504, 251, '', '$2y$10$OIo69c3xpt1ClUUHOYXikeEi.jGn3PZOS6htODajQZi5yW9poG3NK', 6, 1, NULL, '2024-12-27 11:34:24', NULL),
(505, 251, '', '$2y$10$XOaMmWUYzoDa/wryC49X7.gnMJ.wiTBJ2sol53Z5gctkJfZPjmVCG', 7, 1, NULL, '2024-12-27 11:34:24', NULL),
(506, 252, '', '$2y$10$lDeaC6ufASXR0eCRsgYw3OnybzvAAIZa/S5UMS3m2k.IC9QP/LwiW', 6, 1, NULL, '2024-12-27 11:34:25', NULL),
(507, 252, '', '$2y$10$100Lz6mTDaILcT05h5hNdOOxnjUfROKPK66d9AETdjtHq7qFlkIau', 7, 1, NULL, '2024-12-27 11:34:25', NULL),
(508, 253, '', '$2y$10$F6S56hfAFPW73bQ/sz/pKuFv7yEBmLqd.8PgpmRQ6.s/4oxFqXMDa', 6, 1, NULL, '2024-12-27 11:34:25', NULL),
(509, 253, '', '$2y$10$iEy7dYjzypIcryxlctU/MuSGuLn74CuwGzugaP.80M2ir9ymB40au', 7, 1, NULL, '2024-12-27 11:34:25', NULL),
(510, 254, '', '$2y$10$cUXp8w9bZ7BH/1Pt7Kml6eJSid.ofnwYIlkxO8MUT6/JrF62J.gDa', 6, 1, NULL, '2024-12-27 11:34:25', NULL),
(511, 254, '', '$2y$10$RtyICSaOYC4NxCh1dqLxPOMsbhrR5XguynGMV4N7IeZDBQI4DvzL2', 7, 1, NULL, '2024-12-27 11:34:25', NULL),
(512, 255, '', '$2y$10$ib8kDVcg4pTe3rt6S9WZfO5090g5gC/vBh/k6RWoubK0QSAF2uN0O', 6, 1, NULL, '2024-12-27 11:34:25', NULL),
(513, 255, '', '$2y$10$RpSAUTiYLTKWJv8uIDGqM.jgUqQ6sSFoL8jroztGzoHIY81xI.p6K', 7, 1, NULL, '2024-12-27 11:34:25', NULL),
(514, 256, '', '$2y$10$Sfv4X3sxodCAHDAM962nte2t2G4x6norw9jaToDGb0AHSBE8bci3W', 6, 1, NULL, '2024-12-27 11:34:25', NULL),
(515, 256, '', '$2y$10$xHfH8WaG5lwE.gnwB/IvRu6EqF4BQWpXhqN7./2HAukJwwWQvlOOm', 7, 1, NULL, '2024-12-27 11:34:25', NULL),
(516, 257, '', '$2y$10$JCxxI1aKgH0WVtVZq3QMoeGBa.jtd760HDeHrZrjViEHuRTyRh0cW', 6, 1, NULL, '2024-12-27 11:34:25', NULL),
(517, 257, '', '$2y$10$zuCFdEYQYJUXE7pfgq8fI.fuZbfYKJ7i6DalJVrbrWmPcc9WRKuZK', 7, 1, NULL, '2024-12-27 11:34:25', NULL),
(518, 258, '', '$2y$10$7n/4y92OzVov6DyV7QBQ6ecUL7tc4j7TipjUfPxYjYfvbUcb9czmy', 6, 1, NULL, '2024-12-27 11:34:25', NULL),
(519, 258, '', '$2y$10$mGnKW49FOCkRBVQsINHAfOH0hSRqeHrsXxQKLrMoM2kzDL2KLy34O', 7, 1, NULL, '2024-12-27 11:34:25', NULL),
(520, 259, '', '$2y$10$GPC6J13/umFMROyGVPbGxu3aHZNh/xVPL7yK5LuCUdabPgFF6D20i', 6, 1, NULL, '2024-12-27 11:35:33', NULL),
(521, 259, '', '$2y$10$jW0SIRUFFWB6diHnJ2T/WOzETRkz49TfnrAiO1c4ErgxIhs7zyvMK', 7, 1, NULL, '2024-12-27 11:35:33', NULL),
(522, 260, '', '$2y$10$0SayGaevB4sGPUPhHZLU9urCQ8OyjswZTYXnDNPkYKrvlJJOfpCpe', 6, 1, NULL, '2024-12-27 11:35:33', NULL),
(523, 260, '', '$2y$10$8eBSJMiW9c1rm6ulN9ymR.8V294uPN7OIXq5WFrLHIwvcCKxg8tdK', 7, 1, NULL, '2024-12-27 11:35:33', NULL),
(524, 261, '', '$2y$10$JOW4HgpYXRHHUwYVwumxGezMfj8A8sYW1LvRyMdjMD33Hy5QOOGOq', 6, 1, NULL, '2024-12-27 11:35:33', NULL),
(525, 261, '', '$2y$10$0fj/YVmRNllW87etIk4l9e81lIf2YnQHcyPMmix4dUmkrQBDX7B0K', 7, 1, NULL, '2024-12-27 11:35:33', NULL),
(526, 262, '', '$2y$10$EVlOgQoJX97JKZUXRiB0q.BNdIA1T8dUa52d4NT6u4dysAL07cQoS', 6, 1, NULL, '2024-12-27 11:35:34', NULL),
(527, 262, '', '$2y$10$fVzRc.TYPc5i.wzP4ZQ3reJ21Ka1llSQybKC9TjJmKwTzIjww.Jma', 7, 1, NULL, '2024-12-27 11:35:34', NULL),
(528, 263, '', '$2y$10$PB9rJXw0iOk3dQqWFcr9Sedwe5u/AduCV1QAAHF3CPFpuc9MBrS.2', 6, 1, NULL, '2024-12-27 11:35:34', NULL),
(529, 263, '', '$2y$10$3wxfUCkC4N5mlkElsozi4OAwJWrvBOVB.o2Dsq4fm5KRVPsyyu/BS', 7, 1, NULL, '2024-12-27 11:35:34', NULL),
(530, 264, '', '$2y$10$icQ3iZC2vk10Es4CizRFW.PL2CUlc7UpfSzeMbiHF77Yu.Kvn2q7C', 6, 1, NULL, '2024-12-27 11:35:34', NULL),
(531, 264, '', '$2y$10$0otZIqkR2XgwXRQm560WhOIcAFloCLZYrdVl2gKCpyHgW/CPMM.lS', 7, 1, NULL, '2024-12-27 11:35:34', NULL),
(532, 265, '', '$2y$10$Dr6Dx0x5EOK38bHJ.qJfy.7kYrYOXzX0Qrfa2czQD15/o4s5lFR.i', 6, 1, NULL, '2024-12-27 11:35:34', NULL),
(533, 265, '', '$2y$10$O4iRTcioZ2uXfcfZCl1Ii.gacf9OjSEuiSHLhkSjXrkNVNSg8Oetm', 7, 1, NULL, '2024-12-27 11:35:34', NULL),
(534, 266, '', '$2y$10$8wFoI23nFFriSaX6920bH.kWZs2Q.sI6sYFTA5J/0h/a7yGrsNncK', 6, 1, NULL, '2024-12-27 11:35:34', NULL),
(535, 266, '', '$2y$10$Se64ubHOQ8upANoMdlToJO5eNbPvGHpLPJtG3sGRMvEScB.zBjk3W', 7, 1, NULL, '2024-12-27 11:35:34', NULL),
(536, 267, '', '$2y$10$ju31C7ZihuZzhf2scYH4IOd4mDGlSoYUz0aXgKUT1oOGx82Uro3WW', 6, 1, NULL, '2024-12-27 11:35:34', NULL),
(537, 267, '', '$2y$10$DJXkgrTSI93RPfMTQNeSMeXbQb2Cd82EXlaNm6PNrc3W7KWPtM.Vq', 7, 1, NULL, '2024-12-27 11:35:34', NULL),
(538, 268, '', '$2y$10$t9dpZM2b6DDDzrH8EurPW.WFwwHFw.7DQoL4dflP5tSFSY4DOMLyu', 6, 1, NULL, '2024-12-27 11:35:34', NULL),
(539, 268, '', '$2y$10$v2HmcqZhAHqra5BH9zEMNOkm0PNt5dPj/v/2Y7VBqLrahSHu0n70a', 7, 1, NULL, '2024-12-27 11:35:34', NULL),
(540, 269, '', '$2y$10$uzEBbHxVTXgDks4bKq.iFORvobgvF0khCDjV0e1yfop7FzAr0BARm', 6, 1, NULL, '2024-12-27 11:35:34', NULL),
(541, 269, '', '$2y$10$rVKwYSTPbhLm0uq4lkowIOSk2og3DAwWXYNEiuUtum9wRFN1mXmE2', 7, 1, NULL, '2024-12-27 11:35:34', NULL),
(542, 270, '', '$2y$10$oy9aVkd/A7fhGVPjlalWMeNbYyLPvChTlUG34VhGCZrKu9j7RUC2e', 6, 1, NULL, '2024-12-27 11:35:35', NULL),
(543, 270, '', '$2y$10$h1QIzHdd0oZi1FAtAdWl/e56SrvhG/nS5L8RhPZvkpwOw1x6JoTpa', 7, 1, NULL, '2024-12-27 11:35:35', NULL),
(544, 271, '', '$2y$10$pyMWSmOU6VWmyLbmhJ2jPOPj41.BYLfAZaSi13EcnmrS0bCOzrlA6', 6, 1, NULL, '2024-12-27 11:35:35', NULL),
(545, 271, '', '$2y$10$dOYMMkrLSimYSU1db7PU.OmMD7lCkxrvDPX6A3E/0yp2f6s2pQ47q', 7, 1, NULL, '2024-12-27 11:35:35', NULL),
(546, 272, '', '$2y$10$Mjye4SJgyuyTUciAoxtNie2bRNFkJHr8yaNiljrl64HqLxzKjXtdy', 6, 1, NULL, '2024-12-27 11:35:35', NULL),
(547, 272, '', '$2y$10$fFGRPdMCwyaQ9byyqv8ayuzc.7KGUZA1dsmo53LAZgfUzTG1Do7hu', 7, 1, NULL, '2024-12-27 11:35:35', NULL),
(548, 273, '', '$2y$10$HF82BFcvkhcFb2NkQn/Z6u1ibbw..W/3pi8/tBSiF3QA4SL44JH8.', 6, 1, NULL, '2024-12-27 11:35:35', NULL),
(549, 273, '', '$2y$10$hBR4Qc3MjXI8lZH9H8bFH.mVqmmlOrRhgSmcF0HZOCmayLl9TTP7O', 7, 1, NULL, '2024-12-27 11:35:35', NULL),
(550, 274, '', '$2y$10$kXCMC8ZoqPK/jEL30nthqOhypypGu1xOFTRma9bW2uLdtMK5.X95G', 6, 1, NULL, '2024-12-27 11:35:35', NULL),
(551, 274, '', '$2y$10$BWJZMSmqWPR4KbWKnyJAv.756mMqONDcdtHPkQdmPC5rqXK2O6Nay', 7, 1, NULL, '2024-12-27 11:35:35', NULL),
(552, 275, '', '$2y$10$QRRDS2gA1eZWYl90HTjlauBD73zvpBzIboBdk.6mKP/TcbZlIu.Uq', 6, 1, NULL, '2024-12-27 11:35:35', NULL),
(553, 275, '', '$2y$10$QB7JSbMYAE/0qr6u7.wry.6CNXXaaCoGALPE9UuQogdyqdEPhi6Sa', 7, 1, NULL, '2024-12-27 11:35:35', NULL),
(554, 276, '', '$2y$10$8Jnca2HoCMfTujuPmxo2gul6KKM0ieYCqzpdYNZPWt1OWNLXICPGa', 6, 1, NULL, '2024-12-27 11:37:15', NULL),
(555, 276, 'mishu', '$2y$10$nyD61Tr2usgN4hbFn/WM6.Zk2wLf2/ZOrksUfXphpg/pavv5Yzucu', 7, 1, NULL, '2024-12-27 11:37:15', NULL),
(556, 277, '', '$2y$10$QBdAiTdjFFUeHVxoiE49mO3mxK8X7gj/.USkkX//H6zFnrHC.0gQW', 6, 1, NULL, '2024-12-27 11:37:15', NULL),
(557, 277, 'eshita', '$2y$10$5B6iG5flwxyRDlEXIPCP/.v2kb4WTaZ0edviA86k7nbmYqTk.oanS', 7, 1, NULL, '2024-12-27 11:37:15', NULL),
(558, 278, '', '$2y$10$iZ1l71VlusMwVPtEJTDuy.52aKIXuJ/v0oj6UlRhVwBRkEPRSLqd6', 6, 1, NULL, '2024-12-27 11:37:15', NULL),
(559, 278, 'simi', '$2y$10$DrBFYcfT.JwTsMOH2kHfkOSr4y17.nuLqt2Oo6bd7kJeNrWekPPA2', 7, 1, NULL, '2024-12-27 11:37:15', NULL),
(560, 279, '', '$2y$10$bUkpV5j3BOym/xL6h8/5FO1xGAZfCVTP4qaC/B1T1VF8ohLZ/WKIu', 6, 1, NULL, '2024-12-27 11:37:15', NULL),
(561, 279, 'jahid', '$2y$10$mAmPsk77oE3qjUZkPBbZjOS944IlYC6PzVDylxru8qz11G6zjU2wW', 7, 1, NULL, '2024-12-27 11:37:15', NULL),
(562, 280, '', '$2y$10$tc2Z1PyG8DQVuy9Bnt7atOfXUfxI/JAmjhkfZaniYmoyM3gMbBvg.', 6, 1, NULL, '2024-12-27 11:37:15', NULL),
(563, 280, 'jakir', '$2y$10$SRB5L6z1zwIJ45EF1PuyPOKUHU1aqmwyOcwcM7xfHk5Ftp1ItqSiS', 7, 1, NULL, '2024-12-27 11:37:15', NULL),
(564, 281, '', '$2y$10$HABP968g8if5gQs.b02RUe0yqHDfEHOfeg/iUkvRMDQzVCtayAtLu', 6, 1, NULL, '2024-12-27 11:37:15', NULL),
(565, 281, 'uttam', '$2y$10$1BpVB9pfRCB87vuX1Z.TauzTv3kzRqhrggo5y.Jhs4WpRKsULuEEa', 7, 1, NULL, '2024-12-27 11:37:15', NULL),
(566, 282, '', '$2y$10$t9K3JI/T1JG8rbsA90pHy.3oSUzApB5h3zLBmKPdkWAsYGYDVqlN.', 6, 1, NULL, '2024-12-27 11:37:15', NULL),
(567, 282, 'tanjila', '$2y$10$foicRhhv55nsC/cn4vs9.uLtwZbrN4/t2bKUEYG0875G8DUN7Mq5G', 7, 1, NULL, '2024-12-27 11:37:15', NULL),
(568, 283, '', '$2y$10$ThaHV6yW9GT7EsVI/k7oMOxy/GvlUCkwICXEJf338oeObEbktnXX6', 6, 1, NULL, '2024-12-27 11:37:15', NULL),
(569, 283, 'sanjida', '$2y$10$RJ6iJbl98nMVDW.Mjn0UgOvSOKShuOMk.eeDr7VULG5dca90hsjeq', 7, 1, NULL, '2024-12-27 11:37:16', NULL),
(570, 284, '', '$2y$10$bTeGj6Fv8qbgLiwJIW3KJO/oZfjqXQ/sQWxnTs/U0HE5M.xGt/8sC', 6, 1, NULL, '2024-12-27 11:40:00', NULL),
(571, 284, 'maysha', '$2y$10$zuXanQnmCcpJsmDnniy9JO.1MzCg/mjx9hw5FXzQbsZt8C3k5svIa', 7, 1, NULL, '2024-12-27 11:40:00', NULL),
(572, 285, '', '$2y$10$lau4DODGny0FT2YQbOz2/.nEPnBHAedCwSbMGJp8686zrRjP8.Xim', 6, 1, NULL, '2024-12-27 11:40:00', NULL),
(573, 285, 'tonu', '$2y$10$C.d2gMoVGHVozxv4uemWY./bhzEZkHY07rr2lmKAbZfqNfPPICrJm', 7, 1, NULL, '2024-12-27 11:40:00', NULL),
(574, 286, '', '$2y$10$Nj8UnJyfI9aMjmyvdHw3pep1ZE7YXZkzMvnFslFYqhN5ZmX.k8Awu', 6, 1, NULL, '2024-12-27 11:40:00', NULL),
(575, 286, 'tanvir', '$2y$10$9H/AG8A9oMJ7.8B9NhLdi.Yi0Vkrli4aXgzwoQ8n2.rhtf5SQrp.e', 7, 1, NULL, '2024-12-27 11:40:00', NULL),
(576, 287, '', '$2y$10$b0qL2IphwA40rhIkVXXbtOXbH746t.TEK1N0PyMLHjpkBYXXkKnrG', 6, 1, NULL, '2024-12-27 11:40:01', NULL),
(577, 287, 'sneha', '$2y$10$5ikhW6g1oylJNGLtAGT7ie4sOEsJh.eB1XWgd3Vcn7u6rN5126ima', 7, 1, NULL, '2024-12-27 11:40:01', NULL),
(578, 288, '', '$2y$10$X8syoJGloxG/Tyy19HgNuevkczQm3nlum9LLlWnT4o4ZVlpLFKUeK', 6, 1, NULL, '2024-12-27 11:40:01', NULL),
(579, 288, 'bakkar', '$2y$10$1mOpu/Na8BgzDYgWqrbcROGqDZ1XG9GifKn7zYZEOZs6OsLR/qRzu', 7, 1, NULL, '2024-12-27 11:40:01', NULL),
(580, 289, '', '$2y$10$lVW1cE537OCXuvulpg691eyk3xZhxZesw4z0WqtLE35jmMFxZ8tL.', 6, 1, NULL, '2024-12-27 11:40:01', NULL),
(581, 289, 'nadia', '$2y$10$qsk3qydO1hgysvC1gcUM5ORavF8.2iZP2XQQdhRMTe/Tk1DMEWinG', 7, 1, NULL, '2024-12-27 11:40:01', NULL),
(582, 290, '', '$2y$10$O67okhjnH80n360AylePEOqk0K.b6WGO93l5ybZ8HURKtzbSASZa2', 6, 1, NULL, '2024-12-27 11:40:01', NULL),
(583, 290, 'shelim', '$2y$10$kEhalK2ld9zLangGlAw5AuS6VhreP64T66yQeTYHEKx/WFNZye1ty', 7, 1, NULL, '2024-12-27 11:40:01', NULL),
(584, 291, '', '$2y$10$XP73mZK1WNt4i5ZkjcFZzOTwaCkOmW0jczmpIq/.cK7pXtSzHXw7m', 6, 1, NULL, '2024-12-27 11:40:01', NULL),
(585, 291, 'rakibul', '$2y$10$OQxqixTDUykGZKxAEbVtSu1jzJCnfL.oJYiqt6cdxlq1K/hdK54wq', 7, 1, NULL, '2024-12-27 11:40:01', NULL),
(586, 292, '', '$2y$10$petak5lAadno8yT8R46xiO4WYDh04N0Xuy3sV.P9rXKIUQ2/Zjs.K', 6, 1, NULL, '2024-12-27 11:40:01', NULL),
(587, 292, 'shaj', '$2y$10$2HQB2CHIPnizX/FD1pqEa.5cvj6aQy4WL7a//H8AKjWwsgJ0aSegy', 7, 1, NULL, '2024-12-27 11:40:01', NULL),
(588, 293, '', '$2y$10$fArZ2KrI4shNmuYK2K6hjOPqhzemPmhcsusAgL.f5INsPeMKq6/Q2', 6, 1, NULL, '2024-12-27 11:40:01', NULL),
(589, 293, 'sohan', '$2y$10$pU/Pix3wtCPG5DE1sygQIOuPovPRFau9AnV8MXCE5kR/1DIl2m6RO', 7, 1, NULL, '2024-12-27 11:40:01', NULL),
(590, 294, '', '$2y$10$5xNVCtm5rEn4V1l/4TGxYesBA6WSWluzZf3FeRKptifSIZM6Aa3sC', 6, 1, NULL, '2024-12-27 11:40:01', NULL),
(591, 294, '', '$2y$10$zvX/IqFZHRsSH6GZGx0t9OX93IVN4XvZgTE0UWayVYjplGybBFfRO', 7, 1, NULL, '2024-12-27 11:40:02', NULL),
(593, 295, '', '$2y$10$VgZT6QwdQLa/Ov2vtZye6OGYmtDQ4yyyWHE/7IVSjeD4sNoOZofum', 7, 1, NULL, '2024-12-27 11:40:02', NULL),
(594, 296, '', '$2y$10$9K2Gc5UgjpPytFkoxxaQROLVvSRsGUp4oBAZavagI4ma3gOyv0ib.', 6, 1, NULL, '2024-12-27 11:40:02', NULL),
(595, 296, '', '$2y$10$EdgOO7Z5PxPVGBIgF.WO1.VKrX/rrRJkLTnHxKmHNyRgzQvlEcNMK', 7, 1, NULL, '2024-12-27 11:40:02', NULL),
(596, 297, '', '$2y$10$Sa8lpoXTYlZbW3EH8bZoWuxKZ5QjIuqf13J5uG7j5pwvaKs32H.uO', 6, 1, NULL, '2024-12-27 11:49:35', NULL),
(597, 297, 'neyoti', '$2y$10$fNVbzRs/L5tOEP82DUUgyO6LGf.MSAXhf1xpLkx2ZR7V.J/FtQWNe', 7, 1, NULL, '2024-12-27 11:49:35', NULL),
(598, 298, '', '$2y$10$GwehpTpYZMFxZ/BKBBE39.8tsNV5vZbsN68fWfOEgBZEde/V8sZj6', 6, 1, NULL, '2024-12-27 11:49:35', NULL),
(599, 298, 'anisha', '$2y$10$9OADNSNS.Mi1BhWhyMAKDefIgV5d35jOC3i13a54wwAeGmm.10LAC', 7, 1, NULL, '2024-12-27 11:49:35', NULL),
(600, 299, '', '$2y$10$ihvg4CPLOtDfOobkGZENquZq6tVEeRv34OfmE8BJid75DZDwM62mm', 6, 1, NULL, '2024-12-27 11:49:35', NULL),
(601, 299, 'adiba', '$2y$10$UzN2WoM26mdu/V7Wvt.x5uewH0Ol60ycHGMwR8aoHy0AUieWLNqIu', 7, 1, NULL, '2024-12-27 11:49:35', NULL),
(602, 300, '', '$2y$10$w4Aanx1wYSa1L.TiZX9.c.8EDgtt1DsvQWvAlnpMy/7J9w17aLvMK', 6, 1, NULL, '2024-12-27 11:49:35', NULL),
(603, 300, 'jahidul', '$2y$10$gqLmrPxgEx66fp.kmajYB.RHC5geCGFAaW8t2A/9j/7368ncKTC26', 7, 1, NULL, '2024-12-27 11:49:35', NULL),
(604, 301, '', '$2y$10$/xL4Q2Qe1br.GTtoKZnxde65n03NeTDL6xClIZCG6ZNOsMuHHcQnG', 6, 1, NULL, '2024-12-27 11:51:08', NULL),
(605, 301, '', '$2y$10$Xh25nVccEZM5yGjRiuypxeeHoes9laNCvxSlOUqQAoKLYlm.bDYS.', 7, 1, NULL, '2024-12-27 11:51:08', NULL),
(607, 302, '', '$2y$10$hkBCMGcXNXhNeYVgR/eG.eImjUDZrVjB5kHeOq.x6THlkqYXvUzzK', 7, 1, NULL, '2024-12-27 11:52:18', NULL),
(608, 4, 'kalam77777', '$2y$10$T.lYALdqBmDqs7fQU8qFDeIz.O.Tu6AnRvX3iCJLsunRonmJtcy.q', 3, 1, NULL, '2024-12-31 08:05:58', NULL),
(609, 5, 'bormon75', '$2y$10$XuB9d7RbcGBqXaw7gKglc.OmuiBRzhnjP7PFhwjEsc0WkqGcGQCgi', 3, 1, NULL, '2025-01-01 19:10:50', NULL),
(610, 6, 'rashedakhatun', '$2y$10$Vf.PS.6NPW.jz6XqeQ925OBIAvlS1nkg1sN8TZ9SRIFvhA9fkTzE.', 3, 1, NULL, '2025-01-01 19:13:11', NULL),
(611, 303, 'GD303', '$2y$10$SChpsuVFQaW7sbPpm8xsHeknSFe821EwIDXygw9JBWOL9WgtT79BC', 6, 1, NULL, '2025-01-02 17:26:28', NULL),
(612, 303, 'ST303', '$2y$10$vqDExTy586G74.Axqp0nqeVjWzGhpx6Lw1iFF06TR6oH1RV.Kt8xa', 7, 1, '2026-05-15 00:52:38', '2025-01-02 17:26:28', NULL),
(613, 304, 'ST304', '$2y$10$PiG.AvO1xQRLmvYRLC9TVuo535eD91kO3E0tGJPQNJziSNZM/MYwa', 7, 1, NULL, '2025-01-02 17:29:00', NULL),
(614, 305, 'ST305', '$2y$10$VmabYgKaQ5lpcBW9cHpSouWVIBIj4XaWFuClKKhlpt.ouEci3EATy', 7, 1, NULL, '2025-01-02 17:39:39', NULL),
(615, 306, 'ST306', '$2y$10$eYT9Y5e5lefeyDorEnCDHO9AGEo8dIHi8iRiruyPTvMncz.ZVupSe', 7, 1, NULL, '2025-01-02 17:43:24', NULL),
(616, 307, 'ST307', '$2y$10$.S.LtIZfDI2ing56dD0mFux/SnnLYRcXxmxJ34VBrlh5DkOMbJ4ly', 7, 1, NULL, '2025-01-02 17:47:09', NULL),
(617, 308, 'ST308', '$2y$10$4b/azOqWqri4nWjZrOx.3eBQvMQMcaQBqe8X.T/9e6/hfnKnrLncu', 7, 1, NULL, '2025-01-02 17:51:45', NULL),
(618, 309, 'ST309', '$2y$10$o0iVVh4cZwoM1t4qPvRrPOgkIbkYfOWfJeyvJrHQdUwiP2hgotmzK', 7, 1, NULL, '2025-01-02 17:55:50', NULL),
(619, 310, 'ST310', '$2y$10$aTUX5hVdEk639ilo11fZ5O5i493KCbMoT3JlYIlf5U3/qI/lQc/dG', 7, 1, NULL, '2025-01-02 17:59:31', NULL),
(620, 311, 'ST311', '$2y$10$x9zQ9j/SHgXvRgGaqA94KO2n1LDKJboYzvp3LCGhG4WO0RqrH1/kq', 7, 1, NULL, '2025-01-02 18:02:45', NULL),
(621, 312, 'ST312', '$2y$10$zrLguqrTzj/3ClcXe6k7BOxuoHvvfR58JsHQ7fNc7wP0zvxULAqb2', 7, 1, NULL, '2025-01-02 18:05:36', NULL),
(622, 313, 'ST313', '$2y$10$9C8XJTVtRBXCXbYFi7Xkb.4WDHsuhEULdsASX11.4QlZtKk5lb9Dm', 7, 1, NULL, '2025-01-02 18:13:00', NULL),
(623, 314, 'ST314', '$2y$10$kent6/hs6FAalOdZHb0WneGk4yQhJyJC5l8wuM3roYanhcK0dFTzm', 7, 1, NULL, '2025-01-02 18:17:00', NULL),
(624, 315, 'ST315', '$2y$10$WMa9aHsAYCfJQAeK7iCiZO.pFMYbyicV5zDY1pRJHNJYV9aOz4TFi', 7, 1, NULL, '2025-01-02 18:21:14', NULL),
(625, 316, 'ST316', '$2y$10$rTVOR.hKJpe3iHCGFErpoOduakvWjsI8va3cTljxGkSDLsCXHbXvu', 7, 1, NULL, '2025-01-02 18:24:37', NULL),
(626, 317, 'ST317', '$2y$10$aSzP4eklsaZE3zvQubNyKe9yWQEbj9ufefHBTQIq1GtDaBO1R6.x.', 7, 1, NULL, '2025-01-02 18:27:12', NULL),
(627, 318, 'ST318', '$2y$10$4fANe10r7MWQ2VXDkEJTIujLc6bV5L/NLQHIlbCLgeRd3jh/N0d3u', 7, 1, NULL, '2025-01-02 18:29:45', NULL),
(628, 319, 'ST319', '$2y$10$ICTZyr8idK2WKvjPhNbRRug.29WlBpwxbUsmdgZstDi.De6yyUpV6', 7, 1, NULL, '2025-01-02 18:32:34', NULL),
(629, 320, 'ST320', '$2y$10$1vR5Gm/aX3TRPGEfwirvuO3KR19bG9YV4NMnb6bBveSNDejJFWG.S', 7, 1, NULL, '2025-01-02 18:35:16', NULL),
(630, 321, 'ST321', '$2y$10$2MgVpecWUOEIfDHxOhwetuq76s4U.DTPFDa2M.58d4w.SvfFbxaG.', 7, 1, NULL, '2025-01-02 18:37:25', NULL),
(631, 322, 'ST322', '$2y$10$4QPjfhllxe0PVMnRrhoD1.zKMDvBqun1HhW/g/EFm/C4q8B.0ozja', 7, 1, NULL, '2025-01-02 18:40:14', NULL),
(632, 323, 'ST323', '$2y$10$9wa7Bq2WQ/bVvWNa4X5tzujf01d4nOrBHhu1KuPZLRG.JGTRrC2oO', 7, 1, NULL, '2025-01-02 18:43:28', NULL),
(633, 324, 'ST324', '$2y$10$ZbccKreiM888Hv2HeMX3l.cn/w/lo0acH6FlX/uWlxvlp9JBkW2oy', 7, 1, NULL, '2025-01-02 18:45:48', NULL),
(634, 325, 'ST325', '$2y$10$x90eguWQWNxUe2C1XYNnwOQqKKu8vdj/rlnenbNI8EgTV.iTH8uKO', 7, 1, NULL, '2025-01-02 18:48:17', NULL),
(635, 326, 'ST326', '$2y$10$QqROhtIcfW9JDYQZAQX7uelZdWXBOYPJHr5zAKNPZVqtczrLEwJSa', 7, 1, NULL, '2025-01-02 18:54:34', NULL),
(636, 327, 'ST327', '$2y$10$pWycxBibFJS1HJaq5bFTvO/NNgukoebD5FBnvMRs5DbN32SluLWVS', 7, 1, NULL, '2025-01-02 18:57:16', NULL),
(637, 304, 'GD304', '$2y$10$RXkXtDpQUePml2mlhuDM5uqVa4ab9pBByt5rfgq3WdmYhs4.GxeBa', 6, 1, NULL, '2026-04-27 18:51:55', NULL),
(638, 328, 'ST328', '$2y$10$QVuCRqO7MTKGYG7CFt4d5uemmZWBhsDkwfCn7nMxsgMlu8WUEoiVW', 7, 1, NULL, '2026-04-27 18:51:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_log`
--

CREATE TABLE `login_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `login_log`
--

INSERT INTO `login_log` (`id`, `user_id`, `role`, `ip`, `browser`, `platform`, `timestamp`, `branch_id`) VALUES
(1, 1, 1, '37.111.206.144', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 13:31:33', NULL),
(2, 1, 1, '103.248.204.82', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 14:04:12', NULL),
(3, 2, 2, '103.248.204.82', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 14:11:06', 1),
(4, 1, 1, '103.248.204.82', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 14:15:32', NULL),
(5, 2, 2, '2401:1900:80c4:307a:8d:72b0:605b:3e92', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 14:16:18', 1),
(6, 2, 2, '103.122.255.10', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 14:27:28', 1),
(7, 2, 2, '103.248.204.82', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 14:34:07', 1),
(8, 2, 2, '103.122.255.10', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 14:51:26', 1),
(9, 1, 1, '103.248.204.82', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 15:34:34', NULL),
(10, 2, 2, '103.248.204.82', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 16:03:01', 1),
(11, 1, 1, '103.248.204.83', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 16:31:15', NULL),
(12, 2, 2, '103.248.204.83', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 17:02:25', 1),
(13, 2, 2, '103.248.204.83', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 17:33:37', 1),
(14, 1, 1, '103.248.204.83', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 17:37:51', NULL),
(15, 2, 2, '103.248.204.83', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 17:56:07', 1),
(16, 2, 2, '37.111.194.247', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 18:28:06', 1),
(17, 1, 1, '37.111.194.247', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 18:32:13', NULL),
(18, 2, 2, '37.111.194.247', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 18:48:19', 1),
(19, 1, 1, '103.248.204.82', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 19:06:51', NULL),
(20, 1, 1, '37.111.194.247', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 19:07:10', NULL),
(21, 2, 2, '37.111.194.247', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 19:23:55', 1),
(22, 2, 2, '103.248.204.82', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 19:34:57', 1),
(23, 2, 2, '103.248.204.82', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 19:35:48', 1),
(24, 2, 2, '103.248.204.83', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 21:07:36', 1),
(25, 2, 2, '103.248.204.83', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 21:09:29', 1),
(26, 1, 1, '37.111.194.247', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 21:10:29', NULL),
(27, 1, 1, '37.111.194.247', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-27 21:32:17', NULL),
(28, 2, 2, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-30 23:08:42', 1),
(29, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-30 23:09:49', NULL),
(30, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-31 05:10:39', NULL),
(31, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-31 11:41:19', NULL),
(32, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-31 11:41:56', NULL),
(33, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-31 11:45:06', NULL),
(34, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-31 11:48:20', NULL),
(35, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-31 19:46:47', NULL),
(36, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-31 20:11:40', NULL),
(37, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-31 21:44:19', NULL),
(38, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-31 21:50:12', NULL),
(39, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-31 22:55:57', NULL),
(40, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2024-12-31 23:15:05', NULL),
(41, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-01 01:24:35', NULL),
(42, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-01 05:36:02', NULL),
(43, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-01 06:20:42', NULL),
(44, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-01 06:24:33', NULL),
(45, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-01 21:28:10', NULL),
(46, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-01 22:48:10', NULL),
(47, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 00:50:29', NULL),
(48, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 00:56:37', NULL),
(49, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 01:39:22', NULL),
(50, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 01:41:43', NULL),
(51, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 01:43:58', NULL),
(52, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 01:46:32', NULL),
(53, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 04:21:42', NULL),
(54, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 06:24:45', NULL),
(55, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 06:36:40', NULL),
(56, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 07:10:57', NULL),
(57, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 07:20:30', NULL),
(58, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 07:28:30', NULL),
(59, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 07:31:18', NULL),
(60, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 07:43:55', NULL),
(61, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 07:54:21', NULL),
(62, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 08:02:02', NULL),
(63, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 08:07:12', NULL),
(64, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 08:09:37', NULL),
(65, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 08:26:42', NULL),
(66, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 10:03:02', NULL),
(67, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 10:24:50', NULL),
(68, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 19:48:05', NULL),
(69, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 19:48:41', NULL),
(70, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-03 03:27:33', NULL),
(71, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-03 06:37:05', NULL),
(72, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-03 10:16:28', NULL),
(73, 1, 1, '127.0.0.1', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-03 10:20:26', NULL),
(74, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 20:37:10', NULL),
(75, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 20:38:08', NULL),
(76, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 20:49:37', NULL),
(77, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-02 20:53:07', NULL),
(78, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-03 05:59:48', NULL),
(79, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-03 14:40:25', NULL),
(80, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-03 15:46:18', NULL),
(81, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-03 16:22:22', NULL),
(82, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-03 16:31:28', NULL),
(83, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-04 06:13:05', NULL),
(84, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-06 11:07:59', NULL),
(85, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-07 17:38:22', NULL),
(86, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-09 06:12:56', NULL),
(87, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-13 12:10:18', NULL),
(88, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-16 11:57:04', NULL),
(89, 1, 1, '103.150.64.186', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-16 11:58:14', NULL),
(90, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-20 12:59:45', NULL),
(91, 1, 1, '103.131.145.159', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-24 18:18:20', NULL),
(92, 1, 1, '103.29.124.89', 'Chrome 131.0.0.0', 'Windows 10 / 11', '2025-01-24 18:19:06', NULL),
(93, 1, 1, '103.29.124.48', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-03 16:13:10', NULL),
(94, 1, 1, '103.131.145.159', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-10 11:19:20', NULL),
(95, 1, 1, '103.131.145.159', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-10 11:21:58', NULL),
(96, 303, 7, '103.131.145.159', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-10 11:22:27', 1),
(97, 1, 1, '103.131.145.159', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-10 11:22:54', NULL),
(98, 1, 1, '103.72.64.10', 'Chrome 145.0.7632.79', 'Android', '2026-02-28 09:55:41', NULL),
(99, 1, 1, '103.72.64.10', 'Chrome 145.0.7632.79', 'Android', '2026-02-28 10:10:22', NULL),
(100, 1, 1, '103.67.156.49', 'Chrome 145.0.0.0', 'Android', '2026-03-01 20:35:27', NULL),
(101, 1, 1, '103.72.64.8', 'Chrome 145.0.7632.79', 'Android', '2026-03-03 13:31:16', NULL),
(102, 1, 1, '203.17.65.241', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-03-04 05:25:18', NULL),
(103, 303, 7, '203.17.65.241', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-03-04 05:29:35', 1),
(104, 1, 1, '103.205.36.0', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-03-04 08:23:15', NULL),
(105, 1, 1, '103.109.239.186', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-03-06 16:47:08', NULL),
(106, 1, 1, '27.147.150.102', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-03-08 07:39:41', NULL),
(107, 1, 1, '203.76.221.137', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-03-08 17:35:24', NULL),
(108, 1, 1, '103.87.250.255', 'Chrome 90.0.4430.210', 'Android', '2026-03-08 19:27:43', NULL),
(109, 1, 1, '103.237.36.141', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-03-10 15:11:08', NULL),
(110, 1, 1, '203.76.221.137', 'Chrome 145.0.7632.120', 'Android', '2026-03-10 17:07:53', NULL),
(111, 1, 1, '203.76.221.136', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-03-11 19:45:58', NULL),
(112, 1, 1, '203.223.89.6', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-03-13 04:55:51', NULL),
(113, 1, 1, '2400:c600:3587:a8f:10f4:d9e0:1cd8:444c', 'Chrome 145.0.0.0', 'Android', '2026-03-13 13:01:27', NULL),
(114, 1, 1, '103.108.146.78', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-03-13 13:31:04', NULL),
(115, 1, 1, '2400:c600:5460:d596:7027:5097:1fc6:3bab', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-03-13 16:32:38', NULL),
(116, 1, 1, '2400:c600:337b:d432:fb22:fe75:74bc:e4fe', 'Chrome 145.0.0.0', 'Android', '2026-03-13 17:45:09', NULL),
(117, 1, 1, '203.223.89.4', 'Chrome 145.0.0.0', 'Android', '2026-03-14 18:56:04', NULL),
(118, 1, 1, '103.152.142.188', 'Chrome 146.0.0.0', 'Windows 10 / 11', '2026-03-18 08:36:02', NULL),
(119, 303, 7, '103.152.142.188', 'Chrome 146.0.0.0', 'Windows 10 / 11', '2026-03-18 08:37:57', 1),
(120, 1, 1, '103.178.30.22', 'Chrome 146.0.0.0', 'Windows 10 / 11', '2026-03-22 00:22:13', NULL),
(121, 1, 1, '103.42.203.45', 'Chrome 146.0.0.0', 'Windows 10 / 11', '2026-03-24 17:50:47', NULL),
(122, 1, 1, '103.214.202.188', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-04-13 08:11:15', NULL),
(123, 1, 1, '103.214.202.184', 'Chrome 146.0.0.0', 'Windows 10 / 11', '2026-04-13 18:37:05', NULL),
(124, 1, 1, '103.114.97.242', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-04-13 19:13:27', NULL),
(125, 303, 7, '103.214.202.185', 'Chrome 146.0.0.0', 'Windows 10 / 11', '2026-04-13 19:16:30', 1),
(126, 1, 1, '103.115.254.111', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-04-16 17:50:28', NULL),
(127, 1, 1, '103.115.254.111', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-04-16 17:51:58', NULL),
(128, 1, 1, '103.156.177.192', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-04-17 13:49:19', NULL),
(129, 1, 1, '180.149.234.107', 'Chrome 146.0.7680.177', 'Android', '2026-04-20 15:26:04', NULL),
(130, 1, 1, '103.111.226.14', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-04-21 17:01:28', NULL),
(131, 1, 1, '103.213.237.39', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-04-22 05:03:32', NULL),
(132, 1, 1, '103.166.24.205', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-04-24 14:24:34', NULL),
(133, 1, 1, '103.145.113.52', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-04-24 16:06:17', NULL),
(134, 1, 1, '103.145.113.52', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-04-24 18:11:14', NULL),
(135, 1, 1, '103.166.24.207', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-04-27 15:12:36', NULL),
(136, 1, 1, '103.166.24.207', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-04-27 18:11:02', NULL),
(137, 1, 1, '103.166.24.200', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-04-27 18:50:06', NULL),
(138, 1, 1, '27.147.242.96', 'Chrome 92.0.4515.105', 'Android', '2026-05-02 04:29:50', NULL),
(139, 1, 1, '103.166.24.205', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-05-02 17:12:17', NULL),
(140, 1, 1, '27.147.219.198', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-05-07 06:51:43', NULL),
(141, 303, 7, '27.147.219.198', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-05-07 06:54:35', 1),
(142, 1, 1, '103.166.24.203', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-05-07 17:48:41', NULL),
(143, 1, 1, '103.165.161.67', 'Chrome 147.0.0.0', 'Android', '2026-05-11 08:28:35', NULL),
(144, 1, 1, '114.130.173.162', 'Chrome 148.0.0.0', 'Android', '2026-05-11 09:37:46', NULL),
(145, 1, 1, '103.54.109.230', 'Opera 131.0.0.0', 'Windows 10 / 11', '2026-05-11 09:43:40', NULL),
(146, 1, 1, '103.186.57.66', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-05-11 14:51:54', NULL),
(147, 1, 1, '103.127.87.198', 'Chrome 148.0.0.0', 'Windows 10 / 11', '2026-05-12 10:04:19', NULL),
(148, 303, 7, '103.125.31.139', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-05-14 18:52:38', 1),
(149, 1, 1, '103.125.31.139', 'Chrome 147.0.0.0', 'Windows 10 / 11', '2026-05-14 18:54:16', NULL),
(150, 1, 1, '103.146.10.107', 'Chrome 148.0.0.0', 'Windows 10 / 11', '2026-05-16 13:36:01', NULL),
(151, 1, 1, '103.205.36.59', 'Chrome 148.0.0.0', 'Windows 10 / 11', '2026-05-17 12:57:27', NULL),
(152, 1, 1, '51.158.254.166', 'Chrome 146.0.0.0', 'Windows 10 / 11', '2026-05-22 03:08:03', NULL),
(153, 1, 1, '103.166.24.206', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-05-23 16:06:23', NULL),
(154, 1, 1, '202.134.11.236', 'Chrome 148.0.0.0', 'Windows 10 / 11', '2026-05-25 21:34:52', NULL),
(155, 1, 1, '103.106.238.208', 'Chrome 148.0.7778.121', 'Android', '2026-05-27 02:19:54', NULL),
(156, 1, 1, '103.106.238.208', 'Chrome 148.0.7778.121', 'Android', '2026-05-27 07:12:31', NULL),
(157, 1, 1, '103.106.238.208', 'Chrome 148.0.0.0', 'Android', '2026-05-27 07:12:45', NULL),
(158, 1, 1, '103.96.105.99', 'Chrome 109.0.0.0', 'Windows 10 / 11', '2026-05-29 04:52:25', NULL),
(159, 1, 1, '103.166.24.200', 'Chrome 145.0.0.0', 'Windows 10 / 11', '2026-05-31 12:46:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mark`
--

CREATE TABLE `mark` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `mark` text DEFAULT NULL,
  `absent` varchar(4) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `mark`
--

INSERT INTO `mark` (`id`, `student_id`, `subject_id`, `class_id`, `section_id`, `exam_id`, `mark`, `absent`, `session_id`, `branch_id`) VALUES
(1, 323, 1, 8, 5, 3, '{\"1\":\"40\",\"2\":\"5\"}', '', 6, 1),
(2, 324, 1, 8, 5, 3, '{\"1\":\"70\",\"2\":\"30\"}', '', 6, 1),
(3, 325, 1, 8, 5, 3, '{\"1\":\"69\",\"2\":\"22\"}', '', 6, 1),
(4, 326, 1, 8, 5, 3, '{\"1\":\"40\",\"2\":\"20\"}', '', 6, 1),
(5, 327, 1, 8, 5, 3, '{\"1\":\"60\",\"2\":\"25\"}', '', 6, 1),
(6, 323, 2, 8, 5, 3, '{\"1\":\"45\",\"2\":\"20\"}', '', 6, 1),
(7, 324, 2, 8, 5, 3, '{\"1\":\"50\",\"2\":\"20\"}', '', 6, 1),
(8, 325, 2, 8, 5, 3, '{\"1\":\"53\",\"2\":\"20\"}', '', 6, 1),
(9, 326, 2, 8, 5, 3, '{\"1\":\"60\",\"2\":\"30\"}', '', 6, 1),
(10, 327, 2, 8, 5, 3, '{\"1\":\"70\",\"2\":\"30\"}', '', 6, 1),
(11, 323, 3, 8, 5, 3, '{\"1\":\"60\",\"2\":\"30\"}', '', 6, 1),
(12, 324, 3, 8, 5, 3, '{\"1\":\"69\",\"2\":\"30\"}', '', 6, 1),
(13, 325, 3, 8, 5, 3, '{\"1\":\"65\",\"2\":\"25\"}', '', 6, 1),
(14, 326, 3, 8, 5, 3, '{\"1\":\"55\",\"2\":\"30\"}', '', 6, 1),
(15, 327, 3, 8, 5, 3, '{\"1\":\"70\",\"2\":\"30\"}', '', 6, 1),
(16, 323, 4, 8, 5, 3, '{\"1\":\"70\",\"2\":\"22\"}', '', 6, 1),
(17, 324, 4, 8, 5, 3, '{\"1\":\"70\",\"2\":\"22\"}', '', 6, 1),
(18, 325, 4, 8, 5, 3, '{\"1\":\"70\",\"2\":\"22\"}', '', 6, 1),
(19, 326, 4, 8, 5, 3, '{\"1\":\"70\",\"2\":\"22\"}', '', 6, 1),
(20, 327, 4, 8, 5, 3, '{\"1\":\"70\",\"2\":\"22\"}', '', 6, 1),
(21, 323, 5, 8, 5, 3, '{\"1\":\"60\",\"2\":\"29\"}', '', 6, 1),
(22, 324, 5, 8, 5, 3, '{\"1\":\"70\",\"2\":\"30\"}', '', 6, 1),
(23, 325, 5, 8, 5, 3, '{\"1\":\"62\",\"2\":\"28\"}', '', 6, 1),
(24, 326, 5, 8, 5, 3, '{\"1\":\"55\",\"2\":\"25\"}', '', 6, 1),
(25, 327, 5, 8, 5, 3, '{\"1\":\"45\",\"2\":\"30\"}', '', 6, 1),
(26, 323, 6, 8, 5, 3, '{\"1\":\"55\",\"2\":\"30\"}', '', 6, 1),
(27, 324, 6, 8, 5, 3, '{\"1\":\"70\",\"2\":\"25\"}', '', 6, 1),
(28, 325, 6, 8, 5, 3, '{\"1\":\"69\",\"2\":\"25\"}', '', 6, 1),
(29, 326, 6, 8, 5, 3, '{\"1\":\"70\",\"2\":\"30\"}', '', 6, 1),
(30, 327, 6, 8, 5, 3, '{\"1\":\"70\",\"2\":\"22\"}', '', 6, 1),
(31, 328, 1, 9, 5, 3, '{\"1\":\"10\",\"2\":\"5\",\"3\":\"5\"}', '', 6, 1),
(32, 328, 2, 9, 5, 3, '{\"1\":\"10\",\"2\":\"15\",\"3\":\"10\"}', '', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `marksheet_template`
--

CREATE TABLE `marksheet_template` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `background` varchar(355) DEFAULT NULL,
  `logo` varchar(355) DEFAULT NULL,
  `left_signature` varchar(255) NOT NULL,
  `middle_signature` varchar(255) DEFAULT NULL,
  `right_signature` varchar(255) DEFAULT NULL,
  `attendance_percentage` tinyint(4) NOT NULL DEFAULT 1,
  `grading_scale` tinyint(4) NOT NULL DEFAULT 1,
  `position` tinyint(4) NOT NULL DEFAULT 1,
  `cumulative_average` tinyint(4) NOT NULL DEFAULT 1,
  `class_average` tinyint(4) NOT NULL DEFAULT 1,
  `result` tinyint(4) NOT NULL DEFAULT 1,
  `subject_position` tinyint(4) NOT NULL DEFAULT 1,
  `remark` tinyint(4) NOT NULL DEFAULT 1,
  `header_content` text DEFAULT NULL,
  `footer_content` text DEFAULT NULL,
  `page_layout` tinyint(1) NOT NULL,
  `photo_style` tinyint(1) NOT NULL,
  `photo_size` float NOT NULL DEFAULT 120,
  `top_space` varchar(25) NOT NULL DEFAULT '0',
  `bottom_space` varchar(25) NOT NULL DEFAULT '0',
  `right_space` varchar(25) NOT NULL DEFAULT '0',
  `left_space` varchar(25) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `marksheet_template`
--

INSERT INTO `marksheet_template` (`id`, `name`, `background`, `logo`, `left_signature`, `middle_signature`, `right_signature`, `attendance_percentage`, `grading_scale`, `position`, `cumulative_average`, `class_average`, `result`, `subject_position`, `remark`, `header_content`, `footer_content`, `page_layout`, `photo_style`, `photo_size`, `top_space`, `bottom_space`, `right_space`, `left_space`, `branch_id`, `created_at`) VALUES
(1, 'Academic Transcript', '65101777e78082880ec479bb639de28a.jpg', '4401200af3ceabecf85bb59aaeef729d.png', '', '', '', 1, 1, 1, 1, 1, 1, 1, 1, '<div style=\"width: 100%;\">\r\n	<div style=\"text-align: center; width: 80%; float: left;\">\r\n		 </div></div><div style=\"width: 100%;\"><div style=\"text-align: center; width: 80%; float: left;\"> </div><div style=\"width: 80%; float: left;\"><table class=\"table table-bordered\" style=\"margin-top: 20px; background: transparent;\">\r\n			<tbody>\r\n				<tr>\r\n					<th>Name</th><td><p> {name} <span style=\"background-color: transparent;\">({gender})</span><br></p></td>\r\n					<th>Register No\r\n					</th><td>{register_no}</td>\r\n					<th>Roll Number\r\n					</th><td>{roll}</td>\r\n				</tr>\r\n				<tr>\r\n					<th>Father Name\r\n					</th><td>{father_name}</td>\r\n					<th>Admission Date\r\n					</th><td>{admission_date}</td>\r\n					<th>Date of Birth\r\n					</th><td>{birthday}</td>\r\n				</tr>\r\n				<tr>\r\n					<th>Mother Name\r\n					</th><td>{mother_name}</td>\r\n					<th>Class\r\n					</th><td>{class} ({section})</td>\r\n					<th>Gender\r\n					</th><td>{gender}</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</div>\r\n	<div style=\"width: 20%; float: left; text-align: right; margin-top: 20px;\">\r\n		{student_photo}\r\n	</div>\r\n</div>', '<div style=\"width: 100%;\"><table class=\"table table-bordered\"><tbody><tr><td><table class=\"table table-bordered\"><tbody><tr><td><b>Class Teacher\'s Comment</b></td><td><p> {principal_comments} {name}  <br></p></td></tr><tr><td><b>Next Term Begin and Fees</b></td><td><p> {principal_comments} <br></p></td></tr></tbody></table><p>Printed Date<b>:</b> {print_date}  Added Curriculum >> {left_signature}  Stamp >> {middle_signature}  Scan >> {right_signature} </p></td></tr></tbody></table></div>', 1, 1, 120, '240', '20', '60', '60', 1, '2024-12-27 17:29:20');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `body` longtext NOT NULL,
  `subject` varchar(255) NOT NULL,
  `file_name` text DEFAULT NULL,
  `enc_name` text DEFAULT NULL,
  `trash_sent` tinyint(1) NOT NULL,
  `trash_inbox` int(11) NOT NULL,
  `fav_inbox` tinyint(1) NOT NULL,
  `fav_sent` tinyint(1) NOT NULL,
  `reciever` varchar(100) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 unread 1 read',
  `reply_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 unread 1 read',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `body`, `subject`, `file_name`, `enc_name`, `trash_sent`, `trash_inbox`, `fav_inbox`, `fav_sent`, `reciever`, `sender`, `read_status`, `reply_status`, `created_at`, `updated_at`) VALUES
(1, '<p>Hi, </p>', 'Text Message', NULL, NULL, 0, 0, 0, 0, '3-3', '2-2', 0, 0, '2024-12-27 23:26:08', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `message_reply`
--

CREATE TABLE `message_reply` (
  `id` int(11) UNSIGNED NOT NULL,
  `message_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `file_name` text NOT NULL,
  `enc_name` text NOT NULL,
  `identity` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(670);

-- --------------------------------------------------------

--
-- Table structure for table `modules_manage`
--

CREATE TABLE `modules_manage` (
  `id` int(11) NOT NULL,
  `modules_id` int(11) NOT NULL,
  `isEnabled` tinyint(1) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `modules_manage`
--

INSERT INTO `modules_manage` (`id`, `modules_id`, `isEnabled`, `branch_id`) VALUES
(1, 26, 0, 1),
(2, 8, 1, 1),
(3, 12, 1, 1),
(4, 15, 1, 1),
(5, 21, 1, 1),
(6, 20, 1, 1),
(7, 14, 1, 1),
(8, 7, 1, 1),
(9, 10, 0, 1),
(10, 5, 1, 1),
(11, 25, 1, 1),
(12, 13, 0, 1),
(13, 19, 1, 1),
(14, 27, 1, 1),
(15, 17, 1, 1),
(16, 23, 1, 1),
(17, 24, 0, 1),
(18, 16, 1, 1),
(19, 11, 0, 1),
(20, 22, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `offline_fees_payments`
--

CREATE TABLE `offline_fees_payments` (
  `id` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `student_enroll_id` int(11) DEFAULT NULL,
  `fees_allocation_id` int(11) DEFAULT NULL,
  `fees_type_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `fine` float(10,2) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `orig_file_name` varchar(255) DEFAULT NULL,
  `enc_file_name` text DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment_types`
--

CREATE TABLE `offline_payment_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `offline_payment_types`
--

INSERT INTO `offline_payment_types` (`id`, `name`, `note`, `branch_id`) VALUES
(1, 'Bikash {ersonal', '<p>pay here: 01775457008 Bikash personal</p>', 1),
(2, 'Rocket', '<p>pay here: 01870829343 rocket personal</p>', 1),
(3, 'Nagod personal', '<p>pay here: 01870829343 nagod personal</p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `online_admission`
--

CREATE TABLE `online_admission` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `birthday` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `caste` varchar(100) DEFAULT NULL,
  `blood_group` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(50) DEFAULT NULL,
  `mother_tongue` varchar(100) DEFAULT NULL,
  `present_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `admission_date` varchar(100) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `student_photo` varchar(255) DEFAULT NULL,
  `category_id` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `previous_school_details` text DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_relation` varchar(50) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `grd_occupation` varchar(255) DEFAULT NULL,
  `grd_income` varchar(25) DEFAULT NULL,
  `grd_education` varchar(255) DEFAULT NULL,
  `grd_email` varchar(255) DEFAULT NULL,
  `grd_mobile_no` varchar(50) DEFAULT NULL,
  `grd_address` text DEFAULT NULL,
  `grd_city` varchar(255) DEFAULT NULL,
  `grd_state` varchar(255) DEFAULT NULL,
  `grd_photo` varchar(255) DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 1,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0,
  `payment_amount` decimal(18,2) NOT NULL,
  `payment_details` longtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` varchar(11) DEFAULT NULL,
  `apply_date` datetime NOT NULL,
  `doc` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `online_admission`
--

INSERT INTO `online_admission` (`id`, `reference_no`, `first_name`, `last_name`, `gender`, `birthday`, `religion`, `caste`, `blood_group`, `mobile_no`, `mother_tongue`, `present_address`, `permanent_address`, `admission_date`, `city`, `state`, `student_photo`, `category_id`, `email`, `previous_school_details`, `guardian_name`, `guardian_relation`, `father_name`, `mother_name`, `grd_occupation`, `grd_income`, `grd_education`, `grd_email`, `grd_mobile_no`, `grd_address`, `grd_city`, `grd_state`, `grd_photo`, `status`, `payment_status`, `payment_amount`, `payment_details`, `branch_id`, `class_id`, `section_id`, `apply_date`, `doc`, `created_date`) VALUES
(2, '8910295', 'Elite Design', 'janatar bangladesh', 'male', '2025-01-02', 'Islam', NULL, 'A+', '01954578089', NULL, 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', 'hhhh', '2025-01-03', 'Bogura', NULL, '6c2e198a12b7d3566baa2ba22e9fc151.png', NULL, 'elitedesign.com.bdvvv@gmail.com', '{\"school_name\":\"cbbcbcv\",\"qualification\":\"SSC\",\"remarks\":\"ghhgh\"}', NULL, NULL, 'hggh', 'hghghg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 0, 0.00, '', 1, 2, NULL, '2025-01-03 01:30:13', 'f3d443d958eabc9ef037e269d490cef3.jpg', '2025-01-03 01:30:13'),
(3, '39802917', 'dfghdfh', 'dhdhd', 'male', '', '', NULL, '', '', NULL, '', '', '2025-01-08', '', NULL, '', NULL, '', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 0, 0.00, '', 1, 2, NULL, '2025-01-08 17:48:52', '97ffd0ff4cef167d88c756112e9c5990.png', '2025-01-08 17:48:52'),
(4, '58146452', 'Usman', 'Hadi', 'male', '2000-12-30', 'Ismail', NULL, 'A+', '01687986789', NULL, 'Dhaka', 'Dhak', '2026-03-19', 'Dhaka', NULL, 'abf2b0715a6013c79137384309c26b45.jpg', NULL, 'ismailbd@gmail.com', '{\"school_name\":\"12 hs\",\"qualification\":\"Hs \",\"remarks\":\"Bhs\"}', NULL, NULL, 'Hsbsb', 'Wbbbw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 0, 0.00, '', 1, 9, NULL, '2026-03-19 02:01:11', 'e211fbfd5fa97ce5255a883b77b622ae.pdf', '2026-03-19 02:01:11'),
(5, '62974693', 'farabe', 'islam', 'male', '2026-05-11', '', NULL, 'B-', '', NULL, '', '', '2026-05-11', '', NULL, 'd3861276880c3b3a17d07f08f22f70de.png', NULL, '', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 0, 0.00, '', 1, 2, NULL, '2026-05-11 20:41:39', 'a4a716853c0e7599d07addc20298009f.png', '2026-05-11 20:41:39'),
(6, '51616967', 'rocky', 'islam', 'male', '', '', NULL, 'A+', '', NULL, '', '', '2026-05-11', '', NULL, '', NULL, '', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 0, 0.00, '', 1, 2, NULL, '2026-05-11 21:29:49', 'acd38b8647368321d98c707262c5e406.jpg', '2026-05-11 21:29:49');

-- --------------------------------------------------------

--
-- Table structure for table `online_admission_fields`
--

CREATE TABLE `online_admission_fields` (
  `id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `required` tinyint(4) NOT NULL DEFAULT 0,
  `system` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `online_admission_fields`
--

INSERT INTO `online_admission_fields` (`id`, `fields_id`, `status`, `required`, `system`, `branch_id`) VALUES
(1, 2, 1, 1, 1, 1),
(2, 3, 1, 0, 1, 1),
(3, 4, 1, 0, 1, 1),
(4, 5, 1, 1, 1, 1),
(5, 6, 0, 0, 1, 1),
(6, 7, 0, 0, 1, 1),
(7, 8, 1, 0, 1, 1),
(8, 9, 0, 0, 1, 1),
(9, 10, 1, 0, 1, 1),
(10, 11, 0, 0, 1, 1),
(11, 12, 1, 0, 1, 1),
(12, 13, 1, 0, 1, 1),
(13, 14, 1, 0, 1, 1),
(14, 15, 0, 0, 1, 1),
(15, 16, 1, 0, 1, 1),
(16, 17, 1, 0, 1, 1),
(17, 18, 1, 0, 1, 1),
(18, 19, 1, 0, 1, 1),
(19, 20, 0, 0, 1, 1),
(20, 21, 0, 0, 1, 1),
(21, 22, 1, 0, 1, 1),
(22, 23, 1, 0, 1, 1),
(23, 24, 0, 0, 1, 1),
(24, 25, 0, 0, 1, 1),
(25, 26, 0, 0, 1, 1),
(26, 27, 0, 0, 1, 1),
(27, 28, 0, 0, 1, 1),
(28, 29, 0, 0, 1, 1),
(29, 30, 0, 0, 1, 1),
(30, 31, 1, 1, 1, 1),
(31, 32, 0, 0, 1, 1),
(32, 33, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `online_exam`
--

CREATE TABLE `online_exam` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` text NOT NULL,
  `subject_id` text NOT NULL,
  `limits_participation` int(11) NOT NULL,
  `exam_start` datetime DEFAULT NULL,
  `exam_end` datetime DEFAULT NULL,
  `duration` time NOT NULL,
  `mark_type` tinyint(1) NOT NULL DEFAULT 1,
  `passing_mark` float NOT NULL DEFAULT 0,
  `instruction` text DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `publish_result` tinyint(1) NOT NULL DEFAULT 0,
  `marks_display` tinyint(1) NOT NULL DEFAULT 1,
  `neg_mark` tinyint(1) NOT NULL DEFAULT 0,
  `question_type` tinyint(1) NOT NULL DEFAULT 0,
  `publish_status` tinyint(1) NOT NULL DEFAULT 0,
  `exam_type` tinyint(1) NOT NULL DEFAULT 0,
  `fee` float NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `position_generated` tinyint(1) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_answer`
--

CREATE TABLE `online_exam_answer` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `online_exam_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_attempts`
--

CREATE TABLE `online_exam_attempts` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `online_exam_id` int(11) NOT NULL,
  `count` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_payment`
--

CREATE TABLE `online_exam_payment` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `payment_method` tinyint(4) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `transaction_id` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_submitted`
--

CREATE TABLE `online_exam_submitted` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `online_exam_id` int(11) NOT NULL,
  `remark` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `income` varchar(100) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0(active) 1(deactivate)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`id`, `name`, `relation`, `father_name`, `mother_name`, `occupation`, `income`, `education`, `email`, `mobileno`, `address`, `city`, `state`, `branch_id`, `photo`, `facebook_url`, `linkedin_url`, `twitter_url`, `created_at`, `updated_at`, `active`) VALUES
(303, 'Md Abdul Rashid', 'Father', 'Khijir Uddin Munshi', 'Jamila', 'Business', '10000', 'SSC', 'rashid@gmail.com', '01775457006', 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', NULL, NULL, 1, 'defualt.png', NULL, NULL, NULL, '2025-01-02 17:26:28', NULL, 0),
(304, 'Rana', '', '', '', '', '', '', '', '01836832555', '', NULL, NULL, 1, 'defualt.png', NULL, NULL, NULL, '2026-04-27 18:51:55', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_config`
--

CREATE TABLE `payment_config` (
  `id` int(11) NOT NULL,
  `paypal_username` varchar(255) DEFAULT NULL,
  `paypal_password` varchar(255) DEFAULT NULL,
  `paypal_signature` varchar(255) DEFAULT NULL,
  `paypal_email` varchar(255) DEFAULT NULL,
  `paypal_sandbox` tinyint(4) DEFAULT NULL,
  `paypal_status` tinyint(4) DEFAULT NULL,
  `stripe_secret` varchar(255) DEFAULT NULL,
  `stripe_publishiable` varchar(255) NOT NULL,
  `stripe_demo` varchar(255) DEFAULT NULL,
  `stripe_status` tinyint(4) DEFAULT NULL,
  `payumoney_key` varchar(255) DEFAULT NULL,
  `payumoney_salt` varchar(255) DEFAULT NULL,
  `payumoney_demo` tinyint(4) DEFAULT NULL,
  `payumoney_status` tinyint(4) DEFAULT NULL,
  `paystack_secret_key` varchar(255) NOT NULL,
  `paystack_status` tinyint(4) NOT NULL,
  `razorpay_key_id` varchar(255) NOT NULL,
  `razorpay_key_secret` varchar(255) NOT NULL,
  `razorpay_demo` tinyint(4) NOT NULL,
  `razorpay_status` tinyint(4) NOT NULL,
  `sslcz_store_id` varchar(255) NOT NULL,
  `sslcz_store_passwd` varchar(255) NOT NULL,
  `sslcommerz_sandbox` tinyint(1) NOT NULL,
  `sslcommerz_status` tinyint(1) NOT NULL,
  `jazzcash_merchant_id` varchar(255) NOT NULL,
  `jazzcash_passwd` varchar(255) NOT NULL,
  `jazzcash_integerity_salt` varchar(255) NOT NULL,
  `jazzcash_sandbox` tinyint(1) NOT NULL,
  `jazzcash_status` tinyint(1) NOT NULL,
  `midtrans_client_key` varchar(255) NOT NULL,
  `midtrans_server_key` varchar(255) NOT NULL,
  `midtrans_sandbox` tinyint(1) NOT NULL,
  `midtrans_status` tinyint(1) NOT NULL,
  `flutterwave_public_key` varchar(255) DEFAULT NULL,
  `flutterwave_secret_key` varchar(255) DEFAULT NULL,
  `flutterwave_sandbox` tinyint(4) NOT NULL DEFAULT 0,
  `flutterwave_status` tinyint(4) NOT NULL DEFAULT 0,
  `paytm_merchantmid` varchar(255) DEFAULT NULL,
  `paytm_merchantkey` varchar(255) DEFAULT NULL,
  `paytm_merchant_website` varchar(255) DEFAULT NULL,
  `paytm_industry_type` varchar(255) DEFAULT NULL,
  `paytm_status` tinyint(1) NOT NULL DEFAULT 0,
  `toyyibpay_secretkey` varchar(255) DEFAULT NULL,
  `toyyibpay_categorycode` varchar(255) DEFAULT NULL,
  `toyyibpay_status` tinyint(1) NOT NULL DEFAULT 0,
  `payhere_merchant_id` varchar(255) DEFAULT NULL,
  `payhere_merchant_secret` varchar(255) DEFAULT NULL,
  `payhere_status` tinyint(1) NOT NULL DEFAULT 0,
  `nepalste_public_key` varchar(255) DEFAULT NULL,
  `nepalste_secret_key` varchar(255) DEFAULT NULL,
  `nepalste_status` tinyint(1) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `payment_config`
--

INSERT INTO `payment_config` (`id`, `paypal_username`, `paypal_password`, `paypal_signature`, `paypal_email`, `paypal_sandbox`, `paypal_status`, `stripe_secret`, `stripe_publishiable`, `stripe_demo`, `stripe_status`, `payumoney_key`, `payumoney_salt`, `payumoney_demo`, `payumoney_status`, `paystack_secret_key`, `paystack_status`, `razorpay_key_id`, `razorpay_key_secret`, `razorpay_demo`, `razorpay_status`, `sslcz_store_id`, `sslcz_store_passwd`, `sslcommerz_sandbox`, `sslcommerz_status`, `jazzcash_merchant_id`, `jazzcash_passwd`, `jazzcash_integerity_salt`, `jazzcash_sandbox`, `jazzcash_status`, `midtrans_client_key`, `midtrans_server_key`, `midtrans_sandbox`, `midtrans_status`, `flutterwave_public_key`, `flutterwave_secret_key`, `flutterwave_sandbox`, `flutterwave_status`, `paytm_merchantmid`, `paytm_merchantkey`, `paytm_merchant_website`, `paytm_industry_type`, `paytm_status`, `toyyibpay_secretkey`, `toyyibpay_categorycode`, `toyyibpay_status`, `payhere_merchant_id`, `payhere_merchant_secret`, `payhere_status`, `nepalste_public_key`, `nepalste_secret_key`, `nepalste_status`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, 0, NULL, NULL, NULL, 0, '', 0, '', '', 0, 0, '111', '111', 1, 1, '', '', '', 0, 0, '', '', 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 1, '2025-01-01 18:20:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_salary_stipend`
--

CREATE TABLE `payment_salary_stipend` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `amount` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `payment_types`
--

INSERT INTO `payment_types` (`id`, `name`, `branch_id`, `timestamp`) VALUES
(1, 'Cash', 0, '2019-07-27 18:12:21'),
(2, 'Card', 0, '2019-07-27 18:12:31'),
(3, 'Cheque', 0, '2019-12-21 10:07:59'),
(4, 'Bank Transfer', 0, '2019-12-21 10:08:36'),
(5, 'Other', 0, '2019-12-21 10:08:45'),
(6, 'Paypal', 0, '2019-12-21 10:08:45'),
(7, 'Stripe', 0, '2019-12-21 10:08:45'),
(8, 'PayUmoney', 0, '2019-12-21 10:08:45'),
(9, 'Paystack', 0, '2019-12-21 10:08:45'),
(10, 'Razorpay', 0, '2019-12-21 10:08:45'),
(11, 'SSLcommerz', 0, '2022-05-21 10:08:45'),
(12, 'Jazzcash', 0, '2022-05-21 10:08:45'),
(13, 'Midtrans', 0, '2022-05-21 10:08:45'),
(14, 'Flutter Wave', 0, '2022-05-15 10:08:45'),
(15, 'Offline Payments', 0, '2022-05-15 10:08:45'),
(16, 'Paytm', 0, '2023-05-12 12:08:45'),
(17, 'toyyibPay', 0, '2023-05-12 12:08:45'),
(18, 'Payhere', 0, '2023-05-12 12:08:45'),
(19, 'Nepalste', 0, '2023-05-12 12:08:45');

-- --------------------------------------------------------

--
-- Table structure for table `payslip`
--

CREATE TABLE `payslip` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `month` varchar(200) DEFAULT NULL,
  `year` varchar(20) NOT NULL,
  `basic_salary` decimal(18,2) NOT NULL,
  `total_allowance` decimal(18,2) NOT NULL,
  `total_deduction` decimal(18,2) NOT NULL,
  `net_salary` decimal(18,2) NOT NULL,
  `bill_no` varchar(25) NOT NULL,
  `remarks` text NOT NULL,
  `pay_via` tinyint(1) NOT NULL,
  `hash` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `paid_by` varchar(200) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `payslip`
--

INSERT INTO `payslip` (`id`, `staff_id`, `month`, `year`, `basic_salary`, `total_allowance`, `total_deduction`, `net_salary`, `bill_no`, `remarks`, `pay_via`, `hash`, `created_at`, `paid_by`, `branch_id`) VALUES
(1, 3, '11', '2024', 5000.00, 0.00, 0.00, 5000.00, '0001', '', 1, '4ab94c5b133f869410d99e4884fba0cb', '2024-12-27 11:28:14', '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payslip_details`
--

CREATE TABLE `payslip_details` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `type` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `prefix` varchar(100) NOT NULL,
  `show_view` tinyint(1) DEFAULT 1,
  `show_add` tinyint(1) DEFAULT 1,
  `show_edit` tinyint(1) DEFAULT 1,
  `show_delete` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `module_id`, `name`, `prefix`, `show_view`, `show_add`, `show_edit`, `show_delete`, `created_at`) VALUES
(1, 2, 'Student', 'student', 1, 1, 1, 1, '2020-01-22 11:45:47'),
(2, 2, 'Multiple Import', 'multiple_import', 0, 1, 0, 0, '2020-01-22 11:45:47'),
(3, 2, 'Student Category', 'student_category', 1, 1, 1, 1, '2020-01-22 11:45:47'),
(4, 2, 'Student Id Card', 'student_id_card', 1, 0, 0, 0, '2020-01-22 11:45:47'),
(5, 2, 'Disable Authentication', 'student_disable_authentication', 1, 1, 0, 0, '2020-01-22 11:45:47'),
(6, 4, 'Employee', 'employee', 1, 1, 1, 1, '2020-01-22 11:55:19'),
(7, 3, 'Parent', 'parent', 1, 1, 1, 1, '2020-01-22 13:24:05'),
(8, 3, 'Disable Authentication', 'parent_disable_authentication', 1, 1, 0, 0, '2020-01-22 14:22:21'),
(9, 4, 'Department', 'department', 1, 1, 1, 1, '2020-01-22 17:41:39'),
(10, 4, 'Designation', 'designation', 1, 1, 1, 1, '2020-01-22 17:41:39'),
(11, 4, 'Disable Authentication', 'employee_disable_authentication', 1, 1, 0, 0, '2020-01-22 17:41:39'),
(12, 5, 'Salary Template', 'salary_template', 1, 1, 1, 1, '2020-01-23 05:13:57'),
(13, 5, 'Salary Assign', 'salary_assign', 1, 1, 0, 0, '2020-01-23 05:14:05'),
(14, 5, 'Salary Payment', 'salary_payment', 1, 1, 0, 0, '2020-01-24 06:45:40'),
(15, 5, 'Salary Summary Report', 'salary_summary_report', 1, 0, 0, 0, '2020-03-14 17:09:17'),
(16, 5, 'Advance Salary', 'advance_salary', 1, 1, 1, 1, '2020-01-28 18:23:39'),
(17, 5, 'Advance Salary Manage', 'advance_salary_manage', 1, 1, 1, 1, '2020-01-25 04:57:12'),
(18, 5, 'Advance Salary Request', 'advance_salary_request', 1, 1, 0, 1, '2020-01-28 17:49:58'),
(19, 5, 'Leave Category', 'leave_category', 1, 1, 1, 1, '2020-01-29 02:46:23'),
(20, 5, 'Leave Request', 'leave_request', 1, 1, 1, 1, '2020-01-30 12:06:33'),
(21, 5, 'Leave Manage', 'leave_manage', 1, 1, 1, 1, '2020-01-29 07:27:15'),
(22, 5, 'Award', 'award', 1, 1, 1, 1, '2020-01-31 18:49:11'),
(23, 6, 'Classes', 'classes', 1, 1, 1, 1, '2020-02-01 18:10:00'),
(24, 6, 'Section', 'section', 1, 1, 1, 1, '2020-02-01 21:06:44'),
(25, 6, 'Assign Class Teacher', 'assign_class_teacher', 1, 1, 1, 1, '2020-02-02 07:09:22'),
(26, 6, 'Subject', 'subject', 1, 1, 1, 1, '2020-02-03 04:32:39'),
(27, 6, 'Subject Class Assign ', 'subject_class_assign', 1, 1, 1, 1, '2020-02-03 17:43:19'),
(28, 6, 'Subject Teacher Assign', 'subject_teacher_assign', 1, 1, 0, 1, '2020-02-03 19:05:11'),
(29, 6, 'Class Timetable', 'class_timetable', 1, 1, 1, 1, '2020-02-04 05:50:37'),
(30, 2, 'Student Promotion', 'student_promotion', 1, 1, 0, 0, '2020-02-05 18:20:30'),
(31, 8, 'Attachments', 'attachments', 1, 1, 1, 1, '2020-02-06 17:59:43'),
(32, 7, 'Homework', 'homework', 1, 1, 1, 1, '2020-02-07 05:40:08'),
(33, 8, 'Attachment Type', 'attachment_type', 1, 1, 1, 1, '2020-02-07 07:16:28'),
(34, 9, 'Exam', 'exam', 1, 1, 1, 1, '2020-02-07 09:59:29'),
(35, 9, 'Exam Term', 'exam_term', 1, 1, 1, 1, '2020-02-07 12:09:28'),
(36, 9, 'Exam Hall', 'exam_hall', 1, 1, 1, 1, '2020-02-07 14:31:04'),
(37, 9, 'Exam Timetable', 'exam_timetable', 1, 1, 0, 1, '2020-02-08 17:04:31'),
(38, 9, 'Exam Mark', 'exam_mark', 1, 1, 1, 1, '2020-02-10 12:53:41'),
(39, 9, 'Exam Grade', 'exam_grade', 1, 1, 1, 1, '2020-02-10 17:29:16'),
(40, 10, 'Hostel', 'hostel', 1, 1, 1, 1, '2020-02-11 04:41:36'),
(41, 10, 'Hostel Category', 'hostel_category', 1, 1, 1, 1, '2020-02-11 07:52:31'),
(42, 10, 'Hostel Room', 'hostel_room', 1, 1, 1, 1, '2020-02-11 11:50:09'),
(43, 10, 'Hostel Allocation', 'hostel_allocation', 1, 0, 0, 1, '2020-02-11 13:06:15'),
(44, 11, 'Transport Route', 'transport_route', 1, 1, 1, 1, '2020-02-12 05:26:19'),
(45, 11, 'Transport Vehicle', 'transport_vehicle', 1, 1, 1, 1, '2020-02-12 05:57:30'),
(46, 11, 'Transport Stoppage', 'transport_stoppage', 1, 1, 1, 1, '2020-02-12 06:49:20'),
(47, 11, 'Transport Assign', 'transport_assign', 1, 1, 1, 1, '2020-02-12 09:55:21'),
(48, 11, 'Transport Allocation', 'transport_allocation', 1, 0, 0, 1, '2020-02-12 19:33:05'),
(49, 12, 'Student Attendance', 'student_attendance', 0, 1, 0, 0, '2020-02-13 05:25:53'),
(50, 12, 'Employee Attendance', 'employee_attendance', 0, 1, 0, 0, '2020-02-13 10:04:16'),
(51, 12, 'Exam Attendance', 'exam_attendance', 0, 1, 0, 0, '2020-02-13 11:08:14'),
(52, 12, 'Student Attendance Report', 'student_attendance_report', 1, 0, 0, 0, '2020-02-13 19:20:56'),
(53, 12, 'Employee Attendance Report', 'employee_attendance_report', 1, 0, 0, 0, '2020-02-14 06:08:53'),
(54, 12, 'Exam Attendance Report', 'exam_attendance_report', 1, 0, 0, 0, '2020-02-14 06:21:40'),
(55, 13, 'Book', 'book', 1, 1, 1, 1, '2020-02-14 06:40:42'),
(56, 13, 'Book Category', 'book_category', 1, 1, 1, 1, '2020-02-15 04:11:41'),
(57, 13, 'Book Manage', 'book_manage', 1, 1, 0, 1, '2020-02-15 11:13:24'),
(58, 13, 'Book Request', 'book_request', 1, 1, 0, 1, '2020-02-17 06:45:19'),
(59, 14, 'Event', 'event', 1, 1, 1, 1, '2020-02-17 18:02:15'),
(60, 14, 'Event Type', 'event_type', 1, 1, 1, 1, '2020-02-18 04:40:33'),
(61, 15, 'Sendsmsmail', 'sendsmsmail', 1, 1, 0, 1, '2020-02-22 07:19:57'),
(62, 15, 'Sendsmsmail Template', 'sendsmsmail_template', 1, 1, 1, 1, '2020-02-22 10:14:57'),
(63, 17, 'Account', 'account', 1, 1, 1, 1, '2020-02-25 09:34:43'),
(64, 17, 'Deposit', 'deposit', 1, 1, 1, 1, '2020-02-25 12:56:11'),
(65, 17, 'Expense', 'expense', 1, 1, 1, 1, '2020-02-26 06:35:57'),
(66, 17, 'All Transactions', 'all_transactions', 1, 0, 0, 0, '2020-02-26 13:35:05'),
(67, 17, 'Voucher Head', 'voucher_head', 1, 1, 1, 1, '2020-02-25 10:50:56'),
(68, 17, 'Accounting Reports', 'accounting_reports', 1, 1, 1, 1, '2020-02-25 13:36:24'),
(69, 16, 'Fees Type', 'fees_type', 1, 1, 1, 1, '2020-02-27 10:11:03'),
(70, 16, 'Fees Group', 'fees_group', 1, 1, 1, 1, '2020-02-26 05:49:09'),
(71, 16, 'Fees Fine Setup', 'fees_fine_setup', 1, 1, 1, 1, '2020-03-05 02:59:27'),
(72, 16, 'Fees Allocation', 'fees_allocation', 1, 1, 1, 1, '2020-03-01 13:47:43'),
(73, 16, 'Collect Fees', 'collect_fees', 0, 1, 0, 0, '2020-03-15 04:23:58'),
(74, 16, 'Fees Reminder', 'fees_reminder', 1, 1, 1, 1, '2020-03-15 04:29:58'),
(75, 16, 'Due Invoice', 'due_invoice', 1, 0, 0, 0, '2020-03-15 04:33:36'),
(76, 16, 'Invoice', 'invoice', 1, 0, 0, 1, '2020-03-15 04:38:06'),
(77, 9, 'Mark Distribution', 'mark_distribution', 1, 1, 1, 1, '2020-03-19 13:02:54'),
(78, 9, 'Report Card', 'report_card', 1, 0, 0, 0, '2020-03-20 12:20:28'),
(79, 9, 'Tabulation Sheet', 'tabulation_sheet', 1, 0, 0, 0, '2020-03-21 07:12:38'),
(80, 15, 'Sendsmsmail Reports', 'sendsmsmail_reports', 1, 0, 0, 0, '2020-03-21 17:02:02'),
(81, 18, 'Global Settings', 'global_settings', 1, 0, 1, 0, '2020-03-22 05:05:41'),
(82, 18, 'Payment Settings', 'payment_settings', 1, 1, 0, 0, '2020-03-22 05:08:57'),
(83, 18, 'Sms Settings', 'sms_settings', 1, 1, 1, 1, '2020-03-22 05:08:57'),
(84, 18, 'Email Settings', 'email_settings', 1, 1, 1, 1, '2020-03-22 05:10:39'),
(85, 18, 'Translations', 'translations', 1, 1, 1, 1, '2020-03-22 05:18:33'),
(86, 18, 'Backup', 'backup', 1, 1, 1, 1, '2020-03-22 07:09:33'),
(87, 18, 'Backup Restore', 'backup_restore', 0, 1, 0, 0, '2020-03-22 07:09:34'),
(88, 7, 'Homework Evaluate', 'homework_evaluate', 1, 1, 0, 0, '2020-03-28 04:20:29'),
(89, 7, 'Evaluation Report', 'evaluation_report', 1, 0, 0, 0, '2020-03-28 09:56:04'),
(90, 18, 'School Settings', 'school_settings', 1, 0, 1, 0, '2020-03-30 17:36:37'),
(91, 1, 'Monthly Income Vs Expense Pie Chart', 'monthly_income_vs_expense_chart', 1, 0, 0, 0, '2020-03-31 06:15:31'),
(92, 1, 'Annual Student Fees Summary Chart', 'annual_student_fees_summary_chart', 1, 0, 0, 0, '2020-03-31 06:15:31'),
(93, 1, 'Employee Count Widget', 'employee_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
(94, 1, 'Student Count Widget', 'student_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
(95, 1, 'Parent Count Widget', 'parent_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
(96, 1, 'Teacher Count Widget', 'teacher_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
(97, 1, 'Student Quantity Pie Chart', 'student_quantity_pie_chart', 1, 0, 0, 0, '2020-03-31 07:14:07'),
(98, 1, 'Weekend Attendance Inspection Chart', 'weekend_attendance_inspection_chart', 1, 0, 0, 0, '2020-03-31 07:14:07'),
(99, 1, 'Admission Count Widget', 'admission_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
(100, 1, 'Voucher Count Widget', 'voucher_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
(101, 1, 'Transport Count Widget', 'transport_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
(102, 1, 'Hostel Count Widget', 'hostel_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
(103, 18, 'Accounting Links', 'accounting_links', 1, 0, 1, 0, '2020-03-31 09:46:30'),
(104, 16, 'Fees Reports', 'fees_reports', 1, 0, 0, 0, '2020-04-01 15:52:19'),
(105, 18, 'Cron Job', 'cron_job', 1, 0, 1, 0, '2020-03-31 09:46:30'),
(106, 18, 'Custom Field', 'custom_field', 1, 1, 1, 1, '2020-03-31 09:46:30'),
(107, 5, 'Leave Reports', 'leave_reports', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(108, 18, 'Live Class Config', 'live_class_config', 1, 0, 1, 0, '2020-03-31 09:46:30'),
(109, 19, 'Live Class', 'live_class', 1, 1, 1, 1, '2020-03-31 09:46:30'),
(110, 20, 'Certificate Templete', 'certificate_templete', 1, 1, 1, 1, '2020-03-31 09:46:30'),
(111, 20, 'Generate Student Certificate', 'generate_student_certificate', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(112, 20, 'Generate Employee Certificate', 'generate_employee_certificate', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(113, 21, 'ID Card Templete', 'id_card_templete', 1, 1, 1, 1, '2020-03-31 09:46:30'),
(114, 21, 'Generate Student ID Card', 'generate_student_idcard', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(115, 21, 'Generate Employee ID Card', 'generate_employee_idcard', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(116, 21, 'Admit Card Templete', 'admit_card_templete', 1, 1, 1, 1, '2020-03-31 09:46:30'),
(117, 21, 'Generate Admit card', 'generate_admit_card', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(118, 22, 'Frontend Setting', 'frontend_setting', 1, 1, 0, 0, '2019-09-11 03:24:07'),
(119, 22, 'Frontend Menu', 'frontend_menu', 1, 1, 1, 1, '2019-09-11 04:03:39'),
(120, 22, 'Frontend Section', 'frontend_section', 1, 1, 0, 0, '2019-09-11 04:26:11'),
(121, 22, 'Manage Page', 'manage_page', 1, 1, 1, 1, '2019-09-11 05:54:08'),
(122, 22, 'Frontend Slider', 'frontend_slider', 1, 1, 1, 1, '2019-09-11 06:12:31'),
(123, 22, 'Frontend Features', 'frontend_features', 1, 1, 1, 1, '2019-09-11 06:47:51'),
(124, 22, 'Frontend Testimonial', 'frontend_testimonial', 1, 1, 1, 1, '2019-09-11 06:54:30'),
(125, 22, 'Frontend Services', 'frontend_services', 1, 1, 1, 1, '2019-09-11 07:01:44'),
(126, 22, 'Frontend Faq', 'frontend_faq', 1, 1, 1, 1, '2019-09-11 07:06:16'),
(127, 2, 'Online Admission', 'online_admission', 1, 1, 0, 1, '2019-09-11 07:06:16'),
(128, 18, 'System Update', 'system_update', 0, 1, 0, 0, '2019-09-11 07:06:16'),
(129, 19, 'Live Class Reports', 'live_class_reports', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(130, 16, 'Fees Revert', 'fees_revert', 0, 0, 0, 1, '2020-03-31 09:46:30'),
(131, 22, 'Frontend Gallery', 'frontend_gallery', 1, 1, 1, 1, '2019-09-11 07:06:16'),
(132, 22, 'Frontend Gallery Category', 'frontend_gallery_category', 1, 1, 1, 1, '2019-09-11 07:06:16'),
(133, 6, 'Teacher Timetable', 'teacher_timetable', 1, 0, 0, 0, '2021-03-31 09:46:30'),
(134, 18, 'Whatsapp Config', 'whatsapp_config', 1, 1, 1, 1, '2021-03-31 09:46:30'),
(135, 18, 'System Student Field', 'system_student_field', 1, 0, 1, 0, '2021-03-31 09:46:30'),
(136, 23, 'Online Exam', 'online_exam', 1, 1, 1, 1, '2021-03-31 09:46:30'),
(137, 23, 'Question Bank', 'question_bank', 1, 1, 1, 1, '2021-03-31 09:46:30'),
(138, 23, 'Add Questions', 'add_questions', 0, 1, 0, 0, '2021-03-31 09:46:30'),
(139, 23, 'Question Group', 'question_group', 1, 1, 1, 1, '2021-03-31 09:46:30'),
(140, 23, 'Exam Result', 'exam_result', 1, 0, 0, 0, '2021-03-31 09:46:30'),
(141, 23, 'Position Generate', 'position_generate', 1, 1, 0, 0, '2021-03-31 09:46:30'),
(142, 24, 'Postal Record', 'postal_record', 1, 1, 1, 1, '2021-03-31 09:46:30'),
(143, 24, 'Call Log', 'call_log', 1, 1, 1, 1, '2021-03-31 09:46:30'),
(144, 24, 'Visitor Log', 'visitor_log', 1, 1, 1, 1, '2021-03-31 09:46:30'),
(145, 24, 'Complaint', 'complaint', 1, 1, 1, 1, '2021-03-31 09:46:30'),
(146, 24, 'Enquiry', 'enquiry', 1, 1, 1, 1, '2021-03-31 09:46:30'),
(147, 24, 'Follow Up', 'follow_up', 1, 1, 0, 1, '2021-03-31 09:46:30'),
(148, 24, 'Config Reception', 'config_reception', 1, 1, 1, 1, '2021-03-31 09:46:30'),
(149, 15, 'Student Birthday Wishes', 'student_birthday_wishes', 1, 0, 0, 0, '2021-03-31 09:46:30'),
(150, 15, 'Staff Birthday Wishes', 'staff_birthday_wishes', 1, 0, 0, 0, '2021-03-31 09:46:30'),
(151, 1, 'Student Birthday Wishes Widget', 'student_birthday_widget', 1, 0, 0, 0, '2021-03-31 07:22:05'),
(152, 1, 'Staff Birthday Wishes Widget', 'staff_birthday_widget', 1, 0, 0, 0, '2021-03-31 07:22:05'),
(153, 9, 'Progress Reports', 'progress_reports', 1, 0, 0, 0, '2021-03-21 07:12:38'),
(154, 2, 'Disable Reason', 'disable_reason', 1, 1, 1, 1, '2021-03-21 07:12:38'),
(155, 16, 'Offline Payments', 'offline_payments', 1, 0, 0, 0, '2023-03-23 07:12:38'),
(156, 16, 'Offline Payments Type', 'offline_payments_type', 1, 1, 1, 1, '2023-03-23 07:12:38'),
(157, 25, 'Product', 'product', 1, 1, 1, 1, '2023-06-13 19:21:42'),
(158, 25, 'Product Category', 'product_category', 1, 1, 1, 1, '2023-06-13 19:21:42'),
(159, 25, 'Product Supplier', 'product_supplier', 1, 1, 1, 1, '2023-06-13 19:21:42'),
(160, 25, 'Product Unit', 'product_unit', 1, 1, 1, 1, '2023-06-13 19:21:42'),
(161, 25, 'Product Purchase', 'product_purchase', 1, 1, 1, 1, '2023-06-13 19:21:42'),
(162, 25, 'Purchase Payment', 'purchase_payment', 1, 1, 0, 0, '2023-06-13 19:21:42'),
(163, 25, 'Product Store', 'product_store', 1, 1, 1, 1, '2023-06-13 19:21:42'),
(164, 25, 'Product Sales', 'product_sales', 1, 1, 0, 1, '2023-06-13 19:21:42'),
(165, 25, 'Sales Payment', 'sales_payment', 1, 0, 0, 0, '2023-06-21 07:05:10'),
(166, 25, 'Product Issue', 'product_issue', 1, 1, 0, 1, '2023-06-13 19:21:42'),
(167, 25, 'Inventory Report', 'inventory_report', 1, 0, 0, 0, '2023-06-27 03:56:45'),
(168, 9, 'Generate Position', 'generate_position', 1, 0, 0, 0, '2023-08-10 15:08:29'),
(169, 18, 'User Login Log', 'user_login_log', 1, 0, 0, 1, '2024-04-08 09:01:26'),
(170, 26, 'Manage Alumni', 'manage_alumni', 1, 1, 1, 1, '2024-04-08 09:01:26'),
(171, 26, 'Alumni Events', 'alumni_events', 1, 1, 1, 1, '2024-04-08 09:01:26'),
(172, 27, 'Multi Class Student', 'multi_class', 1, 1, 0, 0, '2024-05-02 08:28:04'),
(173, 22, 'Frontend News', 'frontend_news', 1, 1, 1, 1, '2024-05-05 08:45:48'),
(174, 9, 'Marksheet Template', 'marksheet_template', 1, 1, 1, 1, '2024-05-10 05:59:53');

-- --------------------------------------------------------

--
-- Table structure for table `permission_modules`
--

CREATE TABLE `permission_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `system` tinyint(1) NOT NULL,
  `sorted` tinyint(10) NOT NULL,
  `in_module` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `permission_modules`
--

INSERT INTO `permission_modules` (`id`, `name`, `prefix`, `system`, `sorted`, `in_module`, `created_at`) VALUES
(1, 'Dashboard', 'dashboard', 1, 1, 0, '2019-05-26 22:23:00'),
(2, 'Student', 'student', 1, 4, 0, '2019-05-26 22:23:00'),
(3, 'Parents', 'parents', 1, 5, 0, '2019-05-26 22:23:00'),
(4, 'Employee', 'employee', 1, 6, 0, '2019-05-26 22:23:00'),
(5, 'Human Resource', 'human_resource', 1, 9, 1, '2019-05-26 22:23:00'),
(6, 'Academic', 'academic', 1, 10, 0, '2019-05-26 22:23:00'),
(7, 'Homework', 'homework', 1, 13, 1, '2019-05-26 22:23:00'),
(8, 'Attachments Book', 'attachments_book', 1, 12, 1, '2019-05-26 22:23:00'),
(9, 'Exam Master', 'exam_master', 1, 14, 0, '2019-05-26 22:23:00'),
(10, 'Hostel', 'hostel', 1, 16, 1, '2019-05-26 22:23:00'),
(11, 'Transport', 'transport', 1, 17, 1, '2019-05-26 22:23:00'),
(12, 'Attendance', 'attendance', 1, 18, 1, '2019-05-26 22:23:00'),
(13, 'Library', 'library', 1, 19, 1, '2019-05-26 22:23:00'),
(14, 'Events', 'events', 1, 20, 1, '2019-05-26 22:23:00'),
(15, 'Bulk Sms And Email', 'bulk_sms_and_email', 1, 21, 1, '2019-05-26 22:23:00'),
(16, 'Student Accounting', 'student_accounting', 1, 22, 1, '2019-05-26 22:23:00'),
(17, 'Office Accounting', 'office_accounting', 1, 23, 1, '2019-05-26 22:23:00'),
(18, 'Settings', 'settings', 1, 24, 0, '2019-05-26 22:23:00'),
(19, 'Live Class', 'live_class', 1, 11, 1, '2019-05-26 22:23:00'),
(20, 'Certificate', 'certificate', 1, 8, 1, '2019-05-26 22:23:00'),
(21, 'Card Management', 'card_management', 1, 7, 1, '2019-05-26 22:23:00'),
(22, 'Website', 'website', 1, 2, 1, '2019-05-26 22:23:00'),
(23, 'Online Exam', 'online_exam', 1, 15, 1, '2019-05-26 22:23:00'),
(24, 'Reception', 'reception', 1, 3, 1, '2019-05-26 22:23:00'),
(25, 'Inventory', 'inventory', 1, 3, 1, '2023-06-13 19:16:49'),
(26, 'Alumni', 'alumni', 1, 24, 1, '2024-05-13 19:16:49'),
(27, 'Multi Class', 'multi_class', 1, 25, 1, '2024-05-02 08:32:01');

-- --------------------------------------------------------

--
-- Table structure for table `postal_record`
--

CREATE TABLE `postal_record` (
  `id` int(11) NOT NULL,
  `sender_title` varchar(255) DEFAULT NULL,
  `receiver_title` varchar(255) DEFAULT NULL,
  `reference_no` varchar(255) DEFAULT NULL,
  `address` text NOT NULL,
  `date` date NOT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `file` varchar(250) NOT NULL,
  `confidential` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sales_unit_id` int(11) NOT NULL,
  `unit_ratio` varchar(20) DEFAULT '1',
  `purchase_price` decimal(18,2) NOT NULL DEFAULT 0.00,
  `sales_price` decimal(18,2) NOT NULL DEFAULT 0.00,
  `available_stock` varchar(11) NOT NULL DEFAULT '0',
  `photo` varchar(100) DEFAULT NULL,
  `remarks` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `code`, `category_id`, `purchase_unit_id`, `sales_unit_id`, `unit_ratio`, `purchase_price`, `sales_price`, `available_stock`, `photo`, `remarks`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Tie', 'T0001', 1, 1, 1, '1', 80.00, 150.00, '-2', NULL, '', 1, '2024-12-27 11:52:16', '2026-04-14 01:01:41'),
(2, 'ID CARD', '0002', 1, 1, 1, '1', 70.00, 100.00, '0', NULL, '', 1, '2024-12-27 11:54:19', '2024-12-27 11:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `name`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Stationary', 1, '2024-12-27 11:50:46', NULL),
(2, 'Clothe', 1, '2024-12-27 11:53:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_issues`
--

CREATE TABLE `product_issues` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_of_issue` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `remarks` text NOT NULL,
  `prepared_by` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_issues_details`
--

CREATE TABLE `product_issues_details` (
  `id` int(11) NOT NULL,
  `issues_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_store`
--

CREATE TABLE `product_store` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `mobileno` varchar(255) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `product_store`
--

INSERT INTO `product_store` (`id`, `name`, `code`, `mobileno`, `address`, `description`, `branch_id`, `created_at`) VALUES
(1, 'General Store', '01', '0', '', '', 1, '2024-12-27 11:54:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_supplier`
--

CREATE TABLE `product_supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `product_list` mediumtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_unit`
--

CREATE TABLE `product_unit` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `product_unit`
--

INSERT INTO `product_unit` (`id`, `name`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Pcs', 1, '2024-12-27 11:49:26', NULL),
(2, 'Rim', 1, '2024-12-27 11:49:32', NULL),
(3, 'Dozen', 1, '2024-12-27 11:49:38', NULL),
(4, 'Kg', 1, '2024-12-27 11:49:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promotion_history`
--

CREATE TABLE `promotion_history` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `pre_class` int(11) NOT NULL,
  `pre_section` int(11) NOT NULL,
  `pre_session` int(11) NOT NULL,
  `pro_class` int(11) NOT NULL,
  `pro_section` int(11) NOT NULL,
  `pro_session` int(11) NOT NULL,
  `prev_due` float NOT NULL DEFAULT 0,
  `is_leave` tinyint(4) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_bill`
--

CREATE TABLE `purchase_bill` (
  `id` int(11) NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `paid` decimal(18,2) NOT NULL DEFAULT 0.00,
  `due` decimal(18,2) NOT NULL DEFAULT 0.00,
  `payment_status` int(11) NOT NULL,
  `purchase_status` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `prepared_by` int(11) DEFAULT NULL,
  `modifier_id` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_bill_details`
--

CREATE TABLE `purchase_bill_details` (
  `id` int(11) NOT NULL,
  `purchase_bill_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` decimal(18,2) NOT NULL DEFAULT 0.00,
  `quantity` varchar(20) NOT NULL,
  `discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `sub_total` decimal(18,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payment_history`
--

CREATE TABLE `purchase_payment_history` (
  `id` int(11) NOT NULL,
  `purchase_bill_id` varchar(11) NOT NULL,
  `payment_by` int(11) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `pay_via` varchar(25) NOT NULL,
  `remarks` text NOT NULL,
  `attach_orig_name` varchar(255) DEFAULT NULL,
  `attach_file_name` varchar(255) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `coll_type` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT 0,
  `subject_id` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL,
  `question` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `opt_1` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `opt_2` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `opt_3` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `opt_4` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `answer` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mark` float(10,2) NOT NULL DEFAULT 0.00,
  `branch_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions_manage`
--

CREATE TABLE `questions_manage` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `onlineexam_id` int(11) DEFAULT NULL,
  `marks` float(10,2) NOT NULL DEFAULT 0.00,
  `neg_marks` float(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_group`
--

CREATE TABLE `question_group` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE `reset_password` (
  `key` longtext NOT NULL,
  `username` varchar(100) NOT NULL,
  `login_credential_id` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `reset_password`
--

INSERT INTO `reset_password` (`key`, `username`, `login_credential_id`, `created_at`) VALUES
('a78be38689198e55c768e8e165b7216f399a12cb30cd74202db03c114b8bf570580dec8e5848083b6df970fef7956ad5f74ec5fc29b86f239fd79a13dab71482', 'info@elitedesign.com.bd', '1', '2025-01-06 07:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `rm_sessions`
--

CREATE TABLE `rm_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `rm_sessions`
--

INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('00jjojbadidnp2da9cujgpvd4nncn8id', '210.1.247.201', 1780020364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303032303336343b),
('00joio644qj58ddimp40gnhnhnvq73c0', '103.73.46.173', 1780030016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303033303030333b),
('03c1lk42flrs36iovqfqopefube50ldd', '217.113.194.100', 1780305160, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303330353136303b),
('06ubs60v29rrh45h013h78vcmcffmrpj', '104.210.140.130', 1780099028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303039393032383b),
('07dv47n18t37aof0dp7kuq958idtvids', '2a03:2880:11ff:5c::', 1779908095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393930383039353b),
('0b07ege1shcutop4g7tu000ql62hp8k7', '2600:1f16:743:ac00:ff50:187c:345e:4291', 1780228210, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303232383231303b),
('0lbe1biur4d9ie7714ndfjv0r6qa2rdh', '165.232.172.159', 1780143805, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303134333830353b),
('0ukd354d0uosva3io5av3pgssru2i91v', '165.232.41.158', 1779976350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393937363335303b),
('16mqfc9mqd52b6lfhi9g48ivuhbiqo1c', '2600:1f16:743:ac00:4a57:618e:c4ff:41e5', 1780171433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303137313433333b),
('19clohpr16o61v4hv0gdjgas43i792am', '52.167.144.160', 1780290103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303239303130333b),
('1sfl233u19cidhvpq0ca7no87lcthqsj', '40.77.167.32', 1780143660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303134333636303b),
('23fdt7ohu7lq2ghscldjd2itt85m6844', '103.73.46.173', 1780029918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303032393931383b),
('286fakm4utl018jqke8uolnidgdf4nd9', '220.181.51.92', 1780095492, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303039353439323b),
('2fj1nvlojalc5ea44tmcdtf98lc86fcr', '172.236.201.224', 1780076799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303037363739393b),
('2jv35ur8s92p4kaug89054q0e02uk1cj', '114.130.187.59', 1779869542, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836393533393b),
('2mljt47324rbvgi756e3ckagake85jca', '5.182.207.245', 1780094310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303039343330393b),
('36151s33gso6f75dv1e9jvoh4njo9j03', '217.113.194.101', 1780303609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303330333630393b),
('38nl20i9jlaf86r1dp6gm9525jj7el85', '103.106.238.208', 1779867615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836373336313b72656469726563745f75726c7c733a34373a2268747470733a2f2f7363686f6f6c312e637265617469766564657369676e2e636f6d2e62642f64617368626f617264223b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b),
('3aggfu5o71ilfc3t42og1r9s06q7c93t', '52.167.144.66', 1780143651, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303134333635313b),
('3tfh6up2ckvq9ggjdko5uli7ubn32k4q', '138.197.35.161', 1779974244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393937343234343b),
('47q2tfrffsqknn8ctmi618s2qrmurjo3', '198.235.24.111', 1779869988, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836393938383b),
('489efm5j0idscheku8q2judmrp8ie56c', '217.113.194.99', 1780304590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303330343539303b),
('4a1b7lsug3nss2icls040b846l5ch3t8', '206.189.88.14', 1779921771, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393932313737313b),
('4upcn6flr60dpcbmg0qjbt5oj2q0724u', '32.193.31.241', 1780103337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303130333333373b),
('6033ra4qc0hbr0rjgu0hhm84bcp6jmhk', '217.113.194.92', 1780306175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303330363137353b),
('64lirnc589m725ajbu3qvp2ua7b26f4r', '217.113.194.96', 1780306002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303330363030323b),
('6n3pd365alkc823ged81435uvq7hilci', '82.23.230.8', 1779970669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393937303636393b),
('6vcuq94vntq29ud0d9n16v1snf4tc6l5', '103.106.238.208', 1779867038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836373033383b72656469726563745f75726c7c733a34373a2268747470733a2f2f7363686f6f6c312e637265617469766564657369676e2e636f6d2e62642f64617368626f617264223b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('72a3im9cjpg3kkn16l9mgpljkpstes5r', '103.73.46.173', 1780030022, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303033303032323b),
('78eh63gl5gm729i13hlpcm1n7525dtjc', '2a03:2880:24ff:8::', 1780010881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303031303838313b),
('7ctubjftmoe42omemfqih6e5mijqteh0', '103.96.105.99', 1779889867, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393838393836373b),
('7gvqf6a6ir3bc9ioovphi6jgfgn8o912', '74.125.212.139', 1780226971, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303232363937313b),
('856pb84q8b689496t2qvvopha0gfntdv', '217.113.194.97', 1780304846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303330343834363b),
('8e6atrk9raghunlvr85dfehac2tm7897', '2404:1c40:3e4:38ba:1020:9dff:fe3d:4fa3', 1779886090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393838363037343b),
('8i9e3j37elu85jtvcfd3a9dfi8rp4rkm', '34.193.242.118', 1779971179, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393937313137393b),
('8uoj54r0901180qk622pbgaum4jrouu0', '217.113.194.96', 1780304372, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303330343337323b),
('9fme8hku7tbcr8patoqa5t2kid2hpmct', '43.246.202.82', 1780161903, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303136313930313b),
('9lcbpbjvd2fv7k7rauole6qbuh1a9mvo', '35.85.248.150', 1779929285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393932393238353b),
('9su4lih6ellntdptub9o231u8agphich', '66.249.89.9', 1780041682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303034313638323b),
('abm513l7pkigd8fh5t710cju874nkdl9', '157.66.56.90', 1780216643, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303231363633393b),
('ah3phi61b23ga12o2pl4ih52r9310it0', '205.210.31.106', 1780102116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303130323131363b),
('ahd6rnc401h0v8quvv5o23a5hlgev4ib', '103.106.238.208', 1779865943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836353934333b),
('an6pujqukn4fo76luichpt5qj369ub7g', '2a03:2880:11ff:51::', 1780297976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303239373937363b),
('bbfbe6to6dvdqieo3pt2ot4boboo0cq5', '74.7.230.7', 1779950098, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393935303039383b),
('bcgakcn9lnq6s5888e0siit5b533a0t3', '147.185.132.129', 1780186712, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303138363731323b),
('bjhrch5nip6ogcm3fj0f222c7578v2o6', '66.102.6.73', 1779865853, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836353835333b),
('bka9fob4vbsj70lqh8fsb14rog7e434v', '205.210.31.241', 1780136477, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303133363437373b),
('bqoa9j4sfkchmdcvspnbglnpm72udh29', '103.106.238.208', 1779866671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836363637313b72656469726563745f75726c7c733a34373a2268747470733a2f2f7363686f6f6c312e637265617469766564657369676e2e636f6d2e62642f64617368626f617264223b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b),
('brg67slhi4mo0pa4ifck6scaa0eiua5k', '217.113.194.99', 1780303887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303330333838373b),
('c6eu7ercvfia4tdntu7vgrgipluee1ml', '217.113.194.221', 1780306356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303330363335363b),
('cbl0koss8fac57hdt9aa7pe91b7rkgfu', '40.77.167.43', 1779890870, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393839303837303b),
('cmq54fci2s682d5c2tgbucpgj0sknumd', '198.235.24.107', 1780102031, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303130323033313b),
('cu8lg0k9hl8n8q35e9vv7p0ul3ble8kh', '145.223.41.208', 1779970853, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393937303835333b),
('d30h8kajrnee9se9absej2p0pf14ttb0', '206.189.88.14', 1779921771, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393932313737313b),
('d572t23el0vfv84j0mgpin4s5lisiup1', '43.165.167.69', 1780178936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303137383933363b),
('d7jtfmbb8d0r2adhhnctq7tjlb41qme2', '66.249.64.11', 1779995952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393939353935323b),
('d9u2u9u5fcgcmjnltjp3p4gpl2tm1b70', '2a03:2880:11ff:53::', 1780297977, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303239373937373b),
('dcpghsbg9h3h93d53he2nduq8p40odkj', '217.113.194.94', 1779931202, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393933313230323b),
('dep27t56mtou0d7bfqk0fcgfi855babb', '103.106.238.208', 1779866356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836363335363b72656469726563745f75726c7c733a34373a2268747470733a2f2f7363686f6f6c312e637265617469766564657369676e2e636f6d2e62642f64617368626f617264223b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b),
('dj8c5fel21huq4hjpav77gs60k1vem2m', '66.249.64.12', 1780236940, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303233363934303b),
('dk8hslp6lft7pgq0djummmjuv77k089q', '74.125.212.138', 1780226970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303232363937303b),
('e4tt2ehnopeo8c4q95cdicpgu2mfjo3n', '103.15.42.198', 1779866566, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836363536363b72656469726563745f75726c7c733a36383a2268747470733a2f2f7363686f6f6c312e637265617469766564657369676e2e636f6d2e62642f73747564656e742f64697361626c655f61757468656e7469636174696f6e223b),
('e7344iva0gtjf5cbai18lh7fgdku33np', '205.210.31.23', 1780100416, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303130303431363b),
('edqkpt4aq9rcbq7ks21fe8hl01umn2mi', '2602:80d:1007::5a', 1780263720, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303236333732303b),
('efhqs0afov1tukb1fbe6hojhb9na9jv2', '198.235.24.67', 1780241718, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303234313731383b),
('epokn84pce8501c01svmevidbpsic512', '74.7.230.7', 1780264197, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303236343139373b),
('f03qpnk83flg1i0pjf0pfs4rtv9gq8c5', '103.106.238.208', 1779867621, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836373632313b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b),
('f8htc2voae2hp6c1382o8i2n3euddvlr', '103.204.210.59', 1780070372, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303037303336393b),
('fdc9eda73578uquo8ukg48sa54m9k3u7', '74.7.230.7', 1780155507, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303135353530373b),
('ffsd41mf1mv8nhfpkpp2preqocmma0sa', '5.182.207.245', 1780214510, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303231343530383b),
('fp63mgu1eii28luqhqebeu89mkdsi4rs', '40.77.167.2', 1779995463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393939353436333b),
('fpi1jtid2okpd2gsop3sc5c9qslcr9la', '66.249.89.13', 1780211214, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303231313231343b),
('ft3a317blgql72mn1sqn2bn8ut25eg7h', '66.249.64.10', 1780050644, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303035303634343b),
('g3jfj5bar8h5b6k27iksvojn9sk9mr11', '198.235.24.215', 1779928769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393932383736393b),
('gblfufm0dubg0t06j7ge1ejb1kit43uo', '103.96.105.99', 1780030546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303033303332333b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b),
('gh5p6koov0pl9k5uvtsmgsu7aj3ge9g4', '103.166.24.200', 1780231603, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303233313630303b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b),
('gll7icsg2r54fn4duin9es87prd5llf5', '103.205.36.58', 1780245512, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303234353531303b),
('gm4q83nn1bqg8d8iatjlamdoau1h7r9p', '205.210.31.5', 1780135520, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303133353532303b),
('gncdvpek40tnuvtbhc8nr8fosl7u2m26', '103.135.253.245', 1779988654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393938383634333b),
('grtnpk708jk7rr4idduq61t0pima8lou', '52.167.144.161', 1780240410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303234303431303b),
('gtpb4861q95l3o68ss133ccos5t5gr06', '103.106.238.208', 1779874096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393837343039363b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b),
('gu74oqlk9aeq5ngkptmf5n2l3sq52hhi', '103.106.238.209', 1779868997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836383939373b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b),
('h3bsh74a6gofbvbmngljpk469td09cf6', '205.210.31.91', 1780214408, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303231343430383b),
('ha244s22nj411ifkqsna7dk5l2bpgord', '74.7.230.7', 1779902065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393930323036353b),
('hbf3etfiupoe0or87mvkddpp2fuij6gp', '103.106.238.208', 1779869572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836393536323b),
('he7e5lome793cfq1dccc4idgdaiias09', '217.113.194.222', 1779930952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393933303935313b),
('hf13jiodrqae29rp6mmviuavdnjloq86', '104.210.140.137', 1780025881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303032353838313b),
('hhajdib4n606piknp0dt3um011e4hvh5', '103.106.238.208', 1779869020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836393032303b),
('hkb4pon2lvi24s7b7c7skifq7tpbubbr', '98.88.179.50', 1779903200, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393930333230303b),
('hqa7843m0o2ckvrpkl6rqojtb72rlfn4', '104.210.140.137', 1779878325, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393837383332353b),
('icarc298vhbtjrpi69c8oprdqv7rdj5m', '40.77.167.151', 1779996841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393939363834313b),
('iltd62pp5oca98126s9h67cadt9nv7ll', '104.210.140.143', 1780247132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303234373133323b),
('impn673lru388lcbm03f7bci74u3vmqp', '66.249.64.13', 1779995954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393939353935343b),
('j1lv9ebegdr7du7k8abu0adb9hjgdorv', '217.113.194.92', 1780305792, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303330353739323b),
('jau72j16t0sics6cp34vctehumej45hh', '74.7.230.7', 1780199313, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303139393331333b),
('jkf8863ij1fjeitsopcnu7sj0fsf1070', '2602:80d:1007::21', 1780230203, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303233303230333b),
('jlfdggt1c8m21pg6um8h2a7qujjipshi', '66.249.89.12', 1780296266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303239363236363b),
('jljcs4cqglcr6ab2tk2kc35124jqunv3', '66.249.89.12', 1779956146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393935363134363b),
('jmd73vml7bsek42md15t4510if0u0fti', '2a03:2880:24ff:9::', 1780010881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303031303838313b),
('jrfb055868r2vc21n5jg5dkg6a4andr1', '217.113.194.101', 1780304106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303330343130363b),
('k3u49bntrk03tr5qdrs3d9saoavabgob', '103.253.244.147', 1780224586, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303232343538363b),
('k5p8obv3ae01ldjsr62m8v8v5h76vh8b', '74.7.230.7', 1779991999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393939313939393b),
('k8cjuhb77q4rokb9qkn0jc6ahptohbqf', '103.15.42.71', 1779866127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836363132373b72656469726563745f75726c7c733a35353a2268747470733a2f2f7363686f6f6c312e637265617469766564657369676e2e636f6d2e62642f696e76656e746f72792f70726f64756374223b),
('k9hdgl3udh4v85idu2m7sct6gb50dh11', '74.7.230.7', 1780065622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303036353632323b),
('kfitqd05tjhndd9ecv79qo0h1lui6oim', '52.167.144.67', 1779911503, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393931313530323b),
('kghf802qnh0a881rhfdnt7t84nmvmcnm', '205.210.31.209', 1780188386, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303138383338363b),
('kl2vsjdm54qjn037jsgicpils75ddjab', '207.46.13.125', 1780003989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303030333938393b),
('l1m0bn1ur5ml68egf626p4irafib9210', '2a03:2880:f806:5::', 1780010955, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303031303935353b),
('l6c4sdg874479643vqp9mfgdh8guc1ac', '66.249.89.12', 1779871348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393837313334383b),
('ldgtkdpdm8kjiifsjvjvjajlq1pf0htn', '65.21.124.77', 1780063101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303036333130303b),
('lkuuc5e2ftsd5l989pgdfcodce61b15e', '40.77.167.18', 1779911514, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393931313531343b),
('llo0hg458lbjfcgd86pjrk2h2pgj3t8i', '157.55.39.197', 1779999665, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393939393636353b),
('lmc5ng9ujnplu4minguraepml5a89aik', '103.106.238.208', 1779866050, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836363035303b72656469726563745f75726c7c733a34373a2268747470733a2f2f7363686f6f6c312e637265617469766564657369676e2e636f6d2e62642f64617368626f617264223b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b),
('luu5db5bhpj34j8rjipbbn9cf0f1qp12', '150.228.135.133', 1780226966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303232363935343b),
('lvqf7n1u2dfqop14chsjoco0hbna99p4', '103.96.105.96', 1780030030, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303032393938373b),
('m12rp3f1u15s7kvfm5bp391t63aofc8p', '217.113.194.95', 1779931439, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393933313433393b),
('m19rrhp6i4tqchei0mppqp5oh65rdv8c', '2a03:2880:f806:52::', 1780298009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303239383030393b),
('m84os3vc1vl8j692s6kbj0vspnkkb7cd', '103.205.36.56', 1780040923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303034303932303b),
('mh12fkkp7g0jcjpl3mfte5v89gu6bjed', '2a03:2880:11ff:4::', 1780297977, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303239373937373b),
('mhdrekoosikjphn9bfn16952b0ptnqrq', '103.106.238.208', 1779874413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393837343431333b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b),
('mjsj2gfnbf3g5375k0me00oes84sguir', '217.113.194.95', 1780305421, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303330353432313b),
('mlo5tshvok8vfkgk5jnj650uv9reohip', '138.197.35.161', 1779974245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393937343234353b),
('mrm0g3phd57tc16tnnpth0m6lfiu6uuu', '209.97.165.16', 1779975653, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393937353635333b),
('n5amqektfvbn5pbhvej5gcfcb2o2p61c', '2a03:2880:11ff:40::', 1779908094, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393930383039343b),
('njqc9mov2evamnn0busun39tnmbc438m', '103.160.213.174', 1779987251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393938373235313b),
('o4lnauu6ok209kjfk1tult4f4pc2j3ob', '103.106.238.208', 1779867361, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836373336313b72656469726563745f75726c7c733a34373a2268747470733a2f2f7363686f6f6c312e637265617469766564657369676e2e636f6d2e62642f64617368626f617264223b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b),
('o53lpmhui8gerlerivgd4iv1k8j82fv5', '74.7.244.9', 1780207454, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303230373435343b),
('oeslvah8q1spm6h0vhualnrkb4qtp62m', '66.102.6.72', 1779865853, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836353835333b),
('oq8sbouvr02bumg2a6ds4lfls972okbl', '205.210.31.66', 1780186778, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303138363737383b),
('p74423lu0p4iq46aisalgpurb86qu9kn', '40.77.167.159', 1779915800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393931353830303b),
('pdi1ve2ai16r72bdtn8c2o8jjlce4uc8', '119.249.100.242', 1780098442, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303039383434323b),
('pegij7hisdot4rf4fec59r2jqongmhqv', '203.175.125.185', 1780110510, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303131303531303b),
('plpui9utslr2nkrdaue44kt6u3rht92g', '205.210.31.183', 1779929044, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393932393034343b),
('q4vtjnib6k0vf1s09gf06imug3j49k8b', '107.172.195.194', 1780143649, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303134333634393b),
('qif8gj4jrf96lgeib0btnc0edlibdlcm', '192.241.152.31', 1779974218, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393937343231383b),
('qnn8212e3fbqbsq8nj2ve1l493ba7789', '66.249.64.12', 1780300870, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303330303837303b),
('r1dv6as59q89gnml75bhdqf1q3b8crg0', '2a03:2880:7ff:59::', 1779908095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393930383039343b),
('r2qd8etud3ekm9h42tkjo31mksfdpil3', '66.249.64.12', 1780236939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303233363933393b),
('r5pkvdmfhff4uqngid1jlqds6akt0e6d', '59.153.17.131', 1779866687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836363638313b),
('r9dap53a7flu7j2a4qo5bbo277a31tlo', '5.182.207.245', 1780214508, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303231343530373b),
('rhc0s388s4g8r1hq16u9nui6ru7iil9d', '104.210.140.137', 1779953261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393935333236313b),
('rirftmnj0mqqvulmq4bqjtrevd0c5j3f', '103.7.121.33', 1780076982, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303037363938303b),
('rnv1gnoe4602dr2lldt4092m9epkp73n', '198.235.24.118', 1780102088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303130323038373b),
('s33f8jv54o3bv4q684hff7pmp57asi2q', '198.235.24.141', 1780049125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303034393132343b),
('s88pm1add3a9mjlp85leijde645tbiq3', '66.249.89.12', 1780126529, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303132363532393b),
('sdh475q2h97tn70q4hue08jp3glref3n', '205.210.31.198', 1780066755, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303036363735353b),
('si1h7mc3nnp81tbm9uthmqf5dvuq90ml', '147.185.132.147', 1779928533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393932383533333b),
('spdeabbvk9l2e7l8sfh2b8idmm5idopq', '103.106.238.208', 1779874413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393837343431333b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b),
('ssh96de4ou9k86t07is0kq4ci19hsfmm', '220.181.51.113', 1780232095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303233323039353b),
('t03jofboq7hvmoiagqu8nq2c3h7qnkmt', '209.97.165.16', 1779975650, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393937353635303b),
('tji8q6cggopp9607bp8gagp5iqq4n94p', '103.106.238.208', 1779869687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836393638373b6e616d657c733a31353a2243726561746976652044657369676e223b6c6f676765725f70686f746f7c733a33363a2237323963356539616638373635393238333133306537613938383232396462332e6a7067223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2236223b6c6f67676564696e7c623a313b),
('ttb4r8d1qmqiau3cg8mjqf0nblp3n5ug', '205.210.31.255', 1780101793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303130313739333b),
('tu019kq9kcrrvrlm2ntl8ganel533d6d', '103.234.167.4', 1779866490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737393836363439303b72656469726563745f75726c7c733a36333a2268747470733a2f2f7363686f6f6c312e637265617469766564657369676e2e636f6d2e62642f66726f6e74656e642f67616c6c6572792f63617465676f7279223b),
('u48qn1hfskuqvk0oaqsiuv06ki3rf83q', '74.7.230.7', 1780019111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303031393131313b),
('u7fat7bts5kolp9mvkhbm73ev05qkbpt', '34.206.50.36', 1780037727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303033373732373b),
('upq55mpor9h0h06ao0j9cugmoqhf0kqe', '205.210.31.144', 1780210319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303231303331393b),
('v44m57cvup2bpqdr3q75oofjcehpdsdq', '2600:1f16:743:ac00:4a57:618e:c4ff:41e5', 1780171398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303137313339383b),
('vjti157upgdmiuuruefberlha9osvnig', '2a03:2880:24ff:4f::', 1780010881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303031303838313b),
('vnstj0m63hjpv7lkt19d3jbinugcg34b', '104.210.140.138', 1780175745, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738303137353734353b);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `is_system` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `prefix`, `is_system`) VALUES
(1, 'Super Admin', 'superadmin', '1'),
(2, 'Admin', 'admin', '1'),
(3, 'Teacher', 'teacher', '1'),
(4, 'Accountant', 'accountant', '1'),
(5, 'Librarian', 'librarian', '1'),
(6, 'Parent', 'parent', '1'),
(7, 'Student', 'student', '1'),
(8, 'Receptionist', 'receptionist', '1');

-- --------------------------------------------------------

--
-- Table structure for table `salary_template`
--

CREATE TABLE `salary_template` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `basic_salary` decimal(18,2) NOT NULL,
  `overtime_salary` varchar(100) NOT NULL DEFAULT '0',
  `branch_id` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `salary_template`
--

INSERT INTO `salary_template` (`id`, `name`, `basic_salary`, `overtime_salary`, `branch_id`) VALUES
(1, '1', 5000.00, '0', 1),
(2, '2', 7000.00, '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `salary_template_details`
--

CREATE TABLE `salary_template_details` (
  `id` int(11) NOT NULL,
  `salary_template_id` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `type` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `salary_template_details`
--

INSERT INTO `salary_template_details` (`id`, `salary_template_id`, `name`, `amount`, `type`) VALUES
(1, '2', 'Others Allowance', 3000.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_bill`
--

CREATE TABLE `sales_bill` (
  `id` int(11) NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `paid` decimal(18,2) NOT NULL DEFAULT 0.00,
  `due` decimal(18,2) NOT NULL DEFAULT 0.00,
  `payment_status` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `prepared_by` int(11) DEFAULT NULL,
  `modifier_id` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sales_bill`
--

INSERT INTO `sales_bill` (`id`, `bill_no`, `role_id`, `user_id`, `remarks`, `total`, `discount`, `paid`, `due`, `payment_status`, `date`, `prepared_by`, `modifier_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, '0001', 3, 4, '', 150.00, 0.00, 0.00, 150.00, 1, '2026-04-14', 1, 1, 1, '2026-04-14 01:00:35', NULL),
(2, '0002', 3, 3, '', 150.00, 0.00, 150.00, 0.00, 3, '2026-04-14', 1, 1, 1, '2026-04-14 01:01:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_bill_details`
--

CREATE TABLE `sales_bill_details` (
  `id` int(11) NOT NULL,
  `sales_bill_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` decimal(18,2) NOT NULL DEFAULT 0.00,
  `quantity` varchar(20) NOT NULL,
  `discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `sub_total` decimal(18,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sales_bill_details`
--

INSERT INTO `sales_bill_details` (`id`, `sales_bill_id`, `product_id`, `unit_price`, `quantity`, `discount`, `sub_total`) VALUES
(1, 1, 1, 150.00, '1', 0.00, 150.00),
(2, 2, 1, 150.00, '1', 0.00, 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `sales_payment_history`
--

CREATE TABLE `sales_payment_history` (
  `id` int(11) NOT NULL,
  `sales_bill_id` varchar(11) NOT NULL,
  `payment_by` int(11) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `pay_via` varchar(25) NOT NULL,
  `remarks` text NOT NULL,
  `attach_orig_name` varchar(255) DEFAULT NULL,
  `attach_file_name` varchar(255) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `coll_type` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sales_payment_history`
--

INSERT INTO `sales_payment_history` (`id`, `sales_bill_id`, `payment_by`, `amount`, `pay_via`, `remarks`, `attach_orig_name`, `attach_file_name`, `paid_on`, `coll_type`) VALUES
(1, '2', 1, 150.00, '1', '', '', '', '2026-04-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `schoolyear`
--

CREATE TABLE `schoolyear` (
  `id` int(11) NOT NULL,
  `school_year` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `schoolyear`
--

INSERT INTO `schoolyear` (`id`, `school_year`, `created_by`, `created_at`, `updated_at`) VALUES
(5, '2024-2025', 1, '2020-02-25 19:35:41', '2023-08-18 01:35:41'),
(6, '2025-2026', 1, '2020-02-25 19:35:41', '2023-08-18 01:35:41'),
(7, '2026-2027', 1, '2020-02-25 19:35:41', '2023-08-18 01:20:04'),
(9, '2027-2028', 1, '2020-02-26 07:00:10', '2023-08-18 13:00:24');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `capacity` varchar(20) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `name`, `capacity`, `branch_id`) VALUES
(2, 'Science', '30', 1),
(3, 'Humanities', '30', 1),
(4, 'Business Studies', '30', 1),
(5, 'N/A', '50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections_allocation`
--

CREATE TABLE `sections_allocation` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sections_allocation`
--

INSERT INTO `sections_allocation` (`id`, `class_id`, `section_id`) VALUES
(14, 12, 2),
(15, 12, 3),
(16, 12, 4),
(17, 13, 2),
(18, 13, 3),
(19, 13, 4),
(21, 2, 5),
(22, 3, 5),
(23, 4, 5),
(24, 5, 5),
(25, 6, 5),
(26, 7, 5),
(27, 8, 5),
(28, 9, 5),
(29, 10, 5),
(30, 11, 5);

-- --------------------------------------------------------

--
-- Table structure for table `sms_api`
--

CREATE TABLE `sms_api` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sms_api`
--

INSERT INTO `sms_api` (`id`, `name`) VALUES
(1, 'twilio'),
(2, 'clickatell'),
(3, 'msg91'),
(4, 'bulksms'),
(5, 'textlocal'),
(6, 'smscountry'),
(7, 'bulksmsbd'),
(8, 'customsms');

-- --------------------------------------------------------

--
-- Table structure for table `sms_credential`
--

CREATE TABLE `sms_credential` (
  `id` int(11) NOT NULL,
  `sms_api_id` int(11) NOT NULL,
  `field_one` varchar(300) NOT NULL,
  `field_two` varchar(300) NOT NULL,
  `field_three` varchar(300) NOT NULL,
  `field_four` varchar(300) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_template`
--

CREATE TABLE `sms_template` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tags` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sms_template`
--

INSERT INTO `sms_template` (`id`, `name`, `tags`) VALUES
(1, 'admission', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}'),
(2, 'fee_collection', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {paid_amount}, {paid_date} '),
(3, 'attendance', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}'),
(4, 'exam_attendance', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {exam_name}, {term_name}, {subject}'),
(5, 'exam_results', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {exam_name}, {term_name}, {subject}, {marks}'),
(6, 'homework', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {subject}, {date_of_homework}, {date_of_submission}'),
(7, 'live_class', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {date_of_live_class}, {start_time}, {end_time}, {host_by}'),
(8, 'online_exam_publish', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {exam_title}, {start_time}, {end_time}, {time_duration}, {attempt}, {passing_mark}, {exam_fee}'),
(9, 'student_birthday_wishes', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {birthday}'),
(10, 'staff_birthday_wishes', '{name}, {birthday}, {joining_date}'),
(11, 'alumni_event', '{student_name}, {event_title}, {start_date}, {end_date}');

-- --------------------------------------------------------

--
-- Table structure for table `sms_template_details`
--

CREATE TABLE `sms_template_details` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `dlt_template_id` varchar(255) DEFAULT NULL,
  `notify_student` tinyint(3) NOT NULL DEFAULT 1,
  `notify_parent` tinyint(3) NOT NULL DEFAULT 1,
  `template_body` longtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `staff_id` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` int(11) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `experience_details` varchar(255) DEFAULT NULL,
  `total_experience` varchar(255) DEFAULT NULL,
  `designation` int(11) NOT NULL,
  `joining_date` varchar(100) NOT NULL,
  `birthday` varchar(100) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `religion` varchar(100) NOT NULL,
  `blood_group` varchar(20) NOT NULL,
  `present_address` text NOT NULL,
  `permanent_address` text NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `salary_template_id` int(11) DEFAULT 0,
  `branch_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `staff_id`, `name`, `department`, `qualification`, `experience_details`, `total_experience`, `designation`, `joining_date`, `birthday`, `sex`, `religion`, `blood_group`, `present_address`, `permanent_address`, `mobileno`, `email`, `salary_template_id`, `branch_id`, `photo`, `facebook_url`, `linkedin_url`, `twitter_url`, `created_at`, `updated_at`) VALUES
(1, '52b0a68', 'Creative Design', 0, '', NULL, NULL, 0, '2024-12-27', '1997-09-10', 'male', 'Islam', 'O+', 'হাউজঃ মুন্সি বাড়ি, নয়ার হাট স্কুল সংলগ্ন, বড়বাড়ি, লালমনির হাট।', 'হাউজঃ মুন্সি বাড়ি, নয়ার হাট স্কুল সংলগ্ন, বড়বাড়ি, লালমনির হাট।', '+8801849832178', 'info@creativedesign.com.bd', 0, NULL, '729c5e9af87659283130e7a988229db3.jpg', 'https://www.facebook.com/official.creativedesign', 'https://www.facebook.com/official.creativedesign', 'https://www.facebook.com/official.creativedesign', '2024-12-27 07:31:06', NULL),
(3, 'a06df8b', 'Md Abdul Rashid', 2, 'BBA', '', '', 1, '2024-12-01', '', 'male', '', '', 'Beraiderchala, Gilaberaid\r\nSreepur, Gazipur.', 'Beraiderchala, Gilaberaid\r\nSreepur, Gazipur.', '01990561324', 'info@elitedesign.com.bd', 1, 1, '8a41b4a85a62cbc0f84818500d8502b4.png', '', '', '', '2024-12-27 11:22:00', NULL),
(4, 'fc552ae', 'Md Abul Kalam', 2, 'bbb', 'bbbb', 'bbb', 2, '2024-12-31', '2024-06-11', 'male', 'Islam', 'O+', 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', '01775457008', 'kallam23@gmail.com', 0, 1, '1f292aa4baf4f5e5f69af0709aa03997.png', 'https://www.facebook.com/umart', 'sssss', 'https://www.twitter.com/umart', '2024-12-31 08:05:58', NULL),
(5, 'd4d53f7', 'Tushar Bormon', 2, 'BSC', '1 years Eprience', '1', 5, '2025-01-01', '2024-06-11', 'male', 'Hindu', 'O+', 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', '01954578083', 'bormon@gmail.com', 0, 1, '254f5187dd91e8f6c08d5ed331c8dac9.jpg', 'https://www.facebook.com/umart', 'https://www.twitter.com/umart', 'https://www.twitter.com/umart', '2025-01-01 19:10:50', NULL),
(6, '2caf400', 'Rasheda Khatun', 2, 'Bsc', '1 years', '1', 6, '2025-01-01', '2024-06-11', 'female', 'Islam', 'O+', 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', '01775457007', 'rasheda@elitedesign.com.bd', 0, 1, '0a97380737af24821f285683902d2477.jpeg', 'https://www.facebook.com/umart', 'https://www.twitter.com/umart', 'https://www.twitter.com/umart', '2025-01-01 19:13:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `status` varchar(11) DEFAULT NULL COMMENT 'P=Present, A=Absent, H=Holiday, L=Late',
  `remark` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_bank_account`
--

CREATE TABLE `staff_bank_account` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `holder_name` varchar(255) NOT NULL,
  `bank_branch` varchar(255) NOT NULL,
  `bank_address` varchar(255) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_department`
--

CREATE TABLE `staff_department` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `staff_department`
--

INSERT INTO `staff_department` (`id`, `name`, `branch_id`, `created_at`, `updated_at`) VALUES
(2, 'Administrator', 1, '2024-12-27 08:16:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `staff_designation`
--

INSERT INTO `staff_designation` (`id`, `name`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Asst. Teacher (Bangla)', 1, '2024-12-27 08:08:00', NULL),
(2, 'Head Teacher', 1, '2024-12-27 08:16:06', NULL),
(3, 'Peon', 1, '2024-12-27 11:04:38', NULL),
(4, 'Asst. Head Teacher', 1, '2024-12-27 11:05:04', NULL),
(5, 'ICT Teacher', 1, '2024-12-27 11:05:13', NULL),
(6, 'Asst. Teacher (English)', 1, '2024-12-27 11:05:40', NULL),
(7, 'Asst. Teacher (Math)', 1, '2024-12-27 11:05:46', NULL),
(8, 'Asst. Teacher', 1, '2024-12-27 11:05:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_documents`
--

CREATE TABLE `staff_documents` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` varchar(20) NOT NULL,
  `remarks` text NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `enc_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_privileges`
--

CREATE TABLE `staff_privileges` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `is_add` tinyint(1) NOT NULL,
  `is_edit` tinyint(1) NOT NULL,
  `is_view` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `staff_privileges`
--

INSERT INTO `staff_privileges` (`id`, `role_id`, `permission_id`, `is_add`, `is_edit`, `is_view`, `is_delete`) VALUES
(1, 3, 1, 1, 1, 1, 1),
(2, 3, 2, 0, 0, 0, 0),
(3, 3, 3, 1, 1, 1, 1),
(4, 3, 4, 0, 0, 0, 0),
(5, 3, 5, 0, 0, 0, 0),
(6, 3, 30, 0, 0, 0, 0),
(7, 3, 7, 0, 0, 0, 0),
(8, 3, 8, 0, 0, 0, 0),
(9, 3, 6, 0, 0, 1, 0),
(10, 3, 9, 0, 0, 0, 0),
(11, 3, 10, 0, 0, 0, 0),
(12, 3, 11, 0, 0, 0, 0),
(13, 3, 12, 0, 0, 0, 0),
(14, 3, 13, 0, 0, 0, 0),
(15, 3, 14, 0, 0, 1, 0),
(16, 3, 15, 0, 0, 1, 0),
(17, 3, 16, 0, 0, 0, 0),
(18, 3, 17, 0, 0, 0, 0),
(20, 3, 19, 0, 0, 0, 0),
(21, 3, 20, 1, 1, 1, 1),
(22, 3, 21, 0, 0, 0, 0),
(23, 3, 22, 0, 0, 1, 0),
(24, 3, 23, 0, 0, 1, 0),
(25, 3, 24, 0, 0, 1, 0),
(26, 3, 25, 0, 0, 1, 0),
(27, 3, 26, 0, 0, 1, 0),
(28, 3, 27, 0, 0, 1, 0),
(29, 3, 28, 0, 0, 1, 0),
(30, 3, 29, 0, 0, 1, 0),
(31, 3, 32, 1, 1, 1, 1),
(32, 3, 31, 1, 1, 1, 1),
(33, 3, 33, 1, 1, 1, 1),
(34, 3, 34, 1, 1, 1, 1),
(35, 3, 35, 1, 1, 1, 1),
(36, 3, 36, 1, 1, 1, 1),
(37, 3, 37, 0, 0, 0, 0),
(38, 3, 38, 1, 1, 1, 1),
(39, 3, 39, 1, 1, 1, 1),
(40, 3, 77, 1, 1, 1, 1),
(41, 3, 78, 0, 0, 1, 0),
(42, 3, 79, 0, 0, 0, 0),
(43, 3, 40, 0, 0, 0, 0),
(44, 3, 41, 0, 0, 0, 0),
(45, 3, 42, 0, 0, 0, 0),
(46, 3, 43, 0, 0, 0, 0),
(47, 3, 44, 0, 0, 0, 0),
(48, 3, 45, 0, 0, 0, 0),
(49, 3, 46, 0, 0, 0, 0),
(50, 3, 47, 0, 0, 0, 0),
(51, 3, 48, 0, 0, 0, 0),
(52, 3, 49, 1, 0, 0, 0),
(53, 3, 50, 0, 0, 0, 0),
(54, 3, 51, 0, 0, 0, 0),
(55, 3, 52, 0, 0, 0, 0),
(56, 3, 53, 0, 0, 0, 0),
(57, 3, 54, 0, 0, 0, 0),
(58, 3, 55, 0, 0, 1, 0),
(59, 3, 56, 0, 0, 0, 0),
(60, 3, 57, 0, 0, 0, 0),
(61, 3, 58, 1, 0, 1, 1),
(62, 3, 59, 0, 0, 1, 0),
(63, 3, 60, 0, 0, 0, 0),
(64, 3, 61, 0, 0, 0, 0),
(65, 3, 62, 0, 0, 0, 0),
(66, 3, 80, 0, 0, 0, 0),
(67, 3, 69, 0, 0, 0, 0),
(68, 3, 70, 0, 0, 0, 0),
(69, 3, 71, 0, 0, 0, 0),
(70, 3, 72, 0, 0, 0, 0),
(71, 3, 73, 0, 0, 0, 0),
(72, 3, 74, 0, 0, 0, 0),
(73, 3, 75, 0, 0, 0, 0),
(74, 3, 76, 0, 0, 0, 0),
(75, 3, 63, 0, 0, 0, 0),
(76, 3, 64, 0, 0, 0, 0),
(77, 3, 65, 0, 0, 0, 0),
(78, 3, 66, 0, 0, 0, 0),
(79, 3, 67, 0, 0, 0, 0),
(80, 3, 68, 0, 0, 0, 0),
(81, 3, 81, 0, 0, 0, 0),
(82, 3, 82, 0, 0, 0, 0),
(83, 3, 83, 0, 0, 0, 0),
(84, 3, 84, 0, 0, 0, 0),
(85, 3, 85, 0, 0, 0, 0),
(86, 3, 86, 0, 0, 0, 0),
(87, 3, 87, 0, 0, 0, 0),
(88, 2, 1, 1, 1, 1, 1),
(89, 2, 2, 1, 0, 0, 0),
(90, 2, 3, 1, 1, 1, 1),
(91, 2, 4, 0, 0, 1, 0),
(92, 2, 5, 1, 0, 1, 0),
(93, 2, 30, 1, 0, 1, 0),
(94, 2, 7, 1, 1, 1, 1),
(95, 2, 8, 1, 0, 1, 0),
(96, 2, 6, 1, 1, 1, 1),
(97, 2, 9, 1, 1, 1, 1),
(98, 2, 10, 1, 1, 1, 1),
(99, 2, 11, 1, 0, 1, 0),
(100, 2, 12, 1, 1, 1, 1),
(101, 2, 13, 1, 0, 1, 0),
(102, 2, 14, 1, 0, 1, 0),
(103, 2, 15, 0, 0, 1, 0),
(104, 2, 16, 1, 1, 1, 1),
(105, 2, 17, 1, 1, 1, 1),
(107, 2, 19, 1, 1, 1, 1),
(108, 2, 20, 1, 1, 1, 1),
(109, 2, 21, 1, 1, 1, 1),
(110, 2, 22, 1, 1, 1, 1),
(111, 2, 23, 1, 1, 1, 1),
(112, 2, 24, 1, 1, 1, 1),
(113, 2, 25, 1, 1, 1, 1),
(114, 2, 26, 1, 1, 1, 1),
(115, 2, 27, 1, 1, 1, 1),
(116, 2, 28, 1, 0, 1, 1),
(117, 2, 29, 1, 1, 1, 1),
(118, 2, 32, 1, 1, 1, 1),
(119, 2, 31, 1, 1, 1, 1),
(120, 2, 33, 1, 1, 1, 1),
(121, 2, 34, 1, 1, 1, 1),
(122, 2, 35, 1, 1, 1, 1),
(123, 2, 36, 1, 1, 1, 1),
(124, 2, 37, 1, 0, 1, 1),
(125, 2, 38, 1, 1, 1, 1),
(126, 2, 39, 1, 1, 1, 1),
(127, 2, 77, 1, 1, 1, 1),
(128, 2, 78, 0, 0, 1, 0),
(129, 2, 79, 0, 0, 1, 0),
(130, 2, 40, 1, 1, 1, 1),
(131, 2, 41, 1, 1, 1, 1),
(132, 2, 42, 1, 1, 1, 1),
(133, 2, 43, 0, 0, 1, 1),
(134, 2, 44, 1, 1, 1, 1),
(135, 2, 45, 1, 1, 1, 1),
(136, 2, 46, 1, 1, 1, 1),
(137, 2, 47, 1, 1, 1, 1),
(138, 2, 48, 0, 0, 1, 1),
(139, 2, 49, 1, 0, 0, 0),
(140, 2, 50, 1, 0, 0, 0),
(141, 2, 51, 1, 0, 0, 0),
(142, 2, 52, 0, 0, 1, 0),
(143, 2, 53, 0, 0, 1, 0),
(144, 2, 54, 0, 0, 1, 0),
(145, 2, 55, 1, 1, 1, 1),
(146, 2, 56, 1, 1, 1, 1),
(147, 2, 57, 1, 0, 1, 1),
(148, 2, 58, 1, 0, 1, 1),
(149, 2, 59, 1, 1, 1, 1),
(150, 2, 60, 1, 1, 1, 1),
(151, 2, 61, 1, 0, 1, 1),
(152, 2, 62, 1, 1, 1, 1),
(153, 2, 80, 0, 0, 1, 0),
(154, 2, 69, 1, 1, 1, 1),
(155, 2, 70, 1, 1, 1, 1),
(156, 2, 71, 1, 1, 1, 1),
(157, 2, 72, 1, 1, 1, 1),
(158, 2, 73, 1, 0, 0, 0),
(159, 2, 74, 1, 1, 1, 1),
(160, 2, 75, 0, 0, 1, 0),
(161, 2, 76, 0, 0, 1, 1),
(162, 2, 63, 1, 1, 1, 1),
(163, 2, 64, 1, 1, 1, 1),
(164, 2, 65, 1, 1, 1, 1),
(165, 2, 66, 0, 0, 1, 0),
(166, 2, 67, 1, 1, 1, 1),
(167, 2, 68, 1, 1, 1, 1),
(168, 2, 81, 0, 0, 0, 0),
(169, 2, 82, 1, 0, 1, 0),
(170, 2, 83, 1, 1, 1, 1),
(171, 2, 84, 1, 1, 1, 1),
(172, 2, 85, 1, 1, 1, 1),
(173, 2, 86, 0, 0, 0, 0),
(174, 2, 87, 0, 0, 0, 0),
(175, 7, 1, 0, 0, 0, 0),
(176, 7, 2, 0, 0, 0, 0),
(177, 7, 3, 0, 0, 0, 0),
(178, 7, 4, 0, 0, 0, 0),
(179, 7, 5, 0, 0, 0, 0),
(180, 7, 30, 0, 0, 0, 0),
(181, 7, 7, 0, 0, 0, 0),
(182, 7, 8, 0, 0, 0, 0),
(183, 7, 6, 0, 0, 0, 0),
(184, 7, 9, 0, 0, 0, 0),
(185, 7, 10, 0, 0, 0, 0),
(186, 7, 11, 0, 0, 0, 0),
(187, 7, 12, 0, 0, 0, 0),
(188, 7, 13, 0, 0, 0, 0),
(189, 7, 14, 0, 0, 0, 0),
(190, 7, 15, 0, 0, 0, 0),
(191, 7, 16, 0, 0, 0, 0),
(192, 7, 17, 0, 0, 0, 0),
(194, 7, 19, 0, 0, 0, 0),
(195, 7, 20, 0, 0, 0, 0),
(196, 7, 21, 0, 0, 0, 0),
(197, 7, 22, 0, 0, 0, 0),
(198, 7, 23, 0, 0, 0, 0),
(199, 7, 24, 0, 0, 0, 0),
(200, 7, 25, 0, 0, 0, 0),
(201, 7, 26, 0, 0, 1, 0),
(202, 7, 27, 0, 0, 0, 0),
(203, 7, 28, 0, 0, 0, 0),
(204, 7, 29, 0, 0, 1, 0),
(205, 7, 32, 0, 0, 0, 0),
(206, 7, 31, 0, 0, 0, 0),
(207, 7, 33, 0, 0, 0, 0),
(208, 7, 34, 0, 0, 0, 0),
(209, 7, 35, 0, 0, 0, 0),
(210, 7, 36, 0, 0, 0, 0),
(211, 7, 37, 0, 0, 0, 0),
(212, 7, 38, 0, 0, 0, 0),
(213, 7, 39, 0, 0, 0, 0),
(214, 7, 77, 0, 0, 0, 0),
(215, 7, 78, 0, 0, 0, 0),
(216, 7, 79, 0, 0, 0, 0),
(217, 7, 40, 0, 0, 0, 0),
(218, 7, 41, 0, 0, 0, 0),
(219, 7, 42, 0, 0, 0, 0),
(220, 7, 43, 0, 0, 0, 0),
(221, 7, 44, 0, 0, 0, 0),
(222, 7, 45, 0, 0, 0, 0),
(223, 7, 46, 0, 0, 0, 0),
(224, 7, 47, 0, 0, 0, 0),
(225, 7, 48, 0, 0, 0, 0),
(226, 7, 49, 0, 0, 0, 0),
(227, 7, 50, 0, 0, 0, 0),
(228, 7, 51, 0, 0, 0, 0),
(229, 7, 52, 0, 0, 0, 0),
(230, 7, 53, 0, 0, 0, 0),
(231, 7, 54, 0, 0, 0, 0),
(232, 7, 55, 0, 0, 0, 0),
(233, 7, 56, 0, 0, 0, 0),
(234, 7, 57, 0, 0, 0, 0),
(235, 7, 58, 0, 0, 0, 0),
(236, 7, 59, 0, 0, 0, 0),
(237, 7, 60, 0, 0, 0, 0),
(238, 7, 61, 0, 0, 0, 0),
(239, 7, 62, 0, 0, 0, 0),
(240, 7, 80, 0, 0, 0, 0),
(241, 7, 69, 0, 0, 0, 0),
(242, 7, 70, 0, 0, 0, 0),
(243, 7, 71, 0, 0, 0, 0),
(244, 7, 72, 0, 0, 0, 0),
(245, 7, 73, 0, 0, 0, 0),
(246, 7, 74, 0, 0, 0, 0),
(247, 7, 75, 0, 0, 0, 0),
(248, 7, 76, 0, 0, 0, 0),
(249, 7, 63, 0, 0, 0, 0),
(250, 7, 64, 0, 0, 0, 0),
(251, 7, 65, 0, 0, 0, 0),
(252, 7, 66, 0, 0, 0, 0),
(253, 7, 67, 0, 0, 0, 0),
(254, 7, 68, 0, 0, 0, 0),
(255, 7, 81, 0, 0, 0, 0),
(256, 7, 82, 0, 0, 0, 0),
(257, 7, 83, 0, 0, 0, 0),
(258, 7, 84, 0, 0, 0, 0),
(259, 7, 85, 0, 0, 0, 0),
(260, 7, 86, 0, 0, 0, 0),
(261, 7, 87, 0, 0, 0, 0),
(262, 88, 88, 1, 1, 1, 1),
(263, 88, 88, 1, 1, 1, 1),
(264, 89, 89, 1, 1, 1, 1),
(265, 90, 90, 1, 1, 1, 1),
(266, 2, 88, 1, 0, 1, 0),
(267, 2, 89, 0, 0, 1, 0),
(268, 90, 90, 1, 1, 1, 1),
(269, 2, 90, 0, 1, 1, 0),
(270, 91, 91, 1, 1, 1, 1),
(271, 92, 92, 1, 1, 1, 1),
(272, 2, 91, 0, 0, 1, 0),
(273, 2, 92, 0, 0, 1, 0),
(274, 93, 93, 1, 1, 1, 1),
(275, 94, 94, 1, 1, 1, 1),
(276, 95, 95, 1, 1, 1, 1),
(277, 96, 96, 1, 1, 1, 1),
(278, 2, 93, 0, 0, 1, 0),
(279, 2, 94, 0, 0, 1, 0),
(280, 2, 95, 0, 0, 1, 0),
(281, 2, 96, 0, 0, 1, 0),
(282, 97, 97, 1, 1, 1, 1),
(283, 98, 98, 1, 1, 1, 1),
(284, 2, 97, 0, 0, 1, 0),
(285, 2, 98, 0, 0, 1, 0),
(286, 99, 99, 1, 1, 1, 1),
(287, 100, 100, 1, 1, 1, 1),
(288, 101, 101, 1, 1, 1, 1),
(289, 102, 102, 1, 1, 1, 1),
(290, 2, 99, 0, 0, 1, 0),
(291, 2, 100, 0, 0, 1, 0),
(292, 2, 101, 0, 0, 1, 0),
(293, 2, 102, 0, 0, 1, 0),
(294, 103, 103, 1, 1, 1, 1),
(295, 2, 103, 0, 1, 1, 0),
(296, 3, 91, 0, 0, 0, 0),
(297, 3, 92, 0, 0, 0, 0),
(298, 3, 93, 0, 0, 1, 0),
(299, 3, 94, 0, 0, 1, 0),
(300, 3, 95, 0, 0, 1, 0),
(301, 3, 96, 0, 0, 1, 0),
(302, 3, 97, 0, 0, 1, 0),
(303, 3, 98, 0, 0, 1, 0),
(304, 3, 99, 0, 0, 0, 0),
(305, 3, 100, 0, 0, 0, 0),
(306, 3, 101, 0, 0, 0, 0),
(307, 3, 102, 0, 0, 0, 0),
(308, 3, 88, 1, 0, 1, 0),
(309, 3, 89, 0, 0, 1, 0),
(310, 3, 90, 0, 0, 0, 0),
(311, 3, 103, 0, 0, 0, 0),
(312, 4, 91, 0, 0, 1, 0),
(313, 4, 92, 0, 0, 1, 0),
(314, 4, 93, 0, 0, 0, 0),
(315, 4, 94, 0, 0, 0, 0),
(316, 4, 95, 0, 0, 0, 0),
(317, 4, 96, 0, 0, 0, 0),
(318, 4, 97, 0, 0, 0, 0),
(319, 4, 98, 0, 0, 0, 0),
(320, 4, 99, 0, 0, 0, 0),
(321, 4, 100, 0, 0, 0, 0),
(322, 4, 101, 0, 0, 0, 0),
(323, 4, 102, 0, 0, 0, 0),
(324, 4, 1, 0, 0, 0, 0),
(325, 4, 2, 0, 0, 0, 0),
(326, 4, 3, 0, 0, 0, 0),
(327, 4, 4, 0, 0, 0, 0),
(328, 4, 5, 0, 0, 0, 0),
(329, 4, 30, 0, 0, 0, 0),
(330, 4, 7, 0, 0, 0, 0),
(331, 4, 8, 0, 0, 0, 0),
(332, 4, 6, 0, 0, 0, 0),
(333, 4, 9, 0, 0, 0, 0),
(334, 4, 10, 0, 0, 0, 0),
(335, 4, 11, 0, 0, 0, 0),
(336, 4, 12, 1, 1, 1, 1),
(337, 4, 13, 1, 0, 1, 0),
(338, 4, 14, 1, 0, 1, 0),
(339, 4, 15, 0, 0, 1, 0),
(340, 4, 16, 1, 1, 1, 1),
(341, 4, 17, 1, 1, 1, 1),
(343, 4, 19, 1, 1, 1, 1),
(344, 4, 20, 1, 1, 1, 1),
(345, 4, 21, 1, 1, 1, 1),
(346, 4, 22, 1, 1, 1, 1),
(347, 4, 23, 0, 0, 0, 0),
(348, 4, 24, 0, 0, 0, 0),
(349, 4, 25, 0, 0, 0, 0),
(350, 4, 26, 0, 0, 0, 0),
(351, 4, 27, 0, 0, 0, 0),
(352, 4, 28, 0, 0, 0, 0),
(353, 4, 29, 0, 0, 0, 0),
(354, 4, 32, 0, 0, 0, 0),
(355, 4, 88, 0, 0, 0, 0),
(356, 4, 89, 0, 0, 0, 0),
(357, 4, 31, 0, 0, 0, 0),
(358, 4, 33, 0, 0, 0, 0),
(359, 4, 34, 0, 0, 0, 0),
(360, 4, 35, 0, 0, 0, 0),
(361, 4, 36, 0, 0, 0, 0),
(362, 4, 37, 0, 0, 0, 0),
(363, 4, 38, 0, 0, 0, 0),
(364, 4, 39, 0, 0, 0, 0),
(365, 4, 77, 0, 0, 0, 0),
(366, 4, 78, 0, 0, 0, 0),
(367, 4, 79, 0, 0, 0, 0),
(368, 4, 40, 0, 0, 0, 0),
(369, 4, 41, 0, 0, 0, 0),
(370, 4, 42, 0, 0, 0, 0),
(371, 4, 43, 0, 0, 0, 0),
(372, 4, 44, 0, 0, 0, 0),
(373, 4, 45, 0, 0, 0, 0),
(374, 4, 46, 0, 0, 0, 0),
(375, 4, 47, 0, 0, 0, 0),
(376, 4, 48, 0, 0, 0, 0),
(377, 4, 49, 0, 0, 0, 0),
(378, 4, 50, 0, 0, 0, 0),
(379, 4, 51, 0, 0, 0, 0),
(380, 4, 52, 0, 0, 0, 0),
(381, 4, 53, 0, 0, 0, 0),
(382, 4, 54, 0, 0, 0, 0),
(383, 4, 55, 0, 0, 1, 0),
(384, 4, 56, 0, 0, 0, 0),
(385, 4, 57, 0, 0, 0, 0),
(386, 4, 58, 1, 0, 1, 0),
(387, 4, 59, 0, 0, 0, 0),
(388, 4, 60, 0, 0, 0, 0),
(389, 4, 61, 0, 0, 0, 0),
(390, 4, 62, 0, 0, 0, 0),
(391, 4, 80, 0, 0, 0, 0),
(392, 4, 69, 1, 1, 1, 1),
(393, 4, 70, 1, 1, 1, 1),
(394, 4, 71, 1, 1, 1, 1),
(395, 4, 72, 1, 1, 1, 1),
(396, 4, 73, 1, 0, 0, 0),
(397, 4, 74, 1, 1, 1, 1),
(398, 4, 75, 0, 0, 1, 0),
(399, 4, 76, 0, 0, 1, 0),
(400, 4, 63, 1, 1, 1, 1),
(401, 4, 64, 1, 1, 1, 1),
(402, 4, 65, 1, 1, 1, 1),
(403, 4, 66, 0, 0, 1, 0),
(404, 4, 67, 1, 1, 1, 1),
(405, 4, 68, 1, 1, 1, 1),
(406, 4, 81, 0, 0, 0, 0),
(407, 4, 82, 0, 0, 0, 0),
(408, 4, 83, 0, 0, 0, 0),
(409, 4, 84, 0, 0, 0, 0),
(410, 4, 85, 0, 0, 0, 0),
(411, 4, 86, 0, 0, 0, 0),
(412, 4, 87, 0, 0, 0, 0),
(413, 4, 90, 0, 0, 0, 0),
(414, 4, 103, 0, 0, 0, 0),
(415, 5, 91, 0, 0, 0, 0),
(416, 5, 92, 0, 0, 0, 0),
(417, 5, 93, 0, 0, 1, 0),
(418, 5, 94, 0, 0, 1, 0),
(419, 5, 95, 0, 0, 0, 0),
(420, 5, 96, 0, 0, 0, 0),
(421, 5, 97, 0, 0, 0, 0),
(422, 5, 98, 0, 0, 0, 0),
(423, 5, 99, 0, 0, 0, 0),
(424, 5, 100, 0, 0, 0, 0),
(425, 5, 101, 0, 0, 0, 0),
(426, 5, 102, 0, 0, 0, 0),
(427, 5, 1, 0, 0, 1, 0),
(428, 5, 2, 0, 0, 0, 0),
(429, 5, 3, 0, 0, 0, 0),
(430, 5, 4, 0, 0, 0, 0),
(431, 5, 5, 0, 0, 0, 0),
(432, 5, 30, 0, 0, 0, 0),
(433, 5, 7, 0, 0, 0, 0),
(434, 5, 8, 0, 0, 0, 0),
(435, 5, 6, 0, 0, 1, 0),
(436, 5, 9, 0, 0, 0, 0),
(437, 5, 10, 0, 0, 0, 0),
(438, 5, 11, 0, 0, 0, 0),
(439, 5, 12, 0, 0, 0, 0),
(440, 5, 13, 0, 0, 0, 0),
(441, 5, 14, 0, 0, 0, 0),
(442, 5, 15, 0, 0, 0, 0),
(443, 5, 16, 0, 0, 0, 0),
(444, 5, 17, 0, 0, 0, 0),
(446, 5, 19, 0, 0, 0, 0),
(447, 5, 20, 1, 1, 1, 1),
(448, 5, 21, 0, 0, 0, 0),
(449, 5, 22, 0, 0, 0, 0),
(450, 5, 23, 0, 0, 0, 0),
(451, 5, 24, 0, 0, 0, 0),
(452, 5, 25, 0, 0, 0, 0),
(453, 5, 26, 0, 0, 0, 0),
(454, 5, 27, 0, 0, 0, 0),
(455, 5, 28, 0, 0, 0, 0),
(456, 5, 29, 0, 0, 0, 0),
(457, 5, 32, 0, 0, 0, 0),
(458, 5, 88, 0, 0, 0, 0),
(459, 5, 89, 0, 0, 0, 0),
(460, 5, 31, 0, 0, 0, 0),
(461, 5, 33, 0, 0, 0, 0),
(462, 5, 34, 0, 0, 0, 0),
(463, 5, 35, 0, 0, 0, 0),
(464, 5, 36, 0, 0, 0, 0),
(465, 5, 37, 0, 0, 0, 0),
(466, 5, 38, 0, 0, 0, 0),
(467, 5, 39, 0, 0, 0, 0),
(468, 5, 77, 0, 0, 0, 0),
(469, 5, 78, 0, 0, 0, 0),
(470, 5, 79, 0, 0, 0, 0),
(471, 5, 40, 0, 0, 0, 0),
(472, 5, 41, 0, 0, 0, 0),
(473, 5, 42, 0, 0, 0, 0),
(474, 5, 43, 0, 0, 0, 0),
(475, 5, 44, 0, 0, 0, 0),
(476, 5, 45, 0, 0, 0, 0),
(477, 5, 46, 0, 0, 0, 0),
(478, 5, 47, 0, 0, 0, 0),
(479, 5, 48, 0, 0, 0, 0),
(480, 5, 49, 0, 0, 0, 0),
(481, 5, 50, 0, 0, 0, 0),
(482, 5, 51, 0, 0, 0, 0),
(483, 5, 52, 0, 0, 0, 0),
(484, 5, 53, 0, 0, 0, 0),
(485, 5, 54, 0, 0, 0, 0),
(486, 5, 55, 1, 1, 1, 1),
(487, 5, 56, 1, 1, 1, 1),
(488, 5, 57, 1, 0, 1, 1),
(489, 5, 58, 1, 0, 1, 1),
(490, 5, 59, 0, 0, 0, 0),
(491, 5, 60, 0, 0, 0, 0),
(492, 5, 61, 0, 0, 0, 0),
(493, 5, 62, 0, 0, 0, 0),
(494, 5, 80, 0, 0, 0, 0),
(495, 5, 69, 0, 0, 0, 0),
(496, 5, 70, 0, 0, 0, 0),
(497, 5, 71, 0, 0, 0, 0),
(498, 5, 72, 0, 0, 0, 0),
(499, 5, 73, 0, 0, 0, 0),
(500, 5, 74, 0, 0, 0, 0),
(501, 5, 75, 0, 0, 0, 0),
(502, 5, 76, 0, 0, 0, 0),
(503, 5, 63, 0, 0, 0, 0),
(504, 5, 64, 0, 0, 0, 0),
(505, 5, 65, 0, 0, 0, 0),
(506, 5, 66, 0, 0, 0, 0),
(507, 5, 67, 0, 0, 0, 0),
(508, 5, 68, 0, 0, 0, 0),
(509, 5, 81, 0, 0, 0, 0),
(510, 5, 82, 0, 0, 0, 0),
(511, 5, 83, 0, 0, 0, 0),
(512, 5, 84, 0, 0, 0, 0),
(513, 5, 85, 0, 0, 0, 0),
(514, 5, 86, 0, 0, 0, 0),
(515, 5, 87, 0, 0, 0, 0),
(516, 5, 90, 0, 0, 0, 0),
(517, 5, 103, 0, 0, 0, 0),
(518, 104, 104, 1, 1, 1, 1),
(519, 2, 104, 0, 0, 1, 0),
(520, 4, 104, 0, 0, 1, 0),
(521, 2, 18, 1, 0, 1, 1),
(522, 2, 105, 0, 1, 1, 0),
(523, 2, 106, 1, 1, 1, 1),
(524, 2, 107, 0, 0, 1, 0),
(525, 2, 109, 1, 1, 1, 1),
(526, 2, 108, 0, 1, 1, 0),
(527, 3, 18, 0, 0, 0, 0),
(528, 3, 107, 0, 0, 0, 0),
(529, 3, 109, 1, 1, 1, 1),
(530, 3, 104, 0, 0, 0, 0),
(531, 3, 105, 0, 0, 0, 0),
(532, 3, 106, 0, 0, 0, 0),
(533, 3, 108, 0, 0, 0, 0),
(534, 2, 110, 1, 1, 1, 1),
(535, 2, 111, 0, 0, 1, 0),
(536, 2, 112, 0, 0, 1, 0),
(537, 2, 113, 1, 1, 1, 1),
(538, 2, 114, 0, 0, 1, 0),
(539, 2, 115, 0, 0, 1, 0),
(540, 2, 116, 1, 1, 1, 1),
(541, 2, 117, 0, 0, 1, 0),
(542, 3, 110, 1, 1, 1, 1),
(543, 3, 111, 0, 0, 1, 0),
(544, 3, 112, 0, 0, 0, 0),
(545, 3, 113, 1, 1, 1, 1),
(546, 3, 114, 0, 0, 1, 0),
(547, 3, 115, 0, 0, 0, 0),
(548, 3, 116, 1, 1, 1, 1),
(549, 3, 117, 0, 0, 1, 0),
(550, 2, 127, 1, 0, 1, 1),
(551, 2, 118, 1, 0, 1, 0),
(552, 2, 119, 1, 1, 1, 1),
(553, 2, 120, 1, 0, 1, 0),
(554, 2, 121, 1, 1, 1, 1),
(555, 2, 122, 1, 1, 1, 1),
(556, 2, 123, 1, 1, 1, 1),
(557, 2, 124, 1, 1, 1, 1),
(558, 2, 125, 1, 1, 1, 1),
(559, 2, 126, 1, 1, 1, 1),
(560, 3, 118, 0, 0, 0, 0),
(561, 3, 119, 0, 0, 0, 0),
(562, 3, 120, 0, 0, 0, 0),
(563, 3, 121, 0, 0, 0, 0),
(564, 3, 122, 0, 0, 0, 0),
(565, 3, 123, 0, 0, 0, 0),
(566, 3, 124, 0, 0, 0, 0),
(567, 3, 125, 0, 0, 0, 0),
(568, 3, 126, 0, 0, 0, 0),
(569, 3, 127, 0, 0, 0, 0),
(570, 3, 128, 0, 0, 0, 0),
(571, 2, 129, 0, 0, 1, 0),
(572, 2, 128, 0, 0, 0, 0),
(573, 2, 131, 1, 1, 1, 1),
(574, 2, 132, 1, 1, 1, 1),
(575, 2, 130, 0, 0, 0, 1),
(576, 4, 118, 0, 0, 0, 0),
(577, 4, 119, 0, 0, 0, 0),
(578, 4, 120, 0, 0, 0, 0),
(579, 4, 121, 0, 0, 0, 0),
(580, 4, 122, 0, 0, 0, 0),
(581, 4, 123, 0, 0, 0, 0),
(582, 4, 124, 0, 0, 0, 0),
(583, 4, 125, 0, 0, 0, 0),
(584, 4, 126, 0, 0, 0, 0),
(585, 4, 131, 0, 0, 0, 0),
(586, 4, 132, 0, 0, 0, 0),
(587, 4, 127, 0, 0, 0, 0),
(588, 4, 113, 0, 0, 0, 0),
(589, 4, 114, 0, 0, 0, 0),
(590, 4, 115, 0, 0, 0, 0),
(591, 4, 116, 0, 0, 0, 0),
(592, 4, 117, 0, 0, 0, 0),
(593, 4, 110, 0, 0, 0, 0),
(594, 4, 111, 0, 0, 0, 0),
(595, 4, 112, 0, 0, 0, 0),
(596, 4, 18, 0, 0, 0, 0),
(597, 4, 107, 0, 0, 0, 0),
(598, 4, 109, 0, 0, 0, 0),
(599, 4, 129, 0, 0, 0, 0),
(600, 4, 130, 0, 0, 0, 1),
(601, 4, 105, 0, 0, 0, 0),
(602, 4, 106, 0, 0, 0, 0),
(603, 4, 108, 0, 0, 0, 0),
(604, 4, 128, 0, 0, 0, 0),
(605, 2, 131, 1, 1, 1, 1),
(606, 2, 132, 1, 1, 1, 1),
(607, 2, 133, 0, 0, 1, 0),
(608, 3, 133, 0, 0, 1, 0),
(609, 2, 134, 1, 1, 1, 1),
(610, 2, 136, 1, 1, 1, 1),
(611, 2, 137, 1, 1, 1, 1),
(612, 2, 138, 1, 0, 0, 0),
(613, 2, 139, 1, 1, 1, 1),
(614, 2, 140, 0, 0, 1, 0),
(615, 2, 135, 0, 1, 1, 0),
(616, 3, 131, 0, 0, 0, 0),
(617, 3, 132, 0, 0, 0, 0),
(618, 3, 129, 0, 0, 0, 0),
(619, 3, 130, 0, 0, 0, 0),
(620, 3, 136, 1, 1, 1, 1),
(621, 3, 137, 1, 1, 1, 1),
(622, 3, 138, 1, 0, 0, 0),
(623, 3, 139, 1, 1, 1, 1),
(624, 3, 140, 0, 0, 1, 0),
(625, 3, 134, 0, 0, 0, 0),
(626, 3, 135, 0, 0, 0, 0),
(627, 2, 141, 1, 0, 1, 0),
(628, 2, 142, 1, 1, 1, 1),
(629, 2, 143, 1, 1, 1, 1),
(630, 2, 144, 1, 1, 1, 1),
(631, 2, 145, 1, 1, 1, 1),
(632, 2, 146, 1, 1, 1, 1),
(633, 2, 147, 1, 0, 1, 1),
(634, 2, 148, 1, 1, 1, 1),
(635, 2, 149, 0, 0, 1, 0),
(636, 2, 150, 0, 0, 1, 0),
(637, 2, 151, 0, 0, 1, 0),
(638, 2, 152, 0, 0, 1, 0),
(639, 2, 153, 0, 0, 1, 0),
(640, 8, 91, 0, 0, 0, 0),
(641, 8, 92, 0, 0, 0, 0),
(642, 8, 93, 0, 0, 1, 0),
(643, 8, 94, 0, 0, 1, 0),
(644, 8, 95, 0, 0, 1, 0),
(645, 8, 96, 0, 0, 1, 0),
(646, 8, 97, 0, 0, 0, 0),
(647, 8, 98, 0, 0, 0, 0),
(648, 8, 99, 0, 0, 0, 0),
(649, 8, 100, 0, 0, 0, 0),
(650, 8, 101, 0, 0, 0, 0),
(651, 8, 102, 0, 0, 0, 0),
(652, 8, 151, 0, 0, 1, 0),
(653, 8, 152, 0, 0, 1, 0),
(654, 8, 118, 0, 0, 0, 0),
(655, 8, 119, 0, 0, 0, 0),
(656, 8, 120, 0, 0, 0, 0),
(657, 8, 121, 0, 0, 0, 0),
(658, 8, 122, 0, 0, 0, 0),
(659, 8, 123, 0, 0, 0, 0),
(660, 8, 124, 0, 0, 0, 0),
(661, 8, 125, 0, 0, 0, 0),
(662, 8, 126, 0, 0, 0, 0),
(663, 8, 131, 0, 0, 0, 0),
(664, 8, 132, 0, 0, 0, 0),
(665, 8, 1, 0, 0, 1, 0),
(666, 8, 2, 0, 0, 0, 0),
(667, 8, 3, 0, 0, 0, 0),
(668, 8, 4, 0, 0, 0, 0),
(669, 8, 5, 0, 0, 0, 0),
(670, 8, 30, 0, 0, 0, 0),
(671, 8, 127, 0, 0, 0, 0),
(672, 8, 7, 0, 0, 1, 0),
(673, 8, 8, 0, 0, 0, 0),
(674, 8, 6, 0, 0, 1, 0),
(675, 8, 9, 0, 0, 0, 0),
(676, 8, 10, 0, 0, 0, 0),
(677, 8, 11, 0, 0, 0, 0),
(678, 8, 113, 0, 0, 0, 0),
(679, 8, 114, 0, 0, 0, 0),
(680, 8, 115, 0, 0, 0, 0),
(681, 8, 116, 0, 0, 0, 0),
(682, 8, 117, 0, 0, 0, 0),
(683, 8, 110, 0, 0, 0, 0),
(684, 8, 111, 0, 0, 0, 0),
(685, 8, 112, 0, 0, 0, 0),
(686, 8, 12, 0, 0, 0, 0),
(687, 8, 13, 0, 0, 0, 0),
(688, 8, 14, 0, 0, 1, 0),
(689, 8, 15, 0, 0, 0, 0),
(690, 8, 16, 0, 0, 0, 0),
(691, 8, 17, 0, 0, 0, 0),
(692, 8, 18, 1, 0, 1, 1),
(693, 8, 19, 0, 0, 0, 0),
(694, 8, 20, 1, 1, 1, 1),
(695, 8, 21, 0, 0, 0, 0),
(696, 8, 22, 0, 0, 0, 0),
(697, 8, 107, 0, 0, 0, 0),
(698, 8, 23, 0, 0, 0, 0),
(699, 8, 24, 0, 0, 0, 0),
(700, 8, 25, 0, 0, 0, 0),
(701, 8, 26, 0, 0, 0, 0),
(702, 8, 27, 0, 0, 0, 0),
(703, 8, 28, 0, 0, 0, 0),
(704, 8, 29, 0, 0, 0, 0),
(705, 8, 133, 0, 0, 0, 0),
(706, 8, 109, 0, 0, 0, 0),
(707, 8, 129, 0, 0, 0, 0),
(708, 8, 31, 0, 0, 0, 0),
(709, 8, 33, 0, 0, 0, 0),
(710, 8, 32, 0, 0, 0, 0),
(711, 8, 88, 0, 0, 0, 0),
(712, 8, 89, 0, 0, 0, 0),
(713, 8, 34, 0, 0, 0, 0),
(714, 8, 35, 0, 0, 0, 0),
(715, 8, 36, 0, 0, 0, 0),
(716, 8, 37, 0, 0, 0, 0),
(717, 8, 38, 0, 0, 0, 0),
(718, 8, 39, 0, 0, 0, 0),
(719, 8, 77, 0, 0, 0, 0),
(720, 8, 78, 0, 0, 0, 0),
(721, 8, 79, 0, 0, 0, 0),
(722, 8, 153, 0, 0, 0, 0),
(723, 8, 40, 0, 0, 0, 0),
(724, 8, 41, 0, 0, 0, 0),
(725, 8, 42, 0, 0, 0, 0),
(726, 8, 43, 0, 0, 0, 0),
(727, 8, 44, 0, 0, 0, 0),
(728, 8, 45, 0, 0, 0, 0),
(729, 8, 46, 0, 0, 0, 0),
(730, 8, 47, 0, 0, 0, 0),
(731, 8, 48, 0, 0, 0, 0),
(732, 8, 49, 0, 0, 0, 0),
(733, 8, 50, 0, 0, 0, 0),
(734, 8, 51, 0, 0, 0, 0),
(735, 8, 52, 0, 0, 0, 0),
(736, 8, 53, 0, 0, 0, 0),
(737, 8, 54, 0, 0, 0, 0),
(738, 8, 55, 0, 0, 0, 0),
(739, 8, 56, 0, 0, 0, 0),
(740, 8, 57, 0, 0, 0, 0),
(741, 8, 58, 0, 0, 0, 0),
(742, 8, 59, 0, 0, 0, 0),
(743, 8, 60, 0, 0, 0, 0),
(744, 8, 61, 0, 0, 0, 0),
(745, 8, 62, 0, 0, 0, 0),
(746, 8, 80, 0, 0, 0, 0),
(747, 8, 149, 0, 0, 0, 0),
(748, 8, 150, 0, 0, 0, 0),
(749, 8, 69, 0, 0, 0, 0),
(750, 8, 70, 0, 0, 0, 0),
(751, 8, 71, 0, 0, 0, 0),
(752, 8, 72, 0, 0, 0, 0),
(753, 8, 73, 0, 0, 0, 0),
(754, 8, 74, 0, 0, 0, 0),
(755, 8, 75, 0, 0, 0, 0),
(756, 8, 76, 0, 0, 0, 0),
(757, 8, 104, 0, 0, 0, 0),
(758, 8, 130, 0, 0, 0, 0),
(759, 8, 63, 0, 0, 0, 0),
(760, 8, 64, 0, 0, 0, 0),
(761, 8, 65, 0, 0, 0, 0),
(762, 8, 66, 0, 0, 0, 0),
(763, 8, 67, 0, 0, 0, 0),
(764, 8, 68, 0, 0, 0, 0),
(765, 8, 136, 0, 0, 0, 0),
(766, 8, 137, 0, 0, 0, 0),
(767, 8, 138, 0, 0, 0, 0),
(768, 8, 139, 0, 0, 0, 0),
(769, 8, 140, 0, 0, 0, 0),
(770, 8, 141, 0, 0, 0, 0),
(771, 8, 142, 1, 1, 1, 1),
(772, 8, 143, 1, 1, 1, 1),
(773, 8, 144, 1, 1, 1, 1),
(774, 8, 145, 1, 1, 1, 1),
(775, 8, 146, 1, 1, 1, 1),
(776, 8, 147, 1, 0, 1, 1),
(777, 8, 148, 1, 1, 1, 1),
(778, 8, 81, 0, 0, 0, 0),
(779, 8, 82, 0, 0, 0, 0),
(780, 8, 83, 0, 0, 0, 0),
(781, 8, 84, 0, 0, 0, 0),
(782, 8, 85, 0, 0, 0, 0),
(783, 8, 86, 0, 0, 0, 0),
(784, 8, 87, 0, 0, 0, 0),
(785, 8, 90, 0, 0, 0, 0),
(786, 8, 103, 0, 0, 0, 0),
(787, 8, 105, 0, 0, 0, 0),
(788, 8, 106, 0, 0, 0, 0),
(789, 8, 108, 0, 0, 0, 0),
(790, 8, 128, 0, 0, 0, 0),
(791, 8, 134, 0, 0, 0, 0),
(792, 8, 135, 0, 0, 0, 0),
(793, 2, 157, 1, 1, 1, 1),
(794, 2, 158, 1, 1, 1, 1),
(795, 2, 159, 1, 1, 1, 0),
(796, 2, 160, 1, 1, 1, 1),
(797, 2, 161, 1, 1, 1, 1),
(798, 2, 162, 0, 0, 1, 0),
(799, 2, 163, 1, 1, 1, 1),
(800, 2, 164, 1, 0, 1, 1),
(801, 2, 165, 0, 0, 1, 0),
(802, 2, 166, 1, 0, 1, 1),
(803, 2, 167, 0, 0, 1, 0),
(804, 2, 168, 0, 0, 1, 0),
(805, 2, 173, 1, 1, 1, 1),
(806, 2, 154, 0, 0, 0, 0),
(807, 2, 174, 1, 1, 1, 1),
(808, 2, 155, 0, 0, 0, 0),
(809, 2, 156, 1, 1, 1, 1),
(810, 2, 169, 0, 0, 1, 1),
(811, 2, 170, 1, 1, 1, 1),
(812, 2, 171, 1, 1, 1, 1),
(813, 2, 172, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `register_no` varchar(100) DEFAULT NULL,
  `admission_date` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `birthday` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `caste` varchar(100) DEFAULT NULL,
  `blood_group` varchar(100) DEFAULT NULL,
  `mother_tongue` varchar(100) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `route_id` int(11) NOT NULL DEFAULT 0,
  `vehicle_id` int(11) NOT NULL DEFAULT 0,
  `hostel_id` int(11) NOT NULL DEFAULT 0,
  `room_id` int(11) NOT NULL DEFAULT 0,
  `previous_details` text DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `register_no`, `admission_date`, `first_name`, `last_name`, `gender`, `birthday`, `religion`, `caste`, `blood_group`, `mother_tongue`, `current_address`, `permanent_address`, `city`, `state`, `mobileno`, `category_id`, `email`, `parent_id`, `route_id`, `vehicle_id`, `hostel_id`, `room_id`, `previous_details`, `photo`, `created_at`, `updated_at`) VALUES
(56, '240001', '1969-12-31', 'MD.', 'ABDULLAH', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '7/25/2024 0:00', 56, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:37', NULL),
(57, '240002', '1969-12-31', 'MIHAN', 'KHAN', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '7/25/2024 0:00', 57, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:37', NULL),
(58, '240003', '1969-12-31', 'MAHMUDUL HASAN', 'MIRAZ', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '7/29/2024 0:00', 58, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:37', NULL),
(59, '240004', '1969-12-31', 'RAFSIN MAHMUD', 'MAHIM', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '7/29/2024 0:00', 59, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:37', NULL),
(60, '240005', '1969-12-31', 'JISAN', '', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '7/29/2024 0:00', 60, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:37', NULL),
(61, '240006', '1969-12-31', 'KHANDOKAR', 'TAJBIR', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 61, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:38', NULL),
(62, '240007', '1969-12-31', 'MAISHA', 'MONI', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 62, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:38', NULL),
(63, '240008', '1969-12-31', 'SAIF', 'AHSAN', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 63, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:38', NULL),
(64, '240009', '1969-12-31', 'ANISHA', '', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 64, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:38', NULL),
(65, '240010', '1969-12-31', 'ANNIKA', '', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 65, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:38', NULL),
(66, '240011', '1969-12-31', 'JANOKI', 'BISWAS', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 66, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:38', NULL),
(67, '240012', '1969-12-31', 'APURBA CHANDRA', 'BISWAS', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 67, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:38', NULL),
(68, '240013', '1969-12-31', 'TANBIA', 'JAHAN', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 68, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:38', NULL),
(69, '240014', '1969-12-31', 'ABRAR', 'FAIYAZ', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 69, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:39', NULL),
(70, '240015', '1969-12-31', 'JANNATUL FERDAUS', 'MAWA', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 70, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:39', NULL),
(71, '240016', '1969-12-31', 'TANHA', 'AKTER', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 71, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:39', NULL),
(72, '240017', '1969-12-31', 'SIMI', '', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 72, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:39', NULL),
(73, '240018', '1969-12-31', 'MAIMUNA', 'BUSHRA', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 73, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:39', NULL),
(74, '240019', '1969-12-31', 'MAIMUNA AKTER', 'MORIOM', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 74, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:39', NULL),
(75, '240021', '1969-12-31', 'MONTAHA', '', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 75, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:39', NULL),
(76, '240022', '1969-12-31', 'HASAN', '', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 76, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:39', NULL),
(77, '240024', '1969-12-31', 'ISMAT JAHAN', 'AFIYA', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 77, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:39', NULL),
(78, '240025', '1969-12-31', 'SAFWAN', '', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 78, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:40', NULL),
(79, '240026', '1969-12-31', 'FARIA AKTER', 'NEHA', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 79, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:40', NULL),
(80, '240027', '1969-12-31', 'ABRAR', 'HASAN', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 80, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:40', NULL),
(81, '240028', '1969-12-31', 'SAMIA', 'AKTER', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 81, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:40', NULL),
(82, '240029', '1969-12-31', 'ABDUR RAHMAN', 'ADIL', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 82, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:40', NULL),
(83, '240030', '1969-12-31', 'SHOAIB', '', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 83, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:40', NULL),
(84, '240031', '1969-12-31', 'RIFAT', '', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 84, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:40', NULL),
(85, '240032', '1969-12-31', 'YASIN', '', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 85, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:40', NULL),
(86, '240033', '1969-12-31', 'NEEL', '', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 86, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:41', NULL),
(87, '240034', '1969-12-31', 'ARIYAN', '', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 87, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:41', NULL),
(88, '240035', '1969-12-31', 'JIM', '', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 88, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:41', NULL),
(89, '240036', '1969-12-31', 'SUDIPTO', 'DEY', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 89, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:41', NULL),
(90, '240037', '1969-12-31', 'MOBASSHIRA', '', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 90, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:41', NULL),
(91, '240038', '1969-12-31', 'MIZAN', '', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 91, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:41', NULL),
(92, '240039', '1969-12-31', 'YEASIN ARAFAT', 'RAMIM', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 92, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:41', NULL),
(93, '240041', '1969-12-31', 'MOKARRIM', 'HOSSEN', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 93, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:41', NULL),
(94, '240042', '1969-12-31', 'MINHA', '', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 94, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:42', NULL),
(95, '240043', '1969-12-31', 'TANVIR AL', 'RAFI', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 95, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:42', NULL),
(96, '240044', '1969-12-31', 'HAMIM', '', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 96, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:42', NULL),
(97, '240045', '1969-12-31', 'ESHA', 'MUKTER', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 97, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:42', NULL),
(98, '240046', '1969-12-31', 'BILLAL', 'HOSSAIN', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 98, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:42', NULL),
(99, '240047', '1969-12-31', 'MINHAJ', '', 'MALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 99, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:42', NULL),
(100, '240048', '1969-12-31', 'FATEMA', '', 'FEMALE', '1969-12-31', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 100, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:19:42', NULL),
(101, '240020', '1970-01-01', 'ABIDA', 'SINHA', 'MALE', '2020-03-14', 'ISLAM', '', '', '', '', 'vill: Kachihara Post: Kachihar,6712 , Thana : Kazipur , Dist: Sirajganj', '', '', '', 0, '', 101, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:22:37', NULL),
(102, '240023', '1970-01-01', 'RAIYAN HASAN', 'ADIB', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 102, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:22:37', NULL),
(103, '240040', '1970-01-01', 'RAMIM', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 103, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:22:37', NULL),
(104, '240049', '1970-01-01', 'ANISHA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 104, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:24', NULL),
(105, '240050', '1970-01-01', 'HUSAIN AHMED', 'LABIB', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 105, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:25', NULL),
(106, '240051', '1970-01-01', 'SAYON AHMED', 'SIHAN', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 106, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:25', NULL),
(107, '240052', '1970-01-01', 'RAWZATUL', 'JANANT', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '7/29/2024 0:00', 107, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:25', NULL),
(108, '240053', '1970-01-01', 'MD. ANIK', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '9/26/2024 0:00', 108, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:25', NULL),
(109, '240054', '1970-01-01', 'MD. SAFIUL HASAN', 'IMRAN', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 109, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:25', NULL),
(110, '240055', '1970-01-01', 'ANAN', 'ANRAR', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 110, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:25', NULL),
(111, '240056', '1970-01-01', 'NUSRAT JAHAN', 'HIMU', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 111, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:25', NULL),
(112, '240057', '1970-01-01', 'NUSRAT JAHAN', 'MOON', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 112, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:25', NULL),
(113, '240058', '1970-01-01', 'MARUFA', 'AKTER', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 113, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:26', NULL),
(114, '240059', '1970-01-01', 'TANHA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 114, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:26', NULL),
(115, '240060', '1970-01-01', 'SALMAN', 'FARSI', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 115, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:26', NULL),
(116, '240061', '1970-01-01', 'AYESHA', 'AKTER', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 116, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:26', NULL),
(117, '240062', '1970-01-01', 'AYESHA NUJHAT', 'NAZA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 117, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:26', NULL),
(118, '240063', '1970-01-01', 'AL', 'RAFI', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 118, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:26', NULL),
(119, '240064', '1970-01-01', 'NISA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 119, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:26', NULL),
(120, '240065', '1970-01-01', 'SALMAN', 'FARSI', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 120, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:26', NULL),
(121, '240066', '1970-01-01', 'LIZA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 121, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:27', NULL),
(122, '240067', '1970-01-01', 'ATIKA AKTER', 'SHIMU', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 122, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:27', NULL),
(123, '240068', '1970-01-01', 'ISMAIL', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 123, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:27', NULL),
(124, '240069', '1970-01-01', 'MUSAID', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 124, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:27', NULL),
(125, '240070', '1970-01-01', 'MODINA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 125, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:27', NULL),
(126, '240071', '1970-01-01', 'JUNAID', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 126, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:27', NULL),
(127, '240072', '1970-01-01', 'SHOUROV', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 127, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:27', NULL),
(128, '240073', '1970-01-01', 'PUSHPITA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 128, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:27', NULL),
(129, '240074', '1970-01-01', 'TANISHA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 129, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:27', NULL),
(130, '240075', '1970-01-01', 'SUMAIYA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 130, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:28', NULL),
(131, '240076', '1970-01-01', 'JUNAYED', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 131, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:28', NULL),
(132, '240077', '1970-01-01', 'JONAKI', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 132, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:28', NULL),
(133, '240078', '1970-01-01', 'ASHRAFUL HASAN', 'JISHAN', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 133, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:28', NULL),
(134, '240079', '1970-01-01', 'DIP', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 134, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:28', NULL),
(135, '240080', '1970-01-01', 'ARAFAT', 'SANI', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 135, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:28', NULL),
(136, '240081', '1970-01-01', 'SAYED', 'HASAN', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 136, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:28', NULL),
(137, '240082', '1970-01-01', 'MAHIM', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 137, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:28', NULL),
(138, '240083', '1970-01-01', 'ASHIK', 'MOLLA', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '9/17/2024 0:00', 138, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:24:29', NULL),
(139, '240084', '1970-01-01', 'JIHAD', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 139, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:08', NULL),
(140, '240085', '1970-01-01', 'SHARMIN JAHAN', 'TASMIA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '7/16/2024 0:00', 140, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:08', NULL),
(141, '240086', '1970-01-01', 'MD. YASIN', 'ARAFAT', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '7/16/2024 0:00', 141, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:08', NULL),
(142, '240087', '1970-01-01', 'NABIHA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '7/16/2024 0:00', 142, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:08', NULL),
(143, '240088', '1970-01-01', 'TANISHA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '9/26/2024 0:00', 143, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:08', NULL),
(144, '240089', '1970-01-01', 'TABASSUM', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 144, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:08', NULL),
(145, '240090', '1970-01-01', 'MEHEDI HASAN', 'JOY', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 145, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:08', NULL),
(146, '240091', '1970-01-01', 'SAIMA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 146, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:08', NULL),
(147, '240092', '1970-01-01', 'SHAKIB', 'HASAN', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 147, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:09', NULL),
(148, '240093', '1970-01-01', 'SADIA', 'AKTER', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 148, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:09', NULL),
(149, '240094', '1970-01-01', 'SAKIBUL HASAN', 'HAMIM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 149, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:09', NULL),
(150, '240095', '1970-01-01', 'MD.', 'EBRAHIM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 150, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:09', NULL),
(151, '240096', '1970-01-01', 'ANISHA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 151, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:09', NULL),
(152, '240097', '1970-01-01', 'JANNATUL', 'FERDOUSI', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 152, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:09', NULL),
(153, '240098', '1970-01-01', 'HABIBA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 153, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:09', NULL),
(154, '240099', '1970-01-01', 'MAHIM', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 154, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:09', NULL),
(155, '240100', '1970-01-01', 'JUNAYED AHMED', 'HAMIM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 155, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:10', NULL),
(156, '240101', '1970-01-01', 'SOMAYA AKTER', 'KABITA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 156, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:10', NULL),
(157, '240102', '1970-01-01', 'ABDULLAH AL', 'MAMUN', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 157, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:10', NULL),
(158, '240103', '1970-01-01', 'MAHMUDA AKTER', 'MIM', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 158, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:10', NULL),
(159, '240104', '1970-01-01', 'MAHI', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 159, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:10', NULL),
(160, '240105', '1970-01-01', 'SHANJIDA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 160, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:10', NULL),
(161, '240106', '1970-01-01', 'BITHI', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 161, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:10', NULL),
(162, '240107', '1970-01-01', 'TANZILA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 162, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:10', NULL),
(163, '240108', '1970-01-01', 'RUMANA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 163, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:11', NULL),
(164, '240109', '1970-01-01', 'MITHILA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 164, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:11', NULL),
(165, '240110', '1970-01-01', 'ALIF', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 165, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:11', NULL),
(166, '240111', '1970-01-01', 'PUJA', 'BISWAS', 'FEMALE', '1970-01-01', 'HINDU', '', '', '', '', '', '', '', '', 0, '', 166, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:11', NULL),
(167, '240112', '1970-01-01', 'JUI', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 167, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:11', NULL),
(168, '240113', '1970-01-01', 'ASHA', 'MONI', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 168, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:11', NULL),
(169, '240114', '1970-01-01', 'WAZID', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 169, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:11', NULL),
(170, '240115', '1970-01-01', 'TANVIR', 'ISLAM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 170, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:11', NULL),
(171, '240116', '1970-01-01', 'HALIMA', 'MEHZABIN', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 171, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:12', NULL),
(172, '240117', '1970-01-01', 'HALIMA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 172, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:12', NULL),
(173, '240118', '1970-01-01', 'HALIMATUS', 'SADIA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 173, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:12', NULL),
(174, '240119', '1970-01-01', 'SHADIN', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 174, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:12', NULL),
(175, '240120', '1970-01-01', 'MONISHA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 175, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:12', NULL),
(176, '240121', '1970-01-01', 'SUHANA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 176, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:12', NULL),
(177, '240122', '1970-01-01', 'NONDINI', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 177, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:12', NULL),
(178, '240123', '1970-01-01', 'RUMANA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 178, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:26:12', NULL),
(179, '240124', '1970-01-01', 'AFRAH AL', 'NUSRAT', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 179, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:14', NULL),
(180, '240125', '1970-01-01', 'TOUA MONI', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '9/17/2024 0:00', 180, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:14', NULL),
(181, '240126', '1970-01-01', 'NABIHA SHUHILA', 'ARSHIYA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '9/17/2024 0:00', 181, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:14', NULL),
(182, '240127', '1970-01-01', 'NAIMA JANNATUN', 'MEEM', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 182, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:14', NULL),
(183, '240128', '1970-01-01', 'SATHI', 'AKTER', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '9/26/2024 0:00', 183, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:14', NULL),
(184, '240129', '1970-01-01', 'SHARAFINA', 'ZONAIRA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 184, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:15', NULL),
(185, '240130', '1970-01-01', 'MAHIBA', 'ARIYA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 185, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:15', NULL),
(186, '240131', '1970-01-01', 'RAMISHA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 186, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:15', NULL),
(187, '240132', '1970-01-01', 'AFSANA', 'MIMI', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 187, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:15', NULL),
(188, '240133', '1970-01-01', 'ABDULLAH AL', 'SAAD', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 188, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:15', NULL),
(189, '240134', '1970-01-01', 'ABID', 'HASAN', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 189, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:15', NULL),
(190, '240135', '1970-01-01', 'RIYAN', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 190, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:15', NULL),
(191, '240136', '1970-01-01', 'SADIYA', 'MIM', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 191, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:15', NULL),
(192, '240137', '1970-01-01', 'NAIMA AKTER', 'NAJNIN', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 192, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:15', NULL),
(193, '240138', '1970-01-01', 'SADIA', 'AKTER', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 193, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:16', NULL),
(194, '240139', '1970-01-01', 'SADEK', 'AHMED', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 194, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:16', NULL),
(195, '240140', '1970-01-01', 'SADIKUL', 'ISLAM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 195, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:16', NULL),
(196, '240141', '1970-01-01', 'JANNATUL', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 196, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:16', NULL),
(197, '240142', '1970-01-01', 'HASIB', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 197, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:16', NULL),
(198, '240143', '1970-01-01', 'SHANTA', 'MONI', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 198, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:16', NULL),
(199, '240144', '1970-01-01', 'JAHIDUL', 'ISLAM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 199, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:16', NULL),
(200, '240145', '1970-01-01', 'JAHID', 'HASAN', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 200, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:17', NULL),
(201, '240146', '1970-01-01', 'MORIOM', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 201, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:17', NULL),
(202, '240147', '1970-01-01', 'MARIA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 202, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:17', NULL),
(203, '240148', '1970-01-01', 'ROJA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 203, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:17', NULL),
(204, '240149', '1970-01-01', 'JIBON', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 204, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:17', NULL),
(205, '240150', '1970-01-01', 'NAYON', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 205, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:28:17', NULL),
(206, '240151', '1970-01-01', 'AFRIN', 'NAHAR', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 206, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:01', NULL),
(207, '240152', '1970-01-01', 'NUSRAT', 'JAHAN', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 207, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:01', NULL),
(208, '240153', '1970-01-01', 'AIRAH AHMED', 'ABRI', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 208, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:02', NULL),
(209, '240154', '1970-01-01', 'JANNATI AKTER', 'NUHA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 209, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:02', NULL),
(210, '240155', '1970-01-01', 'MORIOM AKTER', 'MARIA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 210, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:02', NULL),
(211, '240156', '1970-01-01', 'SADMAN', 'AHMED', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 211, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:02', NULL),
(212, '240157', '1970-01-01', 'RIMI', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 212, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:02', NULL),
(213, '240158', '1970-01-01', 'RUHAD', 'ISLAM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 213, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:02', NULL),
(214, '240159', '1970-01-01', 'ABID', 'MAHMUD', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 214, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:03', NULL),
(215, '240160', '1970-01-01', 'SORNA AKTER', 'SADIA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 215, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:03', NULL),
(216, '240161', '1970-01-01', 'MUSTAFIZUR RAHMAN', 'TAMIM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 216, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:03', NULL),
(217, '240162', '1970-01-01', 'KAWSER UDDIN', 'LAM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 217, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:03', NULL),
(218, '240163', '1970-01-01', 'HAFSA AKTER', 'PKHI', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 218, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:03', NULL),
(219, '240164', '1970-01-01', 'ROMAN', 'ISLAM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 219, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:04', NULL),
(220, '240165', '1970-01-01', 'HABIB', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 220, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:04', NULL),
(221, '240166', '1970-01-01', 'SOMAYA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 221, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:04', NULL),
(222, '240167', '1970-01-01', 'SADID AHMED', 'EBAD', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 222, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:04', NULL),
(223, '240168', '1970-01-01', 'JANNATUL', 'FERDOUS', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 223, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:30:04', NULL),
(224, '240169', '1970-01-01', 'LISA MONI', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 224, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:46', NULL),
(225, '240170', '1970-01-01', 'SABBAHAT', 'NASHRAH', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 225, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:46', NULL),
(226, '240171', '1970-01-01', 'FUAD AL', 'MUSTAKIM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '9/17/2024 0:00', 226, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:47', NULL),
(227, '240172', '1970-01-01', 'MOKTA', 'AKTER', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 227, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:47', NULL),
(228, '240173', '1970-01-01', 'MD. TAHMIDUL ISLAM', 'MISHON', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 228, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:47', NULL),
(229, '240174', '1970-01-01', 'JOBAYER', 'HOSSEN', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 229, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:47', NULL),
(230, '240175', '1970-01-01', 'MASHRUFA AKTER', 'TANIA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 230, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:47', NULL),
(231, '240176', '1970-01-01', 'MINHAZUR RAHMAN', 'JUNAYED', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 231, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:47', NULL),
(232, '240177', '1970-01-01', 'LAMIA', 'JAMAN', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 232, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:47', NULL),
(233, '240178', '1970-01-01', 'ALI', 'AZGAR', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 233, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:47', NULL),
(234, '240179', '1970-01-01', 'JANNATUL FERDOUS', 'LAMIA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 234, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:48', NULL),
(235, '240180', '1970-01-01', 'AKHI ASMAN', 'MEGHLA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 235, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:48', NULL),
(236, '240181', '1970-01-01', 'SURIYA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 236, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:48', NULL),
(237, '240182', '1970-01-01', 'SELIM', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 237, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:48', NULL),
(238, '240183', '1970-01-01', 'SHAKIB', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 238, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:31:48', NULL),
(239, '240184', '1970-01-01', 'MAHIRA', 'ISHAL', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', 'Vangnahati, Sreepur, Gazipur.', '', '', '', 0, '', 239, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:33:06', NULL),
(240, '240185', '1970-01-01', 'SHUVA SULTANA', 'SUMI', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 240, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:33:06', NULL),
(241, '240186', '1970-01-01', 'NUSRAT JAHAN', 'MORIOM', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '9/26/2024 0:00', 241, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:33:06', NULL),
(242, '240187', '1970-01-01', 'TAHMINA SULTANA', 'JERIN', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '9/26/2024 0:00', 242, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:33:06', NULL),
(243, '240188', '1970-01-01', 'ALIFA AKTER', 'CHOITY', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '9/26/2024 0:00', 243, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:33:06', NULL),
(244, '240189', '1970-01-01', 'RAKIBUL', 'ISLAM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 244, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:33:06', NULL),
(245, '240190', '1970-01-01', 'RIYA AKTER', 'TABASSSUM', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 245, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:33:07', NULL),
(246, '240191', '1970-01-01', 'MINHAJ', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 246, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:33:07', NULL),
(247, '240192', '1970-01-01', 'TAHMINA SULTANA', 'AHONA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 247, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:33:07', NULL),
(248, '240193', '1970-01-01', 'MASUM', 'AHMED', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 248, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:33:07', NULL),
(249, '240194', '1970-01-01', 'MD. MUSHA', 'MUKTAR', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 249, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:33:07', NULL),
(250, '240195', '1970-01-01', 'RAMANA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 250, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:33:07', NULL),
(251, '240196', '1970-01-01', 'AYSHA SIDDIKA', 'BABLI', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 251, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:34:24', NULL),
(252, '240197', '1970-01-01', 'MD.', 'RAKIBUL', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 252, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:34:25', NULL),
(253, '240198', '1970-01-01', 'YEAMIN', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 253, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:34:25', NULL),
(254, '240199', '1970-01-01', 'PRIONTI', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 254, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:34:25', NULL),
(255, '240200', '1970-01-01', 'HIMA MONI', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '9/17/2024 0:00', 255, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:34:25', NULL),
(256, '240201', '1970-01-01', 'TANIA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 256, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:34:25', NULL),
(257, '240202', '1970-01-01', 'ROTON', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 257, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:34:25', NULL),
(258, '240203', '1970-01-01', 'MASUM', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 258, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:34:25', NULL),
(259, '240204', '1970-01-01', 'FARJANA', 'AKTER', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 259, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:33', NULL),
(260, '240205', '1970-01-01', 'AHNAF ISLAM', 'ANAS', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 260, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:33', NULL),
(261, '240206', '1970-01-01', 'SINTHIYA AKTER', 'TANJILA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 261, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:33', NULL),
(262, '240207', '1970-01-01', 'JANNATUL', 'RATNA', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 262, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:34', NULL),
(263, '240208', '1970-01-01', 'JONAKI', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 263, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:34', NULL),
(264, '240209', '1970-01-01', 'MARIYA', 'MAHI', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 264, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:34', NULL),
(265, '240210', '1970-01-01', 'OMOR', 'FARUK', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 265, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:34', NULL),
(266, '240211', '1970-01-01', 'SAMIUL', 'BASHIR', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 266, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:34', NULL),
(267, '240212', '1970-01-01', 'MS. RAFIYA', 'KHATON', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 267, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:34', NULL),
(268, '240213', '1970-01-01', 'MAHMUDA', 'AKTER', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 268, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:34', NULL),
(269, '240214', '1970-01-01', 'RAKIBUL', 'ISLAM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 269, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:34', NULL),
(270, '240215', '1970-01-01', 'SOHAN', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 270, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:35', NULL),
(271, '240216', '1970-01-01', 'MORIOM', 'AKTER', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 271, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:35', NULL),
(272, '240217', '1970-01-01', 'YEASIN', '', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 272, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:35', NULL),
(273, '240218', '1970-01-01', 'SAMIYA', '', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 273, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:35', NULL),
(274, '240219', '1970-01-01', 'ISTIAK', 'ISLAM', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 274, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:35', NULL),
(275, '240220', '1970-01-01', 'SHAHADAT HOSEN', 'EDUL', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '5/11/2024 0:00', 275, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:35:35', NULL),
(276, '240221', '1970-01-01', 'MONIRA AKTER', 'MISHU', 'female', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 276, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', '046a5d4f85384ec987747f05cdd31854.jpg', '2024-12-27 11:37:15', NULL),
(277, '240222', '1970-01-01', 'MS. ESHITA', 'KHATUN', 'female', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 277, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', '518ca4f11751e95afaa98267fa3be584.jpg', '2024-12-27 11:37:15', NULL),
(278, '240223', '1970-01-01', 'SADYA AKTER', 'SIMI', 'female', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 278, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', '8b3b2d584d0a80a2c19affe773b5a56b.jpg', '2024-12-27 11:37:15', NULL),
(279, '240224', '1970-01-01', 'JAHID', 'HASAN', 'male', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 279, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', '68e5aaa2dc236c3befe08aa09b1703e2.jpg', '2024-12-27 11:37:15', NULL),
(280, '240225', '1970-01-01', 'JAKIR', 'HOSSEN', 'male', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 280, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', '7c7b6ab1649f09b88078f60091f52e69.jpg', '2024-12-27 11:37:15', NULL),
(281, '240226', '1970-01-01', 'UTTAM', 'BISHWAS', 'male', '1970-01-01', 'HINDU', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 281, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', '7fd1ca98401a7afd788b007bcf5954f1.jpg', '2024-12-27 11:37:15', NULL),
(282, '240227', '1970-01-01', 'TANJILA', 'AKTER', 'female', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 282, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', '1fa15d9e45053dbcd5366d4a257d8470.jpg', '2024-12-27 11:37:15', NULL),
(283, '240228', '1970-01-01', 'SANJIDA', 'AKTER', 'female', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 283, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'ebe4e9759f30f9b0529d7e73c7b0239c.jpg', '2024-12-27 11:37:15', NULL),
(284, '240229', '1970-01-01', 'SHARIN SHAMIM', 'MAYSHA', 'female', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 284, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'ebef6ab1dd4b7774fdfdb9b49996c021.jpg', '2024-12-27 11:40:00', NULL),
(285, '240230', '1970-01-01', 'TAHSIBA TANHA', 'TONU', 'female', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 285, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'c289eb1cd68addf5594717c44e794a04.jpg', '2024-12-27 11:40:00', NULL),
(286, '240231', '1970-01-01', 'MD. TANVIR', 'AHMED', 'male', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 286, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'f08e1305ee0c6d1f9ac85e9729e78509.jpg', '2024-12-27 11:40:00', NULL),
(287, '240232', '1970-01-01', 'SUMAIYA TABASSUM', 'SNEHA', 'female', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 287, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'c42d8e6f186f347f57b780e417e0dee1.jpg', '2024-12-27 11:40:01', NULL),
(288, '240233', '1970-01-01', 'MD. ABU', 'BAKKAR', 'male', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 288, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', '69b156babae06205e5c4d03fd55f46d5.jpg', '2024-12-27 11:40:01', NULL),
(289, '240234', '1970-01-01', 'NADIA', 'AKTER', 'female', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 289, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'b7dc9e539197198cddd27bfbcda54136.jpg', '2024-12-27 11:40:01', NULL),
(290, '240235', '1970-01-01', 'HOSSAIN MOHAMMAD', 'SHELIM', 'male', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 290, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'fd6314fae91be04d604da44804a18b08.jpg', '2024-12-27 11:40:01', NULL),
(291, '240236', '1970-01-01', 'RAKIBUL', 'HASAN', 'male', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 291, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', '983a82d6735b96b067a9f4f438288bc8.jpg', '2024-12-27 11:40:01', NULL),
(292, '240237', '1970-01-01', 'SHAJ HOSSEN', 'KHAN', 'male', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 292, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', '7add1f39b79385d391da9dd769cb9226.jpg', '2024-12-27 11:40:01', NULL),
(293, '240238', '1970-01-01', 'SOHAN HOSSEN', 'KHAN', 'male', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 293, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'd80c98669c356844313ab22db9644fef.jpg', '2024-12-27 11:40:01', NULL),
(294, '240239', '1970-01-01', 'ABULLAH AL', 'RIFAT', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 294, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:40:01', NULL),
(295, '240240', '1970-01-01', 'ATIK HASAN', 'EMON', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 295, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:40:02', NULL),
(296, '240241', '1970-01-01', 'ASHIFA', 'AKTER', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 296, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:40:02', NULL),
(297, '240242', '1970-01-01', 'ATIKA AMIN', 'NEYOTI', 'female', '', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 287, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', '353d552a45b37bec28d08a4d6160d73d.png', '2024-12-27 11:49:35', NULL),
(298, '240243', '1970-01-01', 'ANISHA', 'ATKER', 'female', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 286, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'eb2a83a2c91cde392bd9e950e89f854d.png', '2024-12-27 11:49:35', NULL),
(299, '240244', '1970-01-01', 'ADIBA', 'AFNIN', 'female', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 299, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', '8e28df5861d33b01bdedab990cb89a1e.png', '2024-12-27 11:49:35', NULL),
(300, '240245', '1970-01-01', 'JAHIDUL HASAN', 'IMRAN', 'male', '1970-01-01', 'ISLAM', NULL, '', NULL, '', '', '', NULL, '', 2, NULL, 300, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', '644ffaea51ab66f071a686e7b47b5643.png', '2024-12-27 11:49:35', NULL),
(301, '240246', '1970-01-01', 'PARVEZ', 'MIA', 'MALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '12/4/2024 0:00', 301, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:51:08', NULL),
(302, '240247', '1970-01-01', 'PRIANKA', 'BISHWAS', 'FEMALE', '1970-01-01', 'ISLAM', '', '', '', '', '', '', '', '', 0, '', 302, 0, 0, 0, 0, NULL, 'defualt.png', '2024-12-27 11:52:18', NULL),
(303, '2004048', '2025-01-02', 'Md Abu', 'Sayed', 'male', '1995-08-17', 'Islam', NULL, 'O+', NULL, '', '', '', NULL, '01775457009', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"Nayar Hat High School\",\"qualification\":\"SSC\",\"remarks\":\"Good\"}', '24d69ab121cca016ce64c913a4a70acf.jpeg', '2025-01-02 17:26:28', NULL),
(304, '2004049', '2025-01-02', 'Md Nayeem', 'Hossain', 'male', '1995-07-17', 'Islam', NULL, 'O+', NULL, 'ffgffd', '', 'Dhaka', NULL, '01775457066', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 17:29:00', NULL),
(305, '2004050', '2025-01-02', 'MD MIJANUR', 'ISLAM', 'male', '1925-01-28', 'Islam', NULL, 'O+', NULL, 'ffgffd', '', 'Dhaka', NULL, '01775457019', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 17:39:39', NULL);
INSERT INTO `student` (`id`, `register_no`, `admission_date`, `first_name`, `last_name`, `gender`, `birthday`, `religion`, `caste`, `blood_group`, `mother_tongue`, `current_address`, `permanent_address`, `city`, `state`, `mobileno`, `category_id`, `email`, `parent_id`, `route_id`, `vehicle_id`, `hostel_id`, `room_id`, `previous_details`, `photo`, `created_at`, `updated_at`) VALUES
(306, '2004051', '2025-01-02', 'Md mojnu', 'ISLAM', 'male', '1923-07-10', 'Islam', NULL, 'B-', NULL, '35/3/1', '', 'Dhaka', NULL, '01911111483', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 17:43:24', NULL),
(307, '2004052', '2025-01-02', 'Md Raju', 'ISLAM', 'male', '1923-06-11', 'Islam', NULL, 'A-', NULL, '35/3/1', '', 'Dhaka', NULL, '01911111484', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 17:47:09', NULL),
(308, '2000406', '2025-01-02', 'Md mahadi', 'hassan', 'male', '1923-07-09', 'Islam', NULL, 'B+', NULL, 'ffgffd', '', 'Dhaka', NULL, '01767562870', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 17:51:45', NULL),
(309, '2000407', '2025-01-02', 'Md Alamin', 'ahmed', 'male', '1924-03-04', 'Islam', NULL, 'B-', NULL, '35/3/1', '', 'Dhaka', NULL, '01307309914', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 17:55:50', NULL),
(310, '2000408', '2025-01-02', 'Md Rabiul', 'lslam', 'male', '1923-03-04', 'Islam', NULL, 'B-', NULL, '35/3/1', '', 'Dhaka', NULL, '017309915', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 17:59:31', NULL),
(311, '2000409', '2025-01-02', 'Md  Nabim', 'ISLAM', 'male', '1924-03-04', 'Islam', NULL, 'B+', NULL, '35/3/1', '', 'Dhaka', NULL, '01307309916', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:02:45', NULL),
(312, '2000410', '2025-01-03', 'Md Shakil', 'ahmed', 'male', '1923-07-16', 'Islam', NULL, 'B+', NULL, '35/3/1', '', 'Dhaka', NULL, '01307309917', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:05:36', NULL),
(313, '2000411', '2025-01-03', 'MD Mamun', 'Hassan', 'male', '1924-03-03', 'Islam', NULL, 'A+', NULL, 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', '', 'Dhaka', NULL, '01954578011', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:13:00', NULL),
(314, '2000412', '2025-01-03', 'MD Ariful', 'Hassan', 'male', '1924-01-28', 'Islam', NULL, 'A+', NULL, 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', '', 'Dhaka', NULL, '0195457914', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:17:00', NULL),
(315, '2000042', '2025-01-03', 'MD Raihan', 'ahmed', 'male', '1924-02-04', 'Islam', NULL, 'B+', NULL, '35/3/1', '', 'Dhaka', NULL, '01767522870', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:21:14', NULL),
(316, '2000005', '2025-01-03', 'MD  Sagor', 'ahmed', 'male', '1924-01-27', 'Islam', NULL, 'A-', NULL, 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', '', 'Dhaka', NULL, '01954578070', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:24:37', NULL),
(317, '2000006', '2025-01-03', 'MD Riaj', 'Khan', 'male', '2019-12-30', 'Islam', NULL, 'A-', NULL, 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', '', 'Dhaka', NULL, '01954578060', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:27:12', NULL),
(318, '2000007', '2025-01-03', 'MD mamunur', 'ISLAM', 'male', '2019-12-31', 'Islam', NULL, 'A+', NULL, '35/3/1', '', 'Dhaka', NULL, '01767852870', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:29:44', NULL),
(319, '2000008', '2025-01-03', 'MD Azgar', 'Hossain', 'male', '2019-12-31', 'Islam', NULL, 'B-', NULL, '35/3/1', '', 'Dhaka', NULL, '01911111493', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:32:34', NULL),
(320, '2000009', '2025-01-03', 'MD Saiful', 'ISLAM', 'male', '2018-12-31', 'Islam', NULL, 'A+', NULL, 'ffgffd', '', 'Dhaka', NULL, '01775457456', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:35:16', NULL),
(321, '2000010', '2025-01-03', 'MDFaruk', 'ISLAM', 'male', '2018-12-31', 'Islam', NULL, 'A-', NULL, 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', '', 'Dhaka', NULL, '01954572635', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:37:25', NULL),
(322, '2000011', '2025-01-03', 'MD  Alamin', 'Hossain', 'male', '2018-12-31', 'Islam', NULL, 'B-', NULL, 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', '', 'Dhaka', NULL, '01954578453', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:40:14', NULL),
(323, '2000012', '2025-01-03', 'MD Tanvir', 'ISLAM', 'male', '2019-01-07', 'Islam', NULL, 'B-', NULL, 'ffgffd', '', 'Dhaka', NULL, '01775456789', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:43:28', NULL),
(324, '2000002', '2025-01-03', 'MD Sakib', 'ISLAM', 'male', '', 'Islam', NULL, 'A-', NULL, 'Holding: 13/2033-02,Lotifpur Moddhopara,Bogura', '', 'Dhaka', NULL, '01954578078', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:45:47', NULL),
(325, '2000001', '2025-01-03', 'MD Alamgir', 'Hossain', 'male', '2019-06-04', 'Islam', NULL, 'B+', NULL, '35/3/1', '', 'Dhaka', NULL, '01911111455', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:48:17', NULL),
(326, '125684', '2025-01-03', 'MD Maidul', 'ISLAM', 'male', '2018-12-31', 'Islam', NULL, 'B+', NULL, 'ffgffd', '', 'Dhaka', NULL, '01911111483', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:54:34', NULL),
(327, '2015685', '2025-01-03', 'MD Abdur', 'ISLAM', 'male', '2018-12-31', 'Islam', NULL, 'B+', NULL, '35/3/1', '', 'Dhaka', NULL, '01911114679', 1, NULL, 303, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-01-02 18:57:16', NULL),
(328, '2001', '2026-04-28', 'Sadat', 'Ahmed', 'male', '', '', NULL, '', NULL, '', '', 'info@creativedesign.com.bd', NULL, '', 1, NULL, 304, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2026-04-27 18:51:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_admission_fields`
--

CREATE TABLE `student_admission_fields` (
  `id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `required` tinyint(4) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `student_admission_fields`
--

INSERT INTO `student_admission_fields` (`id`, `fields_id`, `status`, `required`, `branch_id`) VALUES
(1, 1, 1, 0, 1),
(2, 2, 1, 1, 1),
(3, 3, 1, 0, 1),
(4, 4, 1, 0, 1),
(5, 5, 1, 1, 1),
(6, 6, 1, 1, 1),
(7, 8, 1, 0, 1),
(8, 9, 0, 0, 1),
(9, 10, 1, 0, 1),
(10, 11, 0, 0, 1),
(11, 12, 1, 0, 1),
(12, 13, 1, 0, 1),
(13, 14, 1, 0, 1),
(14, 15, 0, 0, 1),
(15, 16, 0, 0, 1),
(16, 17, 1, 0, 1),
(17, 18, 1, 0, 1),
(18, 19, 1, 0, 1),
(19, 20, 1, 1, 1),
(20, 21, 1, 0, 1),
(21, 22, 1, 0, 1),
(22, 23, 1, 0, 1),
(23, 24, 1, 0, 1),
(24, 25, 1, 0, 1),
(25, 26, 1, 0, 1),
(26, 27, 1, 0, 1),
(27, 28, 1, 1, 1),
(28, 29, 1, 0, 1),
(29, 30, 1, 0, 1),
(30, 32, 0, 0, 1),
(31, 33, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

CREATE TABLE `student_attendance` (
  `id` int(11) NOT NULL,
  `enroll_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(4) DEFAULT NULL COMMENT 'P=Present, A=Absent, H=Holiday, L=Late',
  `remark` text DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `student_attendance`
--

INSERT INTO `student_attendance` (`id`, `enroll_id`, `date`, `status`, `remark`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 303, '2026-05-27', 'A', '', 1, '2026-05-27 07:34:45', NULL),
(2, 304, '2026-05-27', 'A', '', 1, '2026-05-27 07:34:45', NULL),
(3, 305, '2026-05-27', 'P', '', 1, '2026-05-27 07:34:45', NULL),
(4, 306, '2026-05-27', 'P', '', 1, '2026-05-27 07:34:45', NULL),
(5, 307, '2026-05-27', 'P', '', 1, '2026-05-27 07:34:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_category`
--

CREATE TABLE `student_category` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `student_category`
--

INSERT INTO `student_category` (`id`, `branch_id`, `name`) VALUES
(1, 1, 'Normal'),
(2, 1, 'Special');

-- --------------------------------------------------------

--
-- Table structure for table `student_documents`
--

CREATE TABLE `student_documents` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `remarks` text NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `enc_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_fields`
--

CREATE TABLE `student_fields` (
  `id` int(11) NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `default_status` tinyint(1) NOT NULL DEFAULT 1,
  `default_required` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `student_fields`
--

INSERT INTO `student_fields` (`id`, `prefix`, `default_status`, `default_required`, `created_at`) VALUES
(1, 'roll', 1, 0, '2022-04-25 20:27:04'),
(2, 'last_name', 1, 1, '2022-04-25 20:27:04'),
(3, 'gender', 1, 0, '2022-04-25 20:27:04'),
(4, 'birthday', 1, 0, '2022-04-25 20:27:04'),
(5, 'admission_date', 1, 1, '2022-04-25 20:27:04'),
(6, 'category', 1, 1, '2022-04-25 20:27:04'),
(7, 'section', 1, 1, '2022-04-25 20:27:04'),
(8, 'religion', 1, 0, '2022-04-25 20:27:04'),
(9, 'caste', 1, 0, '2022-04-25 20:27:04'),
(10, 'blood_group', 1, 0, '2022-04-25 20:27:04'),
(11, 'mother_tongue', 1, 0, '2022-04-25 20:27:04'),
(12, 'present_address', 1, 0, '2022-04-25 20:27:04'),
(13, 'permanent_address', 1, 0, '2022-04-25 20:27:04'),
(14, 'city', 1, 0, '2022-04-25 20:27:04'),
(15, 'state', 1, 0, '2022-04-25 20:27:04'),
(16, 'student_email', 1, 0, '2022-04-25 20:27:04'),
(17, 'student_mobile_no', 1, 0, '2022-04-25 20:27:04'),
(18, 'student_photo', 1, 0, '2022-04-25 20:27:04'),
(19, 'previous_school_details', 1, 0, '2022-04-25 20:27:04'),
(20, 'guardian_name', 1, 1, '2022-04-25 20:27:04'),
(21, 'guardian_relation', 1, 1, '2022-04-25 20:27:04'),
(22, 'father_name', 1, 0, '2022-04-25 20:27:04'),
(23, 'mother_name', 1, 0, '2022-04-25 20:27:04'),
(24, 'guardian_occupation', 1, 1, '2022-04-25 20:27:04'),
(25, 'guardian_income', 1, 1, '2022-04-25 20:27:04'),
(26, 'guardian_education', 1, 1, '2022-04-25 20:27:04'),
(27, 'guardian_email', 1, 1, '2022-04-25 20:27:04'),
(28, 'guardian_mobile_no', 1, 1, '2022-04-25 20:27:04'),
(29, 'guardian_address', 1, 1, '2022-04-25 20:27:04'),
(30, 'guardian_photo', 1, 0, '2022-04-25 20:27:04'),
(31, 'upload_documents', 1, 1, '2022-04-25 20:27:04'),
(32, 'guardian_city', 1, 0, '2022-04-25 20:27:04'),
(33, 'guardian_state', 1, 0, '2022-04-25 20:27:04'),
(34, 'first_name', 1, 1, '2022-04-25 20:27:04');

-- --------------------------------------------------------

--
-- Table structure for table `student_profile_fields`
--

CREATE TABLE `student_profile_fields` (
  `id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `required` tinyint(4) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `student_profile_fields`
--

INSERT INTO `student_profile_fields` (`id`, `fields_id`, `status`, `required`, `branch_id`) VALUES
(1, 2, 1, 1, 1),
(2, 3, 1, 0, 1),
(3, 4, 1, 0, 1),
(4, 5, 1, 1, 1),
(5, 6, 1, 1, 1),
(6, 8, 1, 0, 1),
(7, 9, 0, 0, 1),
(8, 10, 1, 0, 1),
(9, 11, 0, 0, 1),
(10, 12, 1, 0, 1),
(11, 13, 1, 0, 1),
(12, 14, 1, 0, 1),
(13, 15, 0, 0, 1),
(14, 16, 0, 0, 1),
(15, 17, 1, 0, 1),
(16, 18, 1, 0, 1),
(17, 19, 1, 0, 1),
(18, 34, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_subject_attendance`
--

CREATE TABLE `student_subject_attendance` (
  `id` int(11) NOT NULL,
  `enroll_id` int(11) DEFAULT NULL,
  `subject_timetable_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `student_subject_attendance`
--

INSERT INTO `student_subject_attendance` (`id`, `enroll_id`, `subject_timetable_id`, `status`, `date`, `remark`, `branch_id`, `created_at`) VALUES
(1, 303, 45, 'P', '2026-05-27', '', 1, '2026-05-27 09:33:08'),
(2, 304, 45, 'A', '2026-05-27', '', 1, '2026-05-27 09:33:08'),
(3, 305, 45, 'P', '2026-05-27', '', 1, '2026-05-27 09:33:08'),
(4, 306, 45, 'A', '2026-05-27', '', 1, '2026-05-27 09:33:08'),
(5, 307, 45, 'P', '2026-05-27', '', 1, '2026-05-27 09:33:08');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject_code` varchar(200) NOT NULL,
  `subject_type` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `subject_author` varchar(255) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`, `subject_code`, `subject_type`, `subject_author`, `branch_id`) VALUES
(1, 'Bangla', '101', 'Theory', '', 1),
(2, 'English', '102', 'Theory', '', 1),
(3, 'Mathmatics', '103', 'Theory', '', 1),
(4, 'Social Science', '104', 'Theory', '', 1),
(5, 'General Science', '105', 'Theory', '', 1),
(6, 'Islam', '106', 'Theory', '', 1),
(7, 'Physics', '107', 'Theory', '', 1),
(8, 'Physics', '107', 'Practical', '', 1),
(9, 'Chemistry', '108', 'Theory', '', 1),
(10, 'Chemistry', '108', 'Practical', '', 1),
(11, 'Biology', '109', 'Theory', '', 1),
(12, 'Biology', '109', 'Practical', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subject_assign`
--

CREATE TABLE `subject_assign` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `subject_assign`
--

INSERT INTO `subject_assign` (`id`, `class_id`, `section_id`, `subject_id`, `teacher_id`, `branch_id`, `session_id`, `created_at`, `updated_at`) VALUES
(15, 2, 5, 1, 0, 1, 6, '2025-01-02 15:16:21', NULL),
(16, 2, 5, 2, 0, 1, 6, '2025-01-02 15:16:21', NULL),
(17, 2, 5, 3, 0, 1, 6, '2025-01-02 15:16:21', NULL),
(18, 3, 5, 1, 0, 1, 6, '2025-01-02 15:16:33', NULL),
(19, 3, 5, 2, 0, 1, 6, '2025-01-02 15:16:33', NULL),
(20, 3, 5, 3, 0, 1, 6, '2025-01-02 15:16:33', NULL),
(21, 4, 5, 1, 0, 1, 6, '2025-01-02 15:16:52', NULL),
(22, 4, 5, 2, 0, 1, 6, '2025-01-02 15:16:52', NULL),
(23, 4, 5, 3, 0, 1, 6, '2025-01-02 15:16:52', NULL),
(24, 5, 5, 1, 0, 1, 6, '2025-01-02 15:18:03', NULL),
(25, 5, 5, 2, 0, 1, 6, '2025-01-02 15:18:03', NULL),
(26, 5, 5, 3, 0, 1, 6, '2025-01-02 15:18:03', NULL),
(27, 6, 5, 1, 0, 1, 6, '2025-01-02 15:18:29', NULL),
(28, 6, 5, 2, 0, 1, 6, '2025-01-02 15:18:29', NULL),
(29, 6, 5, 3, 0, 1, 6, '2025-01-02 15:18:29', NULL),
(30, 6, 5, 4, 0, 1, 6, '2025-01-02 15:18:29', NULL),
(31, 6, 5, 5, 0, 1, 6, '2025-01-02 15:18:29', NULL),
(32, 6, 5, 6, 0, 1, 6, '2025-01-02 15:18:29', NULL),
(33, 7, 5, 1, 0, 1, 6, '2025-01-02 15:19:10', NULL),
(34, 7, 5, 2, 0, 1, 6, '2025-01-02 15:19:10', NULL),
(35, 7, 5, 3, 0, 1, 6, '2025-01-02 15:19:10', NULL),
(36, 7, 5, 4, 0, 1, 6, '2025-01-02 15:19:10', NULL),
(37, 7, 5, 5, 0, 1, 6, '2025-01-02 15:19:10', NULL),
(38, 7, 5, 6, 0, 1, 6, '2025-01-02 15:19:10', NULL),
(39, 8, 5, 1, 0, 1, 6, '2025-01-02 15:19:52', NULL),
(40, 8, 5, 2, 0, 1, 6, '2025-01-02 15:19:52', NULL),
(41, 8, 5, 3, 0, 1, 6, '2025-01-02 15:19:52', NULL),
(42, 8, 5, 4, 0, 1, 6, '2025-01-02 15:19:52', NULL),
(43, 8, 5, 5, 0, 1, 6, '2025-01-02 15:19:52', NULL),
(44, 8, 5, 6, 0, 1, 6, '2025-01-02 15:19:52', NULL),
(45, 9, 5, 1, 0, 1, 6, '2025-01-02 15:30:50', NULL),
(46, 9, 5, 2, 0, 1, 6, '2025-01-02 15:30:50', NULL),
(47, 9, 5, 3, 0, 1, 6, '2025-01-02 15:30:50', NULL),
(48, 9, 5, 4, 0, 1, 6, '2025-01-02 15:30:50', NULL),
(49, 9, 5, 5, 0, 1, 6, '2025-01-02 15:30:50', NULL),
(50, 9, 5, 6, 0, 1, 6, '2025-01-02 15:30:50', NULL),
(51, 10, 5, 1, 0, 1, 6, '2025-01-02 15:31:12', NULL),
(52, 10, 5, 2, 0, 1, 6, '2025-01-02 15:31:12', NULL),
(53, 10, 5, 3, 0, 1, 6, '2025-01-02 15:31:12', NULL),
(54, 10, 5, 4, 0, 1, 6, '2025-01-02 15:31:12', NULL),
(55, 10, 5, 5, 0, 1, 6, '2025-01-02 15:31:12', NULL),
(56, 10, 5, 6, 0, 1, 6, '2025-01-02 15:31:12', NULL),
(57, 11, 5, 1, 0, 1, 6, '2025-01-02 15:31:36', NULL),
(58, 11, 5, 2, 0, 1, 6, '2025-01-02 15:31:36', NULL),
(59, 11, 5, 3, 0, 1, 6, '2025-01-02 15:31:36', NULL),
(60, 11, 5, 4, 0, 1, 6, '2025-01-02 15:31:36', NULL),
(61, 11, 5, 5, 0, 1, 6, '2025-01-02 15:31:36', NULL),
(62, 11, 5, 6, 0, 1, 6, '2025-01-02 15:31:36', NULL),
(63, 12, 2, 1, 0, 1, 6, '2025-01-02 15:32:54', NULL),
(64, 12, 2, 2, 0, 1, 6, '2025-01-02 15:32:54', NULL),
(65, 12, 2, 3, 0, 1, 6, '2025-01-02 15:32:54', NULL),
(66, 12, 2, 4, 0, 1, 6, '2025-01-02 15:32:54', NULL),
(67, 12, 2, 5, 0, 1, 6, '2025-01-02 15:32:54', NULL),
(68, 12, 2, 6, 0, 1, 6, '2025-01-02 15:32:54', NULL),
(69, 12, 2, 7, 0, 1, 6, '2025-01-02 15:32:54', NULL),
(70, 12, 2, 8, 0, 1, 6, '2025-01-02 15:32:54', NULL),
(71, 12, 2, 9, 0, 1, 6, '2025-01-02 15:32:54', NULL),
(72, 12, 2, 10, 0, 1, 6, '2025-01-02 15:32:54', NULL),
(73, 12, 2, 11, 0, 1, 6, '2025-01-02 15:32:54', NULL),
(74, 12, 2, 12, 0, 1, 6, '2025-01-02 15:32:54', NULL),
(75, 13, 2, 1, 0, 1, 6, '2025-01-02 15:33:41', NULL),
(76, 13, 2, 2, 0, 1, 6, '2025-01-02 15:33:41', NULL),
(77, 13, 2, 3, 0, 1, 6, '2025-01-02 15:33:41', NULL),
(78, 13, 2, 4, 0, 1, 6, '2025-01-02 15:33:41', NULL),
(79, 13, 2, 5, 0, 1, 6, '2025-01-02 15:33:41', NULL),
(80, 13, 2, 6, 0, 1, 6, '2025-01-02 15:33:41', NULL),
(81, 13, 2, 7, 0, 1, 6, '2025-01-02 15:33:41', NULL),
(82, 13, 2, 8, 0, 1, 6, '2025-01-02 15:33:41', NULL),
(83, 13, 2, 9, 0, 1, 6, '2025-01-02 15:33:41', NULL),
(84, 13, 2, 10, 0, 1, 6, '2025-01-02 15:33:41', NULL),
(85, 13, 2, 11, 0, 1, 6, '2025-01-02 15:33:41', NULL),
(86, 13, 2, 12, 0, 1, 6, '2025-01-02 15:33:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_allocation`
--

CREATE TABLE `teacher_allocation` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `teacher_allocation`
--

INSERT INTO `teacher_allocation` (`id`, `class_id`, `section_id`, `teacher_id`, `session_id`, `branch_id`) VALUES
(1, 2, 1, 3, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_note`
--

CREATE TABLE `teacher_note` (
  `id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `description` longtext NOT NULL,
  `file_name` longtext NOT NULL,
  `enc_name` longtext NOT NULL,
  `type_id` int(11) NOT NULL,
  `class_id` longtext NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theme_settings`
--

CREATE TABLE `theme_settings` (
  `id` int(11) NOT NULL,
  `border_mode` varchar(200) NOT NULL,
  `dark_skin` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `theme_settings`
--

INSERT INTO `theme_settings` (`id`, `border_mode`, `dark_skin`, `created_at`, `updated_at`) VALUES
(1, 'true', 'false', '2018-10-23 16:59:38', '2020-05-10 14:08:47');

-- --------------------------------------------------------

--
-- Table structure for table `timetable_class`
--

CREATE TABLE `timetable_class` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `break` varchar(11) DEFAULT 'false',
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `class_room` varchar(100) DEFAULT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `day` varchar(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `timetable_class`
--

INSERT INTO `timetable_class` (`id`, `class_id`, `section_id`, `break`, `subject_id`, `teacher_id`, `class_room`, `time_start`, `time_end`, `day`, `session_id`, `branch_id`) VALUES
(3, 2, 5, '0', 1, 3, '101', '08:00:00', '08:30:00', 'saturday', 6, 1),
(4, 2, 5, '0', 2, 3, '101', '08:30:00', '09:00:00', 'saturday', 6, 1),
(5, 2, 5, '0', 3, 3, '101', '09:00:00', '09:30:00', 'saturday', 6, 1),
(6, 2, 5, '0', 1, 3, '101', '08:00:00', '08:30:00', 'tuesday', 6, 1),
(7, 2, 5, '0', 2, 3, '101', '08:30:00', '09:00:00', 'tuesday', 6, 1),
(8, 2, 5, '0', 3, 3, '101', '09:00:00', '09:30:00', 'tuesday', 6, 1),
(9, 2, 5, '0', 1, 3, '101', '08:30:00', '09:00:00', 'monday', 6, 1),
(10, 2, 5, '0', 2, 3, '101', '09:00:00', '09:30:00', 'monday', 6, 1),
(11, 2, 5, '0', 3, 3, '101', '09:30:00', '10:00:00', 'monday', 6, 1),
(12, 2, 5, '0', 1, 3, '101', '08:30:00', '09:00:00', 'wednesday', 6, 1),
(13, 2, 5, '0', 2, 3, '101', '09:00:00', '09:30:00', 'wednesday', 6, 1),
(14, 2, 5, '0', 3, 3, '101', '09:30:00', '10:00:00', 'wednesday', 6, 1),
(15, 2, 5, '0', 1, 3, '101', '08:30:00', '09:00:00', 'thursday', 6, 1),
(16, 2, 5, '0', 2, 3, '101', '09:00:00', '09:30:00', 'thursday', 6, 1),
(17, 2, 5, '0', 3, 3, '101', '09:30:00', '10:00:00', 'thursday', 6, 1),
(18, 3, 5, '0', 1, 4, '102', '08:30:00', '09:00:00', 'saturday', 6, 1),
(19, 3, 5, '0', 2, 4, '102', '09:00:00', '09:30:00', 'saturday', 6, 1),
(20, 3, 5, '0', 3, 4, '102', '09:30:00', '10:00:00', 'saturday', 6, 1),
(21, 3, 5, '0', 1, 4, '102', '08:30:00', '09:00:00', 'thursday', 6, 1),
(22, 3, 5, '0', 2, 4, '102', '09:00:00', '09:30:00', 'thursday', 6, 1),
(23, 3, 5, '0', 3, 4, '102', '09:30:00', '10:00:00', 'thursday', 6, 1),
(24, 3, 5, '0', 1, 4, '102', '08:30:00', '09:00:00', 'wednesday', 6, 1),
(25, 3, 5, '0', 2, 4, '102', '09:00:00', '09:30:00', 'wednesday', 6, 1),
(26, 3, 5, '0', 3, 4, '102', '09:30:00', '10:00:00', 'wednesday', 6, 1),
(27, 3, 5, '0', 1, 4, '102', '08:30:00', '09:00:00', 'tuesday', 6, 1),
(28, 3, 5, '0', 2, 4, '102', '09:00:00', '09:30:00', 'tuesday', 6, 1),
(29, 3, 5, '0', 3, 4, '102', '09:30:00', '10:00:00', 'tuesday', 6, 1),
(30, 3, 5, '0', 1, 4, '102', '08:30:00', '09:00:00', 'monday', 6, 1),
(31, 3, 5, '0', 2, 4, '102', '09:00:00', '09:30:00', 'monday', 6, 1),
(32, 3, 5, '0', 3, 4, '102', '09:30:00', '10:00:00', 'monday', 6, 1),
(33, 3, 5, '0', 1, 4, '102', '08:30:00', '09:00:00', 'sunday', 6, 1),
(34, 3, 5, '0', 2, 4, '102', '09:00:00', '09:30:00', 'sunday', 6, 1),
(35, 3, 5, '0', 3, 4, '102', '09:30:00', '10:00:00', 'sunday', 6, 1),
(36, 3, 5, '0', 1, 4, '102', '08:00:00', '08:30:00', 'sunday', 6, 1),
(37, 3, 5, '0', 2, 4, '102', '08:30:00', '09:00:00', 'sunday', 6, 1),
(38, 3, 5, '0', 3, 4, '102', '09:00:00', '09:30:00', 'sunday', 6, 1),
(39, 4, 5, '0', 1, 5, '103', '08:00:00', '08:30:00', 'saturday', 6, 1),
(40, 4, 5, '0', 2, 5, '103', '08:30:00', '09:00:00', 'saturday', 6, 1),
(41, 4, 5, '0', 3, 5, '103', '09:00:00', '09:30:00', 'saturday', 6, 1),
(42, 4, 5, '0', 1, 5, '103', '08:30:00', '09:00:00', 'thursday', 6, 1),
(43, 4, 5, '0', 2, 5, '103', '09:00:00', '09:30:00', 'thursday', 6, 1),
(44, 4, 5, '0', 3, 5, '103', '09:30:00', '10:00:00', 'thursday', 6, 1),
(45, 4, 5, '0', 1, 5, '103', '08:30:00', '09:00:00', 'wednesday', 6, 1),
(46, 4, 5, '0', 2, 5, '103', '09:00:00', '09:30:00', 'wednesday', 6, 1),
(47, 4, 5, '0', 3, 5, '103', '09:30:00', '10:00:00', 'wednesday', 6, 1),
(48, 4, 5, '0', 1, 5, '103', '08:00:00', '08:30:00', 'tuesday', 6, 1),
(49, 4, 5, '0', 2, 5, '103', '08:30:00', '09:00:00', 'tuesday', 6, 1),
(50, 4, 5, '0', 3, 5, '103', '09:00:00', '09:30:00', 'tuesday', 6, 1),
(51, 4, 5, '0', 1, 5, '103', '08:00:00', '08:30:00', 'monday', 6, 1),
(52, 4, 5, '0', 2, 5, '103', '08:30:00', '09:00:00', 'monday', 6, 1),
(53, 4, 5, '0', 3, 5, '103', '09:00:00', '09:30:00', 'monday', 6, 1),
(54, 4, 5, '0', 1, 5, '103', '08:00:00', '08:30:00', 'sunday', 6, 1),
(55, 4, 5, '0', 2, 5, '103', '08:30:00', '09:00:00', 'sunday', 6, 1),
(56, 4, 5, '0', 3, 5, '103', '09:00:00', '09:30:00', 'sunday', 6, 1),
(57, 5, 5, '0', 1, 6, '104', '08:00:00', '08:30:00', 'saturday', 6, 1),
(58, 5, 5, '0', 2, 6, '104', '08:30:00', '09:00:00', 'saturday', 6, 1),
(59, 5, 5, '0', 3, 6, '104', '09:00:00', '09:30:00', 'saturday', 6, 1),
(60, 5, 5, '0', 1, 6, '104', '08:00:00', '08:30:00', 'thursday', 6, 1),
(61, 5, 5, '0', 2, 6, '104', '08:30:00', '09:00:00', 'thursday', 6, 1),
(62, 5, 5, '0', 3, 6, '104', '09:00:00', '09:30:00', 'thursday', 6, 1),
(63, 5, 5, '0', 1, 6, '104', '08:00:00', '08:30:00', 'wednesday', 6, 1),
(64, 5, 5, '0', 2, 6, '104', '08:30:00', '09:00:00', 'wednesday', 6, 1),
(65, 5, 5, '0', 3, 6, '104', '09:00:00', '09:30:00', 'wednesday', 6, 1),
(66, 5, 5, '0', 1, 6, '104', '08:00:00', '08:30:00', 'tuesday', 6, 1),
(67, 5, 5, '0', 2, 6, '104', '08:30:00', '09:00:00', 'tuesday', 6, 1),
(68, 5, 5, '0', 3, 6, '104', '09:00:00', '09:30:00', 'tuesday', 6, 1),
(69, 5, 5, '0', 1, 6, '104', '08:00:00', '08:30:00', 'monday', 6, 1),
(70, 5, 5, '0', 2, 6, '104', '08:30:00', '09:00:00', 'monday', 6, 1),
(71, 5, 5, '0', 3, 6, '104', '09:00:00', '09:30:00', 'monday', 6, 1),
(72, 5, 5, '0', 1, 6, '104', '08:00:00', '08:30:00', 'sunday', 6, 1),
(73, 5, 5, '0', 2, 6, '104', '08:30:00', '09:00:00', 'sunday', 6, 1),
(74, 5, 5, '0', 3, 6, '104', '09:00:00', '09:30:00', 'sunday', 6, 1),
(75, 6, 5, '0', 1, 3, '101', '10:00:00', '10:30:00', 'saturday', 6, 1),
(76, 6, 5, '0', 2, 4, '101', '10:50:00', '11:20:00', 'saturday', 6, 1),
(77, 6, 5, '0', 3, 5, '101', '11:40:00', '12:10:00', 'saturday', 6, 1),
(78, 6, 5, '1', 0, 0, '101', '12:30:00', '13:00:00', 'saturday', 6, 1),
(79, 6, 5, '0', 4, 3, '101', '13:20:00', '13:50:00', 'saturday', 6, 1),
(80, 6, 5, '0', 5, 6, '101', '14:10:00', '14:40:00', 'saturday', 6, 1),
(81, 6, 5, '0', 6, 4, '101', '15:00:00', '15:30:00', 'saturday', 6, 1),
(82, 6, 5, '0', 1, 3, '101', '10:00:00', '10:30:00', 'thursday', 6, 1),
(83, 6, 5, '0', 2, 3, '101', '10:50:00', '11:20:00', 'thursday', 6, 1),
(84, 6, 5, '0', 3, 3, '101', '11:40:00', '12:10:00', 'thursday', 6, 1),
(85, 6, 5, '1', 0, 0, '101', '12:30:00', '13:00:00', 'thursday', 6, 1),
(86, 6, 5, '0', 4, 5, '101', '13:20:00', '13:50:00', 'thursday', 6, 1),
(87, 6, 5, '0', 5, 5, '101', '14:10:00', '14:40:00', 'thursday', 6, 1),
(88, 6, 5, '0', 6, 6, '101', '15:00:00', '15:30:00', 'thursday', 6, 1),
(89, 6, 5, '0', 1, 3, '101', '10:00:00', '10:30:00', 'wednesday', 6, 1),
(90, 6, 5, '0', 2, 3, '101', '10:50:00', '11:20:00', 'wednesday', 6, 1),
(91, 6, 5, '0', 3, 6, '101', '11:40:00', '12:10:00', 'wednesday', 6, 1),
(92, 6, 5, '1', 0, 0, '101', '12:30:00', '13:00:00', 'wednesday', 6, 1),
(93, 6, 5, '0', 4, 3, '101', '13:20:00', '13:50:00', 'wednesday', 6, 1),
(94, 6, 5, '0', 5, 6, '101', '14:10:00', '14:40:00', 'wednesday', 6, 1),
(95, 6, 5, '0', 6, 5, '101', '15:00:00', '15:30:00', 'wednesday', 6, 1),
(96, 6, 5, '0', 1, 3, '101', '10:00:00', '10:30:00', 'tuesday', 6, 1),
(97, 6, 5, '0', 2, 3, '101', '10:50:00', '11:20:00', 'tuesday', 6, 1),
(98, 6, 5, '0', 3, 4, '101', '11:40:00', '12:10:00', 'tuesday', 6, 1),
(99, 6, 5, '1', 0, 0, '101', '12:30:00', '13:00:00', 'tuesday', 6, 1),
(100, 6, 5, '0', 5, 6, '101', '13:20:00', '13:50:00', 'tuesday', 6, 1),
(101, 6, 5, '0', 4, 5, '101', '14:10:00', '14:40:00', 'tuesday', 6, 1),
(102, 6, 5, '0', 6, 3, '101', '15:00:00', '15:30:00', 'tuesday', 6, 1),
(103, 6, 5, '0', 1, 3, '1', '10:00:00', '10:30:00', 'monday', 6, 1),
(104, 6, 5, '0', 2, 4, '1', '10:50:00', '11:20:00', 'monday', 6, 1),
(105, 6, 5, '0', 3, 5, '1', '11:40:00', '12:10:00', 'monday', 6, 1),
(106, 6, 5, '1', 0, 0, '1', '12:30:00', '13:00:00', 'monday', 6, 1),
(107, 6, 5, '0', 4, 6, '1', '13:20:00', '13:50:00', 'monday', 6, 1),
(108, 6, 5, '0', 5, 4, '1', '14:10:00', '14:40:00', 'monday', 6, 1),
(109, 6, 5, '0', 6, 6, '1', '15:00:00', '15:30:00', 'monday', 6, 1),
(110, 6, 5, '0', 1, 3, '101', '10:00:00', '10:30:00', 'sunday', 6, 1),
(111, 6, 5, '0', 2, 5, '101', '10:50:00', '11:20:00', 'sunday', 6, 1),
(112, 6, 5, '0', 3, 4, '101', '11:40:00', '12:10:00', 'sunday', 6, 1),
(113, 6, 5, '1', 0, 0, '101', '12:30:00', '13:00:00', 'sunday', 6, 1),
(114, 6, 5, '0', 5, 6, '101', '13:20:00', '13:50:00', 'sunday', 6, 1),
(115, 6, 5, '0', 4, 5, '101', '14:10:00', '14:40:00', 'sunday', 6, 1),
(116, 6, 5, '0', 6, 6, '101', '15:00:00', '15:30:00', 'sunday', 6, 1),
(117, 7, 5, '0', 1, 3, '101', '10:00:00', '10:30:00', 'saturday', 6, 1),
(118, 7, 5, '0', 2, 4, '101', '10:50:00', '11:20:00', 'saturday', 6, 1),
(119, 7, 5, '0', 3, 5, '101', '11:40:00', '12:10:00', 'saturday', 6, 1),
(120, 7, 5, '1', 0, 0, '101', '12:30:00', '13:00:00', 'saturday', 6, 1),
(121, 7, 5, '0', 4, 5, '101', '13:20:00', '13:50:00', 'saturday', 6, 1),
(122, 7, 5, '0', 5, 3, '101', '14:10:00', '14:40:00', 'saturday', 6, 1),
(123, 7, 5, '0', 6, 6, '101', '15:00:00', '15:30:00', 'saturday', 6, 1),
(124, 7, 5, '0', 1, 3, '102', '10:00:00', '10:30:00', 'thursday', 6, 1),
(125, 7, 5, '0', 2, 4, '102', '10:50:00', '11:20:00', 'thursday', 6, 1),
(126, 7, 5, '0', 3, 6, '102', '11:40:00', '12:10:00', 'thursday', 6, 1),
(127, 7, 5, '1', 0, 0, '102', '12:30:00', '13:00:00', 'thursday', 6, 1),
(128, 7, 5, '0', 4, 4, '102', '13:20:00', '13:50:00', 'thursday', 6, 1),
(129, 7, 5, '0', 5, 5, '102', '14:10:00', '14:40:00', 'thursday', 6, 1),
(130, 7, 5, '0', 6, 6, '102', '15:00:00', '15:30:00', 'thursday', 6, 1),
(131, 7, 5, '0', 1, 3, '102', '10:10:00', '10:40:00', 'wednesday', 6, 1),
(132, 7, 5, '0', 2, 4, '102', '11:00:00', '11:30:00', 'wednesday', 6, 1),
(133, 7, 5, '0', 3, 5, '102', '11:50:00', '12:20:00', 'wednesday', 6, 1),
(134, 7, 5, '1', 0, 0, '102', '12:40:00', '13:10:00', 'wednesday', 6, 1),
(135, 7, 5, '0', 4, 5, '102', '13:30:00', '14:00:00', 'wednesday', 6, 1),
(136, 7, 5, '0', 5, 6, '102', '14:20:00', '14:50:00', 'wednesday', 6, 1),
(137, 7, 5, '0', 6, 6, '102', '15:10:00', '15:40:00', 'wednesday', 6, 1),
(138, 7, 5, '0', 1, 3, '103', '10:10:00', '10:40:00', 'tuesday', 6, 1),
(139, 7, 5, '0', 2, 4, '103', '11:00:00', '11:30:00', 'tuesday', 6, 1),
(140, 7, 5, '0', 3, 5, '103', '11:50:00', '12:20:00', 'tuesday', 6, 1),
(141, 7, 5, '1', 0, 0, '103', '12:40:00', '13:10:00', 'tuesday', 6, 1),
(142, 7, 5, '0', 4, 6, '103', '13:30:00', '14:00:00', 'tuesday', 6, 1),
(143, 7, 5, '0', 6, 5, '103', '14:20:00', '14:50:00', 'tuesday', 6, 1),
(144, 7, 5, '0', 5, 6, '103', '15:10:00', '15:40:00', 'tuesday', 6, 1),
(145, 7, 5, '0', 1, 3, '103', '10:10:00', '10:40:00', 'monday', 6, 1),
(146, 7, 5, '0', 2, 4, '103', '11:00:00', '11:30:00', 'monday', 6, 1),
(147, 7, 5, '0', 3, 5, '103', '11:50:00', '12:20:00', 'monday', 6, 1),
(148, 7, 5, '1', 0, 0, '103', '12:40:00', '13:10:00', 'monday', 6, 1),
(149, 7, 5, '0', 4, 5, '103', '13:30:00', '14:00:00', 'monday', 6, 1),
(150, 7, 5, '0', 5, 5, '103', '14:20:00', '14:50:00', 'monday', 6, 1),
(151, 7, 5, '0', 6, 6, '103', '15:10:00', '15:40:00', 'monday', 6, 1),
(152, 7, 5, '0', 1, 3, '103', '10:30:00', '11:00:00', 'sunday', 6, 1),
(153, 7, 5, '0', 2, 5, '103', '11:20:00', '11:50:00', 'sunday', 6, 1),
(154, 7, 5, '0', 3, 5, '103', '12:10:00', '12:40:00', 'sunday', 6, 1),
(155, 7, 5, '1', 0, 0, '103', '13:00:00', '13:30:00', 'sunday', 6, 1),
(156, 7, 5, '0', 4, 5, '103', '13:50:00', '14:20:00', 'sunday', 6, 1),
(157, 7, 5, '0', 5, 6, '103', '14:40:00', '15:10:00', 'sunday', 6, 1),
(158, 7, 5, '0', 6, 4, '103', '15:30:00', '16:00:00', 'sunday', 6, 1),
(159, 8, 5, '0', 1, 4, '105', '10:00:00', '10:30:00', 'saturday', 6, 1),
(160, 8, 5, '0', 2, 5, '105', '10:50:00', '11:20:00', 'saturday', 6, 1),
(161, 8, 5, '0', 3, 3, '105', '11:40:00', '12:10:00', 'saturday', 6, 1),
(162, 8, 5, '1', 0, 0, '105', '12:30:00', '13:00:00', 'saturday', 6, 1),
(163, 8, 5, '0', 4, 3, '105', '13:20:00', '13:50:00', 'saturday', 6, 1),
(164, 8, 5, '0', 5, 5, '105', '14:10:00', '14:40:00', 'saturday', 6, 1),
(165, 8, 5, '0', 6, 6, '105', '15:00:00', '15:30:00', 'saturday', 6, 1),
(166, 8, 5, '0', 1, 3, '106', '10:30:00', '11:00:00', 'thursday', 6, 1),
(167, 8, 5, '0', 2, 4, '106', '11:20:00', '11:50:00', 'thursday', 6, 1),
(168, 8, 5, '0', 3, 5, '106', '12:10:00', '12:40:00', 'thursday', 6, 1),
(169, 8, 5, '1', 0, 0, '106', '13:00:00', '13:30:00', 'thursday', 6, 1),
(170, 8, 5, '0', 4, 6, '106', '13:50:00', '14:20:00', 'thursday', 6, 1),
(171, 8, 5, '0', 5, 5, '106', '14:40:00', '15:10:00', 'thursday', 6, 1),
(172, 8, 5, '0', 6, 4, '106', '15:30:00', '16:00:00', 'thursday', 6, 1),
(173, 8, 5, '0', 1, 3, '106', '10:30:00', '11:00:00', 'wednesday', 6, 1),
(174, 8, 5, '0', 2, 4, '106', '11:20:00', '11:50:00', 'wednesday', 6, 1),
(175, 8, 5, '0', 3, 5, '106', '12:10:00', '12:40:00', 'wednesday', 6, 1),
(176, 8, 5, '1', 0, 0, '106', '13:00:00', '13:30:00', 'wednesday', 6, 1),
(177, 8, 5, '0', 4, 4, '106', '13:50:00', '14:20:00', 'wednesday', 6, 1),
(178, 8, 5, '0', 5, 6, '106', '14:40:00', '15:10:00', 'wednesday', 6, 1),
(179, 8, 5, '0', 6, 4, '106', '15:30:00', '16:00:00', 'wednesday', 6, 1),
(180, 8, 5, '0', 1, 3, '106', '10:00:00', '10:30:00', 'tuesday', 6, 1),
(181, 8, 5, '0', 2, 4, '106', '10:50:00', '11:20:00', 'tuesday', 6, 1),
(182, 8, 5, '0', 3, 5, '106', '11:40:00', '12:10:00', 'tuesday', 6, 1),
(183, 8, 5, '1', 0, 0, '106', '12:30:00', '13:00:00', 'tuesday', 6, 1),
(184, 8, 5, '0', 4, 5, '106', '13:20:00', '13:50:00', 'tuesday', 6, 1),
(185, 8, 5, '0', 5, 6, '106', '14:10:00', '14:40:00', 'tuesday', 6, 1),
(186, 8, 5, '0', 6, 5, '106', '15:00:00', '15:30:00', 'tuesday', 6, 1),
(187, 8, 5, '0', 1, 3, '106', '10:00:00', '10:30:00', 'monday', 6, 1),
(188, 8, 5, '0', 2, 4, '106', '10:50:00', '11:20:00', 'monday', 6, 1),
(189, 8, 5, '0', 3, 5, '106', '11:40:00', '12:10:00', 'monday', 6, 1),
(190, 8, 5, '1', 0, 0, '106', '12:30:00', '13:00:00', 'monday', 6, 1),
(191, 8, 5, '0', 4, 5, '106', '13:20:00', '13:50:00', 'monday', 6, 1),
(192, 8, 5, '0', 5, 6, '106', '14:10:00', '14:40:00', 'monday', 6, 1),
(193, 8, 5, '0', 6, 6, '106', '15:00:00', '15:30:00', 'monday', 6, 1),
(194, 8, 5, '0', 1, 3, '106', '10:00:00', '10:30:00', 'sunday', 6, 1),
(195, 8, 5, '0', 2, 5, '106', '10:50:00', '11:20:00', 'sunday', 6, 1),
(196, 8, 5, '0', 3, 5, '106', '11:40:00', '12:10:00', 'sunday', 6, 1),
(197, 8, 5, '1', 0, 0, '106', '12:30:00', '13:00:00', 'sunday', 6, 1),
(198, 8, 5, '0', 5, 5, '106', '13:20:00', '13:50:00', 'sunday', 6, 1),
(199, 8, 5, '0', 4, 6, '106', '14:10:00', '14:40:00', 'sunday', 6, 1),
(200, 8, 5, '0', 6, 4, '106', '15:00:00', '15:30:00', 'sunday', 6, 1),
(201, 9, 5, '0', 1, 4, '107', '10:00:00', '10:30:00', 'saturday', 6, 1),
(202, 9, 5, '0', 2, 4, '107', '10:50:00', '11:20:00', 'saturday', 6, 1),
(203, 9, 5, '0', 3, 6, '107', '11:40:00', '12:10:00', 'saturday', 6, 1),
(204, 9, 5, '1', 0, 0, '107', '12:30:00', '13:00:00', 'saturday', 6, 1),
(205, 9, 5, '0', 4, 4, '107', '13:20:00', '13:50:00', 'saturday', 6, 1),
(206, 9, 5, '0', 5, 5, '107', '14:10:00', '14:40:00', 'saturday', 6, 1),
(207, 9, 5, '0', 6, 6, '107', '15:00:00', '15:30:00', 'saturday', 6, 1),
(208, 9, 5, '0', 1, 4, '107', '10:00:00', '10:30:00', 'thursday', 6, 1),
(209, 9, 5, '0', 2, 5, '107', '10:50:00', '11:20:00', 'thursday', 6, 1),
(210, 9, 5, '0', 3, 6, '107', '11:40:00', '12:10:00', 'thursday', 6, 1),
(211, 9, 5, '1', 0, 0, '107', '12:30:00', '13:00:00', 'thursday', 6, 1),
(212, 9, 5, '0', 4, 4, '107', '13:20:00', '13:50:00', 'thursday', 6, 1),
(213, 9, 5, '0', 5, 5, '107', '14:10:00', '14:40:00', 'thursday', 6, 1),
(214, 9, 5, '0', 6, 6, '107', '15:00:00', '15:30:00', 'thursday', 6, 1),
(215, 9, 5, '0', 1, 4, '107', '10:00:00', '10:30:00', 'thursday', 6, 1),
(216, 9, 5, '0', 2, 5, '107', '10:50:00', '11:20:00', 'thursday', 6, 1),
(217, 9, 5, '0', 3, 6, '107', '11:40:00', '12:10:00', 'thursday', 6, 1),
(218, 9, 5, '1', 0, 0, '107', '12:30:00', '13:00:00', 'thursday', 6, 1),
(219, 9, 5, '0', 4, 4, '107', '13:20:00', '13:50:00', 'thursday', 6, 1),
(220, 9, 5, '0', 5, 5, '107', '14:10:00', '14:40:00', 'thursday', 6, 1),
(221, 9, 5, '0', 6, 6, '107', '15:00:00', '15:30:00', 'thursday', 6, 1),
(222, 9, 5, '0', 1, 3, '107', '10:05:00', '10:35:00', 'wednesday', 6, 1),
(223, 9, 5, '0', 2, 5, '107', '10:55:00', '11:25:00', 'wednesday', 6, 1),
(224, 9, 5, '0', 2, 6, '107', '11:45:00', '12:15:00', 'wednesday', 6, 1),
(225, 9, 5, '1', 0, 0, '107', '12:35:00', '13:05:00', 'wednesday', 6, 1),
(226, 9, 5, '0', 3, 6, '107', '13:25:00', '13:55:00', 'wednesday', 6, 1),
(227, 9, 5, '0', 5, 6, '107', '14:15:00', '14:45:00', 'wednesday', 6, 1),
(228, 9, 5, '0', 4, 4, '107', '15:05:00', '15:35:00', 'wednesday', 6, 1),
(229, 9, 5, '0', 1, 3, '107', '10:05:00', '10:35:00', 'tuesday', 6, 1),
(230, 9, 5, '0', 2, 4, '107', '10:55:00', '11:25:00', 'tuesday', 6, 1),
(231, 9, 5, '0', 3, 6, '107', '11:45:00', '12:15:00', 'tuesday', 6, 1),
(232, 9, 5, '1', 0, 0, '107', '12:35:00', '13:05:00', 'tuesday', 6, 1),
(233, 9, 5, '0', 4, 4, '107', '13:25:00', '13:55:00', 'tuesday', 6, 1),
(234, 9, 5, '0', 5, 5, '107', '14:15:00', '14:45:00', 'tuesday', 6, 1),
(235, 9, 5, '0', 6, 6, '107', '15:05:00', '15:35:00', 'tuesday', 6, 1),
(236, 9, 5, '0', 1, 3, '107', '10:05:00', '10:35:00', 'monday', 6, 1),
(237, 9, 5, '0', 2, 4, '107', '10:55:00', '11:25:00', 'monday', 6, 1),
(238, 9, 5, '0', 3, 5, '107', '11:45:00', '12:15:00', 'monday', 6, 1),
(239, 9, 5, '1', 0, 0, '107', '12:35:00', '13:05:00', 'monday', 6, 1),
(240, 9, 5, '0', 5, 6, '107', '13:25:00', '13:55:00', 'monday', 6, 1),
(241, 9, 5, '0', 4, 5, '107', '14:15:00', '14:45:00', 'monday', 6, 1),
(242, 9, 5, '0', 6, 6, '107', '15:05:00', '15:35:00', 'monday', 6, 1),
(243, 9, 5, '0', 1, 3, '107', '10:05:00', '10:35:00', 'sunday', 6, 1),
(244, 9, 5, '0', 2, 5, '107', '10:55:00', '11:25:00', 'sunday', 6, 1),
(245, 9, 5, '0', 3, 5, '107', '11:45:00', '12:15:00', 'sunday', 6, 1),
(246, 9, 5, '1', 0, 0, '107', '12:35:00', '13:05:00', 'sunday', 6, 1),
(247, 9, 5, '0', 4, 6, '107', '13:25:00', '13:55:00', 'sunday', 6, 1),
(248, 9, 5, '0', 5, 4, '107', '14:15:00', '14:45:00', 'sunday', 6, 1),
(249, 9, 5, '0', 6, 4, '107', '15:05:00', '15:35:00', 'sunday', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_exam`
--

CREATE TABLE `timetable_exam` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `time_start` varchar(20) NOT NULL,
  `time_end` varchar(20) NOT NULL,
  `mark_distribution` text NOT NULL,
  `hall_id` int(11) NOT NULL,
  `exam_date` date NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `timetable_exam`
--

INSERT INTO `timetable_exam` (`id`, `exam_id`, `class_id`, `section_id`, `subject_id`, `time_start`, `time_end`, `mark_distribution`, `hall_id`, `exam_date`, `branch_id`, `session_id`, `created_at`, `updated_at`) VALUES
(4, 3, 8, 5, 1, '11:05 AM', '2:05 PM', '{\"1\":{\"full_mark\":\"70\",\"pass_mark\":\"22\"},\"2\":{\"full_mark\":\"30\",\"pass_mark\":\"11\"}}', 2, '2025-01-03', 1, 6, '2025-01-02 19:02:33', NULL),
(5, 3, 8, 5, 2, '11:05 AM', '2:05 PM', '{\"1\":{\"full_mark\":\"70\",\"pass_mark\":\"22\"},\"2\":{\"full_mark\":\"30\",\"pass_mark\":\"11\"}}', 2, '2025-01-04', 1, 6, '2025-01-02 19:02:33', NULL),
(6, 3, 8, 5, 3, '11:05 AM', '2:05 PM', '{\"1\":{\"full_mark\":\"70\",\"pass_mark\":\"22\"},\"2\":{\"full_mark\":\"30\",\"pass_mark\":\"11\"}}', 2, '2025-01-05', 1, 6, '2025-01-02 19:02:34', NULL),
(7, 3, 8, 5, 4, '11:05 AM', '2:05 PM', '{\"1\":{\"full_mark\":\"70\",\"pass_mark\":\"22\"},\"2\":{\"full_mark\":\"30\",\"pass_mark\":\"11\"}}', 2, '2025-01-06', 1, 6, '2025-01-02 19:02:34', NULL),
(8, 3, 8, 5, 5, '11:05 AM', '2:05 PM', '{\"1\":{\"full_mark\":\"70\",\"pass_mark\":\"22\"},\"2\":{\"full_mark\":\"30\",\"pass_mark\":\"11\"}}', 2, '2025-01-07', 1, 6, '2025-01-02 19:02:34', NULL),
(9, 3, 8, 5, 6, '11:05 AM', '2:05 PM', '{\"1\":{\"full_mark\":\"70\",\"pass_mark\":\"22\"},\"2\":{\"full_mark\":\"30\",\"pass_mark\":\"11\"}}', 2, '2025-01-08', 1, 6, '2025-01-02 19:02:34', NULL),
(10, 3, 9, 5, 1, '12:55 AM', '3:55 AM', '{\"1\":{\"full_mark\":\"50\",\"pass_mark\":\"20\"},\"2\":{\"full_mark\":\"25\",\"pass_mark\":\"10\"},\"3\":{\"full_mark\":\"25\",\"pass_mark\":\"10\"}}', 2, '2026-04-28', 1, 6, '2026-04-27 18:57:32', NULL),
(11, 3, 9, 5, 2, '12:55 AM', '3:55 AM', '{\"1\":{\"full_mark\":\"50\",\"pass_mark\":\"20\"},\"2\":{\"full_mark\":\"25\",\"pass_mark\":\"10\"},\"3\":{\"full_mark\":\"25\",\"pass_mark\":\"10\"}}', 2, '2026-04-29', 1, 6, '2026-04-27 18:57:32', NULL),
(12, 3, 9, 5, 3, '12:55 AM', '3:55 AM', '{\"1\":{\"full_mark\":\"50\",\"pass_mark\":\"20\"},\"2\":{\"full_mark\":\"25\",\"pass_mark\":\"10\"},\"3\":{\"full_mark\":\"25\",\"pass_mark\":\"10\"}}', 2, '2026-04-30', 1, 6, '2026-04-27 18:57:32', NULL),
(13, 3, 9, 5, 4, '12:55 AM', '3:55 AM', '{\"1\":{\"full_mark\":\"50\",\"pass_mark\":\"20\"},\"2\":{\"full_mark\":\"25\",\"pass_mark\":\"10\"},\"3\":{\"full_mark\":\"25\",\"pass_mark\":\"10\"}}', 2, '2026-05-01', 1, 6, '2026-04-27 18:57:32', NULL),
(14, 3, 9, 5, 5, '12:55 AM', '3:55 AM', '{\"1\":{\"full_mark\":\"50\",\"pass_mark\":\"20\"},\"2\":{\"full_mark\":\"25\",\"pass_mark\":\"10\"},\"3\":{\"full_mark\":\"25\",\"pass_mark\":\"10\"}}', 2, '2026-05-02', 1, 6, '2026-04-27 18:57:32', NULL),
(15, 3, 9, 5, 6, '12:55 AM', '3:55 AM', '{\"1\":{\"full_mark\":\"50\",\"pass_mark\":\"20\"},\"2\":{\"full_mark\":\"25\",\"pass_mark\":\"10\"},\"3\":{\"full_mark\":\"25\",\"pass_mark\":\"10\"}}', 2, '2026-05-03', 1, 6, '2026-04-27 18:57:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `account_id` varchar(20) NOT NULL,
  `voucher_head_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `dr` decimal(18,2) NOT NULL DEFAULT 0.00,
  `cr` decimal(18,2) NOT NULL DEFAULT 0.00,
  `bal` decimal(18,2) NOT NULL DEFAULT 0.00,
  `date` date NOT NULL,
  `pay_via` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `attachments` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `account_id`, `voucher_head_id`, `type`, `category`, `ref`, `amount`, `dr`, `cr`, `bal`, `date`, `pay_via`, `description`, `attachments`, `branch_id`, `system`, `created_at`, `updated_at`) VALUES
(1, '1', 0, 'deposit', '', '', 1050.00, 0.00, 1050.00, 1050.00, '2025-01-02', '', 'Opening Balance', '', 1, 0, '2025-01-02 17:06:49', NULL),
(2, '2', 4, 'deposit', '', '55544', 1020.00, 0.00, 1020.00, 1020.00, '2025-01-02', '1', '', '', 1, 0, '2025-01-02 17:09:19', NULL),
(3, '1', 1, 'expense', '', '', 200.00, 200.00, 0.00, 850.00, '2025-01-02', '1', '', '', 1, 0, '2025-01-02 17:09:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions_links`
--

CREATE TABLE `transactions_links` (
  `id` int(11) NOT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `deposit` tinyint(3) DEFAULT NULL,
  `expense` tinyint(3) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions_links_details`
--

CREATE TABLE `transactions_links_details` (
  `id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `transactions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_assign`
--

CREATE TABLE `transport_assign` (
  `id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `stoppage_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_route`
--

CREATE TABLE `transport_route` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `start_place` longtext NOT NULL,
  `remarks` longtext NOT NULL,
  `stop_place` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_stoppage`
--

CREATE TABLE `transport_stoppage` (
  `id` int(11) NOT NULL,
  `stop_position` varchar(255) NOT NULL,
  `stop_time` time NOT NULL,
  `route_fare` decimal(18,2) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_vehicle`
--

CREATE TABLE `transport_vehicle` (
  `id` int(11) NOT NULL,
  `vehicle_no` longtext NOT NULL,
  `capacity` longtext NOT NULL,
  `insurance_renewal` longtext NOT NULL,
  `driver_name` longtext NOT NULL,
  `driver_phone` longtext NOT NULL,
  `driver_license` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_log`
--

CREATE TABLE `visitor_log` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `purpose_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `entry_time` time DEFAULT NULL,
  `exit_time` time DEFAULT NULL,
  `number_of_visitor` float DEFAULT NULL,
  `id_number` varchar(255) DEFAULT NULL,
  `token_pass` varchar(255) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_purpose`
--

CREATE TABLE `visitor_purpose` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_head`
--

CREATE TABLE `voucher_head` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `system` tinyint(1) DEFAULT 0,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `voucher_head`
--

INSERT INTO `voucher_head` (`id`, `name`, `type`, `system`, `branch_id`) VALUES
(1, 'Office Cleaning', 'expense', 0, 1),
(2, 'Tea Bill', 'expense', 0, 1),
(3, 'Convence', 'expense', 0, 1),
(4, 'Travel Bus', 'income', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_agent`
--

CREATE TABLE `whatsapp_agent` (
  `id` int(11) NOT NULL,
  `agent_name` varchar(255) NOT NULL,
  `agent_image` varchar(255) NOT NULL,
  `agent_designation` varchar(255) NOT NULL,
  `whataspp_number` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `weekend` varchar(20) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `whatsapp_agent`
--

INSERT INTO `whatsapp_agent` (`id`, `agent_name`, `agent_image`, `agent_designation`, `whataspp_number`, `start_time`, `end_time`, `weekend`, `enable`, `branch_id`, `created_at`) VALUES
(1, 'মোঃ আবু সাইদ', '6d3a9f3b8ff31b81fb84c4d61ddd3fc1.jpg', 'প্রিন্সিপাল', '+8801775457008', '10:30:00', '22:30:00', '0', 1, 1, '2025-01-01 10:22:10');

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_chat`
--

CREATE TABLE `whatsapp_chat` (
  `id` int(11) NOT NULL,
  `header_title` varchar(255) NOT NULL,
  `subtitle` varchar(355) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `popup_message` varchar(255) DEFAULT NULL,
  `frontend_enable_chat` tinyint(1) NOT NULL DEFAULT 0,
  `backend_enable_chat` tinyint(1) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `whatsapp_chat`
--

INSERT INTO `whatsapp_chat` (`id`, `header_title`, `subtitle`, `footer_text`, `popup_message`, `frontend_enable_chat`, `backend_enable_chat`, `branch_id`, `created_at`) VALUES
(1, 'Start a Conversation', 'Start a Conversation', 'Use this feature to chat with our agent.', NULL, 1, 1, 1, '2022-02-16 13:49:13'),
(2, 'Conversation', 'Hi! Click one of our members below to chat on WhatsApp ;)', 'Use this feature to chat with our agent.', NULL, 1, 1, 2, '2022-02-16 13:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `zoom_own_api`
--

CREATE TABLE `zoom_own_api` (
  `id` int(11) NOT NULL,
  `user_type` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `zoom_api_key` varchar(255) NOT NULL,
  `zoom_api_secret` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_rms_1` (`branch_id`);

--
-- Indexes for table `addon`
--
ALTER TABLE `addon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advance_salary`
--
ALTER TABLE `advance_salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advance_salary_rms_1` (`branch_id`),
  ADD KEY `advance_salary_rms_2` (`staff_id`);

--
-- Indexes for table `alumni_events`
--
ALTER TABLE `alumni_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `alumni_events_rms_1` (`branch_id`);

--
-- Indexes for table `alumni_students`
--
ALTER TABLE `alumni_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumni_students_rms_1` (`enroll_id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachments_rms_1` (`session_id`),
  ADD KEY `attachments_rms_2` (`branch_id`);

--
-- Indexes for table `attachments_type`
--
ALTER TABLE `attachments_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachments_type_rms_1` (`branch_id`);

--
-- Indexes for table `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`id`),
  ADD KEY `award_rms_1` (`branch_id`),
  ADD KEY `award_rms_2` (`session_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_rms_1` (`branch_id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_category_rms_1` (`branch_id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_issues_rms1` (`branch_id`),
  ADD KEY `book_issues_rms2` (`book_id`),
  ADD KEY `book_issues_rms3` (`session_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulk_msg_category`
--
ALTER TABLE `bulk_msg_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bulk_msg_category_rms_1` (`branch_id`);

--
-- Indexes for table `bulk_sms_email`
--
ALTER TABLE `bulk_sms_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bulk_sms_email_rms_1` (`branch_id`);

--
-- Indexes for table `call_log`
--
ALTER TABLE `call_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `call_log_rms_1` (`branch_id`);

--
-- Indexes for table `call_purpose`
--
ALTER TABLE `call_purpose`
  ADD PRIMARY KEY (`id`),
  ADD KEY `call_purpose_rms_1` (`branch_id`);

--
-- Indexes for table `card_templete`
--
ALTER TABLE `card_templete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_templete_rms_1` (`branch_id`);

--
-- Indexes for table `certificates_templete`
--
ALTER TABLE `certificates_templete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificates_templete_rms_1` (`branch_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_rms_1` (`branch_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_rms_1` (`branch_id`);

--
-- Indexes for table `complaint_type`
--
ALTER TABLE `complaint_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_type_rms_1` (`branch_id`);

--
-- Indexes for table `custom_field`
--
ALTER TABLE `custom_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields_online_values`
--
ALTER TABLE `custom_fields_online_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relid` (`relid`),
  ADD KEY `fieldid` (`field_id`);

--
-- Indexes for table `custom_fields_values`
--
ALTER TABLE `custom_fields_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relid` (`relid`),
  ADD KEY `fieldid` (`field_id`);

--
-- Indexes for table `disable_reason`
--
ALTER TABLE `disable_reason`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disable_reason_rms_1` (`branch_id`);

--
-- Indexes for table `disable_reason_details`
--
ALTER TABLE `disable_reason_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_config`
--
ALTER TABLE `email_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates_details`
--
ALTER TABLE `email_templates_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enquiry_rms_1` (`branch_id`);

--
-- Indexes for table `enquiry_follow_up`
--
ALTER TABLE `enquiry_follow_up`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enquiry_follow_up_rms_1` (`enquiry_id`);

--
-- Indexes for table `enquiry_reference`
--
ALTER TABLE `enquiry_reference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enquiry_reference_rms_1` (`branch_id`);

--
-- Indexes for table `enquiry_response`
--
ALTER TABLE `enquiry_response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enquiry_response_rms_1` (`branch_id`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enroll_rms_1` (`student_id`),
  ADD KEY `enroll_rms_2` (`session_id`),
  ADD KEY `enroll_rms_3` (`class_id`),
  ADD KEY `enroll_rms_4` (`section_id`),
  ADD KEY `enroll_rms_5` (`branch_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_rms_1` (`branch_id`),
  ADD KEY `event_rms_2` (`session_id`);

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_types_rms_1` (`branch_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_rms_1` (`branch_id`),
  ADD KEY `exam_rms_2` (`session_id`);

--
-- Indexes for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_attendance_rms_1` (`branch_id`),
  ADD KEY `exam_attendance_rms_2` (`exam_id`),
  ADD KEY `exam_attendance_rms_3` (`student_id`);

--
-- Indexes for table `exam_hall`
--
ALTER TABLE `exam_hall`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_hall_rms_1` (`branch_id`);

--
-- Indexes for table `exam_mark_distribution`
--
ALTER TABLE `exam_mark_distribution`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_mark_distribution_rms_1` (`branch_id`);

--
-- Indexes for table `exam_rank`
--
ALTER TABLE `exam_rank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_class_batch_exam_id` (`exam_id`),
  ADD KEY `student_id` (`enroll_id`);

--
-- Indexes for table `exam_term`
--
ALTER TABLE `exam_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_reminder_rms_1` (`branch_id`);

--
-- Indexes for table `fees_type`
--
ALTER TABLE `fees_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_allocation`
--
ALTER TABLE `fee_allocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_allocation_rsm_1` (`student_id`),
  ADD KEY `fee_allocation_rsm_2` (`branch_id`),
  ADD KEY `fee_allocation_rsm_3` (`session_id`);

--
-- Indexes for table `fee_fine`
--
ALTER TABLE `fee_fine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_fine_rms_2` (`group_id`),
  ADD KEY `fee_fine_rms_3` (`session_id`),
  ADD KEY `fee_fine_rms_4` (`branch_id`);

--
-- Indexes for table `fee_groups`
--
ALTER TABLE `fee_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_groups_rms_1` (`branch_id`),
  ADD KEY `fee_groups_rms_2` (`session_id`);

--
-- Indexes for table `fee_groups_details`
--
ALTER TABLE `fee_groups_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_groups_details_rms_1` (`fee_groups_id`),
  ADD KEY `fee_groups_details_rms_2` (`fee_type_id`);

--
-- Indexes for table `fee_payment_history`
--
ALTER TABLE `fee_payment_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_payment_history_rms_1` (`allocation_id`),
  ADD KEY `fee_payment_history_rms_2` (`type_id`);

--
-- Indexes for table `front_cms_about`
--
ALTER TABLE `front_cms_about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_admission`
--
ALTER TABLE `front_cms_admission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_admitcard`
--
ALTER TABLE `front_cms_admitcard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_certificates`
--
ALTER TABLE `front_cms_certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_contact`
--
ALTER TABLE `front_cms_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_events`
--
ALTER TABLE `front_cms_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_exam_results`
--
ALTER TABLE `front_cms_exam_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_faq`
--
ALTER TABLE `front_cms_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_faq_list`
--
ALTER TABLE `front_cms_faq_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_gallery`
--
ALTER TABLE `front_cms_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_gallery_category`
--
ALTER TABLE `front_cms_gallery_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_gallery_content`
--
ALTER TABLE `front_cms_gallery_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_home`
--
ALTER TABLE `front_cms_home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_home_seo`
--
ALTER TABLE `front_cms_home_seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menu`
--
ALTER TABLE `front_cms_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menu_visible`
--
ALTER TABLE `front_cms_menu_visible`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_news`
--
ALTER TABLE `front_cms_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_news_list`
--
ALTER TABLE `front_cms_news_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_cms_news_list_rms_1` (`branch_id`);

--
-- Indexes for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_services`
--
ALTER TABLE `front_cms_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_services_list`
--
ALTER TABLE `front_cms_services_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_setting`
--
ALTER TABLE `front_cms_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_teachers`
--
ALTER TABLE `front_cms_teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_testimonial`
--
ALTER TABLE `front_cms_testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grade_rms_1` (`branch_id`);

--
-- Indexes for table `hall_allocation`
--
ALTER TABLE `hall_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homework_rms_1` (`branch_id`),
  ADD KEY `homework_rms_2` (`class_id`),
  ADD KEY `homework_rms_3` (`section_id`),
  ADD KEY `homework_rms_4` (`session_id`),
  ADD KEY `homework_rms_5` (`subject_id`);

--
-- Indexes for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homework_evaluation_rms_1` (`homework_id`);

--
-- Indexes for table `homework_submit`
--
ALTER TABLE `homework_submit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homework_submit_rms_1` (`homework_id`),
  ADD KEY `homework_submit_rms_2` (`student_id`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hostel_rms_1` (`branch_id`);

--
-- Indexes for table `hostel_category`
--
ALTER TABLE `hostel_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel_room`
--
ALTER TABLE `hostel_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_list`
--
ALTER TABLE `language_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_application`
--
ALTER TABLE `leave_application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_category`
--
ALTER TABLE `leave_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_class`
--
ALTER TABLE `live_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_class_config`
--
ALTER TABLE `live_class_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_class_reports`
--
ALTER TABLE `live_class_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_credential`
--
ALTER TABLE `login_credential`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_log`
--
ALTER TABLE `login_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_log_rms_1` (`branch_id`);

--
-- Indexes for table `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marksheet_template`
--
ALTER TABLE `marksheet_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificates_templete_rms_1` (`branch_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_reply`
--
ALTER TABLE `message_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules_manage`
--
ALTER TABLE `modules_manage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `offline_fees_payments`
--
ALTER TABLE `offline_fees_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fees_master_id` (`fees_allocation_id`),
  ADD KEY `fee_groups_feetype_id` (`fees_type_id`),
  ADD KEY `offline_fees_payments_ibfk_4` (`approved_by`),
  ADD KEY `student_session_id` (`student_enroll_id`);

--
-- Indexes for table `offline_payment_types`
--
ALTER TABLE `offline_payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_admission`
--
ALTER TABLE `online_admission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_admission_rms_1` (`branch_id`);

--
-- Indexes for table `online_admission_fields`
--
ALTER TABLE `online_admission_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam`
--
ALTER TABLE `online_exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `online_exam_answer`
--
ALTER TABLE `online_exam_answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam_attempts`
--
ALTER TABLE `online_exam_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam_payment`
--
ALTER TABLE `online_exam_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam_submitted`
--
ALTER TABLE `online_exam_submitted`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_config`
--
ALTER TABLE `payment_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_salary_stipend`
--
ALTER TABLE `payment_salary_stipend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip`
--
ALTER TABLE `payslip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip_details`
--
ALTER TABLE `payslip_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_modules`
--
ALTER TABLE `permission_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `postal_record`
--
ALTER TABLE `postal_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_rms_1` (`branch_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_rms_1` (`branch_id`);

--
-- Indexes for table `product_issues`
--
ALTER TABLE `product_issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_issues_rms_1` (`branch_id`);

--
-- Indexes for table `product_issues_details`
--
ALTER TABLE `product_issues_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_issues_details_rms_1` (`product_id`);

--
-- Indexes for table `product_store`
--
ALTER TABLE `product_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_supplier_rms_1` (`branch_id`);

--
-- Indexes for table `product_unit`
--
ALTER TABLE `product_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion_history`
--
ALTER TABLE `promotion_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promotion_history_rms_1` (`student_id`);

--
-- Indexes for table `purchase_bill`
--
ALTER TABLE `purchase_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_bill_rms_1` (`branch_id`);

--
-- Indexes for table `purchase_bill_details`
--
ALTER TABLE `purchase_bill_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_bill_details_rms_1` (`product_id`);

--
-- Indexes for table `purchase_payment_history`
--
ALTER TABLE `purchase_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions_manage`
--
ALTER TABLE `questions_manage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_id` (`onlineexam_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `question_group`
--
ALTER TABLE `question_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rm_sessions`
--
ALTER TABLE `rm_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_template`
--
ALTER TABLE `salary_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_template_details`
--
ALTER TABLE `salary_template_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_bill`
--
ALTER TABLE `sales_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_bill_rms_1` (`branch_id`);

--
-- Indexes for table `sales_bill_details`
--
ALTER TABLE `sales_bill_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_bill_details_rms_1` (`product_id`);

--
-- Indexes for table `sales_payment_history`
--
ALTER TABLE `sales_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schoolyear`
--
ALTER TABLE `schoolyear`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections_allocation`
--
ALTER TABLE `sections_allocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_allocation_rms_1` (`class_id`),
  ADD KEY `sections_allocation_rms_2` (`section_id`);

--
-- Indexes for table `sms_api`
--
ALTER TABLE `sms_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_credential`
--
ALTER TABLE `sms_credential`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_template`
--
ALTER TABLE `sms_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_template_details`
--
ALTER TABLE `sms_template_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_attendance_rms_1` (`branch_id`),
  ADD KEY `staff_attendance_rms_2` (`staff_id`);

--
-- Indexes for table `staff_bank_account`
--
ALTER TABLE `staff_bank_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_department`
--
ALTER TABLE `staff_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_designation`
--
ALTER TABLE `staff_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_documents`
--
ALTER TABLE `staff_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_privileges`
--
ALTER TABLE `staff_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_admission_fields`
--
ALTER TABLE `student_admission_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_attendance_rms_1` (`branch_id`),
  ADD KEY `student_attendance_rms_2` (`enroll_id`);

--
-- Indexes for table `student_category`
--
ALTER TABLE `student_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_documents`
--
ALTER TABLE `student_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fields`
--
ALTER TABLE `student_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_profile_fields`
--
ALTER TABLE `student_profile_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_subject_attendance`
--
ALTER TABLE `student_subject_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendence_type_id` (`status`),
  ADD KEY `student_session_id` (`enroll_id`),
  ADD KEY `subject_timetable_id` (`subject_timetable_id`),
  ADD KEY `student_subject_attendance_rms_1` (`branch_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_assign`
--
ALTER TABLE `subject_assign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_assign_rms_1` (`branch_id`),
  ADD KEY `subject_assign_rms_2` (`session_id`),
  ADD KEY `subject_assign_rms_3` (`class_id`),
  ADD KEY `subject_assign_rms_4` (`section_id`),
  ADD KEY `subject_assign_rms_5` (`subject_id`);

--
-- Indexes for table `teacher_allocation`
--
ALTER TABLE `teacher_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_note`
--
ALTER TABLE `teacher_note`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_settings`
--
ALTER TABLE `theme_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable_class`
--
ALTER TABLE `timetable_class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timetable_class_rms_1` (`branch_id`),
  ADD KEY `timetable_class_rms_2` (`class_id`),
  ADD KEY `timetable_class_rms_3` (`section_id`),
  ADD KEY `timetable_class_rms_4` (`session_id`);

--
-- Indexes for table `timetable_exam`
--
ALTER TABLE `timetable_exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timetable_exam_rms_1` (`branch_id`),
  ADD KEY `timetable_exam_rms_2` (`exam_id`),
  ADD KEY `timetable_exam_rms_3` (`class_id`),
  ADD KEY `timetable_exam_rms_4` (`section_id`),
  ADD KEY `timetable_exam_rms_5` (`session_id`),
  ADD KEY `timetable_exam_rms_6` (`subject_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_rms_1` (`branch_id`);

--
-- Indexes for table `transactions_links`
--
ALTER TABLE `transactions_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_links_rms_1` (`branch_id`);

--
-- Indexes for table `transactions_links_details`
--
ALTER TABLE `transactions_links_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_assign`
--
ALTER TABLE `transport_assign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_assign_rms_1` (`branch_id`);

--
-- Indexes for table `transport_route`
--
ALTER TABLE `transport_route`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_route_rms_1` (`branch_id`);

--
-- Indexes for table `transport_stoppage`
--
ALTER TABLE `transport_stoppage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_stoppage_rms_1` (`branch_id`);

--
-- Indexes for table `transport_vehicle`
--
ALTER TABLE `transport_vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_vehicle_rms_1` (`branch_id`);

--
-- Indexes for table `visitor_log`
--
ALTER TABLE `visitor_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_log_rms_1` (`branch_id`);

--
-- Indexes for table `visitor_purpose`
--
ALTER TABLE `visitor_purpose`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_purpose_rms_1` (`branch_id`);

--
-- Indexes for table `voucher_head`
--
ALTER TABLE `voucher_head`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voucher_head_rms_1` (`branch_id`);

--
-- Indexes for table `whatsapp_agent`
--
ALTER TABLE `whatsapp_agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whatsapp_chat`
--
ALTER TABLE `whatsapp_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zoom_own_api`
--
ALTER TABLE `zoom_own_api`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `addon`
--
ALTER TABLE `addon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advance_salary`
--
ALTER TABLE `advance_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alumni_events`
--
ALTER TABLE `alumni_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alumni_students`
--
ALTER TABLE `alumni_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments_type`
--
ALTER TABLE `attachments_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award`
--
ALTER TABLE `award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bulk_msg_category`
--
ALTER TABLE `bulk_msg_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bulk_sms_email`
--
ALTER TABLE `bulk_sms_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_log`
--
ALTER TABLE `call_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_purpose`
--
ALTER TABLE `call_purpose`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `card_templete`
--
ALTER TABLE `card_templete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `certificates_templete`
--
ALTER TABLE `certificates_templete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint_type`
--
ALTER TABLE `complaint_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field`
--
ALTER TABLE `custom_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_online_values`
--
ALTER TABLE `custom_fields_online_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `custom_fields_values`
--
ALTER TABLE `custom_fields_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disable_reason`
--
ALTER TABLE `disable_reason`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `disable_reason_details`
--
ALTER TABLE `disable_reason_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `email_templates_details`
--
ALTER TABLE `email_templates_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_follow_up`
--
ALTER TABLE `enquiry_follow_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_reference`
--
ALTER TABLE `enquiry_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_response`
--
ALTER TABLE `enquiry_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enroll`
--
ALTER TABLE `enroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_hall`
--
ALTER TABLE `exam_hall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam_mark_distribution`
--
ALTER TABLE `exam_mark_distribution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam_rank`
--
ALTER TABLE `exam_rank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_term`
--
ALTER TABLE `exam_term`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fees_type`
--
ALTER TABLE `fees_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fee_allocation`
--
ALTER TABLE `fee_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fee_fine`
--
ALTER TABLE `fee_fine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_groups`
--
ALTER TABLE `fee_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fee_groups_details`
--
ALTER TABLE `fee_groups_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fee_payment_history`
--
ALTER TABLE `fee_payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `front_cms_about`
--
ALTER TABLE `front_cms_about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_admission`
--
ALTER TABLE `front_cms_admission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_admitcard`
--
ALTER TABLE `front_cms_admitcard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_certificates`
--
ALTER TABLE `front_cms_certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_contact`
--
ALTER TABLE `front_cms_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_events`
--
ALTER TABLE `front_cms_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_exam_results`
--
ALTER TABLE `front_cms_exam_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_faq`
--
ALTER TABLE `front_cms_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_faq_list`
--
ALTER TABLE `front_cms_faq_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `front_cms_gallery`
--
ALTER TABLE `front_cms_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_gallery_category`
--
ALTER TABLE `front_cms_gallery_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_gallery_content`
--
ALTER TABLE `front_cms_gallery_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `front_cms_home`
--
ALTER TABLE `front_cms_home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `front_cms_home_seo`
--
ALTER TABLE `front_cms_home_seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_menu`
--
ALTER TABLE `front_cms_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `front_cms_menu_visible`
--
ALTER TABLE `front_cms_menu_visible`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `front_cms_news`
--
ALTER TABLE `front_cms_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_news_list`
--
ALTER TABLE `front_cms_news_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_services`
--
ALTER TABLE `front_cms_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_services_list`
--
ALTER TABLE `front_cms_services_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `front_cms_setting`
--
ALTER TABLE `front_cms_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_teachers`
--
ALTER TABLE `front_cms_teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_testimonial`
--
ALTER TABLE `front_cms_testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hall_allocation`
--
ALTER TABLE `hall_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homework`
--
ALTER TABLE `homework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homework_submit`
--
ALTER TABLE `homework_submit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_category`
--
ALTER TABLE `hostel_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_room`
--
ALTER TABLE `hostel_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1459;

--
-- AUTO_INCREMENT for table `language_list`
--
ALTER TABLE `language_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `leave_application`
--
ALTER TABLE `leave_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_category`
--
ALTER TABLE `leave_category`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `live_class`
--
ALTER TABLE `live_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `live_class_config`
--
ALTER TABLE `live_class_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_class_reports`
--
ALTER TABLE `live_class_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_credential`
--
ALTER TABLE `login_credential`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=639;

--
-- AUTO_INCREMENT for table `login_log`
--
ALTER TABLE `login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `mark`
--
ALTER TABLE `mark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `marksheet_template`
--
ALTER TABLE `marksheet_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `message_reply`
--
ALTER TABLE `message_reply`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules_manage`
--
ALTER TABLE `modules_manage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `offline_fees_payments`
--
ALTER TABLE `offline_fees_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_payment_types`
--
ALTER TABLE `offline_payment_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `online_admission`
--
ALTER TABLE `online_admission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `online_admission_fields`
--
ALTER TABLE `online_admission_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `online_exam`
--
ALTER TABLE `online_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_answer`
--
ALTER TABLE `online_exam_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_attempts`
--
ALTER TABLE `online_exam_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_payment`
--
ALTER TABLE `online_exam_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_submitted`
--
ALTER TABLE `online_exam_submitted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT for table `payment_config`
--
ALTER TABLE `payment_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_salary_stipend`
--
ALTER TABLE `payment_salary_stipend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `payslip`
--
ALTER TABLE `payslip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payslip_details`
--
ALTER TABLE `payslip_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `permission_modules`
--
ALTER TABLE `permission_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `postal_record`
--
ALTER TABLE `postal_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_issues`
--
ALTER TABLE `product_issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_issues_details`
--
ALTER TABLE `product_issues_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_store`
--
ALTER TABLE `product_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_supplier`
--
ALTER TABLE `product_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_unit`
--
ALTER TABLE `product_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `promotion_history`
--
ALTER TABLE `promotion_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_bill`
--
ALTER TABLE `purchase_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_bill_details`
--
ALTER TABLE `purchase_bill_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_payment_history`
--
ALTER TABLE `purchase_payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions_manage`
--
ALTER TABLE `questions_manage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_group`
--
ALTER TABLE `question_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `salary_template`
--
ALTER TABLE `salary_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salary_template_details`
--
ALTER TABLE `salary_template_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales_bill`
--
ALTER TABLE `sales_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_bill_details`
--
ALTER TABLE `sales_bill_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_payment_history`
--
ALTER TABLE `sales_payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schoolyear`
--
ALTER TABLE `schoolyear`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sections_allocation`
--
ALTER TABLE `sections_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sms_api`
--
ALTER TABLE `sms_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sms_credential`
--
ALTER TABLE `sms_credential`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_template`
--
ALTER TABLE `sms_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sms_template_details`
--
ALTER TABLE `sms_template_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_bank_account`
--
ALTER TABLE `staff_bank_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_department`
--
ALTER TABLE `staff_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_designation`
--
ALTER TABLE `staff_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `staff_documents`
--
ALTER TABLE `staff_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_privileges`
--
ALTER TABLE `staff_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=814;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT for table `student_admission_fields`
--
ALTER TABLE `student_admission_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `student_attendance`
--
ALTER TABLE `student_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student_category`
--
ALTER TABLE `student_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_documents`
--
ALTER TABLE `student_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fields`
--
ALTER TABLE `student_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `student_profile_fields`
--
ALTER TABLE `student_profile_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `student_subject_attendance`
--
ALTER TABLE `student_subject_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subject_assign`
--
ALTER TABLE `subject_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `teacher_allocation`
--
ALTER TABLE `teacher_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teacher_note`
--
ALTER TABLE `teacher_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_settings`
--
ALTER TABLE `theme_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timetable_class`
--
ALTER TABLE `timetable_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `timetable_exam`
--
ALTER TABLE `timetable_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions_links`
--
ALTER TABLE `transactions_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions_links_details`
--
ALTER TABLE `transactions_links_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_assign`
--
ALTER TABLE `transport_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_route`
--
ALTER TABLE `transport_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_stoppage`
--
ALTER TABLE `transport_stoppage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_vehicle`
--
ALTER TABLE `transport_vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_log`
--
ALTER TABLE `visitor_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_purpose`
--
ALTER TABLE `visitor_purpose`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_head`
--
ALTER TABLE `voucher_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `whatsapp_agent`
--
ALTER TABLE `whatsapp_agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `whatsapp_chat`
--
ALTER TABLE `whatsapp_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zoom_own_api`
--
ALTER TABLE `zoom_own_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advance_salary`
--
ALTER TABLE `advance_salary`
  ADD CONSTRAINT `advance_salary_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `advance_salary_rms_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `alumni_events`
--
ALTER TABLE `alumni_events`
  ADD CONSTRAINT `alumni_events_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `alumni_students`
--
ALTER TABLE `alumni_students`
  ADD CONSTRAINT `alumni_students_rms_1` FOREIGN KEY (`enroll_id`) REFERENCES `enroll` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_rms_1` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attachments_rms_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attachments_type`
--
ALTER TABLE `attachments_type`
  ADD CONSTRAINT `attachments_type_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `award`
--
ALTER TABLE `award`
  ADD CONSTRAINT `award_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `award_rms_2` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD CONSTRAINT `book_issues_rms1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_issues_rms2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_issues_rms3` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bulk_msg_category`
--
ALTER TABLE `bulk_msg_category`
  ADD CONSTRAINT `bulk_msg_category_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bulk_sms_email`
--
ALTER TABLE `bulk_sms_email`
  ADD CONSTRAINT `bulk_sms_email_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `call_log`
--
ALTER TABLE `call_log`
  ADD CONSTRAINT `call_log_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `call_purpose`
--
ALTER TABLE `call_purpose`
  ADD CONSTRAINT `call_purpose_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `card_templete`
--
ALTER TABLE `card_templete`
  ADD CONSTRAINT `card_templete_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certificates_templete`
--
ALTER TABLE `certificates_templete`
  ADD CONSTRAINT `certificates_templete_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `complaint_type`
--
ALTER TABLE `complaint_type`
  ADD CONSTRAINT `complaint_type_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disable_reason`
--
ALTER TABLE `disable_reason`
  ADD CONSTRAINT `disable_reason_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD CONSTRAINT `enquiry_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enquiry_follow_up`
--
ALTER TABLE `enquiry_follow_up`
  ADD CONSTRAINT `enquiry_follow_up_rms_1` FOREIGN KEY (`enquiry_id`) REFERENCES `enquiry` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enquiry_reference`
--
ALTER TABLE `enquiry_reference`
  ADD CONSTRAINT `enquiry_reference_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enquiry_response`
--
ALTER TABLE `enquiry_response`
  ADD CONSTRAINT `enquiry_response_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `enroll_rms_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enroll_rms_2` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enroll_rms_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enroll_rms_4` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enroll_rms_5` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_rms_2` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_types`
--
ALTER TABLE `event_types`
  ADD CONSTRAINT `event_types_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_rms_2` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  ADD CONSTRAINT `exam_attendance_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_attendance_rms_2` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_attendance_rms_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_hall`
--
ALTER TABLE `exam_hall`
  ADD CONSTRAINT `exam_hall_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_mark_distribution`
--
ALTER TABLE `exam_mark_distribution`
  ADD CONSTRAINT `exam_mark_distribution_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_rank`
--
ALTER TABLE `exam_rank`
  ADD CONSTRAINT `exam_rank_rms_1` FOREIGN KEY (`enroll_id`) REFERENCES `enroll` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_rank_rms_2` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  ADD CONSTRAINT `fees_reminder_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_allocation`
--
ALTER TABLE `fee_allocation`
  ADD CONSTRAINT `fee_allocation_rsm_1` FOREIGN KEY (`student_id`) REFERENCES `enroll` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_allocation_rsm_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_allocation_rsm_3` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_fine`
--
ALTER TABLE `fee_fine`
  ADD CONSTRAINT `fee_fine_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_fine_rms_2` FOREIGN KEY (`group_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_fine_rms_3` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_fine_rms_4` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_groups`
--
ALTER TABLE `fee_groups`
  ADD CONSTRAINT `fee_groups_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_groups_rms_2` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_groups_details`
--
ALTER TABLE `fee_groups_details`
  ADD CONSTRAINT `fee_groups_details_rms_1` FOREIGN KEY (`fee_groups_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_groups_details_rms_2` FOREIGN KEY (`fee_type_id`) REFERENCES `fees_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_payment_history`
--
ALTER TABLE `fee_payment_history`
  ADD CONSTRAINT `fee_payment_history_rms_1` FOREIGN KEY (`allocation_id`) REFERENCES `fee_allocation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_payment_history_rms_2` FOREIGN KEY (`type_id`) REFERENCES `fees_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_cms_news_list`
--
ALTER TABLE `front_cms_news_list`
  ADD CONSTRAINT `front_cms_news_list_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homework`
--
ALTER TABLE `homework`
  ADD CONSTRAINT `homework_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_rms_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_rms_3` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_rms_4` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_rms_5` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  ADD CONSTRAINT `homework_evaluation_rms_1` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homework_submit`
--
ALTER TABLE `homework_submit`
  ADD CONSTRAINT `homework_submit_rms_1` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_submit_rms_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hostel`
--
ALTER TABLE `hostel`
  ADD CONSTRAINT `hostel_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `login_log`
--
ALTER TABLE `login_log`
  ADD CONSTRAINT `login_log_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marksheet_template`
--
ALTER TABLE `marksheet_template`
  ADD CONSTRAINT `marksheet_template_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_admission`
--
ALTER TABLE `online_admission`
  ADD CONSTRAINT `online_admission_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_issues`
--
ALTER TABLE `product_issues`
  ADD CONSTRAINT `product_issues_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_issues_details`
--
ALTER TABLE `product_issues_details`
  ADD CONSTRAINT `product_issues_details_rms_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD CONSTRAINT `product_supplier_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promotion_history`
--
ALTER TABLE `promotion_history`
  ADD CONSTRAINT `promotion_history_rms_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_bill`
--
ALTER TABLE `purchase_bill`
  ADD CONSTRAINT `purchase_bill_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_bill_details`
--
ALTER TABLE `purchase_bill_details`
  ADD CONSTRAINT `purchase_bill_details_rms_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_bill`
--
ALTER TABLE `sales_bill`
  ADD CONSTRAINT `sales_bill_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_bill_details`
--
ALTER TABLE `sales_bill_details`
  ADD CONSTRAINT `sales_bill_details_rms_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections_allocation`
--
ALTER TABLE `sections_allocation`
  ADD CONSTRAINT `sections_allocation_rms_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_allocation_rms_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD CONSTRAINT `staff_attendance_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_attendance_rms_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD CONSTRAINT `student_attendance_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_attendance_rms_2` FOREIGN KEY (`enroll_id`) REFERENCES `enroll` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_subject_attendance`
--
ALTER TABLE `student_subject_attendance`
  ADD CONSTRAINT `student_subject_attendance_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_subject_attendance_rms_2` FOREIGN KEY (`enroll_id`) REFERENCES `enroll` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_assign`
--
ALTER TABLE `subject_assign`
  ADD CONSTRAINT `subject_assign_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_assign_rms_2` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_assign_rms_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_assign_rms_4` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_assign_rms_5` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `timetable_class`
--
ALTER TABLE `timetable_class`
  ADD CONSTRAINT `timetable_class_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_class_rms_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_class_rms_3` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_class_rms_4` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `timetable_exam`
--
ALTER TABLE `timetable_exam`
  ADD CONSTRAINT `timetable_exam_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_exam_rms_2` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_exam_rms_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_exam_rms_4` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_exam_rms_5` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_exam_rms_6` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions_links`
--
ALTER TABLE `transactions_links`
  ADD CONSTRAINT `transactions_links_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_assign`
--
ALTER TABLE `transport_assign`
  ADD CONSTRAINT `transport_assign_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_route`
--
ALTER TABLE `transport_route`
  ADD CONSTRAINT `transport_route_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_stoppage`
--
ALTER TABLE `transport_stoppage`
  ADD CONSTRAINT `transport_stoppage_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_vehicle`
--
ALTER TABLE `transport_vehicle`
  ADD CONSTRAINT `transport_vehicle_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `visitor_log`
--
ALTER TABLE `visitor_log`
  ADD CONSTRAINT `visitor_log_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `visitor_purpose`
--
ALTER TABLE `visitor_purpose`
  ADD CONSTRAINT `visitor_purpose_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `voucher_head`
--
ALTER TABLE `voucher_head`
  ADD CONSTRAINT `voucher_head_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
