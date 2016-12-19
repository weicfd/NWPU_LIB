# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.15)
# Database: library
# Generation Time: 2016-10-26 07:03:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table book_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_categories`;

CREATE TABLE `book_categories` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `book_categories` WRITE;
/*!40000 ALTER TABLE `book_categories` DISABLE KEYS */;

INSERT INTO `book_categories` (`id`, `category`)
VALUES
	(1,'computer'),
	(2,'mathematic'),
	(3,'literature');

/*!40000 ALTER TABLE `book_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table book_issue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_issue`;

CREATE TABLE `book_issue` (
  `issue_id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `available_status` tinyint(1) NOT NULL DEFAULT '1',
  `added_by` int(11) NOT NULL,
  `added_at_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table book_issue_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_issue_log`;

CREATE TABLE `book_issue_log` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `book_issue_id` int(6) unsigned zerofill NOT NULL,
  `student_id` int(11) NOT NULL,
  `issue_by` int(11) NOT NULL,
  `issued_at` varchar(50) NOT NULL,
  `return_time` varchar(50) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table books
# ------------------------------------------------------------

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) NOT NULL,
  `author` varchar(1000) NOT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `description` text,
  `category_id` int(5) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_at_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table branches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `branches`;

CREATE TABLE `branches` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `branch` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;

INSERT INTO `branches` (`id`, `branch`)
VALUES
	(1,'SE'),
	(2,'CS'),
	(3,'MEE');

/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_user_apis
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_user_apis`;

CREATE TABLE `cms_user_apis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_api_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_user_apis_user_id_unique` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`migration`, `batch`)
VALUES
	('2015_03_27_085526_create_user_main_apis_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table student_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_categories`;

CREATE TABLE `student_categories` (
  `cat_id` int(2) NOT NULL AUTO_INCREMENT,
  `category` varchar(512) NOT NULL,
  `max_allowed` int(1) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `student_categories` WRITE;
/*!40000 ALTER TABLE `student_categories` DISABLE KEYS */;

INSERT INTO `student_categories` (`cat_id`, `category`, `max_allowed`)
VALUES
	(1,'undergraduate',3),
	(2,'graduate',5),
	(3,'PHD',10);

/*!40000 ALTER TABLE `student_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table students
# ------------------------------------------------------------

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(512) NOT NULL,
  `last_name` varchar(512) NOT NULL,
  `approved` int(1) NOT NULL DEFAULT '0',
  `rejected` int(1) NOT NULL DEFAULT '0',
  `category` int(1) NOT NULL,
  `roll_num` int(10) unsigned zerofill NOT NULL,
  `branch` int(1) NOT NULL DEFAULT '0',
  `year` int(5) NOT NULL,
  `books_issued` int(1) NOT NULL DEFAULT '0',
  `email_id` varchar(512) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `roll_num` (`roll_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT 'anonymous',
  `username` varchar(512) NOT NULL,
  `password` varchar(255) NOT NULL,
  `verification_status` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
