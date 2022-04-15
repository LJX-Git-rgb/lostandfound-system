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

 Date: 15/04/2022 16:44:51
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片，URL地址，用&进行分割',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情描述',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '失物招领标题',
  `state` int DEFAULT NULL COMMENT '认领状态',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签',
  `create_time` datetime DEFAULT NULL COMMENT '发布日期',
  `found_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '找到区域',
  `found_time` timestamp NULL DEFAULT NULL COMMENT '找到日期',
  `uid` int DEFAULT NULL COMMENT '发布者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of found_goods
-- ----------------------------
BEGIN;
INSERT INTO `found_goods` VALUES (1, '01.jpg', '白色蓝牙耳机,亚太楼', '耳机', 0, '电子产品', '2022-01-01 21:55:45', '亚太楼', '2022-01-01 21:00:00', NULL);
INSERT INTO `found_goods` VALUES (2, '02.jpg', '椭圆形眼镜片', '镜片', 0, '生活用品', '2022-01-02 22:18:58', '操场', '2022-01-02 12:00:00', NULL);
INSERT INTO `found_goods` VALUES (3, '03.jpg', '圆领白色T恤', '衣服', 1, '生活用品', '2022-01-03 22:00:00', '亚太楼', '2022-01-03 21:00:00', NULL);
INSERT INTO `found_goods` VALUES (4, '04.jpg', '运动跑步手环', '手环', 1, '电子产品', '2022-02-02 12:00:00', '亚太楼', '2022-02-03 17:00:00', NULL);
INSERT INTO `found_goods` VALUES (5, '05.jpg', '特百惠黑色水杯', '水杯', 1, '生活用品', '2022-03-05 16:00:00', '餐厅', '2022-03-06 18:00:00', NULL);
INSERT INTO `found_goods` VALUES (12, '/foundgoods/a4d6cfd8-5950-484b-a901-c55d58b62a71.jpeg&', 'airpods右耳', '我丢了一个耳机', 0, '电子产品&', '2022-04-15 15:20:10', '亚太楼', '2022-04-22 15:17:45', 21);
COMMIT;

-- ----------------------------
-- Table structure for lost_goods
-- ----------------------------
DROP TABLE IF EXISTS `lost_goods`;
CREATE TABLE `lost_goods` (
  `id` bigint NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片，URL地址，用&进行分割',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情描述',
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
INSERT INTO `lost_goods` VALUES (1, '01.jpg', '白色蓝牙耳机,亚太楼', '耳机', '否', '电子产品', '2022-01-01 21:55:45', '亚太楼', '2022-01-01 21:00:00', NULL, NULL);
INSERT INTO `lost_goods` VALUES (2, '02.jpg', '椭圆形眼镜片', '镜片', '否', '生活用品', '2022-01-02 22:18:58', '操场', '2022-01-02 12:00:00', NULL, NULL);
INSERT INTO `lost_goods` VALUES (3, '03.jpg', '圆领白色T恤', '衣服', '是', '生活用品', '2022-01-03 22:00:00', '亚太楼', '2022-01-03 21:00:00', NULL, NULL);
INSERT INTO `lost_goods` VALUES (4, '04.jpg', '运动跑步手环', '手环', '是', '电子产品', '2022-02-02 12:00:00', '亚太楼', '2022-02-03 17:00:00', NULL, NULL);
INSERT INTO `lost_goods` VALUES (5, '05.jpg', '特百惠黑色水杯', '水杯', '是', '生活用品', '2022-03-05 16:00:00', '餐厅', '2022-03-06 18:00:00', NULL, NULL);
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
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户邮箱，唯一',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `gender` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '用户性别 0-female 1-male',
  `user_role` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '1正常用户 2身份认证用户 3学生认证用户 4禁言用户 5注销用户 6管理员',
  `face` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user_base
-- ----------------------------
BEGIN;
INSERT INTO `user_base` VALUES (21, 'b518aa93-faec-4b65-bfe3-87a1ef55d2cf', '1612253221@qq.com', '1111', 0, 1, '', 0, 0);
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
