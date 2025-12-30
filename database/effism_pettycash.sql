-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2025 at 08:29 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `effism_pettycash`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `attachment_id` int(11) NOT NULL,
  `claim_id` int(11) NOT NULL,
  `detail_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`attachment_id`, `claim_id`, `detail_id`, `file_name`, `file_path`, `uploaded_at`) VALUES
(1, 10, 7, '1763397130_status_assignment_logic.png', '../uploads/1763397130_status_assignment_logic.png', '2025-11-17 16:32:10'),
(2, 11, 8, '1763479803_bus-invoice.pdf', '../uploads/1763479803_bus-invoice.pdf', '2025-11-18 15:30:03'),
(3, 12, 9, '1763491711_bus-invoice.pdf', '../uploads/1763491711_bus-invoice.pdf', '2025-11-18 18:48:31'),
(4, 13, 10, '1763530288_Student Undertaking Report (2).pdf', 'uploads/1763530288_Student Undertaking Report (2).pdf', '2025-11-19 05:31:28'),
(5, 14, 11, '1763541647_bus-invoice.pdf', 'uploads/1763541647_bus-invoice.pdf', '2025-11-19 08:40:47'),
(6, 15, 12, '1764133910_bus-invoice.pdf', 'uploads/1764133910_bus-invoice.pdf', '2025-11-26 05:11:50'),
(7, 16, 13, '1764135330_bus-invoice.pdf', 'uploads/1764135330_bus-invoice.pdf', '2025-11-26 05:35:30'),
(8, 17, 14, '1764136158_bus-invoice.pdf', 'uploads/1764136158_bus-invoice.pdf', '2025-11-26 05:49:18'),
(9, 18, 15, '1764137792_bus-invoice.pdf', 'uploads/1764137792_bus-invoice.pdf', '2025-11-26 06:16:32'),
(10, 19, 16, '1764138059_bus-invoice.pdf', 'uploads/1764138059_bus-invoice.pdf', '2025-11-26 06:20:59'),
(11, 20, 17, '1764138547_bus-invoice.pdf', 'uploads/1764138547_bus-invoice.pdf', '2025-11-26 06:29:07'),
(12, 21, 18, '1764150596_bus-invoice.pdf', 'uploads/1764150596_bus-invoice.pdf', '2025-11-26 09:49:56'),
(13, 21, 19, '1764150596_Q.pdf', 'uploads/1764150596_Q.pdf', '2025-11-26 09:49:56'),
(14, 22, 20, '1764154131_bus-invoice.pdf', 'uploads/1764154131_bus-invoice.pdf', '2025-11-26 10:48:51'),
(15, 23, 21, '1764155044_bus-invoice.pdf', 'uploads/1764155044_bus-invoice.pdf', '2025-11-26 11:04:04'),
(16, 23, 22, '1764155044_Q.pdf', 'uploads/1764155044_Q.pdf', '2025-11-26 11:04:04'),
(17, 23, 23, '1764155044_VCC.pdf', 'uploads/1764155044_VCC.pdf', '2025-11-26 11:04:04'),
(18, 24, 24, '1764155153_bus-invoice.pdf', 'uploads/1764155153_bus-invoice.pdf', '2025-11-26 11:05:53'),
(19, 24, 25, '1764155153_Q.pdf', 'uploads/1764155153_Q.pdf', '2025-11-26 11:05:53'),
(20, 24, 26, '1764155153_VCC.pdf', 'uploads/1764155153_VCC.pdf', '2025-11-26 11:05:53'),
(21, 25, 27, '1764155460_bus-invoice.pdf', 'uploads/1764155460_bus-invoice.pdf', '2025-11-26 11:11:00'),
(22, 26, 28, '1764155772_VCC.pdf', 'uploads/1764155772_VCC.pdf', '2025-11-26 11:16:12'),
(23, 27, 29, '1765360187_Transcript_2.0_updated.pdf', 'uploads/1765360187_Transcript_2.0_updated.pdf', '2025-12-10 09:49:47'),
(24, 28, 30, '1765435401_Transcript_2.0_updated.pdf', 'uploads/1765435401_Transcript_2.0_updated.pdf', '2025-12-11 06:43:21'),
(25, 29, 31, '1765435700_Transcript_2.0_updated.pdf', 'uploads/1765435700_Transcript_2.0_updated.pdf', '2025-12-11 06:48:20'),
(26, 30, 32, '1765437754_Transcript_2.0_updated.pdf', 'uploads/1765437754_Transcript_2.0_updated.pdf', '2025-12-11 07:22:34'),
(27, 31, 33, '1765438321_Transcript_2.0_updated.pdf', 'uploads/1765438321_Transcript_2.0_updated.pdf', '2025-12-11 07:32:01'),
(28, 32, 34, '1765980538_ChatGPT_Image_Dec_17__2025__06_21_24_PM.png', 'uploads/1765980538_ChatGPT_Image_Dec_17__2025__06_21_24_PM.png', '2025-12-17 14:08:58'),
(29, 33, 35, '1765982492_ChatGPT_Image_Dec_17__2025__06_03_08_PM.png', 'uploads/1765982492_ChatGPT_Image_Dec_17__2025__06_03_08_PM.png', '2025-12-17 14:41:32'),
(30, 34, 36, '1765988034_ChatGPT_Image_Dec_17__2025__06_05_35_PM.png', 'uploads/1765988034_ChatGPT_Image_Dec_17__2025__06_05_35_PM.png', '2025-12-17 16:13:54'),
(31, 35, 37, '1765988330_ChatGPT_Image_Dec_17__2025__06_19_33_PM.png', 'uploads/1765988330_ChatGPT_Image_Dec_17__2025__06_19_33_PM.png', '2025-12-17 16:18:50'),
(32, 36, 38, '1765988398_ChatGPT_Image_Dec_17__2025__06_19_33_PM.png', 'uploads/1765988398_ChatGPT_Image_Dec_17__2025__06_19_33_PM.png', '2025-12-17 16:19:58'),
(33, 37, 39, '1765988955_ChatGPT_Image_Dec_17__2025__06_05_35_PM.png', 'uploads/1765988955_ChatGPT_Image_Dec_17__2025__06_05_35_PM.png', '2025-12-17 16:29:15'),
(34, 37, 40, '1765988955_ChatGPT_Image_Dec_17__2025__06_21_24_PM.png', 'uploads/1765988955_ChatGPT_Image_Dec_17__2025__06_21_24_PM.png', '2025-12-17 16:29:15'),
(35, 38, 41, '1765989043_ChatGPT_Image_Dec_17__2025__06_05_35_PM.png', 'uploads/1765989043_ChatGPT_Image_Dec_17__2025__06_05_35_PM.png', '2025-12-17 16:30:43'),
(36, 38, 42, '1765989043_ChatGPT_Image_Dec_17__2025__06_21_24_PM.png', 'uploads/1765989043_ChatGPT_Image_Dec_17__2025__06_21_24_PM.png', '2025-12-17 16:30:43'),
(37, 39, 43, '1765989269_ChatGPT_Image_Dec_17__2025__06_21_23_PM.png', 'uploads/1765989269_ChatGPT_Image_Dec_17__2025__06_21_23_PM.png', '2025-12-17 16:34:29'),
(38, 40, 44, '1765989427_ChatGPT_Image_Dec_17__2025__06_05_35_PM.png', 'uploads/1765989427_ChatGPT_Image_Dec_17__2025__06_05_35_PM.png', '2025-12-17 16:37:07'),
(39, 41, 45, '1765989861_ChatGPT_Image_Dec_17__2025__06_03_08_PM.png', 'uploads/1765989861_ChatGPT_Image_Dec_17__2025__06_03_08_PM.png', '2025-12-17 16:44:21'),
(40, 43, 47, '1765992356_ChatGPT_Image_Dec_17__2025__06_19_33_PM.png', 'uploads/1765992356_ChatGPT_Image_Dec_17__2025__06_19_33_PM.png', '2025-12-17 17:25:56'),
(41, 44, 48, '1765992762_ChatGPT_Image_Dec_17__2025__06_05_35_PM.png', 'uploads/1765992762_ChatGPT_Image_Dec_17__2025__06_05_35_PM.png', '2025-12-17 17:32:42'),
(42, 45, 49, '1765993313_ChatGPT_Image_Dec_17__2025__06_03_08_PM.png', 'uploads/1765993313_ChatGPT_Image_Dec_17__2025__06_03_08_PM.png', '2025-12-17 17:41:53'),
(43, 46, 50, '1765993456_ChatGPT_Image_Dec_17__2025__06_19_33_PM.png', 'uploads/1765993456_ChatGPT_Image_Dec_17__2025__06_19_33_PM.png', '2025-12-17 17:44:16'),
(44, 47, 51, '1765993550_ChatGPT_Image_Dec_17__2025__06_03_08_PM.png', 'uploads/1765993550_ChatGPT_Image_Dec_17__2025__06_03_08_PM.png', '2025-12-17 17:45:50'),
(45, 48, 52, '1765993878_ChatGPT_Image_Dec_17__2025__06_05_35_PM.png', 'uploads/1765993878_ChatGPT_Image_Dec_17__2025__06_05_35_PM.png', '2025-12-17 17:51:18'),
(46, 49, 53, '1765994099_ChatGPT_Image_Dec_17__2025__06_19_33_PM.png', 'uploads/1765994099_ChatGPT_Image_Dec_17__2025__06_19_33_PM.png', '2025-12-17 17:54:59'),
(47, 50, 54, '1766397119_images.jpeg', 'uploads/1766397119_images.jpeg', '2025-12-22 09:51:59'),
(48, 51, 56, '1766398444_images.jpeg', 'uploads/1766398444_images.jpeg', '2025-12-22 10:14:04'),
(49, 52, 58, '1766398511_images.jpeg', 'uploads/1766398511_images.jpeg', '2025-12-22 10:15:11'),
(50, 53, 59, '1766399330_images.jpeg', 'uploads/1766399330_images.jpeg', '2025-12-22 10:28:50'),
(51, 54, 60, '1766399441_images.jpeg', 'uploads/1766399441_images.jpeg', '2025-12-22 10:30:41'),
(52, 57, 63, '1766404951_images.jpeg', 'uploads/1766404951_images.jpeg', '2025-12-22 12:02:31'),
(53, 58, 65, '1766405827_images.jpeg', 'uploads/1766405827_images.jpeg', '2025-12-22 12:17:07'),
(54, 59, 67, '1766406033_images.jpeg', 'uploads/1766406033_images.jpeg', '2025-12-22 12:20:33'),
(55, 60, 68, '1766409023_images.jpeg', 'uploads/1766409023_images.jpeg', '2025-12-22 13:10:23'),
(56, 61, 69, '1766409249_images.jpeg', 'uploads/1766409249_images.jpeg', '2025-12-22 13:14:09'),
(57, 62, 71, '1766409642_images.jpeg', 'uploads/1766409642_images.jpeg', '2025-12-22 13:20:42'),
(58, 63, 72, '1766410024_images.jpeg', 'uploads/1766410024_images.jpeg', '2025-12-22 13:27:04'),
(59, 64, 73, '1766410834_images.jpeg', 'uploads/1766410834_images.jpeg', '2025-12-22 13:40:34'),
(60, 65, 75, '1766411116_images.jpeg', 'uploads/1766411116_images.jpeg', '2025-12-22 13:45:16'),
(61, 65, 77, '1766411116_images.jpeg', 'uploads/1766411116_images.jpeg', '2025-12-22 13:45:16'),
(62, 66, 78, '1766411444_images.jpeg', 'uploads/1766411444_images.jpeg', '2025-12-22 13:50:44'),
(63, 67, 79, '1766412871_images.jpeg', 'uploads/1766412871_images.jpeg', '2025-12-22 14:14:31'),
(64, 67, 81, '1766412871_images.jpeg', 'uploads/1766412871_images.jpeg', '2025-12-22 14:14:31'),
(65, 68, 82, '1766412946_images.jpeg', 'uploads/1766412946_images.jpeg', '2025-12-22 14:15:46'),
(66, 69, 83, '1766413024_images.jpeg', 'uploads/1766413024_images.jpeg', '2025-12-22 14:17:04'),
(67, 72, 84, '1766730999_Image_Dec_24__2025__02_58_21_PM.png', 'uploads/1766730999_Image_Dec_24__2025__02_58_21_PM.png', '2025-12-26 06:36:39'),
(68, 73, 85, '1766731924_images.jpeg', 'uploads/1766731924_images.jpeg', '2025-12-26 06:52:04');

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `log_id` int(11) NOT NULL,
  `claim_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `performed_by` int(11) DEFAULT NULL,
  `role_level` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`log_id`, `claim_id`, `user_id`, `action`, `performed_by`, `role_level`, `note`, `created_at`) VALUES
(1, 4, 8, 'Submitted', NULL, NULL, 'Claim created', '2025-11-17 09:13:21'),
(2, 6, 8, 'Submitted', NULL, NULL, 'Claim created and assigned to Reviewer', '2025-11-17 11:53:12'),
(3, NULL, 8, NULL, NULL, NULL, NULL, '2025-11-17 12:04:45'),
(4, NULL, 8, NULL, NULL, NULL, NULL, '2025-11-17 12:04:47'),
(5, NULL, 8, NULL, NULL, NULL, NULL, '2025-11-17 12:04:48'),
(6, NULL, 8, NULL, NULL, NULL, NULL, '2025-11-17 12:04:49'),
(7, 6, 9, 'Rejected', NULL, NULL, 'Rejected by approver', '2025-11-17 15:45:02'),
(8, 10, 8, 'Submitted', NULL, NULL, 'Claim created', '2025-11-17 16:32:10'),
(9, 10, 9, 'Clarification Required', NULL, NULL, 'Sent back for clarification', '2025-11-17 16:32:38'),
(10, 10, 8, 'Approved', NULL, NULL, 'Approved (no next role configured)', '2025-11-17 16:33:07'),
(11, 11, 8, 'Submitted', NULL, NULL, 'Claim created', '2025-11-18 15:30:03'),
(12, 12, 8, 'Submitted', NULL, NULL, 'Claim created', '2025-11-18 18:48:31'),
(13, 12, 9, 'Clarification Required', NULL, NULL, 'Sent back for clarification', '2025-11-19 02:53:19'),
(14, 12, 8, 'Resubmitted', NULL, NULL, '', '2025-11-19 04:11:02'),
(15, 12, 9, 'Approved', NULL, NULL, '', '2025-11-19 04:13:14'),
(16, 12, 10, 'Approved', NULL, NULL, '', '2025-11-19 04:14:30'),
(17, 12, 11, 'Approved', NULL, NULL, '', '2025-11-19 04:15:31'),
(18, 12, 12, 'Approved', NULL, NULL, '', '2025-11-19 04:16:10'),
(19, 12, 13, 'Final Approved', NULL, NULL, '', '2025-11-19 04:16:38'),
(20, 13, 9, 'Approved', NULL, NULL, 'Approved and assigned to divisionHead (user_id=11)', '2025-11-19 05:32:39'),
(21, 13, 11, 'Approved', NULL, NULL, 'Approved and assigned to accountsReviewer (user_id=12)', '2025-11-19 05:33:06'),
(22, 14, 9, 'Approved', NULL, NULL, 'Approved (role not in workflow)', '2025-11-19 08:42:59'),
(23, 15, 9, 'Approved', NULL, NULL, 'Approved (role not in workflow)', '2025-11-26 05:12:37'),
(24, 16, 9, 'Approved', NULL, NULL, 'Approved (role not in workflow)', '2025-11-26 05:35:46'),
(25, 17, 9, 'Final Approved', NULL, NULL, 'Remarks', '2025-11-26 05:49:39'),
(26, 11, 9, 'Final Approved', NULL, NULL, '', '2025-11-26 05:54:44'),
(27, 18, 9, 'Approved', NULL, NULL, 'Remarks', '2025-11-26 06:16:50'),
(28, 18, 10, 'Approved', NULL, NULL, 'Invoice Remarks', '2025-11-26 06:17:29'),
(29, 18, 11, 'Approved', NULL, NULL, 'Division Remarks', '2025-11-26 06:17:58'),
(30, 18, 12, 'Approved', NULL, NULL, 'Account Rev Remarks', '2025-11-26 06:18:44'),
(31, 18, 13, 'Final Approved', NULL, NULL, 'Final Approval', '2025-11-26 06:19:10'),
(32, 20, 9, 'Approved', NULL, NULL, 'Reviewer Remarks', '2025-11-26 06:29:30'),
(33, 20, 11, 'Approved', NULL, NULL, 'Division Head Remarks', '2025-11-26 06:29:50'),
(34, 20, 13, 'Final Approved', NULL, NULL, 'Final Remarks', '2025-11-26 06:30:15'),
(35, 21, 9, 'Clarification Required', NULL, NULL, 'Sent back for clarification', '2025-11-26 09:50:27'),
(36, 21, 8, 'Resubmitted', NULL, NULL, 'Resubmitted by requester', '2025-11-26 09:50:44'),
(37, 21, 9, 'Rejected', NULL, NULL, 'Rejected by approver', '2025-11-26 09:51:02'),
(38, 22, 9, 'Clarification Required', NULL, NULL, 'Need clarification.', '2025-11-26 10:51:46'),
(39, 22, 8, 'Resubmitted', NULL, NULL, 'This is Clarification', '2025-11-26 10:52:38'),
(40, 22, 9, 'Approved', NULL, NULL, 'Approved and moved to invoiceTeam', '2025-11-26 10:53:55'),
(41, 22, 10, 'Approved', NULL, NULL, 'Remarks from Invoice Team', '2025-11-26 10:55:33'),
(42, 22, 11, 'Approved', NULL, NULL, 'Division Remarks', '2025-11-26 10:56:08'),
(43, 22, 12, 'Approved', NULL, NULL, 'Remarks from Accounts', '2025-11-26 10:56:54'),
(44, 22, 13, 'Final Approved', NULL, NULL, 'Final Approval', '2025-11-26 10:57:37'),
(45, 24, 9, 'Approved', NULL, NULL, 'Approved and moved to divisionHead', '2025-11-26 11:08:00'),
(46, 24, 11, 'Approved', NULL, NULL, 'Approved and moved to accountsApprovalHead', '2025-11-26 11:08:32'),
(47, 24, 13, 'Final Approved', NULL, NULL, 'Final approval', '2025-11-26 11:09:54'),
(48, 25, 9, 'Rejected', NULL, NULL, 'Your Claim is not valid', '2025-11-26 11:11:26'),
(49, 26, 11, 'Approved', NULL, NULL, 'Approved and moved to reviewer', '2025-11-26 11:16:57'),
(50, 27, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-10 09:49:47'),
(51, 27, 9, 'Approved', NULL, NULL, 'Approved and moved to invoiceTeam', '2025-12-10 09:50:29'),
(52, 28, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-11 06:43:21'),
(53, 28, 9, 'Approved', NULL, NULL, 'Approved and moved to invoiceTeam', '2025-12-11 06:43:40'),
(54, 29, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-11 06:48:20'),
(55, 29, 9, 'Approved', NULL, NULL, 'Approved and moved to invoiceReviewer', '2025-12-11 06:48:33'),
(56, 29, 27, 'Final Approved', NULL, NULL, 'Final approval', '2025-12-11 06:48:57'),
(57, 30, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-11 07:22:34'),
(58, 30, 9, 'Approved', NULL, NULL, 'Approved and moved to invoiceReviewer', '2025-12-11 07:22:51'),
(59, 30, 27, 'Final Approved', NULL, NULL, 'Final approval', '2025-12-11 07:23:06'),
(60, 31, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-11 07:32:01'),
(61, 31, 9, 'Approved', NULL, NULL, 'Approved and moved to invoiceReviewer', '2025-12-11 07:32:15'),
(62, 31, 27, 'Approved', NULL, NULL, 'Approved and moved to divisionHead', '2025-12-11 07:32:29'),
(63, 31, 29, 'Approved', NULL, NULL, 'Approved and moved to accountsReviewer', '2025-12-11 07:37:05'),
(64, 31, 31, 'Approved', NULL, NULL, 'Approved and moved to accountsApprovalHead', '2025-12-12 08:12:02'),
(65, 31, 32, 'Final Approved', NULL, NULL, 'Final approval', '2025-12-12 08:17:14'),
(66, 32, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 14:08:58'),
(67, 32, 9, 'Approved', NULL, NULL, 'Approved and moved to logistics', '2025-12-17 14:34:30'),
(68, 32, 28, 'Approved', NULL, NULL, 'Approved and moved to invoiceReviewer', '2025-12-17 14:35:02'),
(69, 32, 27, 'Approved', NULL, NULL, 'Approved and moved to divisionHead', '2025-12-17 14:35:25'),
(70, 32, 29, 'Approved', NULL, NULL, 'Approved and moved to accountsReviewer', '2025-12-17 14:38:53'),
(71, 32, 31, 'Approved', NULL, NULL, 'Approved and moved to accountsApprovalHead', '2025-12-17 14:40:14'),
(72, 32, 32, 'Final Approved', NULL, NULL, 'Final approval', '2025-12-17 14:40:31'),
(73, 33, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 14:41:32'),
(74, 33, 9, 'Approved', NULL, NULL, 'Approved and moved to logistics', '2025-12-17 14:41:43'),
(75, 34, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 16:13:54'),
(76, 34, 9, 'Approved', NULL, NULL, 'Approved and moved to logistics', '2025-12-17 16:14:11'),
(77, 35, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 16:18:50'),
(78, 36, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 16:19:58'),
(79, 37, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 16:29:15'),
(80, 38, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 16:30:43'),
(81, 39, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 16:34:29'),
(82, 40, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 16:37:07'),
(83, 41, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 16:44:21'),
(84, 42, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 17:24:05'),
(85, 43, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 17:25:56'),
(86, 44, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 17:32:42'),
(87, 45, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 17:41:53'),
(88, 46, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 17:44:16'),
(89, 47, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 17:45:50'),
(90, 48, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 17:51:18'),
(91, 49, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-17 17:54:59'),
(92, 50, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 09:51:59'),
(93, 51, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 10:14:04'),
(94, 52, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 10:15:11'),
(95, 53, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 10:28:50'),
(96, 53, 9, 'Approved', NULL, NULL, 'Approved by Reviewer → Approver', '2025-12-22 10:29:02'),
(97, 53, 30, 'Approved', NULL, NULL, 'Approved by Approver → Accounts Reviewer', '2025-12-22 10:29:18'),
(98, 53, 31, 'Approved', NULL, NULL, 'Approved by Accounts Reviewer → Accounts Approval Head', '2025-12-22 10:29:37'),
(99, 53, 32, 'Approved', NULL, NULL, 'Final Approved by Accounts Approval Head', '2025-12-22 10:29:47'),
(100, 54, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 10:30:41'),
(101, 54, 9, 'Approved', NULL, NULL, 'Final Approved by Reviewer', '2025-12-22 10:31:42'),
(102, 55, 9, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 10:50:56'),
(103, 55, 9, 'Approved', NULL, NULL, 'Approved by Reviewer → Approver', '2025-12-22 10:51:09'),
(104, 56, 9, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 10:56:00'),
(105, 38, 9, 'Approved', NULL, NULL, 'Approved by Reviewer → Invoice Reviewer', '2025-12-22 11:01:09'),
(106, 57, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 12:02:31'),
(107, 57, 9, 'Approved', NULL, NULL, 'Final Approved by Reviewer', '2025-12-22 12:07:11'),
(108, 58, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 12:17:07'),
(109, 58, 9, 'Rejected', NULL, NULL, '', '2025-12-22 12:17:26'),
(110, 59, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 12:20:33'),
(111, 59, 9, 'Clarification Requested', NULL, NULL, '', '2025-12-22 12:20:46'),
(112, 59, 8, 'Resubmitted', NULL, NULL, '', '2025-12-22 13:02:44'),
(113, 60, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 13:10:23'),
(114, 60, 9, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:10:35'),
(115, 60, 8, 'Resubmitted', NULL, NULL, '', '2025-12-22 13:10:49'),
(116, 60, 9, 'Approved', NULL, NULL, 'Approved by Reviewer', '2025-12-22 13:11:00'),
(117, 61, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 13:14:09'),
(118, 61, 9, 'Approved', NULL, NULL, 'Approved by Reviewer', '2025-12-22 13:14:25'),
(119, 61, 30, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:15:08'),
(120, 61, 9, 'Approved', NULL, NULL, 'Approved by Reviewer', '2025-12-22 13:15:37'),
(121, 61, 30, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:16:33'),
(122, 61, 9, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:16:44'),
(123, 62, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 13:20:42'),
(124, 62, 9, 'Approved', NULL, NULL, 'Approved by Reviewer', '2025-12-22 13:20:55'),
(125, 62, 30, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:21:05'),
(126, 62, 9, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:21:18'),
(127, 63, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 13:27:04'),
(128, 63, 9, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:27:13'),
(129, 63, 8, 'Resubmitted', NULL, NULL, '', '2025-12-22 13:27:25'),
(130, 63, 9, 'Approved', NULL, NULL, 'Approved by Reviewer', '2025-12-22 13:27:39'),
(131, 63, 30, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:27:49'),
(132, 63, 9, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:27:58'),
(133, 63, 30, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:28:14'),
(134, 63, 9, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:28:30'),
(135, 62, 9, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:33:10'),
(136, 63, 8, 'Resubmitted', NULL, NULL, '', '2025-12-22 13:35:39'),
(137, 63, 9, 'Approved', NULL, NULL, 'Approved by Reviewer', '2025-12-22 13:35:51'),
(138, 63, 30, 'Approved', NULL, NULL, 'Approved by Approver', '2025-12-22 13:36:05'),
(139, 63, 31, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:36:15'),
(140, 63, 30, 'Clarification Requested', NULL, NULL, '', '2025-12-22 13:36:25'),
(141, 63, 8, 'Resubmitted', NULL, NULL, '', '2025-12-22 13:36:40'),
(142, 63, 9, 'Approved', NULL, NULL, 'Approved by Reviewer', '2025-12-22 13:36:52'),
(143, 63, 30, 'Approved', NULL, NULL, 'Approved by Approver', '2025-12-22 13:37:05'),
(144, 63, 31, 'Approved', NULL, NULL, 'Approved by Accounts Reviewer', '2025-12-22 13:37:16'),
(145, 63, 32, 'Approved', NULL, NULL, 'Final Approved', '2025-12-22 13:37:27'),
(146, 64, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 13:40:34'),
(147, 64, 9, 'Approved', NULL, NULL, 'Approved by Reviewer', '2025-12-22 13:43:11'),
(148, 65, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 13:45:16'),
(149, 65, 9, 'Approved', NULL, NULL, 'Approved by Reviewer', '2025-12-22 13:46:24'),
(150, 65, 30, 'Approved', NULL, NULL, 'Approved by Approver', '2025-12-22 13:47:37'),
(151, 65, 31, 'Approved', NULL, NULL, 'Approved by Accounts Reviewer', '2025-12-22 13:47:57'),
(152, 65, 32, 'Approved', NULL, NULL, 'Final Approved', '2025-12-22 13:48:10'),
(153, 66, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 13:50:44'),
(154, 66, 9, 'Approved', NULL, NULL, 'Approved by Reviewer', '2025-12-22 13:51:00'),
(155, 67, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 14:14:31'),
(156, 67, 9, 'Approved', NULL, NULL, 'Final Approved by Reviewer (Amount < 5000)', '2025-12-22 14:15:12'),
(157, 68, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 14:15:46'),
(158, 68, 9, 'Approved', NULL, NULL, 'Approved by Reviewer → Approver', '2025-12-22 14:15:58'),
(159, 68, 30, 'Approved', NULL, NULL, 'Approved by Approver → Accounts Reviewer', '2025-12-22 14:16:08'),
(160, 68, 31, 'Approved', NULL, NULL, 'Approved by Accounts Reviewer → Accounts Approval Head', '2025-12-22 14:16:17'),
(161, 68, 32, 'Approved', NULL, NULL, 'Final Approved by Accounts Approval Head', '2025-12-22 14:16:26'),
(162, 69, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-22 14:17:04'),
(163, 69, 9, 'Approved', NULL, NULL, 'Moved to Invoice Reviewer (Job Number found)', '2025-12-22 14:17:19'),
(164, 69, 27, 'Approved', NULL, NULL, 'Approved by Invoice Reviewer → Approver', '2025-12-22 14:18:22'),
(165, 72, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-26 06:36:39'),
(166, 72, 9, 'Approved', NULL, NULL, 'Final Approved by Reviewer (<5000)', '2025-12-26 06:43:24'),
(167, 73, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-26 06:52:04'),
(168, 73, 9, 'Approved', NULL, NULL, 'Final Approved by Reviewer (<5000)', '2025-12-26 06:57:01'),
(169, 74, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-26 06:57:32'),
(170, 75, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-26 07:22:44'),
(171, 76, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-26 07:29:30'),
(172, 76, 27, 'Approved', NULL, NULL, 'Approved by Invoice Reviewer → Approver', '2025-12-26 07:29:44'),
(173, 74, 28, 'Approved', NULL, NULL, 'Approved by Logistics → Invoice Reviewer', '2025-12-26 07:29:57'),
(174, 76, 30, 'Approved', NULL, NULL, 'Approved by Approver → Accounts Reviewer', '2025-12-26 07:34:02'),
(175, 77, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-26 07:58:58'),
(176, 77, 28, 'Approved', NULL, NULL, 'Approved by Logistics → Reviewer', '2025-12-26 07:59:12'),
(177, 77, 9, 'Approved', NULL, NULL, 'Final Approved by Reviewer (<5000)', '2025-12-26 07:59:26'),
(178, 78, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-26 08:01:05'),
(179, 78, 27, 'Approved', NULL, NULL, 'Approved by Invoice Reviewer → Reviewer', '2025-12-26 08:01:18'),
(180, 78, 9, 'Approved', NULL, NULL, 'Approved by Reviewer → Approver', '2025-12-26 08:01:27'),
(181, 78, 30, 'Approved', NULL, NULL, 'Approved by Approver → Accounts Reviewer', '2025-12-26 08:01:40'),
(182, 78, 31, 'Approved', NULL, NULL, 'Approved by Accounts Reviewer → Accounts Approval Head', '2025-12-26 08:02:10'),
(183, 78, 32, 'Approved', NULL, NULL, 'Final Approved by Accounts Approval Head', '2025-12-26 08:02:23'),
(184, 79, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-26 08:03:11'),
(185, 79, 9, 'Approved', NULL, NULL, 'Approved by Reviewer → Approver', '2025-12-26 08:03:23'),
(186, 80, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-30 06:49:07'),
(187, 80, 9, 'Approved', NULL, NULL, 'Final Approved by Reviewer (<5000)', '2025-12-30 06:49:18'),
(188, 81, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-30 06:49:53'),
(189, 81, 9, 'Clarification Requested', NULL, NULL, '', '2025-12-30 06:50:02'),
(190, 81, 8, 'Resubmitted', NULL, NULL, '', '2025-12-30 06:50:12'),
(191, 81, 9, 'Approved', NULL, NULL, 'Approved by Reviewer → Approver', '2025-12-30 06:50:24'),
(192, 81, 30, 'Approved', NULL, NULL, 'Approved by Approver → Accounts Reviewer', '2025-12-30 06:50:34'),
(193, 81, 31, 'Approved', NULL, NULL, 'Approved by Accounts Reviewer → Accounts Approval Head', '2025-12-30 06:50:45'),
(194, 81, 32, 'Approved', NULL, NULL, 'Final Approved by Accounts Approval Head', '2025-12-30 06:50:56'),
(195, 82, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-30 06:51:39'),
(196, 82, 27, 'Approved', NULL, NULL, 'Approved by Invoice Reviewer → Reviewer', '2025-12-30 06:52:02'),
(197, 82, 9, 'Approved', NULL, NULL, 'Final Approved by Reviewer (<5000)', '2025-12-30 06:52:13'),
(198, 83, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-30 06:52:49'),
(199, 83, 27, 'Approved', NULL, NULL, 'Approved by Invoice Reviewer → Reviewer', '2025-12-30 06:52:58'),
(200, 83, 9, 'Approved', NULL, NULL, 'Approved by Reviewer → Approver', '2025-12-30 06:53:09'),
(201, 83, 30, 'Approved', NULL, NULL, 'Approved by Approver → Accounts Reviewer', '2025-12-30 06:53:18'),
(202, 83, 31, 'Approved', NULL, NULL, 'Approved by Accounts Reviewer → Accounts Approval Head', '2025-12-30 06:53:26'),
(203, 83, 32, 'Approved', NULL, NULL, 'Final Approved by Accounts Approval Head', '2025-12-30 06:53:36'),
(204, 84, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-30 06:55:27'),
(205, 84, 28, 'Approved', NULL, NULL, 'Approved by Logistics → Reviewer', '2025-12-30 06:55:37'),
(206, 84, 9, 'Approved', NULL, NULL, 'Final Approved by Reviewer (<5000)', '2025-12-30 06:55:47'),
(207, 85, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-30 06:56:21'),
(208, 85, 27, 'Approved', NULL, NULL, 'Approved by Invoice Reviewer → Reviewer', '2025-12-30 06:56:33'),
(209, 85, 9, 'Approved', NULL, NULL, 'Approved by Reviewer → Approver', '2025-12-30 06:56:44'),
(210, 85, 30, 'Approved', NULL, NULL, 'Approved by Approver → Accounts Reviewer', '2025-12-30 06:56:58'),
(211, 86, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-30 07:03:32'),
(212, 86, 27, 'Approved', NULL, NULL, 'Approved by Invoice Reviewer → Reviewer', '2025-12-30 07:03:45'),
(213, 86, 9, 'Approved', NULL, NULL, 'Approved by Reviewer → Approver', '2025-12-30 07:04:04'),
(214, 87, 8, 'Created', NULL, NULL, 'Claim created by user', '2025-12-30 07:14:35'),
(215, 87, 27, 'Approved', NULL, NULL, 'Approved by Invoice Reviewer → Logistics (Job + Transport)', '2025-12-30 07:14:46'),
(216, 87, 28, 'Approved', NULL, NULL, 'Approved by Logistics → Reviewer', '2025-12-30 07:14:55'),
(217, 87, 9, 'Approved', NULL, NULL, 'Approved by Reviewer → Approver', '2025-12-30 07:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `claims`
--

CREATE TABLE `claims` (
  `claim_id` int(11) NOT NULL,
  `claim_no` varchar(50) DEFAULT NULL,
  `requester_id` int(11) NOT NULL,
  `submitted_at` datetime DEFAULT current_timestamp(),
  `total_amount` decimal(12,2) NOT NULL,
  `currency` varchar(10) DEFAULT 'AED',
  `status` varchar(50) DEFAULT 'Draft',
  `current_role_level` int(11) DEFAULT 1,
  `remarks` text DEFAULT NULL,
  `last_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `assigned_role` varchar(50) DEFAULT 'reviewer',
  `assigned_to` int(11) DEFAULT NULL,
  `workflow_type` enum('default','admin') NOT NULL DEFAULT 'default',
  `division` varchar(100) DEFAULT NULL,
  `subdivision` varchar(100) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `claims`
--

INSERT INTO `claims` (`claim_id`, `claim_no`, `requester_id`, `submitted_at`, `total_amount`, `currency`, `status`, `current_role_level`, `remarks`, `last_updated`, `created_at`, `updated_at`, `assigned_role`, `assigned_to`, `workflow_type`, `division`, `subdivision`, `workflow_id`) VALUES
(4, 'PC-20251117-101321', 8, '2025-11-17 14:13:21', 100.00, 'AED', 'Pending Review', 1, NULL, '2025-11-17 14:13:21', '2025-11-17 09:13:21', NULL, 'reviewer', NULL, 'default', NULL, NULL, NULL),
(6, NULL, 8, '2025-11-17 16:53:12', 200.00, 'AED', 'Rejected', 1, NULL, '2025-11-17 20:45:02', '2025-11-17 11:53:12', '2025-11-17 15:45:02', NULL, NULL, 'default', NULL, NULL, NULL),
(10, 'PC-20251117-173210-397130-714', 8, '2025-11-17 21:32:10', 1000.00, 'USD', 'Approved', 1, NULL, '2025-11-17 21:33:07', '2025-11-17 16:32:10', '2025-11-17 16:33:07', NULL, NULL, 'default', NULL, NULL, NULL),
(11, 'PC-20251118-163003-479803-295', 8, '2025-11-18 20:30:03', 100.00, 'AED', 'Final Approved', 1, NULL, '2025-11-26 10:54:44', '2025-11-18 15:30:03', '2025-11-26 05:54:44', NULL, NULL, 'default', NULL, NULL, NULL),
(12, 'PC-20251118-194831-491711-550', 8, '2025-11-18 23:48:31', 100.00, 'INR', 'Final Approved', 1, NULL, '2025-11-19 09:16:38', '2025-11-18 18:48:31', '2025-11-19 04:16:10', NULL, NULL, 'default', NULL, NULL, NULL),
(13, 'PC-20251119-063128-450', 8, '2025-11-19 10:31:28', 10.00, 'AED', 'Pending accountsReviewer', 1, NULL, '2025-11-19 10:33:06', '2025-11-19 05:31:28', '2025-11-19 05:33:06', 'accountsReviewer', 12, 'default', NULL, NULL, NULL),
(14, 'PC-20251119-094046-351', 8, '2025-11-19 13:40:46', 100.00, 'USD', 'Approved', 1, NULL, '2025-11-19 13:42:59', '2025-11-19 08:40:46', '2025-11-19 08:42:59', NULL, NULL, 'default', NULL, NULL, NULL),
(15, 'PC-20251126-061150-295', 8, '2025-11-26 10:11:50', 100.00, 'AED', 'Approved', 1, NULL, '2025-11-26 10:12:37', '2025-11-26 05:11:50', '2025-11-26 05:12:37', NULL, NULL, 'default', NULL, NULL, NULL),
(16, 'PC-20251126-063530-159', 8, '2025-11-26 10:35:30', 10.00, 'AED', 'Approved', 1, NULL, '2025-11-26 10:35:46', '2025-11-26 05:35:30', '2025-11-26 05:35:46', NULL, NULL, 'default', NULL, NULL, NULL),
(17, 'PC-20251126-064918-577', 8, '2025-11-26 10:49:18', 100.00, 'INR', 'Final Approved', 1, NULL, '2025-11-26 10:49:39', '2025-11-26 05:49:18', '2025-11-26 05:49:39', NULL, NULL, 'default', NULL, NULL, NULL),
(18, 'PC-20251126-071632-379', 8, '2025-11-26 11:16:32', 100.00, 'AED', 'Final Approved', 1, NULL, '2025-11-26 11:19:10', '2025-11-26 06:16:32', '2025-11-26 06:19:10', NULL, NULL, 'default', NULL, NULL, NULL),
(19, 'PC-20251126-072059-163', 8, '2025-11-26 11:20:59', 100.00, 'AED', 'Pending requester', 1, NULL, '2025-11-26 11:20:59', '2025-11-26 06:20:59', NULL, 'requester', 8, 'admin', NULL, NULL, NULL),
(20, 'PC-20251126-072907-947', 8, '2025-11-26 11:29:07', 1000.00, 'INR', 'Final Approved', 1, NULL, '2025-11-26 11:30:15', '2025-11-26 06:29:07', '2025-11-26 06:30:15', NULL, NULL, 'admin', NULL, NULL, NULL),
(21, 'PC-20251126-104956-162', 8, '2025-11-26 14:49:56', 200.00, 'USD', 'Rejected', 1, NULL, '2025-11-26 14:51:02', '2025-11-26 09:49:56', '2025-11-26 09:51:02', NULL, NULL, 'default', NULL, NULL, NULL),
(22, 'PC-20251126-114851-958', 8, '2025-11-26 15:48:51', 1000.00, 'INR', 'Final Approved', 1, NULL, '2025-11-26 15:57:37', '2025-11-26 10:48:51', '2025-11-26 10:57:37', NULL, NULL, 'default', NULL, NULL, NULL),
(23, 'PC-20251126-120404-978', 14, '2025-11-26 16:04:04', 220.00, 'AED', 'Pending reviewer', 1, NULL, '2025-11-26 16:04:04', '2025-11-26 11:04:04', NULL, 'reviewer', 9, 'admin', NULL, NULL, NULL),
(24, 'PC-20251126-120553-701', 8, '2025-11-26 16:05:53', 220.00, 'AED', 'Final Approved', 1, NULL, '2025-11-26 16:09:54', '2025-11-26 11:05:53', '2025-11-26 11:09:54', NULL, NULL, 'admin', NULL, NULL, NULL),
(25, 'PC-20251126-121100-708', 8, '2025-11-26 16:11:00', 100.00, 'AED', 'Rejected', 1, NULL, '2025-11-26 16:11:26', '2025-11-26 11:11:00', '2025-11-26 11:11:26', NULL, NULL, 'default', NULL, NULL, NULL),
(26, 'PC-20251126-121612-669', 8, '2025-11-26 16:16:12', 100.00, 'INR', 'Pending reviewer', 1, NULL, '2025-11-26 16:16:57', '2025-11-26 11:16:12', '2025-11-26 11:16:57', 'reviewer', 9, 'admin', NULL, NULL, NULL),
(27, 'PC-20251210-104947-526', 8, '2025-12-10 14:49:47', 100.00, 'AED', 'Pending invoiceTeam (no user)', 1, NULL, '2025-12-10 15:52:00', '2025-12-10 09:49:47', '2025-12-10 09:50:29', 'invoiceReviewer', NULL, 'default', '', NULL, NULL),
(28, 'PC-20251211-074321-914', 8, '2025-12-11 11:43:21', 100.00, 'AED', 'Pending invoiceTeam (no user)', 1, NULL, '2025-12-11 11:43:40', '2025-12-11 06:43:21', '2025-12-11 06:43:40', 'invoiceTeam', NULL, 'default', '', NULL, NULL),
(29, 'PC-20251211-074820-858', 8, '2025-12-11 11:48:20', 100.00, 'AED', 'Final Approved', 1, NULL, '2025-12-11 11:48:57', '2025-12-11 06:48:20', '2025-12-11 06:48:57', NULL, NULL, 'default', '', NULL, NULL),
(30, 'PC-20251211-082234-558', 8, '2025-12-11 12:22:34', 100.00, 'INR', 'Final Approved', 1, NULL, '2025-12-11 12:23:06', '2025-12-11 07:22:34', '2025-12-11 07:23:06', NULL, NULL, 'default', '', NULL, NULL),
(31, 'PC-20251211-083201-103', 8, '2025-12-11 12:32:01', 100.00, 'AED', 'Final Approved', 1, NULL, '2025-12-12 13:17:14', '2025-12-11 07:32:01', '2025-12-12 08:17:14', NULL, NULL, 'default', '', NULL, NULL),
(32, 'PC-20251217-150858-570', 8, '2025-12-17 19:08:58', 100.00, 'AED', 'Final Approved', 1, NULL, '2025-12-17 19:40:31', '2025-12-17 14:08:58', '2025-12-17 14:40:31', NULL, NULL, 'default', '', NULL, NULL),
(33, 'PC-20251217-154132-369', 8, '2025-12-17 19:41:32', 100.00, 'INR', 'Pending invoiceReviewer', 1, NULL, '2025-12-17 21:21:27', '2025-12-17 14:41:32', '2025-12-17 16:21:27', 'invoiceReviewer', 27, 'default', '', NULL, NULL),
(34, 'PC-20251217-171354-320', 8, '2025-12-17 21:13:54', 100.00, 'AED', 'Pending invoiceReviewer', 1, NULL, '2025-12-17 21:21:23', '2025-12-17 16:13:54', '2025-12-17 16:21:23', 'invoiceReviewer', 27, 'default', 'Comon', NULL, NULL),
(35, 'PC-20251217-171850-166', 8, '2025-12-17 21:18:50', 100.00, 'INR', 'Pending divisionHead', 1, NULL, '2025-12-17 21:19:17', '2025-12-17 16:18:50', '2025-12-17 16:19:17', 'divisionHead', 29, 'default', 'Comon', NULL, NULL),
(36, 'PC-20251217-171958-186', 8, '2025-12-17 21:19:58', 100.00, 'AED', 'Pending invoiceReviewer', 1, NULL, '2025-12-17 21:21:16', '2025-12-17 16:19:58', '2025-12-17 16:21:16', 'invoiceReviewer', 27, 'default', 'I&M', NULL, NULL),
(37, 'PC-20251217-172915-859', 8, '2025-12-17 21:29:15', 290.00, 'AED', 'Pending reviewer', 1, NULL, '2025-12-17 21:29:15', '2025-12-17 16:29:15', NULL, 'reviewer', 9, 'default', 'Comon', NULL, NULL),
(38, 'PC-20251217-173043-771', 8, '2025-12-17 21:30:43', 20.00, 'USD', 'Pending invoiceReviewer', 1, NULL, '2025-12-22 16:01:09', '2025-12-17 16:30:43', '2025-12-22 11:01:09', 'invoiceReviewer', 27, 'default', 'Comon', NULL, NULL),
(39, 'PC-20251217-173429-600', 8, '2025-12-17 21:34:29', 100.00, 'INR', 'Final Approved', 1, NULL, '2025-12-17 21:35:11', '2025-12-17 16:34:29', '2025-12-17 16:35:11', NULL, NULL, 'admin', 'I&M', NULL, NULL),
(40, 'PC-20251217-173707-572', 8, '2025-12-17 21:37:07', 100.00, 'INR', 'Final Approved', 1, NULL, '2025-12-17 21:37:22', '2025-12-17 16:37:07', '2025-12-17 16:37:22', NULL, NULL, 'admin', 'Comon', NULL, NULL),
(41, 'PC-20251217-174421-872', 8, '2025-12-17 21:44:21', 1000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-17 21:44:47', '2025-12-17 16:44:21', '2025-12-17 16:44:47', NULL, NULL, 'admin', 'Comon', NULL, NULL),
(42, 'PC-20251217-182405-464', 8, '2025-12-17 22:24:05', 1000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-17 22:24:23', '2025-12-17 17:24:05', '2025-12-17 17:24:23', NULL, NULL, 'default', 'I&M', NULL, NULL),
(43, 'PC-20251217-182556-253', 8, '2025-12-17 22:25:56', 3000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-17 22:26:07', '2025-12-17 17:25:56', '2025-12-17 17:26:07', NULL, NULL, 'default', 'Comon', NULL, NULL),
(44, 'PC-20251217-183242-289', 8, '2025-12-17 22:32:42', 3000.00, 'INR', 'Pending approvar', 1, NULL, '2025-12-17 22:32:54', '2025-12-17 17:32:42', '2025-12-17 17:32:54', 'approvar', 0, 'default', 'I&M', NULL, NULL),
(45, 'PC-20251217-184153-941', 8, '2025-12-17 22:41:53', 3000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-17 22:42:13', '2025-12-17 17:41:53', '2025-12-17 17:42:13', NULL, NULL, 'default', 'I&M', NULL, NULL),
(46, 'PC-20251217-184416-588', 8, '2025-12-17 22:44:16', 8000.00, 'INR', 'Pending approvar', 1, NULL, '2025-12-17 22:44:27', '2025-12-17 17:44:16', '2025-12-17 17:44:27', 'approvar', 0, 'default', 'I&M', NULL, NULL),
(47, 'PC-20251217-184550-212', 8, '2025-12-17 22:45:50', 8000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-17 22:46:54', '2025-12-17 17:45:50', '2025-12-17 17:46:54', NULL, NULL, 'default', 'I&M', NULL, NULL),
(48, 'PC-20251217-185118-430', 8, '2025-12-17 22:51:18', 1000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-17 22:52:45', '2025-12-17 17:51:18', '2025-12-17 17:52:45', NULL, NULL, 'default', 'I&M', NULL, NULL),
(49, 'PC-20251217-185459-418', 8, '2025-12-17 22:54:59', 1000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-17 22:55:45', '2025-12-17 17:54:59', '2025-12-17 17:55:45', NULL, NULL, 'default', 'I&M', NULL, NULL),
(50, 'PC-20251222-105159-699', 8, '2025-12-22 14:51:59', 1500.00, 'INR', 'Final Approved', 1, NULL, '2025-12-22 15:03:01', '2025-12-22 09:51:59', '2025-12-22 10:03:01', NULL, NULL, 'default', 'I&M', NULL, NULL),
(51, 'PC-20251222-111404-791', 8, '2025-12-22 15:14:04', 1500.00, 'AED', 'Final Approved', 1, NULL, '2025-12-22 15:14:16', '2025-12-22 10:14:04', '2025-12-22 10:14:16', NULL, NULL, 'default', 'I&M', NULL, NULL),
(52, 'PC-20251222-111511-417', 8, '2025-12-22 15:15:11', 5000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-22 15:16:02', '2025-12-22 10:15:11', '2025-12-22 10:16:02', NULL, NULL, 'default', 'I&M', NULL, NULL),
(53, 'PC-20251222-112850-423', 8, '2025-12-22 15:28:50', 5000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-22 15:29:46', '2025-12-22 10:28:50', '2025-12-22 10:29:46', NULL, NULL, 'default', 'I&M', NULL, NULL),
(54, 'PC-20251222-113041-186', 8, '2025-12-22 15:30:41', 1000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-22 15:31:42', '2025-12-22 10:30:41', '2025-12-22 10:31:42', NULL, NULL, 'default', 'I&M', NULL, NULL),
(55, 'PC-20251222-115056-397', 9, '2025-12-22 15:50:56', 10000.00, 'INR', 'Pending approver', 1, NULL, '2025-12-22 15:51:09', '2025-12-22 10:50:56', '2025-12-22 10:51:09', 'approver', 30, 'default', 'I&M', NULL, NULL),
(56, 'PC-20251222-115600-312', 9, '2025-12-22 15:56:00', 100.00, 'INR', 'Pending approver', 1, NULL, '2025-12-22 15:56:00', '2025-12-22 10:56:00', NULL, 'approver', 30, 'default', 'I&M', NULL, NULL),
(57, 'PC-20251222-130231-146', 8, '2025-12-22 17:02:31', 1500.00, 'INR', 'Final Approved', 1, NULL, '2025-12-22 17:07:11', '2025-12-22 12:02:31', '2025-12-22 12:07:11', NULL, NULL, 'default', 'I&M', NULL, NULL),
(58, 'PC-20251222-131707-411', 8, '2025-12-22 17:17:07', 1500.00, 'INR', 'Rejected', 1, NULL, '2025-12-22 17:17:25', '2025-12-22 12:17:07', '2025-12-22 12:17:25', 'requester', 8, 'default', 'I&M', NULL, NULL),
(59, 'PC-20251222-132033-636', 8, '2025-12-22 17:20:33', 1000.00, 'INR', 'Pending reviewer', 1, NULL, '2025-12-22 18:02:44', '2025-12-22 12:20:33', '2025-12-22 13:02:44', 'reviewer', NULL, 'default', 'I&M', NULL, NULL),
(60, 'PC-20251222-141023-225', 8, '2025-12-22 18:10:23', 1000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-22 18:11:00', '2025-12-22 13:10:23', '2025-12-22 13:11:00', NULL, NULL, 'default', 'I&M', NULL, NULL),
(61, 'PC-20251222-141409-618', 8, '2025-12-22 18:14:09', 6000.00, 'INR', 'Clarification Required', 1, NULL, '2025-12-22 18:16:44', '2025-12-22 13:14:09', '2025-12-22 13:16:44', 'reviewer', 9, 'default', 'I&M', NULL, NULL),
(62, 'PC-20251222-142042-796', 8, '2025-12-22 18:20:42', 5000.00, 'INR', 'Clarification Required', 1, NULL, '2025-12-22 18:33:10', '2025-12-22 13:20:42', '2025-12-22 13:33:10', 'requester', 8, 'default', 'I&M', NULL, NULL),
(63, 'PC-20251222-142704-309', 8, '2025-12-22 18:27:04', 5000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-22 18:37:27', '2025-12-22 13:27:04', '2025-12-22 13:37:27', NULL, NULL, 'default', 'I&M', NULL, NULL),
(64, 'PC-20251222-144034-602', 8, '2025-12-22 18:40:34', 1500.00, 'INR', 'Final Approved', 1, NULL, '2025-12-22 18:43:11', '2025-12-22 13:40:34', '2025-12-22 13:43:11', NULL, NULL, 'default', 'I&M', NULL, NULL),
(65, 'PC-20251222-144516-717', 8, '2025-12-22 18:45:16', 6000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-22 18:48:10', '2025-12-22 13:45:16', '2025-12-22 13:48:10', NULL, NULL, 'default', 'I&M', NULL, NULL),
(66, 'PC-20251222-145044-687', 8, '2025-12-22 18:50:44', 1000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-22 18:51:00', '2025-12-22 13:50:44', '2025-12-22 13:51:00', NULL, NULL, 'default', 'I&M', NULL, NULL),
(67, 'PC-20251222-151431-191', 8, '2025-12-22 19:14:31', 4000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-22 19:15:12', '2025-12-22 14:14:31', '2025-12-22 14:15:12', NULL, NULL, 'default', 'I&M', NULL, NULL),
(68, 'PC-20251222-151546-452', 8, '2025-12-22 19:15:46', 5000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-22 19:16:26', '2025-12-22 14:15:46', '2025-12-22 14:16:26', NULL, NULL, 'default', 'I&M', NULL, NULL),
(69, 'PC-20251222-151704-686', 8, '2025-12-22 19:17:04', 1000.00, 'INR', 'Pending approver', 1, NULL, '2025-12-22 19:18:22', '2025-12-22 14:17:04', '2025-12-22 14:18:22', 'approver', 30, 'default', 'I&M', NULL, NULL),
(70, 'PC-20251226-073003-734', 27, '2025-12-26 11:30:03', 1000.00, 'INR', 'Pending reviewer', 1, NULL, '2025-12-26 11:30:03', '2025-12-26 06:30:03', NULL, 'reviewer', 9, 'default', 'I&M', NULL, NULL),
(71, 'PC-20251226-073531-579', 8, '2025-12-26 11:35:31', 1000.00, 'INR', 'Pending reviewer', 1, NULL, '2025-12-26 11:35:31', '2025-12-26 06:35:31', NULL, 'reviewer', 9, 'default', NULL, NULL, NULL),
(72, 'PC-20251226-073639-522', 8, '2025-12-26 11:36:39', 1000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-26 11:43:24', '2025-12-26 06:36:39', '2025-12-26 06:43:24', NULL, NULL, 'default', 'I&M', NULL, NULL),
(73, 'PC-20251226-075204-172', 8, '2025-12-26 11:52:04', 3000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-26 11:57:01', '2025-12-26 06:52:04', '2025-12-26 06:57:01', NULL, NULL, 'default', 'I&M', NULL, NULL),
(74, 'PC-20251226-075732-410', 8, '2025-12-26 11:57:32', 3450.00, 'INR', 'Pending invoicereviewer', 1, NULL, '2025-12-26 12:29:57', '2025-12-26 06:57:32', '2025-12-26 07:29:57', 'invoicereviewer', 27, 'default', 'I&M', NULL, NULL),
(75, 'PC-20251226-082244-725', 8, '2025-12-26 12:22:44', 3000.00, 'INR', 'Pending reviewer', 1, NULL, '2025-12-26 12:22:44', '2025-12-26 07:22:44', NULL, 'reviewer', 9, 'default', 'I&M', NULL, NULL),
(76, 'PC-20251226-082930-647', 8, '2025-12-26 12:29:30', 3000.00, 'INR', 'Pending accountsreviewer', 1, NULL, '2025-12-26 12:34:02', '2025-12-26 07:29:30', '2025-12-26 07:34:02', 'accountsreviewer', 31, 'default', 'I&M', NULL, NULL),
(77, 'PC-20251226-085858-514', 8, '2025-12-26 12:58:58', 1000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-26 12:59:26', '2025-12-26 07:58:58', '2025-12-26 07:59:26', NULL, NULL, 'default', 'I&M', NULL, NULL),
(78, 'PC-20251226-090105-321', 8, '2025-12-26 13:01:05', 6000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-26 13:02:23', '2025-12-26 08:01:05', '2025-12-26 08:02:23', NULL, NULL, 'default', 'I&M', NULL, NULL),
(79, 'PC-20251226-090311-315', 8, '2025-12-26 13:03:11', 5000.00, 'INR', 'Pending approver', 1, NULL, '2025-12-26 13:03:23', '2025-12-26 08:03:11', '2025-12-26 08:03:23', 'approver', 30, 'default', 'I&M', NULL, NULL),
(80, 'PC-20251230-074907-823', 8, '2025-12-30 11:49:07', 1000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-30 11:49:18', '2025-12-30 06:49:07', '2025-12-30 06:49:18', NULL, NULL, 'default', 'I&M', NULL, NULL),
(81, 'PC-20251230-074953-950', 8, '2025-12-30 11:49:53', 5000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-30 11:50:56', '2025-12-30 06:49:53', '2025-12-30 06:50:56', NULL, NULL, 'default', 'I&M', NULL, NULL),
(82, 'PC-20251230-075139-521', 8, '2025-12-30 11:51:39', 2000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-30 11:52:13', '2025-12-30 06:51:39', '2025-12-30 06:52:13', NULL, NULL, 'default', 'I&M', NULL, NULL),
(83, 'PC-20251230-075249-884', 8, '2025-12-30 11:52:49', 5000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-30 11:53:36', '2025-12-30 06:52:49', '2025-12-30 06:53:36', NULL, NULL, 'default', 'I&M', NULL, NULL),
(84, 'PC-20251230-075526-399', 8, '2025-12-30 11:55:26', 1000.00, 'INR', 'Final Approved', 1, NULL, '2025-12-30 11:55:47', '2025-12-30 06:55:26', '2025-12-30 06:55:47', NULL, NULL, 'default', 'I&M', NULL, NULL),
(85, 'PC-20251230-075621-780', 8, '2025-12-30 11:56:21', 10000.00, 'INR', 'Pending accountsreviewer', 1, NULL, '2025-12-30 11:56:58', '2025-12-30 06:56:21', '2025-12-30 06:56:58', 'accountsreviewer', 31, 'default', 'I&M', NULL, NULL),
(86, 'PC-20251230-080332-369', 8, '2025-12-30 12:03:32', 10000.00, 'INR', 'Pending approver', 1, NULL, '2025-12-30 12:04:04', '2025-12-30 07:03:32', '2025-12-30 07:04:04', 'approver', 30, 'default', 'I&M', NULL, NULL),
(87, 'PC-20251230-081435-946', 8, '2025-12-30 12:14:35', 10000.00, 'INR', 'Pending approver', 1, NULL, '2025-12-30 12:15:04', '2025-12-30 07:14:35', '2025-12-30 07:15:04', 'approver', 30, 'default', 'I&M', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `claim_attachments`
--

CREATE TABLE `claim_attachments` (
  `attachment_id` int(11) NOT NULL,
  `claim_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `claim_details`
--

CREATE TABLE `claim_details` (
  `detail_id` int(11) NOT NULL,
  `claim_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `main_category` varchar(100) DEFAULT NULL,
  `sub_category` varchar(100) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `job_no` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `division` varchar(100) DEFAULT NULL,
  `subdivision` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `claim_details`
--

INSERT INTO `claim_details` (`detail_id`, `claim_id`, `description`, `main_category`, `sub_category`, `amount`, `job_no`, `company`, `division`, `subdivision`, `created_at`) VALUES
(3, 4, '', '', '', 0.00, '', '', '', NULL, '2025-11-17 09:13:21'),
(4, 6, 'Description', 'Toll', 'Highway Toll', 200.00, '13244', 'Majoris', 'UAE', NULL, '2025-11-17 11:53:12'),
(7, 10, 'Bank Charges', 'Bank Charges', 'Service Charge', 1000.00, '1324', 'Majoris', 'USA', NULL, '2025-11-17 16:32:10'),
(8, 11, 'Desc', 'Transport Repair & Service', 'Service Charge', 100.00, '131', 'Majoris', 'UAE', NULL, '2025-11-18 15:30:03'),
(9, 12, 'Desc', 'Administration Expenses', 'Office Rent', 100.00, '', '', '', NULL, '2025-11-18 18:48:31'),
(10, 13, 'Desc', 'Printing', 'Office Forms', 10.00, 'eufj', 'qywfhb', 'qjwgf', NULL, '2025-11-19 05:31:28'),
(11, 14, 'Description Test', 'Toll', 'Highway Toll', 100.00, '1244', 'Majoris', 'UAE', NULL, '2025-11-19 08:40:46'),
(12, 15, 'Description', 'Coverall Purchase', 'Uniform', 100.00, '1234', 'Majoris', 'UAE', NULL, '2025-11-26 05:11:50'),
(13, 16, 'Description', 'Miscellaneous', 'Other', 10.00, '123', 'Majoris', 'UAE', NULL, '2025-11-26 05:35:30'),
(14, 17, 'Decription', 'Administration Expenses', 'Office Rent', 100.00, '232', 'Majoris', 'UAE', NULL, '2025-11-26 05:49:18'),
(15, 18, 'description', 'Bank Charges', 'Cheque Book Fee', 100.00, '1232', 'Majoris', 'UAE', NULL, '2025-11-26 06:16:32'),
(16, 19, 'Desc', 'Printing', 'Office Forms', 100.00, '123', 'Majoris', 'UAE', NULL, '2025-11-26 06:20:59'),
(17, 20, 'Desc', 'Port Pass', 'Port Entry', 1000.00, '1321', 'Majoris', 'UAE', NULL, '2025-11-26 06:29:07'),
(18, 21, 'Desc', 'Administration Expenses', 'Office Rent', 100.00, '21341', 'Majoris', 'UAE', NULL, '2025-11-26 09:49:56'),
(19, 21, 'Desc2', 'Printing', 'Office Forms', 100.00, '21341', 'Majoris', 'UAE', NULL, '2025-11-26 09:49:56'),
(20, 22, 'Desc1', 'Job Expenses', 'Site Allowance', 1000.00, '123', 'Majoris', 'UAE', NULL, '2025-11-26 10:48:51'),
(21, 23, 'Desc1', 'Gift', 'Employee Gift', 100.00, '123', 'Majoris', 'UAE', NULL, '2025-11-26 11:04:04'),
(22, 23, 'Desc2', 'Toll', 'Highway Toll', 20.00, '123', 'Majoris', 'UAE', NULL, '2025-11-26 11:04:04'),
(23, 23, 'Desc3', 'Administration Expenses', 'Stationery', 100.00, '123', 'Majoris', 'UAE', NULL, '2025-11-26 11:04:04'),
(24, 24, 'Desc1', 'Toll', 'Highway Toll', 100.00, '123', 'Majoris', 'UAE', NULL, '2025-11-26 11:05:53'),
(25, 24, 'Desc2', 'Administration Expenses', 'Office Rent', 20.00, '123', 'Majoris', 'UAE', NULL, '2025-11-26 11:05:53'),
(26, 24, 'Desc3', 'Port Pass', 'Port Entry', 100.00, '123', 'Majoris', 'UAE', NULL, '2025-11-26 11:05:53'),
(27, 25, 'Desc1', 'Transport Repair & Service', 'Fuel', 100.00, '123', 'Majoris', 'UAE', NULL, '2025-11-26 11:11:00'),
(28, 26, 'Desc', 'Job Expenses', 'Meal', 100.00, '123', 'Majoris', 'UAE', NULL, '2025-11-26 11:16:12'),
(29, 27, 'Desc1', 'Transport Repair & Service', 'Fuel', 100.00, '213', 'Majoris', 'I&M', 'CSS', '2025-12-10 09:49:47'),
(30, 28, 'Desc1', 'Toll', 'Highway Toll', 100.00, '123', 'Majoris', 'I&M', 'I&M General', '2025-12-11 06:43:21'),
(31, 29, 'Desc1', 'Transport Repair & Service', 'Fuel', 100.00, '133', 'Majoris', 'I&M', 'I&M General', '2025-12-11 06:48:20'),
(32, 30, 'Desc1', 'Transport Repair & Service', 'Fuel', 100.00, '1234', 'Majoris', 'I&M', 'Logistics', '2025-12-11 07:22:34'),
(33, 31, 'Desc1', 'Transport Repair & Service', 'Fuel', 100.00, '123', 'Majoris', 'I&M', 'Logistics', '2025-12-11 07:32:01'),
(34, 32, 'Desc1', 'Transport Repair & Service', 'Fuel', 100.00, '123', 'Majoris', 'I&M', 'Logistics', '2025-12-17 14:08:58'),
(35, 33, 'Desc1', 'Bank Charges', 'Cheque Book Fee', 100.00, '123', 'Majoris', 'Comon', 'Accounts', '2025-12-17 14:41:32'),
(36, 34, 'Desc1', 'DN Consumables', 'Stationery', 100.00, '120', 'Majoris', 'Comon', 'Accounts', '2025-12-17 16:13:54'),
(37, 35, 'fewe', 'DN Consumables', 'Stationery', 100.00, '123', 'Majoris', 'Comon', 'Accounts', '2025-12-17 16:18:50'),
(38, 36, 'Desc', 'Transport Repair & Service', 'Fuel', 100.00, '123', 'MAjors', 'I&M', 'I&M General', '2025-12-17 16:19:58'),
(39, 37, 'Desc1', 'Printing', 'Office Forms', 190.00, '123', 'Majoris', 'Comon', 'Accounts', '2025-12-17 16:29:15'),
(40, 37, 'Desc2', 'Equipment Hire', 'Tools', 100.00, '123', 'Majoris', 'Comon', '', '2025-12-17 16:29:15'),
(41, 38, 'dsd', 'Port Pass', 'Temporary Pass', 10.00, '123', 'MAjoris', 'Comon', 'Accounts', '2025-12-17 16:30:43'),
(42, 38, 'iwyrw', 'Coverall Purchase', 'Uniform', 10.00, '123', 'Majoris', 'Comon', 'Accounts', '2025-12-17 16:30:43'),
(43, 39, 'Desc1', 'Toll', 'Highway Toll', 100.00, '123', 'Majoris', 'I&M', 'Logistics', '2025-12-17 16:34:29'),
(44, 40, 'desc', 'Coverall Purchase', 'Uniform', 100.00, '123', 'Majoris', 'Comon', 'Accounts', '2025-12-17 16:37:07'),
(45, 41, 'Desc1', 'Coverall Purchase', 'Uniform', 1000.00, '123', 'Majoris', 'Comon', 'Accounts', '2025-12-17 16:44:21'),
(46, 42, 'Test Case1', 'Job Expenses', 'Site Allowance', 1000.00, '', '', 'I&M', 'CCS', '2025-12-17 17:24:05'),
(47, 43, 'Test Case 2', 'Coverall Purchase', 'Safety Wear', 3000.00, '', '', 'Comon', 'Accounts', '2025-12-17 17:25:56'),
(48, 44, 'Test Case 2', 'Coverall Purchase', 'Safety Wear', 3000.00, '', '', 'I&M', 'CSS', '2025-12-17 17:32:42'),
(49, 45, 'Test Case 2', 'Coverall Purchase', 'Safety Wear', 3000.00, '', 'AMES', 'I&M', 'CSS', '2025-12-17 17:41:53'),
(50, 46, 'Test Case 3', 'Coverall Purchase', 'Safety Wear', 8000.00, '', '', 'I&M', 'CSS', '2025-12-17 17:44:16'),
(51, 47, 'Test Case 3', 'Coverall Purchase', 'Safety Wear', 8000.00, '', '', 'I&M', 'CSS', '2025-12-17 17:45:50'),
(52, 48, 'Test Case 4', 'Coverall Purchase', 'Uniform', 1000.00, '1234', 'AMES', 'I&M', 'I&M General', '2025-12-17 17:51:18'),
(53, 49, 'Test Case 5', 'Transport Repair & Service', 'Taxi/Bus Fare', 1000.00, '', 'AMES', 'I&M', 'Logistics', '2025-12-17 17:54:59'),
(54, 50, 'Desc1', 'Coverall Purchase', 'Uniform', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 09:51:59'),
(55, 50, 'Desc2', 'Miscellaneous', 'Uncategorized', 500.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 09:51:59'),
(56, 51, 'Desc 1', 'Coverall Purchase', 'Uniform', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 10:14:04'),
(57, 51, 'Desc 2', 'Miscellaneous', 'Other', 500.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 10:14:04'),
(58, 52, 'Desc1', 'Coverall Purchase', 'Safety Wear', 5000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 10:15:11'),
(59, 53, 'Desc1', 'Coverall Purchase', 'Safety Wear', 5000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 10:28:50'),
(60, 54, 'Desc', 'Coverall Purchase', 'Uniform', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 10:30:41'),
(61, 55, 'Desc1', 'Coverall Purchase', 'Uniform', 10000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 10:50:56'),
(62, 56, 'Desc1', 'Coverall Purchase', 'Uniform', 100.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 10:56:00'),
(63, 57, 'Desc1', 'Miscellaneous', 'Other', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 12:02:31'),
(64, 57, 'Desc2', 'Coverall Purchase', 'Safety Wear', 500.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 12:02:31'),
(65, 58, 'Desc1', 'Coverall Purchase', 'Uniform', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 12:17:07'),
(66, 58, 'Desc2', 'Miscellaneous', 'Other', 500.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 12:17:07'),
(67, 59, 'Desc1', 'Miscellaneous', 'Other', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 12:20:33'),
(68, 60, 'Desc1', 'Coverall Purchase', 'Uniform', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 13:10:23'),
(69, 61, 'Desc1', 'Coverall Purchase', 'Safety Wear', 5000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 13:14:09'),
(70, 61, 'Desc 2', 'Miscellaneous', 'Other', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 13:14:09'),
(71, 62, 'Desc1', 'Coverall Purchase', 'Uniform', 5000.00, '', 'AMEs', 'I&M', 'CCS', '2025-12-22 13:20:42'),
(72, 63, 'Desc1', 'Coverall Purchase', 'Uniform', 5000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 13:27:04'),
(73, 64, 'Desc1', 'Coverall Purchase', 'Uniform', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 13:40:34'),
(74, 64, 'Desc 2', 'Miscellaneous', 'Other', 500.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 13:40:34'),
(75, 65, 'Desc1', 'DN Consumables', 'Stationery', 3000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 13:45:16'),
(76, 65, 'Desc 2', 'Coverall Purchase', 'Uniform', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 13:45:16'),
(77, 65, 'Desc 3', 'Coverall Purchase', 'Uniform', 2000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 13:45:16'),
(78, 66, 'Desc 1', 'Coverall Purchase', 'Uniform', 1000.00, '1234', 'AMES', 'I&M', 'I&M General', '2025-12-22 13:50:44'),
(79, 67, 'Desc 1', 'Coverall Purchase', 'Uniform', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 14:14:31'),
(80, 67, 'Desc 2', 'Miscellaneous', 'Other', 2000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 14:14:31'),
(81, 67, 'Desc 3', 'Job Expenses', 'Site Allowance', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 14:14:31'),
(82, 68, 'Desc1', 'Coverall Purchase', 'Uniform', 5000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-22 14:15:46'),
(83, 69, 'Desc 1', 'Coverall Purchase', 'Uniform', 1000.00, '123', 'AMES', 'I&M', 'I&M General', '2025-12-22 14:17:04'),
(84, 72, 'Desc1', 'Administration Expenses', 'Office Rent', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-26 06:36:39'),
(85, 73, 'Desc1', 'Coverall Purchase', 'Uniform', 3000.00, '1234', 'AMES', 'I&M', 'CCS', '2025-12-26 06:52:04'),
(86, 74, 'Desc1', 'Coverall Purchase', 'Uniform', 3450.00, '1234', 'AMES', 'I&M', 'CCS', '2025-12-26 06:57:32'),
(87, 75, 'Desc1', 'Coverall Purchase', 'Uniform', 3000.00, '1234', 'AMES', 'I&M', 'CCS', '2025-12-26 07:22:44'),
(88, 76, 'Desc1', 'Administration Expenses', 'Office Rent', 3000.00, '1234', 'AMES', 'I&M', 'CCS', '2025-12-26 07:29:30'),
(89, 77, 'Desc1', 'Transport Repair & Service', 'Tyre Replacement', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-26 07:58:58'),
(90, 78, 'Desc1', 'Administration Expenses', 'Office Rent', 3000.00, '123', 'AMES', 'I&M', 'CCS', '2025-12-26 08:01:05'),
(91, 78, 'Desc2', 'Miscellaneous', 'Other', 3000.00, '123', 'AMES', 'I&M', 'CCS', '2025-12-26 08:01:05'),
(92, 79, 'Desc1', 'Coverall Purchase', 'Uniform', 5000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-26 08:03:11'),
(93, 80, 'Desc1', 'Coverall Purchase', 'Uniform', 1000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-30 06:49:07'),
(94, 81, 'Desc2', 'Coverall Purchase', 'Uniform', 5000.00, '', 'AMES', 'I&M', 'CCS', '2025-12-30 06:49:53'),
(95, 82, 'Desc1', 'Coverall Purchase', 'Uniform', 2000.00, '1234', 'AMES', 'I&M', 'CCS', '2025-12-30 06:51:39'),
(96, 83, 'Desc1', 'Coverall Purchase', 'Uniform', 5000.00, '1234', 'AMES', 'I&M', 'CCS', '2025-12-30 06:52:49'),
(97, 84, 'Desc1', 'Transport Repair & Service', 'Servicing', 1000.00, '', 'AMES', 'I&M', 'Logistics', '2025-12-30 06:55:26'),
(98, 85, 'Desc1', 'Transport Repair & Service', 'Fuel', 10000.00, '1234', 'AMES', 'I&M', 'Logistics', '2025-12-30 06:56:21'),
(99, 86, 'Desc1', 'Transport Repair & Service', 'Tyre Replacement', 10000.00, '1234', 'AMES', 'I&M', 'Logistics', '2025-12-30 07:03:32'),
(100, 87, 'Desc1', 'Transport Repair & Service', 'Fuel', 10000.00, '1234', 'AMES', 'I&M', 'Logistics', '2025-12-30 07:14:35');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `role_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `role_level`) VALUES
(1, 'requester', 1),
(2, 'reviewer', 2),
(4, 'divisionHead', 5),
(5, 'accountsReviewer', 7),
(6, 'accountsApprovalHead', 8),
(7, 'admin', 99),
(17, 'invoiceReviewer', 3),
(18, 'logistics', 4),
(19, 'approver', 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `max_approval_limit` decimal(12,2) DEFAULT NULL,
  `specialization` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role_level` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `email`, `role_id`, `max_approval_limit`, `specialization`, `department`, `is_active`, `created_at`, `role_level`) VALUES
(8, 'Sreenath Nandakumar', '12345', 'Sreenath Nandakumar', NULL, 1, NULL, 'CCS', 'I&M', 1, '2025-11-17 07:33:26', 0),
(9, 'Praveen Kurup', '12345', 'Praveen Kurup', NULL, 2, NULL, 'CSS', 'I&M', 1, '2025-11-17 07:33:26', 0),
(14, 'admin', 'admin123', NULL, NULL, 7, NULL, NULL, NULL, 1, '2025-11-19 05:03:46', 99),
(27, 'Nimin Salimkumar', '12345', 'Nimin Salimkumar', NULL, 17, NULL, 'Job related', 'I&M General', 1, '2025-12-09 05:49:48', 0),
(28, 'Praveen Sudhakar', '12345', 'Praveen Sudhakar', NULL, 18, NULL, 'Logistics', 'I&M', 1, '2025-12-09 05:49:48', 0),
(29, 'division_head_user', '12345', 'Division Head', NULL, 4, 20000.00, 'general', NULL, 1, '2025-12-09 05:49:48', 0),
(30, 'Santhosh Kumar Gopalakishana Pillai', '12345', 'Santhosh Kumar Gopalakishana Pillai', NULL, 19, 50000.00, 'General', 'I&M General', 1, '2025-12-09 05:49:48', 0),
(31, 'Binil Mannadath', '12345', 'Binil Mannadath', NULL, 5, NULL, 'Accounts', 'Common', 1, '2025-12-09 05:49:48', 0),
(32, 'Baiju Patteri Shine Thomas', '12345', 'Baiju Patteri Shine Thomas', NULL, 6, 100000.00, 'Accounts', 'Common', 1, '2025-12-09 05:49:48', 0);

-- --------------------------------------------------------

--
-- Table structure for table `workflows`
--

CREATE TABLE `workflows` (
  `workflow_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workflows`
--

INSERT INTO `workflows` (`workflow_id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'jlwsd', NULL, 0, '2025-11-19 05:24:07', '2025-11-19 08:36:02'),
(2, 'Test Workflo', NULL, 0, '2025-11-19 08:36:02', '2025-11-26 06:28:06'),
(3, 'Test Workflo', NULL, 0, '2025-11-26 06:28:06', '2025-11-26 11:15:22'),
(4, 'Test Workflo', NULL, 0, '2025-11-26 11:15:22', '2025-12-17 16:36:29'),
(5, 'Test Workflo', NULL, 0, '2025-12-17 16:36:29', '2025-12-17 16:43:43'),
(6, 'Test Workflo', NULL, 1, '2025-12-17 16:43:43', '2025-12-17 16:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `workflow_steps`
--

CREATE TABLE `workflow_steps` (
  `step_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `step_order` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `role_label` varchar(150) DEFAULT NULL,
  `next_role` varchar(100) DEFAULT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workflow_steps`
--

INSERT INTO `workflow_steps` (`step_id`, `workflow_id`, `step_order`, `role_name`, `role_label`, `next_role`, `config`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'requester', 'requester', NULL, NULL, '2025-11-19 05:24:07', '2025-11-19 05:24:07'),
(2, 1, 2, 'reviewer', 'reviewer', NULL, NULL, '2025-11-19 05:24:07', '2025-11-19 05:24:07'),
(3, 1, 3, 'divisionHead', 'divisionHead', NULL, NULL, '2025-11-19 05:24:07', '2025-11-19 05:24:07'),
(4, 1, 4, 'accountsReviewer', 'accountsReviewer', NULL, NULL, '2025-11-19 05:24:07', '2025-11-19 05:24:07'),
(5, 2, 1, 'requester', 'requester', NULL, NULL, '2025-11-19 08:36:02', '2025-11-19 08:36:02'),
(6, 2, 2, 'divisionHead', 'divisionHead', NULL, NULL, '2025-11-19 08:36:02', '2025-11-19 08:36:02'),
(7, 2, 3, 'accountsApprovalHead', 'accountsApprovalHead', NULL, NULL, '2025-11-19 08:36:02', '2025-11-19 08:36:02'),
(8, 3, 1, 'reviewer', 'reviewer', NULL, NULL, '2025-11-26 06:28:06', '2025-11-26 06:28:06'),
(9, 3, 2, 'divisionHead', 'divisionHead', NULL, NULL, '2025-11-26 06:28:06', '2025-11-26 06:28:06'),
(10, 3, 3, 'accountsApprovalHead', 'accountsApprovalHead', NULL, NULL, '2025-11-26 06:28:06', '2025-11-26 06:28:06'),
(11, 4, 1, 'divisionHead', 'divisionHead', NULL, NULL, '2025-11-26 11:15:22', '2025-11-26 11:15:22'),
(12, 4, 2, 'reviewer', 'reviewer', NULL, NULL, '2025-11-26 11:15:22', '2025-11-26 11:15:22'),
(13, 4, 3, 'reviewer', 'reviewer', NULL, NULL, '2025-11-26 11:15:22', '2025-11-26 11:15:22'),
(14, 4, 4, 'accountsApprovalHead', 'accountsApprovalHead', NULL, NULL, '2025-11-26 11:15:22', '2025-11-26 11:15:22'),
(15, 5, 1, 'divisionHead', 'divisionHead', NULL, NULL, '2025-12-17 16:36:29', '2025-12-17 16:36:29'),
(16, 5, 2, 'accountsApprovalHead', 'accountsApprovalHead', NULL, NULL, '2025-12-17 16:36:29', '2025-12-17 16:36:29'),
(17, 6, 1, 'divisionHead', 'divisionHead', NULL, NULL, '2025-12-17 16:43:43', '2025-12-17 16:43:43'),
(18, 6, 2, 'accountsApprovalHead', 'accountsApprovalHead', NULL, NULL, '2025-12-17 16:43:43', '2025-12-17 16:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `workflow_versions`
--

CREATE TABLE `workflow_versions` (
  `version_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `version_no` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`attachment_id`),
  ADD KEY `claim_id` (`claim_id`),
  ADD KEY `detail_id` (`detail_id`);

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `claims`
--
ALTER TABLE `claims`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `requester_id` (`requester_id`);

--
-- Indexes for table `claim_attachments`
--
ALTER TABLE `claim_attachments`
  ADD PRIMARY KEY (`attachment_id`),
  ADD KEY `detail_id` (`detail_id`),
  ADD KEY `fk_claim` (`claim_id`);

--
-- Indexes for table `claim_details`
--
ALTER TABLE `claim_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `claim_id` (`claim_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `workflows`
--
ALTER TABLE `workflows`
  ADD PRIMARY KEY (`workflow_id`);

--
-- Indexes for table `workflow_steps`
--
ALTER TABLE `workflow_steps`
  ADD PRIMARY KEY (`step_id`),
  ADD KEY `workflow_id` (`workflow_id`);

--
-- Indexes for table `workflow_versions`
--
ALTER TABLE `workflow_versions`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `workflow_id` (`workflow_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `attachment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `claims`
--
ALTER TABLE `claims`
  MODIFY `claim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `claim_attachments`
--
ALTER TABLE `claim_attachments`
  MODIFY `attachment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `claim_details`
--
ALTER TABLE `claim_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `workflows`
--
ALTER TABLE `workflows`
  MODIFY `workflow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `workflow_steps`
--
ALTER TABLE `workflow_steps`
  MODIFY `step_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `workflow_versions`
--
ALTER TABLE `workflow_versions`
  MODIFY `version_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`claim_id`) REFERENCES `claims` (`claim_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attachments_ibfk_2` FOREIGN KEY (`detail_id`) REFERENCES `claim_details` (`detail_id`) ON DELETE CASCADE;

--
-- Constraints for table `claims`
--
ALTER TABLE `claims`
  ADD CONSTRAINT `claims_ibfk_1` FOREIGN KEY (`requester_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `claim_attachments`
--
ALTER TABLE `claim_attachments`
  ADD CONSTRAINT `claim_attachments_ibfk_1` FOREIGN KEY (`claim_id`) REFERENCES `claims` (`claim_id`),
  ADD CONSTRAINT `claim_attachments_ibfk_2` FOREIGN KEY (`detail_id`) REFERENCES `claim_details` (`detail_id`),
  ADD CONSTRAINT `fk_claim` FOREIGN KEY (`claim_id`) REFERENCES `claims` (`claim_id`);

--
-- Constraints for table `claim_details`
--
ALTER TABLE `claim_details`
  ADD CONSTRAINT `claim_details_ibfk_1` FOREIGN KEY (`claim_id`) REFERENCES `claims` (`claim_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

--
-- Constraints for table `workflow_steps`
--
ALTER TABLE `workflow_steps`
  ADD CONSTRAINT `workflow_steps_ibfk_1` FOREIGN KEY (`workflow_id`) REFERENCES `workflows` (`workflow_id`) ON DELETE CASCADE;

--
-- Constraints for table `workflow_versions`
--
ALTER TABLE `workflow_versions`
  ADD CONSTRAINT `workflow_versions_ibfk_1` FOREIGN KEY (`workflow_id`) REFERENCES `workflows` (`workflow_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
