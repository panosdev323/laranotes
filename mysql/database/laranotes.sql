-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 22 Ιουλ 2024 στις 20:30:42
-- Έκδοση διακομιστή: 10.4.32-MariaDB
-- Έκδοση PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `laranotes`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `events`
--

INSERT INTO `events` (`id`, `user_id`, `name`, `description`, `start_time`, `end_time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'First eVENET', 'Sed vel fringilla lectus. Ut placerat pellentesque diam vel commodo. Nunc condimentum congue massa, a porttitor tortor suscipit in. Praesent sodales vestibulum tellus. Nam viverra arcu eu consectetur finibus. Donec mattis id libero quis pretium. Integer maximus augue quam, in accumsan nulla eleifend ut. Pellentesque vel mi pretium, tristique libero ac, ullamcorper sem. Sed ac sagittis lorem. Fusce volutpat pellentesque leo, id scelerisque arcu congue in. Donec ut lorem at ipsum ultrices eleifend ac id elit. Proin eu justo sit amet felis lacinia rhoncus. Vestibulum pulvinar dictum nibh vel ornare. Fusce maximus et arcu non tempus. Donec ut ultrices diam. Fusce at ultrices arcu, eu vehicula lacus.\r\n\r\nNunc ultrices ante ut mauris feugiat sollicitudin. Suspendisse ut feugiat odio. Donec ultricies laoreet auctor. Nunc faucibus rutrum ultrices. Vivamus pharetra velit et elit varius, ac rutrum nisi auctor. Vivamus vel mattis risus, eget aliquam leo. Fusce magna enim, gravida vel elementum vitae, semper id mi. Proin ut turpis magna. Integer efficitur dolor turpis, vitae porta arcu mollis et. Nullam nec tempor nisl, ac elementum mi. Mauris aliquet massa ut tortor tempus, sed venenatis nulla condimentum. Suspendisse non posuere sem, a dignissim est. Nullam auctor nunc non velit finibus, eu cursus massa pulvinar. Etiam consequat et nisi lobortis rutrum. Nullam a tortor at turpis rhoncus congue a eu massa. Suspendisse condimentum congue eleifend.\r\n\r\n', '2024-07-22 04:16:18', '2024-07-31 05:16:18', '2024-07-23 02:16:18', '2024-07-23 02:16:18', NULL),
(2, 1, 'Second Event', 'Sed vel fringilla lectus. Ut placerat pellentesque diam vel commodo. Nunc condimentum congue massa, a porttitor tortor suscipit in. Praesent sodales vestibulum tellus. Nam viverra arcu eu consectetur finibus. Donec mattis id libero quis pretium. Integer maximus augue quam, in accumsan nulla eleifend ut. Pellentesque vel mi pretium, tristique libero ac, ullamcorper sem. Sed ac sagittis lorem. Fusce volutpat pellentesque leo, id scelerisque arcu congue in. Donec ut lorem at ipsum ultrices eleifend ac id elit. Proin eu justo sit amet felis lacinia rhoncus. Vestibulum pulvinar dictum nibh vel ornare. Fusce maximus et arcu non tempus. Donec ut ultrices diam. Fusce at ultrices arcu, eu vehicula lacus.\r\n\r\nNunc ultrices ante ut mauris feugiat sollicitudin. Suspendisse ut feugiat odio. Donec ultricies laoreet auctor. Nunc faucibus rutrum ultrices. Vivamus pharetra velit et elit varius, ac rutrum nisi auctor. Vivamus vel mattis risus, eget aliquam leo. Fusce magna enim, gravida vel elementum vitae, semper id mi. Proin ut turpis magna. Integer efficitur dolor turpis, vitae porta arcu mollis et. Nullam nec tempor nisl, ac elementum mi. Mauris aliquet massa ut tortor tempus, sed venenatis nulla condimentum. Suspendisse non posuere sem, a dignissim est. Nullam auctor nunc non velit finibus, eu cursus massa pulvinar. Etiam consequat et nisi lobortis rutrum. Nullam a tortor at turpis rhoncus congue a eu massa. Suspendisse condimentum congue eleifend.', '2024-07-25 00:00:00', '2024-07-31 00:00:00', '2024-07-21 23:32:54', '2024-07-21 23:32:54', NULL),
(3, 2, 'my event!!', 'i can see this event like all events but i can also edit and delete it because its mine', '2024-07-22 00:00:00', '2024-07-31 00:00:00', '2024-07-22 04:54:09', '2024-07-22 04:54:55', NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `failed_jobs`
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
-- Δομή πίνακα για τον πίνακα `jobs`
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
-- Δομή πίνακα για τον πίνακα `job_batches`
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
-- Δομή πίνακα για τον πίνακα `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '0001_01_01_000000_create_users_table', 1),
(9, '0001_01_01_000001_create_cache_table', 1),
(10, '0001_01_01_000002_create_jobs_table', 1),
(11, '2024_07_17_163612_create_notes_table', 1),
(12, '2024_07_21_152512_add_soft_deletes_to_notes', 1),
(13, '2024_07_22_001441_create_events_table', 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `notes`
--

INSERT INTO `notes` (`id`, `uuid`, `user_id`, `title`, `text`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '44127acb-68fb-420e-a006-f715d5aaddb1', 1, 'My First Note', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2024-07-21 23:13:47', '2024-07-21 23:13:47', NULL),
(2, '717c83b0-3783-4481-bc37-9ddff81a5b1e', 1, 'My Second Note', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', '2024-07-21 23:13:58', '2024-07-21 23:13:58', NULL),
(3, 'c5bb6eae-04d2-4ecc-bf26-390c7bf7dbd3', 1, 'Lorem Ipsum', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '2024-07-21 23:14:16', '2024-07-21 23:14:22', NULL),
(4, 'c926f577-85af-4c73-a512-e4227cc059a7', 1, 'Rock & Roll', 'Sed vel fringilla lectus. Ut placerat pellentesque diam vel commodo. Nunc condimentum congue massa, a porttitor tortor suscipit in. Praesent sodales vestibulum tellus. Nam viverra arcu eu consectetur finibus. Donec mattis id libero quis pretium. Integer maximus augue quam, in accumsan nulla eleifend ut. Pellentesque vel mi pretium, tristique libero ac, ullamcorper sem. Sed ac sagittis lorem. Fusce volutpat pellentesque leo, id scelerisque arcu congue in. Donec ut lorem at ipsum ultrices eleifend ac id elit. Proin eu justo sit amet felis lacinia rhoncus. Vestibulum pulvinar dictum nibh vel ornare. Fusce maximus et arcu non tempus. Donec ut ultrices diam. Fusce at ultrices arcu, eu vehicula lacus.', '2024-07-21 23:14:40', '2024-07-21 23:14:40', NULL),
(5, '4cf661aa-876d-4613-ac47-98509adba7b7', 1, 'One More', 'Nunc ultrices ante ut mauris feugiat sollicitudin. Suspendisse ut feugiat odio. Donec ultricies laoreet auctor. Nunc faucibus rutrum ultrices. Vivamus pharetra velit et elit varius, ac rutrum nisi auctor. Vivamus vel mattis risus, eget aliquam leo. Fusce magna enim, gravida vel elementum vitae, semper id mi. Proin ut turpis magna. Integer efficitur dolor turpis, vitae porta arcu mollis et. Nullam nec tempor nisl, ac elementum mi. Mauris aliquet massa ut tortor tempus, sed venenatis nulla condimentum. Suspendisse non posuere sem, a dignissim est. Nullam auctor nunc non velit finibus, eu cursus massa pulvinar. Etiam consequat et nisi lobortis rutrum. Nullam a tortor at turpis rhoncus congue a eu massa. Suspendisse condimentum congue eleifend.', '2024-07-21 23:14:52', '2024-07-21 23:14:52', NULL),
(6, 'c4b6283c-46f9-4774-9738-1fea11326e8d', 1, 'last One', 'Donec auctor mauris non aliquet auctor. Fusce eu faucibus justo, nec aliquet eros. Aenean gravida nulla nec orci tempus, faucibus vehicula purus lobortis. Sed iaculis rhoncus velit a convallis. Praesent sed nisi a elit rutrum iaculis. Quisque vitae ultrices nunc. Cras fermentum dapibus vehicula. Ut ac nibh sit amet purus congue aliquet sit amet eget orci. Fusce imperdiet vel mauris quis vehicula. Etiam eget augue in nunc placerat convallis.', '2024-07-21 23:15:02', '2024-07-21 23:15:02', NULL),
(7, '3577c047-5aba-432b-acd8-c1492d2748fc', 1, 'Pano\'s Dev', 'Sed massa odio, vestibulum at quam eget, condimentum facilisis elit. In hendrerit vitae neque aliquam accumsan. Aliquam semper molestie risus non molestie. In sit amet faucibus magna. Nulla dignissim dictum nisi, a finibus nisl facilisis quis. Nulla risus lorem, hendrerit tristique tempus vitae, cursus at turpis. Nullam quis eleifend nunc. Duis rutrum accumsan urna, non auctor augue aliquet vitae. Phasellus nec rhoncus erat, cursus tincidunt erat. Cras varius fermentum dui, fringilla accumsan tellus.', '2024-07-21 23:15:20', '2024-07-21 23:15:35', '2024-07-21 23:15:35');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `sessions`
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
-- Άδειασμα δεδομένων του πίνακα `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1MOJwdo32d7VTtjEzBmWvlyphSN2JRPVvvCuJAiy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiekQyQTRnamU5bnZHSk9pdlRQdldlamkwUzFxZndUNkJtVlZ4QW1obCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721661647),
('dV404FhjXPciIs4h3Q2gC6shgV2Bbj4zCSZEwb32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOTE1bExBTTlpMlpsTGM3aGlnazNjM3JaQkwwaVdOcVduakxwWDlaTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1721669605),
('qXmjQwxGQ7vJ4vZXqL0hcrfPXyRlji3Eq8viDIBc', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQmtyWlJCamFKTXdtVzN5Y25NQTVyd3pXUVI1M2N5TGVGVERXRWE0SyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1721637561),
('rGM6m2nNREaljTb64q1AnegrewMKPYM2bb01nPHA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMlpNRFlLdmlTTjZwa2w0WG0yT1NDUUlHN0h0dDVyY1FBaTIycTNNcyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721634759);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `users`
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

--
-- Άδειασμα δεδομένων του πίνακα `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'panos  paou', 'panospaoulinis@gmail.com', NULL, '$2y$12$0xCnuHvxmB2uUzz76jdTNOtEa3CTgLYq15f4COCHP1UxkFEpZKunu', NULL, '2024-07-21 23:13:10', '2024-07-21 23:13:26'),
(2, 'ytest user', 'ytest@gmail.com', NULL, '$2y$12$3AAhMOe/iN8djgwYLtw7yepzYZmisAC/bxNfTEW7ISkFrkLwJ7brG', NULL, '2024-07-22 04:53:22', '2024-07-22 04:53:22');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Ευρετήρια για πίνακα `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Ευρετήρια για πίνακα `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_user_id_foreign` (`user_id`);

--
-- Ευρετήρια για πίνακα `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Ευρετήρια για πίνακα `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Ευρετήρια για πίνακα `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_user_id_foreign` (`user_id`);

--
-- Ευρετήρια για πίνακα `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Ευρετήρια για πίνακα `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Ευρετήρια για πίνακα `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT για πίνακα `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT για πίνακα `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT για πίνακα `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Περιορισμοί για πίνακα `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
