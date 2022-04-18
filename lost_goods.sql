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
INSERT INTO `lost_goods` VALUES (6, '0/lostgoods/be168e90-3cb9-499f-bce5-16f87aa58bf3.jpeg&', 'iPhone透明印有宇航员图案，颜色捎带点儿紫色', '丢了一个手机壳', 0, '生活用品&', '2022-04-16 21:45:25', '中原万达广场三楼&郑州市', '2022-04-12 00:00:00', 23);
INSERT INTO `lost_goods` VALUES (7, '/lostgoods/054449a2-f3b9-4013-85da-1e2da0c37ace.jpg&', 'Redmi Note 11 5G 天玑810 33W Pro快充 5000mAh大电池 6GB +128GB 浅梦星河 智能手机 小米 红米', '手机', 0, '手机&', '2022-04-17 22:23:43', '操场&漯河市', '2022-04-01 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (8, '/lostgoods/fa85487a-5247-40b0-88d2-459eb3b5ff76.jpg&', '一加 9RT 5G 120Hz 高刷好屏12GB+256GB 暗物质 高通骁龙888 65T快充 原神专业超广角拍照手机', '手机', 0, '手机&', '2022-04-17 22:25:39', '餐厅二楼&漯河市', '2022-04-02 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (9, '/lostgoods/dd2fcd2d-af79-4353-b9a8-de326d5cafb3.jpg&', '迪奥Dior口红全新烈艳蓝金唇膏哑光999#3.5g(唇膏女 传奇正红 生日礼物', '口红', 0, '生活用品&', '2022-04-18 11:24:19', '餐厅二楼&漯河市', '2022-04-09 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (10, '/lostgoods/c88d5341-e465-478d-9af4-464cd73de950.jpg&', '丹麦进口 皇冠（danisa）曲奇饼干908g+150g爱时乐礼盒装 新年年货礼盒 休闲零食饼干 送礼品团购', '饼干', 0, '食品&', '2022-04-18 11:26:37', '人民公园&漯河市', '2022-04-08 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (11, '/lostgoods/128a4db3-cecc-4af0-a025-dfe2a8baff10.jpg&', '宝路成犬狗粮7.5kg牛肉味泰迪茶杯犬柯基全犬种通用全价粮', '狗粮', 0, '食品&', '2022-04-18 11:28:00', '人民广场&漯河市', '2022-04-10 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (12, '/lostgoods/3ff2e966-46f4-48e6-b603-a52576b074ae.jpg&', '澳雪(accen)经典滋润沐浴露套装 清爽+美肌+紧致 750ml*3瓶', '沐浴露', 0, '生活用品&', '2022-04-18 11:29:27', '西沙椰林澡堂&漯河市', '2022-04-15 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (13, '/lostgoods/b233173b-24fb-49ab-a7b6-479ef9ad0c42.jpg&', '舒肤佳沐浴露3.85kg大瓶家庭装男女通用(纯白1kg+薰衣草1kg+青瓜1kg+芦荟400g+洗手液225*2)', '沐浴露', 0, '生活用品&', '2022-04-18 11:31:45', '天上人间&漯河市', '2022-04-04 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (14, '/lostgoods/a8d0c0c0-f8d4-4ceb-bc7e-8fbc24afd03f.jpg&', '安尔雅楠竹简易鞋架门口宿舍竹子多功能鞋架子多层鞋柜家用收纳置物架非实木', '鞋架', 0, '生活用品&', '2022-04-18 11:34:00', '中原区出租屋&漯河市', '2022-04-04 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (15, '/lostgoods/ead04a89-72bb-4eac-9b38-3d95ffc9e16e.jpg&', 'HUAWEI P50 原色双影像单元 搭载HarmonyOS 2 万象双环设计 支持66W超级快充 8GB+256GB可可茶金 华为手机', '华为手机', 0, '手机&', '2022-04-18 11:35:23', '碧沙岗公园&漯河市', '2022-04-08 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (16, '/lostgoods/87eb63ef-1b0f-4b9d-aa90-c7fcf3afbdf1.jpg&', '华为Mate40Pro 麒麟9000 SoC芯片 8GB+256GB 秘银色 5G全网通手机（无充电器和数据线）', '华为手机', 0, '手机&', '2022-04-18 11:36:18', '郑州市中原福塔&漯河市', '2022-04-08 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (17, '/lostgoods/dc8b54c5-39c9-48e1-a6be-71b7a2f27a89.jpg&', '小米11 Ultra 至尊 5G 骁龙888 2K AMOLED四曲面柔性屏 陶瓷工艺 12GB+256GB 黑色 游戏手机', '小米手机', 0, '手机&', '2022-04-18 11:37:24', '嵩山少林寺&漯河市', '2022-04-13 00:00:00', 24);


SET FOREIGN_KEY_CHECKS = 1;
