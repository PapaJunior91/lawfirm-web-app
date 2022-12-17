-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 10, 2022 at 11:52 AM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `legalcase`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `associated_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city_id` int UNSIGNED DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` int UNSIGNED DEFAULT NULL,
  `country_id` int UNSIGNED DEFAULT NULL,
  `profile_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activated` tinyint NOT NULL DEFAULT '0',
  `is_account_setup` tinyint NOT NULL DEFAULT '0',
  `is_user_type` enum('SUPERADMIN','ADVOCATE','STAFF') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ADVOCATE',
  `invitation_status` enum('accepted','sent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `accepted_at` datetime DEFAULT NULL,
  `current_package` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` int UNSIGNED DEFAULT '0',
  `started_at` date DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `is_expired` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_date` timestamp NULL DEFAULT NULL,
  `is_otp_verify` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `plateform` enum('App','Web') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Web',
  `user_type` enum('Admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advocate_clients`
--

CREATE TABLE `advocate_clients` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('Male','Female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alternate_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int UNSIGNED NOT NULL,
  `state_id` int UNSIGNED NOT NULL,
  `city_id` int UNSIGNED NOT NULL,
  `reference_name` text COLLATE utf8mb4_unicode_ci,
  `reference_mobile` text COLLATE utf8mb4_unicode_ci,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `client_type` enum('single','multiple') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `all_taxes`
--

CREATE TABLE `all_taxes` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `per` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int UNSIGNED NOT NULL,
  `client_id` int UNSIGNED DEFAULT NULL,
  `advocate_id` int UNSIGNED DEFAULT NULL,
  `type` enum('new','exists') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `date` date NOT NULL,
  `time` time NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `is_active` enum('OPEN','CANCEL BY CLIENT','CANCEL BY ADVOCA') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'OPEN',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_logs`
--

CREATE TABLE `case_logs` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `court_case_id` int UNSIGNED NOT NULL,
  `judge_type` int UNSIGNED NOT NULL,
  `case_status` int UNSIGNED DEFAULT NULL,
  `court_no` text COLLATE utf8mb4_unicode_ci,
  `judge_name` text COLLATE utf8mb4_unicode_ci,
  `bussiness_on_date` datetime DEFAULT NULL,
  `hearing_date` datetime DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `is_transfer` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `transfer_judge_type` int UNSIGNED DEFAULT NULL,
  `transfer_court_no` text COLLATE utf8mb4_unicode_ci,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_members`
--

CREATE TABLE `case_members` (
  `id` int UNSIGNED NOT NULL,
  `case_id` int UNSIGNED DEFAULT NULL,
  `employee_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_parties_involves`
--

CREATE TABLE `case_parties_involves` (
  `id` int UNSIGNED NOT NULL,
  `court_case_id` int UNSIGNED DEFAULT NULL,
  `position` text COLLATE utf8mb4_unicode_ci,
  `party_name` text COLLATE utf8mb4_unicode_ci,
  `party_advocate` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_statuses`
--

CREATE TABLE `case_statuses` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `case_status_name` text COLLATE utf8mb4_unicode_ci,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_transfers`
--

CREATE TABLE `case_transfers` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `court_case_id` int UNSIGNED NOT NULL,
  `from_judge_type` int UNSIGNED NOT NULL,
  `to_judge_type` int UNSIGNED NOT NULL,
  `from_court_no` text COLLATE utf8mb4_unicode_ci,
  `to_court_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `judge_name` text COLLATE utf8mb4_unicode_ci,
  `transfer_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_types`
--

CREATE TABLE `case_types` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED NOT NULL,
  `case_type_name` text COLLATE utf8mb4_unicode_ci,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_parties_invoives`
--

CREATE TABLE `client_parties_invoives` (
  `id` int UNSIGNED NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED DEFAULT NULL,
  `party_firstname` text COLLATE utf8mb4_unicode_ci,
  `party_middlename` text COLLATE utf8mb4_unicode_ci,
  `party_lastname` text COLLATE utf8mb4_unicode_ci,
  `party_mobile` text COLLATE utf8mb4_unicode_ci,
  `party_address` text COLLATE utf8mb4_unicode_ci,
  `party_advocate` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courts`
--

CREATE TABLE `courts` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `court_type_id` int UNSIGNED NOT NULL,
  `court_name` text COLLATE utf8mb4_unicode_ci,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `court_cases`
--

CREATE TABLE `court_cases` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `advo_client_id` int UNSIGNED NOT NULL,
  `client_position` enum('Respondent','Petitioner') COLLATE utf8mb4_unicode_ci NOT NULL,
  `party_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `party_lawyer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `case_number` text COLLATE utf8mb4_unicode_ci,
  `case_types` int UNSIGNED NOT NULL,
  `case_sub_type` int UNSIGNED DEFAULT NULL,
  `case_status` int UNSIGNED NOT NULL,
  `act` text COLLATE utf8mb4_unicode_ci,
  `priority` enum('High','Medium','Low') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Low',
  `court_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `court_type` int UNSIGNED NOT NULL,
  `court` int UNSIGNED NOT NULL,
  `judge_type` int UNSIGNED NOT NULL,
  `judge_name` text COLLATE utf8mb4_unicode_ci,
  `filing_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `filing_date` datetime NOT NULL,
  `registration_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_date` datetime NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cnr_number` text COLLATE utf8mb4_unicode_ci,
  `first_hearing_date` date DEFAULT NULL,
  `next_date` datetime DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `police_station` text COLLATE utf8mb4_unicode_ci,
  `fir_number` text COLLATE utf8mb4_unicode_ci,
  `fir_date` date DEFAULT NULL,
  `is_nb` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `decision_date` date DEFAULT NULL,
  `nature_disposal` text COLLATE utf8mb4_unicode_ci,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `court_types`
--

CREATE TABLE `court_types` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `court_type_name` text COLLATE utf8mb4_unicode_ci,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dumps`
--

CREATE TABLE `dumps` (
  `id` int UNSIGNED NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `vendor_id` int UNSIGNED NOT NULL,
  `invoice_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_amount` text COLLATE utf8mb4_unicode_ci,
  `total_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_id` int UNSIGNED DEFAULT NULL,
  `inv_status` enum('Due','Partially Paid','Paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Due',
  `due_date` date NOT NULL,
  `inv_date` date NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `tax_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_content` text COLLATE utf8mb4_unicode_ci,
  `invoice_created_by` int UNSIGNED NOT NULL,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_items`
--

CREATE TABLE `expenses_items` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `vendor_id` int UNSIGNED NOT NULL,
  `invoice_id` int UNSIGNED NOT NULL,
  `tax_id` int UNSIGNED DEFAULT NULL,
  `tax` double DEFAULT '0',
  `category_id` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `iteam_qty` int UNSIGNED NOT NULL,
  `item_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_rate` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_cats`
--

CREATE TABLE `expense_cats` (
  `id` int UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `advocate_id` int UNSIGNED NOT NULL,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int UNSIGNED NOT NULL,
  `company_name` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `country` int UNSIGNED NOT NULL,
  `state` int UNSIGNED NOT NULL,
  `city` int UNSIGNED NOT NULL,
  `pincode` int UNSIGNED NOT NULL,
  `date_formet` int UNSIGNED NOT NULL,
  `logo_img` text COLLATE utf8mb4_unicode_ci,
  `favicon_img` text COLLATE utf8mb4_unicode_ci,
  `timezone` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `invoice_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_amount` text COLLATE utf8mb4_unicode_ci,
  `total_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `inv_status` enum('Due','Partially Paid','Paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Due',
  `due_date` date NOT NULL,
  `inv_date` date NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `tax_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int UNSIGNED DEFAULT NULL,
  `json_content` text COLLATE utf8mb4_unicode_ci,
  `invoice_created_by` int UNSIGNED NOT NULL,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `invoice_id` int UNSIGNED NOT NULL,
  `tax_id` int UNSIGNED DEFAULT NULL,
  `tax` double DEFAULT '0',
  `item_description` text COLLATE utf8mb4_unicode_ci,
  `iteam_qty` int UNSIGNED NOT NULL,
  `item_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_rate` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hsn` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `judges`
--

CREATE TABLE `judges` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `judge_name` text COLLATE utf8mb4_unicode_ci,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_02_20_000001_add_dumps_table', 1),
(4, '2019_10_14_110019_create_admins_table', 1),
(5, '2019_10_14_110020_create_admin_password_resets_table', 1),
(6, '2019_10_17_101133_create_advocate_clients_table', 1),
(7, '2019_10_17_101537_create_tasks_table', 1),
(8, '2019_10_17_101621_create_vendors_table', 1),
(9, '2019_10_17_101723_create_appointments_table', 1),
(10, '2019_10_17_101855_create_expenses_table', 1),
(11, '2019_10_17_101937_create_expenses_items_table', 1),
(12, '2019_10_17_102033_create_expense_cats_table', 1),
(13, '2019_10_17_102124_create_invoices_table', 1),
(14, '2019_10_17_102153_create_invoice_items_table', 1),
(15, '2019_10_17_121502_create_court_cases_table', 1),
(16, '2019_10_17_131544_create_case_parties_involves_table', 1),
(17, '2019_10_17_131723_create_case_members_table', 1),
(18, '2019_10_17_132335_create_client_parties_invoives_table', 1),
(19, '2019_10_17_132912_create_task_members_table', 1),
(20, '2019_10_17_132950_create_payment_mades_table', 1),
(21, '2019_10_17_133015_create_payment_receiveds_table', 1),
(22, '2019_10_18_015145_create_case_logs_table', 1),
(23, '2019_10_18_015300_create_roles_table', 1),
(24, '2019_10_18_025609_add_colunm_to_admins_table', 1),
(25, '2019_10_18_050140_create_court_types_table', 1),
(26, '2019_10_18_050317_create_courts_table', 1),
(27, '2019_10_18_050351_create_case_types_table', 1),
(28, '2019_10_18_050431_create_case_statuses_table', 1),
(29, '2019_10_18_050522_create_case_transfers_table', 1),
(30, '2019_10_18_050550_create_judges_table', 1),
(31, '2019_10_18_050619_create_all_taxes_table', 1),
(32, '2019_10_19_024113_create_services_table', 1),
(33, '2019_12_03_112534_create_general_setting_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_mades`
--

CREATE TABLE `payment_mades` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `vendor_id` int UNSIGNED NOT NULL,
  `invoice_id` int UNSIGNED NOT NULL,
  `amount` bigint NOT NULL DEFAULT '0',
  `receiving_date` date DEFAULT NULL,
  `payment_type` enum('Cash','Cheque','Net Banking','Other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cash',
  `reference_number` text COLLATE utf8mb4_unicode_ci,
  `cheque_date` datetime DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `payment_received_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_receiveds`
--

CREATE TABLE `payment_receiveds` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `invoice_id` int UNSIGNED NOT NULL,
  `receipt_number` int UNSIGNED DEFAULT NULL,
  `amount` bigint NOT NULL,
  `receiving_date` datetime NOT NULL,
  `payment_type` enum('Cash','Cheque','Net Banking','Other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cash',
  `cheque_date` datetime DEFAULT NULL,
  `reference_number` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `payment_received_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` bigint DEFAULT NULL,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int UNSIGNED NOT NULL,
  `rel_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rel_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `project_type_task_id` int UNSIGNED DEFAULT NULL,
  `task_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checklist_complete_remarks` text COLLATE utf8mb4_unicode_ci,
  `checklist_complete_signature` text COLLATE utf8mb4_unicode_ci,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `critical_comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_members`
--

CREATE TABLE `task_members` (
  `id` int UNSIGNED NOT NULL,
  `task_id` int UNSIGNED NOT NULL,
  `employee_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int UNSIGNED NOT NULL,
  `advocate_id` int UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alternate_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int UNSIGNED NOT NULL,
  `state_id` int UNSIGNED NOT NULL,
  `city_id` int UNSIGNED NOT NULL,
  `gst` text COLLATE utf8mb4_unicode_ci,
  `pan` text COLLATE utf8mb4_unicode_ci,
  `is_active` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advocate_clients`
--
ALTER TABLE `advocate_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `all_taxes`
--
ALTER TABLE `all_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_logs`
--
ALTER TABLE `case_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_members`
--
ALTER TABLE `case_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_parties_involves`
--
ALTER TABLE `case_parties_involves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_statuses`
--
ALTER TABLE `case_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_transfers`
--
ALTER TABLE `case_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_types`
--
ALTER TABLE `case_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_parties_invoives`
--
ALTER TABLE `client_parties_invoives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courts`
--
ALTER TABLE `courts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `court_cases`
--
ALTER TABLE `court_cases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `court_types`
--
ALTER TABLE `court_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dumps`
--
ALTER TABLE `dumps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses_items`
--
ALTER TABLE `expenses_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_cats`
--
ALTER TABLE `expense_cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `judges`
--
ALTER TABLE `judges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_mades`
--
ALTER TABLE `payment_mades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_receiveds`
--
ALTER TABLE `payment_receiveds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_members`
--
ALTER TABLE `task_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advocate_clients`
--
ALTER TABLE `advocate_clients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `all_taxes`
--
ALTER TABLE `all_taxes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_logs`
--
ALTER TABLE `case_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_members`
--
ALTER TABLE `case_members`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_parties_involves`
--
ALTER TABLE `case_parties_involves`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_statuses`
--
ALTER TABLE `case_statuses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_transfers`
--
ALTER TABLE `case_transfers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_types`
--
ALTER TABLE `case_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_parties_invoives`
--
ALTER TABLE `client_parties_invoives`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courts`
--
ALTER TABLE `courts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `court_cases`
--
ALTER TABLE `court_cases`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `court_types`
--
ALTER TABLE `court_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dumps`
--
ALTER TABLE `dumps`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses_items`
--
ALTER TABLE `expenses_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_cats`
--
ALTER TABLE `expense_cats`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `judges`
--
ALTER TABLE `judges`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `payment_mades`
--
ALTER TABLE `payment_mades`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_receiveds`
--
ALTER TABLE `payment_receiveds`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_members`
--
ALTER TABLE `task_members`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
