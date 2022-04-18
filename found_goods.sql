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

 Date: 17/04/2022 13:52:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for found_goods
-- ----------------------------
DROP TABLE IF EXISTS `found_goods`;
CREATE TABLE `found_goods`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片，URL地址，用&进行分割',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情描述',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失物招领标题',
  `state` int(0) NULL DEFAULT NULL COMMENT '认领状态',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '发布日期',
  `found_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '找到区域',
  `found_time` timestamp(0) NULL DEFAULT NULL COMMENT '找到日期',
  `uid` int(0) NULL DEFAULT NULL COMMENT '发布者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of found_goods
-- ----------------------------
INSERT INTO `found_goods` VALUES (13, '/foundgoods/93748c94-3911-46ba-a9a5-ccb860b66ee0.jpg&', '黑色的华为mate30', '我在万达金街捡到一部手机', 0, '电子产品&手机&', '2022-04-16 16:42:25', '万达金街蜜雪冰城&郑州市', '2022-04-12 00:00:00', 22);
INSERT INTO `found_goods` VALUES (14, '/foundgoods/d3f502e8-9cb8-487f-bde7-1a62813adad4.jpeg&', '黑色、华为充电宝', '捡到一个充电宝', 0, '电子产品&生活用品&', '2022-04-16 21:32:59', '中原工学院操场&郑州市', '2022-04-08 00:00:00', 23);
INSERT INTO `found_goods` VALUES (15, '/foundgoods/5ff987c8-be58-4bc3-bc0f-e1d6f80576ff.jpeg&', '长款钱包、桔色、牌子是Prada', '捡到一个钱包', 0, '生活用品&现金&卡&', '2022-04-16 21:37:41', '郑州市金水区&郑州市', '2022-04-16 00:00:00', 23);
INSERT INTO `found_goods` VALUES (16, '/foundgoods/062a3c86-f7b6-4c9b-85a5-e91aa0a6afec.jpeg&', '粉色保温杯、400ml', '捡到一个水杯', 0, '生活用品&', '2022-04-16 21:38:37', '中原工学院食堂&郑州市', '2022-04-14 00:00:00', 23);
INSERT INTO `found_goods` VALUES (17, '/foundgoods/c0ee55ef-88a8-4e63-a94c-aa6e35bba35f.jpeg&', '流苏木簪、古风', '捡到一个木簪', 0, '生活用品&', '2022-04-16 21:39:26', '中原工学院操场&郑州市', '2022-04-08 00:00:00', 23);
INSERT INTO `found_goods` VALUES (18, '/foundgoods/c3950733-3730-4f10-ae2a-44aab55f3394.jpeg&', '黑色商务、封皮右上角印有dairy字样', '捡到一本笔记本', 0, '生活用品&', '2022-04-16 21:40:32', '中原万达咖啡厅&郑州市', '2022-04-12 00:00:00', 23);
INSERT INTO `found_goods` VALUES (19, '/foundgoods/735fde9e-070f-4490-b614-65d38f875a48.jpg&', 'AGM G1 Pro 红外热成像强光手电筒版户外三防5G超低温手机 4800万高清四摄 全网通双模5G智能手机', '手机', 0, '手机&', '2022-04-18 11:39:18', '中原区万达广场&漯河市', '2022-04-23 00:00:00', 24);
INSERT INTO `found_goods` VALUES (20, '/foundgoods/565498e2-1631-4f35-b695-a51e481859d0.jpg&', '范西帕FANXIPA轻奢品牌新款包包潮简约小方包原创单肩时尚百搭女包斜挎女生日礼物 绿拼白【精美礼盒】', '包包', 0, '生活用品&', '2022-04-18 11:40:44', '郑州市中原区万达广场&漯河市', '2022-04-02 00:00:00', 24);
INSERT INTO `found_goods` VALUES (21, '/foundgoods/19abe95c-042d-495f-b833-bee580d43734.jpg&', '玫纳蒂奢侈品包包女包猫咪包新款单肩包时尚链条小方包女士斜挎包', '包包', 0, '生活用品&', '2022-04-18 11:42:12', '郑州市中原区锦艺城&漯河市', '2022-04-07 00:00:00', 24);
INSERT INTO `found_goods` VALUES (22, '/foundgoods/4f2477cd-a316-4f18-8936-cfbf9a8114cc.jpg&', '斗禾（DOUHE）家用智能电风扇 落地遥控式32档风量调节12h定时摇头 母婴级空气循环扇XHD01 美诺高级白', '小风扇', 0, '电子产品&生活用品&', '2022-04-18 11:44:41', '二七塔附近&漯河市', '2022-04-14 00:00:00', 24);
INSERT INTO `found_goods` VALUES (23, '/foundgoods/666afc91-655a-4a5a-bfc9-846721c16578.jpg&', '罗技（G）G502 HERO主宰者游戏鼠标电竞鼠标有线RGB机械配重竞技FPS吃鸡lol宏cf', '鼠标', 0, '电子产品&', '2022-04-18 11:46:12', '中原区一品香老碗面&漯河市', '2022-04-02 00:00:00', 24);
INSERT INTO `found_goods` VALUES (24, '/foundgoods/e95b994d-c894-4360-97fc-e6315a2d70c1.jpg&', '华为HUAWEI MatePad 11 2021款120Hz高刷全面屏 鸿蒙HarmonyOS 影音娱乐办公学习平板电脑8+128GB WIFI曜石灰', '平板电脑', 0, '电子产品&', '2022-04-18 11:47:31', '爱学习自习室&漯河市', '2022-04-13 00:00:00', 24);
INSERT INTO `found_goods` VALUES (25, '/foundgoods/927c253c-c237-4800-8f80-1b1838bee64b.jpg&', 'Apple iPad Air 10.9英寸平板电脑 2022年款WLAN版/M1芯片 星光色 WLAN版256GB(官方标配)', '平板电脑', 0, '电子产品&', '2022-04-18 11:49:48', '步步登高自习室&漯河市', '2022-04-14 00:00:00', 24);


SET FOREIGN_KEY_CHECKS = 1;
