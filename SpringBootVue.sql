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

 Date: 16/04/2022 16:43:23
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片，URL地址，用&进行分割',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情描述',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '失物招领标题',
  `state` int DEFAULT NULL COMMENT '认领状态',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '发布日期',
  `found_area` varchar(255) DEFAULT NULL COMMENT '找到区域',
  `found_time` timestamp NULL DEFAULT NULL COMMENT '找到日期',
  `uid` int DEFAULT NULL COMMENT '发布者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of found_goods
-- ----------------------------
BEGIN;
INSERT INTO `found_goods` VALUES (13, '/foundgoods/93748c94-3911-46ba-a9a5-ccb860b66ee0.jpg&', '黑色的华为mate30', '我在万达金街捡到一部手机', 0, '电子产品&手机&', '2022-04-16 16:42:25', '万达金街蜜雪冰城&郑州市', '2022-04-12 00:00:00', 22);
COMMIT;

-- ----------------------------
-- Table structure for lost_goods
-- ----------------------------
DROP TABLE IF EXISTS `lost_goods`;
CREATE TABLE `lost_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片，URL地址，用&进行分割',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情描述',
  `title` varchar(255) DEFAULT NULL COMMENT '寻物启事标题',
  `state` int DEFAULT NULL COMMENT '认领状态',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '发布日期',
  `lost_area` varchar(255) DEFAULT NULL COMMENT '丢失区域',
  `lost_time` timestamp NULL DEFAULT NULL COMMENT '丢失日期',
  `uid` int DEFAULT NULL COMMENT '发布者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of lost_goods
-- ----------------------------
BEGIN;
INSERT INTO `lost_goods` VALUES (1, '/lostgoods/bb52eb4a-d288-4c4f-9813-d85aa54bcc6c.jpg&', '黑色的华为mate30', '我在中原万达丢了一部手机', 0, '电子产品&手机&', '2022-04-16 16:29:36', '中原万达万达金街蜜雪冰城&郑州市', '2022-04-12 00:00:00', 22);
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
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户ID',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '用户名，可重复',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户邮箱，唯一',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `gender` varchar(255) DEFAULT NULL,
  `user_role` tinyint unsigned DEFAULT '1' COMMENT '1正常用户 2身份认证用户 3学生认证用户 4禁言用户 5注销用户 6管理员',
  `face` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '头像',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user_base
-- ----------------------------
BEGIN;
INSERT INTO `user_base` VALUES (22, '8e36a7e9-16cd-4d3e-acbc-a036b89a4714', '于我', '1612253221@qq.com', 'haha', NULL, 1, '', '2022-04-16 14:51:42', NULL);
INSERT INTO `user_base` VALUES (23, '174de058-3877-41d1-9a30-fa48ce7a2ed0', '沙雕王', '1853053252@qq.com', 'yyqx', NULL, 1, '', '2022-04-16 14:58:36', NULL);
INSERT INTO `user_base` VALUES (24, 'e4bbf5eb-ee3e-43d2-afa6-e350f45d6658', '韩先生', '645693789@qq.com', 'hyy', NULL, 1, '', '2022-04-16 14:58:50', NULL);
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
