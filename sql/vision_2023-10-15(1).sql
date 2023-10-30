# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.31)
# Database: vision
# Generation Time: 2023-10-15 08:19:42 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table biz_academy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_academy`;

CREATE TABLE `biz_academy` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学院名称',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `school_id` bigint DEFAULT NULL COMMENT '学校ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学院';

LOCK TABLES `biz_academy` WRITE;
/*!40000 ALTER TABLE `biz_academy` DISABLE KEYS */;

INSERT INTO `biz_academy` (`id`, `name`, `description`, `school_id`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(1,'计算机学院','计院',1,'2022-04-11 16:14:15',NULL,NULL,NULL);

/*!40000 ALTER TABLE `biz_academy` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table biz_attendance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_attendance`;

CREATE TABLE `biz_attendance` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `academy_id` bigint DEFAULT NULL COMMENT '学院ID',
  `grade_id` bigint DEFAULT NULL COMMENT '年级ID',
  `major_id` bigint DEFAULT NULL COMMENT '专业ID',
  `class_id` bigint DEFAULT NULL COMMENT '班级ID',
  `course_id` bigint DEFAULT NULL COMMENT '课程ID',
  `teaching_record_id` bigint DEFAULT NULL COMMENT '教学记录ID',
  `classroom_id` bigint DEFAULT NULL COMMENT '教室ID',
  `desk_id` bigint DEFAULT NULL COMMENT '桌子ID',
  `student_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_teaching_student` (`teaching_record_id`,`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='考勤';

LOCK TABLES `biz_attendance` WRITE;
/*!40000 ALTER TABLE `biz_attendance` DISABLE KEYS */;

INSERT INTO `biz_attendance` (`id`, `academy_id`, `grade_id`, `major_id`, `class_id`, `course_id`, `teaching_record_id`, `classroom_id`, `desk_id`, `student_id`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(43,1,NULL,1,2,1,1,1,1,'zhangsan','2022-04-20 00:23:02',NULL,NULL,NULL),
	(45,1,NULL,1,2,1,1,1,1,'dalao','2022-04-20 01:26:49',NULL,NULL,NULL),
	(51,1,NULL,1,2,1,3,1,1,'zhangsan','2022-04-28 00:44:51',NULL,NULL,NULL),
	(54,1,NULL,1,2,1,4,1,1,'zhangsan','2022-04-28 01:01:56',NULL,NULL,NULL),
	(55,1,NULL,1,2,1,5,1,6,'zhangsan','2022-04-28 17:17:29',NULL,NULL,NULL),
	(58,1,NULL,1,2,1,5,1,6,'dalao','2022-04-28 17:18:11',NULL,NULL,NULL),
	(61,1,NULL,1,2,1,5,1,7,'xpy','2022-04-30 19:00:13',NULL,NULL,NULL),
	(95,3,NULL,2,3,3,6,1,6,'hehe','2022-05-01 14:19:41',NULL,NULL,NULL),
	(96,3,NULL,2,3,3,6,1,7,'liuliu','2022-05-01 14:21:56',NULL,NULL,NULL),
	(97,3,NULL,2,3,3,6,1,6,'lisi','2022-05-01 14:37:18',NULL,NULL,NULL),
	(100,1,NULL,1,2,1,8,1,6,'zhangsan','2022-05-01 15:14:59',NULL,NULL,NULL),
	(102,1,NULL,2,3,2,9,2,14,'hehe','2022-05-01 15:28:30',NULL,NULL,NULL),
	(105,1,NULL,1,2,1,10,1,6,'zhangsan','2022-05-04 22:42:33',NULL,NULL,NULL),
	(107,1,NULL,1,2,1,10,1,8,'lisi','2022-05-05 01:04:11',NULL,NULL,NULL),
	(109,1,NULL,1,2,1,10,1,7,'wangwu','2022-05-05 01:15:16',NULL,NULL,NULL);

/*!40000 ALTER TABLE `biz_attendance` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table biz_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_class`;

CREATE TABLE `biz_class` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班级名称',
  `major_id` bigint DEFAULT NULL COMMENT '专业ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='班级';

LOCK TABLES `biz_class` WRITE;
/*!40000 ALTER TABLE `biz_class` DISABLE KEYS */;

INSERT INTO `biz_class` (`id`, `name`, `major_id`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(2,'软件1班',1,'2022-04-11 16:35:38','2022-04-11 16:36:52',NULL,NULL),
	(3,'应用软件开发1班',2,'2022-05-01 13:37:44','2022-05-01 15:03:47',NULL,NULL);

/*!40000 ALTER TABLE `biz_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table biz_class_course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_class_course`;

CREATE TABLE `biz_class_course` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `class_id` bigint DEFAULT NULL COMMENT '班级ID',
  `course_id` bigint DEFAULT NULL COMMENT '课程ID',
  `classroom_id` bigint DEFAULT NULL COMMENT '教室ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='班级课程';



# Dump of table biz_classroom
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_classroom`;

CREATE TABLE `biz_classroom` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '教室名称',
  `no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '教室编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='教室';

LOCK TABLES `biz_classroom` WRITE;
/*!40000 ALTER TABLE `biz_classroom` DISABLE KEYS */;

INSERT INTO `biz_classroom` (`id`, `name`, `no`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(1,'科研教学楼-101室','1000','2022-04-11 16:37:38','2022-04-16 10:54:52',NULL,NULL),
	(2,'科研教学楼-102室','1001','2022-05-01 13:38:52','2022-05-01 15:04:17',NULL,NULL);

/*!40000 ALTER TABLE `biz_classroom` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table biz_course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_course`;

CREATE TABLE `biz_course` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课程名称',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `major_id` bigint DEFAULT NULL COMMENT '专业ID',
  `class_id` bigint DEFAULT NULL COMMENT '班级ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='课程';

LOCK TABLES `biz_course` WRITE;
/*!40000 ALTER TABLE `biz_course` DISABLE KEYS */;

INSERT INTO `biz_course` (`id`, `name`, `description`, `major_id`, `class_id`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(1,'汽车发动机实操','汽车发动机实操，带你见证发动机',1,2,'2022-04-15 01:56:56','2022-05-04 20:27:49',NULL,NULL),
	(2,'应用软件与开发课程','',2,3,'2022-05-01 13:42:00','2022-05-04 20:33:57',NULL,NULL);

/*!40000 ALTER TABLE `biz_course` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table biz_desk
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_desk`;

CREATE TABLE `biz_desk` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '桌子名称',
  `no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '桌子编号',
  `classroom_id` bigint DEFAULT NULL COMMENT '教室ID',
  `type` tinyint DEFAULT NULL COMMENT '桌子类型(1=老师,2=学生)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='桌子';

LOCK TABLES `biz_desk` WRITE;
/*!40000 ALTER TABLE `biz_desk` DISABLE KEYS */;

INSERT INTO `biz_desk` (`id`, `name`, `no`, `classroom_id`, `type`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(5,'教师桌','0000',1,1,'2022-04-28 16:39:47',NULL,NULL,NULL),
	(6,'学生桌001','001',1,2,'2022-04-28 16:40:12',NULL,NULL,NULL),
	(7,'学生桌002','002',1,2,'2022-04-28 16:59:26',NULL,NULL,NULL),
	(8,'学生桌003','003',1,2,'2022-04-28 23:22:42','2022-05-05 01:11:06',NULL,NULL),
	(9,'学生桌005','004',1,2,'2022-05-01 13:45:11','2022-05-05 00:58:59',NULL,NULL),
	(11,'教师桌','0001',2,1,'2022-05-01 14:46:51',NULL,NULL,NULL),
	(13,'学生桌06','006',2,2,'2022-05-01 14:47:26','2022-05-01 14:48:01',NULL,NULL),
	(14,'学生桌07','007',2,2,'2022-05-01 14:47:54','2022-05-01 14:48:06',NULL,NULL);

/*!40000 ALTER TABLE `biz_desk` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table biz_desk_device
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_desk_device`;

CREATE TABLE `biz_desk_device` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `classroom_id` bigint DEFAULT NULL COMMENT '教室ID',
  `desk_id` bigint DEFAULT NULL COMMENT '桌子ID',
  `device_id` bigint DEFAULT NULL COMMENT '设备ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='桌子设备';

LOCK TABLES `biz_desk_device` WRITE;
/*!40000 ALTER TABLE `biz_desk_device` DISABLE KEYS */;

INSERT INTO `biz_desk_device` (`id`, `classroom_id`, `desk_id`, `device_id`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(2,1,2,2,'2022-04-17 23:28:53',NULL,NULL,NULL),
	(3,1,3,3,'2022-04-18 23:53:03',NULL,NULL,NULL),
	(4,1,3,1,'2022-04-18 23:53:11',NULL,NULL,NULL),
	(5,1,1,1,'2022-04-18 23:53:44',NULL,NULL,NULL),
	(6,1,2,1,'2022-04-18 23:53:48',NULL,NULL,NULL),
	(7,1,1,4,'2022-04-18 23:55:01',NULL,NULL,NULL),
	(9,1,4,2,'2022-04-20 23:53:13',NULL,NULL,NULL),
	(10,1,4,1,'2022-04-20 23:53:24',NULL,NULL,NULL),
	(11,1,2,5,'2022-04-21 00:43:56',NULL,NULL,NULL),
	(12,1,1,NULL,'2022-04-27 15:02:03',NULL,NULL,NULL),
	(13,1,5,1,'2022-04-28 16:40:25',NULL,NULL,NULL),
	(14,1,5,3,'2022-04-28 16:40:28',NULL,NULL,NULL),
	(16,1,5,4,'2022-04-28 16:41:03',NULL,NULL,NULL),
	(17,1,6,1,'2022-04-28 16:41:14',NULL,NULL,NULL),
	(18,1,6,3,'2022-04-28 16:41:19',NULL,NULL,NULL),
	(19,1,7,1,'2022-04-28 16:59:31',NULL,NULL,NULL),
	(20,1,7,3,'2022-04-28 16:59:35',NULL,NULL,NULL),
	(21,1,8,1,'2022-04-28 23:22:48',NULL,NULL,NULL),
	(22,1,8,3,'2022-04-28 23:22:53',NULL,NULL,NULL),
	(23,2,13,3,'2022-05-01 15:34:40',NULL,NULL,NULL),
	(24,2,13,1,'2022-05-01 15:34:46',NULL,NULL,NULL),
	(25,2,14,1,'2022-05-01 15:34:51',NULL,NULL,NULL),
	(26,2,14,3,'2022-05-01 15:34:55',NULL,NULL,NULL),
	(27,2,11,3,'2022-05-01 15:35:05',NULL,NULL,NULL),
	(28,2,11,1,'2022-05-01 15:35:11',NULL,NULL,NULL),
	(29,2,11,4,'2022-05-01 15:35:17',NULL,NULL,NULL),
	(30,1,9,1,'2022-05-01 15:35:34',NULL,NULL,NULL),
	(31,1,9,3,'2022-05-01 15:35:42',NULL,NULL,NULL);

/*!40000 ALTER TABLE `biz_desk_device` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table biz_device
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_device`;

CREATE TABLE `biz_device` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备名称',
  `no` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备编号',
  `major_id` bigint DEFAULT NULL COMMENT '专业ID',
  `classroom_id` bigint DEFAULT NULL COMMENT '教室ID',
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备类型(face=人脸,scene=场景,360=全景)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP',
  `port` int DEFAULT NULL COMMENT '端口',
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='设备';

LOCK TABLES `biz_device` WRITE;
/*!40000 ALTER TABLE `biz_device` DISABLE KEYS */;

INSERT INTO `biz_device` (`id`, `name`, `no`, `major_id`, `classroom_id`, `type`, `ip`, `port`, `username`, `password`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(1,'人脸识别1-01','01',NULL,NULL,'face','192.168.31.222',37777,'admin','cdkuaimao123','2022-04-15 02:08:24','2022-04-28 20:43:11',NULL,NULL),
	(3,'乐橙LC-K3X','LC-K3X',NULL,NULL,'scene','192.168.31.203',37777,'admin','cdkuaimao123','2022-04-18 23:51:42','2022-04-28 20:43:01',NULL,NULL),
	(4,'半球机','DH-IPC',NULL,NULL,'360','192.168.31.37',37777,'admin','cdkuaimao123','2022-04-18 23:52:22','2022-04-28 20:42:47',NULL,NULL);

/*!40000 ALTER TABLE `biz_device` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table biz_grade
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_grade`;

CREATE TABLE `biz_grade` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年级名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='年级';

LOCK TABLES `biz_grade` WRITE;
/*!40000 ALTER TABLE `biz_grade` DISABLE KEYS */;

INSERT INTO `biz_grade` (`id`, `name`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(1,'2016级','2022-04-15 01:55:52',NULL,NULL,NULL),
	(2,'2017级','2022-04-15 01:55:58',NULL,NULL,NULL),
	(4,'2019级','2022-05-01 13:37:15',NULL,NULL,NULL);

/*!40000 ALTER TABLE `biz_grade` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table biz_major
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_major`;

CREATE TABLE `biz_major` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专业名称',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `academy_id` bigint DEFAULT NULL COMMENT '学院ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='专业';

LOCK TABLES `biz_major` WRITE;
/*!40000 ALTER TABLE `biz_major` DISABLE KEYS */;

INSERT INTO `biz_major` (`id`, `name`, `description`, `academy_id`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(1,'计算机软件','计算机软件，及软',1,'2022-04-11 16:31:47',NULL,NULL,NULL),
	(2,' 应用软件开发专业','',1,'2022-05-01 13:35:41','2022-05-01 15:03:01',NULL,NULL);

/*!40000 ALTER TABLE `biz_major` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table biz_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_member`;

CREATE TABLE `biz_member` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `identification_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证号',
  `birthday` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出生日期',
  `status` tinyint DEFAULT '1' COMMENT '状态',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像地址',
  `school_id` bigint DEFAULT NULL COMMENT '学校ID',
  `academy_id` bigint DEFAULT NULL COMMENT '学院ID',
  `major_id` bigint DEFAULT NULL COMMENT '专业ID',
  `grade_id` bigint DEFAULT NULL COMMENT '年级ID',
  `class_id` bigint DEFAULT NULL COMMENT '班级ID',
  `face_resource_id` bigint DEFAULT NULL COMMENT '人脸图片ID',
  `user_type` tinyint DEFAULT NULL COMMENT '用户类型 1=教师,2=学生',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';

LOCK TABLES `biz_member` WRITE;
/*!40000 ALTER TABLE `biz_member` DISABLE KEYS */;

INSERT INTO `biz_member` (`id`, `user_id`, `name`, `password`, `mobile`, `email`, `identification_number`, `birthday`, `status`, `avatar`, `school_id`, `academy_id`, `major_id`, `grade_id`, `class_id`, `face_resource_id`, `user_type`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(1,'zhangsan','张三','$2a$10$6F1wF0sxHEEvATw/mHffDuyrZU60Hp4BP2b9Ez.lvaXcMhzQGuR9S','135511222111',NULL,NULL,NULL,1,'http://localhost:8080/profile/upload/2022/04/26/WechatIMG1461_20220426235033A001.jpeg',1,1,1,4,2,NULL,2,'2022-04-11 23:22:49','2022-05-01 15:28:34',NULL,NULL),
	(2,'lili','丽丽老师','$2a$10$x1fgpnExpmDpPR2yERp31eZB4SnFIjFhp4I5Qmz6mWNDtyaVtBFRm','135244444111',NULL,NULL,NULL,1,NULL,1,1,1,4,2,NULL,1,'2022-04-15 02:34:40','2022-05-05 01:25:41',NULL,NULL),
	(5,'lisi','李四','$2a$10$h9.gAqqvzN39fNNW.WdNMuo5zDKm5KmlBjFugudyTwv6uXXPr/5b6',NULL,NULL,NULL,NULL,0,'http://localhost:8080/profile/upload/2022/05/02/大佬头像_20220502203153A003.jpeg',1,1,1,4,2,NULL,2,'2022-05-01 13:41:06','2022-05-05 01:04:08',NULL,NULL),
	(6,'fangfang','芳芳老师','$2a$10$Z0XOS.pbbLlHk6UhYXSDj.I5X25QCpWx2BhBoj6Hjw65.Ah91s5n2',NULL,NULL,NULL,NULL,0,NULL,1,1,2,4,3,NULL,1,'2022-05-01 14:14:48','2022-05-01 15:17:26',NULL,NULL),
	(7,'hehe',' 何何','$2a$10$56TbwwCJAz0axtY9pSv9vOuXjAbW3WWOD49pnoldsdXJCE3j3faLK',NULL,NULL,NULL,NULL,0,'http://localhost:8080/profile/upload/2022/05/02/头像呵呵_20220502202538A002.jpeg',1,1,2,4,3,NULL,2,'2022-05-01 14:18:22','2022-05-02 20:25:39',NULL,NULL),
	(8,'liuliu','刘刘','',NULL,NULL,NULL,NULL,0,NULL,1,1,2,4,3,NULL,2,'2022-05-01 14:19:10','2022-05-01 15:22:31',NULL,NULL),
	(9,'wangwu','王五','$2a$10$oP2kupB9FTD5yJV2qUbZouhPYrY6KljbKJWgFodPgAvzQy0/oEorO',NULL,NULL,NULL,NULL,0,NULL,1,1,1,4,2,NULL,2,'2022-05-05 01:09:37',NULL,NULL,NULL);

/*!40000 ALTER TABLE `biz_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table biz_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_resource`;

CREATE TABLE `biz_resource` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `biz_id` bigint DEFAULT NULL COMMENT '业务ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型，video=视频,image=图片,file=文件',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件位置',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源';

LOCK TABLES `biz_resource` WRITE;
/*!40000 ALTER TABLE `biz_resource` DISABLE KEYS */;

INSERT INTO `biz_resource` (`id`, `biz_id`, `name`, `type`, `url`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(2,1,'软件1班__2022_04_24_22_48_00_20220424224840A001.mp4','mp4','http://192.168.31.188:8080/profile/upload/2022/04/24/软件1班__2022_04_24_22_48_00_20220424224840A001.mp4','2022-04-24 22:48:41',NULL,NULL,NULL),
	(3,1,'软件1班_授课模式-老师画面00号桌_2022_04_25_22_53_51_20220425225434A001.mp4','mp4','http://192.168.31.189:8080/profile/upload/2022/04/25/软件1班_授课模式-老师画面00号桌_2022_04_25_22_53_51_20220425225434A001.mp4','2022-04-25 22:54:34',NULL,NULL,NULL),
	(4,5,'_对比展示_2022_04_28_17_34_21_20220428173548A001.mp4','mp4','http://192.168.124.38:8080/profile/upload/2022/04/28/_对比展示_2022_04_28_17_34_21_20220428173548A001.mp4','2022-04-28 17:35:49',NULL,NULL,NULL),
	(5,5,'软件1班_授课模式-老师画面教师桌_2022_04_28_17_59_04_20220428175927A002.mp4','mp4','http://192.168.124.38:8080/profile/upload/2022/04/28/软件1班_授课模式-老师画面教师桌_2022_04_28_17_59_04_20220428175927A002.mp4','2022-04-28 17:59:28',NULL,NULL,NULL),
	(6,6,'微积分1班_对比展示_2022_05_01_14_29_34_20220501142951A001.mp4','mp4','http://192.168.31.191:8080/profile/upload/2022/05/01/微积分1班_对比展示_2022_05_01_14_29_34_20220501142951A001.mp4','2022-05-01 14:29:51',NULL,NULL,NULL),
	(7,6,'微积分1班_对比展示_2022_05_01_14_31_57_20220501143212A002.mp4','mp4','http://192.168.31.191:8080/profile/upload/2022/05/01/微积分1班_对比展示_2022_05_01_14_31_57_20220501143212A002.mp4','2022-05-01 14:32:12',NULL,NULL,NULL),
	(8,6,'微积分1班_授课模式-老师画面教师桌_2022_05_01_14_38_33_20220501143843A003.mp4','mp4','http://192.168.31.191:8080/profile/upload/2022/05/01/微积分1班_授课模式-老师画面教师桌_2022_05_01_14_38_33_20220501143843A003.mp4','2022-05-01 14:38:44',NULL,NULL,NULL),
	(9,10,'软件1班_授课模式-老师画面(教师桌)_2022_05_05_01_38_06_20220505013822A001.mp4','mp4','http://192.168.31.191:8080/profile/upload/2022/05/05/软件1班_授课模式-老师画面(教师桌)_2022_05_05_01_38_06_20220505013822A001.mp4','2022-05-05 01:38:22',NULL,NULL,NULL);

/*!40000 ALTER TABLE `biz_resource` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table biz_school
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_school`;

CREATE TABLE `biz_school` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `has_academy` tinyint DEFAULT NULL COMMENT '是否有学院',
  `parent_id` bigint DEFAULT NULL COMMENT '父级ID',
  `child_school` tinyint DEFAULT NULL COMMENT '是否是分校',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学校';

LOCK TABLES `biz_school` WRITE;
/*!40000 ALTER TABLE `biz_school` DISABLE KEYS */;

INSERT INTO `biz_school` (`id`, `name`, `description`, `has_academy`, `parent_id`, `child_school`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(1,'大竹男子技工学校','大竹男子技工学校',1,NULL,0,'2022-04-11 12:55:28','2022-04-18 19:53:08',NULL,NULL);

/*!40000 ALTER TABLE `biz_school` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table biz_score
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_score`;

CREATE TABLE `biz_score` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `student_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `course_id` bigint DEFAULT NULL COMMENT '课程ID',
  `score` decimal(10,2) DEFAULT NULL COMMENT '分数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='成绩';



# Dump of table biz_teaching_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `biz_teaching_record`;

CREATE TABLE `biz_teaching_record` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `academy_id` bigint DEFAULT NULL COMMENT '学院ID',
  `major_id` bigint DEFAULT NULL COMMENT '专业ID',
  `grade_id` bigint DEFAULT NULL COMMENT '年级ID',
  `class_id` bigint DEFAULT NULL COMMENT '班级ID',
  `course_id` bigint DEFAULT NULL COMMENT '课程ID',
  `teacher_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '教师ID',
  `classroom_id` bigint DEFAULT NULL COMMENT '教室ID',
  `times` int DEFAULT NULL COMMENT '课次',
  `duration` int DEFAULT NULL COMMENT '课程秒数',
  `status` tinyint DEFAULT NULL COMMENT '状态，0=未开始,1=进行中,2=完成,3=取消',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='教学记录';

LOCK TABLES `biz_teaching_record` WRITE;
/*!40000 ALTER TABLE `biz_teaching_record` DISABLE KEYS */;

INSERT INTO `biz_teaching_record` (`id`, `name`, `academy_id`, `major_id`, `grade_id`, `class_id`, `course_id`, `teacher_id`, `classroom_id`, `times`, `duration`, `status`, `start_time`, `end_time`, `create_time`, `update_time`, `create_user_id`, `update_user_id`)
VALUES
	(1,'汽车发动机实操',1,1,1,2,1,'lili',1,1,1000,2,'2022-04-17 16:07:17','2022-04-27 23:43:27','2022-04-15 02:36:01','2022-04-27 23:43:27',NULL,NULL),
	(3,'汽车维修实战',1,1,1,2,1,'lili',1,1,1000,2,'2022-04-28 00:48:26','2022-04-28 00:54:48','2022-04-28 00:42:47','2022-04-28 00:54:48',NULL,NULL),
	(4,'挖掘机专家教学',1,1,1,2,1,'lili',1,1,0,2,'2022-04-28 01:02:07','2022-04-28 02:16:21','2022-04-28 00:57:12','2022-04-28 02:16:21',NULL,NULL),
	(5,'汽修实操1讲',1,1,2,2,1,'lili',1,1,1000,2,'2022-04-28 16:46:36','2022-05-01 01:01:26','2022-04-28 16:42:38','2022-05-01 01:01:26',NULL,NULL),
	(8,'计算机操作1课',1,1,4,2,1,'lili',1,1,0,2,'2022-05-01 15:19:22','2022-05-01 15:41:12','2022-05-01 15:09:10','2022-05-01 15:41:12',NULL,NULL),
	(9,'应用软件与开发1课',1,2,4,3,2,'fangfang',2,1,0,2,'2022-05-01 15:20:21','2022-05-01 15:41:00','2022-05-01 15:09:38','2022-05-01 15:41:00',NULL,NULL),
	(10,'测试搜索资源',1,1,4,2,1,'lili',1,1,0,2,'2022-05-03 00:36:58','2022-05-05 01:39:02','2022-05-03 00:36:51','2022-05-05 01:39:02',NULL,NULL);

/*!40000 ALTER TABLE `biz_teaching_record` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gen_table
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表';

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;

INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(41,'biz_academy','学院',NULL,NULL,'BizAcademy','crud','com.ruoyi.system','system','academy','学院','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(42,'biz_attendance','考勤',NULL,NULL,'BizAttendance','crud','com.ruoyi.system','system','attendance','考勤','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(43,'biz_class','班级',NULL,NULL,'BizClass','crud','com.ruoyi.system','system','class','班级','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(44,'biz_class_course','班级课程',NULL,NULL,'BizClassCourse','crud','com.ruoyi.system','system','course','班级课程','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(45,'biz_classroom','教室',NULL,NULL,'BizClassroom','crud','com.ruoyi.system','system','classroom','教室','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(46,'biz_course','课程',NULL,NULL,'BizCourse','crud','com.ruoyi.system','system','course','课程','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(47,'biz_desk','桌子',NULL,NULL,'BizDesk','crud','com.ruoyi.system','system','desk','桌子','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(48,'biz_desk_device','桌子设备',NULL,NULL,'BizDeskDevice','crud','com.ruoyi.system','system','device','桌子设备','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(49,'biz_device','设备',NULL,NULL,'BizDevice','crud','com.ruoyi.system','system','device','设备','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(50,'biz_grade','年级',NULL,NULL,'BizGrade','crud','com.ruoyi.system','system','grade','年级','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(51,'biz_major','专业',NULL,NULL,'BizMajor','crud','com.ruoyi.system','system','major','专业','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(52,'biz_member','用户',NULL,NULL,'BizMember','crud','com.ruoyi.system','system','member','用户','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(53,'biz_resource','资源',NULL,NULL,'BizResource','crud','com.ruoyi.system','system','resource','资源','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(54,'biz_school','学校',NULL,NULL,'BizSchool','crud','com.ruoyi.system','system','school','学校','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(55,'biz_score','成绩',NULL,NULL,'BizScore','crud','com.ruoyi.system','system','score','成绩','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL),
	(56,'biz_teaching_record','教学记录',NULL,NULL,'BizTeachingRecord','crud','com.ruoyi.system','system','record','教学记录','ruoyi','0','/',NULL,'admin','2022-04-13 00:09:40','',NULL,NULL);

/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gen_table_column
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表字段';

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;

INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES
	(352,'41','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-04-13 00:09:40','',NULL),
	(353,'41','name','学院名称','varchar(128)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-04-13 00:09:40','',NULL),
	(354,'41','description','描述','varchar(256)','String','description','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-04-13 00:09:40','',NULL),
	(355,'41','school_id','学校ID','bigint(20)','Long','schoolId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-04-13 00:09:40','',NULL),
	(356,'41','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2022-04-13 00:09:40','',NULL),
	(357,'41','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',6,'admin','2022-04-13 00:09:40','',NULL),
	(358,'41','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-04-13 00:09:40','',NULL),
	(359,'41','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-04-13 00:09:40','',NULL),
	(360,'42','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-04-13 00:09:40','',NULL),
	(361,'42','academy_id','学院ID','bigint(20)','Long','academyId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-04-13 00:09:40','',NULL),
	(362,'42','major_id','专业ID','bigint(20)','Long','majorId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-04-13 00:09:40','',NULL),
	(363,'42','class_id','班级ID','bigint(20)','Long','classId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-04-13 00:09:40','',NULL),
	(364,'42','course_id','课程ID','bigint(20)','Long','courseId','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2022-04-13 00:09:40','',NULL),
	(365,'42','teaching_record_id','教学记录ID','bigint(20)','Long','teachingRecordId','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2022-04-13 00:09:40','',NULL),
	(366,'42','classroom_id','教室ID','bigint(20)','Long','classroomId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-04-13 00:09:40','',NULL),
	(367,'42','desk_id','桌子ID','bigint(20)','Long','deskId','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-04-13 00:09:40','',NULL),
	(368,'42','student_id','学生ID','varchar(64)','String','studentId','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2022-04-13 00:09:40','',NULL),
	(369,'42','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',10,'admin','2022-04-13 00:09:40','',NULL),
	(370,'42','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',11,'admin','2022-04-13 00:09:40','',NULL),
	(371,'42','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',12,'admin','2022-04-13 00:09:40','',NULL),
	(372,'42','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',13,'admin','2022-04-13 00:09:40','',NULL),
	(373,'43','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-04-13 00:09:40','',NULL),
	(374,'43','name','班级名称','varchar(128)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-04-13 00:09:40','',NULL),
	(375,'43','major_id','专业ID','bigint(20)','Long','majorId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-04-13 00:09:40','',NULL),
	(376,'43','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2022-04-13 00:09:40','',NULL),
	(377,'43','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',5,'admin','2022-04-13 00:09:40','',NULL),
	(378,'43','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2022-04-13 00:09:40','',NULL),
	(379,'43','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-04-13 00:09:40','',NULL),
	(380,'44','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-04-13 00:09:40','',NULL),
	(381,'44','class_id','班级ID','bigint(20)','Long','classId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-04-13 00:09:40','',NULL),
	(382,'44','course_id','课程ID','bigint(20)','Long','courseId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-04-13 00:09:40','',NULL),
	(383,'44','classroom_id','教室ID','bigint(20)','Long','classroomId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-04-13 00:09:40','',NULL),
	(384,'44','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2022-04-13 00:09:40','',NULL),
	(385,'44','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',6,'admin','2022-04-13 00:09:40','',NULL),
	(386,'44','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-04-13 00:09:40','',NULL),
	(387,'44','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-04-13 00:09:40','',NULL),
	(388,'45','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input',NULL,1,'admin','2022-04-13 00:09:40',NULL,'2022-04-16 10:49:56'),
	(389,'45','name','教室名称','varchar(128)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-04-13 00:09:40',NULL,'2022-04-16 10:49:56'),
	(390,'45','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime',NULL,4,'admin','2022-04-13 00:09:40',NULL,'2022-04-16 10:49:56'),
	(391,'45','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime',NULL,5,'admin','2022-04-13 00:09:40',NULL,'2022-04-16 10:49:56'),
	(392,'45','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2022-04-13 00:09:40',NULL,'2022-04-16 10:49:56'),
	(393,'45','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-04-13 00:09:40',NULL,'2022-04-16 10:49:56'),
	(394,'46','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-04-13 00:09:40','',NULL),
	(395,'46','name','课程名称','varchar(128)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-04-13 00:09:40','',NULL),
	(396,'46','description','描述','varchar(256)','String','description','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-04-13 00:09:40','',NULL),
	(397,'46','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2022-04-13 00:09:40','',NULL),
	(398,'46','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',5,'admin','2022-04-13 00:09:40','',NULL),
	(399,'46','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2022-04-13 00:09:40','',NULL),
	(400,'46','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-04-13 00:09:40','',NULL),
	(401,'47','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-04-13 00:09:40','',NULL),
	(402,'47','name','桌子名称','varchar(128)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-04-13 00:09:40','',NULL),
	(403,'47','no','桌子编号','varchar(64)','String','no','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-04-13 00:09:40','',NULL),
	(404,'47','classroom_id','教室ID','bigint(20)','Long','classroomId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-04-13 00:09:40','',NULL),
	(405,'47','type','桌子类型(1=老师,2=学生)','tinyint(4)','Integer','type','0','0',NULL,'1','1','1','1','EQ','select','',5,'admin','2022-04-13 00:09:40','',NULL),
	(406,'47','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2022-04-13 00:09:40','',NULL),
	(407,'47','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',7,'admin','2022-04-13 00:09:40','',NULL),
	(408,'47','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-04-13 00:09:40','',NULL),
	(409,'47','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2022-04-13 00:09:40','',NULL),
	(410,'48','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input',NULL,1,'admin','2022-04-13 00:09:40',NULL,'2022-04-17 23:07:25'),
	(411,'48','classroom_id','教室ID','bigint(20)','Long','classroomId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-04-13 00:09:40',NULL,'2022-04-17 23:07:25'),
	(412,'48','desk_id','桌子ID','bigint(20)','Long','deskId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-04-13 00:09:40',NULL,'2022-04-17 23:07:25'),
	(413,'48','device_id','设备ID','bigint(20)','Long','deviceId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-04-13 00:09:40',NULL,'2022-04-17 23:07:25'),
	(414,'48','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime',NULL,5,'admin','2022-04-13 00:09:40',NULL,'2022-04-17 23:07:25'),
	(415,'48','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime',NULL,6,'admin','2022-04-13 00:09:40',NULL,'2022-04-17 23:07:25'),
	(416,'48','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-04-13 00:09:40',NULL,'2022-04-17 23:07:25'),
	(417,'48','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-04-13 00:09:40',NULL,'2022-04-17 23:07:25'),
	(418,'49','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input',NULL,1,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:34'),
	(419,'49','name','设备名称','varchar(128)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:34'),
	(420,'49','no','设备编号','varchar(128)','String','no','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:34'),
	(421,'49','major_id','专业ID','bigint(20)','Long','majorId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:34'),
	(422,'49','classroom_id','教室ID','bigint(20)','Long','classroomId','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:34'),
	(423,'49','type','设备类型(face=人脸,scene=场景,360=全景)','varchar(128)','String','type','0','0',NULL,'1','1','1','1','EQ','select','',6,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:34'),
	(424,'49','ip','IP','varchar(64)','String','ip','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:34'),
	(425,'49','port','端口','int(11)','Long','port','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:34'),
	(426,'49','username','账号','varchar(128)','String','username','0','0',NULL,'1','1','1','1','LIKE','input','',9,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:34'),
	(427,'49','password','密码','varchar(128)','String','password','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:34'),
	(428,'49','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime',NULL,11,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:34'),
	(429,'49','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime',NULL,12,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:35'),
	(430,'49','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',13,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:35'),
	(431,'49','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',14,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:22:35'),
	(432,'50','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-04-13 00:09:40','',NULL),
	(433,'50','name','年级名称','varchar(128)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-04-13 00:09:40','',NULL),
	(434,'50','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',3,'admin','2022-04-13 00:09:40','',NULL),
	(435,'50','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',4,'admin','2022-04-13 00:09:40','',NULL),
	(436,'50','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2022-04-13 00:09:40','',NULL),
	(437,'50','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2022-04-13 00:09:40','',NULL),
	(438,'51','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-04-13 00:09:40','',NULL),
	(439,'51','name','专业名称','varchar(128)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-04-13 00:09:40','',NULL),
	(440,'51','description','描述','varchar(256)','String','description','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-04-13 00:09:40','',NULL),
	(441,'51','academy_id','学院ID','bigint(20)','Long','academyId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-04-13 00:09:40','',NULL),
	(442,'51','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2022-04-13 00:09:40','',NULL),
	(443,'51','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',6,'admin','2022-04-13 00:09:40','',NULL),
	(444,'51','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-04-13 00:09:40','',NULL),
	(445,'51','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-04-13 00:09:40','',NULL),
	(446,'52','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input',NULL,1,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(447,'52','user_id','用户ID','varchar(64)','String','userId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(448,'52','name','名称','varchar(128)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',3,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(449,'52','password','密码','varchar(128)','String','password','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(450,'52','mobile','手机号','varchar(32)','String','mobile','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(451,'52','email','邮箱','varchar(64)','String','email','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(452,'52','status','状态','tinyint(4)','Integer','status','0','0',NULL,'1','1','1','1','EQ','radio','',9,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(453,'52','school_id','学校ID','bigint(20)','Long','schoolId','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(454,'52','academy_id','学院ID','bigint(20)','Long','academyId','0','0',NULL,'1','1','1','1','EQ','input','',12,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(455,'52','major_id','专业ID','bigint(20)','Long','majorId','0','0',NULL,'1','1','1','1','EQ','input','',13,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(456,'52','grade_id','年级ID','bigint(20)','Long','gradeId','0','0',NULL,'1','1','1','1','EQ','input','',14,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(457,'52','class_id','班级ID','bigint(20)','Long','classId','0','0',NULL,'1','1','1','1','EQ','input','',15,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(458,'52','face_resource_id','人脸图片ID','bigint(20)','Long','faceResourceId','0','0',NULL,'1','1','1','1','EQ','input','',16,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(459,'52','user_type','用户类型 1=教师,2=学生','tinyint(4)','Integer','userType','0','0',NULL,'1','1','1','1','EQ','select','',17,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(460,'52','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime',NULL,18,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(461,'52','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime',NULL,19,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(462,'52','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',20,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(463,'52','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',21,'admin','2022-04-13 00:09:40',NULL,'2022-04-26 00:47:49'),
	(464,'53','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-04-13 00:09:40','',NULL),
	(465,'53','name','名称','varchar(128)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-04-13 00:09:40','',NULL),
	(466,'53','type','类型，video=视频,image=图片,file=文件','varchar(64)','String','type','0','0',NULL,'1','1','1','1','EQ','select','',3,'admin','2022-04-13 00:09:40','',NULL),
	(467,'53','url','文件位置','varchar(128)','String','url','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-04-13 00:09:40','',NULL),
	(468,'53','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2022-04-13 00:09:40','',NULL),
	(469,'53','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',6,'admin','2022-04-13 00:09:40','',NULL),
	(470,'53','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-04-13 00:09:40','',NULL),
	(471,'53','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-04-13 00:09:40','',NULL),
	(472,'54','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-04-13 00:09:40','',NULL),
	(473,'54','name','名称','varchar(128)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-04-13 00:09:40','',NULL),
	(474,'54','description','描述','varchar(256)','String','description','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-04-13 00:09:40','',NULL),
	(475,'54','has_academy','是否有学院','tinyint(4)','Integer','hasAcademy','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-04-13 00:09:40','',NULL),
	(476,'54','parent_id','父级ID','bigint(20)','Long','parentId','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2022-04-13 00:09:40','',NULL),
	(477,'54','child_school','是否是分校','tinyint(4)','Integer','childSchool','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2022-04-13 00:09:40','',NULL),
	(478,'54','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2022-04-13 00:09:40','',NULL),
	(479,'54','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',8,'admin','2022-04-13 00:09:40','',NULL),
	(480,'54','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2022-04-13 00:09:40','',NULL),
	(481,'54','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2022-04-13 00:09:40','',NULL),
	(482,'55','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-04-13 00:09:40','',NULL),
	(483,'55','student_id','学生ID','varchar(64)','String','studentId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-04-13 00:09:40','',NULL),
	(484,'55','course_id','课程ID','bigint(20)','Long','courseId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-04-13 00:09:40','',NULL),
	(485,'55','score','分数','decimal(10,2)','BigDecimal','score','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-04-13 00:09:40','',NULL),
	(486,'55','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2022-04-13 00:09:40','',NULL),
	(487,'55','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',6,'admin','2022-04-13 00:09:40','',NULL),
	(488,'55','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-04-13 00:09:40','',NULL),
	(489,'55','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-04-13 00:09:40','',NULL),
	(490,'56','id','ID','bigint(11) unsigned','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input',NULL,1,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(491,'56','name','名称','varchar(128)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(492,'56','academy_id','学院ID','bigint(20)','Long','academyId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(493,'56','major_id','专业ID','bigint(20)','Long','majorId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(494,'56','grade_id','年级ID','bigint(20)','Long','gradeId','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(495,'56','class_id','班级ID','bigint(20)','Long','classId','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(496,'56','course_id','课程ID','bigint(20)','Long','courseId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(497,'56','times','课次','int(11)','Long','times','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(498,'56','duration','课程秒数','int(11)','Long','duration','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(499,'56','status','状态，0=未开始,1=进行中,2=完成,3=取消','tinyint(4)','Integer','status','0','0',NULL,'1','1','1','1','EQ','radio','',11,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(500,'56','start_time','开始时间','datetime','Date','startTime','0','0',NULL,'1','1','1','1','EQ','datetime','',12,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(501,'56','end_time','结束时间','datetime','Date','endTime','0','0',NULL,'1','1','1','1','EQ','datetime','',13,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(502,'56','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime',NULL,14,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(503,'56','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime',NULL,15,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(504,'56','create_user_id','创建人','varchar(64)','String','createUserId','0','0',NULL,'1','1','1','1','EQ','input','',16,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(505,'56','update_user_id','更新人','varchar(64)','String','updateUserId','0','0',NULL,'1','1','1','1','EQ','input','',17,'admin','2022-04-13 00:09:40',NULL,'2022-04-15 01:21:50'),
	(506,'56','teacher_id','教师ID','bigint(20)','Long','teacherId','0','0',NULL,'1','1','1','1','EQ','input','',8,'','2022-04-15 01:21:50','',NULL),
	(507,'45','no','教室编号','varchar(64)','String','no','0','0',NULL,'1','1','1','1','EQ','input','',3,'','2022-04-16 10:49:56','',NULL),
	(508,'52','identification_number','身份证号','varchar(64)','String','identificationNumber','0','0',NULL,'1','1','1','1','EQ','input','',7,'','2022-04-26 00:47:49','',NULL),
	(509,'52','birthday','出生日期','varchar(32)','String','birthday','0','0',NULL,'1','1','1','1','EQ','input','',8,'','2022-04-26 00:47:49','',NULL),
	(510,'52','avatar','头像地址','varchar(256)','String','avatar','0','0',NULL,'1','1','1','1','EQ','input','',10,'','2022-04-26 00:47:49','',NULL);

/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table QRTZ_BLOB_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;

CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Blob类型的触发器表';



# Dump of table QRTZ_CALENDARS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;

CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='日历信息表';



# Dump of table QRTZ_CRON_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;

CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Cron类型的触发器表';

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;

INSERT INTO `QRTZ_CRON_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`)
VALUES
	('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),
	('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','0/15 * * * * ?','Asia/Shanghai'),
	('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','0/20 * * * * ?','Asia/Shanghai');

/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table QRTZ_FIRED_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;

CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='已触发的触发器表';



# Dump of table QRTZ_JOB_DETAILS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;

CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='任务详细信息表';

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;

INSERT INTO `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`)
VALUES
	('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT',NULL,'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution','0','1','0','0','');

/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table QRTZ_LOCKS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_LOCKS`;

CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='存储的悲观锁信息表';

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;

INSERT INTO `QRTZ_LOCKS` (`sched_name`, `lock_name`)
VALUES
	('RuoyiScheduler','STATE_ACCESS'),
	('RuoyiScheduler','TRIGGER_ACCESS');

/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table QRTZ_PAUSED_TRIGGER_GRPS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;

CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='暂停的触发器表';



# Dump of table QRTZ_SCHEDULER_STATE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;

CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='调度器状态表';

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;

INSERT INTO `QRTZ_SCHEDULER_STATE` (`sched_name`, `instance_name`, `last_checkin_time`, `checkin_interval`)
VALUES
	('RuoyiScheduler','C02YG7Z3JG5H1649683113370',1649734114261,15000);

/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table QRTZ_SIMPLE_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='简单触发器的信息表';



# Dump of table QRTZ_SIMPROP_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='同步机制的行锁表';



# Dump of table QRTZ_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;

CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='触发器详细信息表';

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;

INSERT INTO `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`)
VALUES
	('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','TASK_CLASS_NAME1','DEFAULT',NULL,1649683120000,-1,5,'PAUSED','CRON',1649683113000,0,NULL,2,''),
	('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','TASK_CLASS_NAME2','DEFAULT',NULL,1649683125000,-1,5,'PAUSED','CRON',1649683113000,0,NULL,2,''),
	('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','TASK_CLASS_NAME3','DEFAULT',NULL,1649683120000,-1,5,'PAUSED','CRON',1649683113000,0,NULL,2,'');

/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数配置表';

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;

INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2022-04-10 15:13:51','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
	(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2022-04-10 15:13:51','',NULL,'初始化密码 123456'),
	(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2022-04-10 15:13:51','',NULL,'深色主题theme-dark，浅色主题theme-light'),
	(4,'账号自助-验证码开关','sys.account.captchaOnOff','true','Y','admin','2022-04-10 15:13:51','',NULL,'是否开启验证码功能（true开启，false关闭）'),
	(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2022-04-10 15:13:51','',NULL,'是否开启注册用户功能（true开启，false关闭）'),
	(6,'客户端标题','slogan.title','视易控·Vision Easy！','N','admin','2022-04-30 18:37:46','admin','2022-04-30 18:37:51',NULL),
	(7,'客户端子标题','slogan.subtitle','让教学更高效！','N','admin','2022-04-30 18:38:24','',NULL,NULL);

/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;

INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES
	(100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2022-04-10 15:13:48','',NULL),
	(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-04-10 15:13:48','',NULL),
	(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-04-10 15:13:48','',NULL),
	(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-04-10 15:13:48','',NULL),
	(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-04-10 15:13:48','',NULL),
	(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2022-04-10 15:13:48','',NULL),
	(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2022-04-10 15:13:48','',NULL),
	(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2022-04-10 15:13:48','',NULL),
	(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-04-10 15:13:48','',NULL),
	(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-04-10 15:13:48','',NULL);

/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dict_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典数据表';

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;

INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,1,'男','0','sys_user_sex','','','Y','0','admin','2022-04-10 15:13:51','',NULL,'性别男'),
	(2,2,'女','1','sys_user_sex','','','N','0','admin','2022-04-10 15:13:51','',NULL,'性别女'),
	(3,3,'未知','2','sys_user_sex','','','N','0','admin','2022-04-10 15:13:51','',NULL,'性别未知'),
	(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2022-04-10 15:13:51','',NULL,'显示菜单'),
	(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2022-04-10 15:13:51','',NULL,'隐藏菜单'),
	(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2022-04-10 15:13:51','',NULL,'正常状态'),
	(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2022-04-10 15:13:51','',NULL,'停用状态'),
	(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2022-04-10 15:13:51','',NULL,'正常状态'),
	(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2022-04-10 15:13:51','',NULL,'停用状态'),
	(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2022-04-10 15:13:51','',NULL,'默认分组'),
	(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2022-04-10 15:13:51','',NULL,'系统分组'),
	(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2022-04-10 15:13:51','',NULL,'系统默认是'),
	(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2022-04-10 15:13:51','',NULL,'系统默认否'),
	(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2022-04-10 15:13:51','',NULL,'通知'),
	(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2022-04-10 15:13:51','',NULL,'公告'),
	(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2022-04-10 15:13:51','',NULL,'正常状态'),
	(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2022-04-10 15:13:51','',NULL,'关闭状态'),
	(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2022-04-10 15:13:51','',NULL,'新增操作'),
	(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2022-04-10 15:13:51','',NULL,'修改操作'),
	(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2022-04-10 15:13:51','',NULL,'删除操作'),
	(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2022-04-10 15:13:51','',NULL,'授权操作'),
	(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2022-04-10 15:13:51','',NULL,'导出操作'),
	(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2022-04-10 15:13:51','',NULL,'导入操作'),
	(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2022-04-10 15:13:51','',NULL,'强退操作'),
	(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2022-04-10 15:13:51','',NULL,'生成操作'),
	(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2022-04-10 15:13:51','',NULL,'清空操作'),
	(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2022-04-10 15:13:51','',NULL,'正常状态'),
	(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2022-04-10 15:13:51','',NULL,'停用状态');

/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dict_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典类型表';

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;

INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'用户性别','sys_user_sex','0','admin','2022-04-10 15:13:51','',NULL,'用户性别列表'),
	(2,'菜单状态','sys_show_hide','0','admin','2022-04-10 15:13:51','',NULL,'菜单状态列表'),
	(3,'系统开关','sys_normal_disable','0','admin','2022-04-10 15:13:51','',NULL,'系统开关列表'),
	(4,'任务状态','sys_job_status','0','admin','2022-04-10 15:13:51','',NULL,'任务状态列表'),
	(5,'任务分组','sys_job_group','0','admin','2022-04-10 15:13:51','',NULL,'任务分组列表'),
	(6,'系统是否','sys_yes_no','0','admin','2022-04-10 15:13:51','',NULL,'系统是否列表'),
	(7,'通知类型','sys_notice_type','0','admin','2022-04-10 15:13:51','',NULL,'通知类型列表'),
	(8,'通知状态','sys_notice_status','0','admin','2022-04-10 15:13:51','',NULL,'通知状态列表'),
	(9,'操作类型','sys_oper_type','0','admin','2022-04-10 15:13:51','',NULL,'操作类型列表'),
	(10,'系统状态','sys_common_status','0','admin','2022-04-10 15:13:51','',NULL,'登录状态列表');

/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度表';

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;

INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2022-04-10 15:13:51','',NULL,''),
	(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2022-04-10 15:13:51','',NULL,''),
	(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2022-04-10 15:13:51','',NULL,'');

/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_job_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度日志表';



# Dump of table sys_logininfor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统访问记录';

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;

INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`)
VALUES
	(100,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-10 15:33:29'),
	(101,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-10 17:20:01'),
	(102,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-10 19:47:55'),
	(103,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-10 20:35:46'),
	(104,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-10 22:16:21'),
	(105,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-11 11:36:15'),
	(106,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-11 12:34:52'),
	(107,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-11 16:12:48'),
	(108,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-11 20:06:46'),
	(109,NULL,'127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：NONE_PROVIDED 不存在','2022-04-11 20:11:07'),
	(110,NULL,'127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：NONE_PROVIDED 不存在','2022-04-11 20:11:25'),
	(111,NULL,'127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：NONE_PROVIDED 不存在','2022-04-11 20:11:49'),
	(112,NULL,'127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：NONE_PROVIDED 不存在','2022-04-11 20:17:41'),
	(113,NULL,'127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：NONE_PROVIDED 不存在','2022-04-11 21:05:01'),
	(114,'112','127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：112 不存在','2022-04-11 21:23:59'),
	(115,'112','127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：112 不存在','2022-04-11 21:26:46'),
	(116,'112','127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：112 不存在','2022-04-11 21:55:46'),
	(117,'112','127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：112 不存在','2022-04-11 21:57:00'),
	(118,'112','127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：112 不存在','2022-04-11 22:57:41'),
	(119,'112','127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：112 不存在','2022-04-11 23:11:20'),
	(120,'112','127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：112 不存在','2022-04-11 23:15:45'),
	(121,'112','127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：112 不存在','2022-04-11 23:18:19'),
	(122,'112','127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：112 不存在','2022-04-11 23:19:20'),
	(123,'112','127.0.0.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-11 23:19:45'),
	(124,'112','127.0.0.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-11 23:19:54'),
	(125,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-11 23:22:12'),
	(126,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-11 23:22:59'),
	(127,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-11 23:24:47'),
	(128,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-11 23:24:58'),
	(129,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-11 23:25:38'),
	(130,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2022-04-11 23:28:19'),
	(131,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2022-04-11 23:31:47'),
	(132,'admin','127.0.0.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-12 15:47:17'),
	(133,'admin','127.0.0.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-12 15:47:21'),
	(134,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-12 15:47:25'),
	(135,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2022-04-12 15:47:28'),
	(136,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-13 00:08:19'),
	(137,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:00:27'),
	(138,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:01:58'),
	(139,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:24:40'),
	(140,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:26:37'),
	(141,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:30:33'),
	(142,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:33:59'),
	(143,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:37:13'),
	(144,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:38:32'),
	(145,'1111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:40:04'),
	(146,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:42:49'),
	(147,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:02'),
	(148,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:04'),
	(149,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:06'),
	(150,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:08'),
	(151,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:09'),
	(152,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:10'),
	(153,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:10'),
	(154,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:10'),
	(155,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:11'),
	(156,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:11'),
	(157,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:11'),
	(158,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:13'),
	(159,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:13'),
	(160,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:13'),
	(161,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:14'),
	(162,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:14'),
	(163,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:14'),
	(164,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:15'),
	(165,'111','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:15'),
	(166,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-13 23:43:26'),
	(167,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-13 23:43:29'),
	(168,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-13 23:44:26'),
	(169,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-13 23:44:45'),
	(170,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-13 23:45:35'),
	(171,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-13 23:46:32'),
	(172,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-13 23:49:15'),
	(173,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-13 23:51:17'),
	(174,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 00:53:03'),
	(175,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 00:53:03'),
	(176,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 00:53:03'),
	(177,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 00:53:04'),
	(178,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 00:53:06'),
	(179,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 00:53:10'),
	(180,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 00:55:16'),
	(181,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 00:55:20'),
	(182,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 00:55:29'),
	(183,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 01:00:23'),
	(184,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 01:00:25'),
	(185,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 01:00:26'),
	(186,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 01:00:27'),
	(187,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 01:00:28'),
	(188,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 01:00:28'),
	(189,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 01:00:29'),
	(190,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 01:00:31'),
	(191,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 01:00:32'),
	(192,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 01:00:33'),
	(193,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-14 01:00:34'),
	(194,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:00:40'),
	(195,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:01:51'),
	(196,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:03:55'),
	(197,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:06:08'),
	(198,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:14:16'),
	(199,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:19:08'),
	(200,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:28:00'),
	(201,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:29:12'),
	(202,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:33:02'),
	(203,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:35:20'),
	(204,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:38:33'),
	(205,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:40:13'),
	(206,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:45:23'),
	(207,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-14 01:51:56'),
	(208,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-15 01:21:29'),
	(209,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-15 01:54:53'),
	(210,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-15 02:36:30'),
	(211,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-15 02:36:37'),
	(212,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-15 02:36:56'),
	(213,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-15 02:38:57'),
	(214,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-15 02:40:14'),
	(215,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-15 02:41:30'),
	(216,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-15 02:42:49'),
	(217,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-15 02:43:35'),
	(218,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-15 02:45:14'),
	(219,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-15 23:41:31'),
	(220,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-16 01:48:16'),
	(221,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 01:54:37'),
	(222,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-16 10:48:46'),
	(223,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-16 11:15:17'),
	(224,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 11:15:21'),
	(225,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 11:16:52'),
	(226,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 18:40:59'),
	(227,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 18:42:11'),
	(228,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 18:54:39'),
	(229,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 19:06:08'),
	(230,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-16 22:46:28'),
	(231,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 23:31:30'),
	(232,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 23:33:23'),
	(233,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 23:38:47'),
	(234,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 23:40:22'),
	(235,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 23:42:05'),
	(236,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 23:44:17'),
	(237,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 23:45:22'),
	(238,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 23:48:47'),
	(239,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-16 23:59:56'),
	(240,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-17 00:01:09'),
	(241,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 00:01:13'),
	(242,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 00:06:14'),
	(243,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 00:45:00'),
	(244,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 00:46:28'),
	(245,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 00:47:26'),
	(246,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 00:48:59'),
	(247,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-17 00:49:27'),
	(248,'lili','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-17 00:52:02'),
	(249,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 00:52:06'),
	(250,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 01:22:15'),
	(251,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 01:22:21'),
	(252,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 01:23:54'),
	(253,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 01:24:11'),
	(254,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 01:25:08'),
	(255,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 01:26:52'),
	(256,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 01:28:52'),
	(257,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 01:30:29'),
	(258,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 01:32:00'),
	(259,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 01:51:00'),
	(260,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 01:56:36'),
	(261,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 16:06:49'),
	(262,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 16:09:36'),
	(263,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 16:50:11'),
	(264,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 16:52:21'),
	(265,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 16:53:40'),
	(266,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 17:00:00'),
	(267,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 20:14:43'),
	(268,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-17 20:22:49'),
	(269,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 20:37:19'),
	(270,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-17 21:13:06'),
	(271,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 22:39:51'),
	(272,'lili','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-17 22:43:44'),
	(273,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 22:43:47'),
	(274,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-17 22:44:32'),
	(275,'lili','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-17 22:46:37'),
	(276,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 22:46:39'),
	(277,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 22:49:20'),
	(278,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 23:30:03'),
	(279,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 23:39:36'),
	(280,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-17 23:44:12'),
	(281,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-18 12:33:05'),
	(282,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','验证码已失效','2022-04-18 12:33:05'),
	(283,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-18 19:16:52'),
	(284,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-18 23:44:45'),
	(285,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 00:33:15'),
	(286,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 00:37:24'),
	(287,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 00:46:17'),
	(288,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 00:53:56'),
	(289,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 00:54:04'),
	(290,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 00:57:30'),
	(291,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 01:03:01'),
	(292,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 01:13:01'),
	(293,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 01:33:58'),
	(294,'lili','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 01:34:32'),
	(295,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 23:38:19'),
	(296,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 23:38:29'),
	(297,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 23:39:33'),
	(298,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 23:39:41'),
	(299,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 23:41:45'),
	(300,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 23:42:08'),
	(301,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 23:43:52'),
	(302,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 23:44:09'),
	(303,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 23:54:30'),
	(304,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 23:56:01'),
	(305,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 23:56:14'),
	(306,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-19 23:58:17'),
	(307,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 00:00:58'),
	(308,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 00:03:29'),
	(309,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 00:05:13'),
	(310,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 00:06:41'),
	(311,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 00:10:10'),
	(312,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 00:11:32'),
	(313,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 00:18:47'),
	(314,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 00:23:02'),
	(315,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 00:23:23'),
	(316,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-20 01:23:17'),
	(317,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 01:24:11'),
	(318,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 01:24:27'),
	(319,'dalao','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-20 01:25:13'),
	(320,'dalao','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 01:26:49'),
	(321,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 01:33:35'),
	(322,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 01:33:45'),
	(323,'dalao','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 01:34:01'),
	(324,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:12:10'),
	(325,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:12:26'),
	(326,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:18:00'),
	(327,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:18:23'),
	(328,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:21:46'),
	(329,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:23:55'),
	(330,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:29:00'),
	(331,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:29:11'),
	(332,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:32:11'),
	(333,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:32:29'),
	(334,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:40:16'),
	(335,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:40:34'),
	(336,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:44:12'),
	(337,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-20 23:50:37'),
	(338,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:54:11'),
	(339,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-20 23:54:29'),
	(340,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-21 00:20:36'),
	(341,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-21 00:28:38'),
	(342,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-21 00:33:24'),
	(343,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-21 00:39:41'),
	(344,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-22 01:25:52'),
	(345,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-22 01:29:26'),
	(346,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-22 01:32:19'),
	(347,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-22 01:35:54'),
	(348,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-22 01:46:40'),
	(349,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-22 01:51:34'),
	(350,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-22 01:55:53'),
	(351,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-22 02:09:01'),
	(352,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-24 22:20:07'),
	(353,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-24 22:24:50'),
	(354,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-24 22:25:28'),
	(355,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-24 22:38:34'),
	(356,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-24 22:40:36'),
	(357,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-24 22:47:47'),
	(358,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-24 23:02:04'),
	(359,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-24 23:10:23'),
	(360,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-24 23:16:57'),
	(361,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-24 23:19:33'),
	(362,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-25 22:53:07'),
	(363,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-25 22:53:32'),
	(364,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-25 22:58:43'),
	(365,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-25 23:11:49'),
	(366,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-26 00:08:49'),
	(367,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-26 00:09:55'),
	(368,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-26 00:15:39'),
	(369,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-26 00:16:22'),
	(370,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-26 00:43:22'),
	(371,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-26 20:10:55'),
	(372,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-26 22:35:35'),
	(373,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-26 23:36:38'),
	(374,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-26 23:37:44'),
	(375,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-27 00:21:49'),
	(376,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:34:22'),
	(377,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:34:24'),
	(378,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:34:25'),
	(379,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:37:14'),
	(380,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:38:00'),
	(381,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:39:14'),
	(382,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:40:45'),
	(383,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:43:17'),
	(384,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-27 00:43:21'),
	(385,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:43:53'),
	(386,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:43:55'),
	(387,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:44:00'),
	(388,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:44:11'),
	(389,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:48:15'),
	(390,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-27 00:48:17'),
	(391,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:48:27'),
	(392,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:48:28'),
	(393,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:48:29'),
	(394,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:48:39'),
	(395,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-27 00:51:00'),
	(396,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-27 00:53:27'),
	(397,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:53:35'),
	(398,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:53:37'),
	(399,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:53:44'),
	(400,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:56:35'),
	(401,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-27 00:59:15'),
	(402,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:59:22'),
	(403,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 00:59:29'),
	(404,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-27 12:44:33'),
	(405,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-27 15:36:17'),
	(406,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-27 21:56:27'),
	(407,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 23:05:25'),
	(408,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 23:05:30'),
	(409,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 23:05:33'),
	(410,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 23:05:35'),
	(411,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 23:05:40'),
	(412,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 23:05:45'),
	(413,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-27 23:06:01'),
	(414,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-27 23:06:29'),
	(415,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-27 23:11:14'),
	(416,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-27 23:13:55'),
	(417,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-27 23:32:05'),
	(418,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-27 23:32:10'),
	(419,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-27 23:34:16'),
	(420,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-27 23:41:47'),
	(421,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-27 23:42:14'),
	(422,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:00:18'),
	(423,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:00:24'),
	(424,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:00:27'),
	(425,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:00:46'),
	(426,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-28 00:01:03'),
	(427,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 00:01:45'),
	(428,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:01:48'),
	(429,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:02:11'),
	(430,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:02:19'),
	(431,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:02:22'),
	(432,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:02:59'),
	(433,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:03:35'),
	(434,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:04:50'),
	(435,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:05:28'),
	(436,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:07:35'),
	(437,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:14:17'),
	(438,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:32:03'),
	(439,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:34:15'),
	(440,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:41:10'),
	(441,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-28 00:42:09'),
	(442,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:44:50'),
	(443,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:45:41'),
	(444,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:48:05'),
	(445,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:52:57'),
	(446,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 00:56:25'),
	(447,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:01:33'),
	(448,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:01:55'),
	(449,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:09:30'),
	(450,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:10:03'),
	(451,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:17:21'),
	(452,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:17:39'),
	(453,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 01:25:50'),
	(454,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:25:55'),
	(455,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:30:19'),
	(456,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:34:56'),
	(457,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:39:26'),
	(458,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:40:17'),
	(459,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:42:53'),
	(460,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:45:36'),
	(461,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:49:26'),
	(462,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 01:57:03'),
	(463,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 02:00:17'),
	(464,'zhangsan','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 02:01:57'),
	(465,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 02:05:39'),
	(466,'lili','192.168.31.206','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 02:15:16'),
	(467,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-28 16:33:41'),
	(468,'lili','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 16:46:11'),
	(469,'lili','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 16:52:23'),
	(470,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 16:56:23'),
	(471,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 16:56:31'),
	(472,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 16:56:36'),
	(473,'lili','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 16:57:52'),
	(474,'dalao','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:01:27'),
	(475,'dalao','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:01:29'),
	(476,'dalao','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:02:30'),
	(477,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:03:08'),
	(478,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:03:34'),
	(479,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:03:36'),
	(480,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:03:39'),
	(481,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:03:40'),
	(482,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:03:40'),
	(483,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:04:25'),
	(484,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:04:49'),
	(485,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:05:13'),
	(486,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:05:15'),
	(487,'dalao','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:06:23'),
	(488,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:11:40'),
	(489,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:15:06'),
	(490,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:16:41'),
	(491,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:16:47'),
	(492,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:16:57'),
	(493,'dalao','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:17:11'),
	(494,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:17:19'),
	(495,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:17:29'),
	(496,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:17:41'),
	(497,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:18:03'),
	(498,'dalao','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:18:10'),
	(499,'dalao','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:18:59'),
	(500,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:19:00'),
	(501,'dalao','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:19:50'),
	(502,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:20:48'),
	(503,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:21:30'),
	(504,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:22:39'),
	(505,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:22:43'),
	(506,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:22:50'),
	(507,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:22:58'),
	(508,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:23:01'),
	(509,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:23:04'),
	(510,'lili','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:23:31'),
	(511,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:25:17'),
	(512,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:26:09'),
	(513,'dalao','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:31:01'),
	(514,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:31:54'),
	(515,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:32:00'),
	(516,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:32:06'),
	(517,'lili','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:32:14'),
	(518,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:32:32'),
	(519,'dalao','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:43:44'),
	(520,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:44:01'),
	(521,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:44:06'),
	(522,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:44:36'),
	(523,'zhangsan','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:44:37'),
	(524,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:44:39'),
	(525,'lili','192.168.124.2','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 17:44:49'),
	(526,'lili','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 17:45:28'),
	(527,'lili','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 18:01:53'),
	(528,'dalao','192.168.124.2','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 18:02:45'),
	(529,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-28 20:37:35'),
	(530,'lili','192.168.31.210','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 21:00:45'),
	(531,'lili','192.168.31.210','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 21:02:16'),
	(532,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 21:02:20'),
	(533,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 21:09:52'),
	(534,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 21:16:48'),
	(535,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 21:26:42'),
	(536,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 21:27:29'),
	(537,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 21:36:44'),
	(538,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 21:48:44'),
	(539,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 21:55:08'),
	(540,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 21:58:52'),
	(541,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 22:17:10'),
	(542,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 22:22:26'),
	(543,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 23:00:18'),
	(544,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 23:07:38'),
	(545,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 23:11:25'),
	(546,'lili','192.168.31.210','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-28 23:19:46'),
	(547,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 23:19:50'),
	(548,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-28 23:22:17'),
	(549,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 23:35:15'),
	(550,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-28 23:44:54'),
	(551,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-29 00:14:39'),
	(552,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-29 00:15:43'),
	(553,'lili','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-29 00:30:16'),
	(554,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-29 00:33:10'),
	(555,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-29 00:41:28'),
	(556,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-29 00:42:19'),
	(557,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-29 00:43:22'),
	(558,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-29 00:48:17'),
	(559,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-29 00:51:53'),
	(560,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-29 01:16:01'),
	(561,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-29 01:31:04'),
	(562,'lili','192.168.31.210','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-04-29 01:40:11'),
	(563,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-29 01:40:14'),
	(564,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 00:44:27'),
	(565,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 00:44:54'),
	(566,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 00:50:08'),
	(567,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 01:05:41'),
	(568,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 11:50:05'),
	(569,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 11:50:59'),
	(570,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 11:56:34'),
	(571,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 11:56:43'),
	(572,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 17:20:11'),
	(573,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-30 18:21:57'),
	(574,'xpy','192.168.31.105','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 19:00:12'),
	(575,'xpy','192.168.31.105','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 19:23:13'),
	(576,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 23:11:42'),
	(577,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-30 23:13:21'),
	(578,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 23:14:04'),
	(579,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 23:15:18'),
	(580,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 23:29:48'),
	(581,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 23:38:02'),
	(582,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 23:39:16'),
	(583,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 23:51:04'),
	(584,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 23:54:11'),
	(585,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-04-30 23:54:53'),
	(586,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:06:31'),
	(587,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:17:38'),
	(588,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:22:55'),
	(589,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:27:09'),
	(590,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:33:11'),
	(591,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:34:05'),
	(592,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:34:44'),
	(593,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:35:20'),
	(594,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 00:35:40'),
	(595,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:36:01'),
	(596,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:36:36'),
	(597,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:38:31'),
	(598,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:38:51'),
	(599,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:39:42'),
	(600,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:41:56'),
	(601,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:45:39'),
	(602,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:45:50'),
	(603,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:47:58'),
	(604,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:48:18'),
	(605,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:49:55'),
	(606,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:50:10'),
	(607,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:55:04'),
	(608,'xpy','192.168.31.105','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:55:12'),
	(609,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 00:56:24'),
	(610,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-01 13:29:13'),
	(611,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 13:31:17'),
	(612,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 13:32:27'),
	(613,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 13:42:14'),
	(614,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 13:42:56'),
	(615,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 13:46:46'),
	(616,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 13:47:45'),
	(617,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 13:54:47'),
	(618,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 13:56:01'),
	(619,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 13:56:50'),
	(620,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 14:04:42'),
	(621,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 14:06:31'),
	(622,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 14:09:24'),
	(623,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 14:10:08'),
	(624,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 14:10:19'),
	(625,'fangfang','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 14:15:56'),
	(626,'hehe','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 14:19:40'),
	(627,'liuliu','192.168.31.105','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 14:21:55'),
	(628,'lisi','192.168.31.156','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 14:36:41'),
	(629,'lisi','192.168.31.156','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 14:36:56'),
	(630,'lisi','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 14:37:18'),
	(631,'hehe','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 14:38:07'),
	(632,'hehe','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 14:40:38'),
	(633,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-01 14:44:41'),
	(634,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 15:00:04'),
	(635,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:10:27'),
	(636,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:10:33'),
	(637,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:10:41'),
	(638,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:11:02'),
	(639,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:11:29'),
	(640,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:12:24'),
	(641,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 15:14:59'),
	(642,'lili','192.168.31.210','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:16:53'),
	(643,'lili','192.168.31.210','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:16:58'),
	(644,'lili','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 15:19:12'),
	(645,'fangfang','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 15:20:12'),
	(646,'zhangsan','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 15:20:36'),
	(647,'hehe','192.168.31.105','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:21:42'),
	(648,'hehe','192.168.31.105','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:21:52'),
	(649,'hehe','192.168.31.105','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:22:01'),
	(650,'hehe','192.168.31.105','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:22:25'),
	(651,'hehe','192.168.31.105','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:22:42'),
	(652,'hehe','192.168.31.105','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:23:05'),
	(653,'hehe','192.168.31.105','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:23:08'),
	(654,'hehe','192.168.31.105','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-01 15:27:39'),
	(655,'hehe','192.168.31.105','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 15:28:29'),
	(656,'fangfang','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 15:33:01'),
	(657,'hehe','192.168.31.105','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 15:33:24'),
	(658,'hehe','192.168.31.105','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 15:36:09'),
	(659,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 15:51:13'),
	(660,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 15:53:43'),
	(661,'zhangsan','192.168.31.210','内网IP','Unknown','Unknown','0','登录成功','2022-05-01 15:54:56'),
	(662,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-02 20:17:05'),
	(663,'zhangsan','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-02 23:44:17'),
	(664,'zhangsan','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-03 00:00:05'),
	(665,'zhangsan','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-03 00:04:50'),
	(666,'zhangsan','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-03 00:12:50'),
	(667,'zhangsan','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-03 00:24:25'),
	(668,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-03 00:35:14'),
	(669,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-03 00:35:57'),
	(670,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-03 00:40:20'),
	(671,'lili','192.168.31.211','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-04 18:37:51'),
	(672,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 18:37:54'),
	(673,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 18:40:28'),
	(674,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 18:46:09'),
	(675,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 18:46:49'),
	(676,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 18:52:41'),
	(677,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 18:56:08'),
	(678,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 19:02:03'),
	(679,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-04 19:03:33'),
	(680,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 20:17:39'),
	(681,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 20:35:34'),
	(682,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 21:03:59'),
	(683,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 21:36:23'),
	(684,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 21:44:46'),
	(685,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 21:46:07'),
	(686,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 21:51:37'),
	(687,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 22:00:02'),
	(688,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 22:04:23'),
	(689,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 22:06:44'),
	(690,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 22:13:47'),
	(691,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 22:20:03'),
	(692,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 22:25:14'),
	(693,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 22:32:52'),
	(694,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 22:34:59'),
	(695,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 22:36:05'),
	(696,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-04 22:37:34'),
	(697,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 00:03:24'),
	(698,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 00:14:49'),
	(699,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 00:44:07'),
	(700,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 00:46:28'),
	(701,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 00:55:18'),
	(702,'zhangsan','192.168.31.105','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 00:55:45'),
	(703,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 01:01:02'),
	(704,'lisi','192.168.31.156','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-05 01:03:44'),
	(705,'lisi','192.168.31.156','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-05 01:03:50'),
	(706,'lisi','192.168.31.156','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-05 01:03:54'),
	(707,'lisi','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 01:04:11'),
	(708,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 01:10:04'),
	(709,'zhangsan','192.168.31.105','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 01:14:47'),
	(710,'wangwu','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 01:15:16'),
	(711,'lili','192.168.31.211','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2022-05-05 01:22:29'),
	(712,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 01:22:31'),
	(713,'wangwu','192.168.31.156','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 01:24:58'),
	(714,'lili','192.168.31.211','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 01:25:46'),
	(715,'zhangsan','192.168.31.105','内网IP','Unknown','Unknown','0','登录成功','2022-05-05 01:32:02');

/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单权限表';

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2022-04-10 15:13:50','',NULL,'系统管理目录'),
	(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','1','0','','monitor','admin','2022-04-10 15:13:51','admin','2022-04-27 13:01:20','系统监控目录'),
	(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','1','0','','tool','admin','2022-04-10 15:13:51','admin','2022-04-27 13:01:29','系统工具目录'),
	(4,'机构管理',0,3,'organization',NULL,'',1,0,'M','0','0','','tree-table','admin','2022-04-10 15:13:51','admin','2022-04-27 13:03:34','机构管理目录'),
	(5,'人员管理',0,3,'member',NULL,'',1,0,'M','0','0','','peoples','admin','2022-04-10 15:13:51','admin','2022-04-27 13:03:45','人员管理目录'),
	(6,'课程管理',0,3,'course',NULL,'',1,0,'M','0','0','','education','admin','2022-04-10 15:13:51','admin','2022-04-27 13:04:17','课程管理目录'),
	(7,'教学管理',0,3,'teaching',NULL,'',1,0,'M','0','0','','international','admin','2022-04-10 15:13:51','admin','2022-04-27 13:04:42','课程管理目录'),
	(8,'成绩管理',0,3,'score',NULL,'',1,0,'M','1','0','','code','admin','2022-04-10 15:13:51','admin','2022-04-27 13:05:05','课程管理目录'),
	(9,'资源管理',0,3,'resource',NULL,'',1,0,'M','0','0','','pdf','admin','2022-04-10 15:13:51','admin','2022-04-27 13:05:16','课程管理目录'),
	(10,'设备管理',0,3,'device',NULL,'',1,0,'M','0','0','','table','admin','2022-04-10 15:13:51','admin','2022-04-27 13:05:47','课程管理目录'),
	(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2022-04-10 15:13:51','',NULL,'用户管理菜单'),
	(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2022-04-10 15:13:51','',NULL,'角色管理菜单'),
	(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2022-04-10 15:13:51','',NULL,'菜单管理菜单'),
	(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2022-04-10 15:13:51','',NULL,'部门管理菜单'),
	(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2022-04-10 15:13:51','',NULL,'岗位管理菜单'),
	(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2022-04-10 15:13:51','',NULL,'字典管理菜单'),
	(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2022-04-10 15:13:51','',NULL,'参数设置菜单'),
	(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2022-04-10 15:13:51','',NULL,'通知公告菜单'),
	(108,'日志管理',1,9,'log','','',1,0,'M','1','0','','log','admin','2022-04-10 15:13:51','admin','2022-04-27 13:01:10','日志管理菜单'),
	(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2022-04-10 15:13:51','',NULL,'在线用户菜单'),
	(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2022-04-10 15:13:51','',NULL,'定时任务菜单'),
	(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2022-04-10 15:13:51','',NULL,'数据监控菜单'),
	(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2022-04-10 15:13:51','',NULL,'服务监控菜单'),
	(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2022-04-10 15:13:51','',NULL,'缓存监控菜单'),
	(114,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2022-04-10 15:13:51','',NULL,'表单构建菜单'),
	(115,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2022-04-10 15:13:51','',NULL,'代码生成菜单'),
	(116,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2022-04-10 15:13:51','',NULL,'系统接口菜单'),
	(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2022-04-10 15:13:51','',NULL,'操作日志菜单'),
	(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2022-04-10 15:13:51','',NULL,'登录日志菜单'),
	(1001,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1002,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1003,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1004,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1005,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1006,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1007,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1008,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1009,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1010,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1011,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1012,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1013,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1014,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1015,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1016,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1017,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1018,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1019,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1020,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1021,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1022,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1023,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1024,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1025,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1026,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1027,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1028,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1029,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1030,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1031,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1032,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1033,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1034,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1035,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1036,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1037,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1038,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1039,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1040,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1041,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1042,'日志导出',500,4,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1043,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1044,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1045,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1054,'任务导出',110,7,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1055,'生成查询',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1056,'生成修改',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1057,'生成删除',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1058,'导入代码',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1059,'预览代码',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2022-04-10 15:13:51','',NULL,''),
	(1060,'生成代码',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2022-04-10 15:13:51','',NULL,''),
	(2000,'用户',5,1,'member','system/member/index',NULL,1,0,'C','0','0','system:member:list','#','admin','2022-04-10 21:16:23','admin','2022-04-10 22:53:16','用户菜单'),
	(2001,'用户查询',2000,1,'#','',NULL,1,0,'F','0','0','system:member:query','#','admin','2022-04-10 21:16:23','',NULL,''),
	(2002,'用户新增',2000,2,'#','',NULL,1,0,'F','0','0','system:member:add','#','admin','2022-04-10 21:16:23','',NULL,''),
	(2003,'用户修改',2000,3,'#','',NULL,1,0,'F','0','0','system:member:edit','#','admin','2022-04-10 21:16:23','',NULL,''),
	(2004,'用户删除',2000,4,'#','',NULL,1,0,'F','0','0','system:member:remove','#','admin','2022-04-10 21:16:23','',NULL,''),
	(2005,'用户导出',2000,5,'#','',NULL,1,0,'F','0','0','system:member:export','#','admin','2022-04-10 21:16:23','',NULL,''),
	(2006,'学院',4,2,'academy','system/academy/index',NULL,1,0,'C','0','0','system:academy:list','#','admin','2022-04-10 21:29:03','admin','2022-04-11 16:15:56','学院菜单'),
	(2007,'学院查询',2006,1,'#','',NULL,1,0,'F','0','0','system:academy:query','#','admin','2022-04-10 21:29:03','',NULL,''),
	(2008,'学院新增',2006,2,'#','',NULL,1,0,'F','0','0','system:academy:add','#','admin','2022-04-10 21:29:03','',NULL,''),
	(2009,'学院修改',2006,3,'#','',NULL,1,0,'F','0','0','system:academy:edit','#','admin','2022-04-10 21:29:03','',NULL,''),
	(2010,'学院删除',2006,4,'#','',NULL,1,0,'F','0','0','system:academy:remove','#','admin','2022-04-10 21:29:03','',NULL,''),
	(2011,'学院导出',2006,5,'#','',NULL,1,0,'F','0','0','system:academy:export','#','admin','2022-04-10 21:29:03','',NULL,''),
	(2013,'考勤',7,1,'attendance','system/attendance/index',NULL,1,0,'C','0','0','system:attendance:list','#','admin','2022-04-10 21:30:46','admin','2022-04-10 22:53:33','考勤菜单'),
	(2014,'考勤查询',2013,1,'#','',NULL,1,0,'F','0','0','system:attendance:query','#','admin','2022-04-10 21:30:46','',NULL,''),
	(2015,'考勤新增',2013,2,'#','',NULL,1,0,'F','0','0','system:attendance:add','#','admin','2022-04-10 21:30:46','',NULL,''),
	(2016,'考勤修改',2013,3,'#','',NULL,1,0,'F','0','0','system:attendance:edit','#','admin','2022-04-10 21:30:46','',NULL,''),
	(2017,'考勤删除',2013,4,'#','',NULL,1,0,'F','0','0','system:attendance:remove','#','admin','2022-04-10 21:30:46','',NULL,''),
	(2018,'考勤导出',2013,5,'#','',NULL,1,0,'F','0','0','system:attendance:export','#','admin','2022-04-10 21:30:46','',NULL,''),
	(2019,'班级',4,5,'class','system/class/index',NULL,1,0,'C','0','0','system:class:list','#','admin','2022-04-10 21:32:01','admin','2022-04-11 16:16:15','班级菜单'),
	(2020,'班级查询',2019,1,'#','',NULL,1,0,'F','0','0','system:class:query','#','admin','2022-04-10 21:32:01','',NULL,''),
	(2021,'班级新增',2019,2,'#','',NULL,1,0,'F','0','0','system:class:add','#','admin','2022-04-10 21:32:01','',NULL,''),
	(2022,'班级修改',2019,3,'#','',NULL,1,0,'F','0','0','system:class:edit','#','admin','2022-04-10 21:32:01','',NULL,''),
	(2023,'班级删除',2019,4,'#','',NULL,1,0,'F','0','0','system:class:remove','#','admin','2022-04-10 21:32:01','',NULL,''),
	(2024,'班级导出',2019,5,'#','',NULL,1,0,'F','0','0','system:class:export','#','admin','2022-04-10 21:32:01','',NULL,''),
	(2025,'教室',4,6,'classroom','system/classroom/index',NULL,1,0,'C','0','0','system:classroom:list','#','admin','2022-04-10 21:32:12','admin','2022-04-11 16:16:22','教室菜单'),
	(2026,'教室查询',2025,1,'#','',NULL,1,0,'F','0','0','system:classroom:query','#','admin','2022-04-10 21:32:12','',NULL,''),
	(2027,'教室新增',2025,2,'#','',NULL,1,0,'F','0','0','system:classroom:add','#','admin','2022-04-10 21:32:12','',NULL,''),
	(2028,'教室修改',2025,3,'#','',NULL,1,0,'F','0','0','system:classroom:edit','#','admin','2022-04-10 21:32:12','',NULL,''),
	(2029,'教室删除',2025,4,'#','',NULL,1,0,'F','0','0','system:classroom:remove','#','admin','2022-04-10 21:32:12','',NULL,''),
	(2030,'教室导出',2025,5,'#','',NULL,1,0,'F','0','0','system:classroom:export','#','admin','2022-04-10 21:32:12','',NULL,''),
	(2031,'班级课程',7,1,'classCourse','system/classCourse/index',NULL,1,0,'C','1','0','system:course:list','#','admin','2022-04-10 21:32:21','admin','2022-04-27 13:33:46','班级课程菜单'),
	(2032,'班级课程查询',2031,1,'#','',NULL,1,0,'F','0','0','system:course:query','#','admin','2022-04-10 21:32:21','',NULL,''),
	(2033,'班级课程新增',2031,2,'#','',NULL,1,0,'F','0','0','system:course:add','#','admin','2022-04-10 21:32:21','',NULL,''),
	(2034,'班级课程修改',2031,3,'#','',NULL,1,0,'F','0','0','system:course:edit','#','admin','2022-04-10 21:32:21','',NULL,''),
	(2035,'班级课程删除',2031,4,'#','',NULL,1,0,'F','0','0','system:course:remove','#','admin','2022-04-10 21:32:21','',NULL,''),
	(2036,'班级课程导出',2031,5,'#','',NULL,1,0,'F','0','0','system:course:export','#','admin','2022-04-10 21:32:21','',NULL,''),
	(2037,'设备',10,1,'device','system/device/index',NULL,1,0,'C','0','0','system:device:list','#','admin','2022-04-10 21:32:32','admin','2022-04-13 00:20:16','设备菜单'),
	(2038,'设备查询',2037,1,'#','',NULL,1,0,'F','0','0','system:device:query','#','admin','2022-04-10 21:32:32','',NULL,''),
	(2039,'设备新增',2037,2,'#','',NULL,1,0,'F','0','0','system:device:add','#','admin','2022-04-10 21:32:32','',NULL,''),
	(2040,'设备修改',2037,3,'#','',NULL,1,0,'F','0','0','system:device:edit','#','admin','2022-04-10 21:32:32','',NULL,''),
	(2041,'设备删除',2037,4,'#','',NULL,1,0,'F','0','0','system:device:remove','#','admin','2022-04-10 21:32:32','',NULL,''),
	(2042,'设备导出',2037,5,'#','',NULL,1,0,'F','0','0','system:device:export','#','admin','2022-04-10 21:32:32','',NULL,''),
	(2043,'专业',4,3,'major','system/major/index',NULL,1,0,'C','0','0','system:major:list','#','admin','2022-04-10 21:32:40','admin','2022-04-11 16:16:05','专业菜单'),
	(2044,'专业查询',2043,1,'#','',NULL,1,0,'F','0','0','system:major:query','#','admin','2022-04-10 21:32:40','',NULL,''),
	(2045,'专业新增',2043,2,'#','',NULL,1,0,'F','0','0','system:major:add','#','admin','2022-04-10 21:32:40','',NULL,''),
	(2046,'专业修改',2043,3,'#','',NULL,1,0,'F','0','0','system:major:edit','#','admin','2022-04-10 21:32:40','',NULL,''),
	(2047,'专业删除',2043,4,'#','',NULL,1,0,'F','0','0','system:major:remove','#','admin','2022-04-10 21:32:40','',NULL,''),
	(2048,'专业导出',2043,5,'#','',NULL,1,0,'F','0','0','system:major:export','#','admin','2022-04-10 21:32:40','',NULL,''),
	(2049,'教学记录',7,1,'teachingRecord','system/teachingRecord/index',NULL,1,0,'C','0','0','system:record:list','#','admin','2022-04-10 21:32:51','admin','2022-04-10 22:52:48','教学记录菜单'),
	(2050,'教学记录查询',2049,1,'#','',NULL,1,0,'F','0','0','system:record:query','#','admin','2022-04-10 21:32:51','',NULL,''),
	(2051,'教学记录新增',2049,2,'#','',NULL,1,0,'F','0','0','system:record:add','#','admin','2022-04-10 21:32:51','',NULL,''),
	(2052,'教学记录修改',2049,3,'#','',NULL,1,0,'F','0','0','system:record:edit','#','admin','2022-04-10 21:32:51','',NULL,''),
	(2053,'教学记录删除',2049,4,'#','',NULL,1,0,'F','0','0','system:record:remove','#','admin','2022-04-10 21:32:51','',NULL,''),
	(2054,'教学记录导出',2049,5,'#','',NULL,1,0,'F','0','0','system:record:export','#','admin','2022-04-10 21:32:51','',NULL,''),
	(2055,'文件',9,1,'resource','system/resource/index',NULL,1,0,'C','0','0','system:resource:list','#','admin','2022-04-10 21:33:18','admin','2022-04-15 02:18:01','资源菜单'),
	(2056,'资源查询',2055,1,'#','',NULL,1,0,'F','0','0','system:resource:query','#','admin','2022-04-10 21:33:18','',NULL,''),
	(2057,'资源新增',2055,2,'#','',NULL,1,0,'F','0','0','system:resource:add','#','admin','2022-04-10 21:33:18','',NULL,''),
	(2058,'资源修改',2055,3,'#','',NULL,1,0,'F','0','0','system:resource:edit','#','admin','2022-04-10 21:33:18','',NULL,''),
	(2059,'资源删除',2055,4,'#','',NULL,1,0,'F','0','0','system:resource:remove','#','admin','2022-04-10 21:33:18','',NULL,''),
	(2060,'资源导出',2055,5,'#','',NULL,1,0,'F','0','0','system:resource:export','#','admin','2022-04-10 21:33:18','',NULL,''),
	(2061,'学校',4,1,'school','system/school/index',NULL,1,0,'C','0','0','system:school:list','#','admin','2022-04-10 21:33:28','admin','2022-04-11 16:16:29','学校菜单'),
	(2062,'学校查询',2061,1,'#','',NULL,1,0,'F','0','0','system:school:query','#','admin','2022-04-10 21:33:28','',NULL,''),
	(2063,'学校新增',2061,2,'#','',NULL,1,0,'F','0','0','system:school:add','#','admin','2022-04-10 21:33:29','',NULL,''),
	(2064,'学校修改',2061,3,'#','',NULL,1,0,'F','0','0','system:school:edit','#','admin','2022-04-10 21:33:29','',NULL,''),
	(2065,'学校删除',2061,4,'#','',NULL,1,0,'F','0','0','system:school:remove','#','admin','2022-04-10 21:33:29','',NULL,''),
	(2066,'学校导出',2061,5,'#','',NULL,1,0,'F','0','0','system:school:export','#','admin','2022-04-10 21:33:29','',NULL,''),
	(2067,'成绩',8,1,'score','system/score/index',NULL,1,0,'C','0','0','system:score:list','#','admin','2022-04-10 21:33:36','admin','2022-04-10 22:53:09','成绩菜单'),
	(2068,'成绩查询',2067,1,'#','',NULL,1,0,'F','0','0','system:score:query','#','admin','2022-04-10 21:33:36','',NULL,''),
	(2069,'成绩新增',2067,2,'#','',NULL,1,0,'F','0','0','system:score:add','#','admin','2022-04-10 21:33:36','',NULL,''),
	(2070,'成绩修改',2067,3,'#','',NULL,1,0,'F','0','0','system:score:edit','#','admin','2022-04-10 21:33:36','',NULL,''),
	(2071,'成绩删除',2067,4,'#','',NULL,1,0,'F','0','0','system:score:remove','#','admin','2022-04-10 21:33:36','',NULL,''),
	(2072,'成绩导出',2067,5,'#','',NULL,1,0,'F','0','0','system:score:export','#','admin','2022-04-10 21:33:36','',NULL,''),
	(2073,'课程',6,1,'course','system/course/index',NULL,1,0,'C','0','0','system:course:list','#','admin','2022-04-10 21:32:21','admin','2022-04-10 22:58:08','班级课程菜单'),
	(2074,'年级',4,4,'grade','system/grade/index',NULL,1,0,'C','0','0','system:grade:list','#','admin','2022-04-13 00:17:06','admin','2022-04-13 00:18:56','年级菜单'),
	(2075,'年级查询',2074,1,'#','',NULL,1,0,'F','0','0','system:grade:query','#','admin','2022-04-13 00:17:06','',NULL,''),
	(2076,'年级新增',2074,2,'#','',NULL,1,0,'F','0','0','system:grade:add','#','admin','2022-04-13 00:17:06','',NULL,''),
	(2077,'年级修改',2074,3,'#','',NULL,1,0,'F','0','0','system:grade:edit','#','admin','2022-04-13 00:17:06','',NULL,''),
	(2078,'年级删除',2074,4,'#','',NULL,1,0,'F','0','0','system:grade:remove','#','admin','2022-04-13 00:17:06','',NULL,''),
	(2079,'年级导出',2074,5,'#','',NULL,1,0,'F','0','0','system:grade:export','#','admin','2022-04-13 00:17:06','',NULL,''),
	(2080,'桌子',10,2,'desk','system/desk/index',NULL,1,0,'C','0','0','system:desk:list','#','admin','2022-04-13 00:19:36','admin','2022-04-13 00:20:13','桌子菜单'),
	(2081,'桌子查询',2080,1,'#','',NULL,1,0,'F','0','0','system:desk:query','#','admin','2022-04-13 00:19:36','',NULL,''),
	(2082,'桌子新增',2080,2,'#','',NULL,1,0,'F','0','0','system:desk:add','#','admin','2022-04-13 00:19:36','',NULL,''),
	(2083,'桌子修改',2080,3,'#','',NULL,1,0,'F','0','0','system:desk:edit','#','admin','2022-04-13 00:19:36','',NULL,''),
	(2084,'桌子删除',2080,4,'#','',NULL,1,0,'F','0','0','system:desk:remove','#','admin','2022-04-13 00:19:36','',NULL,''),
	(2085,'桌子导出',2080,5,'#','',NULL,1,0,'F','0','0','system:desk:export','#','admin','2022-04-13 00:19:36','',NULL,'');

/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_notice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='通知公告表';

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;

INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'温馨提醒：请大家上课认真听讲，不能松懈！','2',X'E696B0E78988E69CACE58685E5AEB9','0','admin','2022-04-10 15:13:51','admin','2022-04-30 18:39:17','管理员'),
	(2,'维护通知：2018-07-01 若依系统凌晨维护','1',X'E7BBB4E68AA4E58685E5AEB9','0','admin','2022-04-10 15:13:51','',NULL,'管理员');

/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_oper_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志记录';

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;

INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`)
VALUES
	(100,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','biz_major,biz_academy,biz_school','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 19:48:16'),
	(101,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','biz_device,biz_classroom,biz_class_course,biz_course,biz_resource,biz_teaching_record,biz_attendance,biz_score,biz_user,biz_class','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 19:48:28'),
	(102,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-10 20:39:10'),
	(103,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/1,2,3,4,5,6,7,8,9,10,11,12,13','127.0.0.1','内网IP','{tableIds=1,2,3,4,5,6,7,8,9,10,11,12,13}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 20:43:21'),
	(104,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','biz_user,biz_teaching_record,biz_score,biz_school,biz_resource,biz_class_course,biz_major,biz_device,biz_course,biz_classroom,biz_class,biz_attendance,biz_academy','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 20:43:52'),
	(105,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-10 20:44:04'),
	(106,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/26','127.0.0.1','内网IP','{tableIds=26}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 20:53:49'),
	(107,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','biz_member','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 20:53:53'),
	(108,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-10 20:54:03'),
	(109,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/14,15,16,17,18,19,20,21,22,23','127.0.0.1','内网IP','{tableIds=14,15,16,17,18,19,20,21,22,23}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:24:11'),
	(110,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/24,25,27','127.0.0.1','内网IP','{tableIds=24,25,27}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:24:14'),
	(111,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','biz_member,biz_teaching_record,biz_score,biz_school,biz_resource,biz_class_course,biz_major,biz_device,biz_course,biz_classroom,biz_class,biz_attendance,biz_academy','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:24:31'),
	(112,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-10 22:24:42'),
	(113,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"教学记录\",\"params\":{},\"parentId\":7,\"isCache\":\"0\",\"path\":\"teachingRecord\",\"component\":\"system/teachingRecord/index\",\"children\":[],\"createTime\":1649597571000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2049,\"menuType\":\"C\",\"perms\":\"system:record:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:52:48'),
	(114,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"资源\",\"params\":{},\"parentId\":9,\"isCache\":\"0\",\"path\":\"resource\",\"component\":\"system/resource/index\",\"children\":[],\"createTime\":1649597598000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2055,\"menuType\":\"C\",\"perms\":\"system:resource:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:52:55'),
	(115,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"学校\",\"params\":{},\"parentId\":4,\"isCache\":\"0\",\"path\":\"school\",\"component\":\"system/school/index\",\"children\":[],\"createTime\":1649597608000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2061,\"menuType\":\"C\",\"perms\":\"system:school:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:53:03'),
	(116,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"成绩\",\"params\":{},\"parentId\":8,\"isCache\":\"0\",\"path\":\"score\",\"component\":\"system/score/index\",\"children\":[],\"createTime\":1649597616000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2067,\"menuType\":\"C\",\"perms\":\"system:score:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:53:09'),
	(117,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"用户\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"member\",\"component\":\"system/member/index\",\"children\":[],\"createTime\":1649596583000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:member:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:53:16'),
	(118,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"学院\",\"params\":{},\"parentId\":4,\"isCache\":\"0\",\"path\":\"academy\",\"component\":\"system/academy/index\",\"children\":[],\"createTime\":1649597343000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"C\",\"perms\":\"system:academy:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:53:23'),
	(119,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"考勤\",\"params\":{},\"parentId\":7,\"isCache\":\"0\",\"path\":\"attendance\",\"component\":\"system/attendance/index\",\"children\":[],\"createTime\":1649597446000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2013,\"menuType\":\"C\",\"perms\":\"system:attendance:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:53:33'),
	(120,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"班级\",\"params\":{},\"parentId\":4,\"isCache\":\"0\",\"path\":\"class\",\"component\":\"system/class/index\",\"children\":[],\"createTime\":1649597521000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"system:class:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:53:42'),
	(121,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"教室\",\"params\":{},\"parentId\":4,\"isCache\":\"0\",\"path\":\"classroom\",\"component\":\"system/classroom/index\",\"children\":[],\"createTime\":1649597532000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"C\",\"perms\":\"system:classroom:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:53:48'),
	(122,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"班级课程\",\"params\":{},\"parentId\":7,\"isCache\":\"0\",\"path\":\"course\",\"component\":\"system/course/index\",\"children\":[],\"createTime\":1649597541000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2031,\"menuType\":\"C\",\"perms\":\"system:course:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:53:53'),
	(123,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"设备\",\"params\":{},\"parentId\":10,\"isCache\":\"0\",\"path\":\"device\",\"component\":\"system/device/index\",\"children\":[],\"createTime\":1649597552000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2037,\"menuType\":\"C\",\"perms\":\"system:device:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:53:59'),
	(124,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"专业\",\"params\":{},\"parentId\":4,\"isCache\":\"0\",\"path\":\"major\",\"component\":\"system/major/index\",\"children\":[],\"createTime\":1649597560000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2043,\"menuType\":\"C\",\"perms\":\"system:major:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:54:03'),
	(125,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-10 22:55:28'),
	(126,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"课程\",\"params\":{},\"parentId\":6,\"isCache\":\"0\",\"path\":\"course\",\"component\":\"system/course/index\",\"children\":[],\"createTime\":1649597541000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2073,\"menuType\":\"C\",\"perms\":\"system:course:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-10 22:58:08'),
	(127,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/biz_member','127.0.0.1','内网IP','{tableName=biz_member}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 12:39:21'),
	(128,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/biz_member','127.0.0.1','内网IP','{tableName=biz_member}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 12:39:59'),
	(129,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-11 12:40:02'),
	(130,'学校',1,'com.ruoyi.web.controller.system.BizSchoolController.add()','POST',1,'admin',NULL,'/system/school','127.0.0.1','内网IP','{\"description\":\"大竹男子技工学校\",\"params\":{},\"createTime\":1649652928013,\"name\":\"大竹男子技工学校\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 12:55:28'),
	(131,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/biz_academy','127.0.0.1','内网IP','{tableName=biz_academy}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 12:58:45'),
	(132,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/biz_class','127.0.0.1','内网IP','{tableName=biz_class}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 12:59:13'),
	(133,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-11 12:59:22'),
	(134,'学院',1,'com.ruoyi.web.controller.system.BizAcademyController.add()','POST',1,'admin',NULL,'/system/academy','127.0.0.1','内网IP','{\"description\":\"计院\",\"params\":{},\"createTime\":1649664855224,\"schoolId\":1,\"name\":\"计算机学院\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:14:15'),
	(135,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":2,\"menuName\":\"学院\",\"params\":{},\"parentId\":4,\"isCache\":\"0\",\"path\":\"academy\",\"component\":\"system/academy/index\",\"children\":[],\"createTime\":1649597343000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"C\",\"perms\":\"system:academy:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:15:56'),
	(136,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":3,\"menuName\":\"专业\",\"params\":{},\"parentId\":4,\"isCache\":\"0\",\"path\":\"major\",\"component\":\"system/major/index\",\"children\":[],\"createTime\":1649597560000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2043,\"menuType\":\"C\",\"perms\":\"system:major:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:16:05'),
	(137,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":4,\"menuName\":\"学校\",\"params\":{},\"parentId\":4,\"isCache\":\"0\",\"path\":\"school\",\"component\":\"system/school/index\",\"children\":[],\"createTime\":1649597608000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2061,\"menuType\":\"C\",\"perms\":\"system:school:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:16:11'),
	(138,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":5,\"menuName\":\"班级\",\"params\":{},\"parentId\":4,\"isCache\":\"0\",\"path\":\"class\",\"component\":\"system/class/index\",\"children\":[],\"createTime\":1649597521000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"system:class:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:16:15'),
	(139,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":6,\"menuName\":\"教室\",\"params\":{},\"parentId\":4,\"isCache\":\"0\",\"path\":\"classroom\",\"component\":\"system/classroom/index\",\"children\":[],\"createTime\":1649597532000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"C\",\"perms\":\"system:classroom:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:16:22'),
	(140,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"学校\",\"params\":{},\"parentId\":4,\"isCache\":\"0\",\"path\":\"school\",\"component\":\"system/school/index\",\"children\":[],\"createTime\":1649597608000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2061,\"menuType\":\"C\",\"perms\":\"system:school:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:16:29'),
	(141,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/biz_major','127.0.0.1','内网IP','{tableName=biz_major}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:17:59'),
	(142,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-11 16:18:08'),
	(143,'专业',1,'com.ruoyi.web.controller.system.BizMajorController.add()','POST',1,'admin',NULL,'/system/major','127.0.0.1','内网IP','{\"academyId\":1,\"description\":\"计算机软件，及软\",\"params\":{},\"createTime\":1649665907399,\"name\":\"计算机软件\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:31:47'),
	(144,'班级',1,'com.ruoyi.web.controller.system.BizClassController.add()','POST',1,'admin',NULL,'/system/class','127.0.0.1','内网IP','{\"createTime\":1649666117284,\"name\":\"软件1班\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:35:17'),
	(145,'班级',3,'com.ruoyi.web.controller.system.BizClassController.remove()','DELETE',1,'admin',NULL,'/system/class/1','127.0.0.1','内网IP','{ids=1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:35:30'),
	(146,'班级',1,'com.ruoyi.web.controller.system.BizClassController.add()','POST',1,'admin',NULL,'/system/class','127.0.0.1','内网IP','{\"createTime\":1649666138377,\"name\":\"软件1班\",\"id\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:35:38'),
	(147,'班级',2,'com.ruoyi.web.controller.system.BizClassController.edit()','PUT',1,'admin',NULL,'/system/class','127.0.0.1','内网IP','{\"majorId\":1,\"createTime\":1649666138000,\"name\":\"软件1班\",\"updateTime\":1649666211515,\"id\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:36:51'),
	(148,'教室',1,'com.ruoyi.web.controller.system.BizClassroomController.add()','POST',1,'admin',NULL,'/system/classroom','127.0.0.1','内网IP','{\"createTime\":1649666257764,\"name\":\"科研教学楼-101室\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 16:37:37'),
	(149,'用户',1,'com.ruoyi.web.controller.system.BizMemberController.add()','POST',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"mobile\":\"135511222111\",\"params\":{},\"userId\":\"zhangsan\",\"password\":\"111\",\"createTime\":1649690568766,\"name\":\"张同学\",\"id\":1,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 23:22:48'),
	(150,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"mobile\":\"135511222111\",\"updateTime\":1649690851976,\"params\":{},\"userId\":\"zhangsan\",\"password\":\"$2a$10$c5J0D1VsPuYboaRNd81awOtHI4jhCXHhAqMQHsGdfSjX72kjxWkW.\",\"createTime\":1649690569000,\"name\":\"张同学\",\"id\":1,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-11 23:27:32'),
	(151,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/28,29,30,31,32,33,34,35,36,37','127.0.0.1','内网IP','{tableIds=28,29,30,31,32,33,34,35,36,37}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-13 00:08:33'),
	(152,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/38,39,40','127.0.0.1','内网IP','{tableIds=38,39,40}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-13 00:08:37'),
	(153,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','biz_grade,biz_desk_device,biz_desk,biz_device,biz_attendance,biz_member,biz_teaching_record,biz_major,biz_academy,biz_class,biz_score,biz_school,biz_resource,biz_class_course,biz_course,biz_classroom','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-13 00:09:41'),
	(154,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-13 00:09:53'),
	(155,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"年级\",\"params\":{},\"parentId\":4,\"isCache\":\"0\",\"path\":\"grade\",\"component\":\"system/grade/index\",\"children\":[],\"createTime\":1649780226000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2074,\"menuType\":\"C\",\"perms\":\"system:grade:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-13 00:18:43'),
	(156,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":4,\"menuName\":\"年级\",\"params\":{},\"parentId\":4,\"isCache\":\"0\",\"path\":\"grade\",\"component\":\"system/grade/index\",\"children\":[],\"createTime\":1649780226000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2074,\"menuType\":\"C\",\"perms\":\"system:grade:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-13 00:18:56'),
	(157,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"桌子\",\"params\":{},\"parentId\":10,\"isCache\":\"0\",\"path\":\"desk\",\"component\":\"system/desk/index\",\"children\":[],\"createTime\":1649780376000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2080,\"menuType\":\"C\",\"perms\":\"system:desk:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-13 00:19:54'),
	(158,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":2,\"menuName\":\"设备\",\"params\":{},\"parentId\":10,\"isCache\":\"0\",\"path\":\"device\",\"component\":\"system/device/index\",\"children\":[],\"createTime\":1649597552000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2037,\"menuType\":\"C\",\"perms\":\"system:device:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-13 00:20:02'),
	(159,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":2,\"menuName\":\"桌子\",\"params\":{},\"parentId\":10,\"isCache\":\"0\",\"path\":\"desk\",\"component\":\"system/desk/index\",\"children\":[],\"createTime\":1649780376000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2080,\"menuType\":\"C\",\"perms\":\"system:desk:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-13 00:20:13'),
	(160,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"设备\",\"params\":{},\"parentId\":10,\"isCache\":\"0\",\"path\":\"device\",\"component\":\"system/device/index\",\"children\":[],\"createTime\":1649597552000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2037,\"menuType\":\"C\",\"perms\":\"system:device:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-13 00:20:16'),
	(161,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/biz_teaching_record','127.0.0.1','内网IP','{tableName=biz_teaching_record}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 01:21:50'),
	(162,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-15 01:21:59'),
	(163,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/biz_device','127.0.0.1','内网IP','{tableName=biz_device}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 01:22:35'),
	(164,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-15 01:22:46'),
	(165,'年级',1,'com.ruoyi.web.controller.system.BizGradeController.add()','POST',1,'admin',NULL,'/system/grade','127.0.0.1','内网IP','{\"createTime\":1649958951842,\"name\":\"2016级\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 01:55:51'),
	(166,'年级',1,'com.ruoyi.web.controller.system.BizGradeController.add()','POST',1,'admin',NULL,'/system/grade','127.0.0.1','内网IP','{\"createTime\":1649958958390,\"name\":\"2017级\",\"id\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 01:55:58'),
	(167,'课程',1,'com.ruoyi.web.controller.system.BizCourseController.add()','POST',1,'admin',NULL,'/system/course','127.0.0.1','内网IP','{\"createTime\":1649959015658,\"name\":\"汽车发动机实操\",\"description\":\"汽车发动机实操，带你见证发动机\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 01:56:55'),
	(168,'设备',1,'com.ruoyi.web.controller.system.BizDeviceController.add()','POST',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"11\",\"params\":{},\"type\":\"scene\",\"createTime\":1649959704471,\"name\":\"啊啊\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 02:08:24'),
	(169,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"11\",\"updateTime\":1649959717004,\"params\":{},\"type\":\"face\",\"createTime\":1649959704000,\"name\":\"啊啊\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 02:08:37'),
	(170,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"01\",\"ip\":\"192.168.31.219\",\"updateTime\":1649959809173,\"params\":{},\"type\":\"face\",\"password\":\"cdkuaimao123\",\"createTime\":1649959704000,\"port\":37777,\"name\":\"人脸识别1-01\",\"id\":1,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 02:10:09'),
	(171,'设备',1,'com.ruoyi.web.controller.system.BizDeviceController.add()','POST',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"02\",\"ip\":\"192.168.31.35\",\"params\":{},\"type\":\"scene\",\"password\":\"cdkuaimao123\",\"createTime\":1649959848616,\"port\":37777,\"name\":\"场景1-02\",\"id\":2,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 02:10:48'),
	(172,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"01\",\"classroomId\":1,\"params\":{},\"createTime\":1649960102024,\"name\":\"01号桌\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 02:15:02'),
	(173,'桌子',2,'com.ruoyi.web.controller.system.BizDeskController.edit()','PUT',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"01\",\"classroomId\":1,\"updateTime\":1649960227760,\"params\":{},\"type\":2,\"createTime\":1649960102000,\"name\":\"01号桌\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 02:17:07'),
	(174,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"0\",\"classroomId\":1,\"params\":{},\"type\":1,\"createTime\":1649960252399,\"name\":\"00号桌\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 02:17:32'),
	(175,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"文件\",\"params\":{},\"parentId\":9,\"isCache\":\"0\",\"path\":\"resource\",\"component\":\"system/resource/index\",\"children\":[],\"createTime\":1649597598000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2055,\"menuType\":\"C\",\"perms\":\"system:resource:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 02:18:01'),
	(176,'用户',1,'com.ruoyi.web.controller.system.BizMemberController.add()','POST',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135244444111\",\"params\":{},\"userId\":\"lili\",\"classId\":2,\"password\":\"$2a$10$r5LOon4HIIGe.9hODy/GU.gQncMtJSw3RsOfwxsbIkrxbQIGMcaaa\",\"createTime\":1649961279767,\"schoolId\":1,\"name\":\"丽丽老师\",\"id\":2,\"userType\":1,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 02:34:39'),
	(177,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1649961286043,\"params\":{},\"userId\":\"zhangsan\",\"classId\":2,\"password\":\"$2a$10$r9gWbYFGSfKFA62.hrdEhOTxHZhp0AQ90UsV2hMIT3w98Iv9S.8ay\",\"createTime\":1649690569000,\"schoolId\":1,\"name\":\"张同学\",\"id\":1,\"userType\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 02:34:46'),
	(178,'教学记录',1,'com.ruoyi.web.controller.system.BizTeachingRecordController.add()','POST',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":1,\"majorId\":1,\"params\":{},\"duration\":1000,\"classId\":2,\"times\":1,\"teacherId\":2,\"createTime\":1649961361342,\"name\":\"汽车发动机实操\",\"startTime\":1649952000000,\"endTime\":1650643200000,\"id\":1,\"courseId\":1,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 02:36:01'),
	(179,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1649961412837,\"params\":{},\"userId\":\"zhangsan\",\"classId\":2,\"password\":\"$2a$10$LlqWiMuE65r4yyqvrfjbd.0X7DEr5dPn7cS2rsfVb3CoEWg3deHIq\",\"createTime\":1649690569000,\"schoolId\":1,\"name\":\"张同学\",\"id\":1,\"userType\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-15 02:36:52'),
	(180,'桌子',2,'com.ruoyi.web.controller.system.BizDeskController.edit()','PUT',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"00\",\"classroomId\":1,\"updateTime\":1650045331198,\"params\":{},\"type\":1,\"createTime\":1649960252000,\"name\":\"00号桌\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-16 01:55:31'),
	(181,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/biz_classroom','127.0.0.1','内网IP','{tableName=biz_classroom}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-16 10:49:56'),
	(182,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-16 10:50:06'),
	(183,'教室',2,'com.ruoyi.web.controller.system.BizClassroomController.edit()','PUT',1,'admin',NULL,'/system/classroom','127.0.0.1','内网IP','{\"no\":\"1000\",\"createTime\":1649666258000,\"name\":\"科研教学楼-101室\",\"updateTime\":1650077692467,\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-16 10:54:52'),
	(184,'用户',1,'com.ruoyi.web.controller.system.BizMemberController.add()','POST',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"133333333333\",\"params\":{},\"userId\":\"dalao\",\"classId\":2,\"password\":\"$2a$10$DuqaKcR53MyTbMTK1Jk4U.YQig.HfC7dxqxLrktnONFfW.dviMmre\",\"createTime\":1650198281346,\"schoolId\":1,\"name\":\"大佬同学\",\"id\":3,\"userType\":2,\"email\":\"111@qq.com\",\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-17 20:24:41'),
	(185,'教学记录',2,'com.ruoyi.web.controller.system.BizTeachingRecordController.edit()','PUT',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":1,\"majorId\":1,\"classroomId\":1,\"updateTime\":1650206705776,\"params\":{},\"duration\":1000,\"classId\":2,\"times\":1,\"teacherId\":\"lili\",\"createTime\":1649961361000,\"name\":\"汽车发动机实操\",\"startTime\":1650182837000,\"endTime\":1650643200000,\"id\":1,\"courseId\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-17 22:45:05'),
	(186,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/biz_desk_device','127.0.0.1','内网IP','{tableName=biz_desk_device}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-17 23:07:25'),
	(187,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-17 23:07:27'),
	(188,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/1/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":2,\"createTime\":1650209321165,\"id\":1,\"deskId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-17 23:28:41'),
	(189,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/2/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":2,\"createTime\":1650209332605,\"id\":2,\"deskId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-17 23:28:52'),
	(190,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/1/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":1,\"createTime\":1650258166687,\"id\":3,\"deskId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 13:02:46'),
	(191,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/2/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":1,\"createTime\":1650258181229,\"id\":4,\"deskId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 13:03:01'),
	(192,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.unbind()','POST',1,'admin',NULL,'/system/desk/1/unbind','127.0.0.1','内网IP','1 {\"classroomId\":1,\"params\":{},\"deviceId\":1,\"deskId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 13:08:36'),
	(193,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.unbind()','POST',1,'admin',NULL,'/system/desk/2/unbind','127.0.0.1','内网IP','2 {\"classroomId\":1,\"params\":{},\"deviceId\":1,\"deskId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 13:10:09'),
	(194,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/1/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":1,\"createTime\":1650258700379,\"id\":5,\"deskId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 13:11:40'),
	(195,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.unbind()','POST',1,'admin',NULL,'/system/desk/1/unbind','127.0.0.1','内网IP','1 {\"classroomId\":1,\"params\":{},\"deviceId\":1,\"deskId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 13:12:32'),
	(196,'学校',2,'com.ruoyi.web.controller.system.BizSchoolController.edit()','PUT',1,'admin',NULL,'/system/school','127.0.0.1','内网IP','{\"hasAcademy\":1,\"description\":\"大竹男子技工学校\",\"updateTime\":1650282787722,\"params\":{},\"createTime\":1649652928000,\"name\":\"大竹男子技工学校\",\"id\":1,\"childSchool\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 19:53:07'),
	(197,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"02\",\"classroomId\":1,\"params\":{},\"type\":2,\"createTime\":1650296803892,\"name\":\"02号桌\",\"id\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 23:46:43'),
	(198,'设备',1,'com.ruoyi.web.controller.system.BizDeviceController.add()','POST',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"LC-K3X\",\"ip\":\"192.168.31.200\",\"params\":{},\"type\":\"scene\",\"password\":\"cdkuaimao123\",\"createTime\":1650297101640,\"port\":37777,\"name\":\"乐橙LC-K3X\",\"id\":3,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 23:51:41'),
	(199,'设备',1,'com.ruoyi.web.controller.system.BizDeviceController.add()','POST',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"DH-IPC\",\"ip\":\"192.168.31.35\",\"params\":{},\"type\":\"scene\",\"password\":\"cdkuaimao123\",\"createTime\":1650297142144,\"port\":37777,\"name\":\"半球机\",\"id\":4,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 23:52:22'),
	(200,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/3/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":3,\"createTime\":1650297182733,\"id\":3,\"deskId\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 23:53:02'),
	(201,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/3/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":1,\"createTime\":1650297191487,\"id\":4,\"deskId\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 23:53:11'),
	(202,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/1/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":1,\"createTime\":1650297224260,\"id\":5,\"deskId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 23:53:44'),
	(203,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/2/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":1,\"createTime\":1650297227987,\"id\":6,\"deskId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 23:53:48'),
	(204,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.unbind()','POST',1,'admin',NULL,'/system/desk/1/unbind','127.0.0.1','内网IP','1 {\"classroomId\":1,\"params\":{},\"deviceId\":2,\"deskId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 23:54:24'),
	(205,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"DH-IPC\",\"ip\":\"192.168.31.219\",\"updateTime\":1650297290485,\"params\":{},\"type\":\"scene\",\"password\":\"cdkuaimao123\",\"createTime\":1650297142000,\"port\":37777,\"name\":\"半球机\",\"id\":4,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 23:54:50'),
	(206,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/1/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":4,\"createTime\":1650297301067,\"id\":7,\"deskId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-18 23:55:01'),
	(207,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"133333333333\",\"updateTime\":1650389146614,\"params\":{},\"userId\":\"dalao\",\"classId\":2,\"password\":\"$2a$10$NyHnTv05g.rQRNOgRP8scu12ixJLR2MM8/KnhjVP7LQfX.bCkm1zC\",\"createTime\":1650198281000,\"schoolId\":1,\"name\":\"大佬同学\",\"id\":3,\"userType\":2,\"email\":\"111@qq.com\",\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-20 01:25:46'),
	(208,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"03\",\"classroomId\":1,\"params\":{},\"type\":2,\"createTime\":1650469878765,\"name\":\"03号桌\",\"id\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-20 23:51:18'),
	(209,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/4/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":4,\"createTime\":1650469914873,\"id\":8,\"deskId\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-20 23:51:54'),
	(210,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.unbind()','POST',1,'admin',NULL,'/system/desk/4/unbind','127.0.0.1','内网IP','4 {\"classroomId\":1,\"params\":{},\"deviceId\":4,\"deskId\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-20 23:52:57'),
	(211,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/4/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":2,\"createTime\":1650469992668,\"id\":9,\"deskId\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-20 23:53:12'),
	(212,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/4/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":1,\"createTime\":1650470003525,\"id\":10,\"deskId\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-20 23:53:23'),
	(213,'设备',1,'com.ruoyi.web.controller.system.BizDeviceController.add()','POST',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"F_001\",\"ip\":\"192.168.31.219\",\"params\":{},\"type\":\"360\",\"password\":\"cdkuaimao123\",\"createTime\":1650473000215,\"port\":37777,\"name\":\"全景摄像机\",\"id\":5,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 00:43:20'),
	(214,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/2/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":5,\"createTime\":1650473036031,\"id\":11,\"deskId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 00:43:56'),
	(215,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/biz_member','127.0.0.1','内网IP','{tableName=biz_member}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 00:47:49'),
	(216,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-26 00:47:52'),
	(217,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin',NULL,'/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2022/04/26/blob_20220426224908A001.jpeg\",\"code\":200}',0,NULL,'2022-04-26 22:49:08'),
	(218,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$ofv6NHb8HUbBBYnCC.AQBu4DBS2ltdYl/WvJqhhN8xG6npavtBFKW\",\"schoolId\":1,\"id\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1650986268835,\"avatar\":\"http://localhost:8080/profile/upload/2022/04/26/test_20220426231720A020.jpg\",\"params\":{},\"userId\":\"zhangsan\",\"createTime\":1649690569000,\"name\":\"张同学\",\"userType\":2,\"status\":1}',NULL,1,'java.lang.RuntimeException: java.nio.file.NoSuchFileException: /Users/pholy/trash/vision_easy/upload/upload/2022/04/26/test_20220426231720A020.jpg','2022-04-26 23:17:49'),
	(219,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$OWGFaOfK4zR.prRCujRFDOxtPzho9ZhEiYGGyUNi1BiiaGanVVwpy\",\"schoolId\":1,\"id\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1650986275558,\"avatar\":\"http://localhost:8080/profile/upload/2022/04/26/test_20220426231720A020.jpg\",\"params\":{},\"userId\":\"zhangsan\",\"createTime\":1649690569000,\"name\":\"张同学\",\"userType\":2,\"status\":1}',NULL,1,'java.lang.RuntimeException: java.nio.file.NoSuchFileException: /Users/pholy/trash/vision_easy/upload/upload/2022/04/26/test_20220426231720A020.jpg','2022-04-26 23:19:05'),
	(220,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$855zcIps3KwligQ7Wg8USO9m139cY2yi5yiZU7FnR9bjwpRViRrn6\",\"schoolId\":1,\"id\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1650986541803,\"avatar\":\"http://localhost:8080/profile/upload/2022/04/26/test_20220426232219A001.jpg\",\"params\":{},\"userId\":\"zhangsan\",\"createTime\":1649690569000,\"name\":\"张同学\",\"userType\":2,\"status\":1}',NULL,1,'java.lang.NullPointerException','2022-04-26 23:23:06'),
	(221,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$IN9gp3Ip79MHzoR8eDlgve7I3g4ZIcYCROGYmvqxLPGVOXFJzz9nK\",\"schoolId\":1,\"id\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1650986589277,\"avatar\":\"http://localhost:8080/profile/upload/2022/04/26/test_20220426232219A001.jpg\",\"params\":{},\"userId\":\"zhangsan\",\"createTime\":1649690569000,\"name\":\"张同学\",\"userType\":2,\"status\":1}',NULL,1,'java.lang.NullPointerException','2022-04-26 23:23:30'),
	(222,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$1tNnD4qgUfxt4.2BpgvFeeFokvLKY3yEe129Q0YNWdzvu61eJJjE.\",\"schoolId\":1,\"id\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1650986659508,\"avatar\":\"http://localhost:8080/profile/upload/2022/04/26/test_20220426232219A001.jpg\",\"params\":{},\"userId\":\"zhangsan\",\"createTime\":1649690569000,\"name\":\"张同学\",\"userType\":2,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 23:24:20'),
	(223,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$WiQhu8TvFG8QSaLWFwRWh.542cLL/1Ck9ASF2wFytlohugsG9OGZy\",\"schoolId\":1,\"id\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1650987430724,\"avatar\":\"http://localhost:8080/profile/upload/2022/04/26/test_20220426232219A001.jpg\",\"params\":{},\"userId\":\"zhangsan\",\"createTime\":1649690569000,\"name\":\"张同学\",\"userType\":2,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 23:37:11'),
	(224,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$wPMlL/NO0U9GNc5npGEDFOD.ipN5.ywABtI07EigcH6XQ0JLXVlZG\",\"schoolId\":1,\"id\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1650987639143,\"avatar\":\"http://localhost:8080/profile/upload/2022/04/26/avatar_20220426234036A001.jpeg\",\"params\":{},\"userId\":\"zhangsan\",\"createTime\":1649690569000,\"name\":\"张同学\",\"userType\":2,\"status\":1}',NULL,1,'com.ruoyi.common.exception.ServiceException: Publish image error','2022-04-26 23:40:39'),
	(225,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$ki8LW5RpxNFI9lWGThyG6uC2ZlEP4TzkMDw/EuySblDFCSIGN63da\",\"schoolId\":1,\"id\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1650987868870,\"avatar\":\"http://localhost:8080/profile/upload/2022/04/26/avatar_20220426234036A001.jpeg\",\"params\":{},\"userId\":\"zhangsan\",\"createTime\":1649690569000,\"name\":\"张同学\",\"userType\":2,\"status\":1}',NULL,1,'com.ruoyi.common.exception.ServiceException: \n{error code: (0x80000000|1061).参考  NetSDKLib.java } - {error info:未知错误}\n','2022-04-26 23:44:29'),
	(226,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$rXQdpsiyt9YZ8OSCUD4kl.cMXGHaxrvqjKEUNm7lCyayMglRexJUi\",\"schoolId\":1,\"id\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1650988244434,\"avatar\":\"http://localhost:8080/profile/upload/2022/04/26/WechatIMG1461_20220426235033A001.jpeg\",\"params\":{},\"userId\":\"zhangsan\",\"createTime\":1649690569000,\"name\":\"张同学\",\"userType\":2,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 23:50:45'),
	(227,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$pMgEAcw56zsMaIBtDy6hH.t70QuKbilAVpJfD4JBrGQekPUGKdZG2\",\"schoolId\":1,\"id\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1650990121896,\"avatar\":\"http://localhost:8080/profile/upload/2022/04/26/WechatIMG1461_20220426235033A001.jpeg\",\"params\":{},\"userId\":\"zhangsan\",\"createTime\":1649690569000,\"name\":\"张同学\",\"userType\":2,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 00:22:02'),
	(228,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"1\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":3,\"menuName\":\"成绩管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"score\",\"children\":[],\"createTime\":1649574831000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":8,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:00:17'),
	(229,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"1\",\"query\":\"\",\"icon\":\"log\",\"orderNum\":9,\"menuName\":\"日志管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"log\",\"component\":\"\",\"children\":[],\"createTime\":1649574831000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":108,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:01:10'),
	(230,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"1\",\"query\":\"\",\"icon\":\"monitor\",\"orderNum\":2,\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1649574831000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:01:20'),
	(231,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"1\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":3,\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1649574831000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:01:29'),
	(232,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tree-table\",\"orderNum\":3,\"menuName\":\"机构管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"organization\",\"children\":[],\"createTime\":1649574831000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:03:34'),
	(233,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"peoples\",\"orderNum\":3,\"menuName\":\"人员管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"member\",\"children\":[],\"createTime\":1649574831000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":5,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:03:45'),
	(234,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"education\",\"orderNum\":3,\"menuName\":\"课程管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"course\",\"children\":[],\"createTime\":1649574831000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":6,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:04:17'),
	(235,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"international\",\"orderNum\":3,\"menuName\":\"教学管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"teaching\",\"children\":[],\"createTime\":1649574831000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":7,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:04:42'),
	(236,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"1\",\"query\":\"\",\"icon\":\"code\",\"orderNum\":3,\"menuName\":\"成绩管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"score\",\"children\":[],\"createTime\":1649574831000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":8,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:05:06'),
	(237,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"pdf\",\"orderNum\":3,\"menuName\":\"资源管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"resource\",\"children\":[],\"createTime\":1649574831000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":9,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:05:16'),
	(238,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"table\",\"orderNum\":3,\"menuName\":\"设备管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"device\",\"children\":[],\"createTime\":1649574831000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":10,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:05:47'),
	(239,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"1\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"班级课程\",\"params\":{},\"parentId\":7,\"isCache\":\"0\",\"path\":\"classCourse\",\"component\":\"system/classCourse/index\",\"children\":[],\"createTime\":1649597541000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2031,\"menuType\":\"C\",\"perms\":\"system:course:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:33:46'),
	(240,'教学记录',1,'com.ruoyi.web.controller.system.BizTeachingRecordController.add()','POST',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"params\":{},\"createTime\":1651038904084,\"id\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:55:04'),
	(241,'教学记录',3,'com.ruoyi.web.controller.system.BizTeachingRecordController.remove()','DELETE',1,'admin',NULL,'/system/teachingRecord/2','127.0.0.1','内网IP','{ids=2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 13:55:07'),
	(242,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/1/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"createTime\":1651042923019,\"id\":12,\"deskId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 15:02:03'),
	(243,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"params\":{}}','{\"msg\":\"用户不存在\",\"code\":500}',0,NULL,'2022-04-27 16:22:45'),
	(244,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":1,\"params\":{}}',NULL,1,'com.ruoyi.common.exception.ServiceException: Login device failed, name: 人脸识别1-01, ip: 192.168.31.219','2022-04-27 16:23:27'),
	(245,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":1,\"params\":{}}',NULL,1,'com.ruoyi.common.exception.ServiceException: Login device failed, name: 人脸识别1-01, ip: 192.168.31.219','2022-04-27 16:23:31'),
	(246,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 16:25:22'),
	(247,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$/wNVtTHyrKKNgSSbqbQltei1f81rYGD2eOvtvW1vECS8cK9SlVd7a\",\"schoolId\":1,\"id\":1,\"gradeId\":1,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1651048066991,\"avatar\":\"http://localhost:8080/profile/upload/2022/04/26/WechatIMG1461_20220426235033A001.jpeg\",\"params\":{},\"userId\":\"zhangsan\",\"createTime\":1649690569000,\"name\":\"张同学\",\"userType\":2,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 16:27:47'),
	(248,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-27 23:06:21'),
	(249,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 00:02:09'),
	(250,'教学记录',1,'com.ruoyi.web.controller.system.BizTeachingRecordController.add()','POST',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":1,\"majorId\":1,\"classroomId\":1,\"params\":{},\"duration\":1000,\"classId\":2,\"times\":1,\"teacherId\":\"2\",\"createTime\":1651077767294,\"name\":\"汽车维修实战\",\"id\":3,\"courseId\":1,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 00:42:47'),
	(251,'教学记录',2,'com.ruoyi.web.controller.system.BizTeachingRecordController.edit()','PUT',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":1,\"majorId\":1,\"classroomId\":1,\"updateTime\":1651078329871,\"params\":{},\"duration\":1000,\"classId\":2,\"times\":1,\"teacherId\":\"lili\",\"createTime\":1651077767000,\"name\":\"汽车维修实战\",\"startTime\":1651078106000,\"id\":3,\"courseId\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 00:52:09'),
	(252,'教学记录',1,'com.ruoyi.web.controller.system.BizTeachingRecordController.add()','POST',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":1,\"majorId\":1,\"classroomId\":1,\"params\":{},\"duration\":0,\"classId\":2,\"times\":1,\"teacherId\":\"lili\",\"createTime\":1651078631867,\"name\":\"挖掘机专家教学\",\"id\":4,\"courseId\":1,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 00:57:11'),
	(253,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"01\",\"ip\":\"192.168.1.100\",\"updateTime\":1651135046464,\"params\":{},\"type\":\"face\",\"password\":\"cdkuaimao123\",\"createTime\":1649959704000,\"port\":37777,\"name\":\"人脸识别1-01\",\"id\":1,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:37:26'),
	(254,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"LC-K3X\",\"ip\":\"192.168.1.104\",\"updateTime\":1651135090409,\"params\":{},\"type\":\"scene\",\"password\":\"cdkuaimao123\",\"createTime\":1650297102000,\"port\":37777,\"name\":\"乐橙LC-K3X\",\"id\":3,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:38:10'),
	(255,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"DH-IPC\",\"ip\":\"192.168.1.108\",\"updateTime\":1651135108647,\"params\":{},\"type\":\"scene\",\"password\":\"cdkuaimao123\",\"createTime\":1650297142000,\"port\":37777,\"name\":\"半球机\",\"id\":4,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:38:28'),
	(256,'设备',3,'com.ruoyi.web.controller.system.BizDeviceController.remove()','DELETE',1,'admin',NULL,'/system/device/2','127.0.0.1','内网IP','{ids=2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:38:38'),
	(257,'设备',3,'com.ruoyi.web.controller.system.BizDeviceController.remove()','DELETE',1,'admin',NULL,'/system/device/5','127.0.0.1','内网IP','{ids=5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:38:42'),
	(258,'桌子',3,'com.ruoyi.web.controller.system.BizDeskController.remove()','DELETE',1,'admin',NULL,'/system/desk/1,2,3,4','127.0.0.1','内网IP','{ids=1,2,3,4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:38:55'),
	(259,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"0000\",\"classroomId\":1,\"params\":{},\"type\":1,\"createTime\":1651135187255,\"name\":\"教师桌\",\"id\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:39:47'),
	(260,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"001\",\"classroomId\":1,\"params\":{},\"type\":2,\"createTime\":1651135211843,\"name\":\"学生桌001\",\"id\":6}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:40:11'),
	(261,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/5/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":1,\"createTime\":1651135224930,\"id\":13,\"deskId\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:40:24'),
	(262,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/5/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":3,\"createTime\":1651135228456,\"id\":14,\"deskId\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:40:28'),
	(263,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/5/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":4,\"createTime\":1651135233836,\"id\":15,\"deskId\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:40:33'),
	(264,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.unbind()','POST',1,'admin',NULL,'/system/desk/5/unbind','127.0.0.1','内网IP','5 {\"classroomId\":1,\"params\":{},\"deviceId\":4,\"deskId\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:40:42'),
	(265,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"DH-IPC\",\"ip\":\"192.168.1.108\",\"updateTime\":1651135252268,\"params\":{},\"type\":\"360\",\"password\":\"cdkuaimao123\",\"createTime\":1650297142000,\"port\":37777,\"name\":\"半球机\",\"id\":4,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:40:52'),
	(266,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/5/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":4,\"createTime\":1651135263299,\"id\":16,\"deskId\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:41:03'),
	(267,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/6/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":1,\"createTime\":1651135273618,\"id\":17,\"deskId\":6}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:41:13'),
	(268,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/6/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":3,\"createTime\":1651135278930,\"id\":18,\"deskId\":6}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:41:18'),
	(269,'教学记录',1,'com.ruoyi.web.controller.system.BizTeachingRecordController.add()','POST',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":2,\"majorId\":1,\"classroomId\":1,\"params\":{},\"duration\":1000,\"classId\":2,\"times\":1,\"teacherId\":\"lili\",\"createTime\":1651135357942,\"name\":\"汽修实操1讲\",\"id\":5,\"courseId\":1,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:42:37'),
	(270,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"01\",\"ip\":\"192.168.1.104\",\"updateTime\":1651135723068,\"params\":{},\"type\":\"face\",\"password\":\"cdkuaimao123\",\"createTime\":1649959704000,\"port\":37777,\"name\":\"人脸识别1-01\",\"id\":1,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:48:43'),
	(271,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"LC-K3X\",\"ip\":\"192.168.1.100\",\"updateTime\":1651135726655,\"params\":{},\"type\":\"scene\",\"password\":\"cdkuaimao123\",\"createTime\":1650297102000,\"port\":37777,\"name\":\"乐橙LC-K3X\",\"id\":3,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:48:46'),
	(272,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"DH-IPC\",\"ip\":\"192.168.1.100\",\"updateTime\":1651135982532,\"params\":{},\"type\":\"360\",\"password\":\"cdkuaimao123\",\"createTime\":1650297142000,\"port\":37777,\"name\":\"半球机\",\"id\":4,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:53:02'),
	(273,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"LC-K3X\",\"ip\":\"192.168.1.108\",\"updateTime\":1651135987227,\"params\":{},\"type\":\"scene\",\"password\":\"cdkuaimao123\",\"createTime\":1650297102000,\"port\":37777,\"name\":\"乐橙LC-K3X\",\"id\":3,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:53:07'),
	(274,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"002\",\"classroomId\":1,\"params\":{},\"type\":2,\"createTime\":1651136365587,\"name\":\"学生桌002\",\"id\":7}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:59:25'),
	(275,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/7/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":1,\"createTime\":1651136370560,\"id\":19,\"deskId\":7}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:59:30'),
	(276,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/7/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":3,\"createTime\":1651136375147,\"id\":20,\"deskId\":7}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 16:59:35'),
	(277,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":3,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 17:02:13'),
	(278,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$51vFU6Kca7SYXXvV.NxDiu/xu97e83gQmXBEH2vm.sQpyCvKx65/6\",\"schoolId\":1,\"id\":2,\"gradeId\":2,\"majorId\":1,\"mobile\":\"135244444111\",\"updateTime\":1651137351404,\"params\":{},\"userId\":\"lili\",\"createTime\":1649961280000,\"name\":\"丽丽老师\",\"userType\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 17:15:51'),
	(279,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$IbpcDiq3vAO9k0Oy4hTQrODDW8.gtgAFmhqnLAo0cbGXOpyla4Uwe\",\"schoolId\":1,\"id\":1,\"gradeId\":2,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1651137361509,\"avatar\":\"http://localhost:8080/profile/upload/2022/04/26/WechatIMG1461_20220426235033A001.jpeg\",\"params\":{},\"userId\":\"zhangsan\",\"createTime\":1649690569000,\"name\":\"张同学\",\"userType\":2,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 17:16:01'),
	(280,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$fbPvpvYvb6D4o4DKARogo..QgNKAwpaSXGeYeTPtOq.ho6usIYzX2\",\"schoolId\":1,\"id\":3,\"email\":\"111@qq.com\",\"gradeId\":2,\"majorId\":1,\"mobile\":\"133333333333\",\"updateTime\":1651137365970,\"params\":{},\"userId\":\"dalao\",\"createTime\":1650198281000,\"name\":\"大佬同学\",\"userType\":2,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 17:16:05'),
	(281,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 17:17:27'),
	(282,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":3,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 17:17:47'),
	(283,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 17:23:23'),
	(284,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"DH-IPC\",\"ip\":\"192.168.31.37\",\"updateTime\":1651149766660,\"params\":{},\"type\":\"360\",\"password\":\"cdkuaimao123\",\"createTime\":1650297142000,\"port\":37777,\"name\":\"半球机\",\"id\":4,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 20:42:46'),
	(285,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"LC-K3X\",\"ip\":\"192.168.31.203\",\"updateTime\":1651149781473,\"params\":{},\"type\":\"scene\",\"password\":\"cdkuaimao123\",\"createTime\":1650297102000,\"port\":37777,\"name\":\"乐橙LC-K3X\",\"id\":3,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 20:43:01'),
	(286,'设备',2,'com.ruoyi.web.controller.system.BizDeviceController.edit()','PUT',1,'admin',NULL,'/system/device','127.0.0.1','内网IP','{\"no\":\"01\",\"ip\":\"192.168.31.222\",\"updateTime\":1651149791005,\"params\":{},\"type\":\"face\",\"password\":\"cdkuaimao123\",\"createTime\":1649959704000,\"port\":37777,\"name\":\"人脸识别1-01\",\"id\":1,\"username\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 20:43:11'),
	(287,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"003\",\"classroomId\":1,\"params\":{},\"type\":2,\"createTime\":1651159361512,\"name\":\"学生桌03\",\"id\":8}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 23:22:41'),
	(288,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/8/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":1,\"createTime\":1651159367612,\"id\":21,\"deskId\":8}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 23:22:47'),
	(289,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/8/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":3,\"createTime\":1651159373048,\"id\":22,\"deskId\":8}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 23:22:53'),
	(290,'用户',1,'com.ruoyi.web.controller.system.BizMemberController.add()','POST',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"schoolId\":1,\"gradeId\":2,\"majorId\":1,\"params\":{},\"userId\":\"小朋友\",\"name\":\"xpy\",\"userType\":2,\"status\":0}',NULL,1,'','2022-04-30 18:23:01'),
	(291,'用户',1,'com.ruoyi.web.controller.system.BizMemberController.add()','POST',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$4Yy8ly7jrcGgZPIMLsaHIOQKgxwT6diSRzCArEG.yoZnIxHIQMSia\",\"schoolId\":1,\"id\":4,\"gradeId\":2,\"majorId\":1,\"params\":{},\"userId\":\"xpy\",\"createTime\":1651314378414,\"name\":\"小朋友\",\"userType\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 18:26:18'),
	(292,'参数管理',1,'com.ruoyi.web.controller.system.SysConfigController.add()','POST',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configName\":\"客户端标题\",\"configKey\":\"slogan.title\",\"createBy\":\"admin\",\"configType\":\"Y\",\"configValue\":\"视易控·Vision Easy！\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 18:37:46'),
	(293,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configName\":\"客户端标题\",\"configKey\":\"slogan.title\",\"createBy\":\"admin\",\"createTime\":1651315066000,\"updateBy\":\"admin\",\"configId\":6,\"configType\":\"N\",\"configValue\":\"视易控·Vision Easy！\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 18:37:51'),
	(294,'参数管理',1,'com.ruoyi.web.controller.system.SysConfigController.add()','POST',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configName\":\"客户端子标题\",\"configKey\":\"slogan.subtitle\",\"createBy\":\"admin\",\"configType\":\"N\",\"configValue\":\"让教学更高效！\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 18:38:24'),
	(295,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.edit()','PUT',1,'admin',NULL,'/system/notice','127.0.0.1','内网IP','{\"noticeContent\":\"新版本内容\",\"createBy\":\"admin\",\"createTime\":1649574831000,\"updateBy\":\"admin\",\"noticeType\":\"2\",\"remark\":\"管理员\",\"params\":{},\"noticeId\":1,\"noticeTitle\":\"温馨提醒：请大家上课认真听讲，不能松懈！\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 18:39:17'),
	(296,'教学记录',1,'com.ruoyi.web.controller.system.BizTeachingRecordController.add()','POST',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":2,\"majorId\":1,\"classroomId\":1,\"params\":{},\"duration\":0,\"classId\":2,\"times\":1,\"teacherId\":\"lili\",\"name\":\"测试\",\"courseId\":1,\"status\":0}',NULL,1,'当前已经存在一场教学记录，请等待完成后再操作','2022-04-30 23:36:43'),
	(297,'教学记录',2,'com.ruoyi.web.controller.system.BizTeachingRecordController.edit()','PUT',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"updateTime\":1651333405607,\"params\":{},\"id\":5,\"status\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 23:43:25'),
	(298,'学院',1,'com.ruoyi.web.controller.system.BizAcademyController.add()','POST',1,'admin',NULL,'/system/academy','127.0.0.1','内网IP','{\"params\":{},\"createTime\":1651383259539,\"schoolId\":1,\"name\":\"数学学院\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:34:19'),
	(299,'学院',3,'com.ruoyi.web.controller.system.BizAcademyController.remove()','DELETE',1,'admin',NULL,'/system/academy/2','127.0.0.1','内网IP','{ids=2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:34:29'),
	(300,'学院',1,'com.ruoyi.web.controller.system.BizAcademyController.add()','POST',1,'admin',NULL,'/system/academy','127.0.0.1','内网IP','{\"description\":\"书院\",\"params\":{},\"createTime\":1651383288802,\"schoolId\":1,\"name\":\"数学学院\",\"id\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:34:48'),
	(301,'专业',1,'com.ruoyi.web.controller.system.BizMajorController.add()','POST',1,'admin',NULL,'/system/major','127.0.0.1','内网IP','{\"academyId\":3,\"description\":\"微积分\",\"params\":{},\"createTime\":1651383341159,\"name\":\"微积分专业\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:35:41'),
	(302,'专业',2,'com.ruoyi.web.controller.system.BizMajorController.edit()','PUT',1,'admin',NULL,'/system/major','127.0.0.1','内网IP','{\"academyId\":3,\"description\":\"微积分专业\",\"updateTime\":1651383350534,\"params\":{},\"createTime\":1651383341000,\"name\":\"微积分专业\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:35:50'),
	(303,'年级',1,'com.ruoyi.web.controller.system.BizGradeController.add()','POST',1,'admin',NULL,'/system/grade','127.0.0.1','内网IP','{\"createTime\":1651383415311,\"name\":\"2018级\",\"id\":3,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:36:55'),
	(304,'年级',2,'com.ruoyi.web.controller.system.BizGradeController.edit()','PUT',1,'admin',NULL,'/system/grade','127.0.0.1','内网IP','{\"createTime\":1651383415000,\"name\":\"2019级\",\"updateTime\":1651383423398,\"id\":3,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:37:03'),
	(305,'年级',3,'com.ruoyi.web.controller.system.BizGradeController.remove()','DELETE',1,'admin',NULL,'/system/grade/3','127.0.0.1','内网IP','{ids=3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:37:07'),
	(306,'年级',1,'com.ruoyi.web.controller.system.BizGradeController.add()','POST',1,'admin',NULL,'/system/grade','127.0.0.1','内网IP','{\"createTime\":1651383434687,\"name\":\"2019级\",\"id\":4,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:37:14'),
	(307,'班级',1,'com.ruoyi.web.controller.system.BizClassController.add()','POST',1,'admin',NULL,'/system/class','127.0.0.1','内网IP','{\"majorId\":2,\"createTime\":1651383464144,\"name\":\"微积分1班\",\"id\":3,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:37:44'),
	(308,'班级',2,'com.ruoyi.web.controller.system.BizClassController.edit()','PUT',1,'admin',NULL,'/system/class','127.0.0.1','内网IP','{\"majorId\":2,\"createTime\":1651383464000,\"name\":\"微积分1班\",\"updateTime\":1651383515802,\"id\":3,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:38:35'),
	(309,'教室',1,'com.ruoyi.web.controller.system.BizClassroomController.add()','POST',1,'admin',NULL,'/system/classroom','127.0.0.1','内网IP','{\"no\":\"化学教室\",\"createTime\":1651383532303,\"name\":\"2\",\"id\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:38:52'),
	(310,'教室',2,'com.ruoyi.web.controller.system.BizClassroomController.edit()','PUT',1,'admin',NULL,'/system/classroom','127.0.0.1','内网IP','{\"no\":\"2\",\"createTime\":1651383532000,\"name\":\"化学教室\",\"updateTime\":1651383552872,\"id\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:39:12'),
	(311,'用户',1,'com.ruoyi.web.controller.system.BizMemberController.add()','POST',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":3,\"classId\":3,\"password\":\"$2a$10$YI3XJTBBdT32UW.WXJ2P6.cs0/DjcxlWQMfIwycp0uvaOYeGcDn32\",\"schoolId\":1,\"id\":5,\"gradeId\":4,\"majorId\":2,\"params\":{},\"userId\":\"lisi\",\"createTime\":1651383666004,\"name\":\"李四\",\"userType\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:41:06'),
	(312,'课程',1,'com.ruoyi.web.controller.system.BizCourseController.add()','POST',1,'admin',NULL,'/system/course','127.0.0.1','内网IP','{\"createTime\":1651383719538,\"name\":\"微积分课程\",\"description\":\"描述微积分\",\"id\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:41:59'),
	(313,'课程',1,'com.ruoyi.web.controller.system.BizCourseController.add()','POST',1,'admin',NULL,'/system/course','127.0.0.1','内网IP','{\"createTime\":1651383737636,\"name\":\"奥数课程\",\"description\":\"备考\",\"id\":3,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:42:17'),
	(314,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"1\",\"classroomId\":1,\"params\":{},\"type\":2,\"createTime\":1651383911202,\"name\":\"学生桌05\",\"id\":9}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:45:11'),
	(315,'桌子',2,'com.ruoyi.web.controller.system.BizDeskController.edit()','PUT',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"004\",\"classroomId\":1,\"updateTime\":1651383982021,\"params\":{},\"type\":2,\"createTime\":1651383911000,\"name\":\"学生桌05\",\"id\":9}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:46:22'),
	(316,'桌子',2,'com.ruoyi.web.controller.system.BizDeskController.edit()','PUT',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"004\",\"classroomId\":1,\"updateTime\":1651383997639,\"params\":{},\"type\":2,\"createTime\":1651383911000,\"name\":\"学生桌05\",\"id\":9}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 13:46:37'),
	(317,'教学记录',1,'com.ruoyi.web.controller.system.BizTeachingRecordController.add()','POST',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":3,\"gradeId\":4,\"majorId\":2,\"classroomId\":2,\"params\":{},\"duration\":0,\"classId\":3,\"times\":2,\"teacherId\":\"lili\",\"createTime\":1651385035923,\"name\":\"微积分课程\",\"id\":6,\"courseId\":3,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:03:56'),
	(318,'用户',1,'com.ruoyi.web.controller.system.BizMemberController.add()','POST',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":3,\"classId\":3,\"password\":\"$2a$10$seHSNHWbF6Z6GAigvNAETeO9Xdqc50UBPUe.IB1Jk4EpGEOyAGIxW\",\"schoolId\":1,\"id\":6,\"gradeId\":4,\"majorId\":2,\"params\":{},\"userId\":\"fangfang\",\"createTime\":1651385687678,\"name\":\"芳芳老师\",\"userType\":1,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:14:47'),
	(319,'用户',1,'com.ruoyi.web.controller.system.BizMemberController.add()','POST',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":3,\"classId\":3,\"password\":\"$2a$10$YiFKPGBvgy1e8/WpAx7Hq.Nrb6aqaYffExJqYQ76SwwfYTkDXzhBK\",\"schoolId\":1,\"id\":7,\"gradeId\":4,\"majorId\":2,\"params\":{},\"userId\":\"hehe\",\"createTime\":1651385901823,\"name\":\" 何何\",\"userType\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:18:21'),
	(320,'用户',1,'com.ruoyi.web.controller.system.BizMemberController.add()','POST',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":3,\"classId\":3,\"password\":\"$2a$10$AJxSceiVVirLHYGNfGPa0eO/FtENWXAhO8/fZSeO4qU4ww/Iyl2Qy\",\"schoolId\":1,\"id\":8,\"gradeId\":4,\"majorId\":2,\"params\":{},\"userId\":\"liuliu\",\"createTime\":1651385949999,\"name\":\"刘刘\",\"userType\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:19:10'),
	(321,'教室',2,'com.ruoyi.web.controller.system.BizClassroomController.edit()','PUT',1,'admin',NULL,'/system/classroom','127.0.0.1','内网IP','{\"no\":\"1001\",\"createTime\":1651383532000,\"name\":\"化学教室\",\"updateTime\":1651387500262,\"id\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:45:00'),
	(322,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"0000\",\"classroomId\":2,\"params\":{},\"type\":1,\"createTime\":1651387599889,\"name\":\"教师桌\"}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'0000\' for key \'uk_no\'\n### The error may exist in file [/Users/pholy/gitee/wb-vision-server/ruoyi-system/target/classes/mapper/system/BizDeskMapper.xml]\n### The error may involve com.ruoyi.system.mapper.BizDeskMapper.insertBizDesk-Inline\n### The error occurred while setting parameters\n### SQL: insert into biz_desk          ( name,             no,             classroom_id,             type,             create_time )           values ( ?,             ?,             ?,             ?,             ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'0000\' for key \'uk_no\'\n; Duplicate entry \'0000\' for key \'uk_no\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'0000\' for key \'uk_no\'','2022-05-01 14:46:39'),
	(323,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"0001\",\"classroomId\":2,\"params\":{},\"type\":1,\"createTime\":1651387611174,\"name\":\"教师桌\",\"id\":11}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:46:51'),
	(324,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"001\",\"classroomId\":2,\"params\":{},\"type\":1,\"createTime\":1651387638563,\"name\":\"学生桌01\"}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'001\' for key \'uk_no\'\n### The error may exist in file [/Users/pholy/gitee/wb-vision-server/ruoyi-system/target/classes/mapper/system/BizDeskMapper.xml]\n### The error may involve com.ruoyi.system.mapper.BizDeskMapper.insertBizDesk-Inline\n### The error occurred while setting parameters\n### SQL: insert into biz_desk          ( name,             no,             classroom_id,             type,             create_time )           values ( ?,             ?,             ?,             ?,             ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'001\' for key \'uk_no\'\n; Duplicate entry \'001\' for key \'uk_no\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'001\' for key \'uk_no\'','2022-05-01 14:47:18'),
	(325,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"006\",\"classroomId\":2,\"params\":{},\"type\":1,\"createTime\":1651387646356,\"name\":\"学生桌06\",\"id\":13}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:47:26'),
	(326,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.add()','POST',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"007\",\"classroomId\":2,\"params\":{},\"type\":1,\"createTime\":1651387674340,\"name\":\"学生桌07\",\"id\":14}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:47:54'),
	(327,'桌子',2,'com.ruoyi.web.controller.system.BizDeskController.edit()','PUT',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"006\",\"classroomId\":2,\"updateTime\":1651387681150,\"params\":{},\"type\":2,\"createTime\":1651387646000,\"name\":\"学生桌06\",\"id\":13}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:48:01'),
	(328,'桌子',2,'com.ruoyi.web.controller.system.BizDeskController.edit()','PUT',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"007\",\"classroomId\":2,\"updateTime\":1651387685523,\"params\":{},\"type\":2,\"createTime\":1651387674000,\"name\":\"学生桌07\",\"id\":14}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:48:05'),
	(329,'班级',1,'com.ruoyi.web.controller.system.BizClassController.add()','POST',1,'admin',NULL,'/system/class','127.0.0.1','内网IP','{\"majorId\":2,\"createTime\":1651387774103,\"name\":\"化学1班\",\"id\":4,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:49:34'),
	(330,'课程',1,'com.ruoyi.web.controller.system.BizCourseController.add()','POST',1,'admin',NULL,'/system/course','127.0.0.1','内网IP','{\"createTime\":1651387858620,\"name\":\"化学课程\",\"id\":4,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:50:58'),
	(331,'教学记录',1,'com.ruoyi.web.controller.system.BizTeachingRecordController.add()','POST',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":3,\"gradeId\":4,\"majorId\":2,\"classroomId\":2,\"params\":{},\"duration\":0,\"classId\":4,\"times\":1,\"teacherId\":\"lili\",\"createTime\":1651387899830,\"name\":\"化学实操\",\"id\":7,\"courseId\":4,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:51:39'),
	(332,'教学记录',2,'com.ruoyi.web.controller.system.BizTeachingRecordController.edit()','PUT',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":3,\"gradeId\":4,\"majorId\":2,\"classroomId\":2,\"updateTime\":1651387907073,\"params\":{},\"duration\":0,\"classId\":4,\"times\":2,\"teacherId\":\"lili\",\"createTime\":1651387900000,\"name\":\"化学实操\",\"id\":7,\"courseId\":4,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:51:47'),
	(333,'教学记录',2,'com.ruoyi.web.controller.system.BizTeachingRecordController.edit()','PUT',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":3,\"gradeId\":4,\"majorId\":2,\"classroomId\":2,\"updateTime\":1651387976472,\"params\":{},\"duration\":0,\"classId\":4,\"times\":2,\"teacherId\":\"fangfang\",\"createTime\":1651387900000,\"name\":\"化学实操\",\"id\":7,\"courseId\":4,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:52:56'),
	(334,'教学记录',2,'com.ruoyi.web.controller.system.BizTeachingRecordController.edit()','PUT',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":3,\"gradeId\":4,\"majorId\":2,\"classroomId\":2,\"updateTime\":1651388014515,\"params\":{},\"duration\":0,\"classId\":4,\"times\":2,\"teacherId\":\"lili\",\"createTime\":1651387900000,\"name\":\"化学实操\",\"id\":7,\"courseId\":4,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 14:53:34'),
	(335,'教学记录',2,'com.ruoyi.web.controller.system.BizTeachingRecordController.edit()','PUT',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":3,\"gradeId\":4,\"majorId\":2,\"classroomId\":2,\"updateTime\":1651388422013,\"params\":{},\"duration\":0,\"classId\":4,\"times\":2,\"teacherId\":\"fangfang\",\"createTime\":1651387900000,\"name\":\"化学实操\",\"id\":7,\"courseId\":4,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:00:22'),
	(336,'学院',3,'com.ruoyi.web.controller.system.BizAcademyController.remove()','DELETE',1,'admin',NULL,'/system/academy/3','127.0.0.1','内网IP','{ids=3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:02:01'),
	(337,'专业',2,'com.ruoyi.web.controller.system.BizMajorController.edit()','PUT',1,'admin',NULL,'/system/major','127.0.0.1','内网IP','{\"academyId\":1,\"description\":\"\",\"updateTime\":1651388581267,\"params\":{},\"createTime\":1651383341000,\"name\":\" 应用软件开发专业\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:03:01'),
	(338,'班级',2,'com.ruoyi.web.controller.system.BizClassController.edit()','PUT',1,'admin',NULL,'/system/class','127.0.0.1','内网IP','{\"majorId\":2,\"createTime\":1651383464000,\"name\":\"应用软件开发1班\",\"updateTime\":1651388626528,\"id\":3,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:03:46'),
	(339,'班级',3,'com.ruoyi.web.controller.system.BizClassController.remove()','DELETE',1,'admin',NULL,'/system/class/4','127.0.0.1','内网IP','{ids=4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:03:49'),
	(340,'教室',2,'com.ruoyi.web.controller.system.BizClassroomController.edit()','PUT',1,'admin',NULL,'/system/classroom','127.0.0.1','内网IP','{\"no\":\"1001\",\"createTime\":1651383532000,\"name\":\"科研教学楼-102室\",\"updateTime\":1651388657100,\"id\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:04:17'),
	(341,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"\",\"schoolId\":1,\"id\":2,\"gradeId\":4,\"majorId\":1,\"mobile\":\"135244444111\",\"updateTime\":1651388690287,\"params\":{},\"userId\":\"lili\",\"createTime\":1649961280000,\"name\":\"丽丽老师\",\"userType\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:04:50'),
	(342,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":3,\"password\":\"\",\"schoolId\":1,\"id\":6,\"gradeId\":4,\"majorId\":2,\"updateTime\":1651388704197,\"params\":{},\"userId\":\"fangfang\",\"createTime\":1651385688000,\"name\":\"芳芳老师\",\"userType\":1,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:05:04'),
	(343,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":3,\"password\":\"\",\"schoolId\":1,\"id\":7,\"gradeId\":4,\"majorId\":2,\"updateTime\":1651388768527,\"params\":{},\"userId\":\"hehe\",\"createTime\":1651385902000,\"name\":\" 何何\",\"userType\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:06:08'),
	(344,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":3,\"password\":\"\",\"schoolId\":1,\"id\":8,\"gradeId\":4,\"majorId\":2,\"updateTime\":1651388777065,\"params\":{},\"userId\":\"liuliu\",\"createTime\":1651385950000,\"name\":\"刘刘\",\"userType\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:06:17'),
	(345,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"\",\"schoolId\":1,\"id\":1,\"gradeId\":4,\"majorId\":1,\"mobile\":\"135511222111\",\"updateTime\":1651388800290,\"avatar\":\"http://localhost:8080/profile/upload/2022/04/26/WechatIMG1461_20220426235033A001.jpeg\",\"params\":{},\"userId\":\"zhangsan\",\"createTime\":1649690569000,\"name\":\"张三\",\"userType\":2,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:06:40'),
	(346,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"\",\"schoolId\":1,\"id\":5,\"gradeId\":4,\"majorId\":1,\"updateTime\":1651388814702,\"params\":{},\"userId\":\"lisi\",\"createTime\":1651383666000,\"name\":\"李四\",\"userType\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:06:54'),
	(347,'用户',3,'com.ruoyi.web.controller.system.BizMemberController.remove()','DELETE',1,'admin',NULL,'/system/member/3,4','127.0.0.1','内网IP','{ids=3,4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:07:04'),
	(348,'课程',2,'com.ruoyi.web.controller.system.BizCourseController.edit()','PUT',1,'admin',NULL,'/system/course','127.0.0.1','内网IP','{\"createTime\":1651383720000,\"name\":\"应用软件与开发课程\",\"description\":\"\",\"updateTime\":1651388866952,\"id\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:07:47'),
	(349,'课程',3,'com.ruoyi.web.controller.system.BizCourseController.remove()','DELETE',1,'admin',NULL,'/system/course/3,4','127.0.0.1','内网IP','{ids=3,4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:07:54'),
	(350,'教学记录',2,'com.ruoyi.web.controller.system.BizTeachingRecordController.edit()','PUT',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"updateTime\":1651388887473,\"params\":{},\"id\":6,\"status\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:08:07'),
	(351,'教学记录',2,'com.ruoyi.web.controller.system.BizTeachingRecordController.edit()','PUT',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"updateTime\":1651388890641,\"params\":{},\"id\":7,\"status\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:08:10'),
	(352,'教学记录',3,'com.ruoyi.web.controller.system.BizTeachingRecordController.remove()','DELETE',1,'admin',NULL,'/system/teachingRecord/6,7','127.0.0.1','内网IP','{ids=6,7}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:08:18'),
	(353,'教学记录',1,'com.ruoyi.web.controller.system.BizTeachingRecordController.add()','POST',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":4,\"majorId\":1,\"classroomId\":1,\"params\":{},\"duration\":0,\"classId\":2,\"times\":1,\"teacherId\":\"lili\",\"createTime\":1651388950300,\"name\":\"计算机操作1课\",\"id\":8,\"courseId\":1,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:09:10'),
	(354,'教学记录',1,'com.ruoyi.web.controller.system.BizTeachingRecordController.add()','POST',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":4,\"majorId\":2,\"classroomId\":2,\"params\":{},\"duration\":0,\"classId\":3,\"times\":1,\"teacherId\":\"fangfang\",\"createTime\":1651388977782,\"name\":\"应用软件与开发1课\",\"id\":9,\"courseId\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:09:37'),
	(355,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:10:49'),
	(356,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:10:59'),
	(357,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:13:31'),
	(358,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:13:46'),
	(359,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:14:55'),
	(360,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:17:12'),
	(361,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":6,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:17:25'),
	(362,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":7,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:22:22'),
	(363,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":8,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:22:31'),
	(364,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":5,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:22:39'),
	(365,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":7,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:23:05'),
	(366,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":7,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:27:39'),
	(367,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":7,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:28:25'),
	(368,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:28:33'),
	(369,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:28:42'),
	(370,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/13/bind','127.0.0.1','内网IP','{\"classroomId\":2,\"params\":{},\"deviceId\":3,\"createTime\":1651390479682,\"id\":23,\"deskId\":13}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:34:39'),
	(371,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/13/bind','127.0.0.1','内网IP','{\"classroomId\":2,\"params\":{},\"deviceId\":1,\"createTime\":1651390486223,\"id\":24,\"deskId\":13}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:34:46'),
	(372,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/14/bind','127.0.0.1','内网IP','{\"classroomId\":2,\"params\":{},\"deviceId\":1,\"createTime\":1651390490626,\"id\":25,\"deskId\":14}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:34:50'),
	(373,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/14/bind','127.0.0.1','内网IP','{\"classroomId\":2,\"params\":{},\"deviceId\":3,\"createTime\":1651390495193,\"id\":26,\"deskId\":14}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:34:55'),
	(374,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/11/bind','127.0.0.1','内网IP','{\"classroomId\":2,\"params\":{},\"deviceId\":3,\"createTime\":1651390504717,\"id\":27,\"deskId\":11}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:35:04'),
	(375,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/11/bind','127.0.0.1','内网IP','{\"classroomId\":2,\"params\":{},\"deviceId\":1,\"createTime\":1651390510997,\"id\":28,\"deskId\":11}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:35:11'),
	(376,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/11/bind','127.0.0.1','内网IP','{\"classroomId\":2,\"params\":{},\"deviceId\":4,\"createTime\":1651390516807,\"id\":29,\"deskId\":11}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:35:16'),
	(377,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/9/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":1,\"createTime\":1651390533798,\"id\":30,\"deskId\":9}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:35:33'),
	(378,'桌子',1,'com.ruoyi.web.controller.system.BizDeskController.bind()','POST',1,'admin',NULL,'/system/desk/9/bind','127.0.0.1','内网IP','{\"classroomId\":1,\"params\":{},\"deviceId\":3,\"createTime\":1651390541663,\"id\":31,\"deskId\":9}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-01 15:35:41'),
	(379,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":3,\"schoolId\":1,\"id\":7,\"gradeId\":4,\"majorId\":2,\"updateTime\":1651494196784,\"avatar\":\"http://localhost:8080/profile/upload/2022/05/02/头像hehe_20220502202315A001.jpeg\",\"params\":{},\"userId\":\"hehe\",\"createTime\":1651385902000,\"name\":\" 何何\",\"userType\":2,\"status\":0}',NULL,1,'com.ruoyi.common.exception.ServiceException: \n{error code: (0x80000000|1061).参考  NetSDKLib.java } - {error info:未知错误}\n','2022-05-02 20:23:17'),
	(380,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":3,\"schoolId\":1,\"id\":7,\"gradeId\":4,\"majorId\":2,\"updateTime\":1651494216583,\"avatar\":\"http://localhost:8080/profile/upload/2022/05/02/头像hehe_20220502202315A001.jpeg\",\"params\":{},\"userId\":\"hehe\",\"createTime\":1651385902000,\"name\":\" 何何\",\"userType\":2,\"status\":0}',NULL,1,'com.ruoyi.common.exception.ServiceException: \n{error code: (0x80000000|1061).参考  NetSDKLib.java } - {error info:未知错误}\n','2022-05-02 20:23:36'),
	(381,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":3,\"schoolId\":1,\"id\":7,\"gradeId\":4,\"majorId\":2,\"updateTime\":1651494338915,\"avatar\":\"http://localhost:8080/profile/upload/2022/05/02/头像呵呵_20220502202538A002.jpeg\",\"params\":{},\"userId\":\"hehe\",\"createTime\":1651385902000,\"name\":\" 何何\",\"userType\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-02 20:25:39'),
	(382,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"schoolId\":1,\"id\":5,\"gradeId\":4,\"majorId\":1,\"updateTime\":1651494715467,\"avatar\":\"http://localhost:8080/profile/upload/2022/05/02/大佬头像_20220502203153A003.jpeg\",\"params\":{},\"userId\":\"lisi\",\"createTime\":1651383666000,\"name\":\"李四\",\"userType\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-02 20:31:55'),
	(383,'教学记录',1,'com.ruoyi.web.controller.system.BizTeachingRecordController.add()','POST',1,'admin',NULL,'/system/teachingRecord','127.0.0.1','内网IP','{\"academyId\":1,\"gradeId\":4,\"majorId\":1,\"classroomId\":1,\"params\":{},\"duration\":0,\"classId\":2,\"times\":1,\"teacherId\":\"lili\",\"createTime\":1651509410925,\"name\":\"测试搜索资源\",\"id\":10,\"courseId\":1,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 00:36:50'),
	(384,'课程',2,'com.ruoyi.web.controller.system.BizCourseController.edit()','PUT',1,'admin',NULL,'/system/course','127.0.0.1','内网IP','{\"description\":\"汽车发动机实操，带你见证发动机\",\"updateTime\":1651666698389,\"params\":{},\"classId\":2,\"createTime\":1649959016000,\"name\":\"汽车发动机实操\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-04 20:18:18'),
	(385,'课程',2,'com.ruoyi.web.controller.system.BizCourseController.edit()','PUT',1,'admin',NULL,'/system/course','127.0.0.1','内网IP','{\"majorId\":1,\"description\":\"汽车发动机实操，带你见证发动机\",\"updateTime\":1651667269348,\"params\":{},\"classId\":2,\"createTime\":1649959016000,\"name\":\"汽车发动机实操\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-04 20:27:49'),
	(386,'课程',2,'com.ruoyi.web.controller.system.BizCourseController.edit()','PUT',1,'admin',NULL,'/system/course','127.0.0.1','内网IP','{\"majorId\":2,\"description\":\"\",\"updateTime\":1651667637093,\"params\":{},\"classId\":3,\"createTime\":1651383720000,\"name\":\"应用软件与开发课程\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-04 20:33:57'),
	(387,'桌子',2,'com.ruoyi.web.controller.system.BizDeskController.edit()','PUT',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"003\",\"classroomId\":1,\"updateTime\":1651683533027,\"params\":{},\"type\":2,\"createTime\":1651159362000,\"name\":\"学生桌003\",\"id\":8}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-05 00:58:53'),
	(388,'桌子',2,'com.ruoyi.web.controller.system.BizDeskController.edit()','PUT',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"004\",\"classroomId\":1,\"updateTime\":1651683538706,\"params\":{},\"type\":2,\"createTime\":1651383911000,\"name\":\"学生桌005\",\"id\":9}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-05 00:58:58'),
	(389,'用户',2,'com.ruoyi.web.controller.system.BizMemberController.editPwd()','PUT',1,'admin',NULL,'/system/member/pwd','127.0.0.1','内网IP','{\"password\":\"11111\",\"id\":5,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-05 01:04:08'),
	(390,'用户',1,'com.ruoyi.web.controller.system.BizMemberController.add()','POST',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"academyId\":1,\"classId\":2,\"password\":\"$2a$10$oP2kupB9FTD5yJV2qUbZouhPYrY6KljbKJWgFodPgAvzQy0/oEorO\",\"schoolId\":1,\"id\":9,\"gradeId\":4,\"majorId\":1,\"params\":{},\"userId\":\"wangwu\",\"createTime\":1651684176690,\"name\":\"王五\",\"userType\":2,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-05 01:09:36'),
	(391,'桌子',2,'com.ruoyi.web.controller.system.BizDeskController.edit()','PUT',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"003\",\"classroomId\":1,\"updateTime\":1651684254815,\"params\":{},\"type\":2,\"createTime\":1651159362000,\"name\":\"学生桌0033\",\"id\":8}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-05 01:10:54'),
	(392,'桌子',2,'com.ruoyi.web.controller.system.BizDeskController.edit()','PUT',1,'admin',NULL,'/system/desk','127.0.0.1','内网IP','{\"no\":\"003\",\"classroomId\":1,\"updateTime\":1651684265916,\"params\":{},\"type\":2,\"createTime\":1651159362000,\"name\":\"学生桌003\",\"id\":8}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-05 01:11:05');

/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位信息表';

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;

INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'ceo','董事长',1,'0','admin','2022-04-10 15:13:48','',NULL,''),
	(2,'se','项目经理',2,'0','admin','2022-04-10 15:13:50','',NULL,''),
	(3,'hr','人力资源',3,'0','admin','2022-04-10 15:13:50','',NULL,''),
	(4,'user','普通员工',4,'0','admin','2022-04-10 15:13:50','',NULL,'');

/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色信息表';

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2022-04-10 15:13:50','',NULL,'超级管理员'),
	(2,'普通角色','common',2,'2',1,1,'0','0','admin','2022-04-10 15:13:50','',NULL,'普通角色');

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和部门关联表';

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;

INSERT INTO `sys_role_dept` (`role_id`, `dept_id`)
VALUES
	(2,100),
	(2,101),
	(2,105);

/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和菜单关联表';

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;

INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES
	(2,1),
	(2,2),
	(2,3),
	(2,4),
	(2,100),
	(2,101),
	(2,102),
	(2,103),
	(2,104),
	(2,105),
	(2,106),
	(2,107),
	(2,108),
	(2,109),
	(2,110),
	(2,111),
	(2,112),
	(2,113),
	(2,114),
	(2,115),
	(2,116),
	(2,500),
	(2,501),
	(2,1000),
	(2,1001),
	(2,1002),
	(2,1003),
	(2,1004),
	(2,1005),
	(2,1006),
	(2,1007),
	(2,1008),
	(2,1009),
	(2,1010),
	(2,1011),
	(2,1012),
	(2,1013),
	(2,1014),
	(2,1015),
	(2,1016),
	(2,1017),
	(2,1018),
	(2,1019),
	(2,1020),
	(2,1021),
	(2,1022),
	(2,1023),
	(2,1024),
	(2,1025),
	(2,1026),
	(2,1027),
	(2,1028),
	(2,1029),
	(2,1030),
	(2,1031),
	(2,1032),
	(2,1033),
	(2,1034),
	(2,1035),
	(2,1036),
	(2,1037),
	(2,1038),
	(2,1039),
	(2,1040),
	(2,1041),
	(2,1042),
	(2,1043),
	(2,1044),
	(2,1045),
	(2,1046),
	(2,1047),
	(2,1048),
	(2,1049),
	(2,1050),
	(2,1051),
	(2,1052),
	(2,1053),
	(2,1054),
	(2,1055),
	(2,1056),
	(2,1057),
	(2,1058),
	(2,1059),
	(2,1060);

/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,103,'admin','若依','00','ry@163.com','15888888888','1','/profile/avatar/2022/04/26/blob_20220426224908A001.jpeg','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2022-05-04 19:03:34','admin','2022-04-10 15:13:48','','2022-05-04 19:03:33','管理员'),
	(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2022-04-10 15:13:48','admin','2022-04-10 15:13:48','',NULL,'测试员');

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户与岗位关联表';

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;

INSERT INTO `sys_user_post` (`user_id`, `post_id`)
VALUES
	(1,1),
	(2,2);

/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户和角色关联表';

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;

INSERT INTO `sys_user_role` (`user_id`, `role_id`)
VALUES
	(1,1),
	(2,2);

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
