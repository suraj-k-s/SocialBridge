-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2024 at 11:18 AM
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
-- Database: `db_socialbridge`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(8, 'Admin', 'admin@gmail.com', 'admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `comment_content` varchar(200) NOT NULL,
  `comment_date` varchar(50) NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `sponser_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sponser_name` varchar(50) NOT NULL DEFAULT '0',
  `sponser_photo` longtext NOT NULL,
  `influencer_id` int(11) NOT NULL DEFAULT 0,
  `influencer_name` varchar(50) NOT NULL DEFAULT '0',
  `influencer_photo` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(10) UNSIGNED NOT NULL,
  `complaint_content` varchar(50) NOT NULL,
  `complaint_date` varchar(50) NOT NULL,
  `complaint_reply` varchar(50) NOT NULL DEFAULT 'Not Yet Reply',
  `complaint_reply_date` varchar(50) NOT NULL DEFAULT '0',
  `complaint_status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sponser_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `influencer_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(10) UNSIGNED NOT NULL,
  `district_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(10) UNSIGNED NOT NULL,
  `feedback_content` varchar(50) NOT NULL,
  `feedback_date` varchar(50) NOT NULL,
  `college_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `department_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sponser_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `influencer_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_influencer`
--

CREATE TABLE `tbl_influencer` (
  `influencer_id` int(10) UNSIGNED NOT NULL,
  `influencer_name` varchar(50) NOT NULL,
  `influencer_contact` varchar(50) NOT NULL,
  `influencer_email` varchar(50) NOT NULL,
  `influencer_address` varchar(50) NOT NULL,
  `influencer_photo` longtext NOT NULL,
  `influencer_password` varchar(50) NOT NULL,
  `place_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_like`
--

CREATE TABLE `tbl_like` (
  `like_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `sponser_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sponser_name` varchar(50) NOT NULL DEFAULT '0',
  `sponser_photo` longtext NOT NULL,
  `influencer_id` int(11) NOT NULL DEFAULT 0,
  `influencer_name` varchar(50) NOT NULL DEFAULT '0',
  `influencer_photo` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_phishingurls`
--

CREATE TABLE `tbl_phishingurls` (
  `phishing_id` int(10) UNSIGNED NOT NULL,
  `phishing_url` longtext NOT NULL,
  `phishing_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(11) NOT NULL,
  `district_id` int(10) UNSIGNED NOT NULL,
  `place_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

CREATE TABLE `tbl_post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `post_content` varchar(200) NOT NULL,
  `post_date` varchar(50) NOT NULL,
  `post_file` longtext DEFAULT NULL,
  `sponser_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sponser_name` varchar(50) NOT NULL DEFAULT '0',
  `sponser_photo` longtext NOT NULL,
  `influencer_id` int(11) NOT NULL DEFAULT 0,
  `influencer_name` varchar(50) NOT NULL DEFAULT '0',
  `influencer_photo` longtext NOT NULL,
  `privacy_status` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sponser`
--

CREATE TABLE `tbl_sponser` (
  `sponser_id` int(10) UNSIGNED NOT NULL,
  `sponser_name` varchar(50) NOT NULL,
  `sponser_contact` varchar(50) NOT NULL,
  `sponser_email` varchar(50) NOT NULL,
  `sponser_address` varchar(50) NOT NULL,
  `sponser_photo` longtext NOT NULL,
  `sponser_password` varchar(50) NOT NULL,
  `place_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sponser_influencer_chat`
--

CREATE TABLE `tbl_sponser_influencer_chat` (
  `chat_id` int(10) UNSIGNED NOT NULL,
  `chat_content` varchar(3500) NOT NULL,
  `from_sponser_id` int(10) UNSIGNED DEFAULT 0,
  `to_sponser_id` int(10) UNSIGNED DEFAULT 0,
  `to_influencer_id` int(10) UNSIGNED DEFAULT 0,
  `from_influencer_id` int(10) UNSIGNED DEFAULT 0,
  `chat_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_influencer`
--
ALTER TABLE `tbl_influencer`
  ADD PRIMARY KEY (`influencer_id`);

--
-- Indexes for table `tbl_like`
--
ALTER TABLE `tbl_like`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `tbl_phishingurls`
--
ALTER TABLE `tbl_phishingurls`
  ADD PRIMARY KEY (`phishing_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `tbl_sponser`
--
ALTER TABLE `tbl_sponser`
  ADD PRIMARY KEY (`sponser_id`);

--
-- Indexes for table `tbl_sponser_influencer_chat`
--
ALTER TABLE `tbl_sponser_influencer_chat`
  ADD PRIMARY KEY (`chat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_influencer`
--
ALTER TABLE `tbl_influencer`
  MODIFY `influencer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_like`
--
ALTER TABLE `tbl_like`
  MODIFY `like_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_phishingurls`
--
ALTER TABLE `tbl_phishingurls`
  MODIFY `phishing_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sponser`
--
ALTER TABLE `tbl_sponser`
  MODIFY `sponser_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sponser_influencer_chat`
--
ALTER TABLE `tbl_sponser_influencer_chat`
  MODIFY `chat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
