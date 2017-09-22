/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.24 : Database - pf
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `demo`;

/*Table structure for table `sys_users` */

CREATE TABLE `sys_users` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(20) NOT NULL DEFAULT '',
  `nickname` char(20) DEFAULT '',
  `gender` smallint(1) DEFAULT NULL COMMENT '男;女',
  `age` int(3) DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login_time` timestamp NULL DEFAULT NULL,
  `ip` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8


CREATE TABLE `sys_roles` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role_name` char(20) NOT NULL DEFAULT '',
  `counts` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8


CREATE TABLE `sys_menus` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `parenthref` char(20) DEFAULT '',
  `childshref` char(50) DEFAULT '',
  `permission` char(50) DEFAULT '',
  `type` smallint(5) NOT NULL DEFAULT '0',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8


CREATE TABLE `sys_role_menu` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) DEFAULT NULL,
  `menus_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `sys_user_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL,
  `role_id` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8


CREATE TABLE `sys_loglogin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login_name` char(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userAgent` char(100) NOT NULL,
  `ip` char(20) NOT NULL,
  `status` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8


CREATE TABLE `sys_logaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` char(50) NOT NULL,
  `requestUrl` char(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
