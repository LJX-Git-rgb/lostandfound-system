/*
 Navicat Premium Data Transfer

 Source Server         : mysql8
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : SpringBootVue

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 30/03/2022 16:45:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission`;
CREATE TABLE `admin_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `permission` varchar(255) DEFAULT NULL COMMENT '权限',
  `description` varchar(255) DEFAULT NULL COMMENT '权限描述',
  `url` varchar(255) DEFAULT NULL COMMENT '可访问的url',
  PRIMARY KEY (`id`,`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of admin_permission
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `status` varchar(255) DEFAULT NULL COMMENT '角色状态',
  PRIMARY KEY (`id`,`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permission`;
CREATE TABLE `admin_role_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rid` int DEFAULT NULL COMMENT '角色id',
  `pid` int DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of admin_role_permission
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int NOT NULL COMMENT 'uid，不可重复',
  `name` varchar(255) DEFAULT NULL COMMENT '管理员名',
  `pwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
BEGIN;
INSERT INTO `admin_user` VALUES (1, 111, 'Jason', 'admin', '15237283531');
COMMIT;

-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL COMMENT '用户id',
  `rid` int DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of admin_user_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for found_goods
-- ----------------------------
DROP TABLE IF EXISTS `found_goods`;
CREATE TABLE `found_goods` (
  `id` bigint NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片，URL地址，用&进行分割',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情描述',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '失物招领标题',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '认领状态',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签',
  `create_time` datetime DEFAULT NULL COMMENT '发布日期',
  `found_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '找到区域',
  `found_time` datetime DEFAULT NULL COMMENT '找到日期',
  `uid` int DEFAULT NULL COMMENT '发布者',
  `lost_id` bigint DEFAULT NULL COMMENT '匹配到的寻物启事id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of found_goods
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lost_found
-- ----------------------------
DROP TABLE IF EXISTS `lost_found`;
CREATE TABLE `lost_found` (
  `lid` bigint DEFAULT NULL,
  `fid` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of lost_found
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lost_goods
-- ----------------------------
DROP TABLE IF EXISTS `lost_goods`;
CREATE TABLE `lost_goods` (
  `id` bigint NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片，URL地址，用&进行分割',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情描述',
  `title` varchar(255) DEFAULT NULL COMMENT '寻物启事标题',
  `state` varchar(255) DEFAULT NULL COMMENT '认领状态',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `create_time` datetime DEFAULT NULL COMMENT '发布日期',
  `lost_area` varchar(255) DEFAULT NULL COMMENT '丢失区域',
  `lost_time` datetime DEFAULT NULL COMMENT '丢失日期',
  `uid` int DEFAULT NULL COMMENT '发布者',
  `found_id` bigint DEFAULT NULL COMMENT '匹配到的失物招领id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of lost_goods
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for university
-- ----------------------------
DROP TABLE IF EXISTS `university`;
CREATE TABLE `university` (
  `id` bigint NOT NULL,
  `university_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of university
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_base
-- ----------------------------
DROP TABLE IF EXISTS `user_base`;
CREATE TABLE `user_base` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL COMMENT '用户ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名，唯一',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `gender` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '用户性别 0-female 1-male',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户绑定的邮箱',
  `user_role` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '1正常用户 2身份认证用户 3学生认证用户 4禁言用户 5注销用户 6管理员',
  `face` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `student_id` int NOT NULL DEFAULT '0' COMMENT '学生用户的学号',
  `university_id` bigint NOT NULL DEFAULT '0' COMMENT '学生用户绑定的学校',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_name` (`user_name`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user_base
-- ----------------------------
BEGIN;
INSERT INTO `user_base` VALUES (1, '661a3d12-2581-467d-92e3-c6d3221c5d09', 'Jason', 'haha', 0, '', 1, '', 0, 0, 0, 0);
INSERT INTO `user_base` VALUES (17, '5947a12f-123e-4e07-a452-1cd8a728f8d3', 'nick', 'nick', 0, '', 1, '', 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for user_contact_information
-- ----------------------------
DROP TABLE IF EXISTS `user_contact_information`;
CREATE TABLE `user_contact_information` (
  `id` int NOT NULL COMMENT 'id',
  `uid` int NOT NULL COMMENT '用户的id',
  `appellation` varchar(255) NOT NULL COMMENT '留下的称呼',
  `phone` varchar(255) NOT NULL COMMENT '电话',
  `qq` varchar(255) NOT NULL COMMENT 'QQ',
  `wechat` varchar(255) NOT NULL COMMENT '微信',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `microblogging` varchar(255) NOT NULL COMMENT '微博',
  `other` varchar(255) NOT NULL COMMENT '其他',
  PRIMARY KEY (`id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user_contact_information
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
