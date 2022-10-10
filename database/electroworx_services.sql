-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2021 at 02:05 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electroworx_services`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appType` enum('installation','repair','maintenance') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allDay` tinyint(1) NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `appType`, `user_id`, `deleted_at`, `created_at`, `updated_at`, `start`, `end`, `title`, `allDay`, `color`) VALUES
(1, 'repair', 1, NULL, '2021-12-12 19:18:27', '2021-12-13 04:10:55', '2021-12-29 08:00:00', '2021-12-29 08:00:00', 'Leaky Faucet', 0, '#ea1e63'),
(2, 'repair', 1, NULL, '2021-12-12 21:36:09', '2021-12-13 04:06:50', '2021-12-08 13:00:00', '2021-12-08 13:00:00', 'Faulty Aircon', 0, '#009788'),
(3, 'installation', 1, '2021-12-13 03:31:40', '2021-12-12 21:41:09', '2021-12-13 03:31:40', '2021-12-13 08:00:00', '2021-12-13 08:28:59', 'New Fiber Internet', 0, '#f44437'),
(4, 'installation', 1, '2021-12-13 03:20:17', '2021-12-12 22:15:14', '2021-12-13 03:20:17', '2021-12-24 07:00:00', '2021-12-24 10:59:59', 'test2', 0, '#7e5d4e'),
(5, 'repair', 1, '2021-12-13 03:20:11', '2021-12-12 22:37:47', '2021-12-13 03:20:11', '2021-12-18 18:00:00', '2021-12-18 19:59:59', 'test3', 0, '#ea1e63'),
(6, 'repair', 2, '2021-12-13 03:20:46', '2021-12-12 23:02:35', '2021-12-13 03:20:46', '2021-12-16 07:00:00', '2021-12-16 10:36:59', 'Fridge Not Working', 0, '#4baf4f'),
(7, 'installation', 1, NULL, '2021-12-12 23:20:48', '2021-12-13 04:06:25', '2021-12-16 10:00:00', '2021-12-16 10:00:00', 'Broken Laptop', 0, '#4baf4f'),
(8, 'repair', 1, '2021-12-13 04:38:31', '2021-12-13 04:32:52', '2021-12-13 04:38:31', '2021-12-20 16:00:00', '2021-12-21 15:59:59', 'New', 0, '#ea1e63'),
(9, 'installation', 1, '2021-12-13 04:50:27', '2021-12-13 04:33:32', '2021-12-13 04:50:27', '2021-12-23 19:00:00', '2021-12-24 15:59:59', 'lou', 0, '#7e5d4e'),
(10, 'repair', 1, '2021-12-13 04:38:26', '2021-12-13 04:36:03', '2021-12-13 04:38:26', '2021-12-25 16:00:00', '2021-12-26 15:59:59', 'test2', 0, '#ea1e63'),
(11, 'repair', 1, '2021-12-13 04:50:26', '2021-12-13 04:39:14', '2021-12-13 04:50:26', '2021-12-20 16:00:00', '2021-12-21 15:59:59', 'New 2', 0, '#ea1e63'),
(12, 'repair', 1, '2021-12-13 04:50:29', '2021-12-13 04:42:00', '2021-12-13 04:50:29', '2021-12-13 16:00:00', '2021-12-14 15:59:59', 'New 3', 0, '#ea1e63'),
(13, 'repair', 1, '2021-12-13 04:52:48', '2021-12-13 04:50:44', '2021-12-13 04:52:48', '2021-12-19 16:00:00', '2021-12-20 15:59:59', 'New', 0, '#ea1e63'),
(14, 'repair', 1, '2021-12-13 04:54:15', '2021-12-13 04:52:59', '2021-12-13 04:54:15', '2021-12-20 07:00:00', '2021-12-20 15:59:59', 'me', 0, '#ff9900'),
(15, 'repair', 1, NULL, '2021-12-13 04:54:36', '2021-12-13 04:56:54', '2021-12-21 16:00:00', '2021-12-21 18:00:00', 'Fridge Not Working', 0, '#ff9900');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_12_10_084324_create_appointments_table', 1),
(6, '2021_12_12_170118_add_start_column_to_appointments_table', 2);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` enum('Admin','User') COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `email_verified_at`, `phone`, `userType`, `password`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jastine', 'Guzman', 'test@test.com', NULL, '12345678901', 'User', '$2y$10$BgOCBACHxGn6xN6.kpUvA.hNHKRjT4k6KX8cJ2v4bt61k7PGT8NSO', NULL, NULL, '2021-12-12 17:13:02', '2021-12-12 17:13:02'),
(2, 'Ben', 'Ten', 'test2@test.com', NULL, '12345678900', 'User', '$2y$10$GUcBwKLj82gzqjwzXTxXO.sSlETW.GyhMqnIBa42iG03SK3LZhrLG', NULL, NULL, '2021-12-12 22:57:14', '2021-12-12 22:57:14'),
(5, 'Christian', 'Stewart', 'test3@test.com', NULL, '12345678900', 'User', '$2y$10$rPBHhTB5lFQSZ/d/MXTZ9OAqcTohbNuehBEhHr5oa3jeUR0RJH.sK', NULL, NULL, '2021-12-12 23:17:36', '2021-12-12 23:17:36'),
(7, 'Ben', 'Ten', 'test4@test.com', NULL, '09273740131', 'User', '$2y$10$oFf1lSq7tg6XiPi0b5WYb.ppnq8QS3Htiw8uwCcaDxTFI/8jhDe1i', NULL, NULL, '2021-12-12 23:29:59', '2021-12-12 23:29:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
