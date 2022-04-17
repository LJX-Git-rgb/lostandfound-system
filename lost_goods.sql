/*
 Navicat Premium Data Transfer

 Source Server         : lostfound
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3308
 Source Schema         : swzl

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 17/04/2022 13:52:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lost_goods
-- ----------------------------
DROP TABLE IF EXISTS `lost_goods`;
CREATE TABLE `lost_goods`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片，URL地址，用&进行分割',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情描述',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寻物启事标题',
  `state` int(0) NULL DEFAULT NULL COMMENT '认领状态',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '发布日期',
  `lost_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '丢失区域',
  `lost_time` timestamp(0) NULL DEFAULT NULL COMMENT '丢失日期',
  `uid` int(0) NULL DEFAULT NULL COMMENT '发布者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lost_goods
-- ----------------------------
INSERT INTO `lost_goods` VALUES (1, '/lostgoods/bb52eb4a-d288-4c4f-9813-d85aa54bcc6c.jpg&', '黑色的华为mate30', '我在中原万达丢了一部手机', 0, '电子产品&手机&', '2022-04-16 16:29:36', '中原万达万达金街蜜雪冰城&郑州市', '2022-04-12 00:00:00', 22);
INSERT INTO `lost_goods` VALUES (2, '/lostgoods/8a890cb9-687e-4b04-9d05-a9ea31625d44.jpeg&', '黑色华为无外套充电宝', '丢了一个充电宝', 0, '电子产品&生活用品&', '2022-04-16 21:31:58', '中原工学院操场&郑州市', '2022-04-08 00:00:00', 23);
INSERT INTO `lost_goods` VALUES (3, '/lostgoods/216bd9cc-0c0d-4fd0-b8ac-16d51432006f.jpeg&', '桔色女士牛皮长款Prada钱包', '丢失一个钱包', 0, '生活用品&卡&现金&', '2022-04-16 21:34:33', '郑州市金水区&郑州市', '2022-04-15 00:00:00', 23);
INSERT INTO `lost_goods` VALUES (4, '/lostgoods/e800325d-74c4-4570-b257-c89f46f3265e.jpeg&', '白色帆布包，上面印有“当我在追光，我与光同航”字样', '遗失一个帆布包', 0, '生活用品&', '2022-04-16 21:42:11', '锦艺城A座&郑州市', '2022-04-14 00:00:00', 23);
INSERT INTO `lost_goods` VALUES (5, '/lostgoods/24a57f75-fd2c-4f7b-ba8d-1ebad2a3776d.jpeg&', '女款牛仔短外套', '丢了一件牛仔外套', 0, '生活用品&', '2022-04-16 21:43:45', '中原区绿城广场&郑州市', '2022-04-14 00:00:00', 23);
INSERT INTO `lost_goods` VALUES (6, '/lostgoods/be168e90-3cb9-499f-bce5-16f87aa58bf3.jpeg&', 'iPhone透明印有宇航员图案，颜色捎带点儿紫色', '丢了一个手机壳', 0, '生活用品&', '2022-04-16 21:45:25', '中原万达广场三楼&郑州市', '2022-04-12 00:00:00', 23);

SET FOREIGN_KEY_CHECKS = 1;
