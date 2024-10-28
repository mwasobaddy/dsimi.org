/*!999999\- enable the sandbox mode */ 
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `account_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(191) NOT NULL,
  `initial_balance` double(20,2) NOT NULL DEFAULT 0.00,
  `account_number` varchar(191) NOT NULL,
  `branch_code` varchar(191) NOT NULL,
  `bank_branch` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `admin_payment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_payment_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_payment_settings_name_created_by_unique` (`name`,`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `allowance_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allowance_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `allowances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allowances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `allowance_option` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `announcement_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `announcement_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `branch_id` int(11) NOT NULL,
  `department_id` varchar(191) NOT NULL,
  `employee_id` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `appraisals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appraisals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch` int(11) NOT NULL DEFAULT 0,
  `employee` int(11) NOT NULL DEFAULT 0,
  `rating` varchar(191) DEFAULT NULL,
  `appraisal_date` varchar(191) NOT NULL,
  `customer_experience` int(11) NOT NULL DEFAULT 0,
  `marketing` int(11) NOT NULL DEFAULT 0,
  `administration` int(11) NOT NULL DEFAULT 0,
  `professionalism` int(11) NOT NULL DEFAULT 0,
  `integrity` int(11) NOT NULL DEFAULT 0,
  `attendance` int(11) NOT NULL DEFAULT 0,
  `remark` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `purchase_date` date NOT NULL,
  `supported_date` date NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `attendance_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(191) NOT NULL,
  `clock_in` time NOT NULL,
  `clock_out` time NOT NULL,
  `employee_remarks` varchar(255) NOT NULL,
  `late` time NOT NULL,
  `early_leaving` time NOT NULL,
  `overtime` time NOT NULL,
  `total_rest` time NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `award_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `award_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `award_type` varchar(191) NOT NULL,
  `date` date NOT NULL,
  `gift` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ch_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_favorites` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `favorite_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ch_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_messages` (
  `id` bigint(20) NOT NULL,
  `type` varchar(191) NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `body` varchar(5000) DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `company_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_policies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `competencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaints` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `complaint_from` int(11) NOT NULL,
  `complaint_against` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `complaint_date` date NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `contract_attechments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_attechments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` bigint(20) unsigned NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `files` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `contract_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` bigint(20) unsigned NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `comment` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `contract_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `contract_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) DEFAULT NULL,
  `employee_name` int(11) NOT NULL,
  `value` double(15,2) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `notes` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `description` longtext DEFAULT NULL,
  `contract_description` longtext DEFAULT NULL,
  `employee_signature` longtext DEFAULT NULL,
  `company_signature` longtext DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `limit` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `custom_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(191) NOT NULL,
  `is_required` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `deduction_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deduction_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `date` date NOT NULL,
  `income_category_id` int(11) NOT NULL,
  `payer_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `referal_id` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `is_required` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ducument_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ducument_uploads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `role` varchar(191) NOT NULL,
  `document` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `email_template_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_template_langs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `from` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `employee_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `document_value` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `employee_id` varchar(191) NOT NULL,
  `biometric_emp_id` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `company_doj` varchar(191) DEFAULT NULL,
  `documents` varchar(191) DEFAULT NULL,
  `account_holder_name` varchar(191) DEFAULT NULL,
  `account_number` varchar(191) DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `bank_identifier_code` varchar(191) DEFAULT NULL,
  `branch_location` varchar(191) DEFAULT NULL,
  `tax_payer_id` varchar(191) DEFAULT NULL,
  `salary_type` int(11) DEFAULT NULL,
  `account_type` int(11) DEFAULT NULL,
  `salary` double(20,2) NOT NULL DEFAULT 0.00,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registration_number` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `civil_service_doe` varchar(191) DEFAULT NULL,
  `dsimi_doe` varchar(191) DEFAULT NULL,
  `contract_type` varchar(191) DEFAULT NULL,
  `services` varchar(191) DEFAULT NULL,
  `job` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `grade` varchar(191) DEFAULT NULL,
  `supervisor_n1` varchar(191) DEFAULT NULL,
  `supervisor_n2` varchar(191) DEFAULT NULL,
  `role` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `event_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `department_id` longtext NOT NULL,
  `employee_id` longtext NOT NULL,
  `title` varchar(191) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `color` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `expense_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `date` date NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `payee_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `referal_id` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `experience_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience_certificates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `generate_offer_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generate_offer_letters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `genrate_payslip_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genrate_payslip_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `goal_trackings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_trackings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch` int(11) NOT NULL,
  `goal_type` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `rating` varchar(191) DEFAULT NULL,
  `target_achievement` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `progress` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `goal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `occasion` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `income_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch` int(11) NOT NULL DEFAULT 0,
  `department` int(11) NOT NULL DEFAULT 0,
  `designation` int(11) NOT NULL DEFAULT 0,
  `rating` varchar(191) DEFAULT NULL,
  `customer_experience` int(11) NOT NULL DEFAULT 0,
  `marketing` int(11) NOT NULL DEFAULT 0,
  `administration` int(11) NOT NULL DEFAULT 0,
  `professionalism` int(11) NOT NULL DEFAULT 0,
  `integrity` int(11) NOT NULL DEFAULT 0,
  `attendance` int(11) NOT NULL DEFAULT 0,
  `created_user` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `interview_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int(11) NOT NULL,
  `employee` int(11) NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `comment` text DEFAULT NULL,
  `employee_response` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ip_restricts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_restricts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `job_application_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_application_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL DEFAULT 0,
  `note_created` int(11) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `job_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_applications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job` int(11) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `profile` varchar(191) DEFAULT NULL,
  `resume` varchar(191) DEFAULT NULL,
  `cover_letter` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `stage` int(11) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `skill` text DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `is_archive` int(11) NOT NULL DEFAULT 0,
  `custom_question` text DEFAULT NULL,
  `terms_condition_check` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `job_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `job_on_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_on_boards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `application` int(11) NOT NULL,
  `joining_date` date DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `job_type` varchar(191) DEFAULT NULL,
  `days_of_week` int(11) DEFAULT NULL,
  `salary` double(15,2) DEFAULT NULL,
  `salary_type` varchar(191) DEFAULT NULL,
  `salary_duration` varchar(191) DEFAULT NULL,
  `convert_to_employee` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `job_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_stages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `requirement` text DEFAULT NULL,
  `terms_and_conditions` text DEFAULT NULL,
  `branch` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `skill` text DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `applicant` varchar(191) DEFAULT NULL,
  `visibility` varchar(191) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `custom_question` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `join_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `join_us` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `join_us_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `joining_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joining_letters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `landing_page_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landing_page_sections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `section_name` varchar(191) NOT NULL,
  `section_order` int(11) NOT NULL DEFAULT 0,
  `content` text DEFAULT NULL,
  `section_type` enum('section-1','section-2','section-3','section-4','section-5','section-6','section-7','section-8','section-9','section-10','section-plan') NOT NULL,
  `default_content` text NOT NULL,
  `section_demo_image` text NOT NULL,
  `section_blade_file_name` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `landing_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landing_page_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `landing_page_settings_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) DEFAULT NULL,
  `fullName` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `days` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leaves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `applied_on` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_leave_days` varchar(191) NOT NULL,
  `leave_reason` varchar(191) NOT NULL,
  `remark` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `loan_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `loan_option` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) NOT NULL,
  `ip` varchar(191) NOT NULL,
  `date` varchar(191) NOT NULL,
  `Details` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meeting_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `department_id` longtext NOT NULL,
  `employee_id` longtext NOT NULL,
  `title` varchar(191) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `noc_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noc_certificates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `notification_template_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_template_langs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `variables` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `card_number` varchar(10) DEFAULT NULL,
  `card_exp_month` varchar(10) DEFAULT NULL,
  `card_exp_year` varchar(10) DEFAULT NULL,
  `plan_name` varchar(100) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `price` double(15,2) NOT NULL,
  `price_currency` varchar(10) NOT NULL,
  `txn_id` varchar(100) NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `payment_type` varchar(191) NOT NULL DEFAULT 'Manually',
  `receipt` varchar(191) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `is_refund` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_id_unique` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `other_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `overtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overtimes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `number_of_days` int(11) NOT NULL,
  `hours` int(11) NOT NULL,
  `rate` double(15,2) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `pay_slips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_slips` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `net_payble` double(15,2) NOT NULL,
  `salary_month` varchar(191) NOT NULL,
  `status` int(11) NOT NULL,
  `basic_salary` double(15,2) NOT NULL,
  `allowance` text NOT NULL,
  `commission` text NOT NULL,
  `loan` text NOT NULL,
  `saturation_deduction` text NOT NULL,
  `other_payment` text NOT NULL,
  `overtime` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `payees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payee_name` varchar(191) NOT NULL,
  `contact_number` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `payers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payer_name` varchar(191) NOT NULL,
  `contact_number` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `payslip_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payslip_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `performance__types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance__types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `plan_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `duration` varchar(20) NOT NULL DEFAULT 'monthly',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(30,2) DEFAULT 0.00,
  `duration` varchar(100) NOT NULL,
  `max_users` int(11) NOT NULL DEFAULT 0,
  `max_employees` int(11) NOT NULL DEFAULT 0,
  `storage_limit` double(20,2) NOT NULL DEFAULT 0.00,
  `enable_chatgpt` varchar(191) DEFAULT NULL,
  `trial` int(11) NOT NULL DEFAULT 0,
  `trial_days` varchar(191) DEFAULT NULL,
  `is_disable` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plans_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `promotion_title` varchar(191) NOT NULL,
  `promotion_date` date NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `referral_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referral_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `percentage` int(11) NOT NULL,
  `minimum_threshold_amount` int(11) NOT NULL,
  `is_enable` int(11) NOT NULL DEFAULT 0,
  `guideline` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `referral_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referral_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `plan_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `commission` int(11) NOT NULL,
  `referral_code` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `resignations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resignations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `notice_date` date NOT NULL,
  `resignation_date` date NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `saturation_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saturation_deductions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `deduction_option` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `set_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `set_salaries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_name_created_by_unique` (`name`,`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(191) NOT NULL,
  `prompt` text NOT NULL,
  `module` varchar(191) NOT NULL,
  `field_json` text NOT NULL,
  `is_tone` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `termination_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `termination_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `terminations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terminations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `notice_date` date NOT NULL,
  `termination_date` date NOT NULL,
  `termination_type` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ticket_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_replies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_read` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `priority` varchar(191) NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `ticket_code` varchar(191) NOT NULL,
  `ticket_created` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `time_sheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_sheets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  `hours` double(8,2) NOT NULL DEFAULT 0.00,
  `remark` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch` varchar(191) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `contact` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `address` text DEFAULT NULL,
  `expertise` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `training_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `trainings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch` int(11) NOT NULL,
  `trainer_option` int(11) NOT NULL,
  `training_type` int(11) NOT NULL,
  `trainer` int(11) NOT NULL,
  `training_cost` double(15,2) NOT NULL DEFAULT 0.00,
  `employee` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `performance` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `transaction_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `req_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `req_user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `transfer_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_balances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` double(15,2) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `referal_id` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `transfer_date` date NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `travels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `purpose_of_visit` varchar(191) NOT NULL,
  `place_of_visit` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `coupon` int(11) NOT NULL,
  `order` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_email_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `avatar` varchar(191) NOT NULL DEFAULT 'avatar.png',
  `lang` varchar(191) NOT NULL,
  `plan` int(11) DEFAULT NULL,
  `plan_expire_date` date DEFAULT NULL,
  `requested_plan` int(11) NOT NULL DEFAULT 0,
  `trial_expire_date` date DEFAULT NULL,
  `trial_plan` int(11) NOT NULL DEFAULT 0,
  `is_login_enable` int(11) NOT NULL DEFAULT 1,
  `storage_limit` double(20,2) NOT NULL DEFAULT 0.00,
  `last_login` timestamp NULL DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `referral_code` int(11) NOT NULL DEFAULT 0,
  `used_referral_code` int(11) NOT NULL DEFAULT 0,
  `commission_amount` int(11) NOT NULL DEFAULT 0,
  `active_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_disable` int(11) NOT NULL DEFAULT 1,
  `dark_mode` tinyint(1) NOT NULL DEFAULT 0,
  `messenger_color` varchar(191) NOT NULL DEFAULT '#2180f3',
  `created_by` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `warnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warnings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warning_to` int(11) NOT NULL,
  `warning_by` int(11) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `warning_date` date NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webhooks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module` text NOT NULL,
  `url` text NOT NULL,
  `method` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `zoom_meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoom_meetings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) DEFAULT NULL,
  `meeting_id` varchar(191) NOT NULL DEFAULT '0',
  `user_id` varchar(191) NOT NULL DEFAULT '0',
  `password` varchar(191) DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `duration` int(11) NOT NULL DEFAULT 0,
  `start_url` text DEFAULT NULL,
  `join_url` varchar(191) DEFAULT NULL,
  `status` varchar(191) DEFAULT 'waiting',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*!999999\- enable the sandbox mode */ 
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1,'2014_10_12_000000_create_users_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2,'2014_10_12_100000_create_password_resets_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3,'2019_08_19_000000_create_failed_jobs_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4,'2019_09_28_102009_create_settings_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5,'2019_12_14_000001_create_personal_access_tokens_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6,'2019_12_26_101754_create_departments_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7,'2019_12_26_101814_create_designations_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8,'2019_12_26_105721_create_documents_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9,'2019_12_27_083751_create_branches_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10,'2019_12_27_090831_create_employees_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (11,'2019_12_27_112922_create_employee_documents_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (12,'2019_12_28_050508_create_awards_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (13,'2019_12_28_050919_create_award_types_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (14,'2019_12_31_060916_create_termination_types_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (15,'2019_12_31_062259_create_terminations_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (16,'2019_12_31_070521_create_resignations_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (17,'2019_12_31_072252_create_travels_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (18,'2019_12_31_090637_create_promotions_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (19,'2019_12_31_092838_create_transfers_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (20,'2019_12_31_100319_create_warnings_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (21,'2019_12_31_103019_create_complaints_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (22,'2020_01_02_090837_create_payslip_types_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (23,'2020_01_02_093331_create_allowance_options_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (24,'2020_01_02_102558_create_loan_options_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (25,'2020_01_02_103822_create_deduction_options_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (26,'2020_01_02_110828_create_genrate_payslip_options_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (27,'2020_01_02_111807_create_set_salaries_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (28,'2020_01_03_084302_create_allowances_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (29,'2020_01_03_101735_create_commissions_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (30,'2020_01_03_105019_create_loans_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (31,'2020_01_03_105046_create_saturation_deductions_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (32,'2020_01_03_105100_create_other_payments_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (33,'2020_01_03_105111_create_overtimes_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (34,'2020_01_04_072527_create_pay_slips_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (35,'2020_01_06_045425_create_account_lists_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (36,'2020_01_06_062213_create_payees_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (37,'2020_01_06_070037_create_payers_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (38,'2020_01_06_072939_create_income_types_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (39,'2020_01_06_073055_create_expense_types_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (40,'2020_01_06_085218_create_deposits_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (41,'2020_01_06_090709_create_payment_types_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (42,'2020_01_06_121442_create_expenses_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (43,'2020_01_06_124036_create_transfer_balances_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (44,'2020_01_13_084720_create_events_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (45,'2020_01_16_041720_create_announcements_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (46,'2020_01_16_090747_create_leave_types_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (47,'2020_01_16_093256_create_leaves_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (48,'2020_01_16_110357_create_meetings_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (49,'2020_01_17_051906_create_tickets_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (50,'2020_01_17_112647_create_ticket_replies_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (51,'2020_01_23_101613_create_meeting_employees_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (52,'2020_01_23_123844_create_event_employees_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (53,'2020_01_24_062752_create_announcement_employees_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (54,'2020_01_27_052503_create_attendance_employees_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (55,'2020_02_17_035047_create_plans_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (56,'2020_02_17_072503_create_orders_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (57,'2020_02_28_051636_create_time_sheets_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (58,'2020_03_12_095629_create_coupons_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (59,'2020_03_12_120749_create_user_coupons_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (60,'2020_04_21_115823_create_assets_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (61,'2020_05_01_122144_create_ducument_uploads_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (62,'2020_05_04_070452_create_indicators_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (63,'2020_05_05_023742_create_appraisals_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (64,'2020_05_05_061241_create_goal_types_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (65,'2020_05_05_095926_create_goal_trackings_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (66,'2020_05_07_093520_create_company_policies_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (67,'2020_05_07_131311_create_training_types_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (68,'2020_05_08_023838_create_trainers_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (69,'2020_05_08_043039_create_trainings_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (70,'2020_05_21_065337_create_permission_tables',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (71,'2020_07_18_065859_create_messageses_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (72,'2020_10_07_034726_create_holidays_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (73,'2021_03_13_093312_create_ip_restricts_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (74,'2021_03_13_114832_create_job_categories_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (75,'2021_03_13_123125_create_job_stages_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (76,'2021_03_15_094707_create_jobs_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (77,'2021_03_15_153745_create_job_applications_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (78,'2021_03_16_115140_create_job_application_notes_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (79,'2021_03_17_163107_create_custom_questions_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (80,'2021_03_18_140630_create_interview_schedules_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (81,'2021_03_22_122532_create_job_on_boards_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (82,'2021_06_22_094220_create_landing_page_sections_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (83,'2021_06_25_032625_admin_payment_setting',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (84,'2021_08_20_084119_create_competencies_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (85,'2021_09_10_165514_create_plan_requests_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (86,'2021_11_22_043537_create_performance__types_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (87,'2021_12_24_061634_create_zoom_meetings_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (88,'2022_07_13_085418_create_email_templates_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (89,'2022_07_13_085511_create_email_template_langs_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (90,'2022_07_13_085553_user_email_templates_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (91,'2022_07_26_054753_create_contract_types_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (92,'2022_07_28_035621_create_contracts_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (93,'2022_07_28_035654_create_contract_attechments_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (94,'2022_07_28_035713_create_contract_comments_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (95,'2022_07_28_035731_create_contract_notes_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (96,'2022_08_10_051439_generate__offer__letter',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (97,'2022_08_16_050109_joining_letter',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (98,'2022_08_17_045033_experience_certificate',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (99,'2022_08_17_065806_noc_certificate',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (100,'2022_12_09_999999_create_favorites_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (101,'2022_12_09_999999_create_messages_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (102,'2023_04_19_113655_create_login_details_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (103,'2023_04_24_062256_create_webhook_settings_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (104,'2023_05_03_033446_create_notification_templates_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (105,'2023_05_03_033536_create_notification_template_langs_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (106,'2023_06_05_043450_create_landing_page_settings_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (107,'2023_06_08_094417_create_template_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (108,'2023_06_10_114031_create_join_us_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (109,'2023_06_28_061829_create_languages_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (110,'2023_12_08_065736_add_is_disable_to_users_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (111,'2024_01_23_060449_add_trial_expire_date_to_users_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (112,'2024_01_23_060917_add_trial_to_plans_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (113,'2024_01_24_053357_update_password_for_users_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (114,'2024_01_24_054034_add_is_login_enable_to_users_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (115,'2024_01_30_050310_add_is_disable_to_plans_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (116,'2024_01_30_094128_add_is_refund_to_orders_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (117,'2024_02_01_064327_add_attachments_to_ticket_replies_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (118,'2024_02_01_064335_add_attachments_to_tickets_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (119,'2024_04_15_092833_create_referral_settings_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (120,'2024_04_15_093303_add_referral_code_to_users',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (121,'2024_04_15_093820_create_referral_transactions_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (122,'2024_04_15_095510_create_transaction_orders_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (123,'2024_04_29_125113_add_biometric_emp_id_to_employees_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (124,'2024_05_02_051304_add_branch_id_to_designations_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (125,'2024_05_02_072829_add_terms_and_conditions_to_jobs_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (126,'2024_09_30_162059_add_column_to_employees_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (127,'2024_10_09_161409_add_first_name_to_employee_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (128,'2024_10_09_161409_add_last_name_to_employee_table',3);
