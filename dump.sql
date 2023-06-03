-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 03 2023 г., 12:35
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wsk-03-06`
--

-- --------------------------------------------------------

--
-- Структура таблицы `applications`
--

CREATE TABLE `applications` (
  `id` bigint UNSIGNED NOT NULL,
  `job_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `competitor_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `applications`
--

INSERT INTO `applications` (`id`, `job_id`, `created_at`, `updated_at`, `competitor_id`) VALUES
(8, 1, '2023-06-03 06:19:47', '2023-06-03 06:19:47', 1),
(9, 1, '2023-06-03 06:31:21', '2023-06-03 06:31:21', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `application_skills`
--

CREATE TABLE `application_skills` (
  `id` bigint UNSIGNED NOT NULL,
  `application_id` bigint UNSIGNED NOT NULL,
  `level_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `competence_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `application_skills`
--

INSERT INTO `application_skills` (`id`, `application_id`, `level_id`, `created_at`, `updated_at`, `competence_id`) VALUES
(29, 8, 2, '2023-06-03 06:19:47', '2023-06-03 06:19:47', 1),
(30, 8, 1, '2023-06-03 06:19:47', '2023-06-03 06:19:47', 2),
(31, 8, 1, '2023-06-03 06:19:47', '2023-06-03 06:19:47', 3),
(32, 8, 1, '2023-06-03 06:19:47', '2023-06-03 06:19:47', 4),
(33, 8, 1, '2023-06-03 06:19:47', '2023-06-03 06:19:47', 5),
(34, 8, 1, '2023-06-03 06:19:47', '2023-06-03 06:19:47', 6),
(35, 8, 1, '2023-06-03 06:19:47', '2023-06-03 06:19:47', 67),
(36, 9, 3, '2023-06-03 06:31:21', '2023-06-03 06:31:21', 1),
(37, 9, 2, '2023-06-03 06:31:21', '2023-06-03 06:31:21', 2),
(38, 9, 3, '2023-06-03 06:31:21', '2023-06-03 06:31:21', 3),
(39, 9, 2, '2023-06-03 06:31:21', '2023-06-03 06:31:21', 4),
(40, 9, 1, '2023-06-03 06:31:21', '2023-06-03 06:31:21', 5),
(41, 9, 1, '2023-06-03 06:31:21', '2023-06-03 06:31:21', 6),
(42, 9, 1, '2023-06-03 06:31:21', '2023-06-03 06:31:21', 67);

-- --------------------------------------------------------

--
-- Структура таблицы `competences`
--

CREATE TABLE `competences` (
  `id` int NOT NULL,
  `competence` varchar(8000) NOT NULL,
  `height` int NOT NULL,
  `job_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `competences`
--

INSERT INTO `competences` (`id`, `competence`, `height`, `job_id`) VALUES
(1, 'HTML', 10, 1),
(2, 'CSS', 10, 1),
(3, 'Javascript', 20, 1),
(4, 'Angular framework', 30, 1),
(5, 'Automated Tests', 20, 1),
(6, 'Work in groups', 5, 1),
(67, 'Work with Agile Methods', 5, 1),
(68, 'SQL Language', 30, 2),
(69, 'Microsoft SQL Server', 10, 2),
(70, 'Oracle', 50, 2),
(71, 'MySQL', 10, 2),
(80, 'asfasf', 60, 12),
(81, 'asfsaf', 40, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `competitors`
--

CREATE TABLE `competitors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `competitors`
--

INSERT INTO `competitors` (`id`, `name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'asfsafa', 'yshmeelwili@gmail.com', '+77470873314', '2023-06-03 06:19:47', '2023-06-03 06:19:47'),
(2, 'asfasf', 'oxotnik11.kz@mail.ru', '+77470873314', '2023-06-03 06:31:21', '2023-06-03 06:31:21');

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` int NOT NULL,
  `job` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `jobs`
--

INSERT INTO `jobs` (`id`, `job`) VALUES
(1, 'Web Designer'),
(2, 'Data Base Administrator'),
(12, 'sfasf');

-- --------------------------------------------------------

--
-- Структура таблицы `levels`
--

CREATE TABLE `levels` (
  `id` int NOT NULL,
  `level` varchar(8000) NOT NULL,
  `factor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `levels`
--

INSERT INTO `levels` (`id`, `level`, `factor`) VALUES
(1, 'No knowledge', '0.00'),
(2, 'Beginner ', '0.33'),
(3, 'Full', '0.66'),
(4, 'Expert ', '1.00');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_08_13_062101_create_applications_table', 1),
(3, '2022_08_13_062111_create_application_skills_table', 1),
(4, '2022_08_13_072010_add_application_skills_competence_foreign_key', 2),
(5, '2022_08_19_105024_create_competitors_table', 3),
(6, '2022_08_19_105205_delete_user_data_from_applications_table', 3),
(7, '2022_08_19_113404_add_competitor_id_int_foreign_key_field_to_applications_table', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `applications_job_id_foreign` (`job_id`),
  ADD KEY `applications_competitor_id_foreign` (`competitor_id`);

--
-- Индексы таблицы `application_skills`
--
ALTER TABLE `application_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_skills_application_id_foreign` (`application_id`),
  ADD KEY `application_skills_level_id_foreign` (`level_id`),
  ADD KEY `application_skills_competence_id_foreign` (`competence_id`);

--
-- Индексы таблицы `competences`
--
ALTER TABLE `competences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`);

--
-- Индексы таблицы `competitors`
--
ALTER TABLE `competitors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `application_skills`
--
ALTER TABLE `application_skills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT для таблицы `competences`
--
ALTER TABLE `competences`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT для таблицы `competitors`
--
ALTER TABLE `competitors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_competitor_id_foreign` FOREIGN KEY (`competitor_id`) REFERENCES `competitors` (`id`),
  ADD CONSTRAINT `applications_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `application_skills`
--
ALTER TABLE `application_skills`
  ADD CONSTRAINT `application_skills_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `application_skills_competence_id_foreign` FOREIGN KEY (`competence_id`) REFERENCES `competences` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `application_skills_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `competences`
--
ALTER TABLE `competences`
  ADD CONSTRAINT `competences_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
