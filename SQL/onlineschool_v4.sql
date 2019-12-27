/*
 Navicat Premium Data Transfer

 Source Server         : online
 Source Server Type    : MariaDB
 Source Server Version : 50564
 Source Host           : 106.54.23.221:3306
 Source Schema         : onlineschool_v4

 Target Server Type    : MariaDB
 Target Server Version : 50564
 File Encoding         : 65001

 Date: 27/12/2019 23:12:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_info_admin_name_uindex` (`admin_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_info
-- ----------------------------
BEGIN;
INSERT INTO `admin_info` VALUES (1, 'cjmHK', '12345678');
COMMIT;

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chapter_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT NULL,
  `is_like` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhhaina8rg7bpmg1qesiluu8vu` (`course_id`),
  CONSTRAINT `course_id_PK` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKhhaina8rg7bpmg1qesiluu8vu` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of chapter
-- ----------------------------
BEGIN;
INSERT INTO `chapter` VALUES (1, '第1程介绍', '(所有term指定这个chapter)', 1, NULL, NULL, NULL);
INSERT INTO `chapter` VALUES (2, '第2章 Vue基础语法', '本章节通过浅显易懂的实例来给大家讲解Vue2.0的基本语法，包含计算属性，侦听器，基础模版指令等。', 1, NULL, NULL, NULL);
INSERT INTO `chapter` VALUES (3, '第3章 Vue中的组件', '本章节讲解Vue中组件的概念和使用，结合对组件的完整理解，我们还将做一个TodoList功能模块。', 1, NULL, NULL, NULL);
INSERT INTO `chapter` VALUES (4, '第4章 Vue-cli的使用', '本章节我们讲给大家介绍如何使用Vue-cli脚手架工具构建项目，并讲解单文件组件和局部全局样式的知识。', 1, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `user_id` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tern_id` int(11) NOT NULL,
  `up_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`comment_id`) USING BTREE,
  KEY `FK_com_user` (`user_id`),
  KEY `FK_com_term` (`tern_id`),
  CONSTRAINT `FK_com_term` FOREIGN KEY (`tern_id`) REFERENCES `term` (`id`),
  CONSTRAINT `FK_com_user` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (53, '评论测试1', 1, '2019-12-25 01:20:11.000000', 1);
INSERT INTO `comment` VALUES (53, '<span class=\"emoji-item-common emoji-angry emoji-size-small\" ></span><span class=\"emoji-item-common emoji-anguished emoji-size-small\" ></span><span class=\"emoji-item-common emoji-astonished emoji-size-small\" ></span>', 1, '2019-12-25 01:21:08.000000', 11);
INSERT INTO `comment` VALUES (53, '我来试试评论<span class=\"emoji-item-common emoji-relaxed emoji-size-small\" ></span><span class=\"emoji-item-common emoji-relaxed emoji-size-small\" ></span>', 5, '2019-12-25 19:40:21.000000', 12);
INSERT INTO `comment` VALUES (1, 'aaa', 1, '2019-12-25 20:23:10.674032', 13);
INSERT INTO `comment` VALUES (1, 'aaa', 1, '2019-12-25 20:23:25.321694', 14);
INSERT INTO `comment` VALUES (60, '点赞！', 4, '2019-12-25 21:15:44.182268', 15);
INSERT INTO `comment` VALUES (60, '!', 1, '2019-12-25 22:55:22.816149', 18);
INSERT INTO `comment` VALUES (53, '我也来点个赞！<span class=\"emoji-item-common emoji-blush emoji-size-small\" ></span>', 4, '2019-12-25 23:09:27.780079', 19);
INSERT INTO `comment` VALUES (1, '测试<span class=\"emoji-item-common emoji-angry emoji-size-small\" ></span><span class=\"emoji-item-common emoji-angry emoji-size-small\" ></span><span class=\"emoji-item-common emoji-angry emoji-size-small\" ></span>', 16, '2019-12-25 23:23:41.188977', 20);
INSERT INTO `comment` VALUES (1, 'abc', 45, '2019-12-26 09:26:13.875547', 21);
INSERT INTO `comment` VALUES (1, '', 45, '2019-12-26 09:26:21.859280', 22);
INSERT INTO `comment` VALUES (1, '<span class=\"emoji-item-common emoji-anguished emoji-size-small\" ></span><span class=\"emoji-item-common emoji-anguished emoji-size-small\" ></span><span class=\"emoji-item-common emoji-anguished emoji-size-small\" ></span>test', 21, '2019-12-26 14:21:25.338335', 23);
INSERT INTO `comment` VALUES (1, 'wuruofeng<span class=\"emoji-item-common emoji-astonished emoji-size-small\" ></span><span class=\"emoji-item-common emoji-astonished emoji-size-small\" ></span>', 16, '2019-12-26 16:05:08.433855', 24);
COMMIT;

-- ----------------------------
-- Table structure for cost_record
-- ----------------------------
DROP TABLE IF EXISTS `cost_record`;
CREATE TABLE `cost_record` (
  `user_id` int(11) NOT NULL,
  `up_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` decimal(10,0) DEFAULT NULL,
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`record_id`),
  KEY `PK_record_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cost_record
-- ----------------------------
BEGIN;
INSERT INTO `cost_record` VALUES (1, '2019-12-25 19:45:02.933322', '开通会员', 999, 3);
INSERT INTO `cost_record` VALUES (1, '2019-12-25 19:54:05.967820', '开通会员', 999, 4);
INSERT INTO `cost_record` VALUES (58, '2019-12-25 20:19:29.108549', '开通会员', 999, 5);
INSERT INTO `cost_record` VALUES (59, '2019-12-25 20:51:10.467826', '开通会员', 999, 6);
INSERT INTO `cost_record` VALUES (61, '2019-12-25 21:15:29.216838', '开通会员', 999, 7);
INSERT INTO `cost_record` VALUES (62, '2019-12-25 21:23:13.866417', '开通会员', 999, 8);
INSERT INTO `cost_record` VALUES (64, '2019-12-26 09:04:58.019281', '开通会员', 999, 10);
INSERT INTO `cost_record` VALUES (65, '2019-12-26 09:06:15.778842', '开通会员', 999, 11);
INSERT INTO `cost_record` VALUES (66, '2019-12-26 09:08:18.121822', '开通会员', 999, 12);
INSERT INTO `cost_record` VALUES (67, '2019-12-26 14:17:31.412954', '开通会员', 999, 13);
COMMIT;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `is_like` tinyint(1) DEFAULT NULL,
  `rank` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `course_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `is_complete` tinyint(1) DEFAULT '0',
  `praise` int(255) DEFAULT '100',
  `short_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`course_id`) USING BTREE,
  KEY `FKsybhlxoejr4j3teomm5u2bx1n` (`teacher_id`),
  CONSTRAINT `FKsybhlxoejr4j3teomm5u2bx1n` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` VALUES (1, 'Java虚拟机线程调度', 'https://image.boxueio.com/3-swift-make-a-decision@2x.png', NULL, 1, '入门', 1052903, '过程式编程是代码难以测试、阅读和重用的根源。当你面对业务需求，想的却是循环和局部变量时，你要知道，一定有更好的办法去解决。', 52, 1, 1, 'Behind the Scene');
INSERT INTO `course` VALUES (32, '什么是多态？', 'https://image.boxueio.com/never-repeat-loops-cover@2x-583c1d42606a6aa0b53e58331236361c.jpg', 0.00, 0, '入门', 1052903, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 0, 1, 'Behind the Scene');
INSERT INTO `course` VALUES (33, 'Java入门第一季', 'https://image.boxueio.com/es2015-series@2x-8290e9c280118fc4e73080b33a058c04.jpg', 0.00, 0, '入门', 995424, '如何从简单的返回结果到逐步完善一套REST API的实现细节？这个系列就基于Laravel 5.3，带着你你一个个解决潜在的设计问题，并逐步完善它们。', 1, 1, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (34, 'Java入门第二季', 'https://image.boxueio.com/js-is-hard-cover@2x-a51fbfb4d4c0853240881da98be41d49.png', 0.00, 1, '入门', 744695, 'JavaScript在其最新的标准ECMA Script 2015里究竟为我们带来了哪些一定要了解的特性？如何“务实”的掌握它们？从这个系列下手，就好了。', 1, 1, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (35, 'Java入门第三季', 'https://image.boxueio.com/http_api_cover@2x-463d637655864539ea06c811a0db354d.jpg', 0.00, 1, '入门', 664112, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 1, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (36, 'Java的那些事儿', 'https://image.boxueio.com/functional-css-cover@2x-ae0b42d8aa9e5d38483fcef9c929ba46.png', 255.90, 0, '入门', 656777, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 0, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (37, '浅谈Java虚拟机', 'https://image.boxueio.com/sketch-basic-cover@2x.jpg', 255.90, 1, '入门', 575769, '很多时候，我们需要在客户端和服务器之间实时发送消息。我们将通过Socket.io / Laravel / Redis向大家演示相关技术的实现方法。', 1, 1, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (38, 'Java之心', 'https://image.boxueio.com/vapor-up-and-running-cover@2x.jpg', 0.00, 0, '入门', 473071, '提起CSS，这绝对是页面前端开发中最让人头疼的环节。对页面内容的调整，对UI的重用需求，都影响着CSS的编写方式。那么，如何更高效的编写可重用的CSS呢？', 1, 0, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (39, 'Swift 3 的第一印象', 'https://image.boxueio.com/1-swift-up-and-running@2x.png', 255.90, 0, '入门', 426026, '过程式编程是代码难以测试、阅读和重用的根源。当你面对业务需求，想的却是循环和局部变量时，你要知道，一定有更好的办法去解决。', 1, 0, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (40, 'Swift 3 Collections', 'https://image.boxueio.com/2-swift-coll@2x.png', 255.90, 1, '入门', 417428, '过程式编程是代码难以测试、阅读和重用的根源。当你面对业务需求，想的却是循环和局部变量时，你要知道，一定有更好的办法去解决。', 1, 0, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (41, '为代码的执行做个决定', 'https://image.boxueio.com/3-swift-make-a-decision@2x.png', 255.90, 0, '入门', 664112, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 0, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (42, '使用func和closure加工数据', 'https://image.boxueio.com/5-swift-functions@2x.png', 255.90, 0, '入门', 656777, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 0, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (43, '它叫Optional, 却必不可少', 'https://image.boxueio.com/4-swift-optionals@2x.png', 0.00, 1, '入门', 357762, '如何从简单的返回结果到逐步完善一套REST API的实现细节？这个系列就基于Laravel 5.3，带着你你一个个解决潜在的设计问题，并逐步完善它们。', 1, 0, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (44, '理解值语义的自定义类型', 'https://image.boxueio.com/7-swift-value-type@2x.png', 255.90, 0, '入门', 1052903, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 0, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (45, '用Python入门机器学习', 'https://image.boxueio.com/python-guide-avatar@2x.jpg', 255.90, 0, '入门', 995424, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 0, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (46, 'Python 101', 'https://image.boxueio.com/understand-python-cover@2x-678257204b60aaf3ef0e8ed1c766d416.jpg', 255.90, 1, '入门', 744695, '提起CSS，这绝对是页面前端开发中最让人头疼的环节。对页面内容的调整，对UI的重用需求，都影响着CSS的编写方式。那么，如何更高效的编写可重用的CSS呢？', 1, 0, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (47, 'Machine Learning 101', 'https://image.boxueio.com/ml-cover@2x-643c2558c95ff1e6c58e56981e8fabe5.jpg', 0.00, 0, '入门', 664112, '过程式编程是代码难以测试、阅读和重用的根源。当你面对业务需求，想的却是循环和局部变量时，你要知道，一定有更好的办法去解决。', 1, 0, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (48, 'Crash course of NumPy', 'https://image.boxueio.com/crash-course-numpy-cover@2x-868e0cce80636d682599bef942a17897.png', 255.90, 0, '入门', 656777, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 1, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (49, 'Crash course of Pandas', 'https://image.boxueio.com/crash-course-dataframe@2x-564f10547ca2c30b9cb0f30ad9b4ca83.png', 255.90, 1, '入门', 575769, '过程式编程是代码难以测试、阅读和重用的根源。当你面对业务需求，想的却是循环和局部变量时，你要知道，一定有更好的办法去解决。', 1, 1, 1, 'Behind the Scene');
INSERT INTO `course` VALUES (50, '从零开始的机器学习项目', 'https://image.boxueio.com/YourFirstMLProject@2x-911fdc56906f05fc0757e5577084c840.jpg', 0.00, 0, '入门', 473071, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 1, 1, 'Behind the Scene');
INSERT INTO `course` VALUES (51, 'Crash course of Pandas', 'https://image.boxueio.com/crash-course-dataframe@2x-564f10547ca2c30b9cb0f30ad9b4ca83.png', 255.90, 1, '入门', 575769, '过程式编程是代码难以测试、阅读和重用的根源。当你面对业务需求，想的却是循环和局部变量时，你要知道，一定有更好的办法去解决。', 1, 1, 1, 'Behind the Scene');
INSERT INTO `course` VALUES (53, '从零开始的机器学习项目', 'https://image.boxueio.com/YourFirstMLProject@2x-911fdc56906f05fc0757e5577084c840.jpg', 0.00, 0, '入门', 473071, '学python入门视频教程，让你快速入门并能编写简单的Python程序', 1, 1, 1, 'Behind the Scene');
INSERT INTO `course` VALUES (54, 'Crash course of NumPy', 'https://image.boxueio.com/crash-course-numpy-cover@2x-868e0cce80636d682599bef942a17897.png', 255.90, 0, '入门', 656777, '过程式编程是代码难以测试、阅读和重用的根源。当你面对业务需求，想的却是循环和局部变量时，你要知道，一定有更好的办法去解决。', 1, 1, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (55, 'Crash course of Pandas', 'https://image.boxueio.com/crash-course-dataframe@2x-564f10547ca2c30b9cb0f30ad9b4ca83.png', 255.90, 1, '入门', 575769, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 1, 1, 'Behind the Scene');
INSERT INTO `course` VALUES (56, '从零开始的机器学习项目', 'https://image.boxueio.com/YourFirstMLProject@2x-911fdc56906f05fc0757e5577084c840.jpg', 0.00, 0, '入门', 473071, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 1, 1, 'Behind the Scene');
INSERT INTO `course` VALUES (57, 'Crash course of NumPy', 'https://image.boxueio.com/crash-course-numpy-cover@2x-868e0cce80636d682599bef942a17897.png', 255.90, 0, '入门', 656777, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 1, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (58, 'Crash course of Pandas', 'https://image.boxueio.com/crash-course-dataframe@2x-564f10547ca2c30b9cb0f30ad9b4ca83.png', 255.90, 1, '入门', 575769, '过程式编程是代码难以测试、阅读和重用的根源。当你面对业务需求，想的却是循环和局部变量时，你要知道，一定有更好的办法去解决。', 1, 1, 1, 'Behind the Scene');
INSERT INTO `course` VALUES (59, '从零开始的机器学习项目', 'https://image.boxueio.com/YourFirstMLProject@2x-911fdc56906f05fc0757e5577084c840.jpg', 0.00, 0, '入门', 473071, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 1, 1, 'Behind the Scene');
INSERT INTO `course` VALUES (60, 'Crash course of NumPy', 'https://image.boxueio.com/crash-course-numpy-cover@2x-868e0cce80636d682599bef942a17897.png', 255.90, 0, '入门', 656777, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 1, 0, 'Behind the Scene');
INSERT INTO `course` VALUES (61, 'Crash course of Pandas', 'https://image.boxueio.com/crash-course-dataframe@2x-564f10547ca2c30b9cb0f30ad9b4ca83.png', 255.90, 1, '入门', 575769, '过程式编程是代码难以测试、阅读和重用的根源。当你面对业务需求，想的却是循环和局部变量时，你要知道，一定有更好的办法去解决。', 1, 1, 1, 'Behind the Scene');
INSERT INTO `course` VALUES (62, '从零开始的机器学习项目', 'https://image.boxueio.com/YourFirstMLProject@2x-911fdc56906f05fc0757e5577084c840.jpg', 0.00, 0, '入门', 473071, '绝大多数人，都不真正了解这门语言中最令人困惑的一些内容。因此，我们将从JavaScript语言自身的层面为切入点，帮助大家深入理解这门编程语言的核心运作机制。', 1, 1, 1, 'Behind the Scene');
COMMIT;

-- ----------------------------
-- Table structure for course_tag
-- ----------------------------
DROP TABLE IF EXISTS `course_tag`;
CREATE TABLE `course_tag` (
  `course_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `elt` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`tag_id`),
  KEY `FKj7piuv0dh0v01l3aolwwd1jwh` (`tag_id`),
  CONSTRAINT `course_pk` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK3tta6lkm8fr0rgfyr4y3xrr3u` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKj7piuv0dh0v01l3aolwwd1jwh` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tag_pk` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of course_tag
-- ----------------------------
BEGIN;
INSERT INTO `course_tag` VALUES (1, 1, 0);
INSERT INTO `course_tag` VALUES (1, 18, 0);
INSERT INTO `course_tag` VALUES (32, 1, 0);
INSERT INTO `course_tag` VALUES (32, 2, 0);
INSERT INTO `course_tag` VALUES (32, 18, 0);
INSERT INTO `course_tag` VALUES (33, 2, 0);
INSERT INTO `course_tag` VALUES (33, 18, 0);
INSERT INTO `course_tag` VALUES (34, 1, 0);
INSERT INTO `course_tag` VALUES (34, 18, 0);
INSERT INTO `course_tag` VALUES (35, 2, 0);
INSERT INTO `course_tag` VALUES (35, 18, 0);
INSERT INTO `course_tag` VALUES (36, 1, 0);
INSERT INTO `course_tag` VALUES (36, 18, 0);
INSERT INTO `course_tag` VALUES (37, 2, 0);
INSERT INTO `course_tag` VALUES (37, 18, 0);
INSERT INTO `course_tag` VALUES (38, 1, 0);
INSERT INTO `course_tag` VALUES (38, 18, 0);
INSERT INTO `course_tag` VALUES (39, 2, 0);
INSERT INTO `course_tag` VALUES (39, 32, 0);
INSERT INTO `course_tag` VALUES (40, 1, 0);
INSERT INTO `course_tag` VALUES (40, 32, 0);
INSERT INTO `course_tag` VALUES (41, 2, 0);
INSERT INTO `course_tag` VALUES (41, 32, 0);
INSERT INTO `course_tag` VALUES (42, 1, 0);
INSERT INTO `course_tag` VALUES (42, 32, 0);
INSERT INTO `course_tag` VALUES (43, 2, 0);
INSERT INTO `course_tag` VALUES (43, 32, 0);
INSERT INTO `course_tag` VALUES (44, 1, 0);
INSERT INTO `course_tag` VALUES (44, 32, 0);
INSERT INTO `course_tag` VALUES (45, 2, 0);
INSERT INTO `course_tag` VALUES (45, 21, 0);
INSERT INTO `course_tag` VALUES (46, 1, 0);
INSERT INTO `course_tag` VALUES (46, 21, 0);
INSERT INTO `course_tag` VALUES (47, 2, 0);
INSERT INTO `course_tag` VALUES (47, 21, 0);
INSERT INTO `course_tag` VALUES (48, 1, 0);
INSERT INTO `course_tag` VALUES (48, 21, 0);
INSERT INTO `course_tag` VALUES (49, 2, 0);
INSERT INTO `course_tag` VALUES (49, 21, 0);
INSERT INTO `course_tag` VALUES (50, 1, 0);
INSERT INTO `course_tag` VALUES (50, 21, 0);
INSERT INTO `course_tag` VALUES (51, 21, 0);
COMMIT;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tag_id`) USING BTREE,
  KEY `FK3n0acrkovvaap7h5ej46oyy9s` (`type_id`),
  CONSTRAINT `FK3n0acrkovvaap7h5ej46oyy9s` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `type_id_PK` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tag
-- ----------------------------
BEGIN;
INSERT INTO `tag` VALUES (1, 'CSS', 'CSS', 1);
INSERT INTO `tag` VALUES (2, 'HTML', 'HTML', 1);
INSERT INTO `tag` VALUES (3, 'HTML/CSS', 'HTML/CSS', 1);
INSERT INTO `tag` VALUES (4, 'JavaScript', 'JavaScript', 1);
INSERT INTO `tag` VALUES (5, 'Vue.js', 'Vue.js', 1);
INSERT INTO `tag` VALUES (6, 'React.JS', 'React.JS', 1);
INSERT INTO `tag` VALUES (7, 'Angular', 'Angular', 1);
INSERT INTO `tag` VALUES (8, 'Node.js', 'Node.js', 1);
INSERT INTO `tag` VALUES (9, 'jQuery', 'jQuery', 1);
INSERT INTO `tag` VALUES (10, 'Bootstrap', 'Bootstrap', 1);
INSERT INTO `tag` VALUES (11, 'Sass/Less', 'Sass/Less', 1);
INSERT INTO `tag` VALUES (12, 'WebApp', 'WebApp', 1);
INSERT INTO `tag` VALUES (13, '小程序', '小程序', 1);
INSERT INTO `tag` VALUES (14, '前端工具', '前端工具', 1);
INSERT INTO `tag` VALUES (15, 'CSS', 'CSS', 1);
INSERT INTO `tag` VALUES (16, 'Html5', 'Html5', 1);
INSERT INTO `tag` VALUES (17, 'CSS3', 'CSS3', 1);
INSERT INTO `tag` VALUES (18, 'Java', 'Java', 2);
INSERT INTO `tag` VALUES (19, 'SpringBoot', 'SpringBoot', 2);
INSERT INTO `tag` VALUES (20, 'Spring Cloud', 'Spring Cloud', 2);
INSERT INTO `tag` VALUES (21, 'Python', 'Python', 2);
INSERT INTO `tag` VALUES (22, '爬虫', '爬虫', 2);
INSERT INTO `tag` VALUES (23, 'Django', 'Django', 2);
INSERT INTO `tag` VALUES (24, 'Tornado', 'Tornado', 2);
INSERT INTO `tag` VALUES (25, 'Go', 'Go', 2);
INSERT INTO `tag` VALUES (26, 'PHP', 'PHP', 2);
INSERT INTO `tag` VALUES (27, 'C', 'C', 2);
INSERT INTO `tag` VALUES (28, 'C++', 'C++', 2);
INSERT INTO `tag` VALUES (29, 'C#', 'C#', 2);
INSERT INTO `tag` VALUES (30, 'Ruby', 'Ruby', 2);
INSERT INTO `tag` VALUES (31, 'Android', 'Android', 3);
INSERT INTO `tag` VALUES (32, 'iOS', 'iOS', 3);
INSERT INTO `tag` VALUES (33, 'React native', 'React native', 3);
INSERT INTO `tag` VALUES (34, 'WEEX', 'WEEX', 3);
INSERT INTO `tag` VALUES (35, '算法与数据结构', '算法与数据结构', 4);
INSERT INTO `tag` VALUES (36, '数学', '数学', 4);
INSERT INTO `tag` VALUES (37, '算法', '算法', 4);
INSERT INTO `tag` VALUES (38, '微服务', '微服务', 5);
INSERT INTO `tag` VALUES (39, '区块链', '区块链', 5);
INSERT INTO `tag` VALUES (40, '以太坊', '以太坊', 5);
INSERT INTO `tag` VALUES (41, '人工智能', '人工智能', 5);
INSERT INTO `tag` VALUES (42, '机器学习', '机器学习', 5);
INSERT INTO `tag` VALUES (43, '深度学习', '深度学习', 5);
INSERT INTO `tag` VALUES (44, '计算机视觉', '计算机视觉', 5);
INSERT INTO `tag` VALUES (45, '自然语言处理', '自然语言处理', 5);
INSERT INTO `tag` VALUES (46, '数据分析&挖掘', '数据分析&挖掘', 5);
INSERT INTO `tag` VALUES (47, '大数据', '大数据', 6);
INSERT INTO `tag` VALUES (48, 'Hadoop', 'Hadoop', 6);
INSERT INTO `tag` VALUES (49, 'Spark', 'Spark', 6);
INSERT INTO `tag` VALUES (50, 'Hbase', 'Hbase', 6);
INSERT INTO `tag` VALUES (51, 'Storm', 'Storm', 6);
INSERT INTO `tag` VALUES (52, '云计算', '云计算', 6);
INSERT INTO `tag` VALUES (53, 'AWS', 'AWS', 6);
INSERT INTO `tag` VALUES (54, 'Docker', 'Docker', 6);
INSERT INTO `tag` VALUES (55, 'Kubernetes', 'Kubernetes', 6);
INSERT INTO `tag` VALUES (56, '运维', '运维', 7);
INSERT INTO `tag` VALUES (57, '自动化运维', '自动化运维', 7);
INSERT INTO `tag` VALUES (58, '运维工具', '运维工具', 7);
INSERT INTO `tag` VALUES (59, '中间件', '中间件', 7);
INSERT INTO `tag` VALUES (60, 'Linux', 'Linux', 7);
INSERT INTO `tag` VALUES (61, '测试', '测试', 7);
INSERT INTO `tag` VALUES (62, '功能测试', '功能测试', 7);
INSERT INTO `tag` VALUES (63, '性能测试', '性能测试', 7);
INSERT INTO `tag` VALUES (64, '自动化测试', '自动化测试', 7);
INSERT INTO `tag` VALUES (65, '接口测试', '接口测试', 7);
INSERT INTO `tag` VALUES (66, '安全测试', '安全测试', 7);
INSERT INTO `tag` VALUES (67, 'MySQL', 'MySQL', 8);
INSERT INTO `tag` VALUES (68, 'Redis', 'Redis', 8);
INSERT INTO `tag` VALUES (69, 'MongoDB', 'MongoDB', 8);
INSERT INTO `tag` VALUES (70, 'Oracle', 'Oracle', 8);
INSERT INTO `tag` VALUES (71, 'SQL Server', 'SQL Server', 8);
INSERT INTO `tag` VALUES (72, 'NoSql', 'NoSql', 8);
INSERT INTO `tag` VALUES (73, '模型制作', '模型制作', 9);
INSERT INTO `tag` VALUES (74, '动效动画', '动效动画', 9);
INSERT INTO `tag` VALUES (75, '设计基础', '设计基础', 9);
INSERT INTO `tag` VALUES (76, '设计工具', '设计工具', 9);
INSERT INTO `tag` VALUES (77, 'APPUI设计', 'APPUI设计', 9);
INSERT INTO `tag` VALUES (78, '产品交互', '产品交互', 9);
INSERT INTO `tag` VALUES (79, 'Unity 3D', 'Unity 3D', 10);
INSERT INTO `tag` VALUES (80, 'Cocos2d-x', 'Cocos2d-x', 10);
COMMIT;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `user_id_pk` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of teacher
-- ----------------------------
BEGIN;
INSERT INTO `teacher` VALUES ('https://img4.mukewang.com/5abe468b0001664107390741-80-80.jpg', 'miaoz', '全栈前端打工仔', 1);
INSERT INTO `teacher` VALUES ('http://vue13.oss-cn-chengdu.aliyuncs.com/user_avatar/20191225125009.jpg', 'cjmHK', NULL, 52);
COMMIT;

-- ----------------------------
-- Table structure for term
-- ----------------------------
DROP TABLE IF EXISTS `term`;
CREATE TABLE `term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `term_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `exp` int(11) DEFAULT NULL,
  `updated_at_day` int(11) DEFAULT NULL,
  `updated_at_year_month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `FK9kq1joomrfr0luidui4ngvqft` (`chapter_id`),
  KEY `FKc0eqwvhyx32k4wpboi9wjid19` (`course_id`),
  CONSTRAINT `chapter_id_pk` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK9kq1joomrfr0luidui4ngvqft` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKc0eqwvhyx32k4wpboi9wjid19` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of term
-- ----------------------------
BEGIN;
INSERT INTO `term` VALUES (1, '支持动画交互的 tab bar - IV', '04:15', 'http://vue13.oss-cn-chengdu.aliyuncs.com/term_video/20191226173415.mp4', 1, '接着上一节的话题，为了让事件的生成和订阅发生在不同的线程里，我们先在测试用例中使用 <code>receive(on:)</code>，把订阅代码“调度”走，并观察接下来的订阅结果。', 1, 200, 27, 'Oct, 2019', 'http://vue13.oss-cn-chengdu.aliyuncs.com/term_img/20191226173105.png', 1);
INSERT INTO `term` VALUES (2, 'Combine 事件供给机制的回顾', '09:18', 'http://vue13.oss-cn-chengdu.aliyuncs.com/term_video/20191225202818.mp4', 2, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 25, 'Dec, 2019', 'https://image.boxueio.com/z51-the-hidden-subscription-obj-cover@2x.jpg', 1);
INSERT INTO `term` VALUES (3, 'Combine 中的多重订阅 - II', '04:24', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 2, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 23, 'Dec, 2019', 'https://image.boxueio.com/z60-multiple-subscriptions-ii-cover@2x.jpg', 1);
INSERT INTO `term` VALUES (4, 'Combine 中的多重订阅 - I', '12:26', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 21, 'Dec, 2019', 'https://image.boxueio.com/z59-multiple-subscriptions-cover@2x.jpg', 33);
INSERT INTO `term` VALUES (5, '有些意外的 Subject 生命周期', '08:38', 'http://vue13.oss-cn-chengdu.aliyuncs.com/term_video/20191225224415.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 16, 'Nov, 2019', 'https://image.boxueio.com/z21-decorate-readme-cover@2x.jpg', 1);
INSERT INTO `term` VALUES (6, '实现自定义的事件缓冲区 - II', '09:00', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1213, 200, 17, 'Nov, 2019', 'https://image.boxueio.com/z20-keychain-wrapper-impl-iii-cover@2x.jpg', 1);
INSERT INTO `term` VALUES (7, '实现自定义的事件缓冲区 - I', '09:21', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 21, 'Nov, 2019', 'https://image.boxueio.com/z58-subject-lifetime-cover@2x.jpg', 33);
INSERT INTO `term` VALUES (8, 'Combine 中的共享计算', '06:50', 'http://vue13.oss-cn-chengdu.aliyuncs.com/term_video/20191226180117.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 12, 200, 23, 'Nov, 2019', 'http://vue13.oss-cn-chengdu.aliyuncs.com/term_img/20191226173105.png', 33);
INSERT INTO `term` VALUES (9, '让 CustomSubject 线程安全', '11:09', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 <code>Publisher</code> 和 Subscriber 之间事件的传递方式说起。', 1, 200, 21, 'Nov, 2019', 'https://image.boxueio.com/z34-reset-password-cover@2x.jpg', 33);
INSERT INTO `term` VALUES (10, '模拟 Subscription 实现 - III', '05:03', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 5, 'Nov, 2019', 'https://image.boxueio.com/z36-understand-swift-property-wrapper-cover@2x.jpg', 33);
INSERT INTO `term` VALUES (11, '模拟 Subscription 实现 - III', '11:31', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 1, 'Nov, 2019', 'https://image.boxueio.com/z37-keychain-in-property-wrapper-cover@2x.jpg', 32);
INSERT INTO `term` VALUES (12, '模拟 Subscription 实现 - II', '16:39', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 23, 'Nov, 2019', 'https://image.boxueio.com/z31-promisekit-vs-combine-cover@2x.jpg', 34);
INSERT INTO `term` VALUES (13, '模拟 Subscription 实现 - I', '17:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 16, 'Nov, 2019', 'https://image.boxueio.com/z30-crypt-swift-aes-cover@2x.jpg', 33);
INSERT INTO `term` VALUES (14, '观察 Combine 的一些边缘情况', '04:18', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z27-design-pub-pri-type-cover@2x.jpg', 34);
INSERT INTO `term` VALUES (15, '支持动画交互的 tab bar - IV', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z26-unit-test-swift-rsa-cover@2x.jpg', 34);
INSERT INTO `term` VALUES (16, '支持动画交互的 tab bar - III', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 11, 200, 25, 'Nov, 2019', 'https://image.boxueio.com/z22-encap-network-as-resource-cover@2x.jpg', 1);
INSERT INTO `term` VALUES (17, '分界线', '05:03', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 5, 'Nov, 2019', 'https://image.boxueio.com/z36-understand-swift-property-wrapper-cover@2x.jpg', 35);
INSERT INTO `term` VALUES (18, '模拟 Subscription 实现 - III', '11:31', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 1, 'Nov, 2019', 'https://image.boxueio.com/z37-keychain-in-property-wrapper-cover@2x.jpg', 35);
INSERT INTO `term` VALUES (19, '模拟 Subscription 实现 - II', '16:39', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 23, 'Nov, 2019', 'https://image.boxueio.com/z31-promisekit-vs-combine-cover@2x.jpg', 35);
INSERT INTO `term` VALUES (20, '模拟 Subscription 实现 - I', '17:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 16, 'Nov, 2019', 'https://image.boxueio.com/z30-crypt-swift-aes-cover@2x.jpg', 36);
INSERT INTO `term` VALUES (21, '观察 Combine 的一些边缘情况', '04:18', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z27-design-pub-pri-type-cover@2x.jpg', 36);
INSERT INTO `term` VALUES (22, '支持动画交互的 tab bar - IV', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z26-unit-test-swift-rsa-cover@2x.jpg', 37);
INSERT INTO `term` VALUES (23, '支持动画交互的 tab bar - III', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 11, 200, 25, 'Nov, 2019', 'https://image.boxueio.com/z22-encap-network-as-resource-cover@2x.jpg', 37);
INSERT INTO `term` VALUES (24, '分界线', '05:03', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 5, 'Nov, 2019', 'https://image.boxueio.com/z36-understand-swift-property-wrapper-cover@2x.jpg', 38);
INSERT INTO `term` VALUES (25, '模拟 Subscription 实现 - III', '11:31', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 1, 'Nov, 2019', 'https://image.boxueio.com/z37-keychain-in-property-wrapper-cover@2x.jpg', 39);
INSERT INTO `term` VALUES (26, '模拟 Subscription 实现 - II', '16:39', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 23, 'Nov, 2019', 'https://image.boxueio.com/z31-promisekit-vs-combine-cover@2x.jpg', 40);
INSERT INTO `term` VALUES (27, '模拟 Subscription 实现 - I', '17:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 16, 'Nov, 2019', 'https://image.boxueio.com/z30-crypt-swift-aes-cover@2x.jpg', 40);
INSERT INTO `term` VALUES (28, '观察 Combine 的一些边缘情况', '04:18', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z27-design-pub-pri-type-cover@2x.jpg', 41);
INSERT INTO `term` VALUES (29, '支持动画交互的 tab bar - IV', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z26-unit-test-swift-rsa-cover@2x.jpg', 41);
INSERT INTO `term` VALUES (30, '支持动画交互的 tab bar - III', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 11, 200, 25, 'Nov, 2019', 'https://image.boxueio.com/z22-encap-network-as-resource-cover@2x.jpg', 42);
INSERT INTO `term` VALUES (31, '分界线', '05:03', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 5, 'Nov, 2019', 'https://image.boxueio.com/z36-understand-swift-property-wrapper-cover@2x.jpg', 42);
INSERT INTO `term` VALUES (32, '模拟 Subscription 实现 - III', '11:31', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 1, 'Nov, 2019', 'https://image.boxueio.com/z37-keychain-in-property-wrapper-cover@2x.jpg', 42);
INSERT INTO `term` VALUES (33, '模拟 Subscription 实现 - II', '16:39', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 23, 'Nov, 2019', 'https://image.boxueio.com/z31-promisekit-vs-combine-cover@2x.jpg', 42);
INSERT INTO `term` VALUES (34, '模拟 Subscription 实现 - I', '17:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 16, 'Nov, 2019', 'https://image.boxueio.com/z30-crypt-swift-aes-cover@2x.jpg', 43);
INSERT INTO `term` VALUES (35, '观察 Combine 的一些边缘情况', '04:18', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z27-design-pub-pri-type-cover@2x.jpg', 43);
INSERT INTO `term` VALUES (36, '支持动画交互的 tab bar - IV', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z26-unit-test-swift-rsa-cover@2x.jpg', 43);
INSERT INTO `term` VALUES (37, '支持动画交互的 tab bar - III', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 11, 200, 25, 'Nov, 2019', 'https://image.boxueio.com/z22-encap-network-as-resource-cover@2x.jpg', 43);
INSERT INTO `term` VALUES (38, '分界线', '05:03', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 5, 'Nov, 2019', 'https://image.boxueio.com/z36-understand-swift-property-wrapper-cover@2x.jpg', 44);
INSERT INTO `term` VALUES (39, '模拟 Subscription 实现 - III', '11:31', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 1, 'Nov, 2019', 'https://image.boxueio.com/z37-keychain-in-property-wrapper-cover@2x.jpg', 44);
INSERT INTO `term` VALUES (40, '模拟 Subscription 实现 - II', '16:39', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 23, 'Nov, 2019', 'https://image.boxueio.com/z31-promisekit-vs-combine-cover@2x.jpg', 44);
INSERT INTO `term` VALUES (41, '模拟 Subscription 实现 - I', '17:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 16, 'Nov, 2019', 'https://image.boxueio.com/z30-crypt-swift-aes-cover@2x.jpg', 44);
INSERT INTO `term` VALUES (42, '观察 Combine 的一些边缘情况', '04:18', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z27-design-pub-pri-type-cover@2x.jpg', 45);
INSERT INTO `term` VALUES (43, '支持动画交互的 tab bar - IV', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z26-unit-test-swift-rsa-cover@2x.jpg', 45);
INSERT INTO `term` VALUES (44, '支持动画交互的 tab bar - III', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 11, 200, 25, 'Nov, 2019', 'https://image.boxueio.com/z22-encap-network-as-resource-cover@2x.jpg', 45);
INSERT INTO `term` VALUES (45, '分界线', '05:03', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 5, 'Nov, 2019', 'https://image.boxueio.com/z36-understand-swift-property-wrapper-cover@2x.jpg', 45);
INSERT INTO `term` VALUES (46, '模拟 Subscription 实现 - III', '11:31', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 1, 'Nov, 2019', 'https://image.boxueio.com/z37-keychain-in-property-wrapper-cover@2x.jpg', 46);
INSERT INTO `term` VALUES (47, '模拟 Subscription 实现 - II', '16:39', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 23, 'Nov, 2019', 'https://image.boxueio.com/z31-promisekit-vs-combine-cover@2x.jpg', 46);
INSERT INTO `term` VALUES (48, '模拟 Subscription 实现 - I', '17:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 16, 'Nov, 2019', 'https://image.boxueio.com/z30-crypt-swift-aes-cover@2x.jpg', 46);
INSERT INTO `term` VALUES (49, '观察 Combine 的一些边缘情况', '04:18', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z27-design-pub-pri-type-cover@2x.jpg', 46);
INSERT INTO `term` VALUES (50, '支持动画交互的 tab bar - IV', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z26-unit-test-swift-rsa-cover@2x.jpg', 46);
INSERT INTO `term` VALUES (51, '支持动画交互的 tab bar - III', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 11, 200, 25, 'Nov, 2019', 'https://image.boxueio.com/z22-encap-network-as-resource-cover@2x.jpg', 47);
INSERT INTO `term` VALUES (52, '分界线', '05:03', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 5, 'Nov, 2019', 'https://image.boxueio.com/z36-understand-swift-property-wrapper-cover@2x.jpg', 47);
INSERT INTO `term` VALUES (53, '模拟 Subscription 实现 - III', '11:31', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 3, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 2, 200, 1, 'Nov, 2019', 'https://image.boxueio.com/z37-keychain-in-property-wrapper-cover@2x.jpg', 47);
INSERT INTO `term` VALUES (54, '模拟 Subscription 实现 - II', '16:39', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 23, 'Nov, 2019', 'https://image.boxueio.com/z31-promisekit-vs-combine-cover@2x.jpg', 47);
INSERT INTO `term` VALUES (55, '模拟 Subscription 实现 - I', '17:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 16, 'Nov, 2019', 'https://image.boxueio.com/z30-crypt-swift-aes-cover@2x.jpg', 48);
INSERT INTO `term` VALUES (56, '观察 Combine 的一些边缘情况', '04:18', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 4, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 3, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z27-design-pub-pri-type-cover@2x.jpg', 48);
INSERT INTO `term` VALUES (57, '支持动画交互的 tab bar - IV', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 1, 200, 12, 'Nov, 2019', 'https://image.boxueio.com/z26-unit-test-swift-rsa-cover@2x.jpg', 48);
INSERT INTO `term` VALUES (58, '支持动画交互的 tab bar - III', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 11, 200, 25, 'Nov, 2019', 'https://image.boxueio.com/z22-encap-network-as-resource-cover@2x.jpg', 48);
INSERT INTO `term` VALUES (59, '支持动画交互的 tab bar - III', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 11, 200, 25, 'Nov, 2019', 'https://image.boxueio.com/z22-encap-network-as-resource-cover@2x.jpg', 49);
INSERT INTO `term` VALUES (60, '支持动画交互的 tab bar - III', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 11, 200, 25, 'Nov, 2019', 'https://image.boxueio.com/z22-encap-network-as-resource-cover@2x.jpg', 49);
INSERT INTO `term` VALUES (61, '支持动画交互的 tab bar - III', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 11, 200, 25, 'Nov, 2019', 'https://image.boxueio.com/z22-encap-network-as-resource-cover@2x.jpg', 49);
INSERT INTO `term` VALUES (62, '支持动画交互的 tab bar - III', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 11, 200, 25, 'Nov, 2019', 'https://image.boxueio.com/z22-encap-network-as-resource-cover@2x.jpg', 50);
INSERT INTO `term` VALUES (63, '支持动画交互的 tab bar - III', '04:04', 'https://free-video.boxueio.com/z61-combine-review-event-supply.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 11, 200, 25, 'Nov, 2019', 'https://image.boxueio.com/z22-encap-network-as-resource-cover@2x.jpg', 50);
INSERT INTO `term` VALUES (65, '支持动画交互的 tab bar - III', '04:04', 'http://vue13.oss-cn-chengdu.aliyuncs.com/term_video/20191226144746.mp4', 1, '在上一节末尾，我们提出了一些 Combine 中看似“有违常理”的现象。为了搞清楚这些问题，我们要从 Publisher 和 Subscriber 之间事件的传递方式说起。', 11, 200, 25, 'Nov, 2019', 'https://image.boxueio.com/z22-encap-network-as-resource-cover@2x.jpg', 50);
COMMIT;

-- ----------------------------
-- Table structure for tokeninfo
-- ----------------------------
DROP TABLE IF EXISTS `tokeninfo`;
CREATE TABLE `tokeninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buildtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tokeninfo_user_info_fk` (`user_id`),
  CONSTRAINT `FKk5bi3yeioqtynrh0brve7vs4h` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tokeninfo_user_info_fk` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tokeninfo
-- ----------------------------
BEGIN;
INSERT INTO `tokeninfo` VALUES (1, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9eyJpYXQiOjE1NzQwOTQ', 12);
INSERT INTO `tokeninfo` VALUES (2, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzQwOTQ0MTUsImV4cCI6MTU3NDM1MzYxNSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.x4xVLBZyRUijDxrDOKTTjSP_rcE4_2gJhGQUsrCeiag', 1574094415);
INSERT INTO `tokeninfo` VALUES (3, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzQwOTUxNTAsImV4cCI6MTU3NDM1NDM1MCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.mMAeblbHdOQJLljKb-BzfdKSBggBTOcUG7qPomZljXQ', 1574095150);
INSERT INTO `tokeninfo` VALUES (4, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzQwOTUxOTYsImV4cCI6MTU3NDM1NDM5NiwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.VzxNCmvETMJEYoEaUZZ49N14e5PwGcTJiMj5wg9s-3Y', 1574095196);
INSERT INTO `tokeninfo` VALUES (5, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzQwOTUyNjQsImV4cCI6MTU3NDM1NDQ2NCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.Q-LNQQW4OYvgRlyaxlrSC0ZekWqsmCZOrvRqZZwVXUI', 1574095264);
INSERT INTO `tokeninfo` VALUES (6, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzQwOTUyNjYsImV4cCI6MTU3NDM1NDQ2NiwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.FRsYZj6C_bELM54HoHBSFAwNW2fcoXUUqYL7B3gFmI0', 1574095266);
INSERT INTO `tokeninfo` VALUES (7, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzQwOTUyNjcsImV4cCI6MTU3NDM1NDQ2NywidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.PFUzwWEyIigQ49LhCphq-R9YaNItln2P55B82RJDkv0', 1574095267);
INSERT INTO `tokeninfo` VALUES (8, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzQwOTUyNjgsImV4cCI6MTU3NDM1NDQ2OCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.FIxCx7n5NhQGRgvu_83Z3bMlPhsb7U8ItqYab4VPz7Q', 1574095268);
INSERT INTO `tokeninfo` VALUES (9, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzQwOTUyNjgsImV4cCI6MTU3NDM1NDQ2OCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.FIxCx7n5NhQGRgvu_83Z3bMlPhsb7U8ItqYab4VPz7Q', 1574095268);
INSERT INTO `tokeninfo` VALUES (10, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzQwOTUyNjgsImV4cCI6MTU3NDM1NDQ2OCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.FIxCx7n5NhQGRgvu_83Z3bMlPhsb7U8ItqYab4VPz7Q', 1574095268);
INSERT INTO `tokeninfo` VALUES (11, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY1MDE2NTQsImV4cCI6MTU3Njc2MDg1NCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.7BIGCVYB-7ySENcL0co0CZCUGnkvCTU0rUuUq6Liciw', 1576501654);
INSERT INTO `tokeninfo` VALUES (12, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY1MDE2NTcsImV4cCI6MTU3Njc2MDg1NywidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.CuHP8Bo0VtWA7JlU2KkeCUHdbOQYNDVos6klTsfEjnI', 1576501657);
INSERT INTO `tokeninfo` VALUES (13, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY1MDE2NTgsImV4cCI6MTU3Njc2MDg1OCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.HdoLmE4Qvr935B2neNi542j2uc98b89llQgQxKpiaik', 1576501658);
INSERT INTO `tokeninfo` VALUES (14, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY1MDE2NTgsImV4cCI6MTU3Njc2MDg1OCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.HdoLmE4Qvr935B2neNi542j2uc98b89llQgQxKpiaik', 1576501658);
INSERT INTO `tokeninfo` VALUES (15, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY1MDE2NTgsImV4cCI6MTU3Njc2MDg1OCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.HdoLmE4Qvr935B2neNi542j2uc98b89llQgQxKpiaik', 1576501658);
INSERT INTO `tokeninfo` VALUES (16, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY1MDE2NTksImV4cCI6MTU3Njc2MDg1OSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.ZMdarp6O8tCouW29haGf4lvlMa2mKpmTCcw60WxW_cY', 1576501659);
INSERT INTO `tokeninfo` VALUES (17, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY1MDE2NTksImV4cCI6MTU3Njc2MDg1OSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.ZMdarp6O8tCouW29haGf4lvlMa2mKpmTCcw60WxW_cY', 1576501659);
INSERT INTO `tokeninfo` VALUES (18, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY1MDE2NjAsImV4cCI6MTU3Njc2MDg2MCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.5JKa5f5Uc3AhIYbyecgf5SxcQPPQRDhJTYPu0zFbJlY', 1576501660);
INSERT INTO `tokeninfo` VALUES (19, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY1MDE2NjAsImV4cCI6MTU3Njc2MDg2MCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.5JKa5f5Uc3AhIYbyecgf5SxcQPPQRDhJTYPu0zFbJlY', 1576501660);
INSERT INTO `tokeninfo` VALUES (20, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY1MDE2NjAsImV4cCI6MTU3Njc2MDg2MCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.5JKa5f5Uc3AhIYbyecgf5SxcQPPQRDhJTYPu0zFbJlY', 1576501660);
INSERT INTO `tokeninfo` VALUES (21, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5MzIxNDYsImV4cCI6MTU3NzE5MTM0NiwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.pU26MJ7IEcMy90S0Gi6tifCcoL_-37xgugW2k0yGNAo', 1576932146);
INSERT INTO `tokeninfo` VALUES (22, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5MzIzNTQsImV4cCI6MTU3NzE5MTU1NCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.5mYIXIjfpU6E3S9JnpfMCwxmhUGXUXubyNQ3zymLSGc', 1576932354);
INSERT INTO `tokeninfo` VALUES (23, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5MzI4MzUsImV4cCI6MTU3NzE5MjAzNSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.b4K0aiCoP0rlH2d7Q4BHAFcx3JcSoXLOXrHRmg3pldY', 1576932835);
INSERT INTO `tokeninfo` VALUES (24, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5MzI5OTksImV4cCI6MTU3NzE5MjE5OSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.XDfZcZtMTMpsH3oHNCTtXEIBu8vV0qZLVbZHS6wHppM', 1576932999);
INSERT INTO `tokeninfo` VALUES (41, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5ODg1MTYsImV4cCI6MTU3NzI0NzcxNiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.6ydAQFfSoWhOD3OnVKp_4MkEYyLkjuiYpv1H-FYARXs', 1576988516);
INSERT INTO `tokeninfo` VALUES (42, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5ODg1NTgsImV4cCI6MTU3NzI0Nzc1OCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.cVRfpDam_NHVRHcw3HrKbFol17f1WDgqIu6YNn29SRM', 1576988558);
INSERT INTO `tokeninfo` VALUES (43, 52, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5ODg2NTYsImV4cCI6MTU3NzI0Nzg1NiwidXNlcmlkIjoiNTIiLCJpc3MiOiJsd3MifQ.5kR7T3cCOIlJuDgRslok5zcpoMUiQfddoGaBUWwVDGA', 1576988656);
INSERT INTO `tokeninfo` VALUES (44, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5ODkxNTUsImV4cCI6MTU3NzI0ODM1NSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.KWnf-9ps_IzHxyV3ENyS4D4Z7K44UyEDsGw9Zb7XlDk', 1576989155);
INSERT INTO `tokeninfo` VALUES (45, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTA1MzEsImV4cCI6MTU3NzI0OTczMSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.wxbkHhVXZQm1lqFwb94MGhObmH31p107AU-Aid4bw54', 1576990531);
INSERT INTO `tokeninfo` VALUES (46, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTA1NjQsImV4cCI6MTU3NzI0OTc2NCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.gjAxkeF0qNU1t_2vJOoh4VgZkykMbVZMFSBu1nmbM_M', 1576990564);
INSERT INTO `tokeninfo` VALUES (47, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTA5NzMsImV4cCI6MTU3NzI1MDE3MywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.3LdZkU2wo86PMlDZg533LXQ96bFjQjbS5_vryV5t-lM', 1576990973);
INSERT INTO `tokeninfo` VALUES (48, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTEwNDksImV4cCI6MTU3NzI1MDI0OSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.5tZNioT-_RNamfhb5_73MfTO3ob7bwF1VQDBag4iBs8', 1576991049);
INSERT INTO `tokeninfo` VALUES (49, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTEwODMsImV4cCI6MTU3NzI1MDI4MywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.EzlGbaORaLnqqjwOGzu7csWZ4U7tPdzn0BTkr0ynaNg', 1576991083);
INSERT INTO `tokeninfo` VALUES (50, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTExNjksImV4cCI6MTU3NzI1MDM2OSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.PE-4TJlgHqlVAMsgS0JLwSTcvUWeRLk6F3lzW6HImIg', 1576991169);
INSERT INTO `tokeninfo` VALUES (51, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTE0NTEsImV4cCI6MTU3NzI1MDY1MSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.mIC49AdR2MzA13QHIRcgGRWPe5_4m7SPVsra68GfZ9M', 1576991451);
INSERT INTO `tokeninfo` VALUES (52, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTE2NjEsImV4cCI6MTU3NzI1MDg2MSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.ATy-y2_2xmTcRf4tVtaY9P7B0XtPOtITmOTNluyKlgg', 1576991661);
INSERT INTO `tokeninfo` VALUES (53, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTIyMzcsImV4cCI6MTU3NzI1MTQzNywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.hSxUilyuwTPdnGvy7ZZsleYvuVEP8GASuUyUA07TTvg', 1576992237);
INSERT INTO `tokeninfo` VALUES (54, 52, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTI1MzAsImV4cCI6MTU3NzI1MTczMCwidXNlcmlkIjoiNTIiLCJpc3MiOiJsd3MifQ.A_NfkRNjwCn3GycLbI5C3yTaMDTgtGWQrU6RyIIUk78', 1576992530);
INSERT INTO `tokeninfo` VALUES (55, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTI3MTEsImV4cCI6MTU3NzI1MTkxMSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.-x2--KPplB41bEsiKzcilkyk_g-aBhfnVm0qqFb1BLk', 1576992711);
INSERT INTO `tokeninfo` VALUES (56, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTI3NzAsImV4cCI6MTU3NzI1MTk3MCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.4Bx_4c_Cks7esmGym0BT0lTuF134tKVrfK-4xjtda6A', 1576992770);
INSERT INTO `tokeninfo` VALUES (57, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTUxMjksImV4cCI6MTU3NzI1NDMyOSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.f7sfQx8JLMPOPztU5CdqPUMQKOnmysXEggDZCuFodC8', 1576995129);
INSERT INTO `tokeninfo` VALUES (58, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTUxNDEsImV4cCI6MTU3NzI1NDM0MSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.eSeY9ATTrgv6oHC8ilZEnP3BtGgkIGj0ACG2m12d7u8', 1576995141);
INSERT INTO `tokeninfo` VALUES (59, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzY5OTc5NzMsImV4cCI6MTU3NzI1NzE3MywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.Bd7EmbdlFxOz-HkugfyrMcC7jfsZ4Yf3yipSBovwkFw', 1576997973);
INSERT INTO `tokeninfo` VALUES (63, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMTQ5MDYsImV4cCI6MTU3NzI3NDEwNiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.mcIryrQdZKzmqgl2Rxu1yfuXFhACm3FA5f6PgvkVaOM', 1577014906);
INSERT INTO `tokeninfo` VALUES (64, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMTUzNTksImV4cCI6MTU3NzI3NDU1OSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.YaMdpTsakFa7ccyqziZdjfZ9iq7-fAui-F0SN01K90A', 1577015359);
INSERT INTO `tokeninfo` VALUES (65, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMjY3NDIsImV4cCI6MTU3NzI4NTk0MiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.z2DTXpxwFdegWy-HqGdN_6g_mCXMC6UycDg3Fs0I-Ek', 1577026742);
INSERT INTO `tokeninfo` VALUES (66, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMzEyNTUsImV4cCI6MTU3NzI5MDQ1NSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.FEPsYWlkrdSZiQHTcr5eWT_uv-8PMVGwj8Q_Fmsx8vw', 1577031255);
INSERT INTO `tokeninfo` VALUES (67, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMzE0MTQsImV4cCI6MTU3NzI5MDYxNCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.bzUHsx4kPbrN1GQZTLh26IBJDEKEF2D8fe_5iqZtkGE', 1577031414);
INSERT INTO `tokeninfo` VALUES (68, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMzE0OTIsImV4cCI6MTU3NzI5MDY5MiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.MLFoKM9Aovh4aPMwrCuYZbkD51mzyE0io0fRssCI2OE', 1577031492);
INSERT INTO `tokeninfo` VALUES (69, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMzE2MDgsImV4cCI6MTU3NzI5MDgwOCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.vq7lBCQXkA5tYzdfyRuIoPfVTlU3CfA7l7g6FmW07mQ', 1577031608);
INSERT INTO `tokeninfo` VALUES (70, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMzE2ODYsImV4cCI6MTU3NzI5MDg4NiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.2R5qZht0hqw6TO31pN7zfuW9_Ly1yAo9LNMFfG_70iY', 1577031686);
INSERT INTO `tokeninfo` VALUES (71, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMzE4NzUsImV4cCI6MTU3NzI5MTA3NSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.btiZjy-wOxoz2DZMFG8VRGUl0u8-oUm7yBITr1CCKWk', 1577031875);
INSERT INTO `tokeninfo` VALUES (72, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMzE5NzMsImV4cCI6MTU3NzI5MTE3MywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.6punXIJKTDmkF5gKtHFHAcm9AT2cTWote66kptoPzDo', 1577031973);
INSERT INTO `tokeninfo` VALUES (73, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMzIwMTcsImV4cCI6MTU3NzI5MTIxNywidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.ZPn53TD_GVSovmmwxTficJwai5_MRRoPvX1SuA-0WO0', 1577032017);
INSERT INTO `tokeninfo` VALUES (74, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMzIwNTQsImV4cCI6MTU3NzI5MTI1NCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.bR_LpabPrshGKnJysDOP-qL4z7UVwXJ4YNZmvokwLrA', 1577032054);
INSERT INTO `tokeninfo` VALUES (75, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMzI1NjMsImV4cCI6MTU3NzI5MTc2MywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.7tpzddJFuIKTsIQN3tsftCIiColraocyaBAz65nLLK8', 1577032563);
INSERT INTO `tokeninfo` VALUES (76, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMzQ3MDMsImV4cCI6MTU3NzI5MzkwMywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.lYhn6WTUoZIFB6gnGnmAmC7SZkoaD6zeVO0tzCRqqQY', 1577034703);
INSERT INTO `tokeninfo` VALUES (77, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwMzUxNDgsImV4cCI6MTU3NzI5NDM0OCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.0i9h5YrPlrpgvtPyJ8c18MPQcyE-Wh1UnMV6yyXzSM0', 1577035148);
INSERT INTO `tokeninfo` VALUES (78, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwOTgzMjYsImV4cCI6MTU3NzM1NzUyNiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.7jmoGKg9KzidgBIjne6q24G_PZQSQ6ctWy3gwfvq31U', 1577098326);
INSERT INTO `tokeninfo` VALUES (79, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwOTgzOTEsImV4cCI6MTU3NzM1NzU5MSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.3rsJRpsKQn_SLHqmmWPoZwV8m_blIcIIcUEnVho1_aM', 1577098391);
INSERT INTO `tokeninfo` VALUES (80, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcwOTg1MDQsImV4cCI6MTU3NzM1NzcwNCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.-MUm5WiuDU3ewPU1UvjGMXo6PkEVFC_FxMJp-1cdsnI', 1577098504);
INSERT INTO `tokeninfo` VALUES (81, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxMDE3MTgsImV4cCI6MTU3NzM2MDkxOCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.Iw3NFP7sxjznOybCX7dOUCSc4m2LguaiUM2oYr5xymE', 1577101718);
INSERT INTO `tokeninfo` VALUES (82, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxMTY3MjQsImV4cCI6MTU3NzM3NTkyNCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.ldcumzWlztJqhmWIw3Z53YuQivb0RHaR95nVMna0rsk', 1577116724);
INSERT INTO `tokeninfo` VALUES (83, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxMjA0MjUsImV4cCI6MTU3NzM3OTYyNSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.6i6oC9cMWCG4SIMCP8pQ-5-MwTuosFZ0HyC3GmQbWfM', 1577120425);
INSERT INTO `tokeninfo` VALUES (84, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxMjA0MzcsImV4cCI6MTU3NzM3OTYzNywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.BsxjWBkmkzHu8AvVH_zZSTOCGSCVOBytEUKgWXwYrB0', 1577120437);
INSERT INTO `tokeninfo` VALUES (85, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxMjA2MzIsImV4cCI6MTU3NzM3OTgzMiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.E0Gs5LMFExiR9LweNcVlpcnYBEoUyCNDKqlbZQ_A3DM', 1577120632);
INSERT INTO `tokeninfo` VALUES (86, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxMjA2NTcsImV4cCI6MTU3NzM3OTg1NywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.fwtUfN_9S2oZvchrjH9hBaHDRd3yPFzhrX1VDlw7Lbg', 1577120657);
INSERT INTO `tokeninfo` VALUES (87, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxMjA3NDcsImV4cCI6MTU3NzM3OTk0NywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.gqp_WOxo6eMFUv4KZiZc7FcMHC22GZFdDyITvGxQ4Po', 1577120747);
INSERT INTO `tokeninfo` VALUES (88, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxMjA3NTUsImV4cCI6MTU3NzM3OTk1NSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.hpHzQUNi6LOIoRNQQNbXjz69-bkZXhBzj34zJRV07O8', 1577120755);
INSERT INTO `tokeninfo` VALUES (89, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxMjEwNTYsImV4cCI6MTU3NzM4MDI1NiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.vFOdmsXqDuui551leUAALtsjz8q5QqIPLwcUJ_Pycyc', 1577121056);
INSERT INTO `tokeninfo` VALUES (90, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxMjEwNjIsImV4cCI6MTU3NzM4MDI2MiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.ZFKPuNM66HC17J1XBMYWihD-KZXSqVEpX_ccNXfeELY', 1577121062);
INSERT INTO `tokeninfo` VALUES (91, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxMjEzNDYsImV4cCI6MTU3NzM4MDU0NiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.aOjSZ9W8ANXYRoDMPjeDn267etgk-iFs_cG4EvG2PRc', 1577121346);
INSERT INTO `tokeninfo` VALUES (92, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxMjEzNTUsImV4cCI6MTU3NzM4MDU1NSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.3USkqE_nLO3mzTGgTa3p0a0YtUk0ntLWBGI4Vs96TnQ', 1577121355);
INSERT INTO `tokeninfo` VALUES (93, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNTAxNTcsImV4cCI6MTU3NzQwOTM1NywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.xhBl-JjZuCk-AFU45eC-3beVw0eEV_A8PwAulEfykes', 1577150157);
INSERT INTO `tokeninfo` VALUES (94, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNTQxNDUsImV4cCI6MTU3NzQxMzM0NSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.n_Ot0U97U8zVkqwQSYYjzAwUNC7oWlFoCUyRLyPFrv0', 1577154145);
INSERT INTO `tokeninfo` VALUES (95, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNTQxNTMsImV4cCI6MTU3NzQxMzM1MywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.Z1M3YD93EaNNNFA4hMZmMpspe5G8tD3xbxxvbToW4Sc', 1577154153);
INSERT INTO `tokeninfo` VALUES (96, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNTQ0NTcsImV4cCI6MTU3NzQxMzY1NywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.OaAvWK-G0B0cKaaXV0VysfOCLTMLE3rr0F3_YPyN0RI', 1577154457);
INSERT INTO `tokeninfo` VALUES (97, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNTQ0NjIsImV4cCI6MTU3NzQxMzY2MiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.YhclDx_4byE636yJSGCGQpEyKBlyeY3p9HqsmMlsAr4', 1577154462);
INSERT INTO `tokeninfo` VALUES (98, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNTUyMTEsImV4cCI6MTU3NzQxNDQxMSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.trHfHXHQrcZV7dDgH4P02z8-m94bL-Hawjdxl0I2O6I', 1577155211);
INSERT INTO `tokeninfo` VALUES (99, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNTUyMTgsImV4cCI6MTU3NzQxNDQxOCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.KWhUC852gzEcqdZ7A35iF12YJp1dnokZnmzgnFicS1A', 1577155218);
INSERT INTO `tokeninfo` VALUES (100, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNTU1OTUsImV4cCI6MTU3NzQxNDc5NSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.jYO7MAMxHBPXqktzLAHiA2od4o4SUC0Xil038aA3pEE', 1577155595);
INSERT INTO `tokeninfo` VALUES (101, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNTU2MDMsImV4cCI6MTU3NzQxNDgwMywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.XmKWwke-HktC5wzkmG_WGc9xoNsPW9R0DIWhKD9jREQ', 1577155603);
INSERT INTO `tokeninfo` VALUES (102, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNTcyMzcsImV4cCI6MTU3NzQxNjQzNywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.q54JRGxeuJ4ANFCIymzSZVZTUxv5OSY4-IpDgT7edUU', 1577157237);
INSERT INTO `tokeninfo` VALUES (103, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNzMwMDIsImV4cCI6MTU3NzQzMjIwMiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.L-Gm38G7kWhu_F6cz7RaoexR_rGqS3iz3RpN1hZqsC0', 1577173002);
INSERT INTO `tokeninfo` VALUES (104, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNzMwMTAsImV4cCI6MTU3NzQzMjIxMCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.cPkVM1u92z1TL4zao6ChGONi_SEdVkLPaLTJ3flmzwg', 1577173010);
INSERT INTO `tokeninfo` VALUES (105, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNzMxOTUsImV4cCI6MTU3NzQzMjM5NSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.jf_jogYE0R3ZSYAMUtWU_HI6-e3QoHsn7Wr8ODbkHZI', 1577173195);
INSERT INTO `tokeninfo` VALUES (106, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNzMyMDQsImV4cCI6MTU3NzQzMjQwNCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.21O19IixMmMOw7P4sztUjqSXYb-w9j6ewFH7f4w2e6w', 1577173204);
INSERT INTO `tokeninfo` VALUES (107, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNzQ4MjgsImV4cCI6MTU3NzQzNDAyOCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.xPJLbI4j22ofmcNIt2ADeUbBKfHI2r3t6NLnjF2M2YY', 1577174828);
INSERT INTO `tokeninfo` VALUES (108, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNzQ4NTMsImV4cCI6MTU3NzQzNDA1MywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.C_hN3LikyVEHycemATVPI-kRM-17UZ-SVZyChZHmASY', 1577174853);
INSERT INTO `tokeninfo` VALUES (109, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNzU1MTAsImV4cCI6MTU3NzQzNDcxMCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.oIEg3NaZyFQE6R_tJZjUK-mhbrXljSz6qIqF7e4OfL8', 1577175510);
INSERT INTO `tokeninfo` VALUES (110, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxNzU1NDUsImV4cCI6MTU3NzQzNDc0NSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.XaXnizgilp3WblJaXjZbJUCOdJtmTYgL_lgwqMdDyDo', 1577175545);
INSERT INTO `tokeninfo` VALUES (111, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxODkyNjAsImV4cCI6MTU3NzQ0ODQ2MCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.eD_TnXkse0ChB60ed9tl2Ds9lNfXSMoIz2-x51gLk2U', 1577189260);
INSERT INTO `tokeninfo` VALUES (112, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxODk4OTUsImV4cCI6MTU3NzQ0OTA5NSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.pVEeDD3_L6PbkwlrelzxweYaYj2NrwAX0FF0BVyC8Vk', 1577189895);
INSERT INTO `tokeninfo` VALUES (113, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxODk5MTUsImV4cCI6MTU3NzQ0OTExNSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.ZS3mGkdhAXqCKZoS0ST5vAmxRDOo7fx_cvUOsY9BDzc', 1577189915);
INSERT INTO `tokeninfo` VALUES (114, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxOTA0MDAsImV4cCI6MTU3NzQ0OTYwMCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.0LvpyI8kD1l1sY-MOaVOlU1ZjSeLf414Thwgl3t5EWc', 1577190400);
INSERT INTO `tokeninfo` VALUES (115, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxOTA0MDksImV4cCI6MTU3NzQ0OTYwOSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ._tBQqbPhkyQfdoY13VY4ZFjUxG5DFtvj179twoC7vFw', 1577190409);
INSERT INTO `tokeninfo` VALUES (116, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxOTA1MjQsImV4cCI6MTU3NzQ0OTcyNCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.mTBELvg-rlctJFIUsLIU-06SjI_39p1bOn203wp4FM4', 1577190524);
INSERT INTO `tokeninfo` VALUES (117, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxOTA1MzMsImV4cCI6MTU3NzQ0OTczMywidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.NUhltptxSU319CN_Aluq3IDljDOM5jrG-eCJITtJ00k', 1577190533);
INSERT INTO `tokeninfo` VALUES (118, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxOTA2OTEsImV4cCI6MTU3NzQ0OTg5MSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.ZrzI1TSD3BH7ahHtsw3aAgUMMti9x0LajF1Dh8-UfTU', 1577190691);
INSERT INTO `tokeninfo` VALUES (119, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxOTQzODAsImV4cCI6MTU3NzQ1MzU4MCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.cEM8ip0m8AkRZ19xikKfOJQyYk_1GeMwuJ00luMefm8', 1577194380);
INSERT INTO `tokeninfo` VALUES (120, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxOTQzOTAsImV4cCI6MTU3NzQ1MzU5MCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.apjstVoRfyXeiXT8V83dOgq6gvqTa-Wl7HyQiIH41YY', 1577194390);
INSERT INTO `tokeninfo` VALUES (121, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxOTQ3NDgsImV4cCI6MTU3NzQ1Mzk0OCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.s7Bd0cPdVG8wPirtOPIEzhCPUMc49LCcdGghsZhYOoo', 1577194748);
INSERT INTO `tokeninfo` VALUES (122, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxOTQ3NzUsImV4cCI6MTU3NzQ1Mzk3NSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.SD6h0QU4Rd1Gz9rOj-xE_5QOgbBAeWl9K77TkjfDcQw', 1577194775);
INSERT INTO `tokeninfo` VALUES (123, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcxOTYyNzMsImV4cCI6MTU3NzQ1NTQ3MywidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.GK0cQkqkBY8EB_BZCzQJU58FSrFN8aMBD5ntOGy1hUs', 1577196273);
INSERT INTO `tokeninfo` VALUES (124, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyMDQ1NjksImV4cCI6MTU3NzQ2Mzc2OSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.JfVO7xtM4l_f-nRW9g3zXFq4QRIFfDkU86J2dPzvCJ4', 1577204569);
INSERT INTO `tokeninfo` VALUES (125, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyMDkxMDUsImV4cCI6MTU3NzQ2ODMwNSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.DNc11RkjbTstR4StJ_X76-sYc8yvKsqE4ubCYLSDans', 1577209105);
INSERT INTO `tokeninfo` VALUES (126, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyMDk3NTQsImV4cCI6MTU3NzQ2ODk1NCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.lA4fAlM1caI8FWpLDNoCVfLtSzX66-b8PTPCSlEYe8A', 1577209754);
INSERT INTO `tokeninfo` VALUES (127, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyMTE3NjQsImV4cCI6MTU3NzQ3MDk2NCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.OOUXIxFgdU7KregeIPyXt6YhCLES1nwHDb-VYgPzmu0', 1577211764);
INSERT INTO `tokeninfo` VALUES (128, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyMTU3OTIsImV4cCI6MTU3NzQ3NDk5MiwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.AWATxQqu_9xJpDgWi-YmwXsdS_Brcakkkoey79Kkui4', 1577215792);
INSERT INTO `tokeninfo` VALUES (129, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyMTU4NTMsImV4cCI6MTU3NzQ3NTA1MywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.dxxH1Q8cyWSepRS8MUqgOl_YuRHmgy4rSHXfT7cOzCk', 1577215853);
INSERT INTO `tokeninfo` VALUES (130, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyMTYwMTQsImV4cCI6MTU3NzQ3NTIxNCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.JH3PuXyjfkcVsVSP_U_PH5xXFeQgjgSPktlbP3Jp08M', 1577216014);
INSERT INTO `tokeninfo` VALUES (131, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyMTYwNzIsImV4cCI6MTU3NzQ3NTI3MiwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.48n65NWbI9lFA_4gDFHf_ZbarAjyi8zekUh2S9MqhiM', 1577216072);
INSERT INTO `tokeninfo` VALUES (132, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNTY1ODAsImV4cCI6MTU3NzUxNTc4MCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.-zpu54yrpbZ_HEJDb8ObbPuTtmUsBhw8mh7mxZ68NvU', 1577256580);
INSERT INTO `tokeninfo` VALUES (133, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNTY2NDksImV4cCI6MTU3NzUxNTg0OSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.X4OTTG2L4kAlg6rIclzBqaLvD1zqxaj_8ysmoWrRn90', 1577256649);
INSERT INTO `tokeninfo` VALUES (134, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNTY2NjEsImV4cCI6MTU3NzUxNTg2MSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.PkXJQvsMgowgv3bSksUCX1UEYZC2NpAP2aogHWgSxAY', 1577256661);
INSERT INTO `tokeninfo` VALUES (135, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNTY4OTEsImV4cCI6MTU3NzUxNjA5MSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.adm7ljxesPA4-zjQNSKhv39g_0SrikO9o3-gW-iYlFk', 1577256891);
INSERT INTO `tokeninfo` VALUES (136, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNTY5MDEsImV4cCI6MTU3NzUxNjEwMSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.plhxB-hPKO2tK-mTjYRI5MmfQYpvVoUnBvH3qnoUIqM', 1577256901);
INSERT INTO `tokeninfo` VALUES (137, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNTY5NDQsImV4cCI6MTU3NzUxNjE0NCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.U1SZjENgIMxs_xyC6t6835Hr1BaG78rvH1Qca7uU0_g', 1577256944);
INSERT INTO `tokeninfo` VALUES (138, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNTk2OTYsImV4cCI6MTU3NzUxODg5NiwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.H7SGqFP3dTJTuCqC-31mDGRNE0ZiQEiTiNIXZj-tJ_0', 1577259696);
INSERT INTO `tokeninfo` VALUES (139, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNjAzMTQsImV4cCI6MTU3NzUxOTUxNCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.xrFQJ3XYdFmNnZhB1mTJuip2-FsJPk_XrAHBkgfuyV0', 1577260314);
INSERT INTO `tokeninfo` VALUES (140, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNjA1NTIsImV4cCI6MTU3NzUxOTc1MiwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.7LvHelXszyNK5QL9jTN7ThuJZXIgfvAJp753jqAIYSw', 1577260552);
INSERT INTO `tokeninfo` VALUES (141, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNjA3NDMsImV4cCI6MTU3NzUxOTk0MywidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9._w_fwM4u26rpNLFUY-6MFQh7-6N1UV-XSWHi8EkdWS8', 1577260743);
INSERT INTO `tokeninfo` VALUES (142, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNjQ0NDEsImV4cCI6MTU3NzUyMzY0MSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.-A_H_fo_QHRQ3rhpqwXqrQBV1Sx1xC4PO5fUSGYH3EE', 1577264441);
INSERT INTO `tokeninfo` VALUES (143, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNzQxNzQsImV4cCI6MTU3NzUzMzM3NCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.I61K_99lN0jgvNSPisDJj-NB4yKRepYsQKPY1_drkdA', 1577274174);
INSERT INTO `tokeninfo` VALUES (144, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNzQyMDQsImV4cCI6MTU3NzUzMzQwNCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.Or7kvvu9Nwb4vbQXTtOGmmkOK14LPmla_O4wlIfIP5M', 1577274204);
INSERT INTO `tokeninfo` VALUES (145, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNzUwNzEsImV4cCI6MTU3NzUzNDI3MSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.-qrwax4iL9ELkR412-bDC5bk8y1V7IVqPUvbMgxxM_U', 1577275071);
INSERT INTO `tokeninfo` VALUES (146, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNzUxMDUsImV4cCI6MTU3NzUzNDMwNSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.zXnadVDebfaR37JPDSfSZaQ9kp35NOyvljDj3mcDz2E', 1577275105);
INSERT INTO `tokeninfo` VALUES (147, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNzY1NzUsImV4cCI6MTU3NzUzNTc3NSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.mP4sNq3K-1gLDS2BDV7yntUfIvMVgUNhKYX1ss252oM', 1577276575);
INSERT INTO `tokeninfo` VALUES (148, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNzY3ODUsImV4cCI6MTU3NzUzNTk4NSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.ftBBx92O_MP8SLSTPHG5VtqKWdNSEUeMlyBuC9ji6Mc', 1577276785);
INSERT INTO `tokeninfo` VALUES (149, 52, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNzY4OTMsImV4cCI6MTU3NzUzNjA5MywidXNlcmlkIjoiNTIiLCJpc3MiOiJsd3MifQ.XAbBj60GLiL0iRBjbP40h5gU54qFi7H8jxG1hN3Vy5E', 1577276893);
INSERT INTO `tokeninfo` VALUES (150, 52, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNzcwMTMsImV4cCI6MTU3NzUzNjIxMywidXNlcmlkIjoiNTIiLCJpc3MiOiJsd3MifQ.4KlUaV-YBl0_psJZvF4vtAU8-NThs5g_nbPlsQmpNn8', 1577277013);
INSERT INTO `tokeninfo` VALUES (153, 60, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNzk1OTEsImV4cCI6MTU3NzUzODc5MSwidXNlcmlkIjoiNjAiLCJpc3MiOiJsd3MifQ.D4BSllJ3NDAg8J1AAfUJyFGQtd4GNcMkdWI1cW-w9UE', 1577279591);
INSERT INTO `tokeninfo` VALUES (154, 60, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNzk2MzcsImV4cCI6MTU3NzUzODgzNywidXNlcmlkIjoiNjAiLCJpc3MiOiJsd3MifQ.A0S0iWVNmv6yjaJCrcZjs7poE_daIx5-iiir1_xtbQA', 1577279637);
INSERT INTO `tokeninfo` VALUES (155, 60, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyNzk4MTUsImV4cCI6MTU3NzUzOTAxNSwidXNlcmlkIjoiNjAiLCJpc3MiOiJsd3MifQ.YkIms7tF8-o_iV8TWZ6BxsbFr8J3aLH2u8B8jqJxuKI', 1577279815);
INSERT INTO `tokeninfo` VALUES (159, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODA3NjEsImV4cCI6MTU3NzUzOTk2MSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.4EDirwXSTdMjZhIPW9H5IyyWSH_Sbccj_ZN1JTB6tEg', 1577280761);
INSERT INTO `tokeninfo` VALUES (160, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODA3NjQsImV4cCI6MTU3NzUzOTk2NCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.yQ6oWEqu5JVwOLcvMxPzBzk0NImHIZ6VKjTOBAxss4o', 1577280764);
INSERT INTO `tokeninfo` VALUES (161, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODA3NzIsImV4cCI6MTU3NzUzOTk3MiwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.vj4xyDV8dZEKsoMuSfo3bg9x9wfoyKb3c-64104-CjI', 1577280772);
INSERT INTO `tokeninfo` VALUES (162, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODI1MTMsImV4cCI6MTU3NzU0MTcxMywidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.sbw2oo8EMRmLSKc_TA1i0J5v6vgYLIjYcN2C_UTbhwo', 1577282513);
INSERT INTO `tokeninfo` VALUES (163, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODU0ODIsImV4cCI6MTU3NzU0NDY4MiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.SpM_JVzjqwnHJMAYx7kDrxL4MFeUNJqv8kUL7n2Rxs0', 1577285482);
INSERT INTO `tokeninfo` VALUES (164, 60, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODU2NDEsImV4cCI6MTU3NzU0NDg0MSwidXNlcmlkIjoiNjAiLCJpc3MiOiJsd3MifQ.6AOchZ3Mp6eCQehBPA44hATwczWAIV4U2L3JXHuZ39g', 1577285641);
INSERT INTO `tokeninfo` VALUES (165, 60, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODU2NTMsImV4cCI6MTU3NzU0NDg1MywidXNlcmlkIjoiNjAiLCJpc3MiOiJsd3MifQ.1-lvLppKSxFhpKhT6bIdIFt583BhfmY0e-7nqmYw3BY', 1577285653);
INSERT INTO `tokeninfo` VALUES (166, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODYxNzYsImV4cCI6MTU3NzU0NTM3NiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.4L8VUkZKuPH6B3ZjEqSqO3YBmaYrRHD48p9DVmy6B00', 1577286176);
INSERT INTO `tokeninfo` VALUES (167, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODYzNjksImV4cCI6MTU3NzU0NTU2OSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.thWDFA5xQcogD7L5bXs2cbrlFfa1HFWCCaBQS5yHxuQ', 1577286369);
INSERT INTO `tokeninfo` VALUES (168, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODYzNzksImV4cCI6MTU3NzU0NTU3OSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.HonUrh9-4G7DO8HFEurOYoDxTOCrBuSzLeN98PT3Qws', 1577286379);
INSERT INTO `tokeninfo` VALUES (169, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODY0MTAsImV4cCI6MTU3NzU0NTYxMCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.LvSYt6YT4a_BI6W1OTxEXgBU_eiTcfa9d-F0S1SQ7Lg', 1577286410);
INSERT INTO `tokeninfo` VALUES (170, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODY0NjAsImV4cCI6MTU3NzU0NTY2MCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.arW0S9Qjx5UcncdWZRmV8YycD_wAyo3xpNa1zK3sniQ', 1577286460);
INSERT INTO `tokeninfo` VALUES (171, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODY1MzksImV4cCI6MTU3NzU0NTczOSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.piX0RbkJz5tCtgzXmt5eQRtFYXuZYm5ouU2CYa8s61o', 1577286539);
INSERT INTO `tokeninfo` VALUES (172, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODY2NTYsImV4cCI6MTU3NzU0NTg1NiwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.Ktn6Cfrb5xNRBm0h24nY9G4cyI-U2-TyjaCYvWYyyqw', 1577286656);
INSERT INTO `tokeninfo` VALUES (173, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODcyMDgsImV4cCI6MTU3NzU0NjQwOCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.0Eqx05rDHF_SSCLGgVyKwkM9AosTAdmyLgzQRqrv8rA', 1577287208);
INSERT INTO `tokeninfo` VALUES (177, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyODg0MjAsImV4cCI6MTU3NzU0NzYyMCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.drfLvt2tq-JihdZP-aQxBcfCLiKRwV66PtZSObGZS48', 1577288420);
INSERT INTO `tokeninfo` VALUES (178, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyOTc5MjUsImV4cCI6MTU3NzU1NzEyNSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.aqtzwGYLe5hH2Cvnvjx8064PcLsiQRI2Evb26XoxruM', 1577297925);
INSERT INTO `tokeninfo` VALUES (179, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyOTc5NDUsImV4cCI6MTU3NzU1NzE0NSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.GU-hQ2O0mobFIYwb54WoVdRdOjg-YzLaSZJUIaC5DIo', 1577297945);
INSERT INTO `tokeninfo` VALUES (180, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyOTg0NzEsImV4cCI6MTU3NzU1NzY3MSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.8M2w7fkFJFKvJf2_S4qOFJAzzF3yotuRLABbZqT7p94', 1577298471);
INSERT INTO `tokeninfo` VALUES (181, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyOTg1NjgsImV4cCI6MTU3NzU1Nzc2OCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.7dJokMXEecWHmqOX6dwg8va-Otr4CsW0PcOE5Pt8_70', 1577298568);
INSERT INTO `tokeninfo` VALUES (182, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyOTg3NzksImV4cCI6MTU3NzU1Nzk3OSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.TgD3f9cQJgqDc8SdZgHjqFAklV4LQ1DP056wKAVoesg', 1577298779);
INSERT INTO `tokeninfo` VALUES (183, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyOTg4NzUsImV4cCI6MTU3NzU1ODA3NSwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.U39zAlmeIzj8w7Pqf57eHpCGPP5PWXcrScHo0qwWaeM', 1577298875);
INSERT INTO `tokeninfo` VALUES (184, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyOTg4ODcsImV4cCI6MTU3NzU1ODA4NywidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.geQ_6uANi2kbP36A70SZM2DBK-lxGLRkrEtAGKaRD2Q', 1577298887);
INSERT INTO `tokeninfo` VALUES (185, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyOTg5MDgsImV4cCI6MTU3NzU1ODEwOCwidXNlcmlkIjoiNTMiLCJpc3MiOiJsd3MifQ.ShqaE9Syrf-0VYa8czwlED6JS8bqw_aVaoT47KLCWwE', 1577298908);
INSERT INTO `tokeninfo` VALUES (186, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyOTg5NTMsImV4cCI6MTU3NzU1ODE1MywidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.7iO2XEjg8WhjcI0yZaHMJr6EE0txpnbTTlWJxNRRdfY', 1577298953);
INSERT INTO `tokeninfo` VALUES (187, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzcyOTkwMTYsImV4cCI6MTU3NzU1ODIxNiwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.hbcXalOAl4GtlmgxgMc5-6G52fBx1YplR-8KCpCs6e8', 1577299016);
INSERT INTO `tokeninfo` VALUES (188, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzczMjE1NzgsImV4cCI6MTU3NzU4MDc3OCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.HrhYb8AEGsSn1RNOjkXCZS-01BwzPkuMuDR2fGiGrrc', 1577321578);
INSERT INTO `tokeninfo` VALUES (189, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzczMjI1ODAsImV4cCI6MTU3NzU4MTc4MCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.iiGhNoCvq0CS7iTtuRq0TJx8XKGOJtRhSmpvwAVH9b0', 1577322580);
INSERT INTO `tokeninfo` VALUES (190, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzczMjMwNDksImV4cCI6MTU3NzU4MjI0OSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.5RFfvletGbuFwnNeUUjR0kk9VDHK0LrITodjQQyi2Tw', 1577323049);
INSERT INTO `tokeninfo` VALUES (191, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzczMjMwOTcsImV4cCI6MTU3NzU4MjI5NywidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9._QiJ5IM9fR8-7BE7yPuRohRkV04DFthVtJjPqWjgLBw', 1577323097);
INSERT INTO `tokeninfo` VALUES (192, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzczMjM1NDMsImV4cCI6MTU3NzU4Mjc0MywidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.R_l2idY4PV78uS69cKCbnapQPBJVqShDIwYr8nDVsrk', 1577323543);
INSERT INTO `tokeninfo` VALUES (193, 67, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzczNDEwODAsImV4cCI6MTU3NzYwMDI4MCwidXNlcmlkIjoiNjciLCJpc3MiOiJsd3MifQ.uH8cDyysTewX8YTmDsrrPo9qji78PxjaXuq13fKb6h8', 1577341080);
INSERT INTO `tokeninfo` VALUES (194, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzczNDEyMTUsImV4cCI6MTU3NzYwMDQxNSwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.Cc8fJIJhe6cBjHl4Z7qsXASiqWtNZfmbvVLLnLtwIdw', 1577341215);
INSERT INTO `tokeninfo` VALUES (195, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzczNDc0MzQsImV4cCI6MTU3NzYwNjYzNCwidXNlcmlkIjoiMSIsImlzcyI6Imx3cyJ9.G_rsxwBKEJ_KKsBiys8xwQUjCmzq_k2D8YkdrHEdPXo', 1577347434);
COMMIT;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of type
-- ----------------------------
BEGIN;
INSERT INTO `type` VALUES (1, '前端', NULL);
INSERT INTO `type` VALUES (2, '后端开发', NULL);
INSERT INTO `type` VALUES (3, '移动端开发', NULL);
INSERT INTO `type` VALUES (4, '算法&数学', NULL);
INSERT INTO `type` VALUES (5, '前言技术', NULL);
INSERT INTO `type` VALUES (6, '云计算&大数据', NULL);
INSERT INTO `type` VALUES (7, '运维&测试', NULL);
INSERT INTO `type` VALUES (8, 'SQL', NULL);
INSERT INTO `type` VALUES (9, 'UI设计&多媒体', NULL);
INSERT INTO `type` VALUES (10, '游戏', NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_course
-- ----------------------------
DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course` (
  `userid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `last_percent` int(11) DEFAULT NULL,
  `last_chapter_id` int(11) DEFAULT NULL,
  `rate` int(255) DEFAULT NULL,
  PRIMARY KEY (`userid`,`courseid`),
  KEY `FK6053k81vyakudfqh8ynqaaux6` (`courseid`),
  CONSTRAINT `FK4jorqor5moi6s3j6bmbaqvo9y` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK6053k81vyakudfqh8ynqaaux6` FOREIGN KEY (`courseid`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `res_course_pk` FOREIGN KEY (`courseid`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `res_user_pk` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_course
-- ----------------------------
BEGIN;
INSERT INTO `user_course` VALUES (1, 1, 1, 1, 100);
COMMIT;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `totally_watching_num` int(11) DEFAULT '0',
  `totally_watching_times` int(11) DEFAULT '0',
  `exp` int(11) DEFAULT '0',
  `isVIP` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_info_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_info
-- ----------------------------
BEGIN;
INSERT INTO `user_info` VALUES (1, 'miaoz', '12345678', '1341312038@qq.com', '18890012973', 'MAN', 'http://vue13.oss-cn-chengdu.aliyuncs.com/1577298991558', 11, 1231, 2000, 1);
INSERT INTO `user_info` VALUES (52, 'cjmHK', '12345678', '46076014@qq.com', '18807422840', 'MAN', 'http://vue13.oss-cn-chengdu.aliyuncs.com/user_avatar/20191226144321.jpg', 0, 0, 0, 1);
INSERT INTO `user_info` VALUES (53, 'wuruofeng', 'wuruofeng', '879932318@qq.com', '18890012973', 'MAN', 'http://vue13.oss-cn-chengdu.aliyuncs.com/1577275086603', 12, 123, 2222, 0);
INSERT INTO `user_info` VALUES (60, 'ycyz', '123456', '2584268707@qq.com', '18890012973', 'MAN', 'http://vue13.oss-cn-chengdu.aliyuncs.com/1577279622350', 11, 1111, 22, 1);
INSERT INTO `user_info` VALUES (67, 'test', 'wuruofeng', NULL, '18890012973', NULL, 'http://vue13.oss-cn-chengdu.aliyuncs.com/1577341129727', 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for user_term
-- ----------------------------
DROP TABLE IF EXISTS `user_term`;
CREATE TABLE `user_term` (
  `term_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `is_like` int(11) DEFAULT NULL,
  PRIMARY KEY (`term_id`,`user_id`),
  KEY `FKsw1yb4furgxq9wha38md2w1jf` (`user_id`),
  CONSTRAINT `FK1q9gmsebfsty95vmb262jers` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKsw1yb4furgxq9wha38md2w1jf` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `res_term_user` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `res_user_term` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_term
-- ----------------------------
BEGIN;
INSERT INTO `user_term` VALUES (1, 1, 100, 1);
INSERT INTO `user_term` VALUES (2, 1, 100, 1);
INSERT INTO `user_term` VALUES (3, 1, 0, 1);
INSERT INTO `user_term` VALUES (4, 1, 100, 1);
INSERT INTO `user_term` VALUES (5, 1, 100, 1);
INSERT INTO `user_term` VALUES (6, 1, 100, 0);
INSERT INTO `user_term` VALUES (6, 52, 100, 0);
INSERT INTO `user_term` VALUES (8, 52, 100, 0);
INSERT INTO `user_term` VALUES (9, 53, 100, 1);
INSERT INTO `user_term` VALUES (11, 53, 50, 0);
INSERT INTO `user_term` VALUES (12, 1, 0, 1);
INSERT INTO `user_term` VALUES (14, 1, 0, 1);
INSERT INTO `user_term` VALUES (15, 53, 0, 1);
INSERT INTO `user_term` VALUES (16, 1, 0, 1);
INSERT INTO `user_term` VALUES (24, 1, 22, 1);
INSERT INTO `user_term` VALUES (25, 1, 100, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
