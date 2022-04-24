/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : lostandfound

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 24/04/2022 18:14:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission`;
CREATE TABLE `admin_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `pid` int(0) NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限描述',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '可访问的url',
  PRIMARY KEY (`id`, `pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `uid` int(0) NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色状态',
  PRIMARY KEY (`id`, `uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permission`;
CREATE TABLE `admin_role_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `rid` int(0) DEFAULT NULL COMMENT '角色id',
  `pid` int(0) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(0) NOT NULL COMMENT 'uid，不可重复',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理员名',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`, `uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, 1, 'jack', 'haha', '18703600437');

-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `uid` int(0) DEFAULT NULL COMMENT '用户id',
  `rid` int(0) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(0) DEFAULT NULL COMMENT '用户ID',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内容',
  `lid` int(0) DEFAULT NULL COMMENT '寻物信息',
  `fid` int(0) DEFAULT NULL COMMENT '失物信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for found_goods
-- ----------------------------
DROP TABLE IF EXISTS `found_goods`;
CREATE TABLE `found_goods`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片，URL地址，用&进行分割',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情描述',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '失物招领标题',
  `state` int(0) DEFAULT NULL COMMENT '认领状态',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签',
  `create_time` timestamp(0) DEFAULT NULL COMMENT '发布日期',
  `found_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '找到区域',
  `found_time` timestamp(0) DEFAULT NULL COMMENT '找到日期',
  `uid` int(0) DEFAULT NULL COMMENT '发布者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of found_goods
-- ----------------------------
INSERT INTO `found_goods` VALUES (1, '/foundgoods/059bc856-7778-465c-95af-b1955f2a4ce2.jpg&', '一串钥匙，有个小娃娃挂件', '我在万达金街捡到一串钥匙', 0, '生活用品&', '2022-04-16 16:42:25', '万达金街蜜雪冰城&郑州市', '2022-04-12 00:00:00', 22);
INSERT INTO `found_goods` VALUES (2, '/foundgoods/d3f502e8-9cb8-487f-bde7-1a62813adad4.jpeg&', '黑色、华为充电宝', '捡到一个充电宝', 0, '电子产品&生活用品&', '2022-04-16 21:32:59', '中原工学院操场&郑州市', '2022-04-08 00:00:00', 23);
INSERT INTO `found_goods` VALUES (3, '/foundgoods/5ff987c8-be58-4bc3-bc0f-e1d6f80576ff.jpeg&', '长款钱包、桔色、牌子是Prada', '捡到一个钱包', 0, '生活用品&现金&卡&', '2022-04-16 21:37:41', '郑州市金水区&郑州市', '2022-04-16 00:00:00', 23);
INSERT INTO `found_goods` VALUES (4, '/foundgoods/062a3c86-f7b6-4c9b-85a5-e91aa0a6afec.jpeg&', '粉色保温杯、400ml', '捡到一个水杯', 0, '生活用品&', '2022-04-16 21:38:37', '中原工学院食堂&郑州市', '2022-04-14 00:00:00', 23);
INSERT INTO `found_goods` VALUES (5, '/foundgoods/c0ee55ef-88a8-4e63-a94c-aa6e35bba35f.jpeg&', '流苏木簪、古风', '捡到一个木簪', 0, '生活用品&', '2022-04-16 21:39:26', '中原工学院操场&郑州市', '2022-04-08 00:00:00', 23);
INSERT INTO `found_goods` VALUES (6, '/foundgoods/c3950733-3730-4f10-ae2a-44aab55f3394.jpeg&', '黑色商务、封皮右上角印有dairy字样', '捡到一本笔记本', 0, '生活用品&', '2022-04-16 21:40:32', '中原万达咖啡厅&郑州市', '2022-04-12 00:00:00', 23);
INSERT INTO `found_goods` VALUES (7, '/foundgoods/735fde9e-070f-4490-b614-65d38f875a48.jpg&', 'AGM G1 Pro 红外热成像强光手电筒版户外三防5G超低温手机 4800万高清四摄 全网通双模5G智能手机', '手机', 0, '手机&', '2022-04-18 11:39:18', '中原区万达广场&漯河市', '2022-04-23 00:00:00', 24);
INSERT INTO `found_goods` VALUES (8, '/foundgoods/565498e2-1631-4f35-b695-a51e481859d0.jpg&', '范西帕FANXIPA轻奢品牌新款包包潮简约小方包原创单肩时尚百搭女包斜挎女生日礼物 绿拼白【精美礼盒】', '包包', 0, '生活用品&', '2022-04-18 11:40:44', '郑州市中原区万达广场&漯河市', '2022-04-02 00:00:00', 24);
INSERT INTO `found_goods` VALUES (9, '/foundgoods/19abe95c-042d-495f-b833-bee580d43734.jpg&', '玫纳蒂奢侈品包包女包猫咪包新款单肩包时尚链条小方包女士斜挎包', '包包', 0, '生活用品&', '2022-04-18 11:42:12', '郑州市中原区锦艺城&漯河市', '2022-04-07 00:00:00', 24);
INSERT INTO `found_goods` VALUES (10, '/foundgoods/4f2477cd-a316-4f18-8936-cfbf9a8114cc.jpg&', '斗禾（DOUHE）家用智能电风扇 落地遥控式32档风量调节12h定时摇头 母婴级空气循环扇XHD01 美诺高级白', '小风扇', 0, '电子产品&生活用品&', '2022-04-18 11:44:41', '二七塔附近&漯河市', '2022-04-14 00:00:00', 24);
INSERT INTO `found_goods` VALUES (11, '/foundgoods/666afc91-655a-4a5a-bfc9-846721c16578.jpg&', '罗技（G）G502 HERO主宰者游戏鼠标电竞鼠标有线RGB机械配重竞技FPS吃鸡lol宏cf', '鼠标', 0, '电子产品&', '2022-04-18 11:46:12', '中原区一品香老碗面&漯河市', '2022-04-02 00:00:00', 24);
INSERT INTO `found_goods` VALUES (12, '/foundgoods/e95b994d-c894-4360-97fc-e6315a2d70c1.jpg&', '华为HUAWEI MatePad 11 2021款120Hz高刷全面屏 鸿蒙HarmonyOS 影音娱乐办公学习平板电脑8+128GB WIFI曜石灰', '平板电脑', 0, '电子产品&', '2022-04-18 11:47:31', '爱学习自习室&漯河市', '2022-04-13 00:00:00', 24);
INSERT INTO `found_goods` VALUES (13, '/foundgoods/927c253c-c237-4800-8f80-1b1838bee64b.jpg&', 'Apple iPad Air 10.9英寸平板电脑 2022年款WLAN版/M1芯片 星光色 WLAN版256GB(官方标配)', '平板电脑', 0, '电子产品&', '2022-04-18 11:49:48', '步步登高自习室&漯河市', '2022-04-14 00:00:00', 24);

-- ----------------------------
-- Table structure for lost_goods
-- ----------------------------
DROP TABLE IF EXISTS `lost_goods`;
CREATE TABLE `lost_goods`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片，URL地址，用&进行分割',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情描述',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '寻物启事标题',
  `state` int(0) DEFAULT NULL COMMENT '认领状态',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签',
  `create_time` timestamp(0) DEFAULT NULL COMMENT '发布日期',
  `lost_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '丢失区域',
  `lost_time` timestamp(0) DEFAULT NULL COMMENT '丢失日期',
  `uid` int(0) DEFAULT NULL COMMENT '发布者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lost_goods
-- ----------------------------
INSERT INTO `lost_goods` VALUES (1, '/lostgoods/87eb63ef-1b0f-4b9d-aa90-c7fcf3afbdf1.jpg&', '黑色的华为mate30', '我在中原万达丢了一部手机', 0, '电子产品&手机&', '2022-04-16 16:29:36', '中原万达万达金街蜜雪冰城&郑州市', '2022-04-12 00:00:00', 22);
INSERT INTO `lost_goods` VALUES (2, '/lostgoods/8a890cb9-687e-4b04-9d05-a9ea31625d44.jpeg&', '黑色华为无外套充电宝', '丢了一个充电宝', 0, '电子产品&生活用品&', '2022-04-16 21:31:58', '中原工学院操场&郑州市', '2022-04-08 00:00:00', 23);
INSERT INTO `lost_goods` VALUES (3, '/lostgoods/216bd9cc-0c0d-4fd0-b8ac-16d51432006f.jpeg&', '桔色女士牛皮长款Prada钱包', '丢失一个钱包', 0, '生活用品&卡&现金&', '2022-04-16 21:34:33', '郑州市金水区&郑州市', '2022-04-15 00:00:00', 23);
INSERT INTO `lost_goods` VALUES (4, '/lostgoods/e800325d-74c4-4570-b257-c89f46f3265e.jpeg&', '白色帆布包，上面印有“当我在追光，我与光同航”字样', '遗失一个帆布包', 0, '生活用品&', '2022-04-16 21:42:11', '锦艺城A座&郑州市', '2022-04-14 00:00:00', 23);
INSERT INTO `lost_goods` VALUES (5, '/lostgoods/24a57f75-fd2c-4f7b-ba8d-1ebad2a3776d.jpeg&', '女款牛仔短外套', '丢了一件牛仔外套', 0, '生活用品&', '2022-04-16 21:43:45', '中原区绿城广场&郑州市', '2022-04-14 00:00:00', 23);
INSERT INTO `lost_goods` VALUES (6, '/lostgoods/be168e90-3cb9-499f-bce5-16f87aa58bf3.jpeg&', 'iPhone透明印有宇航员图案，颜色捎带点儿紫色', '丢了一个手机壳', 0, '生活用品&', '2022-04-16 21:45:25', '中原万达广场三楼&郑州市', '2022-04-12 00:00:00', 23);
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

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公告内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_base
-- ----------------------------
DROP TABLE IF EXISTS `user_base`;
CREATE TABLE `user_base`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户ID',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名，可重复',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户邮箱，唯一',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_role` tinyint unsigned COMMENT '1正常用户 2身份认证用户 3学生认证用户 4禁言用户 5注销用户 6管理员',
  `face` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '头像',
  `create_time` timestamp(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_base
-- ----------------------------
INSERT INTO `user_base` VALUES (22, '8e36a7e9-16cd-4d3e-acbc-a036b89a4714', '于我', '1612253221@qq.com', 'haha', NULL, 1, '', '2022-04-16 14:51:42', NULL);
INSERT INTO `user_base` VALUES (23, '174de058-3877-41d1-9a30-fa48ce7a2ed0', '沙雕王', '1853053252@qq.com', 'yyqx', NULL, 1, '', '2022-04-16 14:58:36', NULL);
INSERT INTO `user_base` VALUES (24, 'e4bbf5eb-ee3e-43d2-afa6-e350f45d6658', '韩先生', '645693789@qq.com', 'hyy', NULL, 1, '', '2022-04-16 14:58:50', NULL);

-- ----------------------------
-- Table structure for user_contact_information
-- ----------------------------
DROP TABLE IF EXISTS `user_contact_information`;
CREATE TABLE `user_contact_information`  (
  `id` int(0) NOT NULL COMMENT 'id',
  `uid` int(0) NOT NULL COMMENT '用户的id',
  `appellation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留下的称呼',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'QQ',
  `wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `microblogging` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微博',
  `other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '其他',
  PRIMARY KEY (`id`, `uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
