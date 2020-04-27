/*
MySQL Backup
Database: eapi
Backup Time: 2020-04-27 11:10:57
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `eapi`.`failed_jobs`;
DROP TABLE IF EXISTS `eapi`.`migrations`;
DROP TABLE IF EXISTS `eapi`.`products`;
DROP TABLE IF EXISTS `eapi`.`reviews`;
DROP TABLE IF EXISTS `eapi`.`users`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `customer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `star` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
BEGIN;
LOCK TABLES `eapi`.`failed_jobs` WRITE;
DELETE FROM `eapi`.`failed_jobs`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `eapi`.`migrations` WRITE;
DELETE FROM `eapi`.`migrations`;
INSERT INTO `eapi`.`migrations` (`id`,`migration`,`batch`) VALUES (8, '2014_10_12_000000_create_users_table', 1),(9, '2019_08_19_000000_create_failed_jobs_table', 1),(10, '2020_04_27_140519_create_products_table', 1),(11, '2020_04_27_140801_create_reviews_table', 1);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `eapi`.`products` WRITE;
DELETE FROM `eapi`.`products`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `eapi`.`reviews` WRITE;
DELETE FROM `eapi`.`reviews`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `eapi`.`users` WRITE;
DELETE FROM `eapi`.`users`;
UNLOCK TABLES;
COMMIT;
