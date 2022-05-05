/*
 Navicat Premium Data Transfer

 Source Server         : mysql80
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : lostandfound

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 05/05/2022 20:36:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uid，不可重复',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员名',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, '1', 'jack', 'haha', '18703600437');
INSERT INTO `admin_user` VALUES (2, '2', 'wmt', 'heihei', '1234567');
INSERT INTO `admin_user` VALUES (3, '3', 'hyy', 'lala', '1234567');

-- ----------------------------
-- Table structure for approve
-- ----------------------------
DROP TABLE IF EXISTS `approve`;
CREATE TABLE `approve`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '认证表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of approve
-- ----------------------------
INSERT INTO `approve` VALUES (15, 22, '1', '1');
INSERT INTO `approve` VALUES (16, 22, '1', '1');
INSERT INTO `approve` VALUES (17, 22, '', '');
INSERT INTO `approve` VALUES (18, 22, '1', '1');
INSERT INTO `approve` VALUES (19, 22, '1', '1');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `lid` int(11) NULL DEFAULT NULL COMMENT '寻物启事id',
  `fid` int(11) NULL DEFAULT NULL COMMENT '失物招领id',
  `state` int(11) NULL DEFAULT 0 COMMENT '表示是否被管理员处理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for found_goods
-- ----------------------------
DROP TABLE IF EXISTS `found_goods`;
CREATE TABLE `found_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片，URL地址，用&进行分割',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情描述',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失物招领标题',
  `state` int(11) NULL DEFAULT NULL COMMENT '认领状态',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签,&进行分割',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '发布日期',
  `found_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '找到区域',
  `found_time` timestamp(0) NULL DEFAULT NULL COMMENT '找到日期',
  `uid` int(11) NULL DEFAULT NULL COMMENT '发布者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of found_goods
-- ----------------------------
INSERT INTO `found_goods` VALUES (1, '/foundgoods/059bc856-7778-465c-95af-b1955f2a4ce2.jpg&', '一串钥匙，有个小娃娃挂件', '我在万达金街捡到一串钥匙', 1, '生活用品&', '2022-04-16 16:42:25', '万达金街蜜雪冰城&郑州市', '2022-04-12 00:00:00', 22);
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
INSERT INTO `found_goods` VALUES (14, '/foundgoods/e48bcd73-b54e-4395-9cc6-22d0c724c71f.jpg&', '黑色相机，大江，玩转全场运动相机', '相机', 0, '电子产品&', '2022-04-29 14:18:12', '山东济南&漯河市', '2022-04-05 00:00:00', 24);
INSERT INTO `found_goods` VALUES (15, '/foundgoods/0b68e2bb-652e-49af-91a2-8c51bcdb39c7.jpg&', '卷发棒，直发卷发，羊毛卷，烫发，轻便好拿，白色', '卷发棒', 0, '生活用品&', '2022-04-29 14:20:00', '开封市西沙椰林洗浴中心&漯河市', '2022-04-06 00:00:00', 24);
INSERT INTO `found_goods` VALUES (16, '/foundgoods/4f90fd1a-f11b-4ce8-bdb0-543243fb4be0.jpg&', '男士专用剃须刀，银色，未拆封', '剃须刀', 0, '生活用品&', '2022-04-29 14:21:26', '陕西西安&漯河市', '2022-04-07 00:00:00', 24);
INSERT INTO `found_goods` VALUES (17, '/foundgoods/98938d31-b6e1-4baf-9ad0-912e868f3744.jpg&', '钱包，内有银行卡，身份证，社保卡，驾驶证', '新都区寻物启事: 身份证', 0, '卡&', '2022-04-29 14:25:30', '四川省 成都市新都区&漯河市', '2022-04-08 00:00:00', 24);
INSERT INTO `found_goods` VALUES (18, '/foundgoods/f5ec89e5-c5ee-48c2-b8b0-7d4fc44e773d.jpg&', '', '澄海区寻物启事: 退伍证 身份证 刘洋', 0, '卡&', '2022-04-29 14:26:33', '广东省     汕头市     澄海区&漯河市', '2022-04-14 00:00:00', 24);
INSERT INTO `found_goods` VALUES (19, '/foundgoods/2b3b56cf-f918-4af0-9ffd-b8526d507b5f.jpg&', '红黑色夹克', '衣服', 0, '生活用品&', '2022-04-29 14:28:04', '江西省     九江市     浔阳区&漯河市', '2022-04-12 00:00:00', 24);
INSERT INTO `found_goods` VALUES (20, '/foundgoods/fb5c37d9-3495-4eb5-9437-f64b0187f3f6.jpg&', '在华阳欧尚超市附近捡到一支I watch手表，因一直没有人来问 所以发布在这里 黑色的', 'I watch 手表', 0, '电子产品&', '2022-04-29 14:28:44', '四川省     成都市     双流县&漯河市', '2022-04-13 00:00:00', 24);
INSERT INTO `found_goods` VALUES (21, '/foundgoods/5ec74541-ec6e-4384-9364-2f14998f63db.jpg&', '2022年3月23日爬紫金山山时在一个座位下看到的', '奔驰车钥匙', 0, '生活用品&', '2022-04-29 14:29:41', '江苏省     南京市     玄武区&漯河市', '2022-04-15 00:00:00', 24);
INSERT INTO `found_goods` VALUES (22, '/foundgoods/9f6cc637-3835-4460-b1ea-a918b97301d9.jpg&', '一只阿拉斯加犬走丢', '一只阿拉斯加犬', 0, '生活用品&', '2022-04-29 14:31:04', '福建省     泉州市     晋江市&漯河市', '2022-04-13 00:00:00', 24);
INSERT INTO `found_goods` VALUES (23, '/foundgoods/efc4e60e-e911-4360-8326-cea3ffa4917c.jpg&', '粉色的雪弗兰车钥匙', '车钥匙', 0, '生活用品&', '2022-04-29 14:31:38', '河北省     邯郸市     邯山区&漯河市', '2022-04-13 00:00:00', 24);
INSERT INTO `found_goods` VALUES (24, '/foundgoods/6d3eabde-6282-4176-96d8-d44601bff547.jpg&', '车钥匙，家门钥匙', '车钥匙', 0, '生活用品&', '2022-04-30 00:28:15', '河北省     邯郸市 &漯河市', '2022-04-22 00:00:00', 24);
INSERT INTO `found_goods` VALUES (25, '/foundgoods/c9483f02-32ec-4ca2-957b-57b5a9ff496b.jpg&', '在老汽车站门口一位快递小哥骑车途中掉落了一块卡西欧手表', '外卖小哥的卡西欧手表', 0, '生活用品&', '2022-04-30 00:28:52', '江西省     九江市     浔阳区&漯河市', '2022-04-13 00:00:00', 24);
INSERT INTO `found_goods` VALUES (26, '/foundgoods/cdc627c5-e961-4d38-a58a-1e93029f595a.jpg&', '谁在鹤壁捡到这样一个钱包，里面有一些现金和身份证银行卡，钱都不要了，把身份证给我就行，身份证急用[流泪][流泪]见着请联系18737255660', '黑色旺仔钱包', 0, '现金&', '2022-04-30 00:29:30', '河南省     鹤壁市     淇滨区&漯河市', '2022-04-20 00:00:00', 24);
INSERT INTO `found_goods` VALUES (27, '/foundgoods/2f454a89-a609-48ef-ab75-42af8cc6af56.jpg&/foundgoods/a0bf0989-9503-4080-a622-16a7c7098b59.jpg&', '钥匙有一些生锈离我捡到有一段时间了，捡到钥匙的地方属于重庆丰都仙女湖景区。', '拾得一钥匙扣包括长安cs55（淘宝以图搜图得）一把钥匙', 0, '卡&', '2022-04-30 00:30:20', '重庆市     县     丰都县&漯河市', '2022-04-12 00:00:00', 24);
INSERT INTO `found_goods` VALUES (28, '/foundgoods/459ca0b9-afb3-4cac-b613-14f8fad6be28.jpg&/foundgoods/b340aeab-b1fe-4b96-9d83-bdd28d04e209.jpg&', '在红军营南路_绿色家园媒体村门口捡到手表一块儿', '美宾女士手表', 0, '生活用品&', '2022-04-30 00:30:54', '北京市     市辖区     朝阳区&漯河市', '2022-04-20 00:00:00', 24);
INSERT INTO `found_goods` VALUES (29, '/foundgoods/dd05c441-68ee-4d66-b2a4-49afa5741c31.jpg&', '圆通公司贵BU0660驾驶员付顺林拾到黑色袋子一个', '拾到袋子一个', 0, '生活用品&', '2022-04-30 00:31:27', '贵州省     六盘水市     钟山区&漯河市', '2022-04-22 00:00:00', 24);
INSERT INTO `found_goods` VALUES (30, '/foundgoods/52023c90-86ff-4e1a-b54f-2594bf880d6a.jpg&/foundgoods/a06ce395-e79b-45c7-a261-dec02ae4b71c.jpg&', '2022年2月13日早6:30在东新街龙腾阁附近的哈罗单车车筐内捡到耳机盒，丢失者凭耳机序列号或购买记录认领', 'AirPods pro耳机盒', 0, '电子产品&', '2022-04-30 00:32:11', '陕西省     汉中市     汉台区&漯河市', '2022-04-23 00:00:00', 24);
INSERT INTO `found_goods` VALUES (31, '/foundgoods/ffe0e5f7-596b-4585-86fa-4fff4b97e01e.jpg&', '通达公司2022.2.7贵Bu 0937驾驶员：张怀俊拾到行李箱一个', '拾到行李箱一个', 0, '生活用品&', '2022-04-30 00:32:45', '贵州省     六盘水市     钟山区&漯河市', '2022-04-14 00:00:00', 24);
INSERT INTO `found_goods` VALUES (32, '/foundgoods/ff1af111-0c62-4d9a-a14f-70e38b8ceec9.jpg&', '圆通公司2022.2.7贵BU0673驾驶员：周训喜运营中拾到身份证一张', '拾到身份证一张', 0, '卡&', '2022-04-30 00:34:01', '贵州省     六盘水市     钟山区&漯河市', '2022-04-22 00:00:00', 24);
INSERT INTO `found_goods` VALUES (33, '/foundgoods/f8438019-bd32-4dca-8797-dcf9fcbe0814.jpg&', '本人在广东捡到一个U盘，打开后里边有很多的文件，看不懂是什么。好像是很重要的文件。', 'U盘', 0, '电子产品&', '2022-04-30 00:34:51', '广东省     深圳市     市辖区&漯河市', '2022-05-02 00:00:00', 24);
INSERT INTO `found_goods` VALUES (34, '/foundgoods/7b994d00-3eb2-43cf-8394-93d45a66543e.jpg&/foundgoods/fe1ac37d-c9e8-4254-8c8d-9f613f86f2b2.jpg&', '在湖南益阳服装厂上班的', '黑色手提包', 0, '生活用品&', '2022-04-30 00:35:25', '湖南省     岳阳市     岳阳楼区&漯河市', '2022-04-14 00:00:00', 24);
INSERT INTO `found_goods` VALUES (35, '/foundgoods/14b20870-6bc6-49c6-90b0-5c0c579a534d.jpg&', '圆通公司贵BU0673驾驶员：周训喜运营中拾到手提袋一个', '圆通公司贵BU0673驾驶员周训喜', 0, '生活用品&', '2022-04-30 00:35:55', '贵州省     六盘水市     钟山区&漯河市', '2022-04-21 00:00:00', 24);
INSERT INTO `found_goods` VALUES (36, '/foundgoods/6e57e328-f83e-41d0-8085-be0e66596989.jpg&', '莆田站“海峡情·壶兰”服务台工作人员在车站捡到包包，请遗失的旅客看到消息后，及时联系认领哟～', '工作人员收集到乘客遗失的皮质手提包一个', 0, '生活用品&', '2022-04-30 00:36:48', '福建省     福州市     市辖区&漯河市', '2022-04-15 00:00:00', 24);
INSERT INTO `found_goods` VALUES (37, '/foundgoods/e8a4a742-8e41-4d47-b57f-dd3f5b9d7b87.jpg&/foundgoods/eb3193c0-8175-4674-9dda-89689942a917.jpg&', '几个月前有一个带孩子的父亲在云谷放飞无人机当时无人机堕于四栋天台无法拾取，现经多部门协同己拾获请来领取 好象记得中年人叫施峰', '拾获无人机-部', 0, '电子产品&', '2022-04-30 10:44:53', '重庆市     市辖区     大渡口区&漯河市', '2022-03-02 00:00:00', 24);
INSERT INTO `found_goods` VALUES (38, '/foundgoods/efcbae11-2c97-4603-9749-cccecd973f32.jpg&', '汽车钥匙', '拾获凯迪拉克钥匙', 0, '卡&', '2022-04-30 10:45:39', '重庆市     市辖区     大渡口区&漯河市', '2022-03-05 00:00:00', 24);
INSERT INTO `found_goods` VALUES (39, '/foundgoods/c7f651d3-946a-4d9e-9c91-86a2b47b33dc.jpg&', '利通公司贵BU05552022.1.10驾驶员：胡连富运营中拾到公文包1个(内有书4本)，现已交到公司，请失主与公司联系。', '利通公司贵BU0555驾驶员胡连富', 0, '生活用品&', '2022-04-30 10:46:30', '贵州省     六盘水市     钟山区&漯河市', '2022-01-13 00:00:00', 24);
INSERT INTO `found_goods` VALUES (40, '/foundgoods/18985260-9de7-4df0-879d-c8ea06ace80b.jpg&/foundgoods/1f886731-d3fe-404f-8993-ffe2f36aae1f.jpg&', '的哥周师傅在交班时，发现有乘客将挎包遗忘在车内，包内有王文静的身份证。希望失主赶快来认领。', ' 的哥周师傅发现有乘客将挎包遗忘在车内，包内有王文静的身份证', 0, '卡&', '2022-04-30 10:47:15', '湖北省     十堰市     市辖区&漯河市', '2022-02-04 00:00:00', 24);
INSERT INTO `found_goods` VALUES (41, '/foundgoods/9f4e37e3-5940-4ac9-a066-1467f6cc2c59.jpg&', '身份证，银行卡，现金', '拾获陈伟钱包', 0, '现金&', '2022-04-30 10:47:46', '重庆市     市辖区     大渡口区&漯河市', '2022-04-04 00:00:00', 24);
INSERT INTO `found_goods` VALUES (42, '/foundgoods/8b4c704e-dd57-4573-a443-bf16f3b5569d.jpg&', '在石门新居捡到赵访的驾驶证，请失主联系我。', '拾获赵访驾驶证', 0, '卡&', '2022-04-30 10:48:14', '北京市     市辖区     朝阳区&漯河市', '2022-03-25 00:00:00', 24);
INSERT INTO `found_goods` VALUES (43, '/foundgoods/44a0316f-2ce9-41a0-b969-dede81d8d115.jpg&', '天安拾获驾照', '拾获左红兵驾驶证', 0, '卡&', '2022-04-30 10:48:49', '重庆市     城市不明确     县不明确&漯河市', '2022-04-13 00:00:00', 24);
INSERT INTO `found_goods` VALUES (44, '/foundgoods/7c7d0d79-ba73-40c8-ac96-fb0e27e99a21.jpg&', '运营中拾到中药两袋', '利通公司贵BU1777驾驶员唐建', 0, '食品&', '2022-04-30 10:49:25', '贵州省     六盘水市     钟山区&漯河市', '2022-04-15 00:00:00', 24);
INSERT INTO `found_goods` VALUES (45, '/foundgoods/4e31d41d-0944-4aa2-971d-c912ec9ef0c5.jpg&', '圆通公司贵BU0101出租汽车陈昌文拾到乘客遗失女士外套一件。', '圆通公司贵BU0101出租汽车陈昌文', 0, '生活用品&', '2022-04-30 10:50:09', '贵州省     六盘水市     钟山区&漯河市', '2022-02-11 00:00:00', 24);
INSERT INTO `found_goods` VALUES (46, '/foundgoods/475c479e-ff0f-44a7-8f19-887d8cd642d7.jpg&', '圆通公司贵BU0343白班周方军 12月25日运营中拾到提包一个', '圆通公司贵BU0343白班周方军', 0, '生活用品&', '2022-04-30 10:50:48', '贵州省     六盘水市     钟山区&漯河市', '2022-04-08 00:00:00', 24);
INSERT INTO `found_goods` VALUES (47, '/foundgoods/2e639db1-a56f-4119-aee0-da99ab995321.jpg&', '在天津捡到丰田车钥匙一把', '在天津捡到丰田车钥匙一把', 0, '生活用品&', '2022-04-30 10:51:20', '天津市     市辖区     河北区&漯河市', '2022-02-05 00:00:00', 24);
INSERT INTO `found_goods` VALUES (48, '/foundgoods/f87f02f9-e1a2-4fba-9e6d-ed28c1a2e53a.jpg&/foundgoods/1a81c74e-564b-4eaa-b818-9675b3c44c7e.jpg&', '两张卡及钥匙', '拾获茄子溪中学绿色通行卡及公交卡', 0, '生活用品&', '2022-04-30 10:51:54', '重庆市     市辖区     大渡口区&漯河市', '2022-04-13 00:00:00', 24);
INSERT INTO `found_goods` VALUES (49, '/foundgoods/0242764e-11dc-443c-8a2e-6b13a7324586.jpg&', '贵BU0406出租汽车在营运中拾到身份证、银行卡各一份', '圆通公司贵BU0406驾驶员欧阳水堂', 0, '卡&', '2022-04-30 10:52:28', '贵州省     六盘水市     钟山区&漯河市', NULL, 24);
INSERT INTO `found_goods` VALUES (50, '/foundgoods/e75d8d48-1b93-462d-b4c6-f5d7c46c1887.jpg&', '弘阳上城西门 12.20日拾得', '门卡', 0, '卡&', '2022-04-30 10:53:41', '江苏省     南通市     崇川区&漯河市', '2022-04-15 00:00:00', 24);
INSERT INTO `found_goods` VALUES (51, '/foundgoods/5f8f14e8-b863-4632-90aa-0aed7a0d1a98.jpg&', '拾到行李箱一个', '圆通公司贵BU0908陈钢', 0, '生活用品&', '2022-04-30 10:54:14', '贵州省     六盘水市     钟山区&漯河市', '2022-07-01 00:00:00', 24);
INSERT INTO `found_goods` VALUES (52, '/foundgoods/234c6af6-ccd6-44ec-8381-92ccb7f9393c.jpg&/foundgoods/f1cc8857-280b-4e81-9bc0-5774ad6778f2.jpg&', '停车充电，担心造成物损代行保管留下提示', '拾获粗心车主遗落电动车钥匙', 0, '卡&', '2022-04-30 10:54:51', '重庆市     市辖区     大渡口区&漯河市', '2022-04-16 00:00:00', 24);
INSERT INTO `found_goods` VALUES (53, '/foundgoods/922fa1e1-ad6b-4c28-898e-259c3f5acd1c.jpg&', '2021年12.18日乘坐渝-7599黔江-马喇11点左右一个耳机lp40耳机丢失', '刘新科耳机渝-D7599', 0, '电子产品&', '2022-04-30 10:55:24', '重庆市     市辖区     黔江区&漯河市', '2022-04-16 00:00:00', 24);

-- ----------------------------
-- Table structure for lost_goods
-- ----------------------------
DROP TABLE IF EXISTS `lost_goods`;
CREATE TABLE `lost_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片，URL地址，用&进行分割',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情描述',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寻物启事标题',
  `state` int(11) NULL DEFAULT NULL COMMENT '认领状态',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '发布日期',
  `lost_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '丢失区域',
  `lost_time` timestamp(0) NULL DEFAULT NULL COMMENT '丢失日期',
  `uid` int(11) NULL DEFAULT NULL COMMENT '发布者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `lost_goods` VALUES (18, '/lostgoods/b8b5aa1e-38dd-472f-9972-3bda68203091.jpg&', '丢失项链一条粽色绳子有一个金佛吊坠串有几个叶绿色玉珠', '成都市寻物启事: 寻找项链', 0, '卡&', '2022-04-29 14:32:44', '四川省     成都市     市辖区&漯河市', '2022-04-13 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (19, '/lostgoods/06e5f97f-b348-4acb-aad3-64e503232341.jpg&', '骑车掉了 手机对我很重要 希望捡到的人可以还给我', '莲都区寻物启事: 粉色的iPhone 13', 0, '手机&', '2022-04-29 14:33:16', '浙江省     丽水市     莲都区&漯河市', '2022-04-11 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (20, '/lostgoods/89fb02f8-634f-4ce8-86c1-35ace5f569d4.jpg&', '本人护照与2021年8月份丢失在佳木斯与七台河拼车中', '郊区寻物启事: 护照', 0, '卡&', '2022-04-29 14:34:17', '黑龙江省     佳木斯市     郊区&漯河市', '2022-04-13 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (21, '/lostgoods/00a397b7-adac-4a4e-a8eb-0c94ba645f89.jpg&', '本人于2022年4月18号早上8点在桐梓坡西路或者是下午6点在麓枫路左右丢失一串钥匙，钥匙包含一个大众的汽车有个保护壳，一个手机卡取针，一个耳朵挖，一个塑料牌上面写着手机号码，尾号8978，一个房门钥匙，还有一个白色的小扭扣。如有好心人拾到，请联系我，感激不尽，当面重鞋', '岳麓区寻物启事: 钥匙丢失', 0, '卡&', '2022-04-29 14:35:20', '湖南省     长沙市     岳麓区&漯河市', '2022-04-12 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (22, '/lostgoods/9e3dbc42-802d-451f-a14a-eeba7e03bfa6.jpg&', '本人于在萧山宁围或钱江世纪城掉落也不清楚什么时候掉的，有捡到的朋友联系。', '萧山区寻物启事: 身份证', 0, '卡&', '2022-04-29 14:35:57', '浙江省     杭州市     萧山区&漯河市', NULL, 24);
INSERT INTO `lost_goods` VALUES (23, '/lostgoods/35be7ff5-4118-421a-80b9-7494f247d9b7.jpg&', '4月9号晚上八点后丢的手机 手机壳是皮卡丘 型号是oppoa52 地点是双坡南路-宝庆东路-建设南路', '双清区寻物启事: oppo手机一支', 0, '手机&', '2022-04-29 14:36:43', '湖南省     邵阳市     双清区&漯河市', '2022-04-06 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (24, '/lostgoods/b97ba439-496e-4c37-b7d5-2ea92a102e5f.jpg&', '2022年4月11号早上7点左右在大学路淮河路向西方向丢失蓝色斜挎包一个内有身份证驾驶证药等现金45元左右', '二七区寻物启事: 一个蓝色斜挎包，内有身份证驾驶证药还有车钥匙', 0, '卡&', '2022-04-29 14:37:21', '河南省     郑州市     二七区&漯河市', NULL, 24);
INSERT INTO `lost_goods` VALUES (25, '/lostgoods/bd09e4ae-750b-4dc7-a2e1-ead0a74dfdf7.jpg&', '一个小熊的手机壳，白色的手机', '虞城县寻物启事: 寻找手机苹果12promax', 0, '手机&', '2022-04-29 14:38:12', '河南省     商丘市     虞城县&漯河市', '2022-04-15 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (26, '/lostgoods/1bbcb00c-805c-4392-8a82-3372f040afc8.jpg&', '在东莞麻涌遇到一个好心的滴滴师傅拉我回来 背包落在后座', '天河区寻物启事: 红色书包背包代驾包', 0, '生活用品&', '2022-04-29 14:38:50', '广东省     广州市     天河区&漯河市', '2022-04-14 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (27, '/lostgoods/64390b82-5303-4713-bc3d-7151249853f6.jpg&', '2022年4月5号晚上1:30分钟左右，在南宁市民主路附近，遗失了一把心爱的吉他，吉他包是灰色的，吉他上有签名。', '兴宁区寻物启事: 寻找一把吉他', 0, '生活用品&', '2022-04-29 14:39:48', '广西     南宁市     兴宁区&漯河市', '2022-04-21 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (28, '/lostgoods/da75b7b3-894a-4c5c-8e73-b69bd585ca35.jpg&', '在昆明南站附件丢失杯子一个', '呈贡县寻物启事: 在昆明南站附件丢失杯子一个', 0, '生活用品&', '2022-04-30 00:16:16', '云南省     昆明市     呈贡县&漯河市', '2022-04-14 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (29, '/lostgoods/f26720f9-38f6-43a1-b46f-52205572f8c7.jpg&', '漳州华骏汽车城门口周边丢失两把领克车钥匙，全新未开封', '龙文区寻物启事: 领克车钥匙', 0, '生活用品&', '2022-04-30 00:18:54', '福建省     漳州市     龙文区&漯河市', '2022-04-21 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (30, '/lostgoods/e57e7daf-527b-4a51-87ed-318bc7396da6.jpg&', '拾到必有重谢', '光山县寻物启事: 寻找手链', 0, '生活用品&', '2022-04-30 00:19:54', '河南省     信阳市     光山县&漯河市', '2022-04-15 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (31, '/lostgoods/45bbc009-03d0-4363-bab1-fd996d79b651.jpg&', '是一个黄色带了壳的耳机，如果可以归还，必有重赏！', '朝阳区寻物启事: dj的AirPods pro', 0, '电子产品&', '2022-04-30 00:20:26', '北京市     市辖区     朝阳区&漯河市', '2022-04-22 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (32, '/lostgoods/d8b57999-3e5a-41e1-b8af-c52bfa6beb18.jpg&', '13714897368', '东莞市寻物启事: 寻找一个小包，里面有个身份证，身份证名字是写着容杰聪的。', 0, '卡&', '2022-04-30 00:21:22', '广东省     东莞市     县不明确&漯河市', '2022-04-11 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (33, '/lostgoods/6eed8fa6-d056-46a8-993c-75f5c89b7ebb.jpg&', '本人在薛家镇荣华里附近丢失，驾驶证，里面包含身份证，银行卡，招商信用卡，游乐园年卡，黑卡，抖音联名信用卡等，身份证姓氏沈，如有捡到者请与我联系17630123882 18537863220定重酬谢！', '新北区寻物启事: 寻找身份证，驾驶证', 0, '卡&', '2022-04-30 00:22:22', '江苏省     常州市     新北区&漯河市', '2022-04-13 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (34, '/lostgoods/a8040a3a-65a3-4e27-8a3b-320fc60bce5e.jpg&', '于2022年3月22日在东城拐下街至中道街路上遗失奔驰汽车钥匙一把', '锦江区寻物启事: 寻找汽车钥匙', 0, '卡&', '2022-04-30 00:23:00', '四川省     成都市     锦江区&漯河市', '2022-04-21 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (35, '/lostgoods/9fd7846e-c44b-4f90-a9d9-a48f3e9d95dc.jpg&', '晚上七点左右丢失，归还另有重谢！', '青州市寻物启事: 寻找钥匙', 0, '卡&', '2022-04-30 00:24:06', '山东省     潍坊市     青州市&漯河市', '2022-04-21 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (36, '/lostgoods/5897a5a1-e800-4f1a-ad73-d64b5fe7036a.jpg&', '本人在3月9日 丢失一张身份证 若有那位好心人捡着 是否能归还于我 本人在此十分感谢', '天河区寻物启事: 寻找身份证', 0, '卡&', '2022-04-30 00:25:13', '广东省     广州市     天河区&漯河市', '2022-04-21 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (37, '/lostgoods/34396747-2f2a-4707-a6d5-44047902828b.jpg&', '有个木质葫芦（磨损）挂饰，还有黑线带几颗绿珠的挂饰，大致3把钥匙（2大1小，一把上贴写408）和一个门禁磁扣。', '新都区寻物启事: 一串钥匙', 0, '卡&', '2022-04-30 00:26:34', '四川省     成都市     新都区&漯河市', '2022-04-15 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (38, '/lostgoods/b51c249a-0518-4086-81e2-52666172ee59.jpg&', '放在一个黑色肩包，在12月24在沈阳北站遗失', '沈河区寻物启事: 寻找笔记本', 0, '电子产品&', '2022-04-30 00:39:15', '辽宁省     沈阳市     沈河区&漯河市', '2022-05-14 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (39, '/lostgoods/4984c53b-3665-4d4f-a75a-96d10f76ac86.jpg&', '找到将立即悬赏500元黑色手提包联想拯救者电脑', '青羊区寻物启事: 寻找联想笔记本电脑', 0, '电子产品&', '2022-04-30 00:39:51', '四川省     成都市     青羊区&漯河市', '2022-01-03 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (40, '/lostgoods/d2ec1c1c-4e8b-496c-b89c-656c8b4ff00e.jpg&', '一月15日晚上9点多走路回家相机掉了', '广东寻物启事: 相机丢了广州南村万博', 0, '电子产品&', '2022-04-30 00:40:36', '广东省     城市不明确     县不明确&漯河市', '2021-12-03 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (41, '/lostgoods/9a0a916f-069d-4050-ab7e-efb9f16f1309.jpg&', '3月16凌晨在和谐嘉园北苑顺福路一带丢失华为mate30一部，套着一个白色碎裂的大理石纹手机壳。', '上城区寻物启事: 丢失华为手机一部，拾到的好心人请尽快归还', 0, '手机&', '2022-04-30 10:56:55', '浙江省     杭州市     上城区&漯河市', '2022-05-07 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (42, '/lostgoods/c779aca1-e2e7-4883-bbae-1ff4f91441b7.jpg&', '2022年3月16日晚上在曲靖麒麟区遗失车钥匙一把，大概地方，南城门保记附近，或者是十五城，车立方附近，希望捡到的朋友联系，定酬谢！', '麒麟区寻物启事: 丰田车钥匙', 0, '生活用品&', '2022-04-30 10:57:38', '云南省     曲靖市     麒麟区&漯河市', '2022-04-23 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (43, '/lostgoods/8d244fa9-d3dc-499e-8cef-e0f0edcf8955.jpg&', '绿色小钱包，内有身份证，杭州市民卡，兰蔻口红一支，现金一点', '杭州市寻物启事: 绿色小钱包，内有身份证【曲*】市民卡', 0, '卡&', '2022-04-30 10:58:08', '浙江省     杭州市     市辖区&漯河市', '2022-04-16 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (44, '/lostgoods/7391a22e-0a82-45a0-b13b-f5c2ddd6a4fc.jpg&', '2020年3月12日上午在北京地铁九号线转6号线途中丢失的蓝牙耳机，里面只剩一只耳机，并且套了一个橙色柴犬的耳机壳', '丰台区寻物启事: 寻找2020年3月12日在北京地铁九号线及6号线上丢失的蓝牙耳机', 0, '电子产品&', '2022-04-30 10:58:43', '北京市     市辖区     丰台区&漯河市', '2022-04-14 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (45, '/lostgoods/c080d2f4-9b2a-4092-962a-a073673cd1a2.jpg&', '仲夏紫 手机串号IMEI：864455045515864 MEID：A00000AED6D468', '闵行区寻物启事: 寻华为nova5紫色手机', 0, '手机&', '2022-04-30 10:59:19', '上海市     市辖区     闵行区&漯河市', '2022-04-02 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (46, '/lostgoods/a9f513e4-6f90-4f18-aa00-6e41e0c7fb58.jpg&', '寻物启事 本人于2022年3月12日晚上11点左右至11点30左右乘坐某公司出租车从慈溪市南门大街普乐迪kTV附近到慈溪市新江路宜家宾馆附近途中丢失一黑色手夹包，里面有很多证件，身份证，行驶证，驾驶证等还有其他的证件，对本人非常重要，望有好心人捡到，请与我联系我将当面重谢，感谢平台。杜先生', '慈溪市寻物启事: 寻找黑色手夹包里面全是证件，杜先生', 0, '卡&', '2022-04-30 10:59:53', '浙江省     宁波市     慈溪市&漯河市', '2022-04-08 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (47, '/lostgoods/56cc37c0-7434-404d-aef1-c3985424404f.jpg&', '本人朋友在苏州丢失一个棕色钱包，里面有台胞证(证件补办很麻烦)，银行卡，还有大量现金，如果有拾到，请归还，谢谢！', '苏州市寻物启事: 寻找钱包', 0, '生活用品&', '2022-04-30 11:00:38', '江苏省     苏州市     市辖区&漯河市', '2022-04-16 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (48, '/lostgoods/a6584a61-42f2-4f97-94f5-c87093d220de.jpg&/lostgoods/3cf787d4-9c35-421d-8134-a4e97f025e9f.jpg&', '时间是2021年3月到现在 忘记了我的这两个移动硬盘是否还在原出租屋已处理的家具里的类似这种隐形抽屉里 这个隐形抽屉粘在家具里面的 房东说新租客把所有的家具都扔了 想问下有没有人见到过 原租房是成都菊乐路151号院、长天路附近的小区、犀浦锦苑二期 如有见到接触到，请联系我 谢谢大家', '武侯区寻物启事: 寻找两个移动硬盘 一个黑色 一个白色', 0, '电子产品&', '2022-04-30 11:01:23', '四川省     成都市     武侯区&漯河市', '2022-07-02 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (49, '/lostgoods/abc67322-6b8b-4ddd-9afa-82eee7a088b2.jpg&/lostgoods/09b2dca3-9009-4812-94c1-037be55c5bdd.jpg&', '本人于3月10号从曲靖沾益玉林小区回水云华城北苑家时，途经西河公园夜市，不慎将装有户口簿，身份证，结婚证，创业证的白色手提袋弄丢。望有心人拾到归还。重谢！', '沾益县寻物启事: 寻找户口本，身份证，结婚证', 0, '卡&', '2022-04-30 11:04:24', '云南省     曲靖市     沾益县&漯河市', '2022-06-04 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (50, '/lostgoods/4b90c907-0530-4aac-9c13-6e698079036c.jpg&', '苏州景城邻里中心附近遗失一把尼桑车钥匙', '苏州市寻物启事: 工业园区尼桑车钥匙寻找一定酬谢', 0, '生活用品&', '2022-04-30 11:04:51', '江苏省     苏州市     市辖区&漯河市', '2022-04-14 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (51, '/lostgoods/81665fc4-535c-4792-ba66-e6be47a9a5f7.jpg&', '寻找粉色文件袋内有车证护照退役军人优待证合同等 今年丢失的时间地点不明 经常往来桂林 贺州 广州 佛山等地', '寻物启事: 寻找车证护照优待证合同 姓名：范德祥', 0, '卡&', '2022-04-30 11:05:38', '广西     桂林市     县不明确    &漯河市', '2022-04-12 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (52, '/lostgoods/0d08e97f-d4cb-4ace-aba8-687835b09ac7.jpg&', '本人于2022年2月18日早上6.20多分钟，开车往人民医院到明珠广场对面那段路，不慎遗失一个白色的包，包内有银行卡、身份证、金戒指、现金等……请拾到者或知其者下落与本人联系，本人将万分感谢/当面酬谢', '三亚市寻物启事: 寻找一个白色的包包', 0, '生活用品&', '2022-04-30 11:06:10', '海南省     三亚市     县不明确&漯河市', NULL, 24);
INSERT INTO `lost_goods` VALUES (53, '/lostgoods/ab6d1131-719d-4a83-9f89-c5de90f0528b.jpg&', '2022年3月8日，在乌鲁木齐市天山区营业执照（副本）丢了', '天山区寻物启事: 寻营业执照', 0, '', '2022-04-30 11:06:48', '新疆     乌鲁木齐市     天山区&漯河市', '2022-07-01 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (54, '/lostgoods/492d65e6-ebdf-4980-ab60-1b3fc6916b61.jpg&', '一个黑色的卡盒，里面有本人身份证、广发银行卡、中国华电用餐卡', '西山区寻物启事: 寻找姓名曹龙身份证、广发银行卡', 0, '卡&', '2022-04-30 11:07:32', '云南省     昆明市     西山区&漯河市', '2022-05-14 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (55, '/lostgoods/71483877-dee6-46ff-8549-b8dd9989fbc8.jpg&', '手机壁纸是一个新年快乐的手绘小老虎', '萧山区寻物启事: IPhone 12', 0, '手机&', '2022-04-30 11:08:02', '浙江省     杭州市     萧山区&漯河市', '2022-04-16 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (56, '/lostgoods/df709465-bb26-42b6-b064-faacc339fb33.jpg&', '2022-03-04在武侯区丢失棕色钱包一枚，内含身份证（罗楚涵）、社保卡、银行卡和少量现金。', '武侯区寻物启事: 钱包丢失', 0, '卡&', '2022-04-30 11:08:56', '四川省     成都市     武侯区&漯河市', '2022-08-05 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (57, '/lostgoods/4e62b7dd-3c04-45d6-8db4-492d295a306b.jpg&/lostgoods/290ff2c7-2ff5-49b7-85e0-e990ad62a84c.jpg&', '2022年2月28日晚从瑞雪宾馆附近到灰埠镇不慎丢失驾驶证（身份证、医保卡、银行卡等）小车行驶证，现金等', '高安市寻物启事: 寻找驾驶证、行驶证、身份证、医保卡', 0, '卡&', '2022-04-30 13:06:48', '江西省     宜春市     高安市&漯河市', '2022-04-09 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (58, '/lostgoods/b94bbd60-2cbe-4458-9c32-f9e106ee7640.jpg&/lostgoods/4b72995f-3c89-4543-a588-5442e57f7e31.jpg&', '2月27晚10点40分，本人骑电瓶车从济南舜玉南区途经七里山路.二环南路.文庄路.不慎将手提袋丢失，里面有一双匡威女鞋.颐莲保湿护肤品.颐莲保湿喷雾.原液丢失.', '市中区寻物启事: 匡威36女鞋颐莲护肤品', 0, '生活用品&', '2022-04-30 15:35:43', '山东省     济南市     市中区&漯河市', '2022-07-08 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (59, '/lostgoods/81019a23-8322-4002-8142-2b603b89d77d.jpg&', '在东莞中堂镇范围内丢失一个钱包 里面有多张证件，希望有好心人送到我手中，谢谢。', '东莞市寻物启事: 钱包', 0, '卡&', '2022-04-30 15:36:39', '中堂大桥 中堂文化广场 篮球馆 中麻路 兴新路 大新围路&漯河市', '2022-08-13 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (60, '/lostgoods/4b55fcf1-89c5-468a-ada4-292d4dcbd209.jpg&', '外表是一只黑色的小恐龙外壳 如果有人捡到我请你吃饭 还给我叭球球了 这是纪念礼物', '晋安区寻物启事: 黑色苹果耳机', 0, '电子产品&', '2022-04-30 15:37:29', '福建省     福州市     晋安区&漯河市', '2022-05-21 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (61, '/lostgoods/60624c1f-fe5b-462f-bb5f-0de699ab6a49.jpg&', '2022.2.26日晚或2.27早丢失华为麦芒10手机一部，内有重要个人资料，设备识别码为99001723566971', '瓯海区寻物启事: 寻找手机', 0, '手机&', '2022-04-30 15:38:03', '瓯海大厦对面商业广场至德信君亭酒店之间&漯河市', '2022-05-19 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (62, '/lostgoods/4d57be27-9c27-472d-b718-291d8f662adb.jpg&/lostgoods/7c4f8e09-7b6f-4e87-a8ac-0cc876c5fe36.jpg&', '本人不慎于 2022 年 2 月 11 日晚 18：00—20：40 在丈八二路和锦业二路附近道路丢失纸箱一个，箱子的规格大约 30*25*25cm，箱子上面有“科瑞新”三个字。内装如下图所示物品一百只。有捡到者望速与我联系，有重谢。', '雁塔区寻物启事: 寻找包裹', 0, '生活用品&', '2022-04-30 15:38:57', '陕西省     西安市     雁塔区&漯河市', '2023-08-05 00:00:00', 24);
INSERT INTO `lost_goods` VALUES (63, '/lostgoods/ffecfa53-5733-48b9-8b36-91b3df76f05d.jpg&/lostgoods/89082ae5-f496-4c6f-b535-76eecffbe04f.jpg&', '本人于2022年2月22日在广州市番禺区南浦至厦滘附近遗失移动硬盘盒一个，硬盘内有公司重要资料，如有拾到者，归还后本人愿以5000元作为报酬。', '番禺区寻物启事: 5000元悬赏寻找硬盘', 0, '电子产品&', '2022-04-30 15:39:54', '南浦至厦滘附近&漯河市', '2022-09-03 00:00:00', 24);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '公告内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '本站晚23:00-次日6:00是维护时段，给您带来不便，敬请谅解');
INSERT INTO `notice` VALUES (2, '请站友同志们注意言行举止，共同营造一个风清气正的网络环境');
INSERT INTO `notice` VALUES (3, '本站是绿色健康网站，欢迎网友们向身边的人推荐');

-- ----------------------------
-- Table structure for user_base
-- ----------------------------
DROP TABLE IF EXISTS `user_base`;
CREATE TABLE `user_base`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名，可重复',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱，唯一',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `user_role` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '1正常用户 2身份认证用户 3学生认证用户 4禁言用户 5注销用户 6管理员',
  `face` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信标记，有的话表示这个用户有微信账户',
  `current_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人查看的最近种类',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_base
-- ----------------------------
INSERT INTO `user_base` VALUES (22, '8e36a7e9-16cd-4d3e-acbc-a036b89a4714', '于我', '1612253221@qq.com', 'haha', '男', 2, 'https://thirdwx.qlogo.cn/mmopen/vi_32/utmvXMJsTSrOCccIibl4lEyUcDwiaLVqMxOrbSnicJUFIsD0ZWDwepNVSrSFGJ0IEWbyCbeKFrl9lkuTNDmbNv5pw/132', '2022-04-16 14:51:42', NULL, 'ohw7Y5wwpbzlh_MuiYk1_JyLc0lQ', NULL);
INSERT INTO `user_base` VALUES (23, '174de058-3877-41d1-9a30-fa48ce7a2ed0', '沙雕王', '1853053252@qq.com', 'yyqx', '女', 1, '', '2022-04-16 14:58:36', NULL, NULL, NULL);
INSERT INTO `user_base` VALUES (24, 'e4bbf5eb-ee3e-43d2-afa6-e350f45d6658', '韩先生', '645693789@qq.com', 'hyy', '男', 1, '', '2022-04-16 14:58:50', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_contact_information
-- ----------------------------
DROP TABLE IF EXISTS `user_contact_information`;
CREATE TABLE `user_contact_information`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '用户的id',
  `appellation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留下的称呼',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'QQ',
  `wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '其他',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_contact_information
-- ----------------------------
INSERT INTO `user_contact_information` VALUES (1, 22, '刘先生', '1111', '1612253221', '1111', '1612253221@qq.com', '河南安阳', '1111');
INSERT INTO `user_contact_information` VALUES (2, 23, '王女士', '2222', '1853053252', '2222', '1853053252@qq.com', '河南驻马店', '2222');
INSERT INTO `user_contact_information` VALUES (3, 24, '韩先生', '3333', '645693789', '3333', '645693789@qq.com', '河南洛阳', '3333');

SET FOREIGN_KEY_CHECKS = 1;
