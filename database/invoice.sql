-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05 พ.ย. 2020 เมื่อ 03:25 PM
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
-- โครงสร้างตาราง `address_bill`
--

CREATE TABLE `address_bill` (
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
-- dump ตาราง `address_bill`
--

INSERT INTO `address_bill` (`address_id`, `company_name`, `type_address`, `company_address`, `tax_id`, `phone`, `company_type`, `branch_company_on`, `branch_company_name`, `user_build`, `created_at`, `updated_at`) VALUES
(19, 'ทดสอบ', 'company', 'ทดสอบ2', '0', '0', 'company', '0000', NULL, 'nice', '2020-01-29 10:22:10', '2020-03-13 09:34:41'),
(20, 'ทดสอบ2', 'customer', 'gmeop', 'ogerqp', 'g', 'branch_company', '0001', '55252', 'nice', '2020-01-29 10:26:25', '2020-01-29 10:26:25'),
(30, 'ทดสอบ Tax Invoice Bill', 'company', 'ทดสอบ Tax Invoice Bill', '-', '-', 'company', '0000', NULL, 'nice', '2020-03-25 09:06:44', '2020-03-25 09:06:44');

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
(2, 'Z2', 'Z', 'A', 'บริษัท อัญชลีวัน จำกัด สำนักงานใหญ่', 'โรงแรม ซีทรูบายเดอะซายน์', '555/65 หมู่ 5 ต.นาเกลือ อ.บางละมุง จ.ชลบุรี 20150', '038-909800-20 ', '038-909888', '0 2055 45003 03 5');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(12) NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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

INSERT INTO `invoice` (`invoice_id`, `invoice_no`, `address_no`, `ref_no`, `hotel`, `invoice_compary`, `invoice_address`, `full_money`, `not_vat_money`, `vat_money`, `type_vat`, `status_invoice`, `user_create`, `created_at`, `updated_at`) VALUES
(294, 'Q200316001', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', '500', '35', '535', 'in_vat', 'confirm', 'nice', '2020-03-16 08:30:44', '2020-03-16 08:30:51'),
(295, 'Q200316002', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', '1000', '70', '1070', 'in_vat', 'confirm', 'nice', '2020-03-16 09:13:25', '2020-03-16 09:13:28'),
(296, 'Q200316003', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', '5000', '350', '5350', 'in_vat', 'cancel', 'nice', '2020-03-16 09:20:43', '2020-03-25 08:55:24'),
(297, 'Q200316004', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', '5000', '350', '5350', 'in_vat', 'confirm', 'nice', '2020-03-16 09:23:36', '2020-03-16 10:00:43'),
(298, 'Q200316005', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', '1000', '70', '1070', 'in_vat', 'confirm', 'nice', '2020-03-16 09:57:14', '2020-03-16 09:58:43'),
(299, 'Q200323001', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-23 12:25:37', '2020-03-23 12:25:37'),
(300, 'Q200323002', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-23 12:26:06', '2020-03-23 12:26:07'),
(301, 'Q200324001', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-24 17:30:30', '2020-03-24 17:30:31'),
(302, 'Q200324002', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', '500', '35', '535', 'in_vat', 'confirm', 'nice', '2020-03-24 20:33:33', '2020-03-24 20:36:02'),
(303, 'J200324001', '20', NULL, 'TheZign', 'ทดสอบ2', 'gmeop', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-24 23:56:26', '2020-03-25 08:23:02'),
(304, 'A200325001', '20', NULL, 'Z2', 'ทดสอบ2', 'gmeop', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-25 00:36:31', '2020-03-25 00:36:32'),
(305, 'J200325001', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-25 09:20:10', '2020-03-25 09:20:11');

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
(210, 'Q200324002', 'room 28/03/2563-29-03/256.', '500', '2020-03-24 20:35:24', '2020-03-24 20:35:24'),
(211, 'J200325003', 'room 28/03/2563-29-03/256.', '500', '2020-03-25 09:32:31', '2020-03-25 09:32:31'),
(212, 'J200325004', 'ทดสอบ Tax bill', '500', '2020-03-25 15:55:49', '2020-03-25 15:55:49'),
(213, 'J200325005', 'ทดสอบ Tax bill', '500', '2020-03-25 15:58:32', '2020-03-25 15:58:32');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `invoiceitem_bill`
--

CREATE TABLE `invoiceitem_bill` (
  `invoiceitem_id` int(12) NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `money` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `money_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `money_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `money_sum` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `invoiceitem_bill`
--

INSERT INTO `invoiceitem_bill` (`invoiceitem_id`, `invoice_no`, `list_item`, `list_type`, `money`, `money_number`, `money_type`, `money_sum`, `created_at`, `updated_at`) VALUES
(211, 'J200325006', NULL, NULL, '500', NULL, NULL, NULL, '2020-03-25 16:00:27', '2020-03-25 16:00:27'),
(213, 'J200325007', 'ค่าโรงแรม', NULL, '600', NULL, NULL, NULL, '2020-03-25 16:02:45', '2020-03-25 16:02:45'),
(216, 'J200326003', 'room 28/03/2563-29-03/256.', 'nights', '500', '1', '1', NULL, '2020-03-26 10:46:27', '2020-03-26 10:46:27'),
(217, 'J200326004', 'room 28/03/2563-29-03/256.', 'nights', '500', '1', '1', NULL, '2020-03-26 10:49:04', '2020-03-26 10:49:04'),
(218, 'J200326005', 'room 28/03/2563-29-03/256.', 'nights', '500', '1', '1', NULL, '2020-03-26 10:49:45', '2020-03-26 10:49:45'),
(219, 'J200326006', 'room 28/03/2563-29-03/256.', 'nights', '500', '1', '1', NULL, '2020-03-26 10:50:23', '2020-03-26 10:50:23'),
(220, 'J200326007', 'room 28/03/2563-29-03/256.', 'nights', '500', '1', '1', NULL, '2020-03-26 10:51:10', '2020-03-26 10:51:10'),
(221, 'J200326008', 'room 28/03/2563-29-03/256.', 'nights', '500', '1', '1', NULL, '2020-03-26 10:53:18', '2020-03-26 10:53:18'),
(222, 'J200326009', 'room 28/03/2563-29-03/256.', 'nights', '500', '1', '1', NULL, '2020-03-26 10:54:16', '2020-03-26 10:54:16'),
(225, 'J200326010', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', NULL, '2020-03-26 10:55:12', '2020-03-26 10:55:12'),
(226, 'J200326010', 'ค่าเที่ยว', 'nights', '200', '50', '1', NULL, '2020-03-26 10:55:29', '2020-03-26 10:55:29'),
(227, 'J200326010', 'ค่าโรงแรม', 'nights', '550', '50', '1', NULL, '2020-03-26 10:55:37', '2020-03-26 10:55:37'),
(228, 'J200326010', 'room 28/03/2563-29-03/256.', 'nights', '100', '50', '1', NULL, '2020-03-26 10:55:47', '2020-03-26 10:55:47'),
(229, 'J200326011', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', NULL, '2020-03-26 10:56:16', '2020-03-26 10:56:16'),
(230, 'J200326012', 'room 28/03/2563-29-03/256.', 'nights', '2300', '50', '1', NULL, '2020-03-26 10:56:40', '2020-03-26 10:56:40'),
(231, 'J200326013', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', NULL, '2020-03-26 10:57:43', '2020-03-26 10:57:43'),
(232, 'J200326014', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', NULL, '2020-03-26 11:10:28', '2020-03-26 11:10:28'),
(233, 'J200326014', 'room 28/03/2563-29-03/256.', 'nights', '200', '50', '1', NULL, '2020-03-26 11:10:36', '2020-03-26 11:10:36'),
(234, 'J200326015', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', NULL, '2020-03-26 11:15:47', '2020-03-26 11:15:47'),
(235, 'J200326015', 'room 28/03/2563-29-03/256.', 'nights', '200', '50', '1', NULL, '2020-03-26 11:15:55', '2020-03-26 11:15:55'),
(236, 'J200326016', 'room 28/03/2563-29-03/256.', 'nights', '2600', '50', '1', NULL, '2020-03-26 11:20:00', '2020-03-26 11:20:00'),
(238, 'J200326017', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', '59800', '2020-03-26 11:38:57', '2020-03-26 11:38:57'),
(239, 'J200326017', 'room 28/03/2563-29-03/256.', 'nights', '200', '50', '1', '10000', '2020-03-26 11:39:41', '2020-03-26 11:39:41'),
(240, 'J200326018', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', '59800', '2020-03-26 13:01:23', '2020-03-26 13:01:23'),
(241, 'J200326018', 'ค่าเที่ยว', 'nights', '200', '50', '1', '10000', '2020-03-26 13:02:37', '2020-03-26 13:02:37'),
(242, 'J200326018', 'ค่าโรงแรม', 'nights', '550', '50', '1', '27500', '2020-03-26 13:02:48', '2020-03-26 13:02:48'),
(243, 'J200326018', 'ค่าโรงแรม', 'nights', '100', '50', '1', '5000', '2020-03-26 13:02:57', '2020-03-26 13:02:57'),
(244, 'J200326018', 'ค่าโรงแรม', 'nights', '9000', '1', '1', '9000', '2020-03-26 13:03:05', '2020-03-26 13:03:05'),
(245, 'J200326019', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', '59800', '2020-03-26 13:05:33', '2020-03-26 13:05:33'),
(246, 'J200326020', 'room 28/03/2563-29-03/256.', 'nights', '2300', '50', '1', '115000', '2020-03-26 13:06:30', '2020-03-26 13:06:30'),
(247, 'J200326021', 'room 28/03/2563-29-03/256.', 'nights', '2300', '50', '1', '115000', '2020-03-26 13:07:26', '2020-03-26 13:07:26'),
(248, 'J200326022', 'room 28/03/2563-29-03/256.', 'nights', '2300', '50', '1', '115000', '2020-03-26 13:08:00', '2020-03-26 13:08:00'),
(249, 'J200327001', 'room 28/03/2563-29-03/256.', 'nights', '500', '1', '1', '500', '2020-03-27 11:33:39', '2020-03-27 11:33:39'),
(250, 'J200401001', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', '59800', '2020-04-01 09:36:15', '2020-04-01 09:36:15'),
(251, 'J200401002', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', '59800', '2020-04-01 09:42:07', '2020-04-01 09:42:07'),
(252, 'J200401003', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', '59800', '2020-04-01 09:43:47', '2020-04-01 09:43:47'),
(253, 'J200401004', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', '59800', '2020-04-01 09:45:19', '2020-04-01 09:45:19'),
(254, 'J200401005', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', '59800', '2020-04-01 09:46:13', '2020-04-01 09:46:13'),
(255, 'J200401006', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', '59800', '2020-04-01 09:47:20', '2020-04-01 09:47:20'),
(256, 'J200401007', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', '59800', '2020-04-01 09:49:42', '2020-04-01 09:49:42'),
(257, 'J200402001', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', '59800', '2020-04-02 10:11:39', '2020-04-02 10:11:39'),
(258, 'J200402002', 'room 28/03/2563-29-03/256.', 'nights', '2300', '26', '1', '59800', '2020-04-02 10:12:43', '2020-04-02 10:12:43'),
(259, 'J200402002', 'ค่าโรงแรม', 'nights', '200', '50', '1', '10000', '2020-04-02 10:13:51', '2020-04-02 10:13:51'),
(260, 'J200402002', 'ค่าเที่ยว', 'nights', '550', '50', '1', '27500', '2020-04-02 10:14:03', '2020-04-02 10:14:03'),
(261, 'J200402002', 'ค่าโรงแรม', 'nights', '100', '50', '1', '5000', '2020-04-02 10:14:13', '2020-04-02 10:14:13'),
(262, 'J200402002', 'room 28/03/2563-29-03/256.', 'nights', '9000', '1', '1', '9000', '2020-04-02 10:14:44', '2020-04-02 10:14:44');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `invoice_bill`
--

CREATE TABLE `invoice_bill` (
  `invoice_id` int(12) NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
-- dump ตาราง `invoice_bill`
--

INSERT INTO `invoice_bill` (`invoice_id`, `invoice_no`, `address_no`, `ref_no`, `hotel`, `invoice_compary`, `invoice_address`, `full_money`, `not_vat_money`, `vat_money`, `type_vat`, `status_invoice`, `user_create`, `created_at`, `updated_at`) VALUES
(306, 'J200325001', '30', NULL, 'TheZign', 'ทดสอบ Tax Invoice Bill', 'ทดสอบ Tax Invoice Bill', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-25 09:23:41', '2020-03-25 09:23:41'),
(307, 'J200325002', '30', NULL, 'TheZign', 'ทดสอบ Tax Invoice Bill', 'ทดสอบ Tax Invoice Bill', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-25 09:24:09', '2020-03-25 09:24:09'),
(308, 'J200325003', '30', NULL, 'TheZign', 'ทดสอบ Tax Invoice Bill', 'ทดสอบ Tax Invoice Bill', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-25 09:32:27', '2020-03-25 09:32:27'),
(309, 'J200325004', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-25 15:55:47', '2020-03-25 15:55:47'),
(310, 'J200325005', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-25 15:58:25', '2020-03-25 15:58:26'),
(311, 'J200325006', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-25 16:00:22', '2020-03-25 16:00:23'),
(312, 'J200325007', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-25 16:02:24', '2020-03-25 16:02:25'),
(313, 'J200326001', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 10:24:51', '2020-03-26 10:24:52'),
(314, 'J200326002', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 10:40:37', '2020-03-26 10:40:38'),
(315, 'J200326003', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 10:46:16', '2020-03-26 10:46:16'),
(316, 'J200326004', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 10:49:03', '2020-03-26 10:49:03'),
(317, 'J200326005', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 10:49:40', '2020-03-26 10:49:41'),
(318, 'J200326006', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 10:50:17', '2020-03-26 10:50:18'),
(319, 'J200326007', '20', NULL, 'TheZign', 'ทดสอบ2', 'gmeop', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 10:51:04', '2020-03-26 10:51:05'),
(320, 'J200326008', '30', NULL, 'TheZign', 'ทดสอบ Tax Invoice Bill', 'ทดสอบ Tax Invoice Bill', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 10:53:12', '2020-03-26 10:53:12'),
(321, 'J200326009', '30', NULL, 'TheZign', 'ทดสอบ Tax Invoice Bill', 'ทดสอบ Tax Invoice Bill', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 10:54:08', '2020-03-26 10:54:09'),
(322, 'J200326010', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 10:54:45', '2020-03-26 10:54:46'),
(323, 'J200326011', '30', NULL, 'TheZign', 'ทดสอบ Tax Invoice Bill', 'ทดสอบ Tax Invoice Bill', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 10:56:06', '2020-03-26 10:56:07'),
(324, 'J200326012', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 10:56:35', '2020-03-26 10:56:36'),
(325, 'J200326013', '30', NULL, 'TheZign', 'ทดสอบ Tax Invoice Bill', 'ทดสอบ Tax Invoice Bill', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 10:57:35', '2020-03-26 10:57:35'),
(326, 'J200326014', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 11:10:21', '2020-03-26 11:10:21'),
(327, 'J200326015', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 11:15:37', '2020-03-26 11:15:38'),
(328, 'J200326016', '30', NULL, 'TheZign', 'ทดสอบ Tax Invoice Bill', 'ทดสอบ Tax Invoice Bill', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 11:19:49', '2020-03-26 11:19:50'),
(329, 'J200326017', '30', NULL, 'TheZign', 'ทดสอบ Tax Invoice Bill', 'ทดสอบ Tax Invoice Bill', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 11:38:36', '2020-03-26 11:38:37'),
(330, 'J200326018', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 13:01:14', '2020-03-26 13:01:14'),
(331, 'J200326019', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 13:05:25', '2020-03-26 13:05:26'),
(332, 'J200326020', '30', NULL, 'TheZign', 'ทดสอบ Tax Invoice Bill', 'ทดสอบ Tax Invoice Bill', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 13:06:24', '2020-03-26 13:06:25'),
(333, 'J200326021', '30', NULL, 'TheZign', 'ทดสอบ Tax Invoice Bill', 'ทดสอบ Tax Invoice Bill', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 13:07:21', '2020-03-26 13:07:21'),
(334, 'J200326022', '20', NULL, 'TheZign', 'ทดสอบ2', 'gmeop', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-26 13:07:54', '2020-03-26 13:07:54'),
(335, 'J200327001', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-03-27 11:33:21', '2020-03-27 11:33:22'),
(336, 'J200401001', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-04-01 09:34:15', '2020-04-01 09:34:15'),
(337, 'J200401002', '20', NULL, 'TheZign', 'ทดสอบ2', 'gmeop', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-04-01 09:41:58', '2020-04-01 09:41:59'),
(338, 'J200401003', '20', NULL, 'TheZign', 'ทดสอบ2', 'gmeop', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-04-01 09:43:39', '2020-04-01 09:43:39'),
(339, 'J200401004', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-04-01 09:45:11', '2020-04-01 09:45:11'),
(340, 'J200401005', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-04-01 09:46:06', '2020-04-01 09:46:06'),
(341, 'J200401006', '20', NULL, 'TheZign', 'ทดสอบ2', 'gmeop', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-04-01 09:47:14', '2020-04-01 09:47:14'),
(342, 'J200401007', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-04-01 09:49:31', '2020-04-01 09:49:31'),
(343, 'J200402001', '19', NULL, 'TheZign', 'ทดสอบ', 'ทดสอบ2', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-04-02 10:11:24', '2020-04-02 10:11:25'),
(344, 'J200402002', '20', NULL, 'TheZign', 'ทดสอบ2', 'gmeop', NULL, NULL, NULL, NULL, 'confirm', 'nice', '2020-04-02 10:12:34', '2020-04-02 10:12:35');

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
(11, 'TEST', 'test1', '2020-03-14 15:29:16', '2020-03-14 15:29:16'),
(12, 'ทดสอบ Tax bill', 'nice', '2020-03-25 15:55:37', '2020-03-25 15:55:37');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `list_tax_bill`
--

CREATE TABLE `list_tax_bill` (
  `list_id` int(12) NOT NULL,
  `list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_build` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `list_tax_bill`
--

INSERT INTO `list_tax_bill` (`list_id`, `list_value`, `list_type`, `user_build`, `created_at`, `updated_at`) VALUES
(1, 'ค่าโรงแรม', 'nights', 'nice', '2020-01-25 02:44:15', '2020-01-25 02:44:15'),
(4, 'ค่าเที่ยว', 'nights', 'nice', '2020-01-25 16:08:47', '2020-01-25 16:08:47'),
(6, 'room 28/03/2563-29-03/256.', 'nights', 'test1', '2020-03-12 09:46:33', '2020-03-12 09:46:33');

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
(328, 'Update', 'Q200324002', 'null', '{\"full_money\":\"500\",\"not_vat_money\":\"35\",\"vat_money\":\"535\",\"type_vat\":\"in_vat\"}', 'nice', '2020-03-24 20:36:02', '2020-03-24 20:36:02'),
(329, 'Insert', 'J200324001', 'null', '{\"invoice_no\":\"J200324001\",\"user_action\":\"nice\"}', 'nice', '2020-03-24 23:56:26', '2020-03-24 23:56:26'),
(330, 'Update', 'J200324001', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-24 23:56:27', '2020-03-24 23:56:27'),
(331, 'Insert', 'A200325001', 'null', '{\"invoice_no\":\"A200325001\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 00:36:31', '2020-03-25 00:36:31'),
(332, 'Update', 'A200325001', 'null', '{\"address_no\":\"20\",\"invoice_compary\":\"ทดสอบ2\",\"invoice_address\":\"gmeop\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-25 00:36:32', '2020-03-25 00:36:32'),
(333, 'Update', 'J200324001', 'null', '{\"address_no\":\"20\",\"invoice_compary\":\"ทดสอบ2\",\"invoice_address\":\"gmeop\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-25 08:23:02', '2020-03-25 08:23:02'),
(334, 'Insert', 'Q200316003', '{\"status_invoice\":\"cancel\"}', '{\"status_invoice\":\"cancel\",\"user_action\":\"nice\",\"user_input\":\"nice\"}', 'nice', '2020-03-25 08:55:24', '2020-03-25 08:55:24'),
(335, 'Insert', 'Q200316003', '{\"status_invoice\":\"cancel\"}', '{\"status_invoice\":\"cancel\",\"user_action\":\"nice\",\"user_input\":\"nice\"}', 'nice', '2020-03-25 08:55:32', '2020-03-25 08:55:32'),
(336, 'Insert', 'Address', 'null', '{\"company_name\": \"ทดสอบ Tax_invoice\",\"type_address\":\"company\",\"company_address\":\"ทดสอบ Tax_ invoice\",\"tax_id\":\"-\",\"phone\":\"-\",\"user_build\":\"nice\",\"company_type\":\"company\",\"branch_company_on\":\"0000\",\"branch_company_name\":\"\"}', 'nice', '2020-03-25 09:04:50', '2020-03-25 09:04:50'),
(337, 'Insert', 'Address', 'null', '{\"company_name\": \"ทดสอบ Tax Invoice Bill\",\"type_address\":\"company\",\"company_address\":\"ทดสอบ Tax Invoice Bill\",\"tax_id\":\"-\",\"phone\":\"-\",\"user_build\":\"nice\",\"company_type\":\"company\",\"branch_company_on\":\"0000\",\"branch_company_name\":\"\"}', 'nice', '2020-03-25 09:06:44', '2020-03-25 09:06:44'),
(338, 'Insert', 'J200325001', 'null', '{\"invoice_no\":\"J200325001\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 09:20:10', '2020-03-25 09:20:10'),
(339, 'Update', 'J200325001', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-25 09:20:11', '2020-03-25 09:20:11'),
(340, 'Insert', 'J200325001', 'null', '{\"invoice_no\":\"J200325001\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 09:21:57', '2020-03-25 09:21:57'),
(341, 'Update', 'J200325001', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-25 09:21:58', '2020-03-25 09:21:58'),
(342, 'Insert', 'J200325001', 'null', '{\"invoice_no\":\"J200325001\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 09:23:41', '2020-03-25 09:23:41'),
(343, 'Update', 'J200325001', 'null', '{\"address_no\":\"30\",\"invoice_compary\":\"ทดสอบ Tax Invoice Bill\",\"invoice_address\":\"ทดสอบ Tax Invoice Bill\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-25 09:23:41', '2020-03-25 09:23:41'),
(344, 'Insert', 'J200325002', 'null', '{\"invoice_no\":\"J200325002\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 09:24:09', '2020-03-25 09:24:09'),
(345, 'Update', 'J200325002', 'null', '{\"address_no\":\"30\",\"invoice_compary\":\"ทดสอบ Tax Invoice Bill\",\"invoice_address\":\"ทดสอบ Tax Invoice Bill\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-25 09:24:09', '2020-03-25 09:24:09'),
(346, 'Insert', 'J200325003', 'null', '{\"invoice_no\":\"J200325003\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 09:32:27', '2020-03-25 09:32:27'),
(347, 'Update', 'J200325003', 'null', '{\"address_no\":\"30\",\"invoice_compary\":\"ทดสอบ Tax Invoice Bill\",\"invoice_address\":\"ทดสอบ Tax Invoice Bill\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-25 09:32:27', '2020-03-25 09:32:27'),
(348, 'Insert', 'J200325003', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"500\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 09:32:31', '2020-03-25 09:32:31'),
(349, 'Delete', 'List Tax', '{\"list_id\": \"12\"}', 'null', 'nice', '2020-03-25 09:38:13', '2020-03-25 09:38:13'),
(350, 'Delete', 'List Tax', '{\"list_id\": \"13\"}', 'null', 'nice', '2020-03-25 09:38:16', '2020-03-25 09:38:16'),
(351, 'Insert', 'J200325004', 'null', '{\"invoice_no\":\"J200325004\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 15:55:47', '2020-03-25 15:55:47'),
(352, 'Update', 'J200325004', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-25 15:55:47', '2020-03-25 15:55:47'),
(353, 'Insert', 'J200325004', 'null', '{\"list_item\":\"ทดสอบ Tax bill\",\"money_count\":\"500\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 15:55:49', '2020-03-25 15:55:49'),
(354, 'Insert', 'J200325005', 'null', '{\"invoice_no\":\"J200325005\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 15:58:25', '2020-03-25 15:58:25'),
(355, 'Update', 'J200325005', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-25 15:58:26', '2020-03-25 15:58:26'),
(356, 'Insert', 'J200325005', 'null', '{\"list_item\":\"ทดสอบ Tax bill\",\"money_count\":\"500\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 15:58:32', '2020-03-25 15:58:32'),
(357, 'Insert', 'J200325006', 'null', '{\"invoice_no\":\"J200325006\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 16:00:22', '2020-03-25 16:00:22'),
(358, 'Update', 'J200325006', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-25 16:00:23', '2020-03-25 16:00:23'),
(359, 'Insert', 'J200325006', 'null', '{\"list_item\":\"\",\"money_count\":\"500\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 16:00:27', '2020-03-25 16:00:27'),
(360, 'Insert', 'J200325007', 'null', '{\"invoice_no\":\"J200325007\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 16:02:24', '2020-03-25 16:02:24'),
(361, 'Update', 'J200325007', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-25 16:02:25', '2020-03-25 16:02:25'),
(362, 'Insert', 'J200325007', 'null', '{\"list_item\":\"\",\"money_count\":\"500\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 16:02:31', '2020-03-25 16:02:31'),
(363, 'Delete', 'J200325007', '{\"list_item\":\"\",\"money_count\":\"500\",\"del_list_tax_item_note\":\"1ทดสอบ\",\"user_action\":\"nice\"}', 'null', 'nice', '2020-03-25 16:02:38', '2020-03-25 16:02:38'),
(364, 'Insert', 'J200325007', 'null', '{\"list_item\":\"ค่าโรงแรม\",\"money_count\":\"600\",\"user_action\":\"nice\"}', 'nice', '2020-03-25 16:02:45', '2020-03-25 16:02:45'),
(365, 'Delete', 'List Tax', '{\"list_id\": \"11\"}', 'null', 'nice', '2020-03-26 10:08:11', '2020-03-26 10:08:11'),
(366, 'Insert', 'J200326001', 'null', '{\"invoice_no\":\"J200326001\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:24:51', '2020-03-26 10:24:51'),
(367, 'Update', 'J200326001', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 10:24:52', '2020-03-26 10:24:52'),
(368, 'Insert', 'J200326001', 'null', '{\"list_item\":\"\",\"money_count\":\"500\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:24:56', '2020-03-26 10:24:56'),
(369, 'Delete', 'J200326001', '{\"list_item\":\"\",\"money_count\":\"500\",\"del_list_tax_item_note\":\"\",\"user_action\":\"nice\"}', 'null', 'nice', '2020-03-26 10:25:48', '2020-03-26 10:25:48'),
(370, 'Insert', 'J200326002', 'null', '{\"invoice_no\":\"J200326002\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:40:37', '2020-03-26 10:40:37'),
(371, 'Update', 'J200326002', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 10:40:38', '2020-03-26 10:40:38'),
(372, 'Insert', 'J200326002', 'null', '{\"list_item\":\"ค่าโรงแรม\",\"money_count\":\"500\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:41:02', '2020-03-26 10:41:02'),
(373, 'Delete', 'J200326002', '{\"list_item\":\"ค่าโรงแรม\",\"money_count\":\"500\",\"del_list_tax_item_note\":\"\",\"user_action\":\"nice\"}', 'null', 'nice', '2020-03-26 10:41:07', '2020-03-26 10:41:07'),
(374, 'Insert', 'J200326003', 'null', '{\"invoice_no\":\"J200326003\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:46:16', '2020-03-26 10:46:16'),
(375, 'Update', 'J200326003', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 10:46:16', '2020-03-26 10:46:16'),
(376, 'Insert', 'J200326003', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"500\",\"money_count_number\":\"1\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:46:27', '2020-03-26 10:46:27'),
(377, 'Insert', 'J200326004', 'null', '{\"invoice_no\":\"J200326004\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:49:03', '2020-03-26 10:49:03'),
(378, 'Update', 'J200326004', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 10:49:03', '2020-03-26 10:49:03'),
(379, 'Insert', 'J200326004', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"500\",\"money_count_number\":\"1\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:49:04', '2020-03-26 10:49:04'),
(380, 'Insert', 'J200326005', 'null', '{\"invoice_no\":\"J200326005\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:49:40', '2020-03-26 10:49:40'),
(381, 'Update', 'J200326005', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 10:49:41', '2020-03-26 10:49:41'),
(382, 'Insert', 'J200326005', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"500\",\"money_count_number\":\"1\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:49:45', '2020-03-26 10:49:45'),
(383, 'Insert', 'J200326006', 'null', '{\"invoice_no\":\"J200326006\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:50:17', '2020-03-26 10:50:17'),
(384, 'Update', 'J200326006', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 10:50:18', '2020-03-26 10:50:18'),
(385, 'Insert', 'J200326006', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"500\",\"money_count_number\":\"1\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:50:23', '2020-03-26 10:50:23'),
(386, 'Insert', 'J200326007', 'null', '{\"invoice_no\":\"J200326007\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:51:04', '2020-03-26 10:51:04'),
(387, 'Update', 'J200326007', 'null', '{\"address_no\":\"20\",\"invoice_compary\":\"ทดสอบ2\",\"invoice_address\":\"gmeop\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 10:51:05', '2020-03-26 10:51:05'),
(388, 'Insert', 'J200326007', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"500\",\"money_count_number\":\"1\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:51:10', '2020-03-26 10:51:10'),
(389, 'Insert', 'J200326008', 'null', '{\"invoice_no\":\"J200326008\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:53:12', '2020-03-26 10:53:12'),
(390, 'Update', 'J200326008', 'null', '{\"address_no\":\"30\",\"invoice_compary\":\"ทดสอบ Tax Invoice Bill\",\"invoice_address\":\"ทดสอบ Tax Invoice Bill\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 10:53:12', '2020-03-26 10:53:12'),
(391, 'Insert', 'J200326008', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"500\",\"money_count_number\":\"1\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:53:18', '2020-03-26 10:53:18'),
(392, 'Insert', 'J200326009', 'null', '{\"invoice_no\":\"J200326009\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:54:08', '2020-03-26 10:54:08'),
(393, 'Update', 'J200326009', 'null', '{\"address_no\":\"30\",\"invoice_compary\":\"ทดสอบ Tax Invoice Bill\",\"invoice_address\":\"ทดสอบ Tax Invoice Bill\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 10:54:09', '2020-03-26 10:54:09'),
(394, 'Insert', 'J200326009', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"500\",\"money_count_number\":\"1\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:54:16', '2020-03-26 10:54:16'),
(395, 'Insert', 'J200326010', 'null', '{\"invoice_no\":\"J200326010\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:54:45', '2020-03-26 10:54:45'),
(396, 'Update', 'J200326010', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 10:54:46', '2020-03-26 10:54:46'),
(397, 'Insert', 'J200326010', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"500\",\"money_count_number\":\"1\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:54:51', '2020-03-26 10:54:51'),
(398, 'Insert', 'J200326010', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"1000\",\"money_count_number\":\"5\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:55:01', '2020-03-26 10:55:01'),
(399, 'Insert', 'J200326010', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:55:12', '2020-03-26 10:55:12'),
(400, 'Delete', 'J200326010', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"500\",\"del_list_tax_item_note\":\"\",\"user_action\":\"nice\"}', 'null', 'nice', '2020-03-26 10:55:16', '2020-03-26 10:55:16'),
(401, 'Delete', 'J200326010', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"1000\",\"del_list_tax_item_note\":\"\",\"user_action\":\"nice\"}', 'null', 'nice', '2020-03-26 10:55:19', '2020-03-26 10:55:19'),
(402, 'Insert', 'J200326010', 'null', '{\"list_item\":\"ค่าเที่ยว\",\"money_count\":\"200\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:55:29', '2020-03-26 10:55:29'),
(403, 'Insert', 'J200326010', 'null', '{\"list_item\":\"ค่าโรงแรม\",\"money_count\":\"550\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:55:38', '2020-03-26 10:55:38'),
(404, 'Insert', 'J200326010', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"100\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:55:47', '2020-03-26 10:55:47'),
(405, 'Insert', 'J200326011', 'null', '{\"invoice_no\":\"J200326011\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:56:06', '2020-03-26 10:56:06'),
(406, 'Update', 'J200326011', 'null', '{\"address_no\":\"30\",\"invoice_compary\":\"ทดสอบ Tax Invoice Bill\",\"invoice_address\":\"ทดสอบ Tax Invoice Bill\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 10:56:07', '2020-03-26 10:56:07'),
(407, 'Insert', 'J200326011', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:56:16', '2020-03-26 10:56:16'),
(408, 'Insert', 'J200326012', 'null', '{\"invoice_no\":\"J200326012\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:56:35', '2020-03-26 10:56:35'),
(409, 'Update', 'J200326012', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 10:56:36', '2020-03-26 10:56:36'),
(410, 'Insert', 'J200326012', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:56:40', '2020-03-26 10:56:40'),
(411, 'Insert', 'J200326013', 'null', '{\"invoice_no\":\"J200326013\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:57:35', '2020-03-26 10:57:35'),
(412, 'Update', 'J200326013', 'null', '{\"address_no\":\"30\",\"invoice_compary\":\"ทดสอบ Tax Invoice Bill\",\"invoice_address\":\"ทดสอบ Tax Invoice Bill\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 10:57:35', '2020-03-26 10:57:35'),
(413, 'Insert', 'J200326013', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 10:57:43', '2020-03-26 10:57:43'),
(414, 'Insert', 'J200326014', 'null', '{\"invoice_no\":\"J200326014\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 11:10:21', '2020-03-26 11:10:21'),
(415, 'Update', 'J200326014', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 11:10:21', '2020-03-26 11:10:21'),
(416, 'Insert', 'J200326014', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 11:10:28', '2020-03-26 11:10:28'),
(417, 'Insert', 'J200326014', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"200\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 11:10:36', '2020-03-26 11:10:36'),
(418, 'Insert', 'J200326015', 'null', '{\"invoice_no\":\"J200326015\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 11:15:37', '2020-03-26 11:15:37'),
(419, 'Update', 'J200326015', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 11:15:38', '2020-03-26 11:15:38'),
(420, 'Insert', 'J200326015', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 11:15:47', '2020-03-26 11:15:47'),
(421, 'Insert', 'J200326015', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"200\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 11:15:55', '2020-03-26 11:15:55'),
(422, 'Insert', 'J200326016', 'null', '{\"invoice_no\":\"J200326016\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 11:19:49', '2020-03-26 11:19:49'),
(423, 'Update', 'J200326016', 'null', '{\"address_no\":\"30\",\"invoice_compary\":\"ทดสอบ Tax Invoice Bill\",\"invoice_address\":\"ทดสอบ Tax Invoice Bill\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 11:19:50', '2020-03-26 11:19:50'),
(424, 'Insert', 'J200326016', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2600\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 11:20:00', '2020-03-26 11:20:00'),
(425, 'Insert', 'J200326016', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"600\",\"money_count_number\":\"1\",\"money_count_type\":\"1\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 11:20:39', '2020-03-26 11:20:39'),
(426, 'Delete', 'J200326016', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"600\",\"del_list_tax_item_note\":\"\",\"user_action\":\"nice\"}', 'null', 'nice', '2020-03-26 11:20:51', '2020-03-26 11:20:51'),
(427, 'Insert', 'J200326017', 'null', '{\"invoice_no\":\"J200326017\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 11:38:36', '2020-03-26 11:38:36'),
(428, 'Update', 'J200326017', 'null', '{\"address_no\":\"30\",\"invoice_compary\":\"ทดสอบ Tax Invoice Bill\",\"invoice_address\":\"ทดสอบ Tax Invoice Bill\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 11:38:37', '2020-03-26 11:38:37'),
(429, 'Insert', 'J200326017', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"money_sum\":\"59800\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 11:38:57', '2020-03-26 11:38:57'),
(430, 'Insert', 'J200326017', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"200\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"money_sum\":\"10000\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 11:39:41', '2020-03-26 11:39:41'),
(431, 'Insert', 'J200326018', 'null', '{\"invoice_no\":\"J200326018\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:01:14', '2020-03-26 13:01:14'),
(432, 'Update', 'J200326018', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 13:01:14', '2020-03-26 13:01:14'),
(433, 'Insert', 'J200326018', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"money_sum\":\"59800\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:01:23', '2020-03-26 13:01:23'),
(434, 'Insert', 'J200326018', 'null', '{\"list_item\":\"ค่าเที่ยว\",\"money_count\":\"200\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"money_sum\":\"10000\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:02:37', '2020-03-26 13:02:37'),
(435, 'Insert', 'J200326018', 'null', '{\"list_item\":\"ค่าโรงแรม\",\"money_count\":\"550\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"money_sum\":\"27500\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:02:48', '2020-03-26 13:02:48'),
(436, 'Insert', 'J200326018', 'null', '{\"list_item\":\"ค่าโรงแรม\",\"money_count\":\"100\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"money_sum\":\"5000\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:02:57', '2020-03-26 13:02:57'),
(437, 'Insert', 'J200326018', 'null', '{\"list_item\":\"ค่าโรงแรม\",\"money_count\":\"9000\",\"money_count_number\":\"1\",\"money_count_type\":\"1\",\"money_sum\":\"9000\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:03:05', '2020-03-26 13:03:05'),
(438, 'Insert', 'J200326019', 'null', '{\"invoice_no\":\"J200326019\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:05:25', '2020-03-26 13:05:25'),
(439, 'Update', 'J200326019', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 13:05:26', '2020-03-26 13:05:26'),
(440, 'Insert', 'J200326019', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"money_sum\":\"59800\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:05:33', '2020-03-26 13:05:33'),
(441, 'Insert', 'J200326020', 'null', '{\"invoice_no\":\"J200326020\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:06:24', '2020-03-26 13:06:24'),
(442, 'Update', 'J200326020', 'null', '{\"address_no\":\"30\",\"invoice_compary\":\"ทดสอบ Tax Invoice Bill\",\"invoice_address\":\"ทดสอบ Tax Invoice Bill\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 13:06:25', '2020-03-26 13:06:25'),
(443, 'Insert', 'J200326020', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"money_sum\":\"115000\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:06:30', '2020-03-26 13:06:30'),
(444, 'Insert', 'J200326021', 'null', '{\"invoice_no\":\"J200326021\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:07:21', '2020-03-26 13:07:21'),
(445, 'Update', 'J200326021', 'null', '{\"address_no\":\"30\",\"invoice_compary\":\"ทดสอบ Tax Invoice Bill\",\"invoice_address\":\"ทดสอบ Tax Invoice Bill\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 13:07:21', '2020-03-26 13:07:21'),
(446, 'Insert', 'J200326021', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"money_sum\":\"115000\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:07:26', '2020-03-26 13:07:26'),
(447, 'Insert', 'J200326022', 'null', '{\"invoice_no\":\"J200326022\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:07:54', '2020-03-26 13:07:54'),
(448, 'Update', 'J200326022', 'null', '{\"address_no\":\"20\",\"invoice_compary\":\"ทดสอบ2\",\"invoice_address\":\"gmeop\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-26 13:07:54', '2020-03-26 13:07:54'),
(449, 'Insert', 'J200326022', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"money_sum\":\"115000\",\"user_action\":\"nice\"}', 'nice', '2020-03-26 13:08:00', '2020-03-26 13:08:00'),
(450, 'Insert', 'J200327001', 'null', '{\"invoice_no\":\"J200327001\",\"user_action\":\"nice\"}', 'nice', '2020-03-27 11:33:21', '2020-03-27 11:33:21'),
(451, 'Update', 'J200327001', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-03-27 11:33:22', '2020-03-27 11:33:22'),
(452, 'Insert', 'J200327001', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"500\",\"money_count_number\":\"1\",\"money_count_type\":\"1\",\"money_sum\":\"500\",\"user_action\":\"nice\"}', 'nice', '2020-03-27 11:33:39', '2020-03-27 11:33:39'),
(453, 'Insert', 'J200401001', 'null', '{\"invoice_no\":\"J200401001\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:34:15', '2020-04-01 09:34:15'),
(454, 'Update', 'J200401001', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-04-01 09:34:15', '2020-04-01 09:34:15'),
(455, 'Insert', 'J200401001', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"money_sum\":\"59800\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:36:15', '2020-04-01 09:36:15'),
(456, 'Insert', 'J200401002', 'null', '{\"invoice_no\":\"J200401002\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:41:58', '2020-04-01 09:41:58'),
(457, 'Update', 'J200401002', 'null', '{\"address_no\":\"20\",\"invoice_compary\":\"ทดสอบ2\",\"invoice_address\":\"gmeop\",\"status_invoice\":\"confirm\"}', 'nice', '2020-04-01 09:41:59', '2020-04-01 09:41:59'),
(458, 'Insert', 'J200401002', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"money_sum\":\"59800\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:42:07', '2020-04-01 09:42:07'),
(459, 'Insert', 'J200401003', 'null', '{\"invoice_no\":\"J200401003\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:43:39', '2020-04-01 09:43:39'),
(460, 'Update', 'J200401003', 'null', '{\"address_no\":\"20\",\"invoice_compary\":\"ทดสอบ2\",\"invoice_address\":\"gmeop\",\"status_invoice\":\"confirm\"}', 'nice', '2020-04-01 09:43:39', '2020-04-01 09:43:39'),
(461, 'Insert', 'J200401003', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"money_sum\":\"59800\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:43:47', '2020-04-01 09:43:47'),
(462, 'Insert', 'J200401004', 'null', '{\"invoice_no\":\"J200401004\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:45:11', '2020-04-01 09:45:11'),
(463, 'Update', 'J200401004', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-04-01 09:45:11', '2020-04-01 09:45:11'),
(464, 'Insert', 'J200401004', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"money_sum\":\"59800\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:45:19', '2020-04-01 09:45:19'),
(465, 'Insert', 'J200401005', 'null', '{\"invoice_no\":\"J200401005\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:46:06', '2020-04-01 09:46:06'),
(466, 'Update', 'J200401005', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-04-01 09:46:06', '2020-04-01 09:46:06'),
(467, 'Insert', 'J200401005', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"money_sum\":\"59800\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:46:13', '2020-04-01 09:46:13'),
(468, 'Insert', 'J200401006', 'null', '{\"invoice_no\":\"J200401006\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:47:14', '2020-04-01 09:47:14'),
(469, 'Update', 'J200401006', 'null', '{\"address_no\":\"20\",\"invoice_compary\":\"ทดสอบ2\",\"invoice_address\":\"gmeop\",\"status_invoice\":\"confirm\"}', 'nice', '2020-04-01 09:47:14', '2020-04-01 09:47:14'),
(470, 'Insert', 'J200401006', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"money_sum\":\"59800\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:47:20', '2020-04-01 09:47:20'),
(471, 'Insert', 'J200401007', 'null', '{\"invoice_no\":\"J200401007\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:49:31', '2020-04-01 09:49:31'),
(472, 'Update', 'J200401007', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-04-01 09:49:31', '2020-04-01 09:49:31'),
(473, 'Insert', 'J200401007', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"money_sum\":\"59800\",\"user_action\":\"nice\"}', 'nice', '2020-04-01 09:49:42', '2020-04-01 09:49:42'),
(474, 'Insert', 'J200402001', 'null', '{\"invoice_no\":\"J200402001\",\"user_action\":\"nice\"}', 'nice', '2020-04-02 10:11:24', '2020-04-02 10:11:24'),
(475, 'Update', 'J200402001', 'null', '{\"address_no\":\"19\",\"invoice_compary\":\"ทดสอบ\",\"invoice_address\":\"ทดสอบ2\",\"status_invoice\":\"confirm\"}', 'nice', '2020-04-02 10:11:25', '2020-04-02 10:11:25'),
(476, 'Insert', 'J200402001', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"money_sum\":\"59800\",\"user_action\":\"nice\"}', 'nice', '2020-04-02 10:11:39', '2020-04-02 10:11:39'),
(477, 'Insert', 'J200402002', 'null', '{\"invoice_no\":\"J200402002\",\"user_action\":\"nice\"}', 'nice', '2020-04-02 10:12:34', '2020-04-02 10:12:34'),
(478, 'Update', 'J200402002', 'null', '{\"address_no\":\"20\",\"invoice_compary\":\"ทดสอบ2\",\"invoice_address\":\"gmeop\",\"status_invoice\":\"confirm\"}', 'nice', '2020-04-02 10:12:35', '2020-04-02 10:12:35'),
(479, 'Insert', 'J200402002', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"2300\",\"money_count_number\":\"26\",\"money_count_type\":\"1\",\"money_sum\":\"59800\",\"user_action\":\"nice\"}', 'nice', '2020-04-02 10:12:43', '2020-04-02 10:12:43'),
(480, 'Insert', 'J200402002', 'null', '{\"list_item\":\"ค่าโรงแรม\",\"money_count\":\"200\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"money_sum\":\"10000\",\"user_action\":\"nice\"}', 'nice', '2020-04-02 10:13:51', '2020-04-02 10:13:51'),
(481, 'Insert', 'J200402002', 'null', '{\"list_item\":\"ค่าเที่ยว\",\"money_count\":\"550\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"money_sum\":\"27500\",\"user_action\":\"nice\"}', 'nice', '2020-04-02 10:14:03', '2020-04-02 10:14:03'),
(482, 'Insert', 'J200402002', 'null', '{\"list_item\":\"ค่าโรงแรม\",\"money_count\":\"100\",\"money_count_number\":\"50\",\"money_count_type\":\"1\",\"money_sum\":\"5000\",\"user_action\":\"nice\"}', 'nice', '2020-04-02 10:14:13', '2020-04-02 10:14:13'),
(483, 'Insert', 'J200402002', 'null', '{\"list_item\":\"room 28/03/2563-29-03/256.\",\"money_count\":\"9000\",\"money_count_number\":\"1\",\"money_count_type\":\"1\",\"money_sum\":\"9000\",\"user_action\":\"nice\"}', 'nice', '2020-04-02 10:14:44', '2020-04-02 10:14:44');

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
(4, 'nice', '$2y$10$Kxu6mlhiaLASPg.a2ZSllu6pEBkUAgMG2/H293XrrVjv1QeMcC9ZO', 'Thitipong Inlom', 'IT', 'TheZign,Z2', 'admin', '3', '::1', 'K3ToabLIIahm1kNEfOjpYehFiz8NvSDRl1QA1gnw', '2020-01-15 06:45:24', '2020-11-05 21:22:00'),
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
-- Indexes for table `address_bill`
--
ALTER TABLE `address_bill`
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
-- Indexes for table `invoiceitem_bill`
--
ALTER TABLE `invoiceitem_bill`
  ADD PRIMARY KEY (`invoiceitem_id`);

--
-- Indexes for table `invoice_bill`
--
ALTER TABLE `invoice_bill`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `list_tax`
--
ALTER TABLE `list_tax`
  ADD PRIMARY KEY (`list_id`);

--
-- Indexes for table `list_tax_bill`
--
ALTER TABLE `list_tax_bill`
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
  MODIFY `address_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `address_bill`
--
ALTER TABLE `address_bill`
  MODIFY `address_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotel_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  MODIFY `invoiceitem_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `invoiceitem_bill`
--
ALTER TABLE `invoiceitem_bill`
  MODIFY `invoiceitem_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT for table `invoice_bill`
--
ALTER TABLE `invoice_bill`
  MODIFY `invoice_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345;

--
-- AUTO_INCREMENT for table `list_tax`
--
ALTER TABLE `list_tax`
  MODIFY `list_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `list_tax_bill`
--
ALTER TABLE `list_tax_bill`
  MODIFY `list_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=484;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
