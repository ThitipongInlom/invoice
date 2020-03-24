-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 24 มี.ค. 2020 เมื่อ 04:41 PM
-- เวอร์ชันของเซิร์ฟเวอร์: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice`
--

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `address`
--

CREATE TABLE `address` (
  `address_id` int(12) NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch_company_on` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch_company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_build` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `address`
--

INSERT INTO `address` (`address_id`, `company_name`, `type_address`, `company_address`, `tax_id`, `phone`, `company_type`, `branch_company_on`, `branch_company_name`, `user_build`, `created_at`, `updated_at`) VALUES
(19, 'ทดสอบ', 'company', 'ทดสอบ2', '0', '0', 'company', '0000', NULL, 'nice', '2020-01-29 10:22:10', '2020-03-13 09:34:41'),
(20, 'ทดสอบ2', 'customer', 'gmeop', 'ogerqp', 'g', 'branch_company', '0001', '55252', 'nice', '2020-01-29 10:26:25', '2020-01-29 10:26:25'),
(21, 'ทดสอบ3', 'company', 'f,f', '565', '8f8f', 'company', '0000', NULL, 'nice', '2020-01-29 10:27:58', '2020-01-29 10:27:58');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `hotel`
--

CREATE TABLE `hotel` (
  `hotel_id` int(12) NOT NULL,
  `hotel_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_tax_invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_tax_invoice_bill` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_titel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_name_display` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_vat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `hotel_name`, `hotel_tax_invoice`, `hotel_tax_invoice_bill`, `hotel_titel`, `hotel_name_display`, `hotel_address`, `hotel_phone`, `hotel_fax`, `hotel_vat`) VALUES
(1, 'TheZign', 'Q', 'J', 'บริษัท อัญชลีวัน จำกัด สำนักงานใหญ่', 'โรงแรม เดอะซายน์', '555/65 หมู่ 5 ต.นาเกลือ อ.บางละมุง จ.ชลบุรี 20150', '038-909800-20 ', '038-909888', '0 2055 45003 03 5'),
(2, 'Z2', 'Z', 'A', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(12) NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_compary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_money` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `not_vat_money` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vat_money` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_vat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_create` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_no`, `invoice_type`, `address_no`, `ref_no`, `hotel`, `invoice_compary`, `invoice_address`, `full_money`, `not_vat_money`, `vat_money`, `type_vat`, `status_invoice`, `user_create`, `created_at`, `updated_at`) VALUES
(294, 'Q200316001', NULL, '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', '500', '35', '535', 'in_vat', 'confirm', 'nice', '2020-03-16 08:30:44', '2020-03-16 08:30:51'),
(295, 'Q200316002', NULL, '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', '1000', '70', '1070', 'in_vat', 'confirm', 'nice', '2020-03-16 09:13:25', '2020-03-16 09:13:28'),
(296, 'Q200316003', NULL, '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', '5000', '350', '5350', 'in_vat', 'confirm', 'nice', '2020-03-16 09:20:43', '2020-03-16 09:20:49'),
(297, 'Q200316004', NULL, '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', '5000', '350', '5350', 'in_vat', 'confirm', 'nice', '2020-03-16 09:23:36', '2020-03-16 10:00:43'),
(298, 'Q200316005', NULL, '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', '1000', '70', '1070', 'in_vat', 'confirm', 'nice', '2020-03-16 09:57:14', '2020-03-16 09:58:43'),
(299, 'Q200323001', NULL, '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-23 12:25:37', '2020-03-23 12:25:37'),
(300, 'Q200323002', NULL, '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-23 12:26:06', '2020-03-23 12:26:07'),
(301, 'Q200324001', NULL, '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-24 17:30:30', '2020-03-24 17:30:31'),
(302, 'Q200324002', 'Invoice_tax', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', '500', '35', '535', 'in_vat', 'confirm', 'nice', '2020-03-24 20:33:33', '2020-03-24 20:36:02');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `invoiceitem`
--

CREATE TABLE `invoiceitem` (
  `invoiceitem_id` int(12) NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `money` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `invoiceitem`
--

INSERT INTO `invoiceitem` (`invoiceitem_id`, `invoice_no`, `list_item`, `money`, `created_at`, `updated_at`) VALUES
(201, 'Q200316001', 'room 28/03/2563-29-03/256.', '500', '2020-03-16 08:30:51', '2020-03-16 08:30:51'),
(202, 'Q200316002', 'room 28/03/2563-29-03/256.', '1000', '2020-03-16 09:13:27', '2020-03-16 09:13:27'),
(203, 'Q200316003', 'room 28/03/2563-29-03/256.', '5000', '2020-03-16 09:20:48', '2020-03-16 09:20:48'),
(209, 'Q200316004', 'room 28/03/2563-29-03/256.', '5000', '2020-03-16 09:59:16', '2020-03-16 09:59:16'),
(210, 'Q200324002', 'room 28/03/2563-29-03/256.', '500', '2020-03-24 20:35:24', '2020-03-24 20:35:24');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `list_tax`
--

CREATE TABLE `list_tax` (
  `list_id` int(12) NOT NULL,
  `list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_build` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `list_tax`
--

INSERT INTO `list_tax` (`list_id`, `list_value`, `user_build`, `created_at`, `updated_at`) VALUES
(1, 'ค่าโรงแรม', 'nice', '2020-01-25 02:44:15', '2020-01-25 02:44:15'),
(4, 'ค่าเที่ยว', 'nice', '2020-01-25 16:08:47', '2020-01-25 16:08:47'),
(6, 'room 28/03/2563-29-03/256.', 'test1', '2020-03-12 09:46:33', '2020-03-12 09:46:33'),
(11, 'TEST', 'test1', '2020-03-14 15:29:16', '2020-03-14 15:29:16');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `log`
--

CREATE TABLE `log` (
  `log_id` int(12) NOT NULL,
  `log_action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_action_detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_data_old` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_data_new` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `log`
--

INSERT INTO `log` (`log_id`, `log_action`, `log_action_detail`, `log_data_old`, `log_data_new`, `log_username`, `created_at`, `updated_at`) VALUES
(270, 'Insert', 'Q200316001', 'null', '{\"invoice_no\":\"Q200316001\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 08:30:44', '2020-03-16 08:30:44'),
(271, 'Update', 'Q200316001', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-16 08:30:44', '2020-03-16 08:30:44'),
(272, 'Insert', 'Q200316001', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"500\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 08:30:51', '2020-03-16 08:30:51'),
(273, 'Update', 'Q200316001', 'null', '{\"full_money\":\"500\",\"not_vat_money\":\"35\",\"vat_money\":\"535\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-16 08:30:51', '2020-03-16 08:30:51'),
(274, 'Delete', 'Address', '{\"address_id\": \"26\",\"del_address_note\":\"ทดสอบการลบ\"}', 'null', 'nice', '2020-03-16 09:05:31', '2020-03-16 09:05:31'),
(275, 'Insert', 'Address', 'null', '{\"company_name\": \"ทดสอบๅ\",\"type_address\":\"company\",\"company_address\":\"ทดสอบ\",\"tax_id\":\"-\",\"phone\":\"-\",\"user_build\":\"nice\",\"company_type\":\"company\",\"branch_company_on\":\"0000\",\"branch_company_name\":\"\"}', 'nice', '2020-03-16 09:06:34', '2020-03-16 09:06:34'),
(276, 'Delete', 'Address', '{\"address_id\": \"27\",\"del_address_note\":\"ทดสอบ การลบ\"}', 'null', 'nice', '2020-03-16 09:06:42', '2020-03-16 09:06:42'),
(277, 'Insert', 'Q200316002', 'null', '{\"invoice_no\":\"Q200316002\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 09:13:25', '2020-03-16 09:13:25'),
(278, 'Update', 'Q200316002', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-16 09:13:25', '2020-03-16 09:13:25'),
(279, 'Insert', 'Q200316002', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"1000\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 09:13:27', '2020-03-16 09:13:27'),
(280, 'Update', 'Q200316002', 'null', '{\"full_money\":\"1000\",\"not_vat_money\":\"70\",\"vat_money\":\"1070\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-16 09:13:28', '2020-03-16 09:13:28'),
(281, 'Insert', 'Q200316003', 'null', '{\"invoice_no\":\"Q200316003\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 09:20:43', '2020-03-16 09:20:43'),
(282, 'Update', 'Q200316003', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-16 09:20:44', '2020-03-16 09:20:44'),
(283, 'Insert', 'Q200316003', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"5000\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 09:20:48', '2020-03-16 09:20:48'),
(284, 'Update', 'Q200316003', 'null', '{\"full_money\":\"5000\",\"not_vat_money\":\"350\",\"vat_money\":\"5350\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-16 09:20:49', '2020-03-16 09:20:49'),
(285, 'Insert', 'Q200316004', 'null', '{\"invoice_no\":\"Q200316004\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 09:23:36', '2020-03-16 09:23:36'),
(286, 'Update', 'Q200316004', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-16 09:23:36', '2020-03-16 09:23:36'),
(287, 'Insert', 'Q200316004', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"1000\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 09:23:41', '2020-03-16 09:23:41'),
(288, 'Update', 'Q200316004', 'null', '{\"full_money\":\"1000\",\"not_vat_money\":\"70\",\"vat_money\":\"1070\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-16 09:23:41', '2020-03-16 09:23:41'),
(289, 'Delete', 'Q200316004', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"1000\",\"del_list_tax_item_note\":\"ไม่เอาแล้ว\",\"user_action\":\"nice\"}', 'null', 'nice', '2020-03-16 09:23:46', '2020-03-16 09:23:46'),
(290, 'Insert', 'Q200316005', 'null', '{\"invoice_no\":\"Q200316005\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 09:57:14', '2020-03-16 09:57:14'),
(291, 'Update', 'Q200316005', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-16 09:57:14', '2020-03-16 09:57:14'),
(292, 'Insert', 'Q200316005', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"1000\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 09:57:16', '2020-03-16 09:57:16'),
(293, 'Update', 'Q200316005', 'null', '{\"full_money\":\"1000\",\"not_vat_money\":\"70\",\"vat_money\":\"1070\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-16 09:57:16', '2020-03-16 09:57:16'),
(294, 'Insert', 'Q200316005', 'null', '{\"list_item\":\"ค่าเที่ยว\",\"money_count\":\"500\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 09:57:33', '2020-03-16 09:57:33'),
(295, 'Update', 'Q200316005', 'null', '{\"full_money\":\"1500\",\"not_vat_money\":\"105\",\"vat_money\":\"1605\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-16 09:57:33', '2020-03-16 09:57:33'),
(296, 'Insert', 'Q200316005', 'null', '{\"list_item\":\"ค่าโรงแรม\",\"money_count\":\"5000\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 09:57:39', '2020-03-16 09:57:39'),
(297, 'Update', 'Q200316005', 'null', '{\"full_money\":\"6500\",\"not_vat_money\":\"455\",\"vat_money\":\"6955\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-16 09:57:39', '2020-03-16 09:57:39'),
(298, 'Delete', 'Q200316005', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"1000\",\"user_action\":\"nice\"}', 'null', 'nice', '2020-03-16 09:58:28', '2020-03-16 09:58:28'),
(299, 'Delete', 'Q200316005', '{\"list_item\":\"ค่าเที่ยว\",\"money_count\":\"500\",\"user_action\":\"nice\"}', 'null', 'nice', '2020-03-16 09:58:28', '2020-03-16 09:58:28'),
(300, 'Delete', 'Q200316005', '{\"list_item\":\"ค่าโรงแรม\",\"money_count\":\"5000\",\"user_action\":\"nice\"}', 'null', 'nice', '2020-03-16 09:58:28', '2020-03-16 09:58:28'),
(301, 'Insert', 'Q200316005', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"1000\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 09:58:42', '2020-03-16 09:58:42'),
(302, 'Update', 'Q200316005', 'null', '{\"full_money\":\"1000\",\"not_vat_money\":\"70\",\"vat_money\":\"1070\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-16 09:58:43', '2020-03-16 09:58:43'),
(303, 'Insert', 'Q200316004', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"5000\",\"user_action\":\"nice\"}', 'nice', '2020-03-16 09:59:16', '2020-03-16 09:59:16'),
(304, 'Update', 'Q200316004', 'null', '{\"full_money\":\"5000\",\"not_vat_money\":\"350\",\"vat_money\":\"5350\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-16 09:59:16', '2020-03-16 09:59:16'),
(305, 'Update', 'Q200316004', 'null', '{\"full_money\":\"4672.9\",\"not_vat_money\":\"327.1\",\"vat_money\":\"5000\",\"type_vat\":\"ex_vat\"}', 'nice', '2020-03-16 10:00:37', '2020-03-16 10:00:37'),
(306, 'Update', 'Q200316004', 'null', '{\"full_money\":\"5000\",\"not_vat_money\":\"350\",\"vat_money\":\"5350\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-16 10:00:39', '2020-03-16 10:00:39'),
(307, 'Update', 'Q200316004', 'null', '{\"full_money\":\"4672.9\",\"not_vat_money\":\"327.1\",\"vat_money\":\"5000\",\"type_vat\":\"ex_vat\"}', 'nice', '2020-03-16 10:00:41', '2020-03-16 10:00:41'),
(308, 'Update', 'Q200316004', 'null', '{\"full_money\":\"5000\",\"not_vat_money\":\"350\",\"vat_money\":\"5350\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-16 10:00:43', '2020-03-16 10:00:43'),
(309, 'Delete', 'Q200316005', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"1000\",\"del_list_tax_item_note\":\"ทดสอบการลบ\",\"user_action\":\"nice\"}', 'null', 'nice', '2020-03-16 13:21:41', '2020-03-16 13:21:41'),
(310, 'Delete', 'Address', '{\"address_id\": \"25\",\"del_address_note\":\"\"}', 'null', 'nice', '2020-03-16 13:21:57', '2020-03-16 13:21:57'),
(311, 'Delete', 'Address', '{\"address_id\": \"22\",\"del_address_note\":\"\"}', 'null', 'nice', '2020-03-16 13:22:15', '2020-03-16 13:22:15'),
(312, 'Insert', 'Address', 'null', '{\"company_name\": \"f\",\"type_address\":\"company\",\"company_address\":\"ff\",\"tax_id\":\"f\",\"phone\":\"f\",\"user_build\":\"nice\",\"company_type\":\"company\",\"branch_company_on\":\"0000\",\"branch_company_name\":\"\"}', 'nice', '2020-03-16 13:22:39', '2020-03-16 13:22:39'),
(313, 'Delete', 'Address', '{\"address_id\": \"28\",\"del_address_note\":\"\"}', 'null', 'nice', '2020-03-16 13:22:42', '2020-03-16 13:22:42'),
(314, 'Insert', 'Address', 'null', '{\"company_name\": \"f\",\"type_address\":\"company\",\"company_address\":\"f\",\"tax_id\":\"f\",\"phone\":\"f\",\"user_build\":\"nice\",\"company_type\":\"company\",\"branch_company_on\":\"0000\",\"branch_company_name\":\"\"}', 'nice', '2020-03-16 13:24:20', '2020-03-16 13:24:20'),
(315, 'Delete', 'Address', '{\"address_id\": \"29\",\"del_address_note\":\"\"}', 'null', 'nice', '2020-03-16 13:24:26', '2020-03-16 13:24:26'),
(316, 'Insert', 'Q200323001', 'null', '{\"invoice_no\":\"Q200323001\",\"user_action\":\"nice\"}', 'nice', '2020-03-23 12:25:37', '2020-03-23 12:25:37'),
(317, 'Update', 'Q200323001', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-23 12:25:37', '2020-03-23 12:25:37'),
(318, 'Insert', 'Q200323002', 'null', '{\"invoice_no\":\"Q200323002\",\"user_action\":\"nice\"}', 'nice', '2020-03-23 12:26:06', '2020-03-23 12:26:06'),
(319, 'Update', 'Q200323002', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-23 12:26:07', '2020-03-23 12:26:07'),
(320, 'Insert', 'Q200324001', 'null', '{\"invoice_no\":\"Q200324001\",\"user_action\":\"nice\"}', 'nice', '2020-03-24 17:30:30', '2020-03-24 17:30:30'),
(321, 'Update', 'Q200324001', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-24 17:30:31', '2020-03-24 17:30:31'),
(322, 'Insert', 'Q200324002', 'null', '{\"invoice_no\":\"Q200324002\",\"user_action\":\"nice\"}', 'nice', '2020-03-24 20:33:33', '2020-03-24 20:33:33'),
(323, 'Update', 'Q200324002', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-24 20:33:34', '2020-03-24 20:33:34'),
(324, 'Insert', 'Q200324002', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"500\",\"user_action\":\"nice\"}', 'nice', '2020-03-24 20:35:24', '2020-03-24 20:35:24'),
(325, 'Update', 'Q200324002', 'null', '{\"full_money\":\"500\",\"not_vat_money\":\"35\",\"vat_money\":\"535\",\"type_vat\":\"\"}', 'nice', '2020-03-24 20:35:24', '2020-03-24 20:35:24'),
(326, 'Update', 'Q200324002', 'null', '{\"full_money\":\"500\",\"not_vat_money\":\"35\",\"vat_money\":\"535\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-24 20:35:50', '2020-03-24 20:35:50'),
(327, 'Update', 'Q200324002', 'null', '{\"full_money\":\"467.29\",\"not_vat_money\":\"32.71\",\"vat_money\":\"500\",\"type_vat\":\"ex_vat\"}', 'nice', '2020-03-24 20:36:00', '2020-03-24 20:36:00'),
(328, 'Update', 'Q200324002', 'null', '{\"full_money\":\"500\",\"not_vat_money\":\"35\",\"vat_money\":\"535\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-24 20:36:02', '2020-03-24 20:36:02');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `user`
--

CREATE TABLE `user` (
  `user_id` int(12) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `name`, `department`, `hotel`, `type_user`, `action`, `ip_login`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'nice', '$2y$10$Kxu6mlhiaLASPg.a2ZSllu6pEBkUAgMG2/H293XrrVjv1QeMcC9ZO', 'Thitipong Inlom', 'IT', 'TheZign,Z2', 'admin', '3', '::1', 'ooKHWTBc5NJ1B0M6labXy2xXBRKV3eDoaisIp1tO', '2020-01-15 06:45:24', '2020-03-24 17:27:45'),
(7, 'test', '$2y$10$WaPxk/ha0ZOQ0cIKHE8vx.qUPKEyhf2jldu2vbv9Gb6.abQ59CJty', 'TEST', 'IT', 'TheZign', 'user', '0', '::1', 'yj0kjTlMjbVtK5LzKyYYH4cI1q621KNW13QhOyUUq1axmGmwgUQ78HXgMHog', '2020-03-05 15:06:38', '2020-03-13 09:15:44'),
(13, 'test1', '$2y$10$U9/KpJ3GtcOlkpl7LwUoNu1J1ANIevCePDrr/PWUPa.FLrZLnLyuG', 'TEST1', 'IT', 'TheZign', 'user', '2', '::1', 'P5BZjn33nKu6Y2yBdq5anShAPLVg1sgmiMNjS4ne', '2020-03-10 13:25:53', '2020-03-14 10:27:25'),
(14, 'test2', '$2y$10$RUgIRFfowGm5WzHc.eupRumxe/rMMyzE9.cPD28aMOv1LEOUEmgMO', 'TEST2', 'IT', 'TheZign', 'user', '3', '172.16.1.99', 'TIDmpi757s4GmCvPEOjRCib5bViaKAL7Z5ss0Apd', '2020-03-10 13:26:39', '2020-03-14 10:02:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  ADD PRIMARY KEY (`invoiceitem_id`);

--
-- Indexes for table `list_tax`
--
ALTER TABLE `list_tax`
  ADD PRIMARY KEY (`list_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotel_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  MODIFY `invoiceitem_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `list_tax`
--
ALTER TABLE `list_tax`
  MODIFY `list_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
