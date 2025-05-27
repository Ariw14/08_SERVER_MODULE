-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2025 at 06:22 AM
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
-- Database: `lks_server`
--

-- --------------------------------------------------------

--
-- Table structure for table `available_month`
--

CREATE TABLE `available_month` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `installment_id` bigint(20) UNSIGNED NOT NULL,
  `month` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `available_month`
--

INSERT INTO `available_month` (`id`, `installment_id`, `month`, `description`, `nominal`) VALUES
(1, 1, 12, '12 months', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brand`) VALUES
(1, 'Toyota'),
(2, 'Yamaha'),
(3, 'BMW'),
(4, 'Bugatti'),
(5, 'Jeep');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `installment`
--

CREATE TABLE `installment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `cars` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `installment`
--

INSERT INTO `installment` (`id`, `brand_id`, `cars`, `description`, `price`) VALUES
(1, 1, 'Toyota supra mk4', 'Toyota supra mk4 2000', 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `installment_apply_societies`
--

CREATE TABLE `installment_apply_societies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notes` text DEFAULT NULL,
  `available_month_id` bigint(20) DEFAULT NULL,
  `date` date NOT NULL,
  `society_id` bigint(20) UNSIGNED NOT NULL,
  `installment_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `installment_apply_status`
--

CREATE TABLE `installment_apply_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `society_id` bigint(20) UNSIGNED NOT NULL,
  `installment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `available_month_id` bigint(20) UNSIGNED DEFAULT NULL,
  `installment_apply_societies_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','accepted','rejected') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_27_002316_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\societiesModel', 1, 'auth_token', 'e4144355438dfdbe81df52089670144fb52124d2f7a647b6d4031ffeef4baeb0', '[\"*\"]', NULL, NULL, '2025-05-26 18:38:46', '2025-05-26 18:38:46'),
(2, 'App\\Models\\societiesModel', 1, 'auth_token', '8628abbe2ac67aa67f601bc03610143a29338e6b74a20259a975c58ebe0fff58', '[\"*\"]', NULL, NULL, '2025-05-26 18:39:24', '2025-05-26 18:39:24'),
(3, 'App\\Models\\societiesModel', 1, 'auth_token', '1fe121545619774830ca0aa4aaa280f281970e80276d16d9e60c62cc6475722e', '[\"*\"]', NULL, NULL, '2025-05-26 18:41:13', '2025-05-26 18:41:13'),
(4, 'App\\Models\\societiesModel', 1, 'auth_token', 'f8db048f87f870fcc3bc3078e9823d5e0f453bb8dde61f392899265501e78642', '[\"*\"]', NULL, NULL, '2025-05-26 18:41:32', '2025-05-26 18:41:32'),
(5, 'App\\Models\\societiesModel', 1, 'auth_token', 'fc0f2a8586fbd97f8a28d2eaf8ad3000d3e78a4dd7e961b2c88e0b6056df9252', '[\"*\"]', NULL, NULL, '2025-05-26 18:41:49', '2025-05-26 18:41:49'),
(6, 'App\\Models\\societiesModel', 1, 'auth_token', '0f2cedac0df9c79212c6422260c81f7f27a04c0c14666b49a42abef8fb569d39', '[\"*\"]', NULL, NULL, '2025-05-26 18:42:13', '2025-05-26 18:42:13'),
(7, 'App\\Models\\societiesModel', 1, 'auth_token', '6c01ff0af9e2361197daf6dd4fff03c9d44ece06ed45533b98af59dc28c22285', '[\"*\"]', NULL, NULL, '2025-05-26 18:43:33', '2025-05-26 18:43:33'),
(8, 'App\\Models\\societiesModel', 1, 'auth_token', '1833589f4a153d3970f05490a6d478e6564d26f7cf7abfb1bb8b68f9af8f9e8e', '[\"*\"]', NULL, NULL, '2025-05-26 18:43:52', '2025-05-26 18:43:52'),
(9, 'App\\Models\\societiesModel', 1, 'auth_token', '0c32cc0a4b6530b35eca5e581415d5f32a4bc690e6cc37020b78e93ced299fa4', '[\"*\"]', NULL, NULL, '2025-05-26 18:47:10', '2025-05-26 18:47:10'),
(10, 'App\\Models\\societiesModel', 1, 'auth_token', 'f556fcb8fd1f0e6ecce40fb38bb8af99e9e2353fd2214a4fd7557ab71421dc63', '[\"*\"]', '2025-05-26 19:27:09', NULL, '2025-05-26 18:55:09', '2025-05-26 19:27:09'),
(11, 'App\\Models\\societiesModel', 1, 'auth_token', 'fe7a8b9ddc2d0f6f5f9a16e9da6b01c6202a1e8677a1ad1e34597150e354c9f5', '[\"*\"]', '2025-05-26 19:11:33', NULL, '2025-05-26 19:11:24', '2025-05-26 19:11:33'),
(12, 'App\\Models\\societiesModel', 1, 'auth_token', '07663a83bab1c80b193ddfed4c491c24aeb253ce7a5e05317258b8e7f7d6aa56', '[\"*\"]', NULL, NULL, '2025-05-26 19:46:45', '2025-05-26 19:46:45'),
(13, 'App\\Models\\societiesModel', 4, 'auth_token', '945f6a47be97bfc5da01e62bf9533dc7afb873ec30f94eb951b67481e5ecf094', '[\"*\"]', NULL, NULL, '2025-05-26 19:46:51', '2025-05-26 19:46:51'),
(14, 'App\\Models\\societiesModel', 4, 'auth_token', 'eb09415b30c5a7eabb916597f3b7465ab258be4293a42df9b5d086c6c00f333e', '[\"*\"]', NULL, NULL, '2025-05-26 19:55:58', '2025-05-26 19:55:58'),
(15, 'App\\Models\\societiesModel', 4, 'auth_token', 'a06998c1b1697754d26ab36466d6199e5a0007c1029807df55f30890db45e43b', '[\"*\"]', '2025-05-26 20:01:08', NULL, '2025-05-26 19:56:58', '2025-05-26 20:01:08'),
(16, 'App\\Models\\societiesModel', 4, 'auth_token', 'e46124da8700c1d86a3889a8cdabc073dc55a334abfb3551294c00de4faae865', '[\"*\"]', '2025-05-26 20:07:26', NULL, '2025-05-26 20:04:58', '2025-05-26 20:07:26'),
(17, 'App\\Models\\societiesModel', 4, 'auth_token', '08a9078ad87223a41c4e24e6db6174c5e71199cce82b468e4d1daff6a7f502a3', '[\"*\"]', NULL, NULL, '2025-05-26 20:09:19', '2025-05-26 20:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `regionals`
--

CREATE TABLE `regionals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `province` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regionals`
--

INSERT INTO `regionals` (`id`, `province`, `district`) VALUES
(1, 'DKI Jakarta', 'Central Jakarta'),
(2, 'DKI Jakarta', 'South Jakarta'),
(3, 'West Java', 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Rvv7JIFRj6ChoeItEBYZzuzJZrqtkz1VSFVc9opQ', NULL, '127.0.0.1', 'PostmanRuntime/7.44.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODNkY1cydWVBam1uUkFmVUt6YVVKOHB0S3NPMXRnbkQyNnY2VEpJWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748315493);

-- --------------------------------------------------------

--
-- Table structure for table `societies`
--

CREATE TABLE `societies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_card_number` char(8) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `born_date` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `address` text NOT NULL,
  `regional_id` bigint(20) UNSIGNED NOT NULL,
  `login_tokens` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `societies`
--

INSERT INTO `societies` (`id`, `id_card_number`, `password`, `name`, `born_date`, `gender`, `address`, `regional_id`, `login_tokens`) VALUES
(1, '20210001', '121212', 'Omar Gunawan', '1990-04-18', 'male', 'Jln. Baranang Siang No. 479, DKI Jakarta', 1, NULL),
(2, '20210002', '121212', 'Nilam Sinaga', '1998-09-11', 'female', 'Gg. Sukajadi No. 26, DKI Jakarta', 1, NULL),
(3, '20210003', '121212', 'Rosman Lailasari', '1983-02-12', 'male', 'Jln. Moch. Ramdan No. 242, DKI Jakarta', 1, NULL),
(4, '20210004', '121212', 'Ifa Adriansyah', '1993-05-17', 'female', 'Gg. Setia Budi No. 215, DKI Jakarta', 1, NULL),
(5, '20210005', '121212', 'Sakura Susanti', '1973-11-05', 'male', 'Kpg. B.Agam 1 No. 729, DKI Jakarta', 1, NULL),
(6, '20210006', '121212', 'Jail Utama', '2001-12-28', 'male', 'Kpg. Cikutra Timur No. 57, DKI Jakarta', 1, NULL),
(7, '20210007', '121212', 'Gawati Wibowo', '1971-08-23', 'male', 'Kpg. Bara No. 346, DKI Jakarta', 1, NULL),
(8, '20210008', '121212', 'Pia Rajata', '1976-08-04', 'male', 'Kpg. Yohanes No. 445, DKI Jakarta', 1, NULL),
(9, '20210009', '121212', 'Darmaji Suartini', '1999-10-05', 'male', 'Gg. Kusmanto No. 622, DKI Jakarta', 1, NULL),
(10, '20210010', '121212', 'Kiandra Tamba', '1988-05-31', 'male', 'Ki. Sutarto No. 66, DKI Jakarta', 1, NULL),
(11, '20210011', '121212', 'Manah Thamrin', '1989-06-20', 'female', 'Jln. Baung No. 871, DKI Jakarta', 1, NULL),
(12, '20210012', '121212', 'Banara Ardianto', '1978-10-27', 'male', 'Ki. Yos Sudarso No. 411, DKI Jakarta', 1, NULL),
(13, '20210013', '121212', 'Anggabaya Mustofa', '1979-05-11', 'female', 'Psr. Pacuan Kuda No. 351, DKI Jakarta', 1, NULL),
(14, '20210014', '121212', 'Emong Purnawati', '1979-07-15', 'male', 'Jln. Jayawijaya No. 141, DKI Jakarta', 1, NULL),
(15, '20210015', '121212', 'Nardi Pertiwi', '1981-05-14', 'male', 'Psr. Barasak No. 554, DKI Jakarta', 1, NULL),
(16, '20210016', '121212', 'Ina Nasyiah', '1971-05-21', 'female', 'Ds. Suryo No. 100, DKI Jakarta', 2, NULL),
(17, '20210017', '121212', 'Jinawi Wastuti', '1994-06-18', 'male', 'Ki. Sugiono No. 918, DKI Jakarta', 2, NULL),
(18, '20210018', '121212', 'Marsudi Utama', '1979-06-04', 'female', 'Kpg. Cikapayang No. 229, DKI Jakarta', 2, NULL),
(19, '20210019', '121212', 'Ilsa Gunarto', '1992-06-11', 'female', 'Gg. Baing No. 871, DKI Jakarta', 2, NULL),
(20, '20210020', '121212', 'Hani Pratiwi', '1990-07-10', 'male', 'Dk. Yap Tjwan Bing No. 528, DKI Jakarta', 2, NULL),
(21, '20210021', '121212', 'Najwa Pratiwi', '1996-11-05', 'male', 'Kpg. Raden No. 688, DKI Jakarta', 2, NULL),
(22, '20210022', '121212', 'Samiah Haryanto', '1985-10-26', 'male', 'Gg. Juanda No. 863, DKI Jakarta', 2, NULL),
(23, '20210023', '121212', 'Olga Safitri', '1971-03-04', 'male', 'Psr. Ir. H. Juanda No. 728, DKI Jakarta', 2, NULL),
(24, '20210024', '121212', 'Halim Winarsih', '1974-11-16', 'male', 'Dk. Nakula No. 730, DKI Jakarta', 2, NULL),
(25, '20210025', '121212', 'Vivi Widodo', '1988-09-19', 'male', 'Kpg. Astana Anyar No. 983, DKI Jakarta', 2, NULL),
(26, '20210026', '121212', 'Dian Firmansyah', '1985-04-01', 'male', 'Kpg. Baha No. 855, DKI Jakarta', 2, NULL),
(27, '20210027', '121212', 'Patricia Usada', '1986-08-28', 'male', 'Psr. Ters. Jakarta No. 993, DKI Jakarta', 2, NULL),
(28, '20210028', '121212', 'Soleh Mandasari', '1988-09-28', 'female', 'Ki. Flores No. 869, DKI Jakarta', 2, NULL),
(29, '20210029', '121212', 'Kamal Pranowo', '1976-08-10', 'male', 'Jln. Baung No. 80, DKI Jakarta', 2, NULL),
(30, '20210030', '121212', 'Ade Kusmawati', '1996-08-29', 'male', 'Jln. Kiaracondong No. 398, DKI Jakarta', 2, NULL),
(31, '20210031', '121212', 'Irwan Sinaga', '1976-10-06', 'female', 'Dk. Basmol Raya No. 714, West Java', 3, NULL),
(32, '20210032', '121212', 'Lulut Lestari', '1981-03-31', 'male', 'Ds. Cihampelas No. 933, West Java', 3, NULL),
(33, '20210033', '121212', 'Balijan Rahimah', '1972-04-25', 'female', 'Ki. Ciwastra No. 539, West Java', 3, NULL),
(34, '20210034', '121212', 'Kasiyah Sitompul', '1975-01-14', 'male', 'Dk. Sutarto No. 434, West Java', 3, NULL),
(35, '20210035', '121212', 'Wulan Nasyidah', '1974-11-04', 'male', 'Dk. Mahakam No. 367, West Java', 3, NULL),
(36, '20210036', '121212', 'Damar Palastri', '1981-03-24', 'female', 'Jr. Teuku Umar No. 547, West Java', 3, NULL),
(37, '20210037', '121212', 'Gamanto Simanjuntak', '1972-01-13', 'female', 'Jln. Salam No. 421, West Java', 3, NULL),
(38, '20210038', '121212', 'Lukita Gunarto', '1998-11-27', 'female', 'Jr. HOS. Cjokroaminoto (Pasirkaliki) No. 9, West Java', 3, NULL),
(39, '20210039', '121212', 'Malika Nashiruddin', '1989-07-05', 'male', 'Psr. Kartini No. 960, West Java', 3, NULL),
(40, '20210040', '121212', 'Siska Hutapea', '1972-03-30', 'female', 'Ki. Wora Wari No. 501, West Java', 3, NULL),
(41, '20210041', '121212', 'Laras Sirait', '1971-01-13', 'male', 'Psr. Basmol Raya No. 859, West Java', 3, NULL),
(42, '20210042', '121212', 'Embuh Mulyani', '1996-08-05', 'male', 'Kpg. Wahidin No. 512, West Java', 3, NULL),
(43, '20210043', '121212', 'Mutia Nashiruddin', '1985-05-08', 'female', 'Ds. Hang No. 765, West Java', 3, NULL),
(44, '20210044', '121212', 'Pangestu Lazuardi', '2001-08-02', 'male', 'Dk. Bass No. 886, West Java', 3, NULL),
(45, '20210045', '121212', 'Gaduh Suwarno', '1971-07-27', 'female', 'Psr. Basuki No. 591, West Java', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `validations`
--

CREATE TABLE `validations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `society_id` bigint(20) UNSIGNED NOT NULL,
  `validator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('accepted','declined','pending') NOT NULL DEFAULT 'pending',
  `job` varchar(255) DEFAULT NULL,
  `job_description` text DEFAULT NULL,
  `income` int(20) DEFAULT NULL,
  `reason_accepted` text DEFAULT NULL,
  `validator_notes` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `validators`
--

CREATE TABLE `validators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('officer','validator') NOT NULL DEFAULT 'officer',
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `validators`
--

INSERT INTO `validators` (`id`, `user_id`, `role`, `name`) VALUES
(1, 1, 'validator', 'Kamila Wibisono'),
(2, 2, 'validator', 'Maya Kusmawati'),
(3, 3, 'validator', 'Gaduh Prasetyo'),
(4, 4, 'officer', 'Indra Usamah'),
(5, 5, 'officer', 'Kalim Yulianti'),
(6, 6, 'validator', 'Eva Mandasari'),
(7, 7, 'validator', 'Jatmiko Handayani'),
(8, 8, 'validator', 'Ratna Riyanti'),
(9, 9, 'officer', 'Ayu Iswahyudi'),
(10, 10, 'officer', 'Azalea Mulyani'),
(11, 11, 'validator', 'Hesti Andriani'),
(12, 12, 'validator', 'Kusuma Nasyidah'),
(13, 13, 'validator', 'Gaman Sihotang'),
(14, 14, 'officer', 'Bella Habibi'),
(15, 15, 'officer', 'Titin Agustina'),
(16, 16, 'validator', 'Ami Kurniawan'),
(17, 17, 'validator', 'Hasta Riyanti'),
(18, 18, 'validator', 'Laila Hassanah'),
(19, 19, 'officer', 'Martana Hakim'),
(20, 20, 'officer', 'Aurora Siregar'),
(21, 21, 'validator', 'Tina Prastuti'),
(22, 22, 'validator', 'Farhunnisa Widiastuti'),
(23, 23, 'validator', 'Olga Hartati'),
(24, 24, 'officer', 'Tira Purwanti'),
(25, 25, 'officer', 'Darmanto Nuraini'),
(26, 26, 'validator', 'Okto Pradana'),
(27, 27, 'validator', 'Dian Hariyah'),
(28, 28, 'validator', 'Ganda Gunawan'),
(29, 29, 'officer', 'Najam Rajata'),
(30, 30, 'officer', 'Hani Maulana'),
(31, 31, 'validator', 'Galak Uyainah'),
(32, 32, 'validator', 'Eka Suartini'),
(33, 33, 'validator', 'Asmianto Kusumo'),
(34, 34, 'officer', 'Prayitna Yuniar'),
(35, 35, 'officer', 'Banawi Prastuti'),
(36, 36, 'validator', 'Kania Maulana'),
(37, 37, 'validator', 'Salwa Mansur'),
(38, 38, 'validator', 'Dagel Puspita'),
(39, 39, 'officer', 'Jamal Rahimah'),
(40, 40, 'officer', 'Ami Prastuti'),
(41, 41, 'validator', 'Puput Suryatmi'),
(42, 42, 'validator', 'Hani Uyainah'),
(43, 43, 'validator', 'Aditya Kusmawati'),
(44, 44, 'officer', 'Agnes Permadi'),
(45, 45, 'officer', 'Edison Susanti'),
(46, 46, 'validator', 'Winda Pertiwi'),
(47, 47, 'validator', 'Emil Nuraini'),
(48, 48, 'validator', 'Raden Sinaga'),
(49, 49, 'officer', 'Sadina Nurdiyanti'),
(50, 50, 'officer', 'Jessica Habibi'),
(51, 51, 'validator', 'Maya Napitupulu'),
(52, 52, 'validator', 'Nurul Utama'),
(53, 53, 'validator', 'Asmianto Ardianto'),
(54, 54, 'officer', 'Cawisono Wulandari'),
(55, 55, 'officer', 'Candrakanta Palastri'),
(56, 56, 'validator', 'Uda Sitorus'),
(57, 57, 'validator', 'Paiman Zulaika'),
(58, 58, 'validator', 'Eko Putra'),
(59, 59, 'officer', 'Mariadi Samosir'),
(60, 60, 'officer', 'Chandra Januar'),
(61, 61, 'validator', 'Padma Hariyah'),
(62, 62, 'validator', 'Taufik Uyainah'),
(63, 63, 'validator', 'Maria Laksmiwati'),
(64, 64, 'officer', 'Harjo Tamba'),
(65, 65, 'officer', 'Vanesa Palastri'),
(66, 66, 'validator', 'Diah Mulyani'),
(67, 67, 'validator', 'Syahrini Farida'),
(68, 68, 'validator', 'Fitria Winarsih'),
(69, 69, 'officer', 'Clara Pratiwi'),
(70, 70, 'officer', 'Dian Habibi'),
(71, 71, 'validator', 'Aurora Wulandari'),
(72, 72, 'validator', 'Safina Hassanah'),
(73, 73, 'validator', 'Cinthia Adriansyah'),
(74, 74, 'officer', 'Wadi Prakasa'),
(75, 75, 'officer', 'Parman Namaga');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `available_month`
--
ALTER TABLE `available_month`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spot_vaccines_spot_id_foreign` (`installment_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `installment`
--
ALTER TABLE `installment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `installment_apply_societies`
--
ALTER TABLE `installment_apply_societies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `society_id` (`society_id`),
  ADD KEY `installment_id_foreign` (`installment_id`);

--
-- Indexes for table `installment_apply_status`
--
ALTER TABLE `installment_apply_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_apply_position_id_foreign` (`available_month_id`),
  ADD KEY `job_apply_position_society_id_foreign` (`society_id`),
  ADD KEY `job_apply_position_job_vacancy_id_foreign` (`installment_id`),
  ADD KEY `job_apply_position_job_apply_societies_id_foreign` (`installment_apply_societies_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `regionals`
--
ALTER TABLE `regionals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `societies`
--
ALTER TABLE `societies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `societies_id_card_number_unique` (`id_card_number`),
  ADD KEY `societies_regional_id_foreign` (`regional_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `validations`
--
ALTER TABLE `validations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consultations_society_id_foreign` (`society_id`),
  ADD KEY `consultations_doctor_id_foreign` (`validator_id`);

--
-- Indexes for table `validators`
--
ALTER TABLE `validators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `validators_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
