/*
Navicat MySQL Data Transfer

Source Server         : localwork
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : ddbxdb

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2019-03-04 15:04:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信会话密钥session_key',
  `an` int(11) NOT NULL DEFAULT '0' COMMENT '用于区别市场下的数据',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '实名名字,',
  `avatarurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `dt_add` datetime DEFAULT NULL COMMENT '添加时间',
  `dt_edit` datetime DEFAULT NULL COMMENT '最后编辑时间',
  `mid_add` int(11) NOT NULL DEFAULT '0' COMMENT '添加人员id',
  `isadmin` tinyint(4) DEFAULT '0' COMMENT '是否后台管理员,0的时候为小程序端登陆账号，1为后台登陆账号，2，3，4到时扩展',
  `comname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司名字',
  `comname_short` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司名字简写',
  `showtag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '显示标志，1为显示/可用',
  `deltag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标志，1为删除，0为未删除',
  `wxopenid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信登陆用户的openid',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `cp` tinyint(4) DEFAULT '0',
  `state_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `agp_id` int(11) NOT NULL DEFAULT '0' COMMENT '后台角色组id,admin_agp',
  `fsid` int(11) NOT NULL DEFAULT '0',
  `gemsid` int(11) NOT NULL DEFAULT '0' COMMENT 'gemsid',
  `superadmin` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否内部超级管理员，拥有后台所有权限',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid_add` (`mid_add`) USING BTREE,
  KEY `showtag` (`showtag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台市场会员表,<!-- APP端/H5端/小程序端登陆会员表 -->';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('21', '0', '屠弯弯', '/upload/2019/02/12/1e6287aba2ed4b5f376f0e53b47a8456.jpg', '大人啊大人', null, '2019-02-12 16:22:31', '0', '0', null, null, '1', '0', 'oX6Hb4qluIat5pa2VcNe6T3NOk4g', 'admin', '41f347d047e225bb2cb8fcd5e0f13329', '1', '0', '0', '9', '33', '46', '1');
INSERT INTO `admin` VALUES ('25', '0', '测试', '/upload/2019/02/11/fbfedbab20a8e45f474dea50088ad595.jpg', '我日', '2018-12-20 18:56:58', '2019-02-11 19:42:55', '21', '0', '', '', '1', '0', 'oX6Hb4t59Aapx3tdKptOPmPtNaWc', 'test', '', '0', '20', '336', '8', '33', '0', '0');
INSERT INTO `admin` VALUES ('27', '0', 'ttt', null, 'aaa', null, '2018-12-21 14:23:32', '0', '0', null, null, '1', '0', 'ohG8B5Wfh_2qF6mC_RiFZ9BAIJIg', '456', '183a9bedb71eb8441c2138798b47bae0', null, '33', '198', '0', '0', '0', '0');
INSERT INTO `admin` VALUES ('29', '0', null, null, null, null, '2018-12-21 14:24:56', '0', '0', null, null, '1', '0', 'ohG8B5a-9u_JIpKQYPaJ8HS9OkMA', '789', '9ec8057bdd85a17819c1982b2e1320f5', null, '0', '0', '0', '0', '0', '0');
INSERT INTO `admin` VALUES ('30', '0', '', null, '', '2018-12-24 20:12:43', '2018-12-24 20:12:43', '21', '0', '', '', '1', '0', null, 'test2', 'dcfcd07e645d245babe887e5e2daa016', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `admin` VALUES ('31', '0', '测试111测试111', '/upload/2019/02/11/eddaa197fcfc70f294ca3d197ca509e4.jpg', '昵称', '2019-01-16 11:22:18', '2019-02-11 19:43:16', '0', '0', null, null, '1', '0', null, 'cs444', '82791250224195e962c2cea19988b840', null, '7', '87', '8', '33', '0', '0');
INSERT INTO `admin` VALUES ('32', '0', '测试333', '/upload/2019/02/11/6aad3155ee55e0904e8f5a8088f4dfa4.jpg', '昵称', '2019-01-16 11:22:28', '2019-02-11 19:43:29', '0', '0', null, null, '1', '0', null, 'cs333', 'a4bf3d1b793ee31147ed28cb849683eb', null, '2', '507', '12', '33', '0', '0');
INSERT INTO `admin` VALUES ('33', '0', '33332', 'images/mgcaraddimg.jpg', 'woshi333', '2019-01-16 11:22:40', '2019-01-29 14:15:01', '0', '0', null, null, '1', '0', null, 'test333', '41f347d047e225bb2cb8fcd5e0f13329', null, '14', '462', '8', '33', '0', '0');
INSERT INTO `admin` VALUES ('34', '0', '测试4444测试4444', 'images/mgcaraddimg.jpg', '', '2019-01-16 11:23:03', '2019-01-29 13:44:52', '0', '0', null, null, '1', '0', null, '1234', null, null, '0', '0', '12', '33', '0', '0');
INSERT INTO `admin` VALUES ('35', '0', '测试歌手', '/upload/2019/02/13/17be9274c16f17780d3bff6da7b9100d.jpg', '我晕倒', '2019-01-16 11:23:28', '2019-02-18 11:13:19', '0', '0', null, null, '1', '0', null, 'hhhhh', '3d48b10a2a0d66ee88b0a9a080e66c25', null, '0', '0', '8', '33', '0', '0');
INSERT INTO `admin` VALUES ('36', '0', 'ss屠国强ss', '/upload/2019/02/13/09c0617e72acbf457193e3ff8aa62940.jpg', 'ww屠ww', '2019-01-17 15:10:29', '2019-02-13 15:04:21', '21', '0', null, null, '1', '0', null, 'tgqss', 'remove', null, '9', '48', '12', '33', '0', '0');
INSERT INTO `admin` VALUES ('37', '0', '大哥啊', '/upload/2019/01/20/cf1b4d5f4e5282d2721b178819c235ab.jpg', '大哥啊', '2019-01-20 22:04:50', '2019-01-25 17:26:05', '21', '0', null, null, '1', '0', null, 'dga', '3d48b10a2a0d66ee88b0a9a080e66c25', null, '17', '389', '11', '33', '0', '0');
INSERT INTO `admin` VALUES ('38', '0', '中国好声音', '/upload/2019/01/20/739c269a3690b9f3943ef4d51f4ea390.jpg', '1234', '2019-01-20 22:13:21', '2019-01-20 22:23:21', '21', '0', null, null, '1', '0', null, 'zghsy', 'd629381af8294f6d9b7b44f110deaa4c', null, '33', '198', '0', '0', '0', '0');
INSERT INTO `admin` VALUES ('39', '0', '我是歌手', '/upload/2019/02/12/7b52a23971d8df6a6fe39736cf273f2b.jpg', '歌手老大', '2019-01-20 22:18:15', '2019-02-12 16:21:24', '21', '0', null, null, '1', '0', null, 'wsgs', 'a4bf3d1b793ee31147ed28cb849683eb', null, '3', '484', '8', '33', '0', '0');
INSERT INTO `admin` VALUES ('40', '0', '小弟啊', '/upload/2019/01/25/038ebcae1e1ec7be554f4ae5b29682e4.jpg', '中国小弟', '2019-01-25 16:04:13', '2019-01-25 16:11:11', '37', '0', null, null, '1', '0', null, 'xda', '3d48b10a2a0d66ee88b0a9a080e66c25', '0', '5', '104', '10', '33', '0', '0');
INSERT INTO `admin` VALUES ('41', '0', '前台收银', '/upload/2019/01/25/e9bba2c6eeccdff9afc126c83a80a8b5.jpg', '前台收银哈哈哈', '2019-01-25 17:27:36', '2019-01-26 12:30:55', '37', '0', null, null, '1', '0', null, 'qtsy', '3d48b10a2a0d66ee88b0a9a080e66c25', '0', '3', '484', '13', '33', '0', '0');
INSERT INTO `admin` VALUES ('42', '0', '大师2', '/upload/2019/02/11/d2b49daf7acd8a349c3afcf2f92532d6.jpg', '昵称', '2019-01-29 15:49:29', '2019-02-11 19:43:07', '31', '0', null, null, '1', '0', null, 'dsaa', 'a4bf3d1b793ee31147ed28cb849683eb', '0', '15', '609', '8', '33', '0', '0');
INSERT INTO `admin` VALUES ('43', '0', '大师兄3', '/upload/2019/02/11/a0ce26240f4e3550ec1c5a45d1a9dd1e.jpg', '昵称', '2019-01-29 15:58:22', '2019-02-11 19:42:46', '42', '0', null, null, '1', '0', null, 'dsx3', 'a4bf3d1b793ee31147ed28cb849683eb', '0', '14', '675', '8', '33', '0', '0');
INSERT INTO `admin` VALUES ('44', '0', '大师兄4', '/upload/2019/02/11/44a3b08c43297c29747d70b2d0b45eb0.jpg', '昵称', '2019-01-29 16:05:37', '2019-02-11 19:42:14', '42', '0', null, null, '1', '0', null, 'dsx4', 'a4bf3d1b793ee31147ed28cb849683eb', '0', '20', '329', '8', '33', '0', '0');
INSERT INTO `admin` VALUES ('45', '0', '大师兄5', '/upload/2019/01/31/3206609c3639c4b184221f9c23aac612.jpg', '昵称', '2019-01-29 16:06:26', '2019-01-31 17:59:16', '42', '0', null, null, '1', '0', null, 'dsx5', 'a4bf3d1b793ee31147ed28cb849683eb', '0', '22', '260', '8', '33', '0', '0');
INSERT INTO `admin` VALUES ('46', '0', '张三丰', '/upload/2019/02/11/04fcc7c18db1496001c94fe7d461dc8e.jpg', '昵称', '2019-02-11 16:36:33', '2019-02-11 16:44:48', '0', '0', null, null, '1', '0', null, 'adminwoshizsf', 'b33fea4f0f385e540cea20d3560a6441', '0', '13', '459', '12', '33', '0', '0');
INSERT INTO `admin` VALUES ('47', '0', '图图图', '/upload/2019/02/16/d24b2a1a6218b715b159ecf812222d1d.jpg', '图图图', '2019-02-16 16:17:13', '2019-02-18 11:06:41', '21', '0', null, null, '1', '0', null, '123', '3d48b10a2a0d66ee88b0a9a080e66c25', '0', '23', '226', '12', '1', '0', '0');
INSERT INTO `admin` VALUES ('48', '0', '图图图', '/upload/2019/02/18/13a7824f0c1874ae22ac7fa67738ab3e.jpg', '图图图', '2019-02-18 11:17:11', '2019-02-18 11:17:11', '21', '0', null, null, '1', '0', null, '111111', 'e0b50ce6529038da5cd69ffa2cce9c19', '0', '22', '273', '9', '34', '0', '0');
INSERT INTO `admin` VALUES ('49', '0', '123456', 'images/mgcaraddimg.jpg', '123456', '2019-02-25 17:41:02', '2019-02-25 17:41:02', '21', '0', null, null, '1', '0', null, '123456', 'a4bf3d1b793ee31147ed28cb849683eb', '0', '17', '404', '10', '33', '0', '0');
INSERT INTO `admin` VALUES ('50', '0', '测试', '/upload/2019/02/28/1628036bb9ab18bbcbdb9dad30081cb9.jpg', '123456', '2019-02-28 10:27:17', '2019-02-28 10:27:17', '21', '0', null, null, '1', '0', null, '1234561', 'a4bf3d1b793ee31147ed28cb849683eb', '0', '17', '410', '13', '34', '0', '0');

-- ----------------------------
-- Table structure for admin_agp
-- ----------------------------
DROP TABLE IF EXISTS `admin_agp`;
CREATE TABLE `admin_agp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限组名称',
  `dt_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dt_edit` datetime DEFAULT NULL,
  `purview_map` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限组合集',
  `showtag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '显示',
  `fsid` int(11) NOT NULL DEFAULT '0' COMMENT '所属公司fsid',
  `systag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为系统默认模板',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员权限表/角色表';

-- ----------------------------
-- Records of admin_agp
-- ----------------------------
INSERT INTO `admin_agp` VALUES ('1', '系统管理员', '2019-01-25 16:08:56', '2019-01-25 15:49:08', '5,14,17,20,16,10,11,12,9,8,7,15,4,13,3,2,1,18,6,19,', '1', '0', '1');
INSERT INTO `admin_agp` VALUES ('5', '财务管理员', '2019-01-25 16:08:50', '2019-01-25 15:49:36', '14,17,20,16,9,15,13,2,1,6,19,', '1', '0', '1');
INSERT INTO `admin_agp` VALUES ('6', '普通审核员', '2019-01-25 16:08:43', '2019-01-25 15:00:16', '14,17,16,15,13,', '1', '0', '1');
INSERT INTO `admin_agp` VALUES ('7', '业务经理', '2019-01-25 16:08:53', '2019-01-25 15:00:23', '17,16,9,15,2,1,6,19,', '1', '0', '1');
INSERT INTO `admin_agp` VALUES ('12', '公司老总', '2019-01-25 17:21:31', '2019-01-25 17:16:51', '5,17,20,16,10,11,12,8,7,15,4,3,2,6,19,', '1', '33', '0');
INSERT INTO `admin_agp` VALUES ('8', '业务经理', '2019-01-25 15:00:23', '2019-01-25 15:00:23', '17,16,9,15,2,1,6,19,', '1', '33', '0');
INSERT INTO `admin_agp` VALUES ('9', '系统管理员', '2019-02-16 15:39:14', '2019-02-16 15:39:14', '5,14,17,20,16,21,10,27,22,28,26,29,11,24,12,9,8,7,15,4,13,3,2,1,18,23,25,6,19,', '1', '33', '0');
INSERT INTO `admin_agp` VALUES ('10', '普通审核员', '2019-01-25 15:00:16', '2019-01-25 15:00:16', '14,17,16,15,13,', '1', '33', '0');
INSERT INTO `admin_agp` VALUES ('11', '财务管理员', '2019-01-28 10:51:10', '2019-01-28 10:51:10', '5,20,16,15,4,6,19,', '1', '33', '0');
INSERT INTO `admin_agp` VALUES ('13', '前台收银', '2019-01-25 17:26:51', '2019-01-25 17:26:51', '5,4,12,', '1', '33', '0');

-- ----------------------------
-- Table structure for comm_citys
-- ----------------------------
DROP TABLE IF EXISTS `comm_citys`;
CREATE TABLE `comm_citys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caid` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `namepy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `chrkey` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_site` int(1) DEFAULT '0',
  `mapx` decimal(20,17) DEFAULT NULL,
  `mapy` decimal(20,17) DEFAULT NULL,
  `mapz` int(11) DEFAULT NULL,
  `mem_num` int(11) DEFAULT NULL,
  `vips_num` int(11) DEFAULT NULL,
  `pact_num` int(11) DEFAULT NULL COMMENT '签约量',
  `pact_price` int(11) DEFAULT NULL COMMENT '签约金额',
  `baseurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manager` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `addres` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zipcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `state_id` (`state_id`) USING BTREE,
  KEY `is_site` (`is_site`) USING BTREE,
  KEY `caid` (`caid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=681 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comm_citys
-- ----------------------------
INSERT INTO `comm_citys` VALUES ('475', '5', '1', '北京市', 'beijingshi|bjs', 'b', '1', '116.41424900000000000', '39.91011700000000000', '11', '2', '2209', '233', '0', '', '', '', '', '', '100000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('507', '8', '2', '上海市', 'shanghaishi|shs', 's', '1', '121.48904900000000000', '31.25015000000000000', '11', '0', '1191', '138', null, '', '', '', '', '', '200000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('484', null, '3', '天津市', 'tianjinshi|tjs', 't', '1', null, null, null, '0', '923', '181', null, null, null, null, null, null, '100000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('539', null, '4', '重庆市', 'chongqingshi|cqs', 'c', '1', null, null, null, '0', '588', '18', null, null, null, null, null, null, '400000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('102', null, '5', '哈尔滨市', 'haerbinshi|hebs', 'h', '0', null, null, null, '0', '295', '0', null, null, null, null, null, null, '150000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('103', null, '5', '齐齐哈尔市', 'qiqihaershi|qqhes', 'q', '0', null, null, null, '0', '108', '0', null, null, null, null, null, null, '161000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('104', null, '5', '鸡西市', 'jixishi|jxs', 'j', '0', null, null, null, '0', '29', '0', null, null, null, null, null, null, '158100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('105', null, '5', '大庆市', 'daqingshi|dqs', 'd', '0', null, null, null, '0', '137', '3', null, null, null, null, null, null, '163000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('106', null, '5', '双鸭山市', 'shuangyashanshi|syss', 's', '0', null, null, null, '0', '16', '0', null, null, null, null, null, null, '155100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('107', null, '5', '鹤岗市', 'hegangshi|hgs', 'h', '0', null, null, null, '0', '7', '0', null, null, null, null, null, null, '154100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('108', null, '5', '伊春市', 'yichunshi|ycs', 'y', '0', null, null, null, '0', '6', '0', null, null, null, null, null, null, '152300', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('109', null, '5', '佳木斯市', 'jiamusishi|jmss', 'j', '0', null, null, null, '0', '97', '0', null, null, null, null, null, null, '154000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('110', null, '5', '牡丹江市', 'mudanjiangshi|mdjs', 'm', '0', null, null, null, '0', '80', '0', null, null, null, null, null, null, '157000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('111', null, '5', '七台河市', 'qitaiheshi|qths', 'q', '0', null, null, null, '0', '17', '0', null, null, null, null, null, null, '154600', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('112', null, '5', '黑河市', 'heiheshi|hhs', 'h', '0', null, null, null, '0', '29', '0', null, null, null, null, null, null, '164300', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('113', null, '5', '绥化市', 'suihuashi|shs', 's', '0', null, null, null, '0', '35', '0', null, null, null, null, null, null, '152000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('120', null, '5', '铁力市', 'tielishi|tls', 't', '0', null, null, null, '0', '1', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('122', null, '5', '尚志市', 'shangzhishi|szs', 's', '0', null, null, null, '0', '1', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('587', null, '5', '大兴安岭市', 'daxinganlingshi|dxals', 'd', '0', null, null, null, '0', '4', '0', null, null, null, null, null, null, '165000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('63', null, '6', '沈阳市', 'shenyangshi|sys', 's', '0', null, null, null, '0', '359', '45', null, null, null, null, null, null, '110000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('64', null, '6', '大连市', 'dalianshi|dls', 'd', '0', null, null, null, '0', '352', '97', null, null, null, null, null, null, '116000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('65', null, '6', '鞍山市', 'anshanshi|ass', 'a', '0', null, null, null, '0', '138', '0', null, null, null, null, null, null, '114000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('66', null, '6', '抚顺市', 'fushunshi|fss', 'f', '0', null, null, null, '0', '47', '0', null, null, null, null, null, null, '113000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('67', null, '6', '本溪市', 'benxishi|bxs', 'b', '0', null, null, null, '0', '44', '0', null, null, null, null, null, null, '117000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('68', null, '6', '丹东市', 'dandongshi|dds', 'd', '0', null, null, null, '0', '68', '12', null, null, null, null, null, null, '118000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('69', null, '6', '锦州市', 'jinzhoushi|jzs', 'j', '0', null, null, null, '0', '67', '0', null, null, null, null, null, null, '121000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('70', null, '6', '葫芦岛市', 'huludaoshi|hlds', 'h', '0', null, null, null, '0', '79', '0', null, null, null, null, null, null, '125000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('71', null, '6', '营口市', 'yingkoushi|yks', 'y', '0', null, null, null, '0', '86', '0', null, null, null, null, null, null, '115000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('72', null, '6', '阜新市', 'fuxinshi|fxs', 'f', '0', null, null, null, '0', '61', '0', null, null, null, null, null, null, '123000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('73', null, '6', '辽阳市', 'liaoyangshi|lys', 'l', '0', null, null, null, '0', '50', '0', null, null, null, null, null, null, '111000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('74', null, '6', '铁岭市', 'tielingshi|tls', 't', '0', null, null, null, '0', '53', '0', null, null, null, null, null, null, '112000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('75', null, '6', '朝阳市', 'chaoyangshi|cys', 'c', '0', null, null, null, '0', '81', '0', null, null, null, null, null, null, '122000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('76', null, '6', '盘锦市', 'panjinshi|pjs', 'p', '0', null, null, null, '0', '76', '0', null, null, null, null, null, null, '124000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('85', null, '7', '长春市', 'changchunshi|ccs', 'c', '0', null, null, null, '0', '306', '19', null, null, null, null, null, null, '130000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('86', null, '7', '吉林市', 'jilinshi|jls', 'j', '0', null, null, null, '0', '118', '0', null, null, null, null, null, null, '132000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('87', null, '7', '四平市', 'sipingshi|sps', 's', '0', null, null, null, '0', '48', '0', null, null, null, null, null, null, '136000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('88', null, '7', '辽源市', 'liaoyuanshi|lys', 'l', '0', null, null, null, '0', '16', '0', null, null, null, null, null, null, '136200', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('89', null, '7', '通化市', 'tonghuashi|ths', 't', '0', null, null, null, '0', '38', '0', null, null, null, null, null, null, '134000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('90', null, '7', '白山市', 'baishanshi|bss', 'b', '0', null, null, null, '0', '23', '0', null, null, null, null, null, null, '134300', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('91', null, '7', '松原市', 'songyuanshi|sys', 's', '0', null, null, null, '0', '44', '0', null, null, null, null, null, null, '131100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('92', null, '7', '白城市', 'baichengshi|bcs', 'b', '0', null, null, null, '0', '35', '0', null, null, null, null, null, null, '137000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('93', null, '7', '延吉市', 'yanjishi|yjs', 'y', '0', null, null, null, '0', '65', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('588', null, '7', '延边市', 'yanbianshi|ybs', 'y', '0', null, null, null, '0', '8', '0', null, null, null, null, null, null, '133000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('6', null, '8', '石家庄市', 'shijiazhuangshi|sjzs', 's', '0', null, null, null, '0', '344', '2', null, null, null, null, null, null, '050000', '0', null, '1444060035', '0', null);
INSERT INTO `comm_citys` VALUES ('7', null, '8', '唐山市', 'tangshanshi|tss', 't', '0', null, null, null, '0', '360', '5', null, null, null, null, null, null, '063000', '0', null, '1444060033', '0', null);
INSERT INTO `comm_citys` VALUES ('8', null, '8', '邯郸市', 'handanshi|hds', 'h', '0', null, null, null, '0', '240', '0', null, null, null, null, null, null, '056000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('9', null, '8', '邢台市', 'xingtaishi|xts', 'x', '0', null, null, null, '0', '171', '0', null, null, null, null, null, null, '054000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('10', null, '8', '保定市', 'baodingshi|bds', 'b', '0', null, null, null, '0', '334', '1', null, null, null, null, null, null, '071000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('11', null, '8', '张家口市', 'zhangjiakoushi|zjks', 'z', '0', null, null, null, '0', '113', '0', null, null, null, null, null, null, '075000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('12', null, '8', '承德市', 'chengdeshi|cds', 'c', '0', null, null, null, '0', '85', '0', null, null, null, null, null, null, '067000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('13', null, '8', '秦皇岛市', 'qinhuangdaoshi|qhds', 'q', '0', null, null, null, '0', '128', '0', null, null, null, null, null, null, '066000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('14', null, '8', '沧州市', 'cangzhoushi|czs', 'c', '0', null, null, null, '0', '223', '0', null, null, null, null, null, null, '061000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('15', null, '8', '廊坊市', 'langfangshi|lfs', 'l', '0', null, null, null, '0', '146', '0', null, null, null, null, null, null, '065000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('16', null, '8', '衡水市', 'hengshuishi|hss', 'h', '0', null, null, null, '0', '126', '0', null, null, null, null, null, null, '053000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('585', null, '9', '鄂尔多斯市', 'eerduosishi|eedss', 'e', '0', null, null, null, '0', '222', '23', null, null, null, null, null, null, '010300', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('48', null, '9', '呼和浩特市', 'huhehaoteshi|hhhts', 'h', '0', null, null, null, '0', '212', '20', null, null, null, null, null, null, '010000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('49', null, '9', '包头市', 'baotoushi|bts', 'b', '0', null, null, null, '0', '220', '6', null, null, null, null, null, null, '014000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('50', null, '9', '乌海市', 'wuhaishi|whs', 'w', '0', null, null, null, '0', '72', '4', null, null, null, null, null, null, '016000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('51', null, '9', '赤峰市', 'chifengshi|cfs', 'c', '0', null, null, null, '0', '130', '4', null, null, null, null, null, null, '024000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('540', null, '9', '通辽市', 'tongliaoshi|tls', 't', '0', null, null, null, '0', '96', '2', null, null, null, null, null, null, '028000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('589', null, '9', '呼伦贝尔市', 'hulunbeiershi|hlbes', 'h', '0', null, null, null, '0', '54', '0', null, null, null, null, null, null, '021000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('590', null, '9', '巴彦淖尔市', 'bayannaoershi|bynes', 'b', '0', null, null, null, '0', '63', '2', null, null, null, null, null, null, '014400', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('591', null, '9', '乌兰察布市', 'wulanchabushi|wlcbs', 'w', '0', null, null, null, '0', '40', '0', null, null, null, null, null, null, '011800', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('592', null, '9', '乌兰浩特市', 'wulanhaoteshi|wlhts', 'w', '0', null, null, null, '0', '5', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('593', null, '9', '锡林郭勒市', 'xilinguoleshi|xlgls', 'x', '0', null, null, null, '0', '60', '1', null, null, null, null, null, null, '011100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('594', null, '9', '阿拉善市', 'alashanshi|alss', 'a', '0', null, null, null, '0', '5', '0', null, null, null, null, null, null, '016000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('433', null, '10', '西安市', 'xianshi|xas', 'x', '0', null, null, null, '0', '424', '58', null, null, null, null, null, null, '710000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('434', null, '10', '宝鸡市', 'baojishi|bjs', 'b', '0', null, null, null, '0', '87', '0', null, null, null, null, null, null, '721000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('435', null, '10', '咸阳市', 'xianyangshi|xys', 'x', '0', null, null, null, '0', '29', '0', null, null, null, null, null, null, '712000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('436', null, '10', '铜川市', 'tongchuanshi|tcs', 't', '0', null, null, null, '0', '4', '0', null, null, null, null, null, null, '727000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('437', null, '10', '渭南市', 'weinanshi|wns', 'w', '0', null, null, null, '0', '96', '0', null, null, null, null, null, null, '714000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('438', null, '10', '延安市', 'yananshi|yas', 'y', '0', null, null, null, '0', '79', '0', null, null, null, null, null, null, '716000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('439', null, '10', '汉中市', 'hanzhongshi|hzs', 'h', '0', null, null, null, '0', '72', '0', null, null, null, null, null, null, '723000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('440', null, '10', '榆林市', 'yulinshi|yls', 'y', '0', null, null, null, '0', '180', '0', null, null, null, null, null, null, '719000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('441', null, '10', '商洛市', 'shangluoshi|sls', 's', '0', null, null, null, '0', '9', '0', null, null, null, null, null, null, '711500', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('595', null, '10', '安康市', 'ankangshi|aks', 'a', '0', null, null, null, '0', '37', '0', null, null, null, null, null, null, '725000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('33', null, '11', '太原市', 'taiyuanshi|tys', 't', '0', null, null, null, '0', '329', '15', null, null, null, null, null, null, '030000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('34', null, '11', '大同市', 'datongshi|dts', 'd', '0', null, null, null, '0', '112', '0', null, null, null, null, null, null, '037000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('35', null, '11', '阳泉市', 'yangquanshi|yqs', 'y', '0', null, null, null, '0', '51', '0', null, null, null, null, null, null, '045000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('36', null, '11', '长治市', 'changzhishi|czs', 'c', '0', null, null, null, '0', '138', '4', null, null, null, null, null, null, '046000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('37', null, '11', '晋城市', 'jinchengshi|jcs', 'j', '0', null, null, null, '0', '85', '0', null, null, null, null, null, null, '048000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('38', null, '11', '朔州市', 'shuozhoushi|szs', 's', '0', null, null, null, '0', '47', '0', null, null, null, null, null, null, '036000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('40', null, '11', '临汾市', 'linfenshi|lfs', 'l', '0', null, null, null, '0', '139', '3', null, null, null, null, null, null, '041000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('42', null, '11', '运城市', 'yunchengshi|ycs', 'y', '0', null, null, null, '0', '132', '0', null, null, null, null, null, null, '044000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('43', null, '11', '忻州市', 'xinzhoushi|xzs', 'x', '0', null, null, null, '0', '61', '0', null, null, null, null, null, null, '034000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('569', null, '11', '晋中市', 'jinzhongshi|jzs', 'j', '0', null, null, null, '0', '84', '0', null, null, null, null, null, null, '030600', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('596', null, '11', '吕梁市', 'luliangshi|lls', 'l', '0', null, null, null, '0', '80', '0', null, null, null, null, null, null, '030500', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('445', null, '12', '兰州市', 'lanzhoushi|lzs', 'l', '0', null, null, null, '0', '239', '1', null, null, null, null, null, null, '730000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('446', null, '12', '嘉峪关市', 'jiayuguanshi|jygs', 'j', '0', null, null, null, '0', '12', '0', null, null, null, null, null, null, '735100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('447', null, '12', '金昌市', 'jinchangshi|jcs', 'j', '0', null, null, null, '0', '4', '0', null, null, null, null, null, null, '737100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('448', null, '12', '白银市', 'baiyinshi|bys', 'b', '0', null, null, null, '0', '30', '0', null, null, null, null, null, null, '730900', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('449', null, '12', '天水市', 'tianshuishi|tss', 't', '0', null, null, null, '0', '45', '0', null, null, null, null, null, null, '741000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('450', null, '12', '平凉市', 'pingliangshi|pls', 'p', '0', null, null, null, '0', '18', '0', null, null, null, null, null, null, '744000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('451', null, '12', '临夏市', 'linxiashi|lxs', 'l', '0', null, null, null, '0', '7', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('452', null, '12', '武威市', 'wuweishi|wws', 'w', '0', null, null, null, '0', '29', '0', null, null, null, null, null, null, '733000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('453', null, '12', '张掖市', 'zhangyeshi|zys', 'z', '0', null, null, null, '0', '31', '1', null, null, null, null, null, null, '734000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('454', null, '12', '酒泉市', 'jiuquanshi|jqs', 'j', '0', null, null, null, '0', '57', '0', null, null, null, null, null, null, '735000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('570', null, '12', '陇南市', 'longnanshi|lns', 'l', '0', null, null, null, '0', '4', '0', null, null, null, null, null, null, '742100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('597', null, '12', '甘南市', 'gannanshi|gns', 'g', '0', null, null, null, '0', '1', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('598', null, '12', '定西市', 'dingxishi|dxs', 'd', '0', null, null, null, '0', '19', '0', null, null, null, null, null, null, '743000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('599', null, '12', '庆阳市', 'qingyangshi|qys', 'q', '0', null, null, null, '0', '45', '0', null, null, null, null, null, null, '744500', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('459', null, '13', '银川市', 'yinchuanshi|ycs', 'y', '0', null, null, null, '0', '172', '0', null, null, null, null, null, null, '750000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('460', null, '13', '石嘴山市', 'shizuishanshi|szss', 's', '0', null, null, null, '0', '5', '0', null, null, null, null, null, null, '753000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('600', null, '13', '吴忠市', 'wuzhongshi|wzs', 'w', '0', null, null, null, '0', '9', '0', null, null, null, null, null, null, '751100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('601', null, '13', '固原市', 'guyuanshi|gys', 'g', '0', null, null, null, '0', '25', '0', null, null, null, null, null, null, '756000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('602', null, '13', '中卫市', 'zhongweishi|zws', 'z', '0', null, null, null, '0', '5', '0', null, null, null, null, null, null, '751700', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('586', null, '14', '库尔勒市', 'kuerleshi|kels', 'k', '0', null, null, null, '0', '55', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('675', null, '14', '五家渠市', 'wujiaqushi|wjqs', 'w', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, '831300', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('673', null, '14', '伊犁市', 'yilishi|yls', 'y', '0', null, null, null, '0', '15', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('674', null, '14', '阜康市', 'fukangshi|fks', 'f', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('462', null, '14', '乌鲁木齐市', 'wulumuqishi|wlmqs', 'w', '0', null, null, null, '0', '236', '16', null, null, null, null, null, null, '830000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('463', null, '14', '克拉玛依市', 'kelamayishi|klmys', 'k', '0', null, null, null, '0', '32', '0', null, null, null, null, null, null, '834000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('464', null, '14', '石河子市', 'shihezishi|shzs', 's', '0', null, null, null, '0', '8', '0', null, null, null, null, null, null, '832000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('465', null, '14', '伊宁市', 'yiningshi|yns', 'y', '0', null, null, null, '0', '28', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('466', null, '14', '喀什市', 'kashishi|kss', 'k', '0', null, null, null, '0', '28', '0', null, null, null, null, null, null, '844000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('467', null, '14', '哈密市', 'hamishi|hms', 'h', '0', null, null, null, '0', '33', '0', null, null, null, null, null, null, '839000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('469', null, '14', '昌吉市', 'changjishi|cjs', 'c', '0', null, null, null, '0', '16', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('470', null, '14', '阿克苏市', 'akesushi|akss', 'a', '0', null, null, null, '0', '52', '0', null, null, null, null, null, null, '843000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('471', null, '14', '和田市', 'hetianshi|hts', 'h', '0', null, null, null, '0', '11', '0', null, null, null, null, null, null, '848000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('472', null, '14', '吐鲁番市', 'tulufanshi|tlfs', 't', '0', null, null, null, '0', '4', '0', null, null, null, null, null, null, '838000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('473', null, '14', '塔城市', 'tachengshi|tcs', 't', '0', null, null, null, '0', '14', '0', null, null, null, null, null, null, '834700', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('603', null, '14', '巴音郭楞市', 'bayinguolengshi|bygls', 'b', '0', null, null, null, '0', '5', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('604', null, '14', '克孜勒苏市', 'kezilesushi|kzlss', 'k', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('605', null, '14', '阿勒泰市', 'aletaishi|alts', 'a', '0', null, null, null, '0', '5', '0', null, null, null, null, null, null, '836500', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('606', null, '14', '博尔塔拉市', 'boertalashi|betls', 'b', '0', null, null, null, '0', '4', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('432', null, '15', '拉萨市', 'lasashi|lss', 'l', '0', null, null, null, '0', '81', '0', null, null, null, null, null, null, '850000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('607', null, '15', '昌都市', 'changdoushi|cds', 'c', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, '854000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('608', null, '15', '山南市', 'shannanshi|sns', 's', '0', null, null, null, '0', '1', '1', null, null, null, null, null, null, '856000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('609', null, '15', '日喀则市', 'rikazeshi|rkzs', 'r', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, '857000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('610', null, '15', '那曲市', 'naqushi|nqs', 'n', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, '852000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('611', null, '15', '阿里市', 'alishi|als', 'a', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, '859100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('612', null, '15', '林芝市', 'linzhishi|lzs', 'l', '0', null, null, null, '0', '6', '2', null, null, null, null, null, null, '860100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('456', null, '16', '西宁市', 'xiningshi|xns', 'x', '0', null, null, null, '0', '136', '0', null, null, null, null, null, null, '810000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('613', null, '16', '海东市', 'haidongshi|hds', 'h', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, '810600', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('614', null, '16', '海南市', 'hainanshi|hns', 'h', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('615', null, '16', '海西市', 'haixishi|hxs', 'h', '0', null, null, null, '0', '10', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('616', null, '16', '海北市', 'haibeishi|hbs', 'h', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('617', null, '16', '黄南市', 'huangnanshi|hns', 'h', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('618', null, '16', '玉树市', 'yushushi|yss', 'y', '0', null, null, null, '0', '1', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('619', null, '16', '果洛市', 'guoluoshi|gls', 'g', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('386', null, '17', '成都市', 'chengdoushi|cds', 'c', '0', null, null, null, '0', '683', '57', null, null, null, null, null, null, '610000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('387', null, '17', '自贡市', 'zigongshi|zgs', 'z', '0', null, null, null, '0', '59', '1', null, null, null, null, null, null, '643000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('388', null, '17', '攀枝花市', 'panzhihuashi|pzhs', 'p', '0', null, null, null, '0', '51', '0', null, null, null, null, null, null, '617000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('389', null, '17', '德阳市', 'deyangshi|dys', 'd', '0', null, null, null, '0', '111', '1', null, null, null, null, null, null, '618000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('390', null, '17', '泸州市', 'luzhoushi|lzs', 'l', '0', null, null, null, '0', '92', '0', null, null, null, null, null, null, '646100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('391', null, '17', '绵阳市', 'mianyangshi|mys', 'm', '0', null, null, null, '0', '141', '0', null, null, null, null, null, null, '621000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('392', null, '17', '内江市', 'neijiangshi|njs', 'n', '0', null, null, null, '0', '29', '0', null, null, null, null, null, null, '641000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('393', null, '17', '广元市', 'guangyuanshi|gys', 'g', '0', null, null, null, '0', '53', '0', null, null, null, null, null, null, '628000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('394', null, '17', '遂宁市', 'suiningshi|sns', 's', '0', null, null, null, '0', '59', '0', null, null, null, null, null, null, '629000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('395', null, '17', '乐山市', 'leshanshi|lss', 'l', '0', null, null, null, '0', '89', '0', null, null, null, null, null, null, '614000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('396', null, '17', '南充市', 'nanchongshi|ncs', 'n', '0', null, null, null, '0', '97', '0', null, null, null, null, null, null, '637000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('397', null, '17', '宜宾市', 'yibinshi|ybs', 'y', '0', null, null, null, '0', '56', '0', null, null, null, null, null, null, '644000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('398', null, '17', '广安市', 'guanganshi|gas', 'g', '0', null, null, null, '0', '38', '0', null, null, null, null, null, null, '638000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('399', null, '17', '达州市', 'dazhoushi|dzs', 'd', '0', null, null, null, '0', '58', '0', null, null, null, null, null, null, '635000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('402', null, '17', '雅安市', 'yaanshi|yas', 'y', '0', null, null, null, '0', '31', '0', null, null, null, null, null, null, '625000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('404', null, '17', '广汉市', 'guanghanshi|ghs', 'g', '0', null, null, null, '0', '3', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('409', null, '17', '资阳市', 'ziyangshi|zys', 'z', '0', null, null, null, '0', '22', '0', null, null, null, null, null, null, '641300', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('410', null, '17', '巴中市', 'bazhongshi|bzs', 'b', '0', null, null, null, '0', '23', '0', null, null, null, null, null, null, '635500', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('620', null, '17', '凉山市', 'liangshanshi|lss', 'l', '0', null, null, null, '0', '47', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('621', null, '17', '眉山市', 'meishanshi|mss', 'm', '0', null, null, null, '0', '50', '0', null, null, null, null, null, null, '612100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('622', null, '17', '阿坝市', 'abashi|abs', 'a', '0', null, null, null, '0', '2', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('623', null, '17', '甘孜市', 'ganzishi|gzs', 'g', '0', null, null, null, '0', '3', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('420', null, '18', '昆明市', 'kunmingshi|kms', 'k', '0', null, null, null, '0', '384', '48', null, null, null, null, null, null, '650000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('421', null, '18', '曲靖市', 'qujingshi|qjs', 'q', '0', null, null, null, '0', '98', '0', null, null, null, null, null, null, '655000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('422', null, '18', '玉溪市', 'yuxishi|yxs', 'y', '0', null, null, null, '0', '76', '0', null, null, null, null, null, null, '653100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('423', null, '18', '昭通市', 'zhaotongshi|zts', 'z', '0', null, null, null, '0', '34', '0', null, null, null, null, null, null, '657000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('424', null, '18', '楚雄市', 'chuxiongshi|cxs', 'c', '0', null, null, null, '0', '37', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('427', null, '18', '大理市', 'dalishi|dls', 'd', '0', null, null, null, '0', '60', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('428', null, '18', '保山市', 'baoshanshi|bss', 'b', '0', null, null, null, '0', '33', '0', null, null, null, null, null, null, '678000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('670', null, '18', '开远市', 'kaiyuanshi|kys', 'k', '0', null, null, null, '0', '15', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('624', null, '18', '迪庆市', 'diqingshi|dqs', 'd', '0', null, null, null, '0', '3', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('625', null, '18', '红河市', 'hongheshi|hhs', 'h', '0', null, null, null, '0', '55', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('626', null, '18', '德宏市', 'dehongshi|dhs', 'd', '0', null, null, null, '0', '21', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('627', null, '18', '西双版纳市', 'xishuangbannashi|xsbns', 'x', '0', null, null, null, '0', '17', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('628', null, '18', '普洱市', 'puershi|pes', 'p', '0', null, null, null, '0', '30', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('629', null, '18', '怒江市', 'nujiangshi|njs', 'n', '0', null, null, null, '0', '1', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('630', null, '18', '临沧市', 'lincangshi|lcs', 'l', '0', null, null, null, '0', '13', '0', null, null, null, null, null, null, '677000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('631', null, '18', '文山市', 'wenshanshi|wss', 'w', '0', null, null, null, '0', '29', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('632', null, '18', '丽江市', 'lijiangshi|ljs', 'l', '0', null, null, null, '0', '17', '0', null, null, null, null, null, null, '674100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('414', null, '19', '贵阳市', 'guiyangshi|gys', 'g', '0', null, null, null, '0', '232', '2', null, null, null, null, null, null, '55000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('415', null, '19', '六盘水市', 'liupanshuishi|lpss', 'l', '0', null, null, null, '0', '56', '0', null, null, null, null, null, null, '553000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('416', null, '19', '遵义市', 'zunyishi|zys', 'z', '0', null, null, null, '0', '100', '0', null, null, null, null, null, null, '563000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('417', null, '19', '安顺市', 'anshunshi|ass', 'a', '0', null, null, null, '0', '26', '0', null, null, null, null, null, null, '561000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('633', null, '19', '铜仁市', 'tongrenshi|trs', 't', '0', null, null, null, '0', '29', '0', null, null, null, null, null, null, '554300', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('634', null, '19', '黔东南市', 'qiandongnanshi|qdns', 'q', '0', null, null, null, '0', '41', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('635', null, '19', '黔南市', 'qiannanshi|qns', 'q', '0', null, null, null, '0', '18', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('636', null, '19', '黔西南市', 'qianxinanshi|qxns', 'q', '0', null, null, null, '0', '56', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('637', null, '19', '毕节市', 'bijieshi|bjs', 'b', '0', null, null, null, '0', '24', '0', null, null, null, null, null, null, '551700', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('326', null, '20', '长沙市', 'changshashi|css', 'c', '0', null, null, null, '0', '381', '19', null, null, null, null, null, null, '410000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('327', null, '20', '株洲市', 'zhuzhoushi|zzs', 'z', '0', null, null, null, '0', '70', '0', null, null, null, null, null, null, '412000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('328', null, '20', '湘潭市', 'xiangtanshi|xts', 'x', '0', null, null, null, '0', '57', '0', null, null, null, null, null, null, '411100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('329', null, '20', '衡阳市', 'hengyangshi|hys', 'h', '0', null, null, null, '0', '94', '0', null, null, null, null, null, null, '421000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('330', null, '20', '邵阳市', 'shaoyangshi|sys', 's', '0', null, null, null, '0', '78', '0', null, null, null, null, null, null, '422000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('331', null, '20', '岳阳市', 'yueyangshi|yys', 'y', '0', null, null, null, '0', '68', '0', null, null, null, null, null, null, '414000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('332', null, '20', '常德市', 'changdeshi|cds', 'c', '0', null, null, null, '0', '83', '0', null, null, null, null, null, null, '415000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('333', null, '20', '张家界市', 'zhangjiajieshi|zjjs', 'z', '0', null, null, null, '0', '13', '0', null, null, null, null, null, null, '427000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('334', null, '20', '郴州市', 'chenzhoushi|czs', 'c', '0', null, null, null, '0', '89', '0', null, null, null, null, null, null, '423000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('335', null, '20', '益阳市', 'yiyangshi|yys', 'y', '0', null, null, null, '0', '58', '0', null, null, null, null, null, null, '413000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('336', null, '20', '永州市', 'yongzhoushi|yzs', 'y', '0', null, null, null, '0', '55', '0', null, null, null, null, null, null, '425000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('337', null, '20', '怀化市', 'huaihuashi|hhs', 'h', '0', null, null, null, '0', '77', '0', null, null, null, null, null, null, '418000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('338', null, '20', '娄底市', 'loudishi|lds', 'l', '0', null, null, null, '0', '66', '0', null, null, null, null, null, null, '417000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('672', null, '20', '湘西市', 'xiangxishi|xxs', 'x', '0', null, null, null, '0', '12', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('291', null, '21', '武汉市', 'wuhanshi|whs', 'w', '0', null, null, null, '0', '467', '36', null, null, null, null, null, null, '430000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('292', null, '21', '黄石市', 'huangshishi|hss', 'h', '0', null, null, null, '0', '67', '0', null, null, null, null, null, null, '435000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('293', null, '21', '十堰市', 'shiyanshi|sys', 's', '0', null, null, null, '0', '105', '0', null, null, null, null, null, null, '442000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('294', null, '21', '宜昌市', 'yichangshi|ycs', 'y', '0', null, null, null, '0', '143', '2', null, null, null, null, null, null, '443000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('295', null, '21', '荆州市', 'jingzhoushi|jzs', 'j', '0', null, null, null, '0', '89', '0', null, null, null, null, null, null, '434000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('296', null, '21', '襄阳市', 'xiangyangshi|xys', 'x', '0', null, null, null, '0', '125', '5', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('297', null, '21', '荆门市', 'jingmenshi|jms', 'j', '0', null, null, null, '0', '70', '0', null, null, null, null, null, null, '448000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('298', null, '21', '鄂州市', 'ezhoushi|ezs', 'e', '0', null, null, null, '0', '15', '0', null, null, null, null, null, null, '436000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('299', null, '21', '孝感市', 'xiaoganshi|xgs', 'x', '0', null, null, null, '0', '50', '0', null, null, null, null, null, null, '432100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('300', null, '21', '黄冈市', 'huanggangshi|hgs', 'h', '0', null, null, null, '0', '62', '0', null, null, null, null, null, null, '438000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('301', null, '21', '咸宁市', 'xianningshi|xns', 'x', '0', null, null, null, '0', '52', '0', null, null, null, null, null, null, '437000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('302', null, '21', '随州市', 'suizhoushi|szs', 's', '0', null, null, null, '0', '51', '0', null, null, null, null, null, null, '441300', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('306', null, '21', '麻城市', 'machengshi|mcs', 'm', '0', null, null, null, '0', '4', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('308', null, '21', '仙桃市', 'xiantaoshi|xts', 'x', '0', null, null, null, '0', '14', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('312', null, '21', '天门市', 'tianmenshi|tms', 't', '0', null, null, null, '0', '8', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('316', null, '21', '枣阳市', 'zaoyangshi|zys', 'z', '0', null, null, null, '0', '4', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('318', null, '21', '潜江市', 'qianjiangshi|qjs', 'q', '0', null, null, null, '0', '10', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('323', null, '21', '恩施市', 'enshishi|ess', 'e', '0', null, null, null, '0', '75', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('638', null, '21', '神农架市', 'shennongjiashi|snjs', 's', '0', null, null, null, '0', '1', '0', null, null, null, null, null, null, '442400', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('260', null, '22', '郑州市', 'zhengzhoushi|zzs', 'z', '0', null, null, null, '0', '543', '53', null, null, null, null, null, null, '450000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('261', null, '22', '开封市', 'kaifengshi|kfs', 'k', '0', null, null, null, '0', '74', '1', null, null, null, null, null, null, '475000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('262', null, '22', '洛阳市', 'luoyangshi|lys', 'l', '0', null, null, null, '0', '210', '9', null, null, null, null, null, null, '471000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('263', null, '22', '平顶山市', 'pingdingshanshi|pdss', 'p', '0', null, null, null, '0', '111', '0', null, null, null, null, null, null, '467000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('264', null, '22', '焦作市', 'jiaozuoshi|jzs', 'j', '0', null, null, null, '0', '130', '0', null, null, null, null, null, null, '454100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('265', null, '22', '鹤壁市', 'hebishi|hbs', 'h', '0', null, null, null, '0', '42', '0', null, null, null, null, null, null, '456600', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('266', null, '22', '新乡市', 'xinxiangshi|xxs', 'x', '0', null, null, null, '0', '136', '1', null, null, null, null, null, null, '453000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('267', null, '22', '安阳市', 'anyangshi|ays', 'a', '0', null, null, null, '0', '128', '1', null, null, null, null, null, null, '454900', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('268', null, '22', '濮阳市', 'puyangshi|pys', 'p', '0', null, null, null, '0', '108', '0', null, null, null, null, null, null, '457000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('269', null, '22', '许昌市', 'xuchangshi|xcs', 'x', '0', null, null, null, '0', '125', '0', null, null, null, null, null, null, '461000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('270', null, '22', '漯河市', 'leiheshi|lhs', 'l', '0', null, null, null, '0', '58', '0', null, null, null, null, null, null, '462000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('271', null, '22', '三门峡市', 'sanmenxiashi|smxs', 's', '0', null, null, null, '0', '75', '0', null, null, null, null, null, null, '472000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('272', null, '22', '南阳市', 'nanyangshi|nys', 'n', '0', null, null, null, '0', '162', '2', null, null, null, null, null, null, '473000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('273', null, '22', '商丘市', 'shangqiushi|sqs', 's', '0', null, null, null, '0', '118', '0', null, null, null, null, null, null, '476000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('274', null, '22', '信阳市', 'xinyangshi|xys', 'x', '0', null, null, null, '0', '99', '1', null, null, null, null, null, null, '464000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('275', null, '22', '周口市', 'zhoukoushi|zks', 'z', '0', null, null, null, '0', '89', '0', null, null, null, null, null, null, '466000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('276', null, '22', '驻马店市', 'zhumadianshi|zmds', 'z', '0', null, null, null, '0', '90', '0', null, null, null, null, null, null, '463000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('279', null, '22', '济源市', 'jiyuanshi|jys', 'j', '0', null, null, null, '0', '25', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('290', null, '22', '新郑市', 'xinzhengshi|xzs', 'x', '0', null, null, null, '0', '3', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('228', null, '23', '枣庄市', 'zaozhuangshi|zzs', 'z', '0', null, null, null, '0', '122', '0', null, null, null, null, null, null, '277100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('231', null, '23', '烟台市', 'yantaishi|yts', 'y', '0', null, null, null, '0', '304', '29', null, null, null, null, null, null, '264000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('232', null, '23', '济宁市', 'jiningshi|jns', 'j', '0', null, null, null, '0', '203', '0', null, null, null, null, null, null, '272100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('233', null, '23', '泰安市', 'taianshi|tas', 't', '0', null, null, null, '0', '132', '1', null, null, null, null, null, null, '271000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('234', null, '23', '威海市', 'weihaishi|whs', 'w', '0', null, null, null, '0', '146', '8', null, null, null, null, null, null, '265700', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('235', null, '23', '日照市', 'rizhaoshi|rzs', 'r', '0', null, null, null, '0', '113', '0', null, null, null, null, null, null, '276800', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('236', null, '23', '莱芜市', 'laiwushi|lws', 'l', '0', null, null, null, '0', '69', '0', null, null, null, null, null, null, '271100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('237', null, '23', '聊城市', 'liaochengshi|lcs', 'l', '0', null, null, null, '0', '146', '0', null, null, null, null, null, null, '252000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('238', null, '23', '滨州市', 'binzhoushi|bzs', 'b', '0', null, null, null, '0', '138', '1', null, null, null, null, null, null, '256600', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('240', null, '23', '菏泽市', 'hezeshi|hzs', 'h', '0', null, null, null, '0', '122', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('580', null, '23', '德州市', 'dezhoushi|dzs', 'd', '0', null, null, null, '0', '149', '0', null, null, null, null, null, null, '253000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('568', null, '23', '临沂市', 'linyishi|lys', 'l', '0', null, null, null, '0', '268', '3', null, null, null, null, null, null, '276000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('230', null, '23', '潍坊市', 'weifangshi|wfs', 'w', '0', null, null, null, '0', '387', '22', null, null, null, null, null, null, '261000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('229', null, '23', '东营市', 'dongyingshi|dys', 'd', '0', null, null, null, '0', '142', '0', null, null, null, null, null, null, '257000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('227', null, '23', '淄博市', 'ziboshi|zbs', 'z', '0', null, null, null, '0', '184', '7', null, null, null, null, null, null, '255000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('226', null, '23', '青岛市', 'qingdaoshi|qds', 'q', '0', null, null, null, '0', '448', '52', null, null, null, null, null, null, '266000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('225', null, '23', '济南市', 'jinanshi|jns', 'j', '0', null, null, null, '0', '421', '21', null, null, null, null, null, null, '250000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('181', null, '24', '合肥市', 'hefeishi|hfs', 'h', '0', null, null, null, '0', '299', '16', null, null, null, null, null, null, '230000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('182', null, '24', '淮南市', 'huainanshi|hns', 'h', '0', null, null, null, '0', '38', '0', null, null, null, null, null, null, '232000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('183', null, '24', '淮北市', 'huaibeishi|hbs', 'h', '0', null, null, null, '0', '48', '0', null, null, null, null, null, null, '235000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('184', null, '24', '芜湖市', 'wuhushi|whs', 'w', '0', null, null, null, '0', '87', '1', null, null, null, null, null, null, '241000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('185', null, '24', '铜陵市', 'tonglingshi|tls', 't', '0', null, null, null, '0', '41', '0', null, null, null, null, null, null, '244000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('186', null, '24', '蚌埠市', 'bangbushi|bbs', 'b', '0', null, null, null, '0', '68', '1', null, null, null, null, null, null, '233000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('187', null, '24', '马鞍山市', 'maanshanshi|mass', 'm', '0', null, null, null, '0', '44', '0', null, null, null, null, null, null, '243000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('188', null, '24', '安庆市', 'anqingshi|aqs', 'a', '0', null, null, null, '0', '114', '0', null, null, null, null, null, null, '246000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('189', null, '24', '黄山市', 'huangshanshi|hss', 'h', '0', null, null, null, '0', '42', '0', null, null, null, null, null, null, '242700', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('190', null, '24', '滁州市', 'chuzhoushi|czs', 'c', '0', null, null, null, '0', '68', '0', null, null, null, null, null, null, '239000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('191', null, '24', '宿州市', 'xiuzhoushi|xzs', 'x', '0', null, null, null, '0', '62', '0', null, null, null, null, null, null, '234100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('192', null, '24', '巢湖市', 'chaohushi|chs', 'c', '0', null, null, null, '0', '43', '0', null, null, null, null, null, null, '238000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('193', null, '24', '六安市', 'liuanshi|las', 'l', '0', null, null, null, '0', '92', '2', null, null, null, null, null, null, '237000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('194', null, '24', '亳州市', 'bozhoushi|bzs', 'b', '0', null, null, null, '0', '73', '0', null, null, null, null, null, null, '236800', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('582', null, '24', '阜阳市', 'fuyangshi|fys', 'f', '0', null, null, null, '0', '121', '0', null, null, null, null, null, null, '236100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('639', null, '24', '池州市', 'shizhoushi|szs', 's', '0', null, null, null, '0', '29', '0', null, null, null, null, null, null, '247100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('640', null, '24', '宣城市', 'xuanchengshi|xcs', 'x', '0', null, null, null, '0', '51', '0', null, null, null, null, null, null, '366000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('123', null, '25', '南京市', 'nanjingshi|njs', 'n', '0', null, null, null, '0', '429', '24', null, null, null, null, null, null, '210000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('124', null, '25', '徐州市', 'xuzhoushi|xzs', 'x', '0', null, null, null, '0', '249', '14', null, null, null, null, null, null, '221000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('125', null, '25', '连云港市', 'lianyungangshi|lygs', 'l', '0', null, null, null, '0', '164', '1', null, null, null, null, null, null, '222000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('127', null, '25', '盐城市', 'yanchengshi|ycs', 'y', '0', null, null, null, '0', '178', '2', null, null, null, null, null, null, '224000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('128', null, '25', '扬州市', 'yangzhoushi|yzs', 'y', '0', null, null, null, '0', '174', '5', null, null, null, null, null, null, '225000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('129', null, '25', '南通市', 'nantongshi|nts', 'n', '0', null, null, null, '0', '272', '18', null, null, null, null, null, null, '226000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('130', null, '25', '镇江市', 'zhenjiangshi|zjs', 'z', '0', null, null, null, '0', '169', '4', null, null, null, null, null, null, '212000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('131', null, '25', '常州市', 'changzhoushi|czs', 'c', '0', null, null, null, '0', '224', '11', null, null, null, null, null, null, '213000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('132', null, '25', '无锡市', 'wuxishi|wxs', 'w', '0', null, null, null, '0', '429', '26', null, null, null, null, null, null, '214000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('133', null, '25', '苏州市', 'suzhoushi|szs', 's', '0', null, null, null, '0', '607', '27', null, null, null, null, null, null, '215000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('140', null, '25', '淮安市', 'huaianshi|has', 'h', '0', null, null, null, '0', '110', '0', null, null, null, null, null, null, '223200', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('642', null, '25', '泰州市', 'taizhoushi|tzs', 't', '0', null, null, null, '0', '145', '0', null, null, null, null, null, null, '225300', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('643', null, '25', '宿迁市', 'xiuqianshi|xqs', 'x', '0', null, null, null, '0', '105', '0', null, null, null, null, null, null, '223800', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('153', '3', '26', '杭州市', 'hangzhoushi|hzs', 'h', '1', '0.00000000000000000', '0.00000000000000000', '0', '0', '587', '31', '0', '', '', '', '', '', '310000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('154', '3', '26', '宁波市', 'ningboshi|nbs', 'n', '1', null, null, null, '0', '472', '34', '0', '', '', '', '', '', '315000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('155', '3', '26', '温州市', 'wenzhoushi|wzs', 'w', '1', null, null, null, '0', '402', '8', '0', '', '', '', '', '', '325000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('156', null, '26', '嘉兴市', 'jiaxingshi|jxs', 'j', '0', null, null, null, '0', '227', '1', null, null, null, null, null, null, '314000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('157', null, '26', '湖州市', 'huzhoushi|hzs', 'h', '0', null, null, null, '0', '152', '3', null, null, null, null, null, null, '313000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('158', null, '26', '绍兴市', 'shaoxingshi|sxs', 's', '0', null, null, null, '0', '260', '1', null, null, null, null, null, null, '312000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('159', null, '26', '金华市', 'jinhuashi|jhs', 'j', '0', null, null, null, '0', '306', '2', null, null, null, null, null, null, '321000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('160', null, '26', '衢州市', 'quzhoushi|qzs', 'q', '0', null, null, null, '0', '131', '6', null, null, null, null, null, null, '324000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('161', null, '26', '舟山市', 'zhoushanshi|zss', 'z', '0', null, null, null, '0', '36', '0', null, null, null, null, null, null, '316000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('174', null, '26', '丽水市', 'lishuishi|lss', 'l', '0', null, null, null, '0', '89', '0', null, null, null, null, null, null, '323000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('179', null, '26', '台州市', 'taizhoushi|tzs', 't', '0', null, null, null, '0', '265', '12', null, null, null, null, null, null, '318000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('347', '9', '30', '广州市', 'guangzhoushi|gzs', 'g', '1', '113.30880000000000000', '23.12111300000000000', '11', '0', '783', '31', null, '', '', '', '', '', '510000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('348', null, '30', '深圳市', 'shenchoushi|scs', 's', '0', null, null, null, '0', '605', '39', null, null, null, null, null, null, '518000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('349', null, '30', '珠海市', 'zhuhaishi|zhs', 'z', '0', null, null, null, '0', '154', '5', null, null, null, null, null, null, '519000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('350', null, '30', '汕头市', 'shantoushi|sts', 's', '0', null, null, null, '0', '129', '0', null, null, null, null, null, null, '515000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('351', null, '30', '韶关市', 'shaoguanshi|sgs', 's', '0', null, null, null, '0', '72', '0', null, null, null, null, null, null, '521000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('352', null, '30', '惠州市', 'huizhoushi|hzs', 'h', '0', null, null, null, '0', '141', '3', null, null, null, null, null, null, '516000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('353', null, '30', '汕尾市', 'shanweishi|sws', 's', '0', null, null, null, '0', '11', '0', null, null, null, null, null, null, '516600', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('354', null, '30', '东莞市', 'dongguanshi|dgs', 'd', '0', null, null, null, '0', '415', '20', null, null, null, null, null, null, '511700', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('355', null, '30', '中山市', 'zhongshanshi|zss', 'z', '0', null, null, null, '0', '166', '2', null, null, null, null, null, null, '528400', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('356', null, '30', '江门市', 'jiangmenshi|jms', 'j', '0', null, null, null, '0', '125', '1', null, null, null, null, null, null, '529000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('357', null, '30', '佛山市', 'foshanshi|fss', 'f', '0', null, null, null, '0', '341', '19', null, null, null, null, null, null, '528000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('358', null, '30', '阳江市', 'yangjiangshi|yjs', 'y', '0', null, null, null, '0', '50', '1', null, null, null, null, null, null, '529500', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('359', null, '30', '湛江市', 'zhanjiangshi|zjs', 'z', '0', null, null, null, '0', '62', '0', null, null, null, null, null, null, '524000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('360', null, '30', '茂名市', 'maomingshi|mms', 'm', '0', null, null, null, '0', '65', '0', null, null, null, null, null, null, '525000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('514', null, '30', '肇庆市', 'zhaoqingshi|zqs', 'z', '0', null, null, null, '0', '74', '0', null, null, null, null, null, null, '526000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('644', null, '30', '梅州市', 'meizhoushi|mzs', 'm', '0', null, null, null, '0', '71', '0', null, null, null, null, null, null, '514000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('645', null, '30', '河源市', 'heyuanshi|hys', 'h', '0', null, null, null, '0', '59', '0', null, null, null, null, null, null, '517000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('646', null, '30', '清远市', 'qingyuanshi|qys', 'q', '0', null, null, null, '0', '77', '0', null, null, null, null, null, null, '511500', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('647', null, '30', '云浮市', 'yunfushi|yfs', 'y', '0', null, null, null, '0', '18', '0', null, null, null, null, null, null, '527300', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('648', null, '30', '揭阳市', 'jieyangshi|jys', 'j', '0', null, null, null, '0', '66', '0', null, null, null, null, null, null, '522000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('649', null, '30', '潮州市', 'chaozhoushi|czs', 'c', '0', null, null, null, '0', '47', '0', null, null, null, null, null, null, '515600', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('367', null, '31', '南宁市', 'nanningshi|nns', 'n', '0', null, null, null, '0', '253', '22', null, null, null, null, null, null, '530000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('368', null, '31', '柳州市', 'liuzhoushi|lzs', 'l', '0', null, null, null, '0', '129', '0', null, null, null, null, null, null, '545000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('369', null, '31', '桂林市', 'guilinshi|gls', 'g', '0', null, null, null, '0', '102', '1', null, null, null, null, null, null, '541000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('370', null, '31', '梧州市', 'wuzhoushi|wzs', 'w', '0', null, null, null, '0', '46', '0', null, null, null, null, null, null, '543000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('371', null, '31', '北海市', 'beihaishi|bhs', 'b', '0', null, null, null, '0', '34', '1', null, null, null, null, null, null, '536000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('372', null, '31', '防城港市', 'fangchenggangshi|fcgs', 'f', '0', null, null, null, '0', '10', '0', null, null, null, null, null, null, '538000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('373', null, '31', '钦州市', 'qinzhoushi|qzs', 'q', '0', null, null, null, '0', '29', '0', null, null, null, null, null, null, '535000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('374', null, '31', '贵港市', 'guigangshi|ggs', 'g', '0', null, null, null, '0', '36', '0', null, null, null, null, null, null, '537100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('375', null, '31', '玉林市', 'yulinshi|yls', 'y', '0', null, null, null, '0', '76', '3', null, null, null, null, null, null, '537000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('378', null, '31', '河池市', 'heshishi|hss', 'h', '0', null, null, null, '0', '36', '0', null, null, null, null, null, null, '547000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('541', null, '31', '来宾市', 'laibinshi|lbs', 'l', '0', null, null, null, '0', '6', '0', null, null, null, null, null, null, '546100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('650', null, '31', '百色市', 'baiseshi|bss', 'b', '0', null, null, null, '0', '31', '0', null, null, null, null, null, null, '533000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('651', null, '31', '贺州市', 'hezhoushi|hzs', 'h', '0', null, null, null, '0', '33', '0', null, null, null, null, null, null, '542800', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('652', null, '31', '崇左市', 'chongzuoshi|czs', 'c', '0', null, null, null, '0', '9', '0', null, null, null, null, null, null, '532200', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('209', null, '32', '南昌市', 'nanchangshi|ncs', 'n', '0', null, null, null, '0', '304', '15', null, null, null, null, null, null, '330000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('210', null, '32', '景德镇市', 'jingdezhenshi|jdzs', 'j', '0', null, null, null, '0', '42', '0', null, null, null, null, null, null, '333000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('211', null, '32', '萍乡市', 'pingxiangshi|pxs', 'p', '0', null, null, null, '0', '50', '0', null, null, null, null, null, null, '337000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('212', null, '32', '九江市', 'jiujiangshi|jjs', 'j', '0', null, null, null, '0', '115', '0', null, null, null, null, null, null, '332000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('213', null, '32', '新余市', 'xinyushi|xys', 'x', '0', null, null, null, '0', '32', '0', null, null, null, null, null, null, '338000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('214', null, '32', '鹰潭市', 'yingtanshi|yts', 'y', '0', null, null, null, '0', '27', '0', null, null, null, null, null, null, '335000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('215', null, '32', '赣州市', 'ganzhoushi|gzs', 'g', '0', null, null, null, '0', '149', '3', null, null, null, null, null, null, '341000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('216', null, '32', '上饶市', 'shangraoshi|srs', 's', '0', null, null, null, '0', '102', '1', null, null, null, null, null, null, '334000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('217', null, '32', '宜春市', 'yichunshi|ycs', 'y', '0', null, null, null, '0', '99', '0', null, null, null, null, null, null, '336000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('219', null, '32', '吉安市', 'jianshi|jas', 'j', '0', null, null, null, '0', '75', '0', null, null, null, null, null, null, '343000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('653', null, '32', '抚州市', 'fuzhoushi|fzs', 'f', '0', null, null, null, '0', '49', '1', null, null, null, null, null, null, '332900', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('198', '6', '33', '福州市', 'fuzhoushi|fzs', 'f', '1', '119.31211100000000000', '26.06789800000000000', '12', '2', '276', '24', '130000', 'http://fuzhou.xcar.com.cn/', '高译', '0591-4006966648', '0591-4006966648', '福建省福州市仓山区汇创名居二期19号楼503单元', '350000', '1', null, '1451006589', '0', 'upload/2015/12/25/1451006587_765872.jpg');
INSERT INTO `comm_citys` VALUES ('199', '6', '33', '厦门市', 'shamenshi|sms', 's', '1', '118.14704500000000000', '24.48871100000000000', '12', '0', '233', '17', '160000', '', '', '', '', '', '361000', '0', null, '1447127877', '0', 'upload/2015/11/09/1447040827_518081.jpg');
INSERT INTO `comm_citys` VALUES ('200', '6', '33', '三明市', 'sanmingshi|sms', 's', '1', '117.64615000000000000', '26.26945900000000000', '14', '0', '96', '0', '0', '', '', '', '', '', '365000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('201', '6', '33', '莆田市', 'putianshi|pts', 'p', '1', '119.02364700000000000', '25.44154000000000000', '14', '0', '70', '3', '0', '', '', '', '', '', '351100', '0', null, '1448959329', '0', null);
INSERT INTO `comm_citys` VALUES ('202', '6', '33', '泉州市', 'quanzhoushi|qzs', 'q', '1', '118.58915500000000000', '24.88190800000000000', '13', '0', '272', '19', '120000', '', '', '', '', '', '362000', '0', null, '1448959326', '0', null);
INSERT INTO `comm_citys` VALUES ('203', '6', '33', '漳州市', 'zhangzhoushi|zzs', 'z', '1', '117.67735500000000000', '24.51811700000000000', '11', '0', '131', '8', null, '', '', '', '', '', '363000', '0', null, '1447127880', '0', null);
INSERT INTO `comm_citys` VALUES ('204', '6', '33', '南平市', 'nanpingshi|nps', 'n', '1', '118.18245800000000000', '26.64414300000000000', '12', '0', '95', '0', null, '', '', '', '', '', '353000', '0', null, '1448959332', '0', null);
INSERT INTO `comm_citys` VALUES ('207', '6', '33', '宁德市', 'ningdeshi|nds', 'n', '1', '119.54236900000000000', '26.65678500000000000', '13', '0', '65', '3', null, '', '', '', '', '', '352100', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('654', null, '33', '龙岩市', 'longyanshi|lys', 'l', '0', null, null, null, '0', '145', '3', null, null, null, null, null, null, '364000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('380', null, '34', '海口市', 'haikoushi|hks', 'h', '0', null, null, null, '0', '206', '3', null, null, null, null, null, null, '570000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('381', null, '34', '三亚市', 'sanyashi|sys', 's', '0', null, null, null, '0', '26', '0', null, null, null, null, null, null, '572000', '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('382', null, '34', '五指山市', 'wuzhishanshi|wzss', 'w', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('383', null, '34', '琼海市', 'qionghaishi|qhs', 'q', '0', null, null, null, '0', '2', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('384', null, '34', '儋州市', 'danzhoushi|dzs', 'd', '0', null, null, null, '0', '6', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('655', null, '34', '文昌市', 'wenchangshi|wcs', 'w', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('656', null, '34', '万宁市', 'wanningshi|wns', 'w', '0', null, null, null, '0', '1', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('657', null, '34', '东方市', 'dongfangshi|dfs', 'd', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('658', null, '34', '定安市', 'dinganshi|das', 'd', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('659', null, '34', '屯昌市', 'tunchangshi|tcs', 't', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('660', null, '34', '澄迈市', 'chengmaishi|cms', 'c', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('661', null, '34', '琼中市', 'qiongzhongshi|qzs', 'q', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('662', null, '34', '西沙市', 'xishashi|xss', 'x', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('663', null, '34', '南沙市', 'nanshashi|nss', 'n', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('664', null, '34', '中沙市', 'zhongshashi|zss', 'z', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('665', null, '34', '临高市', 'lingaoshi|lgs', 'l', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('666', null, '34', '白沙市', 'baishashi|bss', 'b', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('667', null, '34', '乐东市', 'ledongshi|lds', 'l', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('668', null, '34', '陵水市', 'lingshuishi|lss', 'l', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);
INSERT INTO `comm_citys` VALUES ('669', null, '34', '保亭市', 'baotingshi|bts', 'b', '0', null, null, null, '0', '0', '0', null, null, null, null, null, null, null, '0', null, null, '0', null);

-- ----------------------------
-- Table structure for comm_states
-- ----------------------------
DROP TABLE IF EXISTS `comm_states`;
CREATE TABLE `comm_states` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `namepy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `chrkey` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comm_states
-- ----------------------------
INSERT INTO `comm_states` VALUES ('1', '北京市', 'beijingshi|bjs', 'b', '0');
INSERT INTO `comm_states` VALUES ('2', '上海市', 'shanghaishi|shs', 's', '0');
INSERT INTO `comm_states` VALUES ('3', '天津市', 'tianjinshi|tjs', 't', '0');
INSERT INTO `comm_states` VALUES ('4', '重庆市', 'zhongqingshi|zqs', 'z', '0');
INSERT INTO `comm_states` VALUES ('5', '黑龙江省', 'heilongjiangsheng|hljs', 'h', '0');
INSERT INTO `comm_states` VALUES ('7', '吉林省', 'jilinsheng|jls', 'j', '0');
INSERT INTO `comm_states` VALUES ('6', '辽宁省', 'liaoningsheng|lns', 'l', '0');
INSERT INTO `comm_states` VALUES ('9', '内蒙古', 'neimenggu|nmg', 'n', '0');
INSERT INTO `comm_states` VALUES ('14', '新疆省', 'xinjiangsheng|xjs', 'x', '0');
INSERT INTO `comm_states` VALUES ('12', '甘肃省', 'gansusheng|gss', 'g', '0');
INSERT INTO `comm_states` VALUES ('13', '宁夏省', 'ningxiasheng|nxs', 'n', '0');
INSERT INTO `comm_states` VALUES ('11', '山西省', 'shanxisheng|sxs', 's', '0');
INSERT INTO `comm_states` VALUES ('10', '陕西省', 'shanxisheng|sxs', 's', '0');
INSERT INTO `comm_states` VALUES ('22', '河南省', 'henansheng|hns', 'h', '0');
INSERT INTO `comm_states` VALUES ('8', '河北省', 'hebeisheng|hbs', 'h', '0');
INSERT INTO `comm_states` VALUES ('23', '山东省', 'shandongsheng|sds', 's', '0');
INSERT INTO `comm_states` VALUES ('15', '西藏省', 'xicangsheng|xcs', 'x', '0');
INSERT INTO `comm_states` VALUES ('17', '四川省', 'sichuansheng|scs', 's', '0');
INSERT INTO `comm_states` VALUES ('16', '青海省', 'qinghaisheng|qhs', 'q', '0');
INSERT INTO `comm_states` VALUES ('20', '湖南省', 'hunansheng|hns', 'h', '0');
INSERT INTO `comm_states` VALUES ('21', '湖北省', 'hubeisheng|hbs', 'h', '0');
INSERT INTO `comm_states` VALUES ('32', '江西省', 'jiangxisheng|jxs', 'j', '0');
INSERT INTO `comm_states` VALUES ('24', '安徽省', 'anhuisheng|ahs', 'a', '0');
INSERT INTO `comm_states` VALUES ('25', '江苏省', 'jiangsusheng|jss', 'j', '0');
INSERT INTO `comm_states` VALUES ('26', '浙江省', 'zhejiangsheng|zjs', 'z', '0');
INSERT INTO `comm_states` VALUES ('33', '福建省', 'fujiansheng|fjs', 'f', '1');
INSERT INTO `comm_states` VALUES ('18', '云南省', 'yunnansheng|yns', 'y', '0');
INSERT INTO `comm_states` VALUES ('19', '贵州省', 'guizhousheng|gzs', 'g', '0');
INSERT INTO `comm_states` VALUES ('31', '广西省', 'guangxisheng|gxs', 'g', '0');
INSERT INTO `comm_states` VALUES ('30', '广东省', 'guangdongsheng|gds', 'g', '0');
INSERT INTO `comm_states` VALUES ('34', '海南省', 'hainansheng|hns', 'h', '0');

-- ----------------------------
-- Table structure for dd_erp_commontype
-- ----------------------------
DROP TABLE IF EXISTS `dd_erp_commontype`;
CREATE TABLE `dd_erp_commontype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `showtag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dd_erp_commontype
-- ----------------------------
INSERT INTO `dd_erp_commontype` VALUES ('1', '征信查询', '1');
INSERT INTO `dd_erp_commontype` VALUES ('2', '车辆评估', '1');
INSERT INTO `dd_erp_commontype` VALUES ('3', '视频面签', '1');
INSERT INTO `dd_erp_commontype` VALUES ('4', '汽车贷款', '1');
INSERT INTO `dd_erp_commontype` VALUES ('5', '银行贷款申请', '1');
INSERT INTO `dd_erp_commontype` VALUES ('6', '公司归档', '1');
INSERT INTO `dd_erp_commontype` VALUES ('7', '抵押归档', '1');
INSERT INTO `dd_erp_commontype` VALUES ('8', '退单退费', '1');

-- ----------------------------
-- Table structure for dd_erp_commtaskname
-- ----------------------------
DROP TABLE IF EXISTS `dd_erp_commtaskname`;
CREATE TABLE `dd_erp_commtaskname` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `erp_btype_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dd_erp_commtaskname
-- ----------------------------
INSERT INTO `dd_erp_commtaskname` VALUES ('1', '开始', '1', '1');
INSERT INTO `dd_erp_commtaskname` VALUES ('2', '提交查询', '1', '2');
INSERT INTO `dd_erp_commtaskname` VALUES ('3', '查询结果', '1', '3');
INSERT INTO `dd_erp_commtaskname` VALUES ('4', '完成', '1', '4');
INSERT INTO `dd_erp_commtaskname` VALUES ('5', '开始', '2', '5');
INSERT INTO `dd_erp_commtaskname` VALUES ('6', '提交评估', '2', '6');
INSERT INTO `dd_erp_commtaskname` VALUES ('7', '评估价审核', '2', '7');
INSERT INTO `dd_erp_commtaskname` VALUES ('8', '完成', '2', '8');
INSERT INTO `dd_erp_commtaskname` VALUES ('9', '开始', '3', '9');
INSERT INTO `dd_erp_commtaskname` VALUES ('10', '提交申请', '3', '10');
INSERT INTO `dd_erp_commtaskname` VALUES ('11', '结果反馈', '3', '11');
INSERT INTO `dd_erp_commtaskname` VALUES ('12', '完成', '3', '12');
INSERT INTO `dd_erp_commtaskname` VALUES ('13', '开始', '4', '13');
INSERT INTO `dd_erp_commtaskname` VALUES ('14', '提交申请', '4', '14');
INSERT INTO `dd_erp_commtaskname` VALUES ('15', '审核结果', '4', '15');
INSERT INTO `dd_erp_commtaskname` VALUES ('16', '完成', '4', '16');
INSERT INTO `dd_erp_commtaskname` VALUES ('17', '银行贷款申请开始', '5', '17');
INSERT INTO `dd_erp_commtaskname` VALUES ('18', '合作商寄送材料', '5', '18');
INSERT INTO `dd_erp_commtaskname` VALUES ('19', '公司收件确认', '5', '19');
INSERT INTO `dd_erp_commtaskname` VALUES ('20', '银行收件确认', '5', '20');
INSERT INTO `dd_erp_commtaskname` VALUES ('21', '银行审批结果', '5', '21');
INSERT INTO `dd_erp_commtaskname` VALUES ('22', '银行放款结果', '5', '22');
INSERT INTO `dd_erp_commtaskname` VALUES ('23', '收款确认', '5', '23');
INSERT INTO `dd_erp_commtaskname` VALUES ('24', '补充材料确认', '5', '24');
INSERT INTO `dd_erp_commtaskname` VALUES ('25', '补充材料', '5', '25');
INSERT INTO `dd_erp_commtaskname` VALUES ('26', '完成', '5', '26');
INSERT INTO `dd_erp_commtaskname` VALUES ('27', '开始', '6', '27');
INSERT INTO `dd_erp_commtaskname` VALUES ('28', '公司纸质归档', '6', '28');
INSERT INTO `dd_erp_commtaskname` VALUES ('29', '纸质归档', '6', '29');
INSERT INTO `dd_erp_commtaskname` VALUES ('30', '审核员补资料', '6', '30');
INSERT INTO `dd_erp_commtaskname` VALUES ('31', '行政入库', '6', '31');
INSERT INTO `dd_erp_commtaskname` VALUES ('32', '完成', '6', '32');
INSERT INTO `dd_erp_commtaskname` VALUES ('33', '开始', '7', '33');
INSERT INTO `dd_erp_commtaskname` VALUES ('34', '公证记录', '7', '34');
INSERT INTO `dd_erp_commtaskname` VALUES ('35', '抵押材料寄送至合作商', '7', '35');
INSERT INTO `dd_erp_commtaskname` VALUES ('36', '合作商收件确认', '7', '36');
INSERT INTO `dd_erp_commtaskname` VALUES ('37', '抵押情况记录', '7', '37');
INSERT INTO `dd_erp_commtaskname` VALUES ('38', '抵押材料寄回', '7', '38');
INSERT INTO `dd_erp_commtaskname` VALUES ('39', '审核收件确认', '7', '39');
INSERT INTO `dd_erp_commtaskname` VALUES ('40', '抵押材料至银行', '7', '40');
INSERT INTO `dd_erp_commtaskname` VALUES ('41', '银行收件确认', '7', '41');
INSERT INTO `dd_erp_commtaskname` VALUES ('42', '录入银行查验情况', '7', '42');
INSERT INTO `dd_erp_commtaskname` VALUES ('43', '完成', '7', '43');
INSERT INTO `dd_erp_commtaskname` VALUES ('44', '退单退费申请开始', '8', '44');
INSERT INTO `dd_erp_commtaskname` VALUES ('45', '审核员退单审核', '8', '45');
INSERT INTO `dd_erp_commtaskname` VALUES ('46', '退单数据修正', '8', '46');
INSERT INTO `dd_erp_commtaskname` VALUES ('47', '审核经理退单审核', '8', '47');
INSERT INTO `dd_erp_commtaskname` VALUES ('48', '合作商回款缴费', '8', '48');
INSERT INTO `dd_erp_commtaskname` VALUES ('49', '公司确认到账', '8', '49');
INSERT INTO `dd_erp_commtaskname` VALUES ('50', '材料寄回', '8', '50');
INSERT INTO `dd_erp_commtaskname` VALUES ('51', '合作商收件确认', '8', '51');
INSERT INTO `dd_erp_commtaskname` VALUES ('52', '完成', '8', '52');

-- ----------------------------
-- Table structure for dd_fs
-- ----------------------------
DROP TABLE IF EXISTS `dd_fs`;
CREATE TABLE `dd_fs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid_add` int(11) DEFAULT NULL,
  `mid_edit` int(11) DEFAULT NULL,
  `dt_add` datetime DEFAULT NULL,
  `dt_edit` datetime DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司名称',
  `state_id` int(11) DEFAULT NULL COMMENT '所在省id',
  `city_id` int(11) DEFAULT NULL COMMENT '所在市id',
  `zone_id` int(11) DEFAULT NULL COMMENT '所在县id',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详细地址',
  `showtag` tinyint(4) DEFAULT NULL,
  `fs_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司logo',
  `namepy` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称拼音首字母',
  `code_pre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '鉴定编号前缀',
  `deltag` tinyint(4) DEFAULT NULL COMMENT '删除标记 1 删除',
  `name_qy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '签约时完整名称',
  `purview_map` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '前台可以使用模块的权限，用,分开各个权限。如assess_queryby,assess_querybx ',
  `up_id` int(11) DEFAULT NULL COMMENT '代理上级id',
  `rec_id` int(11) DEFAULT '0' COMMENT '推介人id,member',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dd_fs
-- ----------------------------
INSERT INTO `dd_fs` VALUES ('1', '1', '21', '2019-01-25 16:45:08', '2019-02-16 16:34:25', '大地保险', '15', '609', null, '806191630@qq.com', '1', '/upload/2019/01/25/7397bdb084900e46d666186f81974126.jpg', 'ddbx', null, null, '大地保险', null, '33', null);
INSERT INTO `dd_fs` VALUES ('2', '21', '21', '2019-02-16 16:34:57', '2019-02-16 16:34:57', '代理公司', '15', '608', null, 'sssssssssssss', '1', '/upload/2019/02/16/004b24049229f5e889a2a8b187b2f5c2.jpg', 'dlgs', null, null, '1111111111', null, '33', '0');

-- ----------------------------
-- Table structure for dd_gems
-- ----------------------------
DROP TABLE IF EXISTS `dd_gems`;
CREATE TABLE `dd_gems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `fsid` int(11) DEFAULT NULL COMMENT '所属公司id',
  `dt_add` datetime DEFAULT NULL,
  `dt_edit` datetime DEFAULT NULL,
  `mid_add` int(11) DEFAULT NULL,
  `mid_edit` int(11) DEFAULT NULL,
  `showtag` tinyint(4) DEFAULT NULL COMMENT '显示标志  1 显示',
  `deltag` tinyint(4) DEFAULT NULL COMMENT '删除标记 1删除',
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `cp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理等级',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `purview_map` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '权限集合',
  `ssbm` int(11) DEFAULT NULL COMMENT '所属部门',
  `user_type` tinyint(4) DEFAULT NULL COMMENT '用户类型 1APP/2系统后台 ',
  `up_id` int(11) DEFAULT NULL COMMENT '上级账户id',
  `bc_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职称',
  `isadmin` tinyint(4) DEFAULT '0' COMMENT '是否后台管理员,0的时候为小程序端登陆账号，1为后台登陆账号，2，3，4到时扩展',
  `agpid` int(11) DEFAULT '0' COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dd_gems
-- ----------------------------
INSERT INTO `dd_gems` VALUES ('1', 'tutu', '1', '2019-02-16 15:21:48', '2019-01-25 17:36:50', null, '1', '1', '0', '/upload/2019/01/25/10a074b73cb60ce9f10968628e834edb.jpg', null, '1', '111111', 'a4bf3d1b793ee31147ed28cb849683eb', null, '0', null, null, null, '0', '0');
INSERT INTO `dd_gems` VALUES ('2', '图图', '0', '2019-02-16 16:02:37', '2019-02-16 16:02:37', '21', '21', '1', null, '/upload/2019/02/16/27f3ef167b48126e8081dd2e83612cc1.jpg', null, '1', '123', '123', null, '0', null, null, null, '1', '0');

-- ----------------------------
-- Table structure for dd_icbc
-- ----------------------------
DROP TABLE IF EXISTS `dd_icbc`;
CREATE TABLE `dd_icbc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid_add` int(11) DEFAULT NULL COMMENT '添加人id',
  `mid_edit` int(11) DEFAULT NULL COMMENT '编辑人ID',
  `dt_add` datetime DEFAULT NULL COMMENT '添加时间',
  `dt_edit` datetime DEFAULT NULL COMMENT '更新时间',
  `bc_status` int(11) DEFAULT NULL COMMENT '订单状态',
  `gems_id` int(11) DEFAULT NULL COMMENT '人员ID',
  `gems_fs_id` int(11) DEFAULT NULL,
  `order_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单编号',
  `c_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '客户姓名',
  `c_tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '客户手机号',
  `c_cardno` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '客户身份证号',
  `c_sex` tinyint(4) DEFAULT NULL,
  `po_c_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '配偶姓名',
  `po_c_tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '配偶手机号',
  `po_c_cardno` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '配偶身份证号',
  `c_name_gj1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '共借人1姓名',
  `c_tel_gj1` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '共借人1手机号',
  `c_cardno_gj1` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '共借人1身份证号',
  `c_name_gj2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '共借人2姓名',
  `c_tel_gj2` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '共借人2手机号',
  `c_cardno_gj2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '共借人2身份证号',
  `imgstep1_1ss` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '主贷人材料集合',
  `imgstep1_2ss` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '主贷人配偶材料集合',
  `imgstep1_3ss` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '共借人1材料集合',
  `imgstep1_4ss` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '共借人2材料集合',
  `zdr_dsj_result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '主贷人大数据结果返回',
  `zdr_dsj_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '主贷人大数据返回编码',
  `zdr_dsj_query_time` datetime DEFAULT NULL COMMENT '主贷人大数据查询时间',
  `zdr_dsj_result_time` datetime DEFAULT NULL COMMENT '主贷人大数据结果返回时间',
  `zdrpo_dsj_result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '主贷人配偶大数据结果',
  `zdrpo_dsj_query_time` datetime DEFAULT NULL COMMENT '主贷人配偶大数据查询时间',
  `zdrpo_dsj_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '主贷人配偶大数据结果编码',
  `zdrpo_dsj_result_time` datetime DEFAULT NULL COMMENT '主贷人配偶大数据结果返回时间',
  `gjr1_dsj_result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '共借人1大数据结果',
  `gjr1_dsj_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '共借人1大数据结果返回编码',
  `gjr1_dsj_query_time` datetime DEFAULT NULL COMMENT '大数据查询时间',
  `gjr1_dsj_result_time` datetime DEFAULT NULL COMMENT '共借人1大数据结果返回时间',
  `gjr2_dsj_result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '共借人2大数据结果',
  `gjr2_dsj_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '共借人2大数据结果返回编码',
  `gjr2_dsj_query_time` datetime DEFAULT NULL COMMENT '共借人2大数据查询时间',
  `gjr2_dsj_result_time` datetime DEFAULT NULL COMMENT '共借人2大数据结果返回时间',
  `zdr_zx1_result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '主贷人银行征信',
  `zdr_zx1_query_time` datetime DEFAULT NULL COMMENT '银行征信查询时间',
  `zdr_zx1_result_time` datetime DEFAULT NULL COMMENT '主贷人银行征信返回时间',
  `zdrpo_zx1_result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '主贷人配偶银行征信',
  `zdrpo_zx1_query_time` datetime DEFAULT NULL COMMENT '主贷人配偶银行征信查询时间',
  `zdrpo_zx1_result_time` datetime DEFAULT NULL COMMENT '主贷人配偶银行征信返回时间',
  `gjr1_zx1_result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '共借人1银行征信',
  `gjr1_zx1_query_time` datetime DEFAULT NULL COMMENT '共借人1银行征信查询时间',
  `gjr1_zx1_result_time` datetime DEFAULT NULL COMMENT '共借人1银行征信返回时间',
  `gjr2_zx1_result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '共借人2银行征信',
  `gjr2_zx1_query_time` datetime DEFAULT NULL COMMENT '共借人2银行征信查询时间',
  `gjr2_zx1_result_time` datetime DEFAULT NULL COMMENT '共借人2银行征信返回时间',
  `zdr_zx1_tag` tinyint(4) DEFAULT NULL COMMENT '主贷人银行征信状态 1 通过 /2 不通过 ',
  `zdrpo_zx1_tag` tinyint(4) DEFAULT NULL COMMENT '银行征信状态 1 通过 /2 不通过 ',
  `gjr1_zx1_tag` tinyint(4) DEFAULT NULL COMMENT '银行征信状态1 通过 /2 不通过 ',
  `gjr2_zx1_tag` tinyint(4) DEFAULT NULL COMMENT '银行征信状态1 通过 /2 不通过 ',
  `zdr_dsj_tag` tinyint(4) DEFAULT NULL COMMENT '大数据状态1 通过 /2 不通过 ',
  `zdrpo_dsj_tag` tinyint(4) DEFAULT NULL COMMENT '大数据状态1 通过 /2 不通过 ',
  `gjr1_dsj_tag` tinyint(4) DEFAULT NULL COMMENT '大数据状态1 通过 /2 不通过 ',
  `gjr2_dsj_tag` tinyint(4) DEFAULT NULL COMMENT '大数据状态1 通过 /2 不通过 ',
  `zdr_zx2_result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '主贷人央行征信',
  `zdr_zx2_query_time` datetime DEFAULT NULL COMMENT '央行征信查询时间',
  `zdr_zx2_result_time` datetime DEFAULT NULL COMMENT '主贷人央行征信返回时间',
  `zdrpo_zx2_result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '主贷人配偶央行征信',
  `zdrpo_zx2_query_time` datetime DEFAULT NULL COMMENT '主贷人配偶央行征信查询时间',
  `zdrpo_zx2_result_time` datetime DEFAULT NULL COMMENT '主贷人配偶央行征信返回时间',
  `gjr1_zx2_result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '共借人1央行征信',
  `gjr1_zx2_query_time` datetime DEFAULT NULL COMMENT '共借人1央行征信查询时间',
  `gjr1_zx2_result_time` datetime DEFAULT NULL COMMENT '共借人1央行征信返回时间',
  `gjr2_zx2_result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '共借人2央行征信',
  `gjr2_zx2_query_time` datetime DEFAULT NULL COMMENT '共借人2央行征信查询时间',
  `gjr2_zx2_result_time` datetime DEFAULT NULL COMMENT '共借人2央行征信返回时间',
  `zdr_zx2_tag` tinyint(4) DEFAULT NULL COMMENT '主贷人央行征信状态 1 通过 /2 不通过 ',
  `zdrpo_zx2_tag` tinyint(4) DEFAULT NULL COMMENT '央行征信状态 1 通过 /2 不通过 ',
  `gjr1_zx2_tag` tinyint(4) DEFAULT NULL COMMENT '央行征信状态1 通过 /2 不通过 ',
  `gjr2_zx2_tag` tinyint(4) DEFAULT NULL COMMENT '央行征信状态1 通过 /2 不通过 ',
  `dt_fin` datetime DEFAULT NULL COMMENT '订单完成时间',
  `state_id` int(11) DEFAULT NULL COMMENT '所在省ID',
  `city_id` int(11) DEFAULT NULL COMMENT '所在市ID',
  `adminop_tag` tinyint(4) DEFAULT NULL COMMENT '当前操作人ID',
  `bank_id` int(11) DEFAULT NULL COMMENT '按揭银行',
  `loan_tpid` int(11) DEFAULT NULL COMMENT '贷款产品',
  `loan_level` int(11) DEFAULT NULL COMMENT '业务等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dd_icbc
-- ----------------------------
INSERT INTO `dd_icbc` VALUES ('1', null, '21', null, '2019-02-26 11:18:01', null, '21', '33', 'ddbx00000005', '', '', '', '0', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('2', '21', '21', '2019-02-25 15:38:54', '2019-02-26 10:21:30', null, '21', '33', 'ddbx00000003', '正能量', '15544345534', '411403199512108410', '1', '配偶', '15544345534', '411403199512108410', '共借人1', '15544345534', '411403199512108410', '共借人2', '15544345534', '411403199512108410', '/upload/2019/02/25/9e79ca5a58fa67604744e2979f51a28f.jpg,/upload/2019/02/25/d2e5288672e76df624968a6e82e62b9a.jpg,/upload/2019/02/25/81bbfcee14f8269537a19771c7f19a4c.jpg,/upload/2019/02/25/99bdc291c5cadc2419320cc6a73ba310.jpg,', '/upload/2019/02/25/4b30f223f2b70dade50bc5f3f98533bd.jpg,/upload/2019/02/26/27884e289138813277e9544bc75dcd1f.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,/upload/2019/02/26/aca82884db8cb83d51d341c9d107898f.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '12123213123123', null, null, null, null, '31231232131', null, null, '3123123123', null, null, null, '31231231231231', null, null, '符合客户发顺丰拉横幅拉回来我认为群若群无若', null, null, '王企鹅群翁切无群翁群', null, null, '大沙发沙发发发', null, null, '发发发发发发发', null, null, '1', '1', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '23', '233', null, '1', '1', '1');
INSERT INTO `dd_icbc` VALUES ('3', '21', '21', '2019-02-26 10:31:11', '2019-02-26 10:36:22', null, '21', '33', 'ddbx00000005', '一个', '545456454645646', '4564654545645', '1', '打算', '125125125', '412421', '千万人', '1515125', '15125', 'affair', '5151', '15151', '/upload/2019/02/26/df63c4979699581cb1982e44dbbd0532.jpg,/upload/2019/02/26/17667acddefa102bec91427f4646c4a4.jpg,/upload/2019/02/26/4c6d20d648cfeab0921ec18a645e7455.jpg,/upload/2019/02/26/d7a8845af09eee0c105dcce1a33e2315.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '51251251', null, null, null, null, '51512521512', null, null, '512512515', null, null, null, '125151515', null, null, '1251515125', null, null, '5125125', null, null, '5125151', null, null, '15251', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '15', '610', null, '1', '1', '1');
INSERT INTO `dd_icbc` VALUES ('4', '21', '21', '2019-02-26 10:35:55', '2019-02-26 10:35:55', null, '21', '33', 'ddbx00000004', '一个1223', '545456454645646', '4564654545645', '1', '打算', '125125125', '412421', '千万人', '1515125', '15125', 'affair', '5151', '15151', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '51251251', null, null, null, null, '51512521512', null, null, '512512515', null, null, null, '125151515', null, null, '1251515125', null, null, '5125125', null, null, '5125151', null, null, '15251', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '15', null, null, '1', '1', '1');
INSERT INTO `dd_icbc` VALUES ('5', '21', '21', '2019-02-26 11:06:17', '2019-02-26 11:06:17', null, '21', '33', 'ddbx00000005', '测试', '15544345534', '1234567890111111111', '1', '打算', '4124', '41241', '千万人', '12414', '1241241', 'affair', '12414', '21424214', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '15', '432', null, '1', '1', '1');
INSERT INTO `dd_icbc` VALUES ('6', '21', '21', '2019-02-26 11:07:30', '2019-02-26 11:07:30', null, '21', '33', 'ddbx00000006', '测试', '21414214', '24124214124', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('7', '21', '21', '2019-02-26 11:15:28', '2019-02-26 11:15:28', null, '21', '33', 'ddbx00000007', '测试', '21412412412', '3214214124', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('8', '21', '21', '2019-02-26 11:17:36', '2019-02-26 11:17:36', null, '21', '33', 'ddbx00000008', '测试21412', '4124124', '4124124', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('9', '21', '21', '2019-02-26 11:43:42', '2019-02-26 11:43:42', null, '21', '33', 'ddbx00000009', '无懈可击', '21412412412414', '21424124', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('10', '21', '21', '2019-02-26 11:49:48', '2019-02-26 11:49:48', null, '21', '33', 'ddbx00000010', '测试6666', '51251251', '14221412', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('11', '21', '21', '2019-02-26 11:52:46', '2019-02-26 14:57:15', null, '21', '33', 'ddbx00000011', '你好', '2141241241', '42142141', '2', '', '', '', '', '', '', '', '', '', '/upload/2019/02/26/66b3d61e4dbcb619effdad63531e94c4.jpg,images/mgcaraddimg.jpg,/upload/2019/02/26/447dc0b326f1e0c7a92ad96d0e986cb7.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('12', '21', '21', '2019-02-26 11:58:33', '2019-02-26 11:58:33', null, '21', '33', 'ddbx00000012', '无中生有', '2141241241241', '214242141', '2', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('13', '21', '21', '2019-02-26 13:25:25', '2019-02-26 13:25:25', null, '21', '33', 'ddbx00000013', '测试111', '421412414124', '2142141241', '2', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('14', '21', '21', '2019-02-26 13:37:28', '2019-02-26 13:47:33', null, '21', '33', null, '测试77777', '777777777', '777777777', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('15', '21', '21', '2019-02-26 13:37:28', '2019-02-26 13:37:28', null, '21', '33', 'ddbx00000014', '测试77777', '777777777', '777777777', '2', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('16', '21', '21', '2019-02-26 13:40:48', '2019-02-26 13:40:48', null, '21', '33', 'ddbx00000016', '测试188888', '88888888888', '88888888', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('17', '21', '21', '2019-02-26 13:50:50', '2019-02-26 13:50:50', null, '21', '33', 'ddbx00000017', '我是谁', '412414124141241', '134124124', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('18', '21', '21', '2019-02-26 15:30:10', '2019-02-26 15:30:10', '36', '21', '33', 'ddbx00000018', '你好123', '4124412412', '412421412', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('19', '21', '21', '2019-02-28 10:38:49', '2019-02-28 10:39:20', '36', '21', '33', 'ddbx00000019', '新的世界', '15544345534', '1231131231123122', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('20', '21', '21', '2019-02-28 10:51:11', '2019-02-28 10:51:11', '36', '21', '33', 'ddbx00000020', '第一次', '15544345534', '13155645646454', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('21', '21', '21', '2019-02-28 10:57:37', '2019-02-28 10:57:37', '36', '21', '33', 'ddbx00000021', '是是是', '24124124141', '12314124', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('22', '21', '21', '2019-02-28 11:01:20', '2019-02-28 14:43:11', '36', '21', '33', 'ddbx00000022', '啊啊沙发沙发', '4214124141', '21412412', '1', '撒打发', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('23', '21', '21', '2019-02-28 17:12:05', '2019-02-28 18:21:16', '36', '21', '33', 'ddbx00000023', '11111111', '2414124124124', '21424124', '1', '', '', '', '', '', '', '', '', '', '/upload/2019/02/28/d0323c91552f1e22da83af3ac9019532.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', '/upload/2019/02/28/7a76d6ff76331622fc091115a3c21272.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('24', '21', '21', '2019-03-04 09:32:15', '2019-03-04 09:32:15', '36', '21', '33', 'ddbx00000024', '测试时尚', '12312412412', '214124124', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('25', '21', '21', '2019-03-04 11:24:48', '2019-03-04 11:24:48', '36', '21', '33', 'ddbx00000025', '无中生有', '15544345534', '411401122245627897', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('26', '21', '21', '2019-03-04 11:26:47', '2019-03-04 11:26:47', '36', '21', '33', 'ddbx00000026', '五谷丰登', '15544345534', '21414214124124', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('27', '21', '21', '2019-03-04 11:32:57', '2019-03-04 11:32:57', '36', '21', '33', 'ddbx00000027', '一无所有', '1241241', '1214214', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('28', '21', '21', '2019-03-04 11:37:48', '2019-03-04 11:37:48', '36', '21', '33', 'ddbx00000028', '千变万化', '15544345534', '214214124124', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('29', '21', '21', '2019-03-04 11:40:10', '2019-03-04 11:40:10', '36', '21', '33', 'ddbx00000029', '我的世界', '15544345534', '411403199512841541', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('30', '21', '21', '2019-03-04 11:41:41', '2019-03-04 11:41:41', '36', '21', '33', 'ddbx00000030', '七十二变', '15544345534', '3124', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('31', '21', '21', '2019-03-04 11:44:11', '2019-03-04 11:44:11', '36', '21', '33', 'ddbx00000031', '卡卡罗特', '1', '214', '2', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('32', '21', '21', '2019-03-04 11:49:51', '2019-03-04 11:49:51', '36', '21', '33', 'ddbx00000032', '出来吧', '4214124', '21', '1', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('33', '21', '21', '2019-03-04 11:54:40', '2019-03-04 11:54:40', '36', '21', '33', 'ddbx00000033', '11111', '15544345534', '1213', '2', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('34', '21', '21', '2019-03-04 12:00:17', '2019-03-04 12:00:17', '36', '21', '33', 'ddbx00000034', '2222', '2222', '2222', '2', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('35', '21', '21', '2019-03-04 13:52:17', '2019-03-04 13:52:17', '36', '21', '33', 'ddbx00000035', '123123123', '3', '3', '2', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '', null, null, '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');
INSERT INTO `dd_icbc` VALUES ('36', '21', '21', '2019-03-04 13:53:30', '2019-03-04 14:30:29', '36', '21', '33', 'ddbx00000036', '123', '1', '1', '2', '', '', '', '', '', '', '', '', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,', null, '', null, null, null, null, '', null, null, '', null, null, null, '', null, null, '321312', '2019-03-04 14:30:29', '2019-03-04 14:30:29', '', null, null, '', null, null, '', null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', '0', '0');

-- ----------------------------
-- Table structure for dd_icbc_erp
-- ----------------------------
DROP TABLE IF EXISTS `dd_icbc_erp`;
CREATE TABLE `dd_icbc_erp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid_add` int(11) DEFAULT NULL,
  `mid_edit` int(11) DEFAULT NULL,
  `dt_add` datetime DEFAULT NULL,
  `dt_edit` datetime DEFAULT NULL,
  `later_status` int(11) DEFAULT NULL COMMENT '下一任务节点',
  `now_status` int(11) DEFAULT NULL COMMENT '当前任务状态节点',
  `icbc_id` int(11) DEFAULT NULL COMMENT '主订单id',
  `gems_id` int(11) DEFAULT NULL,
  `gems_fs_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT '业务类型id',
  `c_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `c_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `c_cardno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号',
  `c_carvin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车辆VIN',
  `c_carno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `adminop_tag` int(11) DEFAULT NULL COMMENT '当前操作人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dd_icbc_erp
-- ----------------------------
INSERT INTO `dd_icbc_erp` VALUES ('1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('2', '21', '21', '2019-02-26 11:17:36', '2019-02-26 11:17:36', null, null, null, '21', '33', null, '测试21412', '4124124', '4124124', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('3', '21', '21', '2019-02-26 11:43:42', '2019-02-26 11:43:42', null, null, null, '21', '33', null, '无懈可击', '21412412412414', '21424124', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('4', '21', '21', '2019-02-26 11:49:48', '2019-02-26 11:49:48', null, null, null, '21', '33', null, '测试6666', '51251251', '14221412', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('5', '21', '21', '2019-02-26 11:52:46', '2019-02-26 11:52:46', null, null, null, '21', '33', null, '你好', '2141241241', '42142141', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('6', '21', '21', '2019-02-26 11:58:33', '2019-02-26 11:58:33', null, null, null, '21', '33', null, '无中生有', '2141241241241', '214242141', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('7', '21', '21', '2019-02-26 13:25:24', '2019-02-26 13:25:24', null, null, null, '21', '33', null, '测试111', '421412414124', '2142141241', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('8', '21', '21', '2019-02-26 13:37:28', '2019-02-26 13:37:28', '3', '2', '14', '21', '33', '36', '测试77777', '777777777', '777777777', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('9', '21', '21', '2019-02-26 13:40:47', '2019-02-26 13:40:47', '3', '2', '16', '21', '33', '36', '测试188888', '88888888888', '88888888', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('10', '21', '21', '2019-02-26 13:50:50', '2019-02-26 13:50:50', '3', '2', '17', '21', '33', '36', '我是谁', '412414124141241', '134124124', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('11', '21', '21', '2019-02-26 15:30:10', '2019-02-26 15:30:10', '3', '2', '18', '21', '33', '36', '你好123', '4124412412', '412421412', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('12', '21', '21', '2019-02-28 10:38:49', '2019-02-28 10:38:49', '3', '2', null, '21', '33', '0', '新的世界', '15544345534', '1231131231123122', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('13', '21', '21', '2019-02-28 11:01:20', '2019-02-28 14:02:32', '3', '2', '22', '21', '33', '36', '啊啊沙发沙发啊啊沙发沙发', '4214124141', '21412412', null, null, '0');
INSERT INTO `dd_icbc_erp` VALUES ('14', '21', '21', '2019-02-28 17:12:05', '2019-03-01 15:16:19', '3', '2', '23', '21', '33', '36', '1111111111111111', '2414124124124', '21424124', null, null, '0');
INSERT INTO `dd_icbc_erp` VALUES ('15', '21', '21', '2019-03-04 09:32:15', '2019-03-04 09:32:15', '3', '2', '24', '21', '33', '36', '测试时尚', '12312412412', '214124124', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('16', '21', '21', '2019-03-04 09:46:32', '2019-03-04 09:46:32', '7', '6', '24', '21', '33', '2', '测试时尚', '12312412412', '214124124', null, '', '21');
INSERT INTO `dd_icbc_erp` VALUES ('17', '21', '21', '2019-03-04 11:24:48', '2019-03-04 11:24:48', '3', '2', '25', '21', '33', '36', '无中生有', '15544345534', '411401122245627897', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('18', '21', '21', '2019-03-04 11:26:47', '2019-03-04 11:26:47', '3', '2', '26', '21', '33', '36', '五谷丰登', '15544345534', '21414214124124', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('19', '21', '21', '2019-03-04 11:32:57', '2019-03-04 11:32:57', '3', '2', '27', '21', '33', '36', '一无所有', '1241241', '1214214', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('20', '21', '21', '2019-03-04 11:37:48', '2019-03-04 11:37:48', '3', '2', '28', '21', '33', '36', '千变万化', '15544345534', '214214124124', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('21', '21', '21', '2019-03-04 11:40:10', '2019-03-04 11:40:10', '3', '2', '29', '21', '33', '36', '我的世界', '15544345534', '411403199512841541', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('22', '21', '21', '2019-03-04 11:41:41', '2019-03-04 11:41:41', '3', '2', '30', '21', '33', '36', '七十二变', '15544345534', '3124', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('23', '21', '21', '2019-03-04 11:44:11', '2019-03-04 11:44:11', '3', '2', '31', '21', '33', '36', '卡卡罗特', '1', '214', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('24', '21', '21', '2019-03-04 11:49:51', '2019-03-04 11:49:51', '3', '2', '32', '21', '33', '36', '出来吧', '4214124', '21', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('25', '21', '21', '2019-03-04 11:54:40', '2019-03-04 11:54:40', '3', '2', '33', '21', '33', '36', '11111', '15544345534', '1213', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('26', '21', '21', '2019-03-04 12:00:17', '2019-03-04 12:00:17', '3', '2', '34', '21', '33', '36', '2222', '2222', '2222', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('27', '21', '21', '2019-03-04 13:52:17', '2019-03-04 13:52:17', '3', '2', '35', '21', '33', '36', '123123123', '3', '3', null, null, null);
INSERT INTO `dd_icbc_erp` VALUES ('28', '21', '21', '2019-03-04 13:53:30', '2019-03-04 14:30:30', '4', '3', '36', '21', '33', '36', '123', '1', '1', null, null, null);

-- ----------------------------
-- Table structure for dd_icbc_erp_result
-- ----------------------------
DROP TABLE IF EXISTS `dd_icbc_erp_result`;
CREATE TABLE `dd_icbc_erp_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qryid` int(11) DEFAULT NULL COMMENT 'erp全部任务节点查询id',
  `mid_add` int(11) DEFAULT NULL COMMENT '添加人id',
  `mid_edit` int(11) DEFAULT NULL COMMENT '编辑人id',
  `dt_add` datetime DEFAULT NULL COMMENT '添加时间',
  `dt_edit` datetime DEFAULT NULL COMMENT '编辑时间',
  `now_status` int(11) DEFAULT NULL COMMENT '当前节点任务id',
  `later_status` int(11) DEFAULT NULL COMMENT '下一任务节点id',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述,留言',
  `result_code` int(11) DEFAULT NULL COMMENT '节点审核操作',
  `result_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '节点信息描述',
  `result_value` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '节点保存信息json文本',
  `type_id` int(11) DEFAULT NULL COMMENT '业务类型id',
  `icbc_id` int(11) DEFAULT NULL COMMENT '主订单id',
  `gems_id` int(11) DEFAULT NULL,
  `gems_fs_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dd_icbc_erp_result
-- ----------------------------
INSERT INTO `dd_icbc_erp_result` VALUES ('1', null, '21', '21', '2019-02-26 11:15:28', '2019-02-26 11:15:28', null, null, null, null, null, null, null, null, '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('2', null, '21', '21', '2019-02-26 11:17:36', '2019-02-26 11:17:36', null, null, null, null, null, null, null, null, '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('3', null, '21', '21', '2019-02-26 11:43:42', '2019-02-26 11:43:42', null, null, null, null, null, null, null, null, '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('4', null, '21', '21', '2019-02-26 11:58:33', '2019-02-26 11:58:33', null, null, null, null, null, null, null, null, '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('5', null, '21', '21', '2019-02-26 13:25:25', '2019-02-26 13:25:25', null, null, null, null, null, null, null, null, '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('6', null, '21', '21', '2019-02-26 13:25:25', '2019-02-26 13:25:25', null, null, null, null, null, null, null, null, '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('7', '14', '21', '21', '2019-02-26 13:37:28', '2019-02-26 13:37:28', '1', '2', null, null, null, null, '1', '14', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('8', '14', '21', '21', '2019-02-26 13:37:28', '2019-02-26 13:37:28', '1', '2', null, null, null, null, '1', '14', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('9', '9', '21', '21', '2019-02-26 13:40:48', '2019-02-26 13:40:48', '1', '2', null, null, null, null, '1', '16', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('10', null, '21', '21', '2019-02-26 13:40:48', '2019-02-26 13:40:48', '2', '3', null, null, null, null, '1', '16', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('11', '10', '21', '21', '2019-02-26 13:50:50', '2019-02-26 13:50:50', '1', '2', null, null, null, null, '36', '17', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('12', '10', '21', '21', '2019-02-26 13:50:50', '2019-02-26 13:50:50', '2', '3', null, null, null, null, '36', '17', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('13', '11', '21', '21', '2019-02-26 15:30:10', '2019-02-26 15:30:10', '1', '2', null, null, null, null, '36', '18', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('14', '11', '21', '21', '2019-02-26 15:30:10', '2019-02-26 15:30:10', '2', '3', null, null, null, null, '36', '18', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('15', '12', '21', '21', '2019-02-28 10:38:49', '2019-02-28 10:38:49', '1', '2', null, null, null, null, '0', null, '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('16', '12', '21', '21', '2019-02-28 10:38:49', '2019-02-28 10:38:49', '2', '3', null, null, null, null, '0', null, '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('17', '13', '21', '21', '2019-02-28 11:01:20', '2019-02-28 11:01:20', '1', '2', null, null, null, null, '36', '22', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('18', '13', '21', '21', '2019-02-28 11:01:20', '2019-02-28 11:01:20', '2', '3', null, null, null, null, '36', '22', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('19', '14', '21', '21', '2019-02-28 17:12:05', '2019-02-28 17:12:05', '1', '2', null, null, null, null, '36', '23', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('20', '14', '21', '21', '2019-02-28 17:12:05', '2019-02-28 17:12:05', '2', '3', null, null, null, null, '36', '23', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('22', '15', '21', '21', '2019-03-04 09:32:15', '2019-03-04 09:32:15', '1', '2', null, null, null, null, '36', '24', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('23', '15', '21', '21', '2019-03-04 09:32:15', '2019-03-04 09:32:15', '2', '3', null, null, null, null, '36', '24', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('24', '16', '21', '21', '2019-03-04 09:46:32', '2019-03-04 09:46:32', '6', '7', null, null, null, null, '2', null, null, null);
INSERT INTO `dd_icbc_erp_result` VALUES ('25', '15', '21', '21', '2019-03-04 10:12:13', '2019-03-04 10:12:13', '3', '4', '员·\n                        ', '2', '', '{\"zdrpo_zx1_result\":\"\",\"zdr_zx1_result\":\"\",\"gjr2_dsj_code\":\"\",\"gjr1_zx1_result\":\"\",\"type_id\":\"36\",\"remark\":\"员·\n                        \",\"zdr_dsj_code\":\"\",\"icbc_id\":\"24\",\"gjr1_dsj_code\":\"\",\"gjr2_zx1_result\":\"\",\"id\":\"15\",\"state_code\":\"2\",\"zdrpo_dsj_code\":\"\"}', '36', '24', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('26', '17', '21', '21', '2019-03-04 11:24:48', '2019-03-04 11:24:48', '1', '2', null, null, null, null, '36', '25', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('27', '17', '21', '21', '2019-03-04 11:24:48', '2019-03-04 11:24:48', '2', '3', null, null, null, null, '36', '25', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('28', '18', '21', '21', '2019-03-04 11:26:47', '2019-03-04 11:26:47', '1', '2', null, null, null, null, '36', '26', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('29', '18', '21', '21', '2019-03-04 11:26:47', '2019-03-04 11:26:47', '2', '3', null, null, null, null, '36', '26', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('30', '19', '21', '21', '2019-03-04 11:32:57', '2019-03-04 11:32:57', '1', '2', null, null, null, null, '36', '27', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('31', '19', '21', '21', '2019-03-04 11:32:57', '2019-03-04 11:32:57', '2', '3', null, null, null, null, '36', '27', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('32', '20', '21', '21', '2019-03-04 11:37:48', '2019-03-04 11:37:48', '1', '2', null, null, null, null, '36', '28', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('33', '20', '21', '21', '2019-03-04 11:37:48', '2019-03-04 11:37:48', '2', '3', null, null, null, null, '36', '28', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('34', '21', '21', '21', '2019-03-04 11:40:10', '2019-03-04 11:40:10', '1', '2', null, null, null, null, '36', '29', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('35', '21', '21', '21', '2019-03-04 11:40:10', '2019-03-04 11:40:10', '2', '3', null, null, null, null, '36', '29', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('36', '22', '21', '21', '2019-03-04 11:41:41', '2019-03-04 11:41:41', '1', '2', null, null, null, null, '36', '30', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('37', '22', '21', '21', '2019-03-04 11:41:41', '2019-03-04 11:41:41', '2', '3', null, null, null, null, '36', '30', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('38', '23', '21', '21', '2019-03-04 11:44:11', '2019-03-04 11:44:11', '1', '2', null, null, null, null, '36', '31', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('39', '23', '21', '21', '2019-03-04 11:44:11', '2019-03-04 11:44:11', '2', '3', null, null, null, null, '36', '31', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('40', '24', '21', '21', '2019-03-04 11:49:51', '2019-03-04 11:49:51', '1', '2', null, null, null, null, '36', '32', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('41', '24', '21', '21', '2019-03-04 11:49:51', '2019-03-04 11:49:51', '2', '3', null, null, null, null, '36', '32', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('42', '25', '21', '21', '2019-03-04 11:54:40', '2019-03-04 11:54:40', '1', '2', null, null, null, null, '36', '33', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('43', '25', '21', '21', '2019-03-04 11:54:40', '2019-03-04 11:54:40', '2', '3', null, null, null, null, '36', '33', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('44', '26', '21', '21', '2019-03-04 12:00:17', '2019-03-04 12:00:17', '1', '2', null, null, null, null, '36', '34', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('45', '26', '21', '21', '2019-03-04 12:00:17', '2019-03-04 12:00:17', '2', '3', null, null, null, null, '36', '34', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('46', '27', '21', '21', '2019-03-04 13:52:17', '2019-03-04 13:52:17', '1', '2', null, null, null, null, '36', '35', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('47', '27', '21', '21', '2019-03-04 13:52:17', '2019-03-04 13:52:17', '2', '3', null, null, null, null, '36', '35', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('48', '28', '21', '21', '2019-03-04 13:53:30', '2019-03-04 13:53:30', '1', '2', null, null, null, null, '36', '36', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('49', '28', '21', '21', '2019-03-04 13:53:30', '2019-03-04 13:53:30', '2', '3', null, null, null, null, '36', '36', '21', '33');
INSERT INTO `dd_icbc_erp_result` VALUES ('50', '28', '21', '21', '2019-03-04 14:30:30', '2019-03-04 14:30:30', '3', '4', '21312312312\n                        ', '1', '', '{\"zdrpo_zx1_result\":\"\",\"zdr_zx1_result\":\"321312\",\"gjr2_dsj_code\":\"\",\"gjr1_zx1_result\":\"\",\"type_id\":\"36\",\"remark\":\"21312312312\n                        \",\"zdr_dsj_code\":\"31231231\",\"icbc_id\":\"36\",\"gjr1_dsj_code\":\"\",\"gjr2_zx1_result\":\"\",\"id\":\"28\",\"state_code\":\"1\",\"zdrpo_dsj_code\":\"\"}', '36', '36', '21', '33');

-- ----------------------------
-- Table structure for dd_icbc_materials
-- ----------------------------
DROP TABLE IF EXISTS `dd_icbc_materials`;
CREATE TABLE `dd_icbc_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid_add` int(11) DEFAULT NULL,
  `mid_edit` int(11) DEFAULT NULL,
  `dt_add` datetime DEFAULT NULL,
  `dt_edit` datetime DEFAULT NULL,
  `gems_fs_id` int(11) DEFAULT NULL,
  `gems_id` int(11) DEFAULT NULL,
  `order_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icbc_id` int(11) DEFAULT NULL COMMENT '主订单id',
  `imgstep1_1ss` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '贷款材料集合',
  `imgstep1_2ss` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '银行材料集合',
  `imgstep9_1ss` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '汽车贷款_证明材料',
  `imgstep9_2ss` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '汽车贷款_合同材料',
  `imgstep9_3ss` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '汽车贷款_其他材料',
  `imgstep9_4ss` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '汽车贷款_补充材料',
  `cars_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车辆类型',
  `origin_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产地类型',
  `using_nature` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '使用性质',
  `transmission` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '变速箱类型',
  `models` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车型',
  `cars_vehicles` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车辆状况',
  `mileage` double(20,2) DEFAULT NULL COMMENT '行驶里程(公里)',
  `manufacture_date` datetime DEFAULT NULL COMMENT '出厂日期',
  `firstregistration_date` datetime DEFAULT NULL COMMENT '初次登记日期',
  `cars_color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车辆颜色',
  `cars_province` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所在省',
  `cars_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所在市',
  `license_plate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号码',
  `chassis_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车架号',
  `brand_models` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '品牌型号',
  `engine_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发动机号',
  `expected_price` decimal(10,2) DEFAULT NULL COMMENT '预期价格',
  `owner_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原车主姓名',
  `imgstep1_1qp` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '评估材料信息',
  `imgstep1_2qp` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '车辆评估车辆照片',
  `videostep1` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '视频面签材料',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dd_icbc_materials
-- ----------------------------
INSERT INTO `dd_icbc_materials` VALUES ('12', '21', '21', '2019-03-04 09:46:32', '2019-03-04 09:46:32', '33', '21', 'Q000000024', '24', null, null, null, null, null, null, '新车', '国产', '运营', '', '', '', '100000.00', '2019-10-30 00:00:00', '2019-10-30 00:00:00', '黑', '', '', '', '', '', '', '10000.00', '', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg', 'images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg,images/mgcaraddimg.jpg', null);

-- ----------------------------
-- Table structure for dd_icbc_result
-- ----------------------------
DROP TABLE IF EXISTS `dd_icbc_result`;
CREATE TABLE `dd_icbc_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icbc_id` int(11) DEFAULT NULL COMMENT '主订单ID',
  `mid_add` int(11) DEFAULT NULL COMMENT '添加人ID',
  `mid_edit` int(11) DEFAULT NULL COMMENT '编辑人ID',
  `dt_add` datetime DEFAULT NULL COMMENT '添加时间',
  `dt_edit` datetime DEFAULT NULL COMMENT '编辑时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dd_icbc_result
-- ----------------------------

-- ----------------------------
-- Table structure for dd_icbc_status
-- ----------------------------
DROP TABLE IF EXISTS `dd_icbc_status`;
CREATE TABLE `dd_icbc_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid_add` int(11) DEFAULT NULL,
  `mid_edit` int(11) DEFAULT NULL,
  `dt_add` datetime DEFAULT NULL,
  `dt_edit` datetime DEFAULT NULL,
  `icbc_id` int(11) DEFAULT NULL,
  `zx_status` int(11) DEFAULT '0' COMMENT '征信状态',
  `tr_status` int(11) DEFAULT '0' COMMENT '通融状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_icbc_status
-- ----------------------------
INSERT INTO `dd_icbc_status` VALUES ('1', '21', '21', '2019-03-04 11:26:47', '2019-03-04 11:26:47', '26', null, null);
INSERT INTO `dd_icbc_status` VALUES ('2', '21', '21', '2019-03-04 11:32:57', '2019-03-04 11:32:57', '27', null, null);
INSERT INTO `dd_icbc_status` VALUES ('3', '21', '21', '2019-03-04 13:53:30', '2019-03-04 14:30:30', '36', '3', '0');

-- ----------------------------
-- Table structure for fs
-- ----------------------------
DROP TABLE IF EXISTS `fs`;
CREATE TABLE `fs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '店名',
  `state_id` int(11) DEFAULT NULL COMMENT '省',
  `city_id` int(11) DEFAULT NULL COMMENT '市',
  `zone_id` int(11) DEFAULT NULL COMMENT '县区',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '具体地址',
  `showtag` tinyint(4) DEFAULT '1' COMMENT '显示标志',
  `code_pre` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '鉴定编号前缀',
  `oemimgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `rec_id` int(11) DEFAULT '0' COMMENT '推介人id,member',
  `namepy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '拼音',
  `purview_map` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `dt_edit` datetime DEFAULT NULL,
  `dt_add` datetime DEFAULT NULL,
  `mid_add` int(11) DEFAULT NULL,
  `mid_edit` int(11) DEFAULT NULL,
  `up_id` int(11) DEFAULT NULL COMMENT '代理上级id',
  `name_qy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '签约时完整名称',
  `fs_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司logo',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `state_id` (`state_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `zone_id` (`zone_id`) USING BTREE,
  KEY `showtag` (`showtag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='公司资料表';

-- ----------------------------
-- Records of fs
-- ----------------------------
INSERT INTO `fs` VALUES ('33', '擎天柱公司', '33', '198', '23', '擎天柱路', '1', 'QTZ', '', '0', '', '5,14,17,20,16,21,10,27,22,28,26,29,11,24,12,9,8,7,15,4,13,3,2,1,18,23,25,6,19,30,', '2019-02-18 11:05:44', '2019-01-24 07:29:44', '21', '21', '33', '1111111111', '/upload/2019/02/16/004b24049229f5e889a2a8b187b2f5c2.jpg');
INSERT INTO `fs` VALUES ('34', '测试', '11', '34', null, 'sssssssssssss', '1', 'cs', null, '0', null, '5,14,17,20,16,21,10,27,22,28,26,29,11,24,12,9,8,7,15,4,13,3,2,1,18,23,25,6,19,30,', '2019-02-16 17:31:52', '2019-02-16 17:19:52', '21', '21', '33', '测试测试测试', '/upload/2019/02/16/19ecb55e54ed7c8f14f5bf5b27d0f5ea.jpg');

-- ----------------------------
-- Table structure for gems
-- ----------------------------
DROP TABLE IF EXISTS `gems`;
CREATE TABLE `gems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '鉴定师名',
  `fsid` int(11) NOT NULL COMMENT '所属店id',
  `showtag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '显示标志',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `cp` tinyint(4) DEFAULT '3' COMMENT '权限级别，1为1级，2为2级，3为3级，0为无权限，游客，数字越低权限越高,目前1代表公司管理员',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名,保留',
  `purview_map` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '前台可以使用模块的权限，用,分开各个权限。如assess_queryby,assess_querybx',
  `dt_add` datetime DEFAULT NULL,
  `dt_edit` datetime DEFAULT NULL,
  `idcard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号码',
  `deltag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标志，1为已经删除',
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fsid` (`fsid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='员工资料表';

-- ----------------------------
-- Records of gems
-- ----------------------------
INSERT INTO `gems` VALUES ('46', '飞机啊飞机', '33', '1', '18950388428', '1', null, null, '2018-04-24 19:25:52', '2018-07-07 11:12:17', '', '0', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_add` datetime DEFAULT NULL COMMENT '添加时间',
  `dt_edit` datetime DEFAULT NULL COMMENT '修改时间',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '板块名称',
  `up_id` int(11) DEFAULT NULL COMMENT '所属板块id',
  `mid_add` int(11) DEFAULT NULL COMMENT '添加人id',
  `mid_edit` int(11) DEFAULT NULL COMMENT '编辑人id',
  `showtag` int(11) DEFAULT NULL COMMENT '1 显示 /2 隐藏',
  `number` int(11) DEFAULT NULL COMMENT '业务展示顺序  1-2-3-4-5',
  `pagehtml` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '页面html',
  `urlotherstr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'url里传入的其他参数',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sdo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '2019-02-21 15:58:37', '2019-02-21 16:32:53', '开卡', null, null, '21', '1', '2', '\n				', '', 'kk', '', 'list');
INSERT INTO `sys_config` VALUES ('2', '2019-02-21 15:58:41', '2019-02-21 16:24:03', '征信', null, null, '21', '1', '1', '\n				', '', 'zx', 'zx', 'list');

-- ----------------------------
-- Table structure for sys_config_son
-- ----------------------------
DROP TABLE IF EXISTS `sys_config_son`;
CREATE TABLE `sys_config_son` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_add` datetime DEFAULT NULL,
  `dt_edit` datetime DEFAULT NULL,
  `mid_add` int(11) DEFAULT NULL,
  `mid_edit` int(11) DEFAULT NULL,
  `pagehtml` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '子版块名称',
  `c_id` int(11) DEFAULT NULL COMMENT '关联上级板块id',
  `number` int(11) DEFAULT NULL COMMENT '展示序号',
  `showtag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '1展示/2隐藏',
  `urlotherstr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'url里传入的其他参数',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sdo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_config_son
-- ----------------------------
INSERT INTO `sys_config_son` VALUES ('1', null, '2019-02-22 10:36:38', null, '21', '6K6i5Y2V5byA5aeLCgkJCQk=', '开始', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_config_son` VALUES ('2', '2019-02-22 10:31:55', '2019-02-22 11:17:43', '21', '21', '5o+Q5Lqk55Sz6K+3CgkJCQk=', '提交申请', '2', '2', '1', '', '', '', '');

-- ----------------------------
-- Table structure for sys_dic_tag
-- ----------------------------
DROP TABLE IF EXISTS `sys_dic_tag`;
CREATE TABLE `sys_dic_tag` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '显示/隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='显示/隐藏，是/否';

-- ----------------------------
-- Records of sys_dic_tag
-- ----------------------------
INSERT INTO `sys_dic_tag` VALUES ('0', '否');
INSERT INTO `sys_dic_tag` VALUES ('1', '是');

-- ----------------------------
-- Table structure for sys_error
-- ----------------------------
DROP TABLE IF EXISTS `sys_error`;
CREATE TABLE `sys_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errormsg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `dt_add` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=719 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统错误日志，异常表';

-- ----------------------------
-- Records of sys_error
-- ----------------------------
INSERT INTO `sys_error` VALUES ('1', 'File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.form.jsp] not found', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('2', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('3', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('4', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('5', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('6', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('7', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('8', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('9', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('10', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('11', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('12', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('13', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('14', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('15', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('16', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('17', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('18', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('19', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('20', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('21', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('22', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('23', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('24', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('25', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('26', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('27', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('28', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('29', 'Cannot forward after response has been committed', '2019-02-01 11:35:48');
INSERT INTO `sys_error` VALUES ('30', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('31', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('32', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('33', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('34', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('35', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('36', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('37', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('38', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('39', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('40', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('41', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('42', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('43', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('44', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('45', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('46', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('47', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('48', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('49', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('50', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('51', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('52', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('53', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('54', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('55', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('56', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('57', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('58', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('59', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('60', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('61', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('62', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('63', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('64', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('65', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('66', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('67', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('68', 'Cannot forward after response has been committed', '2019-02-01 11:35:49');
INSERT INTO `sys_error` VALUES ('69', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('70', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('71', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('72', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('73', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('74', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('75', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('76', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('77', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('78', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('79', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('80', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('81', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('82', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('83', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('84', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('85', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('86', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('87', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('88', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('89', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('90', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('91', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('92', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('93', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('94', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('95', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('96', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('97', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('98', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('99', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('100', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('101', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('102', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('103', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('104', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('105', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('106', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('107', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('108', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('109', 'Cannot forward after response has been committed', '2019-02-01 11:35:50');
INSERT INTO `sys_error` VALUES ('110', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('111', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('112', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('113', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('114', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('115', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('116', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('117', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('118', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('119', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('120', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('121', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('122', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('123', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('124', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('125', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('126', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('127', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('128', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('129', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('130', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('131', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('132', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('133', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('134', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('135', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('136', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('137', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('138', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('139', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('140', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('141', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('142', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('143', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('144', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('145', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('146', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('147', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('148', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('149', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('150', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('151', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('152', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('153', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('154', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('155', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('156', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('157', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('158', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('159', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('160', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('161', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('162', 'Cannot forward after response has been committed', '2019-02-01 11:35:51');
INSERT INTO `sys_error` VALUES ('163', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('164', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('165', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('166', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('167', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('168', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('169', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('170', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('171', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('172', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('173', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('174', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('175', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('176', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('177', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('178', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('179', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('180', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('181', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('182', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('183', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('184', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('185', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('186', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('187', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('188', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('189', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('190', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('191', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('192', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('193', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('194', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('195', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('196', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('197', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('198', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('199', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('200', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('201', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('202', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('203', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('204', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('205', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('206', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('207', 'Cannot forward after response has been committed', '2019-02-01 11:35:52');
INSERT INTO `sys_error` VALUES ('208', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('209', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('210', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('211', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('212', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('213', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('214', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('215', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('216', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('217', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('218', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('219', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('220', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('221', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('222', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('223', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('224', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('225', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('226', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('227', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('228', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('229', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('230', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('231', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('232', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('233', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('234', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('235', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('236', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('237', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('238', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('239', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('240', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('241', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('242', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('243', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('244', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('245', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('246', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('247', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('248', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('249', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('250', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('251', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('252', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('253', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('254', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('255', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('256', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('257', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('258', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('259', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('260', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('261', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('262', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('263', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('264', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('265', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('266', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('267', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('268', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('269', 'Cannot forward after response has been committed', '2019-02-01 11:35:53');
INSERT INTO `sys_error` VALUES ('270', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('271', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('272', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('273', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('274', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('275', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('276', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('277', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('278', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('279', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('280', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('281', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('282', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('283', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('284', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('285', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('286', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('287', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('288', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('289', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('290', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('291', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('292', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('293', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('294', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('295', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('296', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('297', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('298', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('299', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('300', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('301', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('302', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('303', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('304', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('305', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('306', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('307', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('308', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('309', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('310', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('311', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('312', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('313', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('314', 'Cannot forward after response has been committed', '2019-02-01 11:35:54');
INSERT INTO `sys_error` VALUES ('315', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('316', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('317', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('318', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('319', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('320', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('321', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('322', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('323', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('324', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('325', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('326', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('327', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('328', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('329', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('330', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('331', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('332', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('333', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('334', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('335', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('336', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('337', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('338', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('339', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('340', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('341', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('342', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('343', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('344', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('345', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('346', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('347', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('348', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('349', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('350', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('351', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('352', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('353', 'Cannot forward after response has been committed', '2019-02-01 11:35:55');
INSERT INTO `sys_error` VALUES ('354', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('355', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('356', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('357', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('358', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('359', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('360', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('361', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('362', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('363', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('364', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('365', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('366', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('367', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('368', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('369', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('370', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('371', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('372', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('373', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('374', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('375', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('376', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('377', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('378', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('379', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('380', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('381', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('382', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('383', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('384', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('385', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('386', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('387', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('388', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('389', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('390', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('391', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('392', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('393', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('394', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('395', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('396', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('397', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('398', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('399', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('400', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('401', 'Cannot forward after response has been committed', '2019-02-01 11:35:56');
INSERT INTO `sys_error` VALUES ('402', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('403', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('404', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('405', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('406', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('407', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('408', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('409', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('410', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('411', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('412', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('413', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('414', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('415', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('416', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('417', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('418', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('419', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('420', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('421', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('422', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('423', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('424', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('425', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('426', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('427', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('428', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('429', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('430', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('431', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('432', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('433', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('434', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('435', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('436', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('437', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('438', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('439', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('440', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('441', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('442', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('443', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('444', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('445', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('446', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('447', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('448', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('449', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('450', 'Cannot forward after response has been committed', '2019-02-01 11:35:57');
INSERT INTO `sys_error` VALUES ('451', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('452', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('453', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('454', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('455', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('456', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('457', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('458', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('459', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('460', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('461', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('462', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('463', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('464', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('465', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('466', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('467', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('468', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('469', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('470', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('471', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('472', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('473', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('474', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('475', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('476', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('477', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('478', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('479', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('480', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('481', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('482', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('483', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('484', 'Cannot forward after response has been committed', '2019-02-01 11:35:58');
INSERT INTO `sys_error` VALUES ('485', 'File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.form.jsp] not found', '2019-02-01 11:40:40');
INSERT INTO `sys_error` VALUES ('486', 'File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.form.jsp] not found', '2019-02-01 12:31:18');
INSERT INTO `sys_error` VALUES ('487', 'File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.form.jsp] not found', '2019-02-01 12:32:23');
INSERT INTO `sys_error` VALUES ('488', 'File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sysss&#47;sys_error.list.jsp] not found', '2019-02-01 12:54:58');
INSERT INTO `sys_error` VALUES ('489', 'For input string: \"633s3\"', '2019-02-01 12:55:35');
INSERT INTO `sys_error` VALUES ('490', 'File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 13:03:54');
INSERT INTO `sys_error` VALUES ('491', 'File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 13:04:02');
INSERT INTO `sys_error` VALUES ('492', 'File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 13:12:47');
INSERT INTO `sys_error` VALUES ('493', '/WEB-INF/jsp/manager/index_b.jsp:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 13:18:21');
INSERT INTO `sys_error` VALUES ('494', '/WEB-INF/jsp/manager/index_b.jsp:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 13:19:25');
INSERT INTO `sys_error` VALUES ('495', '/WEB-INF/jsp/manager/index_b.jsp:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.form.jsp] not found', '2019-02-01 13:19:48');
INSERT INTO `sys_error` VALUES ('496', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 13:34:17');
INSERT INTO `sys_error` VALUES ('497', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp/WEB-INF/jsp/manager/index_b.jspcn=sys_error&type=sys&sdo=form:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 13:37:29');
INSERT INTO `sys_error` VALUES ('498', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jspcn=sys_error&type=sys&sdo=form:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 13:38:20');
INSERT INTO `sys_error` VALUES ('499', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jspcn=sys_error&type=sys&sdo=form:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 13:40:20');
INSERT INTO `sys_error` VALUES ('500', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp\r\n/WEB-INF/jsp/manager/index_b.jsp\r\ncn=sys_error&type=sys&sdo=form\r\n:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 13:46:03');
INSERT INTO `sys_error` VALUES ('501', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&type=sys&sdo=form<br>:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 13:47:43');
INSERT INTO `sys_error` VALUES ('502', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&type=sys&sdo=form<br>:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 15:29:46');
INSERT INTO `sys_error` VALUES ('503', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&type=sys&sdo=form<br>:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 16:02:24');
INSERT INTO `sys_error` VALUES ('504', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&type=sys&sdo=form<br>:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 16:17:44');
INSERT INTO `sys_error` VALUES ('505', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&type=sys&sdo=form<br>:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 16:17:57');
INSERT INTO `sys_error` VALUES ('506', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&type=sys&sdo=form<br>:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 16:18:33');
INSERT INTO `sys_error` VALUES ('507', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&type=sys&sdo=form<br>:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 16:19:17');
INSERT INTO `sys_error` VALUES ('508', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&type=sys&sdo=form<br>:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 16:19:54');
INSERT INTO `sys_error` VALUES ('509', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&type=sys&sdo=form<br>:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 16:21:46');
INSERT INTO `sys_error` VALUES ('510', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&type=sys&sdo=form<br>:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 16:28:03');
INSERT INTO `sys_error` VALUES ('511', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&type=sys&sdo=form<br>:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 16:28:45');
INSERT INTO `sys_error` VALUES ('512', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&type=sys&sdo=form<br>:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 16:38:28');
INSERT INTO `sys_error` VALUES ('513', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&sdo=list&type=sys<br>:Unable to compile class for JSP: \n\nAn error occurred at line: [8] in the jsp file: [/WEB-INF/jsp/manager/sys/sys_error.btn.jsp]\nConfig.FILEUP_URLPRE cannot be resolved to a type\n5: <%@ taglib prefix=\"fmt\" uri=\"http://java.sun.com/jsp/jstl/fmt\"%>\n6: <%@ taglib uri=\"http://java.sun.com/jsp/jstl/functions\" prefix=\"fn\"%>\n7: <%@ taglib prefix=\"Tools\" uri=\"/tld/manager\" %>\n8: <a href=\"<%=Config.FILEUP_URLPRE%>log/tt_debug.log\" class=\"btn btn-default\"><i class=\"fa fa-arrow-circle-o-down\"></i>下载Debug日志</a>\n9: <a href=\"<%=Config.FILEUP_URLPRE%>log/tt_error.log\" class=\"btn btn-default\"><i class=\"fa fa-arrow-circle-o-down\"></i>下载Error日志</a>\n\n\nAn error occurred at line: [9] in the jsp file: [/WEB-INF/jsp/manager/sys/sys_error.btn.jsp]\nConfig.FILEUP_URLPRE cannot be resolved to a type\n6: <%@ taglib uri=\"http://java.sun.com/jsp/jstl/functions\" prefix=\"fn\"%>\n7: <%@ taglib prefix=\"Tools\" uri=\"/tld/manager\" %>\n8: <a href=\"<%=Config.FILEUP_URLPRE%>log/tt_debug.log\" class=\"btn btn-default\"><i class=\"fa fa-arrow-circle-o-down\"></i>下载Debug日志</a>\n9: <a href=\"<%=Config.FILEUP_URLPRE%>log/tt_error.log\" class=\"btn btn-default\"><i class=\"fa fa-arrow-circle-o-down\"></i>下载Error日志</a>\n\n\nStacktrace:', '2019-02-01 16:38:30');
INSERT INTO `sys_error` VALUES ('514', 'http://127.0.0.1:8092/WEB-INF/jsp/manager/index_b.jsp<br>/WEB-INF/jsp/manager/index_b.jsp<br>cn=sys_error&type=sys&sdo=list<br>:Unable to compile class for JSP: \n\nAn error occurred at line: [9] in the jsp file: [/WEB-INF/jsp/manager/sys/sys_error.btn.jsp]\nConfig.FILEUP_URLPRE cannot be resolved to a type\n6: <%@ taglib uri=\"http://java.sun.com/jsp/jstl/functions\" prefix=\"fn\"%>\n7: <%@ taglib prefix=\"Tools\" uri=\"/tld/manager\" %>\n8: <%\n9:   String urlPre = Config.FILEUP_URLPRE;\n10: %>\n11: <a href=\"<%=urlPre%>log/tt_debug.log\" class=\"btn btn-default\"><i class=\"fa fa-arrow-circle-o-down\"></i>下载Debug日志</a>\n12: <a href=\"<%=urlPre%>log/tt_error.log\" class=\"btn btn-default\"><i class=\"fa fa-arrow-circle-o-down\"></i>下载Error日志</a>\n\n\nStacktrace:', '2019-02-01 16:39:31');
INSERT INTO `sys_error` VALUES ('515', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%3Cbr%3E%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%3Cbr%3Ecn%3Dsys_error%26type%3Dsys%26sdo%3Dform%3Cbr%3E:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_error.form.jsp] not found', '2019-02-01 16:50:11');
INSERT INTO `sys_error` VALUES ('516', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dcomm_citys%26type%3Ddemo%26sdo%3Dfloat:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.form.jsp] not found', '2019-02-08 08:18:46');
INSERT INTO `sys_error` VALUES ('517', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26type%3Ddemo%26sdo%3Dform:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.form.jsp] not found', '2019-02-08 08:18:50');
INSERT INTO `sys_error` VALUES ('518', 'null', '2019-02-11 16:33:01');
INSERT INTO `sys_error` VALUES ('519', 'null', '2019-02-11 16:33:02');
INSERT INTO `sys_error` VALUES ('520', 'null', '2019-02-11 16:33:02');
INSERT INTO `sys_error` VALUES ('521', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dadmin_agp%26type%3Dsys%26sdo%3Dlist:Unable to compile class for JSP: \n\nAn error occurred at line: [34] in the jsp file: [/WEB-INF/jsp/manager/sys/admin_agp.list.jsp]\nThe method isSuperAdmin(TtMap) in the type Tools is not applicable for the arguments (Map<String,String>)\n31: 								</th>\n32: 								<th class=\"hidden-xs text-center\">\n33: 									成员列表\n34: 								</th><%if (Tools.isSuperAdmin(minfo)){%>\n35: 								<th class=\"hidden-xs text-center\">\n36: 									所属公司\n37: 								</th>\n\n\nAn error occurred at line: [55] in the jsp file: [/WEB-INF/jsp/manager/sys/admin_agp.list.jsp]\nThe method isSuperAdmin(TtMap) in the type Tools is not applicable for the arguments (Map<String,String>)\n52: 									</td>\n53: 									<td class=\"hidden-xs text-center\">\n54: 										${u.mans}\n55: 									</td><%if (Tools.isSuperAdmin(minfo)){%>\n56: 									<td class=\"hidden-xs text-center\">\n57: 									${u.fsname}\n58: 									</td>									\n\n\nStacktrace:', '2019-02-11 16:50:50');
INSERT INTO `sys_error` VALUES ('522', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dadmin_agp%26sdo%3Dlist%26type%3Dsys%26systag%3D1:Unable to compile class for JSP: \n\nAn error occurred at line: [34] in the jsp file: [/WEB-INF/jsp/manager/sys/admin_agp.list.jsp]\nThe method isSuperAdmin(TtMap) in the type Tools is not applicable for the arguments (Map<String,String>)\n31: 								</th>\n32: 								<th class=\"hidden-xs text-center\">\n33: 									成员列表\n34: 								</th><%if (Tools.isSuperAdmin(minfo)){%>\n35: 								<th class=\"hidden-xs text-center\">\n36: 									所属公司\n37: 								</th>\n\n\nAn error occurred at line: [55] in the jsp file: [/WEB-INF/jsp/manager/sys/admin_agp.list.jsp]\nThe method isSuperAdmin(TtMap) in the type Tools is not applicable for the arguments (Map<String,String>)\n52: 									</td>\n53: 									<td class=\"hidden-xs text-center\">\n54: 										${u.mans}\n55: 									</td><%if (Tools.isSuperAdmin(minfo)){%>\n56: 									<td class=\"hidden-xs text-center\">\n57: 									${u.fsname}\n58: 									</td>									\n\n\nStacktrace:', '2019-02-11 16:50:59');
INSERT INTO `sys_error` VALUES ('523', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dadmin_agp%26sdo%3Dlist%26type%3Dsys%26systag%3D1:Unable to compile class for JSP: \n\nAn error occurred at line: [34] in the jsp file: [/WEB-INF/jsp/manager/sys/admin_agp.list.jsp]\nThe method isSuperAdmin(TtMap) in the type Tools is not applicable for the arguments (Map<String,String>)\n31: 								</th>\n32: 								<th class=\"hidden-xs text-center\">\n33: 									成员列表\n34: 								</th><%if (Tools.isSuperAdmin(minfo)){%>\n35: 								<th class=\"hidden-xs text-center\">\n36: 									所属公司\n37: 								</th>\n\n\nAn error occurred at line: [55] in the jsp file: [/WEB-INF/jsp/manager/sys/admin_agp.list.jsp]\nThe method isSuperAdmin(TtMap) in the type Tools is not applicable for the arguments (Map<String,String>)\n52: 									</td>\n53: 									<td class=\"hidden-xs text-center\">\n54: 										${u.mans}\n55: 									</td><%if (Tools.isSuperAdmin(minfo)){%>\n56: 									<td class=\"hidden-xs text-center\">\n57: 									${u.fsname}\n58: 									</td>									\n\n\nStacktrace:', '2019-02-11 16:51:03');
INSERT INTO `sys_error` VALUES ('524', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dadmin_agp%26sdo%3Dlist%26type%3Dsys%26systag%3D1:Unable to compile class for JSP: \n\nAn error occurred at line: [34] in the jsp file: [/WEB-INF/jsp/manager/sys/admin_agp.list.jsp]\nThe method isSuperAdmin(TtMap) in the type Tools is not applicable for the arguments (Map<String,String>)\n31: 								</th>\n32: 								<th class=\"hidden-xs text-center\">\n33: 									成员列表\n34: 								</th><%if (Tools.isSuperAdmin(minfo)){%>\n35: 								<th class=\"hidden-xs text-center\">\n36: 									所属公司\n37: 								</th>\n\n\nAn error occurred at line: [55] in the jsp file: [/WEB-INF/jsp/manager/sys/admin_agp.list.jsp]\nThe method isSuperAdmin(TtMap) in the type Tools is not applicable for the arguments (Map<String,String>)\n52: 									</td>\n53: 									<td class=\"hidden-xs text-center\">\n54: 										${u.mans}\n55: 									</td><%if (Tools.isSuperAdmin(minfo)){%>\n56: 									<td class=\"hidden-xs text-center\">\n57: 									${u.fsname}\n58: 									</td>									\n\n\nStacktrace:', '2019-02-11 16:51:36');
INSERT INTO `sys_error` VALUES ('525', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Csystag%3D1%26cn%3Dadmin_agp%26type%3Dsys%26sdo%3Dform:Unable to compile class for JSP: \n\nAn error occurred at line: [16] in the jsp file: [/WEB-INF/jsp/manager/sys/admin_agp.form.jsp]\nThe method isSuperAdmin(TtMap) in the type Tools is not applicable for the arguments (Map<String,String>)\n13: 			id_uplevel = Long.parseLong(infodb.get(\"id_uplevel\"));\n14: 		}\n15:     int sysTag = 0 ;\n16:     if (!Tools.myisnull(strSysTag) && Tools.isSuperAdmin(minfo) && strSysTag.equals(\"1\")){\n17:       sysTag = 1;\n18:     }\n19: %>\n\n\nStacktrace:', '2019-02-11 17:00:59');
INSERT INTO `sys_error` VALUES ('526', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemoss:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demoss&#47;comm_citys.list.jsp] not found', '2019-02-11 17:44:12');
INSERT INTO `sys_error` VALUES ('527', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26type%3Ddemoss%26sdo%3Dform:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demoss&#47;comm_citys.form.jsp] not found', '2019-02-11 17:44:20');
INSERT INTO `sys_error` VALUES ('528', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dsys_error%26type%3Dsys%26sdo%3Dlist:javax.el.ELException: java.lang.IllegalArgumentException: URLDecoder: Illegal hex characters in escape (%) pattern - For input string: \">\n\"', '2019-02-11 17:45:43');
INSERT INTO `sys_error` VALUES ('529', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dsys_error%26type%3Dsys%26sdo%3Dlist:javax.el.ELException: java.lang.IllegalArgumentException: URLDecoder: Illegal hex characters in escape (%) pattern - For input string: \") \"', '2019-02-11 17:46:23');
INSERT INTO `sys_error` VALUES ('530', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dsys_error%26type%3Dsys%26sdo%3Dlist:javax.el.ELException: java.lang.IllegalArgumentException: URLDecoder: Illegal hex characters in escape (%) pattern - For input string: \") \"', '2019-02-11 17:46:32');
INSERT INTO `sys_error` VALUES ('531', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dsys_error%26type%3Dsys%26sdo%3Dlist:javax.el.ELException: java.lang.IllegalArgumentException: URLDecoder: Illegal hex characters in escape (%) pattern - For input string: \") \"', '2019-02-11 17:55:51');
INSERT INTO `sys_error` VALUES ('532', 'java.util.HashMap cannot be cast to com.tt.data.TtMap', '2019-02-12 11:40:08');
INSERT INTO `sys_error` VALUES ('533', 'java.util.HashMap cannot be cast to com.tt.data.TtMap', '2019-02-12 11:40:14');
INSERT INTO `sys_error` VALUES ('534', 'java.util.HashMap cannot be cast to com.tt.data.TtMap', '2019-02-12 11:40:24');
INSERT INTO `sys_error` VALUES ('535', 'java.util.HashMap cannot be cast to com.tt.data.TtMap', '2019-02-12 11:40:27');
INSERT INTO `sys_error` VALUES ('536', 'null', '2019-02-12 11:44:17');
INSERT INTO `sys_error` VALUES ('537', 'http%3A%2F%2F127.0.0.1%3A8092%2Fmanager%2Findex%7C%2Fmanager%2Findex%7Ccn%3Dcomm_citys%26type%3Ddemo%26sdo%3Dlist%26p%3D4:java.lang.NullPointerException', '2019-02-12 11:44:17');
INSERT INTO `sys_error` VALUES ('538', 'null', '2019-02-12 11:44:21');
INSERT INTO `sys_error` VALUES ('539', 'http%3A%2F%2F127.0.0.1%3A8092%2Fmanager%2Findex%7C%2Fmanager%2Findex%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:java.lang.NullPointerException', '2019-02-12 11:44:21');
INSERT INTO `sys_error` VALUES ('540', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dcomm_citys%26type%3Ddemo%26sdo%3Dfloat:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.form.jsp] not found', '2019-02-13 14:12:17');
INSERT INTO `sys_error` VALUES ('541', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dadmin%26type%3Ddemo%26sdo%3Dlist:Unable to compile class for JSP: \n\nAn error occurred at line: [42] in the jsp file: [/WEB-INF/jsp/manager/list.jsp]\nCannot cast from String to TtMap\n39: 	if (havebtnfile){\n40: 		is.close();\n41: 	}\n42: 	TtMap minfo =(TtMap) request.getParameter(\"minfo\");\n43: %>\n44: <!-- Content Wrapper. Contains page content -->\n45: <div class=\"content-wrapper\">\n\n\nStacktrace:', '2019-02-13 14:56:01');
INSERT INTO `sys_error` VALUES ('542', 'null', '2019-02-13 16:20:30');
INSERT INTO `sys_error` VALUES ('543', 'null', '2019-02-13 16:20:52');
INSERT INTO `sys_error` VALUES ('544', 'null', '2019-02-13 16:22:12');
INSERT INTO `sys_error` VALUES ('545', 'null', '2019-02-13 16:23:37');
INSERT INTO `sys_error` VALUES ('546', 'null', '2019-02-13 16:24:03');
INSERT INTO `sys_error` VALUES ('547', 'null', '2019-02-13 16:25:44');
INSERT INTO `sys_error` VALUES ('548', 'null', '2019-02-13 16:25:58');
INSERT INTO `sys_error` VALUES ('549', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Ddemo_upfile%26sdo%3Dlist%26type%3Ddemo:File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;demo_upfile.list.jsp] not found', '2019-02-13 17:12:46');
INSERT INTO `sys_error` VALUES ('550', 'http%3A%2F%2F127.0.0.1%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Ddemo_upfile%26type%3Ddemo%26sdo%3Dform:Unable to compile class for JSP: \n\nAn error occurred at line: [51] in the jsp file: [/WEB-INF/jsp/manager/form.jsp]\nThe method myisnull(String) is undefined for the type Tools\n48: 	});\n49: }\n50: </script>\n51: <%if (!Tools.myisnull(info)){%>\n52: <script>\n53: editFun(${info});\n54: </script>\n\n\nStacktrace:', '2019-02-13 17:19:31');
INSERT INTO `sys_error` VALUES ('551', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-16 12:01:07');
INSERT INTO `sys_error` VALUES ('552', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-16 12:01:09');
INSERT INTO `sys_error` VALUES ('553', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-16 12:02:31');
INSERT INTO `sys_error` VALUES ('554', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Ddemo_upfile%26sdo%3Dform%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;demo_upfile.form.jsp] not found', '2019-02-16 12:02:40');
INSERT INTO `sys_error` VALUES ('555', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-16 14:05:11');
INSERT INTO `sys_error` VALUES ('556', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Ddd_fs%26type%3Daccount%26sdo%3Dform%26id%3D1:Unable to compile class for JSP: \r\n\r\nAn error occurred at line: [46] in the jsp file: [/WEB-INF/jsp/manager/account/dd_fs.form.jsp]\r\nThe method myisnull(String) is undefined for the type Tools\r\n43: 								String  upFile = \"../upfile.inc.jsp\";\r\n44: 								String imgPreName = \"fs_logo\";\r\n45:                 String[] ssImgs = { //设置已有值\r\n46: 											!Tools.myisnull(infodb.get(imgPreName))?infodb.get(imgPreName):\"\"\r\n47:                     };\r\n48:                 String sImgs = \"\";                    \r\n49:                 for (int i =0 ;i<ssImgs.length;i++){\r\n\r\n\r\nStacktrace:', '2019-02-16 15:04:17');
INSERT INTO `sys_error` VALUES ('557', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Ddd_fs%26type%3Daccount%26sdo%3Dform%26id%3D1:Unable to compile class for JSP: \r\n\r\nAn error occurred at line: [46] in the jsp file: [/WEB-INF/jsp/manager/account/dd_fs.form.jsp]\r\nThe method myisnull(String) is undefined for the type Tools\r\n43: 								String  upFile = \"../upfile.inc.jsp\";\r\n44: 								String imgPreName = \"fs_logo\";\r\n45:                 String[] ssImgs = { //设置已有值\r\n46: 											!Tools.myisnull(infodb.get(imgPreName))?infodb.get(imgPreName):\"\"\r\n47:                     };\r\n48:                 String sImgs = \"\";                    \r\n49:                 for (int i =0 ;i<ssImgs.length;i++){\r\n\r\n\r\nStacktrace:', '2019-02-16 15:07:09');
INSERT INTO `sys_error` VALUES ('558', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-16 15:13:45');
INSERT INTO `sys_error` VALUES ('559', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Ddd_gems%26sdo%3Dlist%26type%3Daccount:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;account&#47;dd_gems.list.jsp] not found', '2019-02-16 15:16:40');
INSERT INTO `sys_error` VALUES ('560', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Ddd_gems%26sdo%3Dlist%26type%3Daccount:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;account&#47;dd_gems.list.jsp] not found', '2019-02-16 15:17:39');
INSERT INTO `sys_error` VALUES ('561', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-16 15:29:25');
INSERT INTO `sys_error` VALUES ('562', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-16 15:29:35');
INSERT INTO `sys_error` VALUES ('563', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-16 15:29:55');
INSERT INTO `sys_error` VALUES ('564', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-16 15:29:58');
INSERT INTO `sys_error` VALUES ('565', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-16 15:30:01');
INSERT INTO `sys_error` VALUES ('566', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-16 15:34:34');
INSERT INTO `sys_error` VALUES ('567', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Ddemo_upfile%26sdo%3Dform%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;demo_upfile.form.jsp] not found', '2019-02-16 15:34:37');
INSERT INTO `sys_error` VALUES ('568', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-16 15:37:40');
INSERT INTO `sys_error` VALUES ('569', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Ddd_fs%26type%3Daccount%26sdo%3Dform:An exception occurred processing [/WEB-INF/jsp/manager/account/dd_fs.form.jsp] at line [129]\r\n\r\n126: 						</tr>\r\n127: 						<%\r\n128: 							Map<String,Object> menus = (Map<String,Object>)request.getAttribute(\"modals\");\r\n129: 							for (String key :menus.keySet()){  //一级菜单循环开始\r\n130: 								Map<String,Object>  mainList = (Map<String,Object>) menus.get(key);\r\n131: 								TtList submenus =(TtList)mainList.get(\"submenu\");\r\n132: 								TtMap mainInfo = (TtMap)mainList.get(\"mainmenu\");\r\n\r\n\r\nStacktrace:', '2019-02-16 16:54:24');
INSERT INTO `sys_error` VALUES ('570', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Ddd_fs%26type%3Daccount%26sdo%3Dform:An exception occurred processing [/WEB-INF/jsp/manager/account/dd_fs.form.jsp] at line [129]\r\n\r\n126: 						</tr>\r\n127: 						<%\r\n128: 							Map<String,Object> menus = (Map<String,Object>)request.getAttribute(\"modals\");\r\n129: 							for (String key :menus.keySet()){  //一级菜单循环开始\r\n130: 								Map<String,Object>  mainList = (Map<String,Object>) menus.get(key);\r\n131: 								TtList submenus =(TtList)mainList.get(\"submenu\");\r\n132: 								TtMap mainInfo = (TtMap)mainList.get(\"mainmenu\");\r\n\r\n\r\nStacktrace:', '2019-02-16 16:55:26');
INSERT INTO `sys_error` VALUES ('571', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Ddd_fs%26type%3Daccount%26sdo%3Dform:An exception occurred processing [/WEB-INF/jsp/manager/account/dd_fs.form.jsp] at line [129]\r\n\r\n126: 						</tr>\r\n127: 						<%\r\n128: 							Map<String,Object> menus = (Map<String,Object>)request.getAttribute(\"modals\");\r\n129: 							for (String key :menus.keySet()){  //一级菜单循环开始\r\n130: 								Map<String,Object>  mainList = (Map<String,Object>) menus.get(key);\r\n131: 								TtList submenus =(TtList)mainList.get(\"submenu\");\r\n132: 								TtMap mainInfo = (TtMap)mainList.get(\"mainmenu\");\r\n\r\n\r\nStacktrace:', '2019-02-16 16:55:28');
INSERT INTO `sys_error` VALUES ('572', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Ddemo_upfile%26sdo%3Dform%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;demo_upfile.form.jsp] not found', '2019-02-18 15:59:33');
INSERT INTO `sys_error` VALUES ('573', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-18 15:59:45');
INSERT INTO `sys_error` VALUES ('574', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-18 15:59:48');
INSERT INTO `sys_error` VALUES ('575', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Ddemo_upfile%26sdo%3Dform%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;demo_upfile.form.jsp] not found', '2019-02-18 15:59:52');
INSERT INTO `sys_error` VALUES ('576', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dalltask%26type%3Dddbx%26sdo%3Dform%26id%3D1:Unable to compile class for JSP: \r\n\r\nAn error occurred at line: [168] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nDuplicate local variable infodb\r\n165:                     </div>\r\n166:                 </div>\r\n167:                 <%\r\n168:                     Map<String, String> infodb = (Map<String, String>) request.getAttribute(\"infodb\");\r\n169:                 %>\r\n170:                 <div class=\"form-group\">\r\n171:                     <label class=\"col-sm-2 control-label\">公司logo</label>\r\n\r\n\r\nAn error occurred at line: [174] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nDuplicate local variable upFile\r\n171:                     <label class=\"col-sm-2 control-label\">公司logo</label>\r\n172:                     <div class=\"col-sm-6\">\r\n173:                         <%\r\n174:                             String  upFile = \"../upfile.inc.jsp\";\r\n175:                             String imgPreName = \"fs_logo\";\r\n176:                             String[] ssImgs = { //设置已有值\r\n177:                                     !Tools.myIsNull(infodb.get(imgPreName))?infodb.get(imgPreName):\"\"\r\n\r\n\r\nAn error occurred at line: [175] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nDuplicate local variable imgPreName\r\n172:                     <div class=\"col-sm-6\">\r\n173:                         <%\r\n174:                             String  upFile = \"../upfile.inc.jsp\";\r\n175:                             String imgPreName = \"fs_logo\";\r\n176:                             String[] ssImgs = { //设置已有值\r\n177:                                     !Tools.myIsNull(infodb.get(imgPreName))?infodb.get(imgPreName):\"\"\r\n178:                             };\r\n\r\n\r\nAn error occurred at line: [176] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nDuplicate local variable ssImgs\r\n173:                         <%\r\n174:                             String  upFile = \"../upfile.inc.jsp\";\r\n175:                             String imgPreName = \"fs_logo\";\r\n176:                             String[] ssImgs = { //设置已有值\r\n177:                                     !Tools.myIsNull(infodb.get(imgPreName))?infodb.get(imgPreName):\"\"\r\n178:                             };\r\n179:                             String sImgs = \"\";\r\n\r\n\r\nAn error occurred at line: [179] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nDuplicate local variable sImgs\r\n176:                             String[] ssImgs = { //设置已有值\r\n177:                                     !Tools.myIsNull(infodb.get(imgPreName))?infodb.get(imgPreName):\"\"\r\n178:                             };\r\n179:                             String sImgs = \"\";\r\n180:                             for (int i =0 ;i<ssImgs.length;i++){\r\n181:                                 sImgs=sImgs+ssImgs[i]+\"|\";\r\n182:                             }\r\n\r\n\r\nAn error occurred at line: [204] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nDuplicate local variable sp\r\n201:                 <%--selcet，下拉框演示--%>\r\n202:                 <%\r\n203:                     //dicopt功能演示，指定表里面的name和id，并用name组成<option></option>\r\n204:                     String sp = Tools.dicopt(\"comm_states\", 0);//省会，\r\n205:                 %>\r\n206:                 <div class=\"form-group\">\r\n207:                     <label class=\"col-sm-2 control-label\">显示/隐藏</label>\r\n\r\n\r\nStacktrace:', '2019-02-18 16:08:08');
INSERT INTO `sys_error` VALUES ('577', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dalltask%26type%3Dddbx%26sdo%3Dform%26id%3D1:Unable to compile class for JSP: \r\n\r\nAn error occurred at line: [168] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nDuplicate local variable infodb\r\n165:                     </div>\r\n166:                 </div>\r\n167:                 <%\r\n168:                     Map<String, String> infodb = (Map<String, String>) request.getAttribute(\"infodb\");\r\n169:                 %>\r\n170:                 <div class=\"form-group\">\r\n171:                     <label class=\"col-sm-2 control-label\">公司logo</label>\r\n\r\n\r\nAn error occurred at line: [174] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nDuplicate local variable upFile\r\n171:                     <label class=\"col-sm-2 control-label\">公司logo</label>\r\n172:                     <div class=\"col-sm-6\">\r\n173:                         <%\r\n174:                             String  upFile = \"../upfile.inc.jsp\";\r\n175:                             String imgPreName = \"fs_logo\";\r\n176:                             String[] ssImgs = { //设置已有值\r\n177:                                     !Tools.myIsNull(infodb.get(imgPreName))?infodb.get(imgPreName):\"\"\r\n\r\n\r\nAn error occurred at line: [175] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nDuplicate local variable imgPreName\r\n172:                     <div class=\"col-sm-6\">\r\n173:                         <%\r\n174:                             String  upFile = \"../upfile.inc.jsp\";\r\n175:                             String imgPreName = \"fs_logo\";\r\n176:                             String[] ssImgs = { //设置已有值\r\n177:                                     !Tools.myIsNull(infodb.get(imgPreName))?infodb.get(imgPreName):\"\"\r\n178:                             };\r\n\r\n\r\nAn error occurred at line: [176] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nDuplicate local variable ssImgs\r\n173:                         <%\r\n174:                             String  upFile = \"../upfile.inc.jsp\";\r\n175:                             String imgPreName = \"fs_logo\";\r\n176:                             String[] ssImgs = { //设置已有值\r\n177:                                     !Tools.myIsNull(infodb.get(imgPreName))?infodb.get(imgPreName):\"\"\r\n178:                             };\r\n179:                             String sImgs = \"\";\r\n\r\n\r\nAn error occurred at line: [179] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nDuplicate local variable sImgs\r\n176:                             String[] ssImgs = { //设置已有值\r\n177:                                     !Tools.myIsNull(infodb.get(imgPreName))?infodb.get(imgPreName):\"\"\r\n178:                             };\r\n179:                             String sImgs = \"\";\r\n180:                             for (int i =0 ;i<ssImgs.length;i++){\r\n181:                                 sImgs=sImgs+ssImgs[i]+\"|\";\r\n182:                             }\r\n\r\n\r\nAn error occurred at line: [204] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nDuplicate local variable sp\r\n201:                 <%--selcet，下拉框演示--%>\r\n202:                 <%\r\n203:                     //dicopt功能演示，指定表里面的name和id，并用name组成<option></option>\r\n204:                     String sp = Tools.dicopt(\"comm_states\", 0);//省会，\r\n205:                 %>\r\n206:                 <div class=\"form-group\">\r\n207:                     <label class=\"col-sm-2 control-label\">显示/隐藏</label>\r\n\r\n\r\nStacktrace:', '2019-02-18 16:08:13');
INSERT INTO `sys_error` VALUES ('578', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dalltask%26type%3Dddbx%26sdo%3Dform%26id%3D1:Unable to compile class for JSP: \r\n\r\nAn error occurred at line: [69] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nsp cannot be resolved to a variable\r\n66: 								<span class=\"input-group-addon\">省</span>\r\n67: 								<select name=\"state_id\" id=\"state_id\" class=\"form-control\">\r\n68: 									<option value=\"0\">请选择</option>\r\n69: 									<%=sp%>\r\n70: 								</select>\r\n71: 							</div>\r\n72: 						</div>\r\n\r\n\r\nAn error occurred at line: [138] in the jsp file: [/WEB-INF/jsp/manager/ddbx/alltask.form.jsp]\r\nsp cannot be resolved to a variable\r\n135:                                     <span class=\"input-group-addon\">省</span>\r\n136:                                     <select name=\"state_id\" id=\"state_id\" class=\"form-control\">\r\n137:                                     <option value=\"0\">请选择</option>\r\n138:                                     <%=sp%>\r\n139:                                 </select>\r\n140:                                 </div>\r\n141:                             </div>\r\n\r\n\r\nStacktrace:', '2019-02-18 16:09:09');
INSERT INTO `sys_error` VALUES ('579', 'null', '2019-02-21 16:53:27');
INSERT INTO `sys_error` VALUES ('580', 'null', '2019-02-21 17:07:03');
INSERT INTO `sys_error` VALUES ('581', 'null', '2019-02-21 17:07:03');
INSERT INTO `sys_error` VALUES ('582', 'null', '2019-02-21 17:08:33');
INSERT INTO `sys_error` VALUES ('583', 'null', '2019-02-21 17:08:33');
INSERT INTO `sys_error` VALUES ('584', 'null', '2019-02-21 17:12:02');
INSERT INTO `sys_error` VALUES ('585', 'null', '2019-02-21 17:12:02');
INSERT INTO `sys_error` VALUES ('586', 'null', '2019-02-21 17:22:27');
INSERT INTO `sys_error` VALUES ('587', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dsys_config_son%26sdo%3Dlist%26type%3Dsys:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;sys&#47;sys_config_son.list.jsp] not found', '2019-02-21 17:27:59');
INSERT INTO `sys_error` VALUES ('588', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D1:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;ddbx&#47;mytask&#47;mytask.jsp] not found', '2019-02-25 11:44:42');
INSERT INTO `sys_error` VALUES ('589', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26id%3D1%26type%3Dddbx%26sdo%3Dform:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;ddbx&#47;mytask&#47;mytask.jsp] not found', '2019-02-25 11:47:09');
INSERT INTO `sys_error` VALUES ('590', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26id%3D1%26type%3Dddbx%26sdo%3Dform:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;ddbx&#47;mytask&#47;mytask.jsp] not found', '2019-02-25 11:49:15');
INSERT INTO `sys_error` VALUES ('591', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26id%3D1%26type%3Dddbx%26sdo%3Dform:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;ddbx&#47;mytask&#47;mytask.jsp] not found', '2019-02-25 11:49:23');
INSERT INTO `sys_error` VALUES ('592', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26id%3D1%26type%3Dddbx%26sdo%3Dform:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;ddbx&#47;mytask&#47;mytask.jsp] not found', '2019-02-25 11:51:24');
INSERT INTO `sys_error` VALUES ('593', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26id%3D1%26type%3Dddbx%26sdo%3Dform:Unable to compile class for JSP: \r\n\r\nAn error occurred at line: [60] in the jsp file: [/WEB-INF/jsp/manager/ddbx/mytask.form.jsp]\r\nmsg1 cannot be resolved to a variable\r\n57: 							</ul>\r\n58: 						</div>\r\n59: \r\n60:                      <jsp:include page=\"<%=msg1%>\"></jsp:include>\r\n61: 					</div>\r\n62: 				</div>\r\n63: 				<div class=\"tab-pane\" id=\"tab_1\">\r\n\r\n\r\nStacktrace:', '2019-02-25 12:02:34');
INSERT INTO `sys_error` VALUES ('594', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26id%3D1%26type%3Dddbx%26sdo%3Dform:Unable to compile class for JSP: \r\n\r\nAn error occurred at line: [60] in the jsp file: [/WEB-INF/jsp/manager/ddbx/mytask.form.jsp]\r\nmsg1 cannot be resolved to a variable\r\n57: 							</ul>\r\n58: 						</div>\r\n59: \r\n60:                      <jsp:include page=\"<%=msg1%>\"></jsp:include>\r\n61: 					</div>\r\n62: 				</div>\r\n63: 				<div class=\"tab-pane\" id=\"tab_1\">\r\n\r\n\r\nStacktrace:', '2019-02-25 13:34:58');
INSERT INTO `sys_error` VALUES ('595', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dzxcx%26type%3Dinto_modal%26sdo%3Dform%26id%3D2:An exception occurred processing [/WEB-INF/jsp/manager/into_modal/zxcx.form.jsp] at line [17]\r\n\r\n14: <div class=\"admin-content nav-tabs-custom box\">\r\n15:     <div class=\"box-header with-border\">\r\n16:         ${id }\r\n17:         <c:if test=\"${id }\">\r\n18:         <div class=\"box-header with-border\">\r\n19:             <h3 class=\"box-title\">订单来自：快加云-秦扬</h3>\r\n20:             <h3 class=\"box-title\">提交时间：2019-02-20 16:57:00</h3>\r\n\r\n\r\nStacktrace:', '2019-02-25 15:47:51');
INSERT INTO `sys_error` VALUES ('596', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dzxcx%26type%3Dinto_modal%26sdo%3Dform%26id%3D2:Unable to compile class for JSP: \r\n\r\nAn error occurred at line: [235] in the jsp file: [/WEB-INF/jsp/manager/into_modal/zxcx.form.jsp]\r\nInvalid character constant\r\n232:                                     ssImgs1=ssImgs1[0].split(\",\");\r\n233:                                     String sImgs1 = \"\";\r\n234:                                     for (int i = 0; i < ssImgs1.length; i++) {\r\n235:                                         if(sImgs1!=null&&sImgs1!=\') {\r\n236:                                             sImgs1 = sImgs1 + ssImgs1[i] + \"|\";\r\n237:                                         }\r\n238:                                     }\r\n\r\n\r\nStacktrace:', '2019-02-25 18:15:02');
INSERT INTO `sys_error` VALUES ('597', null, '2019-02-26 10:17:15');
INSERT INTO `sys_error` VALUES ('598', null, '2019-02-26 10:17:26');
INSERT INTO `sys_error` VALUES ('599', null, '2019-02-26 10:18:10');
INSERT INTO `sys_error` VALUES ('600', 'null', '2019-02-26 10:36:47');
INSERT INTO `sys_error` VALUES ('601', 'http%3A%2F%2Flocalhost%3A8092%2Fmanager%2Findex%7C%2Fmanager%2Findex%7Ccn%3Dzxcx%26type%3Dinto_modal%26sdo%3Dlist:An exception occurred processing [/WEB-INF/jsp/manager/list.jsp] at line [29]\r\n\r\n26: 		JspTools.alert(errorMsg,out);\r\n27: 	}\r\n28: 	String sPlUrl = Tools.urlKill(\"l|p\");\r\n29: 	int pages =(int) request.getAttribute(\"pages\");\r\n30: 	boolean canDel = request.getAttribute(\"canDel\")==null?false:(boolean)request.getAttribute(\"canDel\"); //是否显示删除按钮\r\n31: 	boolean canAdd = request.getAttribute(\"canAdd\")==null?true:(boolean)request.getAttribute(\"canAdd\"); //是否显示新增按钮\r\n32: 	String type = request.getParameter(\"type\");\r\n\r\n\r\nStacktrace:', '2019-02-26 10:36:47');
INSERT INTO `sys_error` VALUES ('602', 'null', '2019-02-26 11:07:38');
INSERT INTO `sys_error` VALUES ('603', 'null', '2019-02-26 11:18:09');
INSERT INTO `sys_error` VALUES ('604', 'http%3A%2F%2Flocalhost%3A8092%2Fmanager%2Findex%7C%2Fmanager%2Findex%7Ccn%3Dzxcx%26type%3Dinto_modal%26sdo%3Dlist:An exception occurred processing [/WEB-INF/jsp/manager/list.jsp] at line [29]\r\n\r\n26: 		JspTools.alert(errorMsg,out);\r\n27: 	}\r\n28: 	String sPlUrl = Tools.urlKill(\"l|p\");\r\n29: 	int pages =(int) request.getAttribute(\"pages\");\r\n30: 	boolean canDel = request.getAttribute(\"canDel\")==null?false:(boolean)request.getAttribute(\"canDel\"); //是否显示删除按钮\r\n31: 	boolean canAdd = request.getAttribute(\"canAdd\")==null?true:(boolean)request.getAttribute(\"canAdd\"); //是否显示新增按钮\r\n32: 	String type = request.getParameter(\"type\");\r\n\r\n\r\nStacktrace:', '2019-02-26 11:18:10');
INSERT INTO `sys_error` VALUES ('605', 'null', '2019-02-26 11:43:50');
INSERT INTO `sys_error` VALUES ('606', 'http%3A%2F%2Flocalhost%3A8092%2Fmanager%2Findex%7C%2Fmanager%2Findex%7Ccn%3Dzxcx%26type%3Dinto_modal%26sdo%3Dlist:An exception occurred processing [/WEB-INF/jsp/manager/list.jsp] at line [29]\r\n\r\n26: 		JspTools.alert(errorMsg,out);\r\n27: 	}\r\n28: 	String sPlUrl = Tools.urlKill(\"l|p\");\r\n29: 	int pages =(int) request.getAttribute(\"pages\");\r\n30: 	boolean canDel = request.getAttribute(\"canDel\")==null?false:(boolean)request.getAttribute(\"canDel\"); //是否显示删除按钮\r\n31: 	boolean canAdd = request.getAttribute(\"canAdd\")==null?true:(boolean)request.getAttribute(\"canAdd\"); //是否显示新增按钮\r\n32: 	String type = request.getParameter(\"type\");\r\n\r\n\r\nStacktrace:', '2019-02-26 11:43:50');
INSERT INTO `sys_error` VALUES ('607', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/36.jsp] at line [127]\r\n\r\n124:                                 erp_msg=erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"type_id\")+\".jsp\";\r\n125:                             }\r\n126:                         %>\r\n127:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n128:                         <%}%>\r\n129:                         </ol>\r\n130:                     </div>\r\n\r\n\r\nStacktrace:', '2019-02-26 16:42:33');
INSERT INTO `sys_error` VALUES ('608', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/36.jsp] at line [127]\r\n\r\n124:                                 erp_msg=erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\";\r\n125:                             }\r\n126:                         %>\r\n127:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n128:                         <%}%>\r\n129:                         </ol>\r\n130:                     </div>\r\n\r\n\r\nStacktrace:', '2019-02-26 16:44:33');
INSERT INTO `sys_error` VALUES ('609', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/36.jsp] at line [129]\r\n\r\n126:                             }\r\n127: \r\n128:                         %>\r\n129:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n130:                         <%}%>\r\n131:                         </ol>\r\n132:                     </div>\r\n\r\n\r\nStacktrace:', '2019-02-26 16:51:16');
INSERT INTO `sys_error` VALUES ('610', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/36.jsp] at line [129]\r\n\r\n126:                             }\r\n127: \r\n128:                         %>\r\n129:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n130:                         <%}%>\r\n131:                         </ol>\r\n132:                     </div>\r\n\r\n\r\nStacktrace:', '2019-02-26 16:51:21');
INSERT INTO `sys_error` VALUES ('611', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/36.jsp] at line [135]\r\n\r\n132:                             }\r\n133: \r\n134:                         %>\r\n135:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n136:                         <%\r\n137: \r\n138:                         }\r\n\r\n\r\nStacktrace:', '2019-02-26 16:55:39');
INSERT INTO `sys_error` VALUES ('612', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/36.jsp] at line [135]\r\n\r\n132:                             }\r\n133: \r\n134:                         %>\r\n135:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n136:                         <%\r\n137: \r\n138:                         }\r\n\r\n\r\nStacktrace:', '2019-02-26 16:56:22');
INSERT INTO `sys_error` VALUES ('613', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/36.jsp] at line [135]\r\n\r\n132:                             }\r\n133: \r\n134:                         %>\r\n135:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n136:                         <%\r\n137: \r\n138:                         }\r\n\r\n\r\nStacktrace:', '2019-02-26 16:56:39');
INSERT INTO `sys_error` VALUES ('614', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/36.jsp] at line [135]\r\n\r\n132:                             }\r\n133: \r\n134:                         %>\r\n135:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n136:                         <%\r\n137: \r\n138:                         }\r\n\r\n\r\nStacktrace:', '2019-02-26 16:56:53');
INSERT INTO `sys_error` VALUES ('615', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/36.jsp] at line [135]\r\n\r\n132:                             }\r\n133: \r\n134:                         %>\r\n135:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n136:                         <%\r\n137: \r\n138:                         }\r\n\r\n\r\nStacktrace:', '2019-02-26 16:57:10');
INSERT INTO `sys_error` VALUES ('616', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:Unable to compile class for JSP: \r\n\r\nAn error occurred at line: [139] in the jsp file: [/WEB-INF/jsp/manager/rwcl/36.jsp]\r\nUnreachable code\r\n136:                                 break;\r\n137:                             }\r\n138: \r\n139:                         %>\r\n140:                         <jsp:include page=\"<%=erp_msg1%>\"></jsp:include>\r\n141:                         <%\r\n142:                         }\r\n\r\n\r\nStacktrace:', '2019-02-26 17:01:57');
INSERT INTO `sys_error` VALUES ('617', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/36.jsp] at line [137]\r\n\r\n134:                                     erp_msg=erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\";\r\n135:                             }\r\n136:                         %>\r\n137:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n138:                         <%\r\n139:                             }\r\n140:                         }\r\n\r\n\r\nStacktrace:', '2019-02-26 17:08:39');
INSERT INTO `sys_error` VALUES ('618', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/36.jsp] at line [137]\r\n\r\n134:                                     erp_msg=erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\";\r\n135:                             }\r\n136:                         %>\r\n137:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n138:                         <%\r\n139:                             }\r\n140:                         }\r\n\r\n\r\nStacktrace:', '2019-02-26 17:08:52');
INSERT INTO `sys_error` VALUES ('619', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/36.jsp] at line [138]\r\n\r\n135: \r\n136:                             }\r\n137:                         %>\r\n138:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n139:                         <%\r\n140:                             }\r\n141:                         }\r\n\r\n\r\nStacktrace:', '2019-02-26 17:10:43');
INSERT INTO `sys_error` VALUES ('620', 'null', '2019-02-26 17:16:38');
INSERT INTO `sys_error` VALUES ('621', 'http%3A%2F%2Flocalhost%3A8092%2Fmanager%2Findex%7C%2Fmanager%2Findex%7Ccn%3Dmytask%26sdo%3Dlist%26type%3Dddbx:An exception occurred processing [/WEB-INF/jsp/manager/list.jsp] at line [29]\r\n\r\n26: 		JspTools.alert(errorMsg,out);\r\n27: 	}\r\n28: 	String sPlUrl = Tools.urlKill(\"l|p\");\r\n29: 	int pages =(int) request.getAttribute(\"pages\");\r\n30: 	boolean canDel = request.getAttribute(\"canDel\")==null?false:(boolean)request.getAttribute(\"canDel\"); //是否显示删除按钮\r\n31: 	boolean canAdd = request.getAttribute(\"canAdd\")==null?true:(boolean)request.getAttribute(\"canAdd\"); //是否显示新增按钮\r\n32: 	String type = request.getParameter(\"type\");\r\n\r\n\r\nStacktrace:', '2019-02-26 17:16:38');
INSERT INTO `sys_error` VALUES ('622', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D10%26type_id%3D1:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/rwcl.jsp] at line [138]\r\n\r\n135:                                     erp_msg=erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\";\r\n136:                             }\r\n137:                         %>\r\n138:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n139:                         <%\r\n140:                             }\r\n141:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n\r\n\r\nStacktrace:', '2019-02-26 17:19:07');
INSERT INTO `sys_error` VALUES ('623', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D10%26type_id%3D1:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/rwcl.jsp] at line [138]\r\n\r\n135:                                     erp_msg=erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\";\r\n136:                             }\r\n137:                         %>\r\n138:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n139:                         <%\r\n140:                             }\r\n141:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n\r\n\r\nStacktrace:', '2019-02-26 17:21:26');
INSERT INTO `sys_error` VALUES ('624', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D10%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/rwcl.jsp] at line [138]\r\n\r\n135:                                     erp_msg=erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\";\r\n136:                             }\r\n137:                         %>\r\n138:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n139:                         <%\r\n140:                             }\r\n141:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n\r\n\r\nStacktrace:', '2019-02-26 17:22:09');
INSERT INTO `sys_error` VALUES ('625', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dalltask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D36:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/rwcl.jsp] at line [98]\r\n\r\n95:                         <ol id=\"mochu\">\r\n96: \r\n97:                         <%\r\n98:                             if(list.size()>0){\r\n99: \r\n100:                         for(TtMap ttMap : list){\r\n101:                             System.out.println(ttMap.get(\"now_name\")+\"------\"+ttMap.get(\"now_status\"));\r\n\r\n\r\nStacktrace:', '2019-02-27 10:35:38');
INSERT INTO `sys_error` VALUES ('626', 'null', '2019-02-27 10:38:53');
INSERT INTO `sys_error` VALUES ('627', 'http%3A%2F%2Flocalhost%3A8092%2Fmanager%2Findex%7C%2Fmanager%2Findex%7Ccn%3Dmytask%26sdo%3Dlist%26type%3Dddbx:An exception occurred processing [/WEB-INF/jsp/manager/list.jsp] at line [29]\r\n\r\n26: 		JspTools.alert(errorMsg,out);\r\n27: 	}\r\n28: 	String sPlUrl = Tools.urlKill(\"l|p\");\r\n29: 	int pages =(int) request.getAttribute(\"pages\");\r\n30: 	boolean canDel = request.getAttribute(\"canDel\")==null?false:(boolean)request.getAttribute(\"canDel\"); //是否显示删除按钮\r\n31: 	boolean canAdd = request.getAttribute(\"canAdd\")==null?true:(boolean)request.getAttribute(\"canAdd\"); //是否显示新增按钮\r\n32: 	String type = request.getParameter(\"type\");\r\n\r\n\r\nStacktrace:', '2019-02-27 10:38:54');
INSERT INTO `sys_error` VALUES ('628', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D42:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/rwcl.jsp] at line [98]\r\n\r\n95:                         <ol id=\"mochu\">\r\n96: \r\n97:                         <%\r\n98:                             if(list.size()>0){\r\n99: \r\n100:                         for(TtMap ttMap : list){\r\n101:                             System.out.println(ttMap.get(\"now_name\")+\"------\"+ttMap.get(\"now_status\"));\r\n\r\n\r\nStacktrace:', '2019-02-27 11:19:43');
INSERT INTO `sys_error` VALUES ('629', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D11%26type_id%3D42:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/rwcl.jsp] at line [97]\r\n\r\n94:                     <div class=\"flex-rowcen\">\r\n95:                         <ol id=\"mochu\">\r\n96:                         <%\r\n97:                         if(list.size()>0){\r\n98:                         for(TtMap ttMap : list){\r\n99:                             System.out.println(ttMap.get(\"now_name\")+\"------\"+ttMap.get(\"now_status\"));\r\n100:                             if(ttMap.get(\"type_id\")!=null\r\n\r\n\r\nStacktrace:', '2019-02-27 11:22:51');
INSERT INTO `sys_error` VALUES ('630', null, '2019-02-27 17:04:08');
INSERT INTO `sys_error` VALUES ('631', 'For input string: \"null\"', '2019-02-27 17:04:10');
INSERT INTO `sys_error` VALUES ('632', 'For input string: \"null\"', '2019-02-27 17:04:11');
INSERT INTO `sys_error` VALUES ('633', 'For input string: \"null\"', '2019-02-27 17:04:12');
INSERT INTO `sys_error` VALUES ('634', 'For input string: \"null\"', '2019-02-27 17:04:17');
INSERT INTO `sys_error` VALUES ('635', null, '2019-02-27 17:04:22');
INSERT INTO `sys_error` VALUES ('636', null, '2019-02-27 17:38:35');
INSERT INTO `sys_error` VALUES ('637', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26cn%3Dhome%26sdo%3Dform%26type%3Ddemo:null', '2019-02-27 17:38:50');
INSERT INTO `sys_error` VALUES ('638', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26cn%3Dhome%26sdo%3Dform%26type%3Ddemo:null', '2019-02-27 17:43:23');
INSERT INTO `sys_error` VALUES ('639', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26cn%3Dhome%26sdo%3Dform%26type%3Ddemo:null', '2019-02-27 17:43:33');
INSERT INTO `sys_error` VALUES ('640', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26cn%3Dhome%26sdo%3Dform%26type%3Ddemo:null', '2019-02-27 17:43:44');
INSERT INTO `sys_error` VALUES ('641', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26sdo%3Dform%26type%3Ddemo:null', '2019-02-27 17:43:50');
INSERT INTO `sys_error` VALUES ('642', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26sdo%3Dform%26type%3Ddemo:null', '2019-02-27 17:43:52');
INSERT INTO `sys_error` VALUES ('643', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 17:45:49');
INSERT INTO `sys_error` VALUES ('644', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 17:48:49');
INSERT INTO `sys_error` VALUES ('645', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 17:52:51');
INSERT INTO `sys_error` VALUES ('646', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 17:53:41');
INSERT INTO `sys_error` VALUES ('647', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 17:54:55');
INSERT INTO `sys_error` VALUES ('648', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:02:41');
INSERT INTO `sys_error` VALUES ('649', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:05:19');
INSERT INTO `sys_error` VALUES ('650', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:05:21');
INSERT INTO `sys_error` VALUES ('651', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:05:47');
INSERT INTO `sys_error` VALUES ('652', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26sdo%3Dform%26type%3Ddemo%26cn%3Dhome:null', '2019-02-27 18:06:03');
INSERT INTO `sys_error` VALUES ('653', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:06:19');
INSERT INTO `sys_error` VALUES ('654', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:07:34');
INSERT INTO `sys_error` VALUES ('655', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:08:09');
INSERT INTO `sys_error` VALUES ('656', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:08:13');
INSERT INTO `sys_error` VALUES ('657', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:09:00');
INSERT INTO `sys_error` VALUES ('658', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:09:13');
INSERT INTO `sys_error` VALUES ('659', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:10:47');
INSERT INTO `sys_error` VALUES ('660', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:10:53');
INSERT INTO `sys_error` VALUES ('661', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:16:53');
INSERT INTO `sys_error` VALUES ('662', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26sdo%3Dform%26type%3Ddemo%26cn%3Dhome:null', '2019-02-27 18:19:24');
INSERT INTO `sys_error` VALUES ('663', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26sdo%3Dform%26type%3Ddemo%26cn%3Dhome:null', '2019-02-27 18:20:44');
INSERT INTO `sys_error` VALUES ('664', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26sdo%3Dform%26type%3Ddemo%26cn%3Dhome:null', '2019-02-27 18:25:23');
INSERT INTO `sys_error` VALUES ('665', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26sdo%3Dform%26type%3Ddemo%26cn%3Dhome:null', '2019-02-27 18:25:55');
INSERT INTO `sys_error` VALUES ('666', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26sdo%3Dform%26type%3Ddemo%26cn%3Dhome:null', '2019-02-27 18:26:29');
INSERT INTO `sys_error` VALUES ('667', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26sdo%3Dform%26type%3Ddemo%26cn%3Dhome:null', '2019-02-27 18:27:42');
INSERT INTO `sys_error` VALUES ('668', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26sdo%3Dform%26type%3Ddemo%26cn%3Dhome:null', '2019-02-27 18:28:07');
INSERT INTO `sys_error` VALUES ('669', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26sdo%3Dform%26type%3Ddemo%26cn%3Dhome:null', '2019-02-27 18:28:15');
INSERT INTO `sys_error` VALUES ('670', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26sdo%3Dform%26type%3Ddemo%26cn%3Dhome:null', '2019-02-27 18:29:12');
INSERT INTO `sys_error` VALUES ('671', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:30:13');
INSERT INTO `sys_error` VALUES ('672', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:31:17');
INSERT INTO `sys_error` VALUES ('673', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-27 18:32:45');
INSERT INTO `sys_error` VALUES ('674', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dreadme%26sdo%3Dlist%26type%3Ddemo:null', '2019-02-27 18:32:55');
INSERT INTO `sys_error` VALUES ('675', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-27 18:33:00');
INSERT INTO `sys_error` VALUES ('676', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 09:12:13');
INSERT INTO `sys_error` VALUES ('677', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 09:14:14');
INSERT INTO `sys_error` VALUES ('678', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 09:14:45');
INSERT INTO `sys_error` VALUES ('679', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 09:18:43');
INSERT INTO `sys_error` VALUES ('680', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 09:23:17');
INSERT INTO `sys_error` VALUES ('681', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 09:24:41');
INSERT INTO `sys_error` VALUES ('682', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 09:29:17');
INSERT INTO `sys_error` VALUES ('683', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 09:31:44');
INSERT INTO `sys_error` VALUES ('684', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 09:36:37');
INSERT INTO `sys_error` VALUES ('685', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 09:41:41');
INSERT INTO `sys_error` VALUES ('686', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26sdo%3Dform%26type%3Ddemo:null', '2019-02-28 09:42:18');
INSERT INTO `sys_error` VALUES ('687', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 09:43:50');
INSERT INTO `sys_error` VALUES ('688', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 09:44:00');
INSERT INTO `sys_error` VALUES ('689', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 09:48:33');
INSERT INTO `sys_error` VALUES ('690', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 10:09:46');
INSERT INTO `sys_error` VALUES ('691', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 10:14:01');
INSERT INTO `sys_error` VALUES ('692', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26cn%3Dhome%26sdo%3Dform%26type%3Ddemo:null', '2019-02-28 10:14:05');
INSERT INTO `sys_error` VALUES ('693', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26cn%3Dhome%26sdo%3Dform%26type%3Ddemo:null', '2019-02-28 10:17:09');
INSERT INTO `sys_error` VALUES ('694', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26cn%3Dhome%26sdo%3Dform%26type%3Ddemo:null', '2019-02-28 10:17:18');
INSERT INTO `sys_error` VALUES ('695', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26cn%3Dhome%26sdo%3Dform%26type%3Ddemo:null', '2019-02-28 10:18:45');
INSERT INTO `sys_error` VALUES ('696', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%26cn%3Dhome%26sdo%3Dform%26type%3Ddemo:null', '2019-02-28 10:18:48');
INSERT INTO `sys_error` VALUES ('697', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2F404.jsp%7Ccn%3Dhome%26type%3Ddemo%26sdo%3Dform:null', '2019-02-28 10:23:21');
INSERT INTO `sys_error` VALUES ('698', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dcomm_citys%26sdo%3Dlist%26type%3Ddemo:javax.servlet.ServletException: File [&#47;WEB-INF&#47;jsp&#47;manager&#47;demo&#47;comm_citys.list.jsp] not found', '2019-02-28 10:26:34');
INSERT INTO `sys_error` VALUES ('699', null, '2019-02-28 16:21:16');
INSERT INTO `sys_error` VALUES ('700', null, '2019-02-28 17:05:29');
INSERT INTO `sys_error` VALUES ('701', null, '2019-02-28 17:14:26');
INSERT INTO `sys_error` VALUES ('702', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D14%26type_id%3D36%26icbc_id%3D23:Unable to compile class for JSP: \r\n\r\nAn error occurred at line: [83] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on tokens, delete these tokens\r\n80:     TtMap infodb = (TtMap) request.getAttribute(\"infodb\");\r\n81:     TtMap minfo = (TtMap) request.getAttribute(\"minfo\");\r\n82: \r\n83: <<<<<<< HEAD\r\n84:     String erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n85: %>\r\n86: =======\r\n\r\n\r\nAn error occurred at line: [125] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on tokens, delete these tokens\r\n122:                             if(request.getAttribute(\"erplist\")!=null&&!request.getAttribute(\"erplist\").equals(\"\")){\r\n123:                             TtList list= (TtList) request.getAttribute(\"erplist\");\r\n124:                         if(list.size()>0){\r\n125: =======\r\n126:                         <ol>\r\n127:                         <%\r\n128: >>>>>>> refs/remotes/origin/master\r\n\r\n\r\nAn error occurred at line: [126] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on tokens, ( expected instead\r\n123:                             TtList list= (TtList) request.getAttribute(\"erplist\");\r\n124:                         if(list.size()>0){\r\n125: =======\r\n126:                         <ol>\r\n127:                         <%\r\n128: >>>>>>> refs/remotes/origin/master\r\n129:                         for(TtMap ttMap : list){\r\n\r\n\r\nAn error occurred at line: [126] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nThe left-hand side of an assignment must be a variable\r\n123:                             TtList list= (TtList) request.getAttribute(\"erplist\");\r\n124:                         if(list.size()>0){\r\n125: =======\r\n126:                         <ol>\r\n127:                         <%\r\n128: >>>>>>> refs/remotes/origin/master\r\n129:                         for(TtMap ttMap : list){\r\n\r\n\r\nAn error occurred at line: [128] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error, insert \")\" to complete Expression\r\n125: =======\r\n126:                         <ol>\r\n127:                         <%\r\n128: >>>>>>> refs/remotes/origin/master\r\n129:                         for(TtMap ttMap : list){\r\n130:                             System.out.println(ttMap.get(\"now_name\")+\"------\"+ttMap.get(\"now_status\"));\r\n131:                             if(ttMap.get(\"type_id\")!=null\r\n\r\n\r\nAn error occurred at line: [128] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error, insert \"AssignmentOperator Expression\" to complete Assignment\r\n125: =======\r\n126:                         <ol>\r\n127:                         <%\r\n128: >>>>>>> refs/remotes/origin/master\r\n129:                         for(TtMap ttMap : list){\r\n130:                             System.out.println(ttMap.get(\"now_name\")+\"------\"+ttMap.get(\"now_status\"));\r\n131:                             if(ttMap.get(\"type_id\")!=null\r\n\r\n\r\nAn error occurred at line: [128] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error, insert \";\" to complete BlockStatements\r\n125: =======\r\n126:                         <ol>\r\n127:                         <%\r\n128: >>>>>>> refs/remotes/origin/master\r\n129:                         for(TtMap ttMap : list){\r\n130:                             System.out.println(ttMap.get(\"now_name\")+\"------\"+ttMap.get(\"now_status\"));\r\n131:                             if(ttMap.get(\"type_id\")!=null\r\n\r\n\r\nAn error occurred at line: [136] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on tokens, delete these tokens\r\n133:                             &&ttMap.get(\"now_status\")!=null\r\n134:                                     &&!ttMap.get(\"now_status\").equals(\"\")\r\n135:                             ){\r\n136: <<<<<<< HEAD\r\n137:                             System.out.println(\"***********88\"+erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\");\r\n138: =======\r\n139:                              //   System.out.println(\"***********88\"+erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\");\r\n\r\n\r\nAn error occurred at line: [137] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on tokens, ( expected instead\r\n134:                                     &&!ttMap.get(\"now_status\").equals(\"\")\r\n135:                             ){\r\n136: <<<<<<< HEAD\r\n137:                             System.out.println(\"***********88\"+erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\");\r\n138: =======\r\n139:                              //   System.out.println(\"***********88\"+erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\");\r\n140: >>>>>>> refs/remotes/origin/master\r\n\r\n\r\nAn error occurred at line: [137] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nThe left-hand side of an assignment must be a variable\r\n134:                                     &&!ttMap.get(\"now_status\").equals(\"\")\r\n135:                             ){\r\n136: <<<<<<< HEAD\r\n137:                             System.out.println(\"***********88\"+erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\");\r\n138: =======\r\n139:                              //   System.out.println(\"***********88\"+erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\");\r\n140: >>>>>>> refs/remotes/origin/master\r\n\r\n\r\nAn error occurred at line: [140] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error, insert \")\" to complete Expression\r\n137:                             System.out.println(\"***********88\"+erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\");\r\n138: =======\r\n139:                              //   System.out.println(\"***********88\"+erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\");\r\n140: >>>>>>> refs/remotes/origin/master\r\n141:                             switch (ttMap.get(\"now_name\")){\r\n142:                                 case \"开始\":\r\n143:                                     erp_msg=erp_msg+\"modal/begin.jsp\";\r\n\r\n\r\nAn error occurred at line: [140] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error, insert \"AssignmentOperator Expression\" to complete Assignment\r\n137:                             System.out.println(\"***********88\"+erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\");\r\n138: =======\r\n139:                              //   System.out.println(\"***********88\"+erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\");\r\n140: >>>>>>> refs/remotes/origin/master\r\n141:                             switch (ttMap.get(\"now_name\")){\r\n142:                                 case \"开始\":\r\n143:                                     erp_msg=erp_msg+\"modal/begin.jsp\";\r\n\r\n\r\nAn error occurred at line: [140] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error, insert \";\" to complete BlockStatements\r\n137:                             System.out.println(\"***********88\"+erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\");\r\n138: =======\r\n139:                              //   System.out.println(\"***********88\"+erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\");\r\n140: >>>>>>> refs/remotes/origin/master\r\n141:                             switch (ttMap.get(\"now_name\")){\r\n142:                                 case \"开始\":\r\n143:                                     erp_msg=erp_msg+\"modal/begin.jsp\";\r\n\r\n\r\nAn error occurred at line: [178] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error, insert \"Finally\" to complete TryStatement\r\n175: =======\r\n176:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n177:                         <%\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n\r\n\r\nAn error occurred at line: [179] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nerp_msg cannot be resolved to a variable\r\n176:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n177:                         <%\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \".\", @ expected after this token\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error on token \";\", @ expected\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error, insert \"SimpleName\" to complete QualifiedName\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error, insert \"Identifier (\" to complete MethodHeaderName\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [181] in the jsp file: [/WEB-INF/jsp/manager/rwcl/rwcl.jsp]\r\nSyntax error, insert \")\" to complete MethodDeclaration\r\n178:                             }\r\n179:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n180:                         }\r\n181:                         %>\r\n182: >>>>>>> refs/remotes/origin/master\r\n183:                         </ol>\r\n184:                     </div>\r\n\r\n\r\nAn error occurred at line: [373] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\nSyntax error on token \"catch\", invalid AnnotationName\r\n\r\nAn error occurred at line: [373] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\nSyntax error on token(s), misplaced construct(s)\r\n\r\nAn error occurred at line: [373] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\nSyntax error, insert \"enum Identifier\" to complete EnumHeader\r\n\r\nAn error occurred at line: [375] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\nout cannot be resolved to a variable\r\n\r\nAn error occurred at line: [375] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\n_jspx_out cannot be resolved to a variable\r\n\r\nAn error occurred at line: [376] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\nout cannot be resolved to a variable\r\n\r\nAn error occurred at line: [376] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\nout cannot be resolved\r\n\r\nAn error occurred at line: [378] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\nresponse cannot be resolved\r\n\r\nAn error occurred at line: [379] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\nout cannot be resolved\r\n\r\nAn error occurred at line: [381] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\nout cannot be resolved\r\n\r\nAn error occurred at line: [384] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\n_jspx_page_context cannot be resolved to a variable\r\n\r\nAn error occurred at line: [384] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\n_jspx_page_context cannot be resolved\r\n\r\nAn error occurred at line: [387] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\nSyntax error on token \"finally\", invalid AnnotationTypeDeclarationHeader\r\n\r\nAn error occurred at line: [387] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\nSyntax error, insert \"}\" to complete AnnotationTypeBody\r\n\r\nAn error occurred at line: [388] in the generated java file: [C:Users86176AppDataLocalTemp	omcat.2752822906755564782.8092workTomcatlocalhostROOTorgapachejspWEB_002dINFjspmanager\rwcl\rwcl_jsp.java]\r\n_jspx_page_context cannot be resolved to a variable\r\n\r\nStacktrace:', '2019-02-28 18:11:30');
INSERT INTO `sys_error` VALUES ('703', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D14%26type_id%3D36%26icbc_id%3D23:/WEB-INF/jsp/manager/ddbx/mytask.form.jsp (line: [42], column: [102]) equal symbol expected', '2019-03-01 10:02:35');
INSERT INTO `sys_error` VALUES ('704', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D14%26type_id%3D36%26icbc_id%3D23:/WEB-INF/jsp/manager/ddbx/mytask.form.jsp (line: [43], column: [91]) equal symbol expected', '2019-03-01 10:25:13');
INSERT INTO `sys_error` VALUES ('705', 'For input string: \"\"', '2019-03-01 11:09:00');
INSERT INTO `sys_error` VALUES ('706', 'For input string: \"\"', '2019-03-01 11:09:11');
INSERT INTO `sys_error` VALUES ('707', 'For input string: \"\"', '2019-03-01 11:09:17');
INSERT INTO `sys_error` VALUES ('708', 'For input string: \"3636\"', '2019-03-01 15:16:25');
INSERT INTO `sys_error` VALUES ('709', 'For input string: \"3636\"', '2019-03-01 15:16:44');
INSERT INTO `sys_error` VALUES ('710', 'For input string: \"3636\"', '2019-03-01 15:16:52');
INSERT INTO `sys_error` VALUES ('711', 'For input string: \"3636\"', '2019-03-01 15:16:58');
INSERT INTO `sys_error` VALUES ('712', 'For input string: \"3636\"', '2019-03-01 15:17:53');
INSERT INTO `sys_error` VALUES ('713', 'For input string: \"3636\"', '2019-03-01 15:18:13');
INSERT INTO `sys_error` VALUES ('714', 'For input string: \"\"', '2019-03-04 10:07:54');
INSERT INTO `sys_error` VALUES ('715', 'For input string: \"\"', '2019-03-04 10:17:03');
INSERT INTO `sys_error` VALUES ('716', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26icbc_id%3D24%26sdo%3Dform%26id%3D16%26type_id%3D2%26tab%3D0:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/rwcl.jsp] at line [121]\r\n\r\n118:                                                     erp_msg=erp_msg+ttMap.get(\"type_id\")+\"/\"+ttMap.get(\"now_status\")+\".jsp\";\r\n119:                                             }\r\n120:                         %>\r\n121:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n122:                         <%\r\n123:                                 }\r\n124:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/\";\r\n\r\n\r\nStacktrace:', '2019-03-04 10:17:58');
INSERT INTO `sys_error` VALUES ('717', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26sdo%3Dform%26id%3D15%26type_id%3D36%26icbc_id%3D24%26tab%3D6:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/rwcl.jsp] at line [121]\r\n\r\n118:                                                     erp_msg=erp_msg+ttMap.get(\"now_status\")+\".jsp\";\r\n119:                                             }\r\n120:                         %>\r\n121:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n122:                         <%\r\n123:                                 }\r\n124:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/modal/\";\r\n\r\n\r\nStacktrace:', '2019-03-04 10:42:55');
INSERT INTO `sys_error` VALUES ('718', 'http%3A%2F%2Flocalhost%3A8092%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7C%2FWEB-INF%2Fjsp%2Fmanager%2Findex_b.jsp%7Ccn%3Dmytask%26type%3Dddbx%26icbc_id%3D24%26sdo%3Dform%26id%3D15%26type_id%3D36%26tab%3D0:An exception occurred processing [/WEB-INF/jsp/manager/rwcl/rwcl.jsp] at line [121]\r\n\r\n118:                                                     erp_msg=erp_msg+ttMap.get(\"now_status\")+\".jsp\";\r\n119:                                             }\r\n120:                         %>\r\n121:                         <jsp:include page=\"<%=erp_msg%>\"></jsp:include>\r\n122:                         <%\r\n123:                                 }\r\n124:                                 erp_msg=\"/WEB-INF/jsp/manager/rwcl/modal/\";\r\n\r\n\r\nStacktrace:', '2019-03-04 10:42:56');

-- ----------------------------
-- Table structure for sys_menulevels
-- ----------------------------
DROP TABLE IF EXISTS `sys_menulevels`;
CREATE TABLE `sys_menulevels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='菜单级别';

-- ----------------------------
-- Records of sys_menulevels
-- ----------------------------
INSERT INTO `sys_menulevels` VALUES ('1', '1级菜单');
INSERT INTO `sys_menulevels` VALUES ('2', '2级菜单');

-- ----------------------------
-- Table structure for sys_modal
-- ----------------------------
DROP TABLE IF EXISTS `sys_modal`;
CREATE TABLE `sys_modal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '子模块名称',
  `id_uplevel` int(11) NOT NULL COMMENT '上级模块id,主模块id，所属主模块',
  `mid_add` int(11) NOT NULL DEFAULT '0',
  `mid_edit` int(11) NOT NULL DEFAULT '0',
  `dt_add` datetime DEFAULT NULL,
  `dt_edit` datetime DEFAULT NULL,
  `showmmenutag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '后台菜单显示',
  `showmmenuname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '后台菜单显示名称',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url,type=的值',
  `cn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url里面的cn的值，一般是表名',
  `sort` int(8) NOT NULL DEFAULT '100' COMMENT '排序，越小越高',
  `level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '菜单级别，1为1级，2为2级。。。。',
  `icohtml` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '<i class="fa fa-arrow-circle-o-right"></i>' COMMENT '显示菜单时前面的图标html',
  `urlotherstr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url里传入的其他参数',
  `sdo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'list' COMMENT 'url里面的sdo',
  `superadmin` tinyint(4) NOT NULL DEFAULT '0' COMMENT '非0时为内部模块，1为内部超级管理员才有的，2为内部员工才有的',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `showmmenutag` (`showmmenutag`) USING BTREE,
  KEY `id_upmodal` (`id_uplevel`) USING BTREE,
  KEY `sort_2` (`sort`) USING BTREE,
  KEY `level` (`level`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统模块表';

-- ----------------------------
-- Records of sys_modal
-- ----------------------------
INSERT INTO `sys_modal` VALUES ('1', '系统角色管理', '6', '21', '21', '2019-01-21 00:00:00', '2019-01-25 14:38:36', '1', '全局角色', 'sys', 'admin_agp', '4', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '&systag=1', 'list', '1');
INSERT INTO `sys_modal` VALUES ('146', '汽车评估	', '144', '21', '21', '2019-03-04 09:31:06', '2019-03-04 09:31:06', '1', '汽车评估	', 'into_modal', 'qcpg', '100', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('3', '演示列表list,用admin表', '5', '21', '21', '2019-01-21 00:00:00', '2019-01-21 00:00:00', '1', '会员列表', 'demo', 'admin', '2', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('4', '演示列表，用comm_citys', '5', '21', '21', '2018-08-08 00:00:00', '2019-01-22 14:44:19', '1', '城市列表', 'demo', 'comm_citys', '1', '2', '<i class=\"fa fa-crosshairs\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('5', '演示模块', '0', '21', '21', '2018-04-24 19:25:52', '2019-02-18 15:59:23', '1', '演示模块', '4444444444', '333333333', '1', '1', '<i class=\"fa  fa-database\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('6', '系统设置', '0', '21', '21', '2018-08-08 00:00:00', '2019-01-22 15:00:43', '1', '系统设置', 'sys', 'sys_modal', '200', '1', '<i class=\"fa fa-asterisk\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('7', 'tt_form2', '5', '21', '21', '2018-08-08 00:00:00', '2018-08-08 00:00:00', '1', 'tt_form2', 'demo', 'admin2', '4', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '&id=25', 'form', '0');
INSERT INTO `sys_modal` VALUES ('8', 'button', '5', '21', '21', '2018-08-08 00:00:00', '2018-08-08 00:00:00', '1', 'button', 'demo', 'button', '3', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'form', '0');
INSERT INTO `sys_modal` VALUES ('9', '菜单和模块管理', '6', '21', '21', '2018-04-24 19:25:52', '2019-01-25 14:10:07', '1', '全局模块', 'sys', 'sys_modal', '1', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '1');
INSERT INTO `sys_modal` VALUES ('10', 'Modals', '5', '21', '21', '2019-01-21 16:27:55', '2019-01-21 16:27:55', '1', 'Modals', 'demo', 'Modals', '200', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'form', '0');
INSERT INTO `sys_modal` VALUES ('11', 'general', '5', '21', '21', '2019-01-21 16:36:36', '2019-01-21 16:36:36', '1', 'general', 'demo', 'general', '201', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'form', '0');
INSERT INTO `sys_modal` VALUES ('13', '贷后管理', '0', '21', '21', '2019-01-22 09:42:17', '2019-02-16 15:41:48', '0', '贷后管理', 'bank', 'dh', '3', '1', '<i class=\"fa fa-automobile\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('14', 'GPS定位管理', '13', '21', '21', '2019-01-22 09:48:26', '2019-01-22 09:48:26', '1', 'GPS管理', 'bank', 'gps', '1', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('15', '客户管理', '0', '21', '21', '2019-01-22 09:56:42', '2019-02-16 15:41:55', '0', '客户管理', 'demo', 'admin', '4', '1', '<i class=\"fa fa-home\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('16', '客户列表', '15', '21', '21', '2019-01-22 09:57:15', '2019-01-22 09:57:15', '1', '客户列表', 'demo', 'admin', '1', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('17', '给客户开个号', '15', '21', '21', '2019-01-22 11:05:25', '2019-01-22 11:05:25', '1', '新增客户', 'demo', 'admin', '2', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'form', '0');
INSERT INTO `sys_modal` VALUES ('18', '保险管理', '0', '21', '21', '2019-01-23 18:51:55', '2019-02-16 15:42:25', '0', '保险管理', '', '', '180', '1', '<i class=\"fa fa-home\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('19', '公司模块', '6', '21', '21', '2019-01-24 17:35:59', '2019-01-24 17:41:00', '1', '公司模块', 'sys', 'fs_agp', '200', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'form', '0');
INSERT INTO `sys_modal` VALUES ('20', '公司角色', '6', '37', '37', '2019-01-25 15:46:58', '2019-01-25 15:46:58', '1', '公司角色', 'sys', 'admin_agp', '400', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('21', '相关说明', '0', '21', '21', '2019-01-31 14:59:39', '2019-01-31 15:54:19', '1', '相关说明', 'demo', 'readme', '0', '1', '<i class=\"fa fa-diamond\"></i>', 'URL里其他参数', 'list', '0');
INSERT INTO `sys_modal` VALUES ('22', '简单说明', '21', '21', '21', '2019-01-31 15:07:47', '2019-01-31 15:10:33', '1', '简单说明', 'demo', 'readme', '1', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('23', 'ICON', '5', '21', '21', '2019-01-31 15:51:12', '2019-01-31 15:51:12', '1', 'ICON', 'demo', 'icon', '100', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'form', '0');
INSERT INTO `sys_modal` VALUES ('24', 'sys_error', '6', '21', '21', '2019-02-01 12:38:02', '2019-02-01 12:38:02', '1', '错误日志', 'sys', 'sys_error', '100', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '1');
INSERT INTO `sys_modal` VALUES ('25', '多文件上传', '5', '21', '21', '2019-02-13 17:13:54', '2019-02-13 17:13:54', '1', '文件上传', 'demo', 'demo_upfile', '4', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'form', '0');
INSERT INTO `sys_modal` VALUES ('26', 'TT二次开发说明', '21', '21', '21', '2019-02-14 11:34:34', '2019-02-14 11:34:34', '1', '二次开发教程', 'demo', 'readmedev', '100', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('27', '账户管理', '0', '21', '21', '2019-02-16 14:17:02', '2019-02-16 14:17:02', '1', '账户管理', 'account', 'account', '1', '1', '<i class=\"fa fa-home\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('28', '公司管理', '27', '21', '21', '2019-02-16 14:18:18', '2019-02-16 17:07:17', '1', '公司管理', 'account', 'fs', '100', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('31', '工作任务', '0', '21', '21', '2019-02-18 11:29:10', '2019-02-18 11:29:10', '1', '工作任务', 'ddbx', 'wdrw', '100', '1', '<i class=\"fa fa-home\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('29', '用户管理', '27', '21', '21', '2019-02-16 15:16:29', '2019-02-16 16:30:51', '1', '用户管理', 'account', 'admin', '100', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('30', '会员管理', '27', '21', '21', '2019-02-16 16:13:48', '2019-02-16 16:30:15', '0', '会员管理', 'account', 'admin', '100', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('32', '全部任务', '31', '21', '21', '2019-02-18 11:32:36', '2019-02-18 11:34:19', '1', '全部任务', 'ddbx', 'alltask', '100', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('33', '我的任务', '31', '21', '21', '2019-02-18 11:33:33', '2019-02-18 11:34:09', '1', '我的任务', 'ddbx', 'mytask', '100', '2', '<i class=\"fa fa-home\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('34', '业务模块', '6', '21', '21', '2019-02-21 16:09:46', '2019-02-27 16:22:02', '0', '业务模块', 'sys', 'sys_config', '100', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '2');
INSERT INTO `sys_modal` VALUES ('35', '业务列表', '6', '21', '21', '2019-02-21 17:27:54', '2019-02-27 16:22:09', '0', '业务列表', 'sys', 'sys_config_son', '100', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '2');
INSERT INTO `sys_modal` VALUES ('36', '征信查询', '0', '21', '21', '2019-02-22 13:43:43', '2019-02-22 14:16:40', '0', '征信查询', 'rwcl', 'zxcx', '1', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('38', '开始', '36', '21', '21', '2019-02-22 14:18:59', '2019-02-22 14:18:59', '0', '开始', 'rwcl', 'ks', '1', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('39', '提交查询', '36', '21', '21', '2019-02-22 14:19:42', '2019-02-22 14:19:42', '0', '提交查询', 'rwcl', 'tjcx', '2', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('40', '查询结果', '36', '21', '21', '2019-02-22 14:20:17', '2019-02-22 14:20:17', '0', '查询结果', 'rwcl', 'cxjg', '3', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('41', '完成', '36', '21', '21', '2019-02-22 14:20:48', '2019-02-22 14:20:48', '0', '完成', 'rwcl', 'wc', '4', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('42', '征信通融', '0', '21', '21', '2019-02-22 14:22:13', '2019-02-22 14:22:13', '0', '通融', 'rwcl', 'zxtr', '2', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('43', '申请通融', '42', '21', '21', '2019-02-22 14:23:07', '2019-02-22 14:23:07', '0', '申请通融', 'rwcl', 'sqtr', '5', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('44', '征信员银行意见', '42', '21', '21', '2019-02-22 14:26:16', '2019-02-22 14:26:16', '0', '征信员银行意见', 'rwcl', 'zxyyhyj', '6', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('45', '通融审核', '42', '21', '21', '2019-02-22 14:26:42', '2019-02-22 14:26:42', '0', '通融审核', 'rwcl', 'trsh', '7', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('46', '完成', '42', '21', '21', '2019-02-22 14:27:07', '2019-02-22 14:27:07', '0', '完成', 'rwcl', 'wc', '8', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('47', '车辆评估', '0', '21', '21', '2019-02-22 14:27:43', '2019-02-22 14:27:43', '0', '车辆评估', 'rwcl', 'clpg', '3', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('48', '开始', '47', '21', '21', '2019-02-22 14:31:21', '2019-02-22 14:31:21', '0', '开始', 'rwcl', 'ks', '9', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('49', '提交评估', '47', '21', '21', '2019-02-22 14:31:50', '2019-02-22 14:31:50', '0', '提交评估', 'rwcl', 'tkpg', '10', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('50', '评估价审核', '47', '21', '21', '2019-02-22 14:32:15', '2019-02-22 14:32:15', '0', '评估价审核', 'rwcl', 'pgjsh', '11', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('51', '完成', '47', '21', '21', '2019-02-22 14:32:36', '2019-02-22 14:32:36', '0', '完成', 'rwcl', 'wc', '12', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('52', '银行电审', '0', '21', '21', '2019-02-22 14:33:09', '2019-02-22 14:33:09', '0', '银行电审', 'rwcl', 'yhds', '4', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('53', '开始', '52', '21', '21', '2019-02-22 14:33:36', '2019-02-22 14:33:36', '0', '开始', 'rwcl', 'ks', '13', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('54', '提交电审', '52', '21', '21', '2019-02-22 14:34:04', '2019-02-22 14:34:04', '0', '提交电审', 'rwcl', 'tjds', '14', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('55', '电审结果', '52', '21', '21', '2019-02-22 14:34:28', '2019-02-22 14:34:28', '0', '电审结果', 'rwcl', 'dsjg', '15', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('56', '完成', '52', '21', '21', '2019-02-22 14:36:56', '2019-02-22 14:36:56', '0', '完成', 'rwcl', 'wc', '16', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('57', '开卡申请', '0', '21', '21', '2019-02-22 14:37:22', '2019-02-22 14:37:22', '0', '开卡申请', 'rwcl', 'kksq', '5', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('58', '开始', '57', '21', '21', '2019-02-22 14:37:45', '2019-02-22 14:37:45', '0', '开始', 'rwcl', 'ks', '17', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('59', '提交申请', '57', '21', '21', '2019-02-22 14:38:36', '2019-02-22 14:38:36', '0', '提交申请', 'rwcl', 'tjsq', '18', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('60', '身份核查结果', '57', '21', '21', '2019-02-22 14:39:22', '2019-02-22 14:39:22', '0', '身份核查结果', 'rwcl', 'sfhcjg', '19', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('61', '反馈开卡结果', '57', '21', '21', '2019-02-22 14:39:58', '2019-02-22 14:39:58', '0', '反馈开卡结果', 'rwcl', 'fkkkjg', '20', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('62', '完成', '57', '21', '21', '2019-02-22 14:40:24', '2019-02-22 14:40:24', '0', '完成', 'rwcl', 'wc', '21', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('63', '视频面签', '0', '21', '21', '2019-02-22 14:40:48', '2019-02-22 14:40:48', '0', '视频面签', 'rwcl', 'spmq', '6', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('64', '开始', '63', '21', '21', '2019-02-22 14:41:14', '2019-02-22 14:41:14', '0', '开始', 'rwcl', 'ks', '22', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('65', '提交申请', '63', '21', '21', '2019-02-22 14:41:48', '2019-02-22 14:41:48', '0', '提交申请', 'rwcl', 'tjsq', '23', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('66', '结果反馈', '63', '21', '21', '2019-02-22 14:42:13', '2019-02-22 14:42:13', '0', '结果反馈', 'rwcl', 'jgfk', '24', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('67', '完成', '63', '21', '21', '2019-02-22 14:42:28', '2019-02-22 14:42:28', '0', '完成', 'rwcl', 'wc', '25', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('68', '跨区域业务审批', '0', '21', '21', '2019-02-22 14:43:41', '2019-02-22 14:43:41', '0', '跨区域业务审批', 'rwcl', 'kqyywsp', '7', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('70', '汽车贷款', '0', '21', '21', '2019-02-22 14:48:30', '2019-02-22 14:48:30', '0', '汽车贷款', 'rwcl', 'qcdk', '8', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('71', '开始', '70', '21', '21', '2019-02-22 14:48:53', '2019-02-22 14:48:53', '0', '开始', 'rwcl', 'ks', '31', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('72', '专员审核中', '70', '21', '21', '2019-02-22 14:49:15', '2019-02-22 14:49:15', '0', '专员审核中', 'rwcl', 'zyshz', '32', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('73', '专员审核结果', '70', '21', '21', '2019-02-22 14:49:41', '2019-02-22 14:49:41', '0', '专员审核结果', 'rwcl', 'zyshjg', '33', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('74', '主管审核中', '70', '21', '21', '2019-02-22 14:50:04', '2019-02-22 14:50:04', '0', '主管审核中', 'rwcl', 'zgshz', '34', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('75', '主管审核结果', '70', '21', '21', '2019-02-22 14:50:26', '2019-02-22 14:50:26', '0', '主管审核结果', 'rwcl', 'zgshjg', '35', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('76', '经理审核中', '70', '21', '21', '2019-02-22 14:50:46', '2019-02-22 14:50:46', '0', '经理审核中', 'rwcl', 'jlshz', '36', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('77', '经理审核结果', '70', '21', '21', '2019-02-22 14:51:09', '2019-02-22 14:51:09', '0', '经理审核结果', 'rwcl', 'jlshjg', '37', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('78', '总监审核中', '70', '21', '21', '2019-02-22 14:51:34', '2019-02-22 14:51:34', '0', '总监审核中', 'rwcl', 'zjshz', '38', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('79', '总监审核结果', '70', '21', '21', '2019-02-22 14:51:59', '2019-02-22 14:51:59', '0', '总监审核结果', 'rwcl', 'zjshjg', '39', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('80', '完成', '70', '21', '21', '2019-02-22 14:52:19', '2019-02-22 14:52:19', '0', '完成', 'rwcl', 'wc', '40', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('81', '内审通融', '0', '21', '21', '2019-02-22 14:53:01', '2019-02-22 14:53:01', '0', '内审通融', 'rwcl', 'nstr', '9', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('82', '开始', '81', '21', '21', '2019-02-22 14:53:24', '2019-02-22 14:53:24', '0', '开始', 'rwcl', 'ks', '41', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('83', '合作商总经理申请通融', '81', '21', '21', '2019-02-22 14:54:16', '2019-02-22 14:54:16', '0', '合作商总经理申请通融', 'rwcl', 'hzssqtr', '42', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('84', '审核员通融审核意见反馈', '81', '21', '21', '2019-02-22 14:54:46', '2019-02-22 14:54:46', '0', '审核员通融审核意见反馈', 'rwcl', 'tryjfk', '43', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('85', '通融主管', '81', '21', '21', '2019-02-22 14:55:11', '2019-02-22 14:55:11', '0', '通融主管', 'rwcl', 'trzg', '44', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('86', '通融经理', '81', '21', '21', '2019-02-22 14:55:33', '2019-02-22 14:55:33', '0', '通融经理', 'rwcl', 'trjl', '45', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('87', '完成', '81', '21', '21', '2019-02-22 14:55:52', '2019-02-22 14:55:52', '0', '完成', 'rwcl', 'wc', '46', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('88', '资金分配', '0', '21', '21', '2019-02-22 14:56:24', '2019-02-22 14:56:24', '0', '资金分配', 'rwcl', 'zjfp', '10', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('89', '开始', '88', '21', '21', '2019-02-22 14:56:49', '2019-02-22 14:56:49', '0', '开始', 'rwcl', 'ks', '47', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('90', '确认申请垫资', '88', '21', '21', '2019-02-22 14:58:22', '2019-02-22 14:58:22', '0', '确认申请垫资', 'rwcl', 'qrsqdz', '48', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('91', '资金分配', '88', '21', '21', '2019-02-22 14:58:46', '2019-02-22 14:58:46', '0', '资金分配', 'rwcl', 'zjfp', '49', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('92', '出账', '88', '21', '21', '2019-02-22 14:59:11', '2019-02-22 14:59:11', '0', '出账', 'rwcl', 'cz', '50', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('93', '实收录入-出纳', '88', '21', '21', '2019-02-22 14:59:39', '2019-02-22 14:59:39', '0', '实收录入-出纳', 'rwcl', 'cn', '51', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('94', '公司财务确认到账', '88', '21', '21', '2019-02-22 15:02:30', '2019-02-22 15:02:30', '0', '公司财务确认到账', 'rwcl', 'qrdz', '52', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('95', '等待银行审批', '88', '21', '21', '2019-02-22 15:03:00', '2019-02-22 15:03:00', '0', '等待银行审批', 'rwcl', 'ddyhsp', '53', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('96', '等待抵押完成', '88', '21', '21', '2019-02-22 15:04:13', '2019-02-22 15:04:13', '0', '等待抵押完成', 'rwcl', 'ddyywc', '54', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('97', '完成', '88', '21', '21', '2019-02-22 15:04:55', '2019-02-22 15:04:55', '0', '完成', 'rwcl', 'wc', '55', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('98', '银行贷款申请', '0', '21', '21', '2019-02-22 15:06:08', '2019-02-22 15:06:08', '0', '银行贷款申请', 'rwcl', 'yhdksq', '11', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('99', '银行贷款申请开始', '98', '21', '21', '2019-02-22 15:06:47', '2019-02-22 15:06:47', '0', '银行贷款申请开始', 'rwcl', 'ks', '56', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('100', '合作商寄送材料', '98', '21', '21', '2019-02-22 15:07:16', '2019-02-22 15:07:16', '0', '合作商寄送材料', 'rwcl', 'hzsjscl', '57', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('101', '公司收件确认', '98', '21', '21', '2019-02-22 15:07:39', '2019-02-22 15:07:39', '0', '公司收件确认', 'rwcl', 'gssjqr', '58', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('102', '银行收件确认', '98', '21', '21', '2019-02-22 15:08:07', '2019-02-22 15:08:07', '0', '银行收件确认', 'rwcl', 'yhsjqr', '59', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('103', '银行审批结果', '98', '21', '21', '2019-02-22 15:09:49', '2019-02-22 15:09:49', '0', '银行审批结果', 'rwcl', 'yhspjg', '60', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('104', '银行放款结果', '98', '21', '21', '2019-02-22 15:10:10', '2019-02-22 15:10:10', '0', '银行放款结果', 'rwcl', 'yhfkjg', '61', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('105', '收款确认', '98', '21', '21', '2019-02-22 15:10:31', '2019-02-22 15:10:31', '0', '收款确认', 'rwcl', 'skqr', '62', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('106', '补充材料确认', '98', '21', '21', '2019-02-22 15:10:58', '2019-02-22 15:10:58', '0', '补充材料确认', 'rwcl', 'bcclqr', '63', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('107', '补充材料', '98', '21', '21', '2019-02-22 15:11:22', '2019-02-22 15:11:22', '0', '补充材料', 'rwcl', 'bccl', '64', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('108', '完成', '98', '21', '21', '2019-02-22 15:11:40', '2019-02-22 15:11:40', '0', '完成', 'rwcl', 'wc', '65', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('109', '公司归档', '0', '21', '21', '2019-02-22 15:12:07', '2019-02-22 15:12:07', '0', '公司归档', 'rwcl', 'gsgd', '12', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('110', '开始', '109', '21', '21', '2019-02-22 15:12:27', '2019-02-22 15:12:27', '0', '开始', 'rwcl', 'ks', '66', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('111', '公司纸质归档', '109', '21', '21', '2019-02-22 15:12:54', '2019-02-22 15:12:54', '0', '公司纸质归档', 'rwcl', 'gszzgd', '67', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('112', '纸质归档', '109', '21', '21', '2019-02-22 15:13:15', '2019-02-22 15:13:15', '0', '纸质归档', 'rwcl', 'zzgd', '68', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('113', '审核员补资料', '109', '21', '21', '2019-02-22 15:13:42', '2019-02-22 15:13:42', '0', '审核员补资料', 'rwcl', 'shybzl', '69', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('114', '行政入库', '109', '21', '21', '2019-02-22 15:14:05', '2019-02-22 15:14:05', '0', '行政入库', 'rwcl', 'xzrk', '70', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('115', '完成', '109', '21', '21', '2019-02-22 15:14:25', '2019-02-22 15:14:25', '0', '完成', 'rwcl', 'wc', '71', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('116', '抵押归档', '0', '21', '21', '2019-02-22 15:19:35', '2019-02-22 15:19:35', '0', '抵押归档', 'rwcl', 'dygd', '13', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('117', '开始', '116', '21', '21', '2019-02-22 15:20:03', '2019-02-22 15:20:03', '0', '开始', 'rwcl', 'ks', '72', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('118', '公证记录', '116', '21', '21', '2019-02-22 15:20:25', '2019-02-22 15:20:25', '0', '公证记录', 'rwcl', 'gzjl', '73', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('119', '抵押材料寄送至合作商', '116', '21', '21', '2019-02-22 15:20:54', '2019-02-22 15:20:54', '0', '抵押材料寄送至合作商', 'rwcl', 'dycljs', '74', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('120', '合作商收件确认', '116', '21', '21', '2019-02-22 15:21:29', '2019-02-22 15:21:29', '0', '合作商收件确认', 'rwcl', 'hzssjqr', '75', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('121', '抵押情况记录', '116', '21', '21', '2019-02-22 15:21:58', '2019-02-22 15:21:58', '0', '抵押情况记录', 'rwcl', 'dyqkjl', '76', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('122', '抵押材料寄回', '116', '21', '21', '2019-02-22 15:22:21', '2019-02-22 15:22:21', '0', '抵押材料寄回', 'rwcl', 'dycljh', '77', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('123', '审核收件确认', '116', '21', '21', '2019-02-22 15:22:42', '2019-02-22 15:22:42', '0', '审核收件确认', 'rwcl', 'shsjqr', '78', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('124', '抵押材料至银行', '116', '21', '21', '2019-02-22 15:23:16', '2019-02-22 15:23:16', '0', '抵押材料至银行', 'rwcl', 'dyclzyh', '79', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('125', '银行收件确认', '116', '21', '21', '2019-02-22 15:23:41', '2019-02-22 15:23:41', '0', '银行收件确认', 'rwcl', 'yhsjqr', '80', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('126', '录入银行查验情况', '116', '21', '21', '2019-02-22 15:24:06', '2019-02-22 15:24:06', '0', '录入银行查验情况', 'rwcl', 'lryhcyqk', '81', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('127', '完成', '116', '21', '21', '2019-02-22 15:24:19', '2019-02-22 15:24:19', '0', '完成', 'rwcl', 'wc', '82', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('128', '业务信息修改', '0', '21', '21', '2019-02-22 15:24:46', '2019-02-22 15:24:46', '0', '业务信息修改', 'rwcl', 'ywxxxg', '14', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('129', '开始', '128', '21', '21', '2019-02-22 15:25:07', '2019-02-22 15:25:07', '0', '开始', 'rwcl', 'ks', '83', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('130', '业务管理部', '128', '21', '21', '2019-02-22 15:25:30', '2019-02-22 15:25:30', '0', '业务管理部', 'rwcl', 'ywglb', '84', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('131', '系统运维（专员）', '128', '21', '21', '2019-02-22 15:25:48', '2019-02-22 15:25:48', '0', '系统运维（专员）', 'rwcl', 'xtyw', '85', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('132', '完成', '128', '21', '21', '2019-02-22 15:26:06', '2019-02-22 15:26:06', '0', '完成', 'rwcl', 'wc', '86', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('133', '退单退费', '0', '21', '21', '2019-02-22 15:26:34', '2019-02-22 15:26:34', '0', '退单退费', 'rwcl', 'tdtf', '15', '1', '<i class=\"fa fa-home\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('134', '开始', '133', '21', '21', '2019-02-22 15:26:56', '2019-02-22 15:26:56', '0', '开始', 'rwcl', 'ks', '87', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('135', '审核员退单审核', '133', '21', '21', '2019-02-22 15:27:21', '2019-02-22 15:43:58', '0', '审核员退单审核', 'rwcl', 'shytdsh', '89', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('136', '退单数据修正', '133', '21', '21', '2019-02-22 15:27:47', '2019-02-22 15:44:13', '0', '退单数据修正', 'rwcl', 'tdsjxz', '90', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('137', '审核经理退单审核', '133', '21', '21', '2019-02-22 15:28:10', '2019-02-22 15:44:27', '0', '审核经理退单审核', 'rwcl', 'jltdsh', '91', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('138', '合作商回款缴费', '133', '21', '21', '2019-02-22 15:28:36', '2019-02-22 15:44:35', '0', '合作商回款缴费', 'rwcl', 'hzshkjf', '92', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('139', '公司确认到账', '133', '21', '21', '2019-02-22 15:29:02', '2019-02-22 15:44:49', '0', '公司确认到账', 'rwcl', 'gsqrdz', '93', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('140', '材料寄回', '133', '21', '21', '2019-02-22 15:29:22', '2019-02-22 15:45:01', '0', '材料寄回', 'rwcl', 'cljh', '94', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('141', '合作商收件确认', '133', '21', '21', '2019-02-22 15:29:47', '2019-02-22 15:45:07', '0', '合作商收件确认', 'rwcl', 'hzssjqr', '95', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('142', '退单退费申请', '133', '21', '21', '2019-02-22 15:43:37', '2019-02-22 15:43:37', '0', '退单退费申请', 'rwcl', 'tdtfsq', '88', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('143', '完成', '133', '21', '21', '2019-02-22 15:45:29', '2019-02-22 15:45:29', '0', '完成', 'rwcl', 'wc', '96', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', '', '0');
INSERT INTO `sys_modal` VALUES ('144', '进件模块', '0', '21', '21', '2019-02-25 09:47:46', '2019-02-25 09:47:46', '1', '进件模块', 'into_modal', 'into_modal', '100', '1', '<i class=\"fa fa-home\"></i>', '', 'list', '0');
INSERT INTO `sys_modal` VALUES ('145', '征信查询', '144', '21', '21', '2019-02-25 09:48:51', '2019-02-25 09:48:51', '1', '征信查询', 'into_modal', 'zxcx', '100', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list', '0');

-- ----------------------------
-- Table structure for sys_modal_superadmin
-- ----------------------------
DROP TABLE IF EXISTS `sys_modal_superadmin`;
CREATE TABLE `sys_modal_superadmin` (
  `id` int(4) NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_modal_superadmin
-- ----------------------------
INSERT INTO `sys_modal_superadmin` VALUES ('0', '公开模块');
INSERT INTO `sys_modal_superadmin` VALUES ('1', '超级管理模块');
INSERT INTO `sys_modal_superadmin` VALUES ('2', '普通内部模块');

-- ----------------------------
-- Table structure for sys_session
-- ----------------------------
DROP TABLE IF EXISTS `sys_session`;
CREATE TABLE `sys_session` (
  `idmd5` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lastdt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `outip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logdt` int(11) DEFAULT '0',
  `outdt` int(11) DEFAULT '0',
  PRIMARY KEY (`idmd5`) USING BTREE,
  KEY `outdt` (`outdt`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_session
-- ----------------------------
INSERT INTO `sys_session` VALUES ('008b6fbe9cb15ad4ce45453c30311d2d', '21', '2019-01-21 17:01:11', '127.0.0.1', '127.0.0.1', '1548061156', '1548061271');
INSERT INTO `sys_session` VALUES ('00f4277df6130e0fdf7fd6a1df297049', '21', '2019-01-25 14:09:51', '127.0.0.1', '127.0.0.1', '1548396476', '1548396591');
INSERT INTO `sys_session` VALUES ('013b3e699ec6421a225c5a3e8de1a3e2', '21', '2019-01-22 11:03:46', '127.0.0.1', '127.0.0.1', '1548126112', '1548126226');
INSERT INTO `sys_session` VALUES ('018e72c8d6e6e61245e44e62d64946c9', '37', '2019-01-30 17:12:56', '127.0.0.1', null, '1548839576', '0');
INSERT INTO `sys_session` VALUES ('01fb562dcc6e43c14006a0e14c156cd6', '21', '2019-02-26 11:58:13', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551152229', '1551153493');
INSERT INTO `sys_session` VALUES ('027b72c2fe1d289ac672e459561178c8', '21', '2019-03-01 13:43:27', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551409152', '1551419007');
INSERT INTO `sys_session` VALUES ('02c3f9a3ff1ba4d6312b9af0847e1bcb', '31', '2019-01-29 15:33:11', '127.0.0.1', '127.0.0.1', '1548747112', '1548747191');
INSERT INTO `sys_session` VALUES ('02c5a6f9e942116f86b796b43189ccc5', '21', '2019-01-16 17:22:42', '127.0.0.1', '127.0.0.1', '1547630516', '1547630562');
INSERT INTO `sys_session` VALUES ('04098c4d177316170f14bccd712ff292', '21', '2019-01-20 21:48:29', '127.0.0.1', '127.0.0.1', '1547992071', '1547992109');
INSERT INTO `sys_session` VALUES ('04134b76380e278288548db377d29015', '21', '2019-02-27 17:26:19', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551258951', '1551259579');
INSERT INTO `sys_session` VALUES ('0448b8c76e32159b65e492ead35b85ab', '37', '2019-01-28 11:33:32', '127.0.0.1', '127.0.0.1', '1548646360', '1548646412');
INSERT INTO `sys_session` VALUES ('045d92d5bc9bf5ac67afeb83e77fa0df', '21', '2019-01-19 17:55:21', '127.0.0.1', '127.0.0.1', '1547891667', '1547891721');
INSERT INTO `sys_session` VALUES ('04c1b13b90c6fd5f4b45cabd96221bcc', '21', '2019-01-16 19:37:23', '127.0.0.1', '127.0.0.1', '1547638393', '1547638643');
INSERT INTO `sys_session` VALUES ('04fc958913888152ab65a45209ad2424', '37', '2019-01-25 17:22:51', '127.0.0.1', '127.0.0.1', '1548408146', '1548408171');
INSERT INTO `sys_session` VALUES ('0541f7d1a07b40958cdd169a9e49827f', '21', '2019-01-20 21:47:51', '127.0.0.1', '127.0.0.1', '1547991994', '1547992071');
INSERT INTO `sys_session` VALUES ('055c7108bc3f7cac707d071780e318bb', '21', '2019-01-21 11:11:44', '127.0.0.1', '127.0.0.1', '1548040099', '1548040304');
INSERT INTO `sys_session` VALUES ('05a2a4b3778e50af5ddaadad6c3919cb', '21', '2019-02-13 14:04:02', '127.0.0.1', '127.0.0.1', '1550037814', '1550037842');
INSERT INTO `sys_session` VALUES ('05fa215f23035da05229410616c6ef05', '21', '2019-01-20 22:01:33', '127.0.0.1', '127.0.0.1', '1547992873', '1547992893');
INSERT INTO `sys_session` VALUES ('060c9ed97a559b1e0d693fbf942cedc8', '21', '2019-01-16 15:59:51', '127.0.0.1', '127.0.0.1', '1547625419', '1547625591');
INSERT INTO `sys_session` VALUES ('06274208dab12e4403a338eb78d29406', '21', '2019-01-26 13:59:10', '127.0.0.1', '127.0.0.1', '1548481839', '1548482350');
INSERT INTO `sys_session` VALUES ('065a89eae8b65745bd1ba2cfbfc90624', '21', '2019-01-20 22:01:13', '127.0.0.1', '127.0.0.1', '1547992812', '1547992873');
INSERT INTO `sys_session` VALUES ('069c8c9f5e8378693ff0df093a6765fd', '37', '2019-01-25 17:11:00', '127.0.0.1', '127.0.0.1', '1548407114', '1548407460');
INSERT INTO `sys_session` VALUES ('06b10f9296b4355bebb1949a28d6c022', '21', '2019-01-16 21:28:07', '127.0.0.1', '127.0.0.1', '1547645083', '1547645287');
INSERT INTO `sys_session` VALUES ('0700a760cd0795a87753519165e60425', '37', '2019-01-28 15:21:42', '127.0.0.1', '127.0.0.1', '1548659738', '1548660102');
INSERT INTO `sys_session` VALUES ('073638ca4637ef00cf2d51f941bb193a', '21', '2019-02-01 11:13:37', '127.0.0.1', '127.0.0.1', '1548990420', '1548990817');
INSERT INTO `sys_session` VALUES ('0777aa1ba8c5d1351505ddb327e9eb08', '21', '2019-01-21 11:52:42', '127.0.0.1', '127.0.0.1', '1548042690', '1548042762');
INSERT INTO `sys_session` VALUES ('07865b7ffa7effcae1545b28efcb76d8', '21', '2019-01-19 13:41:35', '127.0.0.1', '127.0.0.1', '1547876413', '1547876495');
INSERT INTO `sys_session` VALUES ('078c4e6626b0c1f183ccd3391ee28204', '21', '2019-01-19 21:34:01', '127.0.0.1', '127.0.0.1', '1547904721', '1547904841');
INSERT INTO `sys_session` VALUES ('0798ecd7d4a5267fa110519dbf3525d1', '21', '2019-02-28 10:26:26', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551320664', '1551320786');
INSERT INTO `sys_session` VALUES ('07dd0aae286690b888b9b7e6257f9666', '21', '2019-01-25 14:40:48', '127.0.0.1', '127.0.0.1', '1548398418', '1548398448');
INSERT INTO `sys_session` VALUES ('07de1662d3978523d2f4a55b012d6d32', '21', '2019-02-13 14:48:42', '127.0.0.1', '127.0.0.1', '1550039963', '1550040522');
INSERT INTO `sys_session` VALUES ('093c8e303c2e27535348072fe5f6e345', '21', '2019-01-26 16:46:57', '127.0.0.1', '127.0.0.1', '1548482350', '1548492417');
INSERT INTO `sys_session` VALUES ('0991e6b1d631122fad2cd11a584a1ad8', '21', '2019-01-24 10:08:21', '127.0.0.1', '127.0.0.1', '1548295049', '1548295701');
INSERT INTO `sys_session` VALUES ('09b94a883b1bdbca15be5a2854ea4ccb', '21', '2019-01-24 18:01:22', '127.0.0.1', '127.0.0.1', '1548324045', '1548324082');
INSERT INTO `sys_session` VALUES ('0a47f9b47d817ed16b93ed3e3cd3b2c7', '21', '2019-01-16 15:51:56', '127.0.0.1', '127.0.0.1', '1547624966', '1547625116');
INSERT INTO `sys_session` VALUES ('0a60cecdfabe47c5608510cd27d743a2', '37', '2019-01-28 10:50:44', '127.0.0.1', '127.0.0.1', '1548642538', '1548643844');
INSERT INTO `sys_session` VALUES ('0b1e106d13e19355cb135b800f031065', '21', '2019-01-23 14:33:56', '127.0.0.1', '127.0.0.1', '1548225083', '1548225236');
INSERT INTO `sys_session` VALUES ('0b1effe26ce2a24c8c347cd90c1c3d6c', '21', '2019-01-26 11:33:33', '127.0.0.1', '127.0.0.1', '1548473120', '1548473613');
INSERT INTO `sys_session` VALUES ('0b9394924e8c8f00eabc95a96826fa28', '21', '2019-01-19 14:54:16', '127.0.0.1', '127.0.0.1', '1547880820', '1547880856');
INSERT INTO `sys_session` VALUES ('0ba4a2370a2bfd693d2d665c1face79b', '21', '2019-01-25 18:08:43', '127.0.0.1', '127.0.0.1', '1548410826', '1548410923');
INSERT INTO `sys_session` VALUES ('0c4e419f515595a5cbef7221fdcaffcf', '21', '2019-01-22 20:15:25', '127.0.0.1', '127.0.0.1', '1548158094', '1548159325');
INSERT INTO `sys_session` VALUES ('0c7915989e10db673684a41c0bfaf8b7', '21', '2019-02-14 11:33:53', '127.0.0.1', '127.0.0.1', '1550049929', '1550115233');
INSERT INTO `sys_session` VALUES ('0cf0f320358aea6ce1bcf9586bdb5372', '21', '2019-01-24 21:01:10', '127.0.0.1', '127.0.0.1', '1548333848', '1548334870');
INSERT INTO `sys_session` VALUES ('0d583d15bee9e30c06c1c19dc44ebcf0', '21', '2019-01-23 14:45:18', '127.0.0.1', '127.0.0.1', '1548225897', '1548225918');
INSERT INTO `sys_session` VALUES ('0d609b99918ccad375a7d3a8a1a2affc', '21', '2019-01-25 10:18:18', '127.0.0.1', '127.0.0.1', '1548380472', '1548382698');
INSERT INTO `sys_session` VALUES ('0d6b1409c752a708ee8f3cd118242e11', '21', '2019-01-31 15:30:08', '127.0.0.1', '127.0.0.1', '1548919585', '1548919807');
INSERT INTO `sys_session` VALUES ('0dcf06329ad0ba17d7449cc1c29ed591', '21', '2019-02-27 13:34:06', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551239454', '1551245646');
INSERT INTO `sys_session` VALUES ('0e9f87386a6faa592f8ea4aca7ccbb2e', '37', '2019-01-25 17:22:01', '127.0.0.1', '127.0.0.1', '1548407460', '1548408121');
INSERT INTO `sys_session` VALUES ('0ede20ee11202053ae1de152e9c1393a', '21', '2019-01-21 16:51:13', '127.0.0.1', '127.0.0.1', '1548060473', '1548060673');
INSERT INTO `sys_session` VALUES ('0f1292178fb5c412ad47a3a96d2476a2', '37', '2019-01-25 15:16:44', '127.0.0.1', '127.0.0.1', '1548400307', '1548400604');
INSERT INTO `sys_session` VALUES ('0f6f9681a34152b3f5c3adf1e1f981c0', '21', '2019-01-17 13:40:01', '127.0.0.1', '127.0.0.1', '1547703504', '1547703601');
INSERT INTO `sys_session` VALUES ('0ffe30b62886be16e1d55e72efe0fd25', '21', '2019-02-18 16:22:00', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550475474', '1550478120');
INSERT INTO `sys_session` VALUES ('1079fe93a32184a3598edca4607a96e7', '21', '2019-02-14 11:35:05', '127.0.0.1', '127.0.0.1', '1550115233', '1550115305');
INSERT INTO `sys_session` VALUES ('10819c3b2d3ffc1ac9e4b3e8bba74dfa', '21', '2019-02-12 10:41:19', '127.0.0.1', '127.0.0.1', '1549938624', '1549939279');
INSERT INTO `sys_session` VALUES ('10bfbba4fc3e3ec9bc8f409aa1ee2e1d', '21', '2019-01-23 15:03:25', '127.0.0.1', '127.0.0.1', '1548226346', '1548227005');
INSERT INTO `sys_session` VALUES ('10f8ad4ad99d72fae388f0560089c2c3', '21', '2019-01-16 15:56:59', '127.0.0.1', '127.0.0.1', '1547625391', '1547625419');
INSERT INTO `sys_session` VALUES ('10fcd56474aec164c2b68edc1a541cc5', '21', '2019-01-21 13:11:19', '127.0.0.1', '127.0.0.1', '1548047310', '1548047479');
INSERT INTO `sys_session` VALUES ('1159732b149f1be9fd0ca1a092c75bc2', '21', '2019-01-19 13:40:13', '127.0.0.1', '127.0.0.1', '1547876325', '1547876413');
INSERT INTO `sys_session` VALUES ('11a3945ba317470655ca9dac1a2faa72', '21', '2019-02-11 16:23:46', '127.0.0.1', '127.0.0.1', '1549873014', '1549873426');
INSERT INTO `sys_session` VALUES ('11cee33681ee6eda299ecb33ac1b98bd', '21', '2019-02-13 14:49:24', '127.0.0.1', '127.0.0.1', '1550040522', '1550040564');
INSERT INTO `sys_session` VALUES ('125121fd037d93db801024085761cac0', '37', '2019-01-29 10:59:46', '127.0.0.1', '127.0.0.1', '1548730676', '1548730786');
INSERT INTO `sys_session` VALUES ('136074729e652668ea9b7fbddf440a8e', '21', '2019-01-16 17:41:53', '127.0.0.1', '127.0.0.1', '1547631353', '1547631713');
INSERT INTO `sys_session` VALUES ('13636fa9867b2df8097ebd411b4bac71', '21', '2019-01-26 12:28:02', '127.0.0.1', '127.0.0.1', '1548476793', '1548476882');
INSERT INTO `sys_session` VALUES ('1392ffaa057d4eb9da6d2aa3beba810d', '21', '2019-02-25 11:47:05', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551064099', '1551066425');
INSERT INTO `sys_session` VALUES ('13eb3823b6e9ffb49092bc63151dfafa', '21', '2019-01-17 13:14:36', '127.0.0.1', '127.0.0.1', '1547702040', '1547702076');
INSERT INTO `sys_session` VALUES ('142979ce43d69672e797be495aeaf4bd', '21', '2019-01-16 21:34:20', '127.0.0.1', '127.0.0.1', '1547645602', '1547645660');
INSERT INTO `sys_session` VALUES ('1447e7444a1a9d4f620489c023f6671c', '21', '2019-01-19 14:53:40', '127.0.0.1', '127.0.0.1', '1547880752', '1547880820');
INSERT INTO `sys_session` VALUES ('146196dcbc464b30a86758f33c2db8b7', '21', '2019-01-31 15:05:48', '127.0.0.1', '127.0.0.1', '1548917934', '1548918348');
INSERT INTO `sys_session` VALUES ('146a327a8b8e50b55637f5dfd9fa1c58', '21', '2019-01-16 17:04:55', '127.0.0.1', '127.0.0.1', '1547629495', '1547629495');
INSERT INTO `sys_session` VALUES ('14b498d5e6e68412d099e72f2d3599f1', '21', '2019-01-24 19:04:05', '127.0.0.1', '127.0.0.1', '1548324453', '1548327845');
INSERT INTO `sys_session` VALUES ('14c7664daaebab5b7bda2c266a42a61d', '21', '2019-02-11 16:16:54', '127.0.0.1', '127.0.0.1', '1549871838', '1549873014');
INSERT INTO `sys_session` VALUES ('15485501d359f65d497a44fdbcf0790e', '21', '2019-01-25 13:45:17', '127.0.0.1', '127.0.0.1', '1548395080', '1548395117');
INSERT INTO `sys_session` VALUES ('1566fee291e715503a7f777eb3887688', '21', '2019-01-26 12:18:34', '127.0.0.1', '127.0.0.1', '1548476030', '1548476314');
INSERT INTO `sys_session` VALUES ('15a5109cd38c67f7173a8bd232381faa', '21', '2019-01-19 21:36:39', '127.0.0.1', '127.0.0.1', '1547904911', '1547904999');
INSERT INTO `sys_session` VALUES ('16a531fd982d37e9bc67714320edcd53', '21', '2019-01-19 17:51:08', '127.0.0.1', '127.0.0.1', '1547891382', '1547891468');
INSERT INTO `sys_session` VALUES ('17cca7d1e70f916ec21fe5e5be9096eb', '37', '2019-01-25 15:20:06', '127.0.0.1', '127.0.0.1', '1548400693', '1548400806');
INSERT INTO `sys_session` VALUES ('17ceae06bef36bf743c42c817af0024d', '21', '2019-02-11 13:06:53', '127.0.0.1', '127.0.0.1', '1549860109', '1549861613');
INSERT INTO `sys_session` VALUES ('17d8790f7d339aafc37906e8c729f87d', '21', '2019-01-17 13:57:48', '127.0.0.1', '127.0.0.1', '1547704631', '1547704668');
INSERT INTO `sys_session` VALUES ('17debd078ad4fb4614e835b2610da871', '21', '2019-02-01 15:29:29', '127.0.0.1', '127.0.0.1', '1549005173', '1549006169');
INSERT INTO `sys_session` VALUES ('180bcf9764f6b0d7eaf9c06f6532ecb1', '21', '2019-01-22 20:29:10', '127.0.0.1', '127.0.0.1', '1548159964', '1548160150');
INSERT INTO `sys_session` VALUES ('18ac30fcdf95a2c501212292f28a7bd2', '21', '2019-01-17 14:32:49', '127.0.0.1', '127.0.0.1', '1547706689', '1547706769');
INSERT INTO `sys_session` VALUES ('18c413a1b27955b666e66ee2629074ac', '21', '2019-01-24 11:55:37', '127.0.0.1', '127.0.0.1', '1548301902', '1548302137');
INSERT INTO `sys_session` VALUES ('18cebdaade5814dfc58d13db049c4908', '21', '2019-01-21 11:47:55', '127.0.0.1', '127.0.0.1', '1548042356', '1548042475');
INSERT INTO `sys_session` VALUES ('18d067cacbb3809883038eb8fb319b24', '21', '2019-01-16 17:28:28', '127.0.0.1', '127.0.0.1', '1547630768', '1547630908');
INSERT INTO `sys_session` VALUES ('19186fe667545192144d2f91320c3eb5', '21', '2019-01-23 17:31:05', '127.0.0.1', '127.0.0.1', '1548235746', '1548235865');
INSERT INTO `sys_session` VALUES ('1957bdd7cd869102f2e6b9054293928e', '21', '2019-01-17 14:44:02', '127.0.0.1', '127.0.0.1', '1547707379', '1547707442');
INSERT INTO `sys_session` VALUES ('198bfaba894f788c43580d451772be73', '21', '2019-01-24 11:37:47', '127.0.0.1', '127.0.0.1', '1548300443', '1548301067');
INSERT INTO `sys_session` VALUES ('199da1bb19af5ee97983bca4ccf172d2', '21', '2019-01-20 00:40:09', '127.0.0.1', '127.0.0.1', '1547904999', '1547916009');
INSERT INTO `sys_session` VALUES ('19d21db42884804015df12ef68274173', '21', '2019-01-16 17:13:14', '127.0.0.1', '127.0.0.1', '1547629859', '1547629994');
INSERT INTO `sys_session` VALUES ('1a44a82d2b97674a8f31bf13df878488', '21', '2019-01-24 11:49:40', '127.0.0.1', '127.0.0.1', '1548301067', '1548301780');
INSERT INTO `sys_session` VALUES ('1acf7779f1b47c4c9ee693650bec1ebb', '21', '2019-01-16 16:55:25', '127.0.0.1', '127.0.0.1', '1547628914', '1547628925');
INSERT INTO `sys_session` VALUES ('1c042189a5154a1805a809de02d792e5', '21', '2019-01-21 09:50:40', '127.0.0.1', '127.0.0.1', '1548035263', '1548035440');
INSERT INTO `sys_session` VALUES ('1c134c4b86e029929b151a2de1ebc704', '21', '2019-01-23 17:59:47', '127.0.0.1', '127.0.0.1', '1548237306', '1548237587');
INSERT INTO `sys_session` VALUES ('1c348473780f9a7eb0f27e962f8c6fa3', '21', '2019-01-24 11:51:42', '127.0.0.1', '127.0.0.1', '1548301780', '1548301902');
INSERT INTO `sys_session` VALUES ('1c6dd07c61a851cccd56821135938427', '21', '2019-01-22 10:10:50', '127.0.0.1', '127.0.0.1', '1548121989', '1548123050');
INSERT INTO `sys_session` VALUES ('1cb515bc1243f8b95d6122c066d49f51', '21', '2019-01-21 13:28:19', '127.0.0.1', '127.0.0.1', '1548048110', '1548048499');
INSERT INTO `sys_session` VALUES ('1cb9ec7356c09c53fecc9c239a016769', '37', '2019-01-25 15:31:13', '127.0.0.1', '127.0.0.1', '1548401446', '1548401473');
INSERT INTO `sys_session` VALUES ('1cdcad646f711d1c4c71dc5b6b2a2bab', '21', '2019-01-31 16:58:33', '127.0.0.1', '127.0.0.1', '1548925030', '1548925113');
INSERT INTO `sys_session` VALUES ('1d5511daccb0783abcc9646d9df6c856', '21', '2019-01-17 14:50:59', '127.0.0.1', '127.0.0.1', '1547707442', '1547707859');
INSERT INTO `sys_session` VALUES ('1ddbca946aec4f046226577faec46d94', '31', '2019-01-29 15:14:26', '127.0.0.1', '127.0.0.1', '1548745760', '1548746066');
INSERT INTO `sys_session` VALUES ('1de40e8e4c0ac955f79e6d36ff169b84', '48', '2019-02-18 11:17:28', '0:0:0:0:0:0:0:1', null, '1550459848', '0');
INSERT INTO `sys_session` VALUES ('1ded0358a95136b6451075050e8409aa', '31', '2019-01-29 15:43:23', '127.0.0.1', '127.0.0.1', '1548747572', '1548747803');
INSERT INTO `sys_session` VALUES ('1e1e198b30611004fb1744f8ac1028ba', '21', '2019-02-01 13:47:38', '127.0.0.1', '127.0.0.1', '1548999959', '1549000058');
INSERT INTO `sys_session` VALUES ('1e6b7f9e4762f8e908e6bb8499b90141', '21', '2019-01-24 19:50:12', '127.0.0.1', '127.0.0.1', '1548330483', '1548330612');
INSERT INTO `sys_session` VALUES ('1e770f7bfae3765d1bbf9ed53871b88a', '21', '2019-01-19 17:52:46', '127.0.0.1', '127.0.0.1', '1547891562', '1547891566');
INSERT INTO `sys_session` VALUES ('1eddaa839f50275f9938657584824a64', '21', '2019-01-24 20:15:12', '127.0.0.1', '127.0.0.1', '1548331801', '1548332112');
INSERT INTO `sys_session` VALUES ('1ef03142f5f8f5e9f23695ff0af1409f', '21', '2019-02-27 17:47:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551260801', '1551260866');
INSERT INTO `sys_session` VALUES ('1f03e10eeb9febd5ea315d3cfbf0e96c', '21', '2019-01-21 11:23:00', '127.0.0.1', '127.0.0.1', '1548040304', '1548040980');
INSERT INTO `sys_session` VALUES ('1f35c865d05ea6eebbffc50c17add283', '21', '2019-02-12 11:40:08', '127.0.0.1', '127.0.0.1', '1549939279', '1549942808');
INSERT INTO `sys_session` VALUES ('1f5d5714168cd8cda8882c3d7fa0c85a', '21', '2019-01-20 22:21:55', '127.0.0.1', '127.0.0.1', '1547993858', '1547994115');
INSERT INTO `sys_session` VALUES ('1f71de834c861352cf290fb25a55ffa0', '21', '2019-01-24 10:10:06', '127.0.0.1', '127.0.0.1', '1548295755', '1548295806');
INSERT INTO `sys_session` VALUES ('1fbb5e8d60e14ea098e2855a1e8f34a1', '21', '2019-01-16 16:44:38', '127.0.0.1', '127.0.0.1', '1547627178', '1547628278');
INSERT INTO `sys_session` VALUES ('1fce48915daac0e5d7fd4642bd5005be', '21', '2019-01-25 13:41:00', '127.0.0.1', '127.0.0.1', '1548394593', '1548394860');
INSERT INTO `sys_session` VALUES ('20107e513ec3a2838bad540fe4441c05', '21', '2019-01-16 15:56:31', '127.0.0.1', '127.0.0.1', '1547625116', '1547625391');
INSERT INTO `sys_session` VALUES ('20358f3e0a83023f93b864eff4d440ed', '21', '2019-01-21 09:39:01', '127.0.0.1', '127.0.0.1', '1547994418', '1548034741');
INSERT INTO `sys_session` VALUES ('20759393ded4f98f16b20fb86164895c', '21', '2019-01-22 17:48:36', '127.0.0.1', '127.0.0.1', '1548150293', '1548150516');
INSERT INTO `sys_session` VALUES ('20a487e81d0b2126c96b301e76ee106f', '37', '2019-01-25 15:54:01', '127.0.0.1', '127.0.0.1', '1548402204', '1548402841');
INSERT INTO `sys_session` VALUES ('21a10254eae1b97ed37a3fa4522fe8ac', '21', '2019-01-24 21:49:53', '127.0.0.1', '127.0.0.1', '1548334870', '1548337793');
INSERT INTO `sys_session` VALUES ('21be7c4ed13223b3abf91af91a549ea7', '21', '2019-01-25 14:37:19', '127.0.0.1', '127.0.0.1', '1548397987', '1548398239');
INSERT INTO `sys_session` VALUES ('224271b0de188cbd40f3f25492397b2e', '42', '2019-01-29 16:05:57', '127.0.0.1', '127.0.0.1', '1548749105', '1548749157');
INSERT INTO `sys_session` VALUES ('224e8f335d92e8947e303bbc532da1f6', '21', '2019-01-21 17:39:26', '127.0.0.1', '127.0.0.1', '1548061622', '1548063566');
INSERT INTO `sys_session` VALUES ('22821637da8e237cf3d3e139363ee3c4', '21', '2019-01-24 11:16:23', '127.0.0.1', '127.0.0.1', '1548299527', '1548299783');
INSERT INTO `sys_session` VALUES ('22d3479777b85712ce3496f196249f5b', '21', '2019-01-23 14:45:42', '127.0.0.1', '127.0.0.1', '1548225918', '1548225942');
INSERT INTO `sys_session` VALUES ('22ec213ee51c1e2a9ebe378a8cd227d8', '21', '2019-02-11 19:42:28', '127.0.0.1', '127.0.0.1', '1549885262', '1549885348');
INSERT INTO `sys_session` VALUES ('2314914b589be1b5df38152cf2d35051', '21', '2019-01-19 13:33:04', '127.0.0.1', '127.0.0.1', '1547872968', '1547875984');
INSERT INTO `sys_session` VALUES ('238761a7c0b5e4bf296aba6254612175', '21', '2019-02-18 14:51:30', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550459945', '1550472690');
INSERT INTO `sys_session` VALUES ('23a164d30ecfe91adeadd2fa964722e1', '21', '2019-02-28 10:20:36', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551320041', '1551320436');
INSERT INTO `sys_session` VALUES ('23be7f9abfa7d8fc2c44d516ca92fdf9', '21', '2019-01-20 20:40:39', '127.0.0.1', '127.0.0.1', '1547975474', '1547988039');
INSERT INTO `sys_session` VALUES ('24198e7db4da3af5fa9a05df2afbd3d4', '21', '2019-01-24 20:31:58', '127.0.0.1', '127.0.0.1', '1548333025', '1548333118');
INSERT INTO `sys_session` VALUES ('2489ab012316e4894a2e174614f1df5a', '21', '2019-01-23 11:55:03', '127.0.0.1', '127.0.0.1', '1548214338', '1548215703');
INSERT INTO `sys_session` VALUES ('24ee689162aa1b791008f48ae40d4739', '21', '2019-01-25 14:18:24', '127.0.0.1', '127.0.0.1', '1548397038', '1548397104');
INSERT INTO `sys_session` VALUES ('257601b7975ebf46f3320054da4cd76e', '21', '2019-02-01 12:54:49', '127.0.0.1', '127.0.0.1', '1548995841', '1548996889');
INSERT INTO `sys_session` VALUES ('25a6a3ffea10c0a8d39bb3a1a81b6188', '21', '2019-01-16 18:00:42', '127.0.0.1', '127.0.0.1', '1547632824', '1547632842');
INSERT INTO `sys_session` VALUES ('2622b101d0b91c99e6e746197c2e2e44', '21', '2019-03-01 15:45:34', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551424568', '1551426334');
INSERT INTO `sys_session` VALUES ('265b92efb3129069699c9cd4bafcb87a', '21', '2019-01-21 16:22:52', '127.0.0.1', '127.0.0.1', '1548058223', '1548058972');
INSERT INTO `sys_session` VALUES ('267574c80f719368d27a3a91baa599a7', '21', '2019-01-16 16:59:33', '127.0.0.1', '127.0.0.1', '1547629173', '1547629173');
INSERT INTO `sys_session` VALUES ('269ea256704bb3e8a121b8d15055fd8a', '21', '2019-01-19 14:18:03', '127.0.0.1', '127.0.0.1', '1547878557', '1547878683');
INSERT INTO `sys_session` VALUES ('26b18e940bb9462ce303e2d2c1bb84c7', '21', '2019-01-16 17:18:28', '127.0.0.1', '127.0.0.1', '1547630178', '1547630308');
INSERT INTO `sys_session` VALUES ('27075e3d760f10e6b4f56e75005b4738', '21', '2019-01-21 13:37:02', '127.0.0.1', '127.0.0.1', '1548048990', '1548049022');
INSERT INTO `sys_session` VALUES ('27c61fd9484fe2ddd5fa5a5218d26d40', '21', '2019-02-01 16:39:30', '127.0.0.1', '127.0.0.1', '1549010306', '1549010370');
INSERT INTO `sys_session` VALUES ('283fa6f7fd6e10e99feabc2eebb1dcee', '21', '2019-01-17 14:17:39', '127.0.0.1', '127.0.0.1', '1547705449', '1547705859');
INSERT INTO `sys_session` VALUES ('28b543f87c05726d9c5c8e23332b2f7a', '21', '2019-01-16 17:58:57', '127.0.0.1', '127.0.0.1', '1547632480', '1547632737');
INSERT INTO `sys_session` VALUES ('28c1d70845fb3c1e8b10d6b02e02d84a', '21', '2019-01-25 19:28:36', '127.0.0.1', '127.0.0.1', '1548415667', '1548415716');
INSERT INTO `sys_session` VALUES ('28f9b41428321c125220832951a11d9c', '21', '2019-01-21 12:48:00', '127.0.0.1', '127.0.0.1', '1548045621', '1548046080');
INSERT INTO `sys_session` VALUES ('2943a2dd41dd8521df7400582e5e3774', '21', '2019-01-24 20:30:25', '127.0.0.1', '127.0.0.1', '1548332821', '1548333025');
INSERT INTO `sys_session` VALUES ('295135ac8c61f29414166bb29becf2d0', '37', '2019-01-28 12:43:37', '127.0.0.1', '127.0.0.1', '1548646778', '1548650617');
INSERT INTO `sys_session` VALUES ('29cfd06cd88af9ea82bf90ea41c1b948', '21', '2019-03-04 13:52:02', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551672004', '1551678722');
INSERT INTO `sys_session` VALUES ('29efee79bcb4929c5fff1f9574b2eb81', '21', '2019-01-21 13:28:58', '127.0.0.1', '127.0.0.1', '1548048499', '1548048538');
INSERT INTO `sys_session` VALUES ('2a0d16445b9d61089a2f11629876ba58', '21', '2019-02-01 16:28:02', '127.0.0.1', '127.0.0.1', '1549009305', '1549009682');
INSERT INTO `sys_session` VALUES ('2a1786df4e525f3e4750c05f300c9995', '21', '2019-01-16 17:42:15', '127.0.0.1', '127.0.0.1', '1547631713', '1547631735');
INSERT INTO `sys_session` VALUES ('2a8c586b41d422e84f224abfed6c291a', '21', '2019-02-18 15:23:37', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550474201', '1550474617');
INSERT INTO `sys_session` VALUES ('2b09ed3d7f6404e0dcb7db89ea5f7b38', '37', '2019-01-25 17:22:26', '127.0.0.1', '127.0.0.1', '1548408121', '1548408146');
INSERT INTO `sys_session` VALUES ('2b6e221ba2e88e50825a71aa5a070317', '21', '2019-01-20 21:44:44', '127.0.0.1', '127.0.0.1', '1547991529', '1547991884');
INSERT INTO `sys_session` VALUES ('2bf54588e24f3a09d81df5596dd73ea3', '21', '2019-01-20 17:11:14', '127.0.0.1', '127.0.0.1', '1547974997', '1547975474');
INSERT INTO `sys_session` VALUES ('2c06d86c79a91daed2eea604db6f291e', '21', '2019-02-01 11:14:48', '127.0.0.1', '127.0.0.1', '1548990817', '1548990888');
INSERT INTO `sys_session` VALUES ('2c2d69d8da81f2951b6de113d5cc3b76', '21', '2019-01-20 22:08:27', '127.0.0.1', '127.0.0.1', '1547992983', '1547993307');
INSERT INTO `sys_session` VALUES ('2cfada9afaaa0f83e4d8e1ad022f01f5', '21', '2019-02-27 11:18:56', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551236039', '1551237536');
INSERT INTO `sys_session` VALUES ('2d1a0e134528ac26844e487c23cb421d', '21', '2019-02-13 14:11:17', '127.0.0.1', '127.0.0.1', '1550038069', '1550038277');
INSERT INTO `sys_session` VALUES ('2d49ca57f00d0258201183f79a2de83a', '21', '2019-01-17 14:24:59', '127.0.0.1', '127.0.0.1', '1547706259', '1547706299');
INSERT INTO `sys_session` VALUES ('2d6d4ac53bcbc98e42b6defe518193f9', '21', '2019-01-23 14:42:03', '127.0.0.1', '127.0.0.1', '1548225554', '1548225723');
INSERT INTO `sys_session` VALUES ('2dadd00a653072d04bd4858577f4f5e8', '21', '2019-02-27 16:55:43', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551254790', '1551257743');
INSERT INTO `sys_session` VALUES ('2db779cabc6ee5a4403851dbc9bb9890', '31', '2019-01-29 15:37:29', '127.0.0.1', '127.0.0.1', '1548747296', '1548747449');
INSERT INTO `sys_session` VALUES ('2dc1e893521f7092d552e841695a05d9', '21', '2019-01-19 17:49:42', '127.0.0.1', '127.0.0.1', '1547880856', '1547891382');
INSERT INTO `sys_session` VALUES ('2dc4c2becf15e1a1af56ad5e1fb351c1', '21', '2019-02-20 14:25:26', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550643555', '1550643926');
INSERT INTO `sys_session` VALUES ('2ddd0e67d1534833b1dc34c39fa8676d', '21', '2019-02-28 11:01:09', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551322592', '1551322869');
INSERT INTO `sys_session` VALUES ('2f3f8136d49cbc632e21a5a96815db8f', '21', '2019-02-27 17:48:48', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551260866', '1551260928');
INSERT INTO `sys_session` VALUES ('2f40d8fa73aeb1d8e6c04f84a93fe112', '21', '2019-01-19 14:22:48', '127.0.0.1', '127.0.0.1', '1547878871', '1547878968');
INSERT INTO `sys_session` VALUES ('2f90e3fa3056cf2dba6bf82e8ce24248', '37', '2019-01-28 11:37:30', '127.0.0.1', '127.0.0.1', '1548646557', '1548646650');
INSERT INTO `sys_session` VALUES ('2facde6391d404fdb82e825a17e41a6d', '21', '2019-01-25 19:34:10', '127.0.0.1', '127.0.0.1', '1548415838', '1548416050');
INSERT INTO `sys_session` VALUES ('300dbc0a1cae089af2f8311a1352c210', '21', '2019-01-31 15:26:25', '127.0.0.1', '127.0.0.1', '1548919379', '1548919585');
INSERT INTO `sys_session` VALUES ('3035bdfc9dc697563cf8934a1f8beabe', '21', '2019-01-22 09:46:29', '127.0.0.1', '127.0.0.1', '1548121309', '1548121589');
INSERT INTO `sys_session` VALUES ('308adc605168d8f33249f27d7cfa030f', '21', '2019-02-21 17:08:27', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550736440', '1550740107');
INSERT INTO `sys_session` VALUES ('30a1ad0a70236c6ad166cbca98886cad', '21', '2019-01-17 14:52:15', '127.0.0.1', '127.0.0.1', '1547707902', '1547707935');
INSERT INTO `sys_session` VALUES ('30b7831d8bfc76d2fb69eec3e08e668e', '21', '2019-01-17 09:56:33', '127.0.0.1', '127.0.0.1', '1547689998', '1547690193');
INSERT INTO `sys_session` VALUES ('31079d92980f934e5307ec07cf480920', '37', '2019-01-29 11:50:37', '127.0.0.1', '127.0.0.1', '1548733777', '1548733837');
INSERT INTO `sys_session` VALUES ('31f3ac6072fa5d3b1e53fdd677b03f0b', '21', '2019-02-26 11:05:33', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551144296', '1551150333');
INSERT INTO `sys_session` VALUES ('325ed41e21bab5858f88b8d201e94cbd', '21', '2019-01-17 13:51:30', '127.0.0.1', '127.0.0.1', '1547704136', '1547704290');
INSERT INTO `sys_session` VALUES ('32683f6ff0b6d9405dbcfed137930a35', '21', '2019-01-21 17:07:02', '127.0.0.1', '127.0.0.1', '1548061550', '1548061622');
INSERT INTO `sys_session` VALUES ('3283cb3a677d6d082872e1eff4230b46', '21', '2019-02-12 11:40:14', '127.0.0.1', '127.0.0.1', '1549942808', '1549942814');
INSERT INTO `sys_session` VALUES ('3285a60087564d35cf319b50f9f3baff', '21', '2019-01-31 16:16:06', '127.0.0.1', '127.0.0.1', '1548922515', '1548922566');
INSERT INTO `sys_session` VALUES ('32f9dc2d2036dfccb7b2f6caf7b58461', '21', '2019-01-23 14:18:49', '127.0.0.1', '127.0.0.1', '1548215703', '1548224329');
INSERT INTO `sys_session` VALUES ('335d3da4ff39c923640f6a849fa4f1a4', '21', '2019-01-19 21:32:01', '127.0.0.1', '127.0.0.1', '1547891721', '1547904721');
INSERT INTO `sys_session` VALUES ('33702a127516ab5e8344ba7d4831f174', '21', '2019-01-19 13:44:16', '127.0.0.1', '127.0.0.1', '1547876579', '1547876656');
INSERT INTO `sys_session` VALUES ('33c42d51fe01a435392bbaa0cfdb6f91', '21', '2019-01-16 17:16:18', '127.0.0.1', '127.0.0.1', '1547629994', '1547630178');
INSERT INTO `sys_session` VALUES ('33dda6fa14d174b5cae96d7a2e63685d', '21', '2019-02-18 10:53:12', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550457150', '1550458392');
INSERT INTO `sys_session` VALUES ('347dbb9bb3566513dfae34685c896020', '21', '2019-01-18 11:21:37', '127.0.0.1', '127.0.0.1', '1547781405', '1547781697');
INSERT INTO `sys_session` VALUES ('34987901e8ce9df14473cd034926e26b', '21', '2019-01-17 10:10:32', '127.0.0.1', '127.0.0.1', '1547690906', '1547691032');
INSERT INTO `sys_session` VALUES ('34a98ecf468009a87106a34c74034a2d', '21', '2019-02-13 17:22:17', '127.0.0.1', '127.0.0.1', '1550049701', '1550049737');
INSERT INTO `sys_session` VALUES ('34c5345f0cf56a7294a95b5d319eed50', '21', '2019-01-16 16:26:18', '127.0.0.1', '127.0.0.1', '1547625623', '1547627178');
INSERT INTO `sys_session` VALUES ('34d9c53dedf116bbb18daad4532d0672', '21', '2019-01-22 14:55:43', '127.0.0.1', '127.0.0.1', '1548140102', '1548140143');
INSERT INTO `sys_session` VALUES ('34e1fe7e36c596e612a38d8216025ad1', '21', '2019-02-28 11:05:34', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551322869', '1551323134');
INSERT INTO `sys_session` VALUES ('34eaf16d540ed90f4b7dec0327903162', '37', '2019-01-25 16:37:23', '127.0.0.1', '127.0.0.1', '1548403862', '1548405443');
INSERT INTO `sys_session` VALUES ('351c282f85ea430ac874908cfc367c17', '21', '2019-02-01 16:50:07', '127.0.0.1', '127.0.0.1', '1549010528', '1549011007');
INSERT INTO `sys_session` VALUES ('3544b8e355c5917ff4660f227e8819a6', '21', '2019-02-28 10:50:49', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551321511', '1551322249');
INSERT INTO `sys_session` VALUES ('359522ff8e8f029c5d21f3634c786a70', '21', '2019-01-19 17:49:42', '127.0.0.1', '127.0.0.1', '1547891382', '1547891382');
INSERT INTO `sys_session` VALUES ('36e4e8165eb673728c32693b5c297969', '21', '2019-01-21 13:21:50', '127.0.0.1', '127.0.0.1', '1548047830', '1548048110');
INSERT INTO `sys_session` VALUES ('3733f7140acce1a4bb051908d9d27c4d', '21', '2019-02-01 16:38:26', '127.0.0.1', '127.0.0.1', '1549009724', '1549010306');
INSERT INTO `sys_session` VALUES ('37790973711b0ded020ac218935632af', '21', '2019-02-22 10:39:55', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550802511', '1550803195');
INSERT INTO `sys_session` VALUES ('3789c218f975ebe44165c2e1df6814ba', '21', '2019-01-16 17:19:35', '127.0.0.1', '127.0.0.1', '1547630364', '1547630375');
INSERT INTO `sys_session` VALUES ('37b53fa66d6412f8bfe1e7b406ef6064', '21', '2019-01-19 13:38:45', '127.0.0.1', '127.0.0.1', '1547875984', '1547876325');
INSERT INTO `sys_session` VALUES ('386d316e3f6c4fbfb5732fefc40f7b61', '47', '2019-02-16 16:19:20', '127.0.0.1', '127.0.0.1', '1550305138', '1550305160');
INSERT INTO `sys_session` VALUES ('38d89c1bc818d2ef968c0d1038e8fae8', '21', '2019-01-16 17:18:28', '127.0.0.1', '127.0.0.1', '1547630178', '1547630308');
INSERT INTO `sys_session` VALUES ('38df065750fa35c2e790761437fdce02', '21', '2019-01-17 14:24:19', '127.0.0.1', '127.0.0.1', '1547705907', '1547706259');
INSERT INTO `sys_session` VALUES ('38df36726bcc7dbeeaec0d0e04a8a20b', '21', '2019-01-16 15:56:31', '127.0.0.1', '127.0.0.1', '1547625116', '1547625391');
INSERT INTO `sys_session` VALUES ('38e7f023dd94d4f2294c8d5ea0f8b959', '21', '2019-01-25 13:33:39', '127.0.0.1', '127.0.0.1', '1548392053', '1548394419');
INSERT INTO `sys_session` VALUES ('3923b248dab286833c8247fb0b1e93ca', '21', '2019-01-25 14:58:47', '127.0.0.1', '127.0.0.1', '1548399442', '1548399527');
INSERT INTO `sys_session` VALUES ('39510a146cf2c9734c0a99b4979cd5e9', '21', '2019-01-21 13:08:30', '127.0.0.1', '127.0.0.1', '1548046686', '1548047310');
INSERT INTO `sys_session` VALUES ('39684e6be6a5519fd01dee467f0e672c', '37', '2019-01-29 10:21:40', '127.0.0.1', '127.0.0.1', '1548728203', '1548728500');
INSERT INTO `sys_session` VALUES ('3abba139061f40dc782d8ea89fd9d4a4', '21', '2019-01-31 15:20:44', '127.0.0.1', '127.0.0.1', '1548919124', '1548919244');
INSERT INTO `sys_session` VALUES ('3ac0f18d011cf9442c0c5122ca2e8796', '37', '2019-01-29 10:30:41', '127.0.0.1', '127.0.0.1', '1548728500', '1548729041');
INSERT INTO `sys_session` VALUES ('3b0ac6a58bd2aab08fb6576e029e5987', '21', '2019-02-16 16:49:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550305964', '1550306941');
INSERT INTO `sys_session` VALUES ('3bc5e754ab0f789c0dedfc7eb8d8dbb3', '21', '2019-01-26 17:08:28', '127.0.0.1', '127.0.0.1', '1548493139', '1548493708');
INSERT INTO `sys_session` VALUES ('3c8996ff8f48185d0e5c3864fc538a67', '21', '2019-02-11 11:27:22', '127.0.0.1', '127.0.0.1', '1549855449', '1549855642');
INSERT INTO `sys_session` VALUES ('3c99adb646a59514ef71fcb98ea98292', '21', '2019-02-18 10:32:30', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550309504', '1550457150');
INSERT INTO `sys_session` VALUES ('3ce8b34dce90038efd04ad10cbcb2b9d', '21', '2019-01-25 14:20:33', '127.0.0.1', '127.0.0.1', '1548397152', '1548397233');
INSERT INTO `sys_session` VALUES ('3cfbf4c91c5d7603a460ef0a4b6c141d', '21', '2019-01-16 16:55:29', '127.0.0.1', '127.0.0.1', '1547628929', '1547628929');
INSERT INTO `sys_session` VALUES ('3d09bb3d43fa07bbc60c79fb9798548f', '21', '2019-02-28 14:02:30', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551323134', '1551333750');
INSERT INTO `sys_session` VALUES ('3d4e14dbf2cc10fda20b313f7bf1f870', '21', '2019-01-21 16:47:53', '127.0.0.1', '127.0.0.1', '1548059938', '1548060473');
INSERT INTO `sys_session` VALUES ('3d59cb1b95ae6260281b717629c3ecdb', '21', '2019-02-01 13:34:16', '127.0.0.1', '127.0.0.1', '1548999210', '1548999256');
INSERT INTO `sys_session` VALUES ('3d75dcbec97de51b78b2ddce6caf881d', '21', '2019-01-23 14:50:20', '127.0.0.1', '127.0.0.1', '1548226192', '1548226220');
INSERT INTO `sys_session` VALUES ('3df923dcf47a4137503f0c9455fbc7cf', '21', '2019-02-01 12:37:21', '127.0.0.1', '127.0.0.1', '1548995769', '1548995841');
INSERT INTO `sys_session` VALUES ('3e33aabf34b023fd65584b35866cc565', '37', '2019-01-29 11:45:53', '127.0.0.1', '127.0.0.1', '1548730786', '1548733553');
INSERT INTO `sys_session` VALUES ('3ec2a9288078de182019443438b8e7e8', '45', '2019-02-01 09:22:15', '127.0.0.1', '127.0.0.1', '1548749712', '1548984135');
INSERT INTO `sys_session` VALUES ('3f0357996026e4c98338d3eb9dccaf8d', '21', '2019-01-20 21:49:05', '127.0.0.1', '127.0.0.1', '1547992109', '1547992145');
INSERT INTO `sys_session` VALUES ('3f534b6576274785d4a8407bcd694da8', '21', '2019-01-31 15:48:52', '127.0.0.1', '127.0.0.1', '1548919941', '1548920932');
INSERT INTO `sys_session` VALUES ('3fd016576b949170f8d82cb6d2a93835', '37', '2019-01-25 15:59:23', '127.0.0.1', '127.0.0.1', '1548403103', '1548403163');
INSERT INTO `sys_session` VALUES ('402dd03fb9480b78019da90a576924d9', '21', '2019-01-23 17:50:45', '127.0.0.1', '127.0.0.1', '1548236767', '1548237045');
INSERT INTO `sys_session` VALUES ('40cd3e3f7787eaacb353294495fc03c2', '21', '2019-01-24 20:35:25', '127.0.0.1', '127.0.0.1', '1548333118', '1548333325');
INSERT INTO `sys_session` VALUES ('4163a076c934838ab9634710d8d00c78', '21', '2019-01-17 13:46:12', '127.0.0.1', '127.0.0.1', '1547703938', '1547703972');
INSERT INTO `sys_session` VALUES ('41ad9bc61c7e8eb7fe5983821bbc5da5', '21', '2019-02-25 11:08:18', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551057776', '1551064098');
INSERT INTO `sys_session` VALUES ('41f00922c034d969d74bff19aa2025f7', '21', '2019-01-24 22:40:48', '127.0.0.1', '127.0.0.1', '1548339873', '1548340848');
INSERT INTO `sys_session` VALUES ('4204cf2222345f9a65f4b07a638f8fa3', '21', '2019-02-18 15:16:38', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550474043', '1550474198');
INSERT INTO `sys_session` VALUES ('420a3fbf281f23c8a5ffc361e6d87425', '21', '2019-02-01 09:44:33', '127.0.0.1', '127.0.0.1', '1548985366', '1548985473');
INSERT INTO `sys_session` VALUES ('422a52d3eefd6bcabddbf2337e4a3a1c', '21', '2019-01-21 11:45:56', '127.0.0.1', '127.0.0.1', '1548042262', '1548042356');
INSERT INTO `sys_session` VALUES ('42a9f9e1d4a7cf1e064681f72848805c', '21', '2019-01-23 17:09:49', '127.0.0.1', '127.0.0.1', '1548229816', '1548234589');
INSERT INTO `sys_session` VALUES ('4372a4e8b21aca98f6a843f046acfcf0', '21', '2019-01-25 13:44:40', '127.0.0.1', '127.0.0.1', '1548394972', '1548395080');
INSERT INTO `sys_session` VALUES ('43834b560187db3731f557341f6df508', '21', '2019-02-27 18:25:22', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551261946', '1551263122');
INSERT INTO `sys_session` VALUES ('43d8ec8e5a123218877517b46e1f4cd6', '21', '2019-02-18 15:24:31', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550474617', '1550474671');
INSERT INTO `sys_session` VALUES ('4426cd64db5f0cbfcd170639a21d4fcc', '21', '2019-01-31 15:06:09', '127.0.0.1', '127.0.0.1', '1548918348', '1548918369');
INSERT INTO `sys_session` VALUES ('4516fdb6ff7568441a38a40f31f220f6', '21', '2019-01-16 17:54:40', '127.0.0.1', '127.0.0.1', '1547632460', '1547632480');
INSERT INTO `sys_session` VALUES ('4523c5cd589ded32740ba4f69ac5714a', '21', '2019-01-20 20:45:21', '127.0.0.1', '127.0.0.1', '1547988241', '1547988321');
INSERT INTO `sys_session` VALUES ('45838f6b68f10925ccd623de247850fa', '21', '2019-02-21 16:07:20', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550648357', '1550736440');
INSERT INTO `sys_session` VALUES ('4647b19fdcaf27b0b8867af88fdc373b', '37', '2019-01-28 15:10:39', '127.0.0.1', '127.0.0.1', '1548659399', '1548659439');
INSERT INTO `sys_session` VALUES ('465f81a5d2b30b82b6c129777244bbe3', '37', '2019-01-28 11:09:14', '127.0.0.1', '127.0.0.1', '1548644927', '1548644954');
INSERT INTO `sys_session` VALUES ('47b5bcb47662e662027313d5a20ecfbf', '21', '2019-01-17 15:11:30', '127.0.0.1', '127.0.0.1', '1547708979', '1547709090');
INSERT INTO `sys_session` VALUES ('47bb586cdda807967741fec8e4693857', '21', '2019-02-01 09:57:01', '127.0.0.1', '127.0.0.1', '1548985473', '1548986221');
INSERT INTO `sys_session` VALUES ('47e62d44394bfa35f31c2e8dc51a9495', '21', '2019-01-26 12:30:28', '127.0.0.1', '127.0.0.1', '1548476882', '1548477028');
INSERT INTO `sys_session` VALUES ('4829a25e37b84c97cc6465e01be83ac5', '21', '2019-03-04 09:28:36', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551431269', '1551662916');
INSERT INTO `sys_session` VALUES ('48afaa51adbf9dd0a70847e9381ee0a3', '21', '2019-02-13 17:24:59', '127.0.0.1', '127.0.0.1', '1550049737', '1550049899');
INSERT INTO `sys_session` VALUES ('48f8f7acefe61dbc3b62550bf4c04ebd', '37', '2019-01-29 10:00:32', '127.0.0.1', '127.0.0.1', '1548727056', '1548727231');
INSERT INTO `sys_session` VALUES ('48fa287beb2be4db3cf948b768ee790d', '21', '2019-01-17 13:23:42', '127.0.0.1', '127.0.0.1', '1547702219', '1547702622');
INSERT INTO `sys_session` VALUES ('490026e3b5abced150953f1c9e8a8b88', '21', '2019-01-19 14:10:08', '127.0.0.1', '127.0.0.1', '1547877278', '1547878208');
INSERT INTO `sys_session` VALUES ('494174201897a2cb3a744cf3c36775ff', '21', '2019-01-19 12:42:48', '127.0.0.1', '127.0.0.1', '1547872889', '1547872968');
INSERT INTO `sys_session` VALUES ('4969f6fedb8bd08dbb2347daaa32fd77', '37', '2019-01-29 09:55:28', '127.0.0.1', '127.0.0.1', '1548726323', '1548726928');
INSERT INTO `sys_session` VALUES ('4a346229ad6695d90b14dc34f5d10983', '21', '2019-02-20 14:38:31', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550644629', '1550644711');
INSERT INTO `sys_session` VALUES ('4a4fe62d7701b79a41381e29065e7eca', '21', '2019-01-23 18:04:06', '127.0.0.1', '127.0.0.1', '1548237587', '1548237846');
INSERT INTO `sys_session` VALUES ('4ac24e25aa93dd7307ab059f7219224c', '21', '2019-01-16 17:18:39', '127.0.0.1', '127.0.0.1', '1547630308', '1547630319');
INSERT INTO `sys_session` VALUES ('4ae21415ed2aadeafde43f66f7c989cb', '21', '2019-02-16 17:31:44', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550308209', '1550309504');
INSERT INTO `sys_session` VALUES ('4b48edd2ca6953e0dc7598141be7c979', '21', '2019-02-01 11:07:00', '127.0.0.1', '127.0.0.1', '1548986221', '1548990420');
INSERT INTO `sys_session` VALUES ('4b9460ee319306612d30e0bffab74b58', '37', '2019-01-28 12:43:55', '127.0.0.1', '127.0.0.1', '1548650617', '1548650635');
INSERT INTO `sys_session` VALUES ('4beb1a79f776faafb8907cf0ab6b9c4a', '21', '2019-01-24 11:27:23', '127.0.0.1', '127.0.0.1', '1548300189', '1548300443');
INSERT INTO `sys_session` VALUES ('4d0ee1ff904b36f8b2aa416a6aa79e16', '37', '2019-01-30 16:04:10', '127.0.0.1', '127.0.0.1', '1548835218', '1548835450');
INSERT INTO `sys_session` VALUES ('4d4fdeec61284eeadfd2d23ff25096f1', '21', '2019-02-16 17:10:09', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550306941', '1550308209');
INSERT INTO `sys_session` VALUES ('4d51b28b28667193cb888e2dc82a5ecf', '21', '2019-02-11 19:41:02', '127.0.0.1', '127.0.0.1', '1549884855', '1549885262');
INSERT INTO `sys_session` VALUES ('4d7c7dd0202e7a458be982543b2fa892', '21', '2019-02-01 13:45:59', '127.0.0.1', '127.0.0.1', '1548999496', '1548999959');
INSERT INTO `sys_session` VALUES ('4dac4f3a40ba73e3ba0c760737c5b111', '21', '2019-01-20 22:26:58', '127.0.0.1', '127.0.0.1', '1547994163', '1547994418');
INSERT INTO `sys_session` VALUES ('4e12cd7372f45148f8a30629f2c86a5d', '21', '2019-01-17 10:02:17', '127.0.0.1', '127.0.0.1', '1547690446', '1547690537');
INSERT INTO `sys_session` VALUES ('4e24d38ef25a91bb40d13fa5639b17fd', '21', '2019-01-19 12:41:29', '127.0.0.1', '127.0.0.1', '1547872473', '1547872889');
INSERT INTO `sys_session` VALUES ('4e468d6b778209f6e317b31a3c2b0cb9', '21', '2019-02-13 15:00:56', '127.0.0.1', '127.0.0.1', '1550041216', '1550041256');
INSERT INTO `sys_session` VALUES ('4e62de4bfcf6da2270706ef1d3f9399d', '21', '2019-02-13 17:19:31', '127.0.0.1', '127.0.0.1', '1550049475', '1550049571');
INSERT INTO `sys_session` VALUES ('4eb663a6b05d1cc40ff27677ea0d01b9', '21', '2019-02-11 12:41:49', '127.0.0.1', '127.0.0.1', '1549856463', '1549860108');
INSERT INTO `sys_session` VALUES ('4ed4bc2b06a440eb9d5ba0b36881b280', '21', '2019-02-12 11:42:23', '127.0.0.1', '127.0.0.1', '1549942814', '1549942943');
INSERT INTO `sys_session` VALUES ('4f47a4ee48a74c2919da21463c08a3f5', '21', '2019-01-20 17:03:17', '127.0.0.1', '127.0.0.1', '1547974953', '1547974997');
INSERT INTO `sys_session` VALUES ('4fb436c373bed58cd208795877f424a0', '21', '2019-02-27 09:19:12', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551173396', '1551230352');
INSERT INTO `sys_session` VALUES ('500f40843aabd73a6eb66700731c1668', '21', '2019-01-24 11:08:24', '127.0.0.1', '127.0.0.1', '1548295806', '1548299304');
INSERT INTO `sys_session` VALUES ('50a2e63531c11aa4d673d54a114e8ae8', '21', '2019-01-17 11:21:39', '127.0.0.1', '127.0.0.1', '1547693906', '1547695299');
INSERT INTO `sys_session` VALUES ('50c9491b56809d14638585bf1390f62d', '21', '2019-01-21 15:59:17', '127.0.0.1', '127.0.0.1', '1548057537', '1548057557');
INSERT INTO `sys_session` VALUES ('50d6cd508fdf01b7132ccdf206069c0c', '21', '2019-01-25 14:42:56', '127.0.0.1', '127.0.0.1', '1548398489', '1548398576');
INSERT INTO `sys_session` VALUES ('51e7451f911da3a56052dee3c0e68989', '21', '2019-01-17 13:31:36', '127.0.0.1', '127.0.0.1', '1547702641', '1547703096');
INSERT INTO `sys_session` VALUES ('5222935aee5b829fdd442894cd8a358e', '21', '2019-01-16 15:51:56', '127.0.0.1', '127.0.0.1', '1547624966', '1547625116');
INSERT INTO `sys_session` VALUES ('525e9408df5d4dd6095d70d79627e8f8', '37', '2019-01-28 11:25:35', '127.0.0.1', '127.0.0.1', '1548645503', '1548645935');
INSERT INTO `sys_session` VALUES ('5260f6694935a31729fe777413a00899', '21', '2019-01-25 14:07:56', '127.0.0.1', '127.0.0.1', '1548396407', '1548396476');
INSERT INTO `sys_session` VALUES ('528b3ec8efacc10d69c1d6699d30c76f', '21', '2019-01-24 17:28:03', '127.0.0.1', '127.0.0.1', '1548321853', '1548322083');
INSERT INTO `sys_session` VALUES ('52c92d9dba4bbedffca5699762173ee3', '21', '2019-01-31 16:19:00', '127.0.0.1', '127.0.0.1', '1548922693', '1548922740');
INSERT INTO `sys_session` VALUES ('533459617e3053e8d6f9d0de0d672544', '21', '2019-02-13 14:14:52', '127.0.0.1', '127.0.0.1', '1550038277', '1550038492');
INSERT INTO `sys_session` VALUES ('5341e481f4bee80b9915d7454fd797f6', '21', '2019-01-20 17:02:03', '127.0.0.1', '127.0.0.1', '1547974822', '1547974923');
INSERT INTO `sys_session` VALUES ('5361b14bf1eec990c5a8ffcaa7bd5370', '21', '2019-01-23 11:32:18', '127.0.0.1', '127.0.0.1', '1548162008', '1548214338');
INSERT INTO `sys_session` VALUES ('53c5e41816b75f077b25fd8e0ca75678', '21', '2019-01-17 10:06:36', '127.0.0.1', '127.0.0.1', '1547690702', '1547690796');
INSERT INTO `sys_session` VALUES ('5489bbacbac5c08ffe882313a9dfda01', '21', '2019-01-26 12:13:50', '127.0.0.1', '127.0.0.1', '1548475838', '1548476030');
INSERT INTO `sys_session` VALUES ('548ef2b8fbdae0105ed7003cc21f3efe', '37', '2019-01-30 16:32:31', '127.0.0.1', '127.0.0.1', '1548835450', '1548837151');
INSERT INTO `sys_session` VALUES ('55453b4575c0bfda87e1b845a443a16b', '21', '2019-01-16 17:21:56', '127.0.0.1', '127.0.0.1', '1547630375', '1547630516');
INSERT INTO `sys_session` VALUES ('55765ba104440e89bd3455d4a34e342d', '21', '2019-01-24 17:35:29', '127.0.0.1', '127.0.0.1', '1548322083', '1548322529');
INSERT INTO `sys_session` VALUES ('55e3a2ae2aaf34883eb980994ccc0441', '21', '2019-01-16 15:47:17', '127.0.0.1', '127.0.0.1', '1547624808', '1547624837');
INSERT INTO `sys_session` VALUES ('56021efbd66935b215bd2503ca1b0609', '21', '2019-03-01 09:24:33', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551349191', '1551403472');
INSERT INTO `sys_session` VALUES ('5695fe10bba09d729cbf0194a8bcaed9', '21', '2019-02-22 10:42:04', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550803195', '1550803324');
INSERT INTO `sys_session` VALUES ('56b11cf805faf33e312da67efcca023c', '21', '2019-01-22 19:54:54', '127.0.0.1', '127.0.0.1', '1548152004', '1548158094');
INSERT INTO `sys_session` VALUES ('56ceb3b09e668ee0454dc048447d6bc3', '21', '2019-02-27 11:30:53', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551237536', '1551238253');
INSERT INTO `sys_session` VALUES ('56e5fa5b8167b2f23753dfbb5b429b57', '21', '2019-01-16 20:02:47', '127.0.0.1', '127.0.0.1', '1547639947', '1547640167');
INSERT INTO `sys_session` VALUES ('56f5f5b5cddbfcf52350556359d1d800', '21', '2019-01-22 09:41:49', '127.0.0.1', '127.0.0.1', '1548063566', '1548121309');
INSERT INTO `sys_session` VALUES ('5721b2b622f1acebb2fe64cef8538cf5', '21', '2019-01-20 20:49:14', '127.0.0.1', '127.0.0.1', '1547988511', '1547988554');
INSERT INTO `sys_session` VALUES ('574ae9a3c86ac8dca7ca4ae86ea2aae8', '21', '2019-01-16 21:24:43', '127.0.0.1', '127.0.0.1', '1547644434', '1547645083');
INSERT INTO `sys_session` VALUES ('5750f8c13a769bfd810a29f9c9568400', '21', '2019-01-24 17:24:13', '127.0.0.1', '127.0.0.1', '1548321817', '1548321853');
INSERT INTO `sys_session` VALUES ('577a56f8ba00a622b138d0285401fde6', '21', '2019-01-24 18:00:45', '127.0.0.1', '127.0.0.1', '1548323877', '1548324045');
INSERT INTO `sys_session` VALUES ('57a420ed5afd6e5aaa6bdf4f65769c98', '21', '2019-01-21 12:58:06', '127.0.0.1', '127.0.0.1', '1548046080', '1548046686');
INSERT INTO `sys_session` VALUES ('57aa56e099519da797d08cd45996cf65', '21', '2019-02-13 14:03:34', '127.0.0.1', '127.0.0.1', '1550037655', '1550037814');
INSERT INTO `sys_session` VALUES ('57c3c28ac804cbac477d2f0658a13387', '21', '2019-01-16 16:44:38', '127.0.0.1', '127.0.0.1', '1547627178', '1547628278');
INSERT INTO `sys_session` VALUES ('57e0682e67350ca4a25d38acbbc7ea8b', '21', '2019-02-26 11:15:15', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551150333', '1551150915');
INSERT INTO `sys_session` VALUES ('583264d1bafcb93dc697dcc9d0c3a984', '21', '2019-02-11 11:21:45', '127.0.0.1', '127.0.0.1', '1549585104', '1549855305');
INSERT INTO `sys_session` VALUES ('58594a32cca37cc1cf253ae13fd38ee4', '21', '2019-01-25 13:49:31', '127.0.0.1', '127.0.0.1', '1548395117', '1548395371');
INSERT INTO `sys_session` VALUES ('58a5aa5c1b8cfaa1c4503545420708ef', '21', '2019-01-26 11:25:20', '127.0.0.1', '127.0.0.1', '1548416490', '1548473120');
INSERT INTO `sys_session` VALUES ('58a7a7153973ffef927c80533105e92e', '21', '2019-01-25 14:33:07', '127.0.0.1', '127.0.0.1', '1548397233', '1548397987');
INSERT INTO `sys_session` VALUES ('591815860c1cc5450a581d3ffff71e5f', '37', '2019-01-28 11:18:23', '127.0.0.1', '127.0.0.1', '1548645027', '1548645503');
INSERT INTO `sys_session` VALUES ('5996c9b463709c81f9cfe005eb2fb89f', '21', '2019-01-16 19:33:13', '127.0.0.1', '127.0.0.1', '1547638192', '1547638393');
INSERT INTO `sys_session` VALUES ('59c2b514c26597431928d3973f889644', '37', '2019-01-25 15:43:24', '127.0.0.1', '127.0.0.1', '1548401698', '1548402204');
INSERT INTO `sys_session` VALUES ('59cb5277665a2143c2df1e16ac27182b', '21', '2019-01-16 21:28:07', '127.0.0.1', '127.0.0.1', '1547645083', '1547645287');
INSERT INTO `sys_session` VALUES ('5a1142446393ac43d80a74e88418571b', '21', '2019-02-18 11:19:05', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550459139', '1550459945');
INSERT INTO `sys_session` VALUES ('5a1a2735ee4147f0a35e21942467f250', '21', '2019-01-18 11:03:48', '127.0.0.1', '127.0.0.1', '1547779918', '1547780628');
INSERT INTO `sys_session` VALUES ('5a99282b27c3d2e06d5f71f9cacda4f4', '21', '2019-01-16 17:18:39', '127.0.0.1', '127.0.0.1', '1547630319', '1547630319');
INSERT INTO `sys_session` VALUES ('5af411fdbfddd4b00811737f3095f272', '21', '2019-02-11 16:57:38', '127.0.0.1', '127.0.0.1', '1549875287', '1549875458');
INSERT INTO `sys_session` VALUES ('5b75df08968ddb00819a34835375fc56', '21', '2019-02-12 11:43:53', '127.0.0.1', '127.0.0.1', '1549942943', '1549943033');
INSERT INTO `sys_session` VALUES ('5b8d0600da5c3f15ed11170836345be1', '21', '2019-02-12 15:28:31', '127.0.0.1', '127.0.0.1', '1549955985', '1549956511');
INSERT INTO `sys_session` VALUES ('5b8d219180b038b63661aaf18ab5937b', '21', '2019-02-22 13:59:35', '127.0.0.1', '127.0.0.1', '1550815158', '1550815175');
INSERT INTO `sys_session` VALUES ('5b913baa85e7da68ed05b44076580ab7', '21', '2019-01-19 14:20:32', '127.0.0.1', '127.0.0.1', '1547878683', '1547878832');
INSERT INTO `sys_session` VALUES ('5bc590562fe7451f45a8ea27e6e92a0b', '21', '2019-01-19 14:15:57', '127.0.0.1', '127.0.0.1', '1547878322', '1547878557');
INSERT INTO `sys_session` VALUES ('5bd3e87f1444bfceeddc1510f86f7265', '21', '2019-01-21 11:23:40', '127.0.0.1', '127.0.0.1', '1548040980', '1548041020');
INSERT INTO `sys_session` VALUES ('5bf61eaab9f06e3f91da3f57c54fb4dc', '37', '2019-01-25 15:18:13', '127.0.0.1', '127.0.0.1', '1548400604', '1548400693');
INSERT INTO `sys_session` VALUES ('5c83acce3c4194ec472e9d5478f57e47', '21', '2019-02-11 19:34:15', '127.0.0.1', '127.0.0.1', '1549879074', '1549884855');
INSERT INTO `sys_session` VALUES ('5cacdd361c3f84845d0ed87c4283f214', '37', '2019-01-28 21:20:32', '127.0.0.1', '127.0.0.1', '1548681366', '1548681632');
INSERT INTO `sys_session` VALUES ('5cef7406c2b48d6be615a1e5f7ee9076', '37', '2019-01-30 15:58:55', '127.0.0.1', '127.0.0.1', '1548816949', '1548835135');
INSERT INTO `sys_session` VALUES ('5d8511bf128b9c3bcd22cb7fca987780', '37', '2019-01-29 13:46:15', '127.0.0.1', '127.0.0.1', '1548740653', '1548740775');
INSERT INTO `sys_session` VALUES ('5ddf18b9382b02c152c92b6c165aa0fb', '21', '2019-03-04 09:45:34', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551662916', '1551663934');
INSERT INTO `sys_session` VALUES ('5fda50a473acdd0f57342bfc3b146a39', '21', '2019-01-21 16:06:15', '127.0.0.1', '127.0.0.1', '1548057602', '1548057975');
INSERT INTO `sys_session` VALUES ('60609cf396adeb3396253d3425b47fc8', '21', '2019-01-25 14:57:22', '127.0.0.1', '127.0.0.1', '1548399407', '1548399442');
INSERT INTO `sys_session` VALUES ('606510119dcd6c499c255c72da7b5c5f', '21', '2019-01-20 22:22:43', '127.0.0.1', '127.0.0.1', '1547994115', '1547994163');
INSERT INTO `sys_session` VALUES ('6068cb2dedd499a28e4c1ac9ac0070d6', '21', '2019-02-28 18:11:16', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551346920', '1551348676');
INSERT INTO `sys_session` VALUES ('606ad1230af5ce52774a04602409a84c', '21', '2019-01-25 14:40:18', '127.0.0.1', '127.0.0.1', '1548398239', '1548398418');
INSERT INTO `sys_session` VALUES ('607096a4509d05af518df3ae76a464db', '21', '2019-01-23 14:37:41', '127.0.0.1', '127.0.0.1', '1548225413', '1548225461');
INSERT INTO `sys_session` VALUES ('6083a1e2370b50f0b103ee657b56c81a', '21', '2019-01-25 13:50:35', '127.0.0.1', '127.0.0.1', '1548395371', '1548395435');
INSERT INTO `sys_session` VALUES ('60a01c2e63a73b9f435b3197b9b534ae', '21', '2019-01-24 19:40:54', '127.0.0.1', '127.0.0.1', '1548327845', '1548330054');
INSERT INTO `sys_session` VALUES ('60b35e5bd898b4b7fe6492683a17101e', '21', '2019-01-16 19:54:51', '127.0.0.1', '127.0.0.1', '1547638997', '1547639691');
INSERT INTO `sys_session` VALUES ('60d82546becc8f41027268fa5442424f', '21', '2019-01-31 16:15:15', '127.0.0.1', '127.0.0.1', '1548921003', '1548922515');
INSERT INTO `sys_session` VALUES ('611b25f08a7e166639866f32e99e01f4', '21', '2019-01-16 17:19:24', '127.0.0.1', '127.0.0.1', '1547630319', '1547630364');
INSERT INTO `sys_session` VALUES ('613e9c779068bf708f7cbad84d667bda', '21', '2019-01-21 16:10:23', '127.0.0.1', '127.0.0.1', '1548058054', '1548058223');
INSERT INTO `sys_session` VALUES ('6146de8397c1d79da3d12c4fd8497ac6', '21', '2019-02-16 14:37:50', '127.0.0.1', '127.0.0.1', '1550299015', '1550299070');
INSERT INTO `sys_session` VALUES ('615d4581fa70567c68696ab2e82d8205', '21', '2019-01-25 11:46:22', '127.0.0.1', '127.0.0.1', '1548384218', '1548387982');
INSERT INTO `sys_session` VALUES ('6189cfb65861e549e31a6b8f2364eb24', '41', '2019-01-29 16:33:44', '127.0.0.1', '127.0.0.1', '1548750794', '1548750824');
INSERT INTO `sys_session` VALUES ('61e7aeb1dce18c81453503df5e65fe46', '21', '2019-02-12 14:43:18', '127.0.0.1', '127.0.0.1', '1549953358', '1549953798');
INSERT INTO `sys_session` VALUES ('62d9c34ce19b921fc0c11d3f6b69de63', '21', '2019-02-11 11:41:03', '127.0.0.1', '127.0.0.1', '1549856169', '1549856463');
INSERT INTO `sys_session` VALUES ('62dbb3ed24b949b60a7879fc64635ab2', '21', '2019-01-16 16:59:28', '127.0.0.1', '127.0.0.1', '1547629057', '1547629168');
INSERT INTO `sys_session` VALUES ('634b5b615b3d523d1bd716b5a602ab1e', '21', '2019-01-16 17:18:39', '127.0.0.1', '127.0.0.1', '1547630308', '1547630319');
INSERT INTO `sys_session` VALUES ('635eb82cdc09a19308f675416e4a65cd', '21', '2019-02-16 14:36:55', '127.0.0.1', '127.0.0.1', '1550298737', '1550299015');
INSERT INTO `sys_session` VALUES ('63da098050f5658ce659c385e7a31d1c', '21', '2019-02-01 11:15:18', '127.0.0.1', '127.0.0.1', '1548990888', '1548990917');
INSERT INTO `sys_session` VALUES ('640656063bada13fec1fc602c6df2ea7', '21', '2019-01-24 18:02:59', '127.0.0.1', '127.0.0.1', '1548324082', '1548324179');
INSERT INTO `sys_session` VALUES ('641af840a63d322afd46c5944c48ee7c', '41', '2019-01-29 16:33:44', '127.0.0.1', null, '1548750824', '0');
INSERT INTO `sys_session` VALUES ('641bead337bfc7f81e26d2f014fe3ff8', '31', '2019-02-11 20:16:01', '127.0.0.1', null, '1549887361', '0');
INSERT INTO `sys_session` VALUES ('6449818068ef94dcdbbe264f899e8040', '21', '2019-02-20 14:19:15', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550633612', '1550643555');
INSERT INTO `sys_session` VALUES ('64830d1aec09b6d601449a0a0fe6dddf', '21', '2019-01-21 16:35:39', '127.0.0.1', '127.0.0.1', '1548059407', '1548059739');
INSERT INTO `sys_session` VALUES ('6524bb037c7f1f3d88d80e73f86b6f65', '21', '2019-02-11 20:16:14', '127.0.0.1', '127.0.0.1', '1549885348', '1549887374');
INSERT INTO `sys_session` VALUES ('654110d49ccf0e3f68739261a472865d', '21', '2019-01-20 10:10:28', '127.0.0.1', '127.0.0.1', '1547916009', '1547950228');
INSERT INTO `sys_session` VALUES ('65b1eeafcbca122ad5280529a4b90ca4', '21', '2019-01-16 17:19:35', '127.0.0.1', '127.0.0.1', '1547630375', '1547630375');
INSERT INTO `sys_session` VALUES ('65f64202739b704d9c099ed0c57dd5e7', '47', '2019-02-16 16:19:20', '127.0.0.1', null, '1550305160', '0');
INSERT INTO `sys_session` VALUES ('65fff17b5edc86a0d1917498ce2ade9b', '21', '2019-01-22 17:49:09', '127.0.0.1', '127.0.0.1', '1548150516', '1548150549');
INSERT INTO `sys_session` VALUES ('662cb3fe73b516d8ef46b31e910d8c09', '21', '2019-02-28 09:23:17', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551316484', '1551316997');
INSERT INTO `sys_session` VALUES ('6664c69cf1edae1040631db65e50e71c', '21', '2019-01-18 11:16:45', '127.0.0.1', '127.0.0.1', '1547780628', '1547781405');
INSERT INTO `sys_session` VALUES ('66985892b52c2a1452254d792314c78e', '21', '2019-01-16 17:04:51', '127.0.0.1', '127.0.0.1', '1547629331', '1547629491');
INSERT INTO `sys_session` VALUES ('66fbbc74043c48978f3d111f1a3bc7bd', '21', '2019-01-20 20:44:01', '127.0.0.1', '127.0.0.1', '1547988039', '1547988241');
INSERT INTO `sys_session` VALUES ('6717941d926c8bac0d36e66708de5708', '21', '2019-01-21 11:32:16', '127.0.0.1', '127.0.0.1', '1548041283', '1548041536');
INSERT INTO `sys_session` VALUES ('672769f4d38ef8568b3c7432e840177a', '21', '2019-01-25 19:27:47', '127.0.0.1', '127.0.0.1', '1548415525', '1548415667');
INSERT INTO `sys_session` VALUES ('676fe9231101ffcd06bf45b440b7df6d', '21', '2019-01-21 11:28:03', '127.0.0.1', '127.0.0.1', '1548041020', '1548041283');
INSERT INTO `sys_session` VALUES ('6789c78a473cf0533644be1779e1622f', '21', '2019-01-24 22:47:53', '127.0.0.1', '127.0.0.1', '1548340848', '1548341273');
INSERT INTO `sys_session` VALUES ('6796680d5fc10b073202b55f32c6476d', '21', '2019-01-24 22:54:57', '127.0.0.1', '127.0.0.1', '1548341468', '1548341697');
INSERT INTO `sys_session` VALUES ('67a4c85ad7dece708f56eef2f0b04417', '21', '2019-01-17 13:38:24', '127.0.0.1', '127.0.0.1', '1547703482', '1547703504');
INSERT INTO `sys_session` VALUES ('67c0df2eb557d1308e4df9465b20972e', '21', '2019-02-11 11:22:03', '127.0.0.1', '127.0.0.1', '1549855305', '1549855323');
INSERT INTO `sys_session` VALUES ('6802498125ced0731d1ad18df7ecb92d', '21', '2019-02-27 09:30:32', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551230352', '1551231032');
INSERT INTO `sys_session` VALUES ('680349f26d0f2aae0f07a19e4b05fbce', '21', '2019-01-23 14:52:26', '127.0.0.1', '127.0.0.1', '1548226220', '1548226346');
INSERT INTO `sys_session` VALUES ('680707b2a45d2bf63656a2c80f1a45be', '21', '2019-01-21 16:06:53', '127.0.0.1', '127.0.0.1', '1548057975', '1548058013');
INSERT INTO `sys_session` VALUES ('686f48970d6e057ddfe81b1cda245dcd', '21', '2019-01-31 15:50:03', '127.0.0.1', '127.0.0.1', '1548920972', '1548921003');
INSERT INTO `sys_session` VALUES ('68a30046840b2c7baec00d9a991856da', '21', '2019-02-27 18:27:45', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551263122', '1551263265');
INSERT INTO `sys_session` VALUES ('693fe9673281bfecef507add49c28246', '21', '2019-02-28 16:21:15', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551341023', '1551342075');
INSERT INTO `sys_session` VALUES ('6979d6793557b44148fed355a01f1c98', '21', '2019-01-24 20:39:48', '127.0.0.1', '127.0.0.1', '1548333343', '1548333588');
INSERT INTO `sys_session` VALUES ('69c589cf79e2f4ef66036df07cef7938', '21', '2019-02-16 15:00:13', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550300302', '1550300413');
INSERT INTO `sys_session` VALUES ('6ab006088c7d91a6fb6c57c508b86f7b', '21', '2019-01-24 19:45:59', '127.0.0.1', '127.0.0.1', '1548330308', '1548330359');
INSERT INTO `sys_session` VALUES ('6abd2013e829bf27c9051a23cf4d3049', '21', '2019-02-01 11:35:42', '127.0.0.1', '127.0.0.1', '1548991948', '1548992142');
INSERT INTO `sys_session` VALUES ('6ad8de2da172bc8d8c75a052c779166f', '21', '2019-01-21 11:44:22', '127.0.0.1', '127.0.0.1', '1548041536', '1548042262');
INSERT INTO `sys_session` VALUES ('6b39f0f5e366a41f6f8e0c80fb591f1a', '21', '2019-01-16 21:13:54', '127.0.0.1', '127.0.0.1', '1547644362', '1547644434');
INSERT INTO `sys_session` VALUES ('6bd2d9224893ead1185c115796bd4e91', '21', '2019-01-23 14:49:52', '127.0.0.1', '127.0.0.1', '1548225942', '1548226192');
INSERT INTO `sys_session` VALUES ('6c3c8d97e2c35b029b913e625db2a684', '21', '2019-02-11 17:06:33', '127.0.0.1', '127.0.0.1', '1549875543', '1549875993');
INSERT INTO `sys_session` VALUES ('6c7972739c709258e3f6289810567a8b', '37', '2019-01-28 10:54:58', '127.0.0.1', '127.0.0.1', '1548643844', '1548644098');
INSERT INTO `sys_session` VALUES ('6c9e9040dc30597f5c931cb30fba76dd', '37', '2019-01-28 11:08:47', '127.0.0.1', '127.0.0.1', '1548644897', '1548644927');
INSERT INTO `sys_session` VALUES ('6cae5f924ed0a98582f9ab5b07709751', '21', '2019-01-17 13:43:06', '127.0.0.1', '127.0.0.1', '1547703734', '1547703786');
INSERT INTO `sys_session` VALUES ('6cb8803388bf9b36a8bc62a38016c222', '37', '2019-01-28 11:27:47', '127.0.0.1', '127.0.0.1', '1548646034', '1548646067');
INSERT INTO `sys_session` VALUES ('6e2e6ec732ea1bafa54e0ec56f7f8e1e', '37', '2019-01-25 18:43:01', '127.0.0.1', '127.0.0.1', '1548408481', '1548412980');
INSERT INTO `sys_session` VALUES ('6eb496e6f90171705d79f0269add3ae4', '21', '2019-01-23 15:39:06', '127.0.0.1', '127.0.0.1', '1548227070', '1548229146');
INSERT INTO `sys_session` VALUES ('6ec1be46ae7fe517ecd94b6f692eb179', '37', '2019-01-28 15:15:38', '127.0.0.1', '127.0.0.1', '1548659697', '1548659738');
INSERT INTO `sys_session` VALUES ('6fe37da0954cde3bb120e2a77bed84be', '21', '2019-01-17 14:57:25', '127.0.0.1', '127.0.0.1', '1547707935', '1547708245');
INSERT INTO `sys_session` VALUES ('7004a2576db932f3d240dd2259477e30', '21', '2019-01-17 11:23:36', '127.0.0.1', '127.0.0.1', '1547695299', '1547695416');
INSERT INTO `sys_session` VALUES ('702c8d32b9ef2204417181caa570ee98', '21', '2019-02-18 15:16:41', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550474198', '1550474201');
INSERT INTO `sys_session` VALUES ('7058f3b08a4b3278e99f37b1a0c74ba0', '21', '2019-01-31 16:57:10', '127.0.0.1', '127.0.0.1', '1548924752', '1548925030');
INSERT INTO `sys_session` VALUES ('708cd2c0d0f57b689c593979360e7e3e', '21', '2019-01-31 14:58:54', '127.0.0.1', '127.0.0.1', '1548851045', '1548917934');
INSERT INTO `sys_session` VALUES ('70e8774708c10187fb332d1caed588bc', '21', '2019-02-11 11:30:03', '127.0.0.1', '127.0.0.1', '1549855642', '1549855803');
INSERT INTO `sys_session` VALUES ('710aea7ef85199df2c624e77087f7bdd', '21', '2019-01-31 16:20:22', '127.0.0.1', '127.0.0.1', '1548922740', '1548922822');
INSERT INTO `sys_session` VALUES ('7223e52a382d9dc332244e9cc6e91cfd', '21', '2019-02-01 13:38:16', '127.0.0.1', '127.0.0.1', '1548999448', '1548999495');
INSERT INTO `sys_session` VALUES ('739fc86ea730a45143baf53ba66ec529', '21', '2019-01-25 18:02:47', '127.0.0.1', '127.0.0.1', '1548409060', '1548410567');
INSERT INTO `sys_session` VALUES ('73a248284ccdbc02f6d180ef7b3781b0', '21', '2019-02-01 09:35:39', '127.0.0.1', '127.0.0.1', '1548928674', '1548984939');
INSERT INTO `sys_session` VALUES ('7411e9b7322d98cb581af8f0eedc50be', '21', '2019-01-23 14:36:53', '127.0.0.1', '127.0.0.1', '1548225381', '1548225413');
INSERT INTO `sys_session` VALUES ('7456e3a8c9a6a9f4429936d11bf0ecef', '21', '2019-02-28 09:36:36', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551316997', '1551317796');
INSERT INTO `sys_session` VALUES ('74b8c76097ea7b48619390cca04d0aac', '21', '2019-01-17 14:31:29', '127.0.0.1', '127.0.0.1', '1547706520', '1547706689');
INSERT INTO `sys_session` VALUES ('74d117198b1e44763a298e0f2c10e2a6', '21', '2019-01-17 15:08:33', '127.0.0.1', '127.0.0.1', '1547708627', '1547708913');
INSERT INTO `sys_session` VALUES ('750215cd117ea2312ab3e80444cf4b54', '21', '2019-02-16 13:44:27', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550295340', '1550295867');
INSERT INTO `sys_session` VALUES ('758eb29eebcfe68585b11176266ea373', '21', '2019-01-25 13:36:33', '127.0.0.1', '127.0.0.1', '1548394419', '1548394593');
INSERT INTO `sys_session` VALUES ('762f9a9e512c879c6fc01f136d50f9e6', '21', '2019-01-24 11:09:44', '127.0.0.1', '127.0.0.1', '1548299304', '1548299384');
INSERT INTO `sys_session` VALUES ('76401a2fb400937cae2d548e51576502', '37', '2019-01-25 17:05:14', '127.0.0.1', '127.0.0.1', '1548405443', '1548407114');
INSERT INTO `sys_session` VALUES ('766bd823f90df12bcad0aaa9ba32e5f5', '37', '2019-01-30 16:00:18', '127.0.0.1', '127.0.0.1', '1548835135', '1548835218');
INSERT INTO `sys_session` VALUES ('76e7f1c8b910defbf5e4577661f18dd2', '21', '2019-01-25 14:19:12', '127.0.0.1', '127.0.0.1', '1548397104', '1548397152');
INSERT INTO `sys_session` VALUES ('77974e65271aa671b57824e011954e52', '21', '2019-01-23 14:44:57', '127.0.0.1', '127.0.0.1', '1548225863', '1548225897');
INSERT INTO `sys_session` VALUES ('77c6f3590afec9f851d8a6ea48e66cc2', '21', '2019-02-13 17:17:55', '127.0.0.1', '127.0.0.1', '1550047821', '1550049475');
INSERT INTO `sys_session` VALUES ('78034e128585b790d0b7af5f9c1ad3a5', '21', '2019-02-20 11:33:32', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550632218', '1550633612');
INSERT INTO `sys_session` VALUES ('7808e4447b17f586055a80058c676eb5', '21', '2019-01-23 17:40:24', '127.0.0.1', '127.0.0.1', '1548236373', '1548236424');
INSERT INTO `sys_session` VALUES ('782b55e877af2e01ddc91019107f8ae6', '21', '2019-01-17 13:16:24', '127.0.0.1', '127.0.0.1', '1547702160', '1547702184');
INSERT INTO `sys_session` VALUES ('78e97774a78333e96820f3810d0d3018', '21', '2019-01-20 20:48:31', '127.0.0.1', '127.0.0.1', '1547988423', '1547988511');
INSERT INTO `sys_session` VALUES ('79b01785b034bcf0a4d93fe472aaf460', '21', '2019-02-27 18:05:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551261760', '1551261946');
INSERT INTO `sys_session` VALUES ('7a3ac996f1855dcc4398f9e000ddff1e', '21', '2019-02-11 14:10:55', '127.0.0.1', '127.0.0.1', '1549861613', '1549865455');
INSERT INTO `sys_session` VALUES ('7a752b95907d0ac55511bcb4f42b9ffa', '21', '2019-01-16 16:57:37', '127.0.0.1', '127.0.0.1', '1547629057', '1547629057');
INSERT INTO `sys_session` VALUES ('7b0b32092d69c8cc5576fca7d4aec44a', '21', '2019-02-13 15:02:23', '127.0.0.1', '127.0.0.1', '1550041256', '1550041343');
INSERT INTO `sys_session` VALUES ('7b6ee44acee02e6fb876800cf5159522', '21', '2019-01-21 09:41:15', '127.0.0.1', '127.0.0.1', '1548034741', '1548034875');
INSERT INTO `sys_session` VALUES ('7c52bd72a3e15a41b194e11f688f1e5e', '21', '2019-02-22 10:28:31', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550802406', '1550802511');
INSERT INTO `sys_session` VALUES ('7d3780bbb8b484acb8b258206bb7271c', '21', '2019-01-24 11:12:07', '127.0.0.1', '127.0.0.1', '1548299384', '1548299527');
INSERT INTO `sys_session` VALUES ('7d47d1d08c469b15040376de9f0da9db', '21', '2019-01-18 10:51:58', '127.0.0.1', '127.0.0.1', '1547714639', '1547779918');
INSERT INTO `sys_session` VALUES ('7d4c5e6a601bdaa06daeab257c6f5bbc', '37', '2019-01-25 17:24:41', '127.0.0.1', '127.0.0.1', '1548408238', '1548408281');
INSERT INTO `sys_session` VALUES ('7d727391d85d7710db64f11fd5e58fd9', '21', '2019-01-22 14:34:26', '127.0.0.1', '127.0.0.1', '1548138789', '1548138866');
INSERT INTO `sys_session` VALUES ('7dadbd14ecd175d51f02e7bc476ee959', '21', '2019-02-11 17:55:50', '127.0.0.1', '127.0.0.1', '1549878489', '1549878950');
INSERT INTO `sys_session` VALUES ('7db01848b88a7bd133de9589bcbf0f59', '21', '2019-02-16 14:04:29', '0:0:0:0:0:0:0:1', '127.0.0.1', '1550295867', '1550297069');
INSERT INTO `sys_session` VALUES ('7dcda4ddf4c3dc789d84326623e3b83c', '37', '2019-01-28 11:27:14', '127.0.0.1', '127.0.0.1', '1548645935', '1548646034');
INSERT INTO `sys_session` VALUES ('7de15d9faa1e3a6041cd7d4145608759', '37', '2019-01-30 10:01:26', '127.0.0.1', '127.0.0.1', '1548813288', '1548813686');
INSERT INTO `sys_session` VALUES ('7de3d3e71f120a1fc2f1eb96b758b165', '21', '2019-02-28 18:19:51', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551348676', '1551349191');
INSERT INTO `sys_session` VALUES ('7dfddedd896a9782079816152297b9fd', '21', '2019-01-22 20:26:04', '127.0.0.1', '127.0.0.1', '1548159325', '1548159964');
INSERT INTO `sys_session` VALUES ('7e21d2083e488368a270455a6521abf8', '41', '2019-01-29 16:33:14', '127.0.0.1', '127.0.0.1', '1548493815', '1548750794');
INSERT INTO `sys_session` VALUES ('7e2f4eb5b743d47409140d5acb1fa99a', '21', '2019-02-11 16:58:16', '127.0.0.1', '127.0.0.1', '1549875458', '1549875496');
INSERT INTO `sys_session` VALUES ('7e461ef45e9b61d775649086b486b9be', '21', '2019-01-21 15:51:10', '127.0.0.1', '127.0.0.1', '1548056916', '1548057070');
INSERT INTO `sys_session` VALUES ('7e4d2d7ac19df428cdc202841fa5da09', '21', '2019-02-20 11:10:18', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550478120', '1550632218');
INSERT INTO `sys_session` VALUES ('7e78b2bacc4044a28ecf68a3819fbb68', '21', '2019-01-25 19:25:25', '127.0.0.1', '127.0.0.1', '1548410923', '1548415525');
INSERT INTO `sys_session` VALUES ('7ec4183b589e13658965919cc0b78f9d', '21', '2019-02-20 14:37:08', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550643986', '1550644628');
INSERT INTO `sys_session` VALUES ('7f6fd4916c225402d83f85cdf78a3343', '21', '2019-02-27 16:06:30', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551251266', '1551254790');
INSERT INTO `sys_session` VALUES ('8050bfa647dab3fd4695f5aaef8bd13f', '37', '2019-01-29 09:43:39', '127.0.0.1', '127.0.0.1', '1548681794', '1548726219');
INSERT INTO `sys_session` VALUES ('814d56380af1958b2c27796af4ec43e4', '21', '2019-02-12 15:16:35', '127.0.0.1', '127.0.0.1', '1549953798', '1549955795');
INSERT INTO `sys_session` VALUES ('81c24233c403c107bef7efb4dd202568', '21', '2019-01-21 11:50:13', '127.0.0.1', '127.0.0.1', '1548042506', '1548042612');
INSERT INTO `sys_session` VALUES ('8252813e2ffd4247926c7fccc573b37a', '21', '2019-01-17 15:58:01', '127.0.0.1', '127.0.0.1', '1547711184', '1547711881');
INSERT INTO `sys_session` VALUES ('82617fce868e5d4f9b2bf687a16192e8', '37', '2019-01-28 15:23:44', '127.0.0.1', '127.0.0.1', '1548660102', '1548660224');
INSERT INTO `sys_session` VALUES ('827c1f0ac8747b699ff4f9df7017deb1', '21', '2019-01-16 15:56:59', '127.0.0.1', '127.0.0.1', '1547625391', '1547625419');
INSERT INTO `sys_session` VALUES ('8315f764b2ded1689f22ae5907b42d98', '21', '2019-01-24 20:35:43', '127.0.0.1', '127.0.0.1', '1548333325', '1548333343');
INSERT INTO `sys_session` VALUES ('838d288e9482a2e5c4b3a6bc4374a54d', '21', '2019-01-31 17:16:24', '127.0.0.1', '127.0.0.1', '1548925586', '1548926184');
INSERT INTO `sys_session` VALUES ('83a56beaf308197d15fbff8ba6495ac9', '21', '2019-02-12 10:08:24', '127.0.0.1', '127.0.0.1', '1549937283', '1549937304');
INSERT INTO `sys_session` VALUES ('83b460b84d4c422b99ddb4e40bf8e709', '21', '2019-01-31 17:56:09', '127.0.0.1', '127.0.0.1', '1548928527', '1548928569');
INSERT INTO `sys_session` VALUES ('83b9810fae0cccd8dc9fcb6895d98f5b', '21', '2019-01-16 16:00:23', '127.0.0.1', '127.0.0.1', '1547625591', '1547625623');
INSERT INTO `sys_session` VALUES ('8425851fac949aba454d6844aa59ac86', '21', '2019-03-01 17:07:48', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551426334', '1551431268');
INSERT INTO `sys_session` VALUES ('84272251936dd3adcb300ab6780b4376', '31', '2019-01-29 15:18:06', '127.0.0.1', '127.0.0.1', '1548746234', '1548746286');
INSERT INTO `sys_session` VALUES ('850c55df8ce3fcbae04f1ddf3ecfbb15', '21', '2019-01-20 21:59:08', '127.0.0.1', '127.0.0.1', '1547992469', '1547992748');
INSERT INTO `sys_session` VALUES ('858000d725556e7fc41c06a463515b45', '37', '2019-01-26 17:10:35', '127.0.0.1', '127.0.0.1', '1548415503', '1548493835');
INSERT INTO `sys_session` VALUES ('85f5fd1743a391e24bffc3ab80d9682a', '21', '2019-01-23 14:44:23', '127.0.0.1', '127.0.0.1', '1548225827', '1548225863');
INSERT INTO `sys_session` VALUES ('8630b19ea2a737d331b7a4efd0fbc1a6', '37', '2019-01-28 21:16:06', '127.0.0.1', '127.0.0.1', '1548660224', '1548681366');
INSERT INTO `sys_session` VALUES ('864110af021274c3a8eaf8a8036227c4', '21', '2019-01-17 13:14:00', '127.0.0.1', '127.0.0.1', '1547701992', '1547702040');
INSERT INTO `sys_session` VALUES ('86afacd7142d409d7c528fca2cf0eace', '21', '2019-01-16 21:12:42', '127.0.0.1', '127.0.0.1', '1547644322', '1547644362');
INSERT INTO `sys_session` VALUES ('86d652edf633bed66eb24f1b9c646eea', '21', '2019-01-26 16:56:17', '127.0.0.1', '127.0.0.1', '1548492417', '1548492977');
INSERT INTO `sys_session` VALUES ('876f758b0db2ddf1ef70285db8ff1bb1', '21', '2019-01-24 19:48:03', '127.0.0.1', '127.0.0.1', '1548330359', '1548330483');
INSERT INTO `sys_session` VALUES ('8771f32c1f828ea19250b124cc91c72f', '21', '2019-01-17 15:45:24', '127.0.0.1', '127.0.0.1', '1547710033', '1547711124');
INSERT INTO `sys_session` VALUES ('87b316f3ef4c44eed54fd3897bb5ad27', '21', '2019-01-24 17:57:19', '127.0.0.1', '127.0.0.1', '1548323786', '1548323839');
INSERT INTO `sys_session` VALUES ('880cdfd073aa27e75b069b6d08465a99', '37', '2019-01-29 10:16:43', '127.0.0.1', '127.0.0.1', '1548727965', '1548728203');
INSERT INTO `sys_session` VALUES ('88276750f1a9a71e7a1f81cbfd7874b4', '21', '2019-02-28 09:48:33', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551318240', '1551318513');
INSERT INTO `sys_session` VALUES ('884bda48e47a9ba4f9c9d533a28dc002', '21', '2019-02-11 20:20:50', '127.0.0.1', '127.0.0.1', '1549887374', '1549887650');
INSERT INTO `sys_session` VALUES ('8881a3e42c7f08bf0e4f29d63b0b5468', '21', '2019-02-22 13:49:34', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550814113', '1550814574');
INSERT INTO `sys_session` VALUES ('88828f9de976016c8b0e12004a571ded', '21', '2019-01-23 14:31:23', '127.0.0.1', '127.0.0.1', '1548224530', '1548225083');
INSERT INTO `sys_session` VALUES ('88f300a5831a08fafc65615f3109e9e5', '21', '2019-01-16 15:47:17', '127.0.0.1', '127.0.0.1', '1547624808', '1547624837');
INSERT INTO `sys_session` VALUES ('8914da580a833044019f8f77077697e6', '37', '2019-01-25 17:23:58', '127.0.0.1', '127.0.0.1', '1548408171', '1548408238');
INSERT INTO `sys_session` VALUES ('89325286503aa3643913ebe0daca3eb8', '21', '2019-02-26 11:37:09', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551150915', '1551152229');
INSERT INTO `sys_session` VALUES ('8945c94b6bcaaf1bf6267f98eb145094', '21', '2019-02-01 09:42:46', '127.0.0.1', '127.0.0.1', '1548985116', '1548985366');
INSERT INTO `sys_session` VALUES ('8960c7f4a15218a223e43969cb43714d', '21', '2019-02-13 14:00:55', '127.0.0.1', '127.0.0.1', '1550027139', '1550037655');
INSERT INTO `sys_session` VALUES ('89d0b5736984829bb17d0aa159a1da10', '37', '2019-01-25 17:28:01', '127.0.0.1', '127.0.0.1', '1548408281', '1548408481');
INSERT INTO `sys_session` VALUES ('8a0f84c6ba7b80c5b946900399e6a968', '21', '2019-01-17 13:44:40', '127.0.0.1', '127.0.0.1', '1547703786', '1547703880');
INSERT INTO `sys_session` VALUES ('8a18c231c9dadcb036461fa32f76402d', '21', '2019-01-31 15:18:44', '127.0.0.1', '127.0.0.1', '1548918369', '1548919124');
INSERT INTO `sys_session` VALUES ('8a4f1c1997663def73030a2c8490e63e', '21', '2019-02-11 17:41:47', '127.0.0.1', '127.0.0.1', '1549877529', '1549878107');
INSERT INTO `sys_session` VALUES ('8a8c8a4077d88488970e18708b61f320', '21', '2019-02-11 11:36:09', '127.0.0.1', '127.0.0.1', '1549855803', '1549856169');
INSERT INTO `sys_session` VALUES ('8af0653ac6f63e91bc1493492a304d83', '21', '2019-02-22 13:41:53', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550803324', '1550814113');
INSERT INTO `sys_session` VALUES ('8b484384d1757bfefa0fbe20ccc18f66', '21', '2019-01-20 21:46:34', '127.0.0.1', '127.0.0.1', '1547991884', '1547991994');
INSERT INTO `sys_session` VALUES ('8b795c827e3e0c1baeab90ef24939952', '21', '2019-01-21 10:00:22', '127.0.0.1', '127.0.0.1', '1548035440', '1548036022');
INSERT INTO `sys_session` VALUES ('8bf63347c9b13b089200763f14109316', '21', '2019-01-22 11:01:52', '127.0.0.1', '127.0.0.1', '1548125735', '1548126112');
INSERT INTO `sys_session` VALUES ('8d09f904bdb4343456bb8c25bf363e73', '21', '2019-01-19 14:49:41', '127.0.0.1', '127.0.0.1', '1547878968', '1547880581');
INSERT INTO `sys_session` VALUES ('8d0cd6c4dd1967337efd24e698dd5272', '21', '2019-01-23 14:43:47', '127.0.0.1', '127.0.0.1', '1548225723', '1548225827');
INSERT INTO `sys_session` VALUES ('8d2de644594a48185f2f903dd1bb5a4e', '31', '2019-01-29 15:38:26', '127.0.0.1', '127.0.0.1', '1548747449', '1548747506');
INSERT INTO `sys_session` VALUES ('8d65ab1f462db8e5b8c4bb1962668625', '21', '2019-01-31 17:55:27', '127.0.0.1', '127.0.0.1', '1548926679', '1548928527');
INSERT INTO `sys_session` VALUES ('8d77e47f085bfe3d44c0703d6afaa3de', '37', '2019-01-30 09:54:48', '127.0.0.1', '127.0.0.1', '1548765224', '1548813288');
INSERT INTO `sys_session` VALUES ('8db8ad0b58eeb48ee32b1204d9c22fad', '21', '2019-01-23 17:39:33', '127.0.0.1', '127.0.0.1', '1548236343', '1548236373');
INSERT INTO `sys_session` VALUES ('8e1044aed83a553e6341ae2472d4b8d7', '21', '2019-01-16 17:53:56', '127.0.0.1', '127.0.0.1', '1547631735', '1547632436');
INSERT INTO `sys_session` VALUES ('8eadd7f36eef2fa4958e7a58cd0efc00', '37', '2019-01-25 19:02:44', '127.0.0.1', '127.0.0.1', '1548413513', '1548414164');
INSERT INTO `sys_session` VALUES ('8eb2a2c359c2cd5fff45f0c032c78869', '21', '2019-01-24 18:05:27', '127.0.0.1', '127.0.0.1', '1548324227', '1548324327');
INSERT INTO `sys_session` VALUES ('8f1094e802b6841c40e0347ce2885ed1', '21', '2019-03-04 13:52:02', '0:0:0:0:0:0:0:1', null, '1551678722', '0');
INSERT INTO `sys_session` VALUES ('8f17e55d0e0a008ef3b76120dcb79f6f', '21', '2019-01-31 15:49:32', '127.0.0.1', '127.0.0.1', '1548920932', '1548920972');
INSERT INTO `sys_session` VALUES ('8f1a2b14b55e7d7ab1ce559ab560eedb', '37', '2019-01-30 17:12:56', '127.0.0.1', '127.0.0.1', '1548839570', '1548839576');
INSERT INTO `sys_session` VALUES ('8f3711e41bab471ab5e1a10ee0e9c5eb', '21', '2019-02-12 14:35:58', '127.0.0.1', '127.0.0.1', '1549951923', '1549953358');
INSERT INTO `sys_session` VALUES ('8fc53c5a63c7e24bf34530a0c0feb2f1', '21', '2019-02-12 14:12:03', '127.0.0.1', '127.0.0.1', '1549943033', '1549951923');
INSERT INTO `sys_session` VALUES ('9007dee5b95842626f1d08c4f08c59a6', '21', '2019-01-20 21:38:49', '127.0.0.1', '127.0.0.1', '1547991471', '1547991529');
INSERT INTO `sys_session` VALUES ('90089b4b46b59e8f6c7771a3adc18745', '21', '2019-01-23 14:36:21', '127.0.0.1', '127.0.0.1', '1548225236', '1548225381');
INSERT INTO `sys_session` VALUES ('90257d3e9e879d3f09e1386af7fb3c6a', '21', '2019-01-21 13:35:31', '127.0.0.1', '127.0.0.1', '1548048639', '1548048931');
INSERT INTO `sys_session` VALUES ('9025ecc7cb3336aaf397a54464e163de', '21', '2019-01-21 09:47:43', '127.0.0.1', '127.0.0.1', '1548034875', '1548035263');
INSERT INTO `sys_session` VALUES ('904037ef5760e7b99644db3876558d90', '21', '2019-01-22 11:13:51', '127.0.0.1', '127.0.0.1', '1548126226', '1548126831');
INSERT INTO `sys_session` VALUES ('906d6e42b5625b83b5a8fb5a4a5e678a', '21', '2019-02-11 16:52:33', '127.0.0.1', '127.0.0.1', '1549875049', '1549875153');
INSERT INTO `sys_session` VALUES ('90e36f5a15cf9e25e09fc4561db6d038', '21', '2019-01-24 19:45:08', '127.0.0.1', '127.0.0.1', '1548330054', '1548330308');
INSERT INTO `sys_session` VALUES ('916c354f0acacdfb27f7c2ee47f8081c', '21', '2019-01-20 17:02:33', '127.0.0.1', '127.0.0.1', '1547974923', '1547974953');
INSERT INTO `sys_session` VALUES ('91ac4bb5bc044ca04a6ec0617ec32731', '21', '2019-01-19 13:54:38', '127.0.0.1', '127.0.0.1', '1547876656', '1547877278');
INSERT INTO `sys_session` VALUES ('9246745dde944d3aa4d92d376f65d524', '21', '2019-01-17 16:43:59', '127.0.0.1', '127.0.0.1', '1547711881', '1547714639');
INSERT INTO `sys_session` VALUES ('9247b599b9663b9540d74c8e665bc38c', '21', '2019-01-16 17:02:11', '127.0.0.1', '127.0.0.1', '1547629173', '1547629331');
INSERT INTO `sys_session` VALUES ('925ba7b14b3f2802823942b3f0c47690', '21', '2019-02-13 10:23:17', '127.0.0.1', '127.0.0.1', '1549960664', '1550024597');
INSERT INTO `sys_session` VALUES ('9280340b7d3ccbf45ba1b7c674809b85', '21', '2019-02-28 17:14:12', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551344729', '1551345252');
INSERT INTO `sys_session` VALUES ('92f51f167a69ac6c8e02798f7c5a6150', '21', '2019-01-26 12:03:49', '127.0.0.1', '127.0.0.1', '1548473613', '1548475429');
INSERT INTO `sys_session` VALUES ('932c408bdf8946050f84091625f7a4f9', '21', '2019-01-16 17:35:53', '127.0.0.1', '127.0.0.1', '1547630908', '1547631353');
INSERT INTO `sys_session` VALUES ('935e2eb027e48fda0d15ef199e326a44', '21', '2019-01-23 17:19:05', '127.0.0.1', '127.0.0.1', '1548234920', '1548235145');
INSERT INTO `sys_session` VALUES ('938cedbfe9020de639fbee7a75352da5', '21', '2019-01-20 21:37:51', '127.0.0.1', '127.0.0.1', '1547990426', '1547991471');
INSERT INTO `sys_session` VALUES ('93916cc40cf058620fb21241aa66161e', '21', '2019-01-17 14:28:40', '127.0.0.1', '127.0.0.1', '1547706425', '1547706520');
INSERT INTO `sys_session` VALUES ('93a6ca95a08b1e226685cc59ce2f4d76', '21', '2019-01-21 15:46:21', '127.0.0.1', '127.0.0.1', '1548056617', '1548056781');
INSERT INTO `sys_session` VALUES ('940c65695acc4c9dfa67bd96f68e8908', '37', '2019-01-28 11:35:57', '127.0.0.1', '127.0.0.1', '1548646412', '1548646557');
INSERT INTO `sys_session` VALUES ('946f562ccf43e52059e5bf7ecdc0b015', '21', '2019-01-24 17:56:26', '127.0.0.1', '127.0.0.1', '1548323754', '1548323786');
INSERT INTO `sys_session` VALUES ('94d989a2422889dcd4a594aa78284fd8', '21', '2019-03-04 09:49:45', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551663935', '1551664185');
INSERT INTO `sys_session` VALUES ('952683959372a52544c9834ec10b1435', '37', '2019-01-29 11:47:43', '127.0.0.1', '127.0.0.1', '1548733553', '1548733663');
INSERT INTO `sys_session` VALUES ('954e15fd43f068a3f222c5bc36d23725', '21', '2019-01-22 10:55:35', '127.0.0.1', '127.0.0.1', '1548125594', '1548125735');
INSERT INTO `sys_session` VALUES ('95690422e6f4134f35c3d342b888924c', '21', '2019-01-21 13:17:10', '127.0.0.1', '127.0.0.1', '1548047507', '1548047830');
INSERT INTO `sys_session` VALUES ('95721cd27a98a6e75a54214181a88c47', '21', '2019-01-22 14:36:51', '127.0.0.1', '127.0.0.1', '1548138866', '1548139011');
INSERT INTO `sys_session` VALUES ('9585aaca1e1f885288187b5220816058', '21', '2019-01-24 22:51:08', '127.0.0.1', '127.0.0.1', '1548341273', '1548341468');
INSERT INTO `sys_session` VALUES ('95bbfed6eb894548855fbbe159303a31', '21', '2019-01-17 09:51:47', '127.0.0.1', '127.0.0.1', '1547645660', '1547689907');
INSERT INTO `sys_session` VALUES ('96218d7b99705094e5cc3ab2fe08fc7a', '21', '2019-02-27 17:46:26', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551260748', '1551260786');
INSERT INTO `sys_session` VALUES ('967eb72f5d9be3f53df2dac5be4a236f', '21', '2019-02-28 10:09:45', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551318513', '1551319785');
INSERT INTO `sys_session` VALUES ('969e5a5e1576f1ef5f6b0544cc66b4bc', '21', '2019-01-31 16:59:38', '127.0.0.1', '127.0.0.1', '1548925113', '1548925178');
INSERT INTO `sys_session` VALUES ('96a4c62cde8c1e4de830b1b8cf229956', '21', '2019-02-16 16:24:11', '0:0:0:0:0:0:0:1', '127.0.0.1', '1550300413', '1550305451');
INSERT INTO `sys_session` VALUES ('97373fa77ea35a688478b68c7eb2128a', '21', '2019-02-11 17:57:54', '127.0.0.1', '127.0.0.1', '1549878950', '1549879074');
INSERT INTO `sys_session` VALUES ('9779ec4579ed7592dbe37c339bdb27e1', '21', '2019-01-21 12:40:21', '127.0.0.1', '127.0.0.1', '1548045508', '1548045621');
INSERT INTO `sys_session` VALUES ('97b18ea2539b911d4d6b0724a9044dd6', '21', '2019-01-26 12:26:33', '127.0.0.1', '127.0.0.1', '1548476753', '1548476793');
INSERT INTO `sys_session` VALUES ('97d0849440bb99fee086eff2dc84d6ee', '21', '2019-01-31 17:57:54', '127.0.0.1', '127.0.0.1', '1548928569', '1548928674');
INSERT INTO `sys_session` VALUES ('98327254216867056eccd7ae1e1274be', '21', '2019-01-23 17:46:07', '127.0.0.1', '127.0.0.1', '1548236424', '1548236767');
INSERT INTO `sys_session` VALUES ('985421eb9a93e5992cdd6147b87a624a', '37', '2019-01-28 15:09:59', '127.0.0.1', '127.0.0.1', '1548659331', '1548659399');
INSERT INTO `sys_session` VALUES ('98fafa43f16975152eb86b0dc545fab5', '21', '2019-02-25 13:34:53', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551066425', '1551072893');
INSERT INTO `sys_session` VALUES ('992f2c0513d2544193d906dc4df45e5f', '21', '2019-02-16 14:50:57', '127.0.0.1', '0:0:0:0:0:0:0:1', '1550299070', '1550299857');
INSERT INTO `sys_session` VALUES ('993bfc6c738949505250a97b39882f51', '21', '2019-02-13 15:03:30', '127.0.0.1', '127.0.0.1', '1550041389', '1550041410');
INSERT INTO `sys_session` VALUES ('995e2d053df5887e42e45cecd99d0756', '21', '2019-01-22 14:57:15', '127.0.0.1', '127.0.0.1', '1548140143', '1548140235');
INSERT INTO `sys_session` VALUES ('9984572afbcbe26f867378110fc5aafb', '21', '2019-01-24 11:19:46', '127.0.0.1', '127.0.0.1', '1548299783', '1548299986');
INSERT INTO `sys_session` VALUES ('99ca848c6b4f593cd5b245a81b26f4ea', '21', '2019-02-28 16:03:43', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551333750', '1551341023');
INSERT INTO `sys_session` VALUES ('99d82384c4631207ed83ee83ab51546b', '21', '2019-02-13 17:20:59', '127.0.0.1', '127.0.0.1', '1550049571', '1550049659');
INSERT INTO `sys_session` VALUES ('9a0dea709b9b31737b80e61577cec4d0', '37', '2019-01-28 15:08:51', '127.0.0.1', '127.0.0.1', '1548650635', '1548659331');
INSERT INTO `sys_session` VALUES ('9a14b13b4068bdb19b2cfda078d405c0', '31', '2019-01-29 15:34:56', '127.0.0.1', '127.0.0.1', '1548747191', '1548747296');
INSERT INTO `sys_session` VALUES ('9ad6e54eea60ef323468dd301f2ddccb', '21', '2019-01-17 13:37:19', '127.0.0.1', '127.0.0.1', '1547703356', '1547703439');
INSERT INTO `sys_session` VALUES ('9ae7715fdc189dc251f9ff190cc79570', '21', '2019-02-16 14:58:22', '127.0.0.1', '0:0:0:0:0:0:0:1', '1550300083', '1550300302');
INSERT INTO `sys_session` VALUES ('9b17a074afac02feaa548e20be9acaa9', '21', '2019-01-17 14:18:27', '127.0.0.1', '127.0.0.1', '1547705859', '1547705907');
INSERT INTO `sys_session` VALUES ('9b1fa622a4bfcfd44da9a3ef82ba1f98', '21', '2019-02-22 13:59:18', '0:0:0:0:0:0:0:1', '127.0.0.1', '1550814574', '1550815158');
INSERT INTO `sys_session` VALUES ('9ba20d252f528eddb0c2c85835877997', '21', '2019-01-21 17:05:50', '127.0.0.1', '127.0.0.1', '1548061470', '1548061550');
INSERT INTO `sys_session` VALUES ('9bb2fabc0ccfa2a21fef398057126217', '21', '2019-02-01 16:21:45', '127.0.0.1', '127.0.0.1', '1549009193', '1549009305');
INSERT INTO `sys_session` VALUES ('9bfba450cc71a6a651bfd148451ebbfd', '21', '2019-02-11 16:44:01', '127.0.0.1', '127.0.0.1', '1549873426', '1549874641');
INSERT INTO `sys_session` VALUES ('9c2668dcd034c07495c15d449649cbb2', '21', '2019-01-21 17:04:30', '127.0.0.1', '127.0.0.1', '1548061271', '1548061470');
INSERT INTO `sys_session` VALUES ('9c36df3a0af82476af53b738a57545aa', '21', '2019-02-01 16:18:32', '127.0.0.1', '127.0.0.1', '1549009038', '1549009112');
INSERT INTO `sys_session` VALUES ('9cb1becae319a57ac331f7702deb84ce', '21', '2019-01-22 21:00:08', '127.0.0.1', '127.0.0.1', '1548161866', '1548162008');
INSERT INTO `sys_session` VALUES ('9d2d8125c4b8b04d17f4643c2475986e', '21', '2019-01-17 15:27:13', '127.0.0.1', '127.0.0.1', '1547709958', '1547710033');
INSERT INTO `sys_session` VALUES ('9df30240279a947dd246d1b66b653092', '21', '2019-01-21 11:51:30', '127.0.0.1', '127.0.0.1', '1548042613', '1548042690');
INSERT INTO `sys_session` VALUES ('9e3e0e12fb524c7d182bad953977cc13', '31', '2019-01-29 15:31:52', '127.0.0.1', '127.0.0.1', '1548746893', '1548747112');
INSERT INTO `sys_session` VALUES ('9e4cad6c95b136966b472aae155b2090', '21', '2019-02-01 09:38:36', '127.0.0.1', '127.0.0.1', '1548984939', '1548985116');
INSERT INTO `sys_session` VALUES ('9ea4951cd717ceaf1514afe9495aced0', '21', '2019-01-25 12:54:13', '127.0.0.1', '127.0.0.1', '1548387982', '1548392052');
INSERT INTO `sys_session` VALUES ('9f00b2f0be9dd95bc9f2492629e0f97d', '21', '2019-01-22 20:57:46', '127.0.0.1', '127.0.0.1', '1548160150', '1548161866');
INSERT INTO `sys_session` VALUES ('9f18f9684f82d2567f19edfc4e7dfa08', '21', '2019-02-11 16:53:45', '127.0.0.1', '127.0.0.1', '1549875153', '1549875225');
INSERT INTO `sys_session` VALUES ('9f235d6c41bdb3d6a44f298f1369afd7', '21', '2019-01-31 17:00:45', '127.0.0.1', '127.0.0.1', '1548925178', '1548925245');
INSERT INTO `sys_session` VALUES ('9fd635ab1e2ee0ccac6f880f89ea56af', '37', '2019-01-28 21:21:25', '127.0.0.1', '127.0.0.1', '1548681632', '1548681685');
INSERT INTO `sys_session` VALUES ('9fdb806f5489277b6242227eb741f899', '37', '2019-01-25 16:11:02', '127.0.0.1', '127.0.0.1', '1548403387', '1548403862');
INSERT INTO `sys_session` VALUES ('9ff6686b00968c9ad0f9cdf70309e3bc', '21', '2019-01-17 14:10:49', '127.0.0.1', '127.0.0.1', '1547705416', '1547705449');
INSERT INTO `sys_session` VALUES ('a049c4c4537bb6a08cd8e181ed61330e', '21', '2019-01-31 15:22:59', '127.0.0.1', '127.0.0.1', '1548919369', '1548919379');
INSERT INTO `sys_session` VALUES ('a04e06c9b98a3cde54eccf392ed53c9d', '21', '2019-01-19 17:52:42', '127.0.0.1', '127.0.0.1', '1547891468', '1547891562');
INSERT INTO `sys_session` VALUES ('a05698507784f8d3f5e2a5c06f109ea6', '21', '2019-01-25 17:36:09', '127.0.0.1', '127.0.0.1', '1548408847', '1548408969');
INSERT INTO `sys_session` VALUES ('a09fe43196c05e29ba6a16bc09b1d141', '21', '2019-01-23 17:11:55', '127.0.0.1', '127.0.0.1', '1548234589', '1548234715');
INSERT INTO `sys_session` VALUES ('a0f5f4c27c35039a3b8e7bedfd0f80a2', '21', '2019-01-17 14:27:05', '127.0.0.1', '127.0.0.1', '1547706299', '1547706425');
INSERT INTO `sys_session` VALUES ('a16177d6a55af95c2ab6186993bb313c', '37', '2019-01-29 10:05:21', '127.0.0.1', '127.0.0.1', '1548727232', '1548727521');
INSERT INTO `sys_session` VALUES ('a2d45e122e3595cdff407f141b150f71', '21', '2019-02-16 14:22:19', '127.0.0.1', '127.0.0.1', '1550297069', '1550298139');
INSERT INTO `sys_session` VALUES ('a30384ae0f563e93da42b20156b762f1', '21', '2019-01-31 16:52:32', '127.0.0.1', '127.0.0.1', '1548922822', '1548924752');
INSERT INTO `sys_session` VALUES ('a34974f4143c213e37a5e6d2fddeb418', '31', '2019-01-29 15:17:14', '127.0.0.1', '127.0.0.1', '1548746066', '1548746234');
INSERT INTO `sys_session` VALUES ('a3b3a9a07f960d68efa9c4a921064291', '37', '2019-01-29 10:12:45', '127.0.0.1', '127.0.0.1', '1548727676', '1548727965');
INSERT INTO `sys_session` VALUES ('a3b674a7acb897e6ca6f0ab6551b4631', '21', '2019-01-26 16:58:59', '127.0.0.1', '127.0.0.1', '1548492977', '1548493139');
INSERT INTO `sys_session` VALUES ('a3fcce0ae673b4eb84366bb93a03620c', '21', '2019-01-23 17:39:03', '127.0.0.1', '127.0.0.1', '1548235996', '1548236343');
INSERT INTO `sys_session` VALUES ('a4bac8b7f0c2df692e30256532f38b20', '21', '2019-02-01 16:19:53', '127.0.0.1', '127.0.0.1', '1549009112', '1549009193');
INSERT INTO `sys_session` VALUES ('a5736e79c11885810c0ce7ad95d7269f', '21', '2019-01-19 14:21:11', '127.0.0.1', '127.0.0.1', '1547878832', '1547878871');
INSERT INTO `sys_session` VALUES ('a5d69596ce73d7a7116fa71bf55049c9', '21', '2019-01-16 17:54:20', '127.0.0.1', '127.0.0.1', '1547632436', '1547632460');
INSERT INTO `sys_session` VALUES ('a5efa0030cbef648819316dc4a4f1824', '21', '2019-02-01 13:37:28', '127.0.0.1', '127.0.0.1', '1548999416', '1548999448');
INSERT INTO `sys_session` VALUES ('a6b278792e07aa99a6b3b1d970dfae8b', '21', '2019-01-25 10:41:06', '127.0.0.1', '127.0.0.1', '1548382698', '1548384066');
INSERT INTO `sys_session` VALUES ('a6b81eac0b3b0213eb9d794f8499962f', '37', '2019-01-25 16:02:41', '127.0.0.1', '127.0.0.1', '1548403163', '1548403361');
INSERT INTO `sys_session` VALUES ('a6e24760fe1fe2d4748bea31da700611', '21', '2019-01-17 09:59:26', '127.0.0.1', '127.0.0.1', '1547690262', '1547690366');
INSERT INTO `sys_session` VALUES ('a71a790d0821510f3190dffc5377efe0', '21', '2019-02-16 13:35:40', '127.0.0.1', '0:0:0:0:0:0:0:1', '1550289659', '1550295340');
INSERT INTO `sys_session` VALUES ('a78803812995ecb715d94754a8ee0e51', '37', '2019-01-29 11:49:37', '127.0.0.1', '127.0.0.1', '1548733663', '1548733777');
INSERT INTO `sys_session` VALUES ('a791d923f8dc26316be3756b28ddcdd8', '21', '2019-02-27 15:07:45', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551245646', '1551251265');
INSERT INTO `sys_session` VALUES ('a8934170b50500a68e4d2a696d8c4197', '21', '2019-01-16 15:49:26', '127.0.0.1', '127.0.0.1', '1547624837', '1547624966');
INSERT INTO `sys_session` VALUES ('a95e32d02794d7671ab2fa5777e1c4c6', '21', '2019-02-12 16:19:49', '127.0.0.1', '127.0.0.1', '1549956511', '1549959589');
INSERT INTO `sys_session` VALUES ('a98c993727ede918b0073a0632418496', '21', '2019-01-25 10:42:56', '127.0.0.1', '127.0.0.1', '1548384166', '1548384176');
INSERT INTO `sys_session` VALUES ('a9a8a690c6303d08de6852ff35e1ad57', '37', '2019-01-25 19:03:53', '127.0.0.1', '127.0.0.1', '1548414164', '1548414233');
INSERT INTO `sys_session` VALUES ('aa29f3da4ecb04645bd48e0241b82ea4', '21', '2019-01-19 21:35:11', '127.0.0.1', '127.0.0.1', '1547904841', '1547904911');
INSERT INTO `sys_session` VALUES ('aa37a5cef59744b12ddee8b2e0c7459c', '21', '2019-01-31 17:04:51', '127.0.0.1', '127.0.0.1', '1548925371', '1548925491');
INSERT INTO `sys_session` VALUES ('aa4981aebbca309a8879d142450ad049', '21', '2019-02-27 17:45:48', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551259579', '1551260748');
INSERT INTO `sys_session` VALUES ('aa8846f0c79560326f76fa44aa9ee105', '37', '2019-01-29 13:44:13', '127.0.0.1', '127.0.0.1', '1548740610', '1548740653');
INSERT INTO `sys_session` VALUES ('aad2f9f7d2d4733ca5473082199e2ec5', '21', '2019-01-24 09:57:29', '127.0.0.1', '127.0.0.1', '1548240649', '1548295049');
INSERT INTO `sys_session` VALUES ('ab0525d6be0de8a35e06575a0828ee32', '21', '2019-01-22 17:44:53', '127.0.0.1', '127.0.0.1', '1548140235', '1548150293');
INSERT INTO `sys_session` VALUES ('ab1a0019fbd58e668e142db3301be40f', '21', '2019-01-17 10:14:24', '127.0.0.1', '127.0.0.1', '1547691109', '1547691264');
INSERT INTO `sys_session` VALUES ('ab263c38aacb4455ea7b823c6e3915f0', '21', '2019-02-28 10:24:24', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551320436', '1551320664');
INSERT INTO `sys_session` VALUES ('ab722c3bd0c15aef915fafd96a71635c', '21', '2019-01-25 19:41:30', '127.0.0.1', '127.0.0.1', '1548416051', '1548416490');
INSERT INTO `sys_session` VALUES ('ab8e6f6b78646c43a58a4a034aee34fb', '37', '2019-01-29 09:56:36', '127.0.0.1', '127.0.0.1', '1548726928', '1548726996');
INSERT INTO `sys_session` VALUES ('ac0204af930242b3f1122e31c06dc828', '21', '2019-01-24 17:57:57', '127.0.0.1', '127.0.0.1', '1548323839', '1548323877');
INSERT INTO `sys_session` VALUES ('ac7dde371a29027c05690d5c6ab542c2', '21', '2019-01-17 10:00:46', '127.0.0.1', '127.0.0.1', '1547690366', '1547690446');
INSERT INTO `sys_session` VALUES ('acf390d14f057a7df9399a4e8811996c', '21', '2019-01-16 19:59:07', '127.0.0.1', '127.0.0.1', '1547639773', '1547639947');
INSERT INTO `sys_session` VALUES ('ad60416273aa8b507e3f9a7e4e431248', '21', '2019-01-22 14:33:09', '127.0.0.1', '127.0.0.1', '1548126831', '1548138789');
INSERT INTO `sys_session` VALUES ('adf0b6b460b0a65283fc086480163bce', '21', '2019-02-18 15:14:02', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550472690', '1550474042');
INSERT INTO `sys_session` VALUES ('ae7d47e061af429e69e603cb5f15692b', '21', '2019-02-01 16:28:44', '127.0.0.1', '127.0.0.1', '1549009682', '1549009724');
INSERT INTO `sys_session` VALUES ('aeab1a9d55c78e7c76157a43f4108539', '21', '2019-01-31 17:06:26', '127.0.0.1', '127.0.0.1', '1548925491', '1548925586');
INSERT INTO `sys_session` VALUES ('aef902dd8da09ad7a8583ab59c1f6188', '21', '2019-01-17 15:24:26', '127.0.0.1', '127.0.0.1', '1547709491', '1547709866');
INSERT INTO `sys_session` VALUES ('af0ded702948097f43dc3179533e939c', '21', '2019-02-12 10:08:03', '127.0.0.1', '127.0.0.1', '1549887650', '1549937283');
INSERT INTO `sys_session` VALUES ('af128ebf392f3ae136dc68375aace6ca', '21', '2019-01-21 15:43:37', '127.0.0.1', '127.0.0.1', '1548049022', '1548056617');
INSERT INTO `sys_session` VALUES ('af19110dd6fc3cf8228f2df88e480f7d', '42', '2019-01-29 16:05:05', '127.0.0.1', '127.0.0.1', '1548748644', '1548749105');
INSERT INTO `sys_session` VALUES ('af3259c2c31c9da58047dc6f58e71306', '21', '2019-01-23 18:50:49', '127.0.0.1', '127.0.0.1', '1548237846', '1548240649');
INSERT INTO `sys_session` VALUES ('af554e00a70320e7a9828d243c77d0f3', '21', '2019-01-25 17:37:40', '127.0.0.1', '127.0.0.1', '1548408969', '1548409060');
INSERT INTO `sys_session` VALUES ('b0234a9989e4edc4d81a4aa99f30a210', '37', '2019-01-28 11:07:53', '127.0.0.1', '127.0.0.1', '1548644098', '1548644873');
INSERT INTO `sys_session` VALUES ('b03d3de75619ca22c1d493940cbd89c7', '21', '2019-01-20 22:17:38', '127.0.0.1', '127.0.0.1', '1547993353', '1547993858');
INSERT INTO `sys_session` VALUES ('b0415f4024b54769ababf127c4ab4123', '31', '2019-01-29 15:39:32', '127.0.0.1', '127.0.0.1', '1548747506', '1548747572');
INSERT INTO `sys_session` VALUES ('b06db9195f30fd1b5ee72d31b2e125ff', '21', '2019-01-25 13:51:14', '127.0.0.1', '127.0.0.1', '1548395435', '1548395474');
INSERT INTO `sys_session` VALUES ('b09275cc1c47f6af4fb4dcd74467048a', '21', '2019-02-11 17:30:37', '127.0.0.1', '127.0.0.1', '1549875993', '1549877437');
INSERT INTO `sys_session` VALUES ('b0caf37684724b04eda8f45a00d4112e', '21', '2019-01-16 15:46:48', '127.0.0.1', '127.0.0.1', '1547624546', '1547624808');
INSERT INTO `sys_session` VALUES ('b0ebb02e3972566075d1e2c6460517d9', '21', '2019-01-16 19:42:28', '127.0.0.1', '127.0.0.1', '1547638643', '1547638948');
INSERT INTO `sys_session` VALUES ('b11f768713e3387db0dd02a0d15c1652', '21', '2019-01-16 16:57:33', '127.0.0.1', '127.0.0.1', '1547629049', '1547629053');
INSERT INTO `sys_session` VALUES ('b12d46a5934d86ee6ac9ff04cc6071dd', '21', '2019-02-13 11:05:39', '127.0.0.1', '127.0.0.1', '1550025122', '1550027139');
INSERT INTO `sys_session` VALUES ('b16253837db8a16258cb98026807bded', '46', '2019-02-11 16:48:12', '127.0.0.1', null, '1549874892', '0');
INSERT INTO `sys_session` VALUES ('b1ef53a7dc6accc0369bcd6765292056', '41', '2019-01-26 17:10:15', '127.0.0.1', '127.0.0.1', '1548408467', '1548493815');
INSERT INTO `sys_session` VALUES ('b1f8cfb6b61d0af80b63bd38c031c91c', '21', '2019-02-27 17:46:40', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551260786', '1551260800');
INSERT INTO `sys_session` VALUES ('b20f3b4e806f0f2449aef61c41156205', '21', '2019-01-17 13:38:02', '127.0.0.1', '127.0.0.1', '1547703439', '1547703482');
INSERT INTO `sys_session` VALUES ('b214269a4ebeb57e873214d0ae1a5ffc', '21', '2019-01-16 19:56:13', '127.0.0.1', '127.0.0.1', '1547639691', '1547639773');
INSERT INTO `sys_session` VALUES ('b22eba8163f9ba26f661dd74136e4c44', '21', '2019-01-20 21:54:29', '127.0.0.1', '127.0.0.1', '1547992359', '1547992469');
INSERT INTO `sys_session` VALUES ('b268ab0dc9192bd96e33c30518f396a6', '37', '2019-01-28 21:23:02', '127.0.0.1', '127.0.0.1', '1548681685', '1548681782');
INSERT INTO `sys_session` VALUES ('b2da3082490c7f2885663d7ac28168d6', '21', '2019-01-17 13:35:56', '127.0.0.1', '127.0.0.1', '1547703096', '1547703356');
INSERT INTO `sys_session` VALUES ('b31aa965ee78d25e1dd5aa403f6ec63c', '21', '2019-02-20 15:39:17', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550647894', '1550648357');
INSERT INTO `sys_session` VALUES ('b35150dca4b15cb2ca7e52ed90ebadf8', '21', '2019-02-22 14:05:02', '127.0.0.1', '0:0:0:0:0:0:0:1', '1550815175', '1550815502');
INSERT INTO `sys_session` VALUES ('b351564e236851a47bdb1a1f7e5548ca', '37', '2019-01-28 15:12:15', '127.0.0.1', '127.0.0.1', '1548659439', '1548659535');
INSERT INTO `sys_session` VALUES ('b3653032d608ee355872bb93dd01c583', '21', '2019-01-29 14:20:47', '127.0.0.1', '127.0.0.1', '1548742387', '1548742847');
INSERT INTO `sys_session` VALUES ('b365454e2d0477fb73b96c3cc37ace5d', '21', '2019-02-28 10:56:32', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551322249', '1551322592');
INSERT INTO `sys_session` VALUES ('b37b15c0f8c040c58bfa358858695c7c', '21', '2019-02-01 13:18:20', '127.0.0.1', '127.0.0.1', '1548996889', '1548998300');
INSERT INTO `sys_session` VALUES ('b37f907616b469974cb0178434592156', '21', '2019-02-01 13:32:09', '127.0.0.1', '127.0.0.1', '1548999075', '1548999129');
INSERT INTO `sys_session` VALUES ('b3aaa43554a5061d25d80cfdbc8df58e', '21', '2019-02-22 10:26:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550802232', '1550802406');
INSERT INTO `sys_session` VALUES ('b4078fec373f0964d16910ddf0ca64b8', '21', '2019-01-17 13:24:01', '127.0.0.1', '127.0.0.1', '1547702622', '1547702641');
INSERT INTO `sys_session` VALUES ('b4b8da010b463ca968b32950ff78498e', '21', '2019-01-21 11:48:25', '127.0.0.1', '127.0.0.1', '1548042475', '1548042505');
INSERT INTO `sys_session` VALUES ('b533e47b80d1040cbdccc2d8779ad863', '21', '2019-02-11 17:45:42', '127.0.0.1', '127.0.0.1', '1549878107', '1549878342');
INSERT INTO `sys_session` VALUES ('b54ecb287d0d542357d7ea008fb56525', '21', '2019-01-17 10:08:26', '127.0.0.1', '127.0.0.1', '1547690796', '1547690906');
INSERT INTO `sys_session` VALUES ('b6073e808af914522746e72cf873ddaa', '21', '2019-01-23 17:20:25', '127.0.0.1', '127.0.0.1', '1548235145', '1548235225');
INSERT INTO `sys_session` VALUES ('b60fa399a9c03008feb5856231f08795', '21', '2019-01-25 17:34:07', '127.0.0.1', '127.0.0.1', '1548408508', '1548408847');
INSERT INTO `sys_session` VALUES ('b6b77fb8bb39d1f64cd1d5e798e09774', '37', '2019-01-29 09:45:23', '127.0.0.1', '127.0.0.1', '1548726219', '1548726323');
INSERT INTO `sys_session` VALUES ('b6b9036acac5cecdf420e932f49f5ece', '21', '2019-02-01 13:31:15', '127.0.0.1', '127.0.0.1', '1548998351', '1548999075');
INSERT INTO `sys_session` VALUES ('b6ca615cda094e0524684a1b7a060105', '21', '2019-01-24 20:27:01', '127.0.0.1', '127.0.0.1', '1548332112', '1548332821');
INSERT INTO `sys_session` VALUES ('b6d728aeae9e3f2e2e8a13931fad86b2', '21', '2019-02-18 10:57:26', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550458392', '1550458646');
INSERT INTO `sys_session` VALUES ('b6ef329dd633b4d953d525fac8286581', '21', '2019-01-17 13:16:59', '127.0.0.1', '127.0.0.1', '1547702184', '1547702219');
INSERT INTO `sys_session` VALUES ('b7d87d58cdb8ed3860305a78a0a28b67', '21', '2019-01-16 21:33:22', '127.0.0.1', '127.0.0.1', '1547645287', '1547645602');
INSERT INTO `sys_session` VALUES ('b8078956dd1744d0a96153ba7598ea0b', '21', '2019-02-27 16:57:18', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551257743', '1551257838');
INSERT INTO `sys_session` VALUES ('b8a3f5cfbd508621ad60b80f0c0df60d', '21', '2019-02-22 09:12:25', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550740986', '1550797945');
INSERT INTO `sys_session` VALUES ('b8a6ab46db527a134b47366998d4cebe', '21', '2019-02-11 16:50:49', '127.0.0.1', '127.0.0.1', '1549874641', '1549875049');
INSERT INTO `sys_session` VALUES ('b8d16426ce8c7aeedcfe2e4ff94a22da', '21', '2019-02-13 14:56:00', '127.0.0.1', '127.0.0.1', '1550040564', '1550040960');
INSERT INTO `sys_session` VALUES ('b8ecb0d86f2fafab0c7f06821c780e50', '21', '2019-01-16 21:12:02', '127.0.0.1', '127.0.0.1', '1547640303', '1547644322');
INSERT INTO `sys_session` VALUES ('b92fd3e7762ce5ae31bafb167c7e89e7', '37', '2019-01-29 10:57:33', '127.0.0.1', '127.0.0.1', '1548730604', '1548730653');
INSERT INTO `sys_session` VALUES ('b952d7f7246bbc56f590a66581eabb84', '21', '2019-01-20 21:20:26', '127.0.0.1', '127.0.0.1', '1547988797', '1547990426');
INSERT INTO `sys_session` VALUES ('b97335e4df0952f24d2b9623c5f62f2d', '21', '2019-02-28 10:38:31', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551320786', '1551321511');
INSERT INTO `sys_session` VALUES ('b990822c5dec430077139f9902091fba', '37', '2019-01-26 17:19:32', '127.0.0.1', '127.0.0.1', '1548493835', '1548494372');
INSERT INTO `sys_session` VALUES ('b9bfff4b41ef5f74221fb0acdb65b31c', '21', '2019-02-01 16:04:49', '127.0.0.1', '127.0.0.1', '1549008126', '1549008289');
INSERT INTO `sys_session` VALUES ('ba606ebaf02017ba910ca16b1b1cc3b8', '21', '2019-02-13 14:05:51', '127.0.0.1', '127.0.0.1', '1550037842', '1550037951');
INSERT INTO `sys_session` VALUES ('bac1c6c543e0690612b0ea5a18fe4c0b', '21', '2019-01-24 18:03:47', '127.0.0.1', '127.0.0.1', '1548324179', '1548324227');
INSERT INTO `sys_session` VALUES ('bad6e8b003ccf4ec503aacfc15b19ee7', '37', '2019-01-29 10:56:44', '127.0.0.1', '127.0.0.1', '1548729041', '1548730604');
INSERT INTO `sys_session` VALUES ('bb28791525e850bfc91743b6a86ffba8', '21', '2019-01-20 22:03:03', '127.0.0.1', '127.0.0.1', '1547992893', '1547992983');
INSERT INTO `sys_session` VALUES ('bb32fec61ce415ea9df699bccb311e47', '21', '2019-02-13 15:00:16', '127.0.0.1', '127.0.0.1', '1550040960', '1550041216');
INSERT INTO `sys_session` VALUES ('bb870036bbc2cfc6c62798dc7540910f', '21', '2019-01-17 15:24:31', '127.0.0.1', '127.0.0.1', '1547709866', '1547709871');
INSERT INTO `sys_session` VALUES ('bba9ab1af3ff86e2a15b95ebb0faf6f2', '21', '2019-01-29 14:13:07', '127.0.0.1', '127.0.0.1', '1548493708', '1548742387');
INSERT INTO `sys_session` VALUES ('bc0446fb99149cc6201cfe65e189a621', '21', '2019-01-19 17:53:58', '127.0.0.1', '127.0.0.1', '1547891616', '1547891638');
INSERT INTO `sys_session` VALUES ('bc04d154de8123accd5f9bdca5409db2', '21', '2019-01-22 18:13:24', '127.0.0.1', '127.0.0.1', '1548150549', '1548152004');
INSERT INTO `sys_session` VALUES ('bc271cbba3bf44f48c34a6e72036c1ed', '37', '2019-01-29 13:57:01', '127.0.0.1', '127.0.0.1', '1548740775', '1548741421');
INSERT INTO `sys_session` VALUES ('bc9650d5a6b0987c49ac6ab6a41323db', '21', '2019-01-22 10:53:14', '127.0.0.1', '127.0.0.1', '1548125377', '1548125594');
INSERT INTO `sys_session` VALUES ('bc99a2f9c1bfbc7170a9de3396be8765', '31', '2019-01-29 15:28:13', '127.0.0.1', '127.0.0.1', '1548746286', '1548746893');
INSERT INTO `sys_session` VALUES ('bceb57d6e70d803755441b5f350d09b5', '21', '2019-01-16 15:59:51', '127.0.0.1', '127.0.0.1', '1547625419', '1547625591');
INSERT INTO `sys_session` VALUES ('bd51c6f57d9cbdbb28277607693f0c90', '21', '2019-01-17 14:10:16', '127.0.0.1', '127.0.0.1', '1547704668', '1547705416');
INSERT INTO `sys_session` VALUES ('bd756587c8ceeaca6c56347a1d49d44d', '21', '2019-02-26 15:59:06', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551158673', '1551167946');
INSERT INTO `sys_session` VALUES ('bd7fdc2cd495b7d23386e7ae5ab830ab', '21', '2019-01-25 09:41:12', '127.0.0.1', '127.0.0.1', '1548342348', '1548380472');
INSERT INTO `sys_session` VALUES ('bdcb6803c850432c5bfecf28f2ca668e', '21', '2019-01-17 15:46:24', '127.0.0.1', '127.0.0.1', '1547711124', '1547711184');
INSERT INTO `sys_session` VALUES ('be4a34e548758e679442bc9e8921d4dc', '21', '2019-01-17 14:42:12', '127.0.0.1', '127.0.0.1', '1547707315', '1547707332');
INSERT INTO `sys_session` VALUES ('bedb2fbe473392d5802d6e5c7a83d936', '21', '2019-01-24 17:23:37', '127.0.0.1', '127.0.0.1', '1548302137', '1548321817');
INSERT INTO `sys_session` VALUES ('bf123ebd5783b1bb009da437da6a90ce', '37', '2019-01-25 15:11:47', '127.0.0.1', '127.0.0.1', '1548399906', '1548400307');
INSERT INTO `sys_session` VALUES ('c08e3500b4512c86dd55efc4ebc8e59f', '21', '2019-02-27 10:26:51', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551231032', '1551234411');
INSERT INTO `sys_session` VALUES ('c0c1d2fd65b3c6cd618794623bb88517', '21', '2019-02-13 10:32:02', '127.0.0.1', '127.0.0.1', '1550025073', '1550025122');
INSERT INTO `sys_session` VALUES ('c0c38a5f4fa110a933dc0195bcdd4f67', '21', '2019-01-30 20:24:05', '127.0.0.1', '127.0.0.1', '1548839589', '1548851045');
INSERT INTO `sys_session` VALUES ('c140f24f4e32ad58c3dbf10d6f312b52', '21', '2019-01-22 09:49:41', '127.0.0.1', '127.0.0.1', '1548121652', '1548121781');
INSERT INTO `sys_session` VALUES ('c1787b01b097f76acac5fd472700c35d', '21', '2019-01-17 14:41:55', '127.0.0.1', '127.0.0.1', '1547707084', '1547707315');
INSERT INTO `sys_session` VALUES ('c1bd2add7e96d958f78d1e66e600e62f', '21', '2019-01-21 13:36:30', '127.0.0.1', '127.0.0.1', '1548048931', '1548048990');
INSERT INTO `sys_session` VALUES ('c1c94bbd27d8e8f8187eb367558abed1', '21', '2019-01-17 15:03:47', '127.0.0.1', '127.0.0.1', '1547708325', '1547708627');
INSERT INTO `sys_session` VALUES ('c265156ba156f74f193edec9fe585b92', '21', '2019-01-23 14:39:14', '127.0.0.1', '127.0.0.1', '1548225461', '1548225554');
INSERT INTO `sys_session` VALUES ('c29c5d53dcd255f58a9903ad8fe6549b', '21', '2019-01-16 16:57:29', '127.0.0.1', '127.0.0.1', '1547628929', '1547629049');
INSERT INTO `sys_session` VALUES ('c2a7a7740d93af98dc9cc844a5662442', '37', '2019-01-25 15:30:46', '127.0.0.1', '127.0.0.1', '1548401009', '1548401446');
INSERT INTO `sys_session` VALUES ('c2e5a818259c5ed3bc8eace440d5bd67', '21', '2019-01-19 17:53:36', '127.0.0.1', '127.0.0.1', '1547891566', '1547891616');
INSERT INTO `sys_session` VALUES ('c3823662975466471ed14e5493043b25', '21', '2019-01-16 17:26:08', '127.0.0.1', '127.0.0.1', '1547630749', '1547630768');
INSERT INTO `sys_session` VALUES ('c429beff697a56de59c8cf1f181fa815', '21', '2019-01-19 13:42:24', '127.0.0.1', '127.0.0.1', '1547876495', '1547876544');
INSERT INTO `sys_session` VALUES ('c46333278433ccf6b9d5b62630fd3851', '21', '2019-02-21 17:11:58', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550740107', '1550740318');
INSERT INTO `sys_session` VALUES ('c4a06b3d91bf33d0dced6403ba3fc97d', '21', '2019-02-18 11:05:39', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550458646', '1550459139');
INSERT INTO `sys_session` VALUES ('c4d75c57a9025023aab80b40f1515313', '21', '2019-01-16 16:57:37', '127.0.0.1', '127.0.0.1', '1547629053', '1547629057');
INSERT INTO `sys_session` VALUES ('c546fe9309e3fa307b02a5bbbaf782e2', '37', '2019-01-25 15:34:58', '127.0.0.1', '127.0.0.1', '1548401473', '1548401698');
INSERT INTO `sys_session` VALUES ('c5b70635f71579169b752b9b242f1721', '21', '2019-01-16 16:59:30', '127.0.0.1', '127.0.0.1', '1547629168', '1547629170');
INSERT INTO `sys_session` VALUES ('c5d5c9a09551c2ea9c0fb2cd4d3dee9c', '21', '2019-02-01 12:36:09', '127.0.0.1', '127.0.0.1', '1548995448', '1548995769');
INSERT INTO `sys_session` VALUES ('c6489034cd9ff4918d160000daf02582', '21', '2019-01-16 15:49:26', '127.0.0.1', '127.0.0.1', '1547624837', '1547624966');
INSERT INTO `sys_session` VALUES ('c6792ec2fd3bb09fbc0b7abf39926992', '21', '2019-01-17 14:38:04', '127.0.0.1', '127.0.0.1', '1547706769', '1547707084');
INSERT INTO `sys_session` VALUES ('c6d1ddba9c3e16a59ef8a455ba45c725', '21', '2019-01-21 16:59:16', '127.0.0.1', '127.0.0.1', '1548060673', '1548061156');
INSERT INTO `sys_session` VALUES ('c6e6a3d1bfaeb5cf0214f8cc278dde58', '21', '2019-01-30 17:13:09', '127.0.0.1', '127.0.0.1', '1548742847', '1548839589');
INSERT INTO `sys_session` VALUES ('c761efbe7ac8bd2491e4606a8e03a0a1', '21', '2019-02-27 10:53:59', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551234803', '1551236039');
INSERT INTO `sys_session` VALUES ('c7710514f8115fd71cb6d5bd41eeaaa0', '21', '2019-01-20 20:47:03', '127.0.0.1', '127.0.0.1', '1547988321', '1547988423');
INSERT INTO `sys_session` VALUES ('c7fd231bacd3e8a1c9753241307da52b', '37', '2019-01-29 16:43:26', '127.0.0.1', '127.0.0.1', '1548750943', '1548751406');
INSERT INTO `sys_session` VALUES ('c8305d71cf6f38b784a821522352abf4', '21', '2019-02-27 11:50:54', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551239084', '1551239454');
INSERT INTO `sys_session` VALUES ('c8838ca876d4aeafb16226ab34dd8e05', '42', '2019-01-29 16:05:57', '127.0.0.1', null, '1548749157', '0');
INSERT INTO `sys_session` VALUES ('c89dc9152c36a34edac91a192394c051', '21', '2019-01-24 17:55:54', '127.0.0.1', '127.0.0.1', '1548322529', '1548323754');
INSERT INTO `sys_session` VALUES ('c8fd8da27c3a1c2bc33f6aa884ab4e28', '21', '2019-01-22 09:51:32', '127.0.0.1', '127.0.0.1', '1548121781', '1548121892');
INSERT INTO `sys_session` VALUES ('c965039015b42a08bf2050982e916704', '21', '2019-02-11 15:57:18', '127.0.0.1', '127.0.0.1', '1549865455', '1549871838');
INSERT INTO `sys_session` VALUES ('c98ac322da4b2925dd2e01000645d077', '37', '2019-01-29 14:04:21', '127.0.0.1', '127.0.0.1', '1548741421', '1548741861');
INSERT INTO `sys_session` VALUES ('c9dfe04e9ac0da58a5cbca1db5df2863', '21', '2019-02-28 09:41:41', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551317796', '1551318101');
INSERT INTO `sys_session` VALUES ('ca1ee15cba4b3c44bf0fcabc913a916d', '21', '2019-01-19 17:54:27', '127.0.0.1', '127.0.0.1', '1547891638', '1547891667');
INSERT INTO `sys_session` VALUES ('ca23d70069224c471b4ac1bca5a0109c', '21', '2019-02-01 13:19:11', '127.0.0.1', '127.0.0.1', '1548998300', '1548998351');
INSERT INTO `sys_session` VALUES ('ca3882818f2090b145b46f07e55985fb', '21', '2019-01-21 15:48:36', '127.0.0.1', '127.0.0.1', '1548056781', '1548056916');
INSERT INTO `sys_session` VALUES ('caba613f9a0f1b8162ff7a7d94421ab7', '21', '2019-01-31 17:24:39', '127.0.0.1', '127.0.0.1', '1548926184', '1548926679');
INSERT INTO `sys_session` VALUES ('cac3da8276724b255789359a79507218', '37', '2019-01-29 13:43:30', '127.0.0.1', '127.0.0.1', '1548733837', '1548740610');
INSERT INTO `sys_session` VALUES ('cac4ac70f19971efe8c9532927b10f35', '37', '2019-01-29 10:07:56', '127.0.0.1', '127.0.0.1', '1548727521', '1548727676');
INSERT INTO `sys_session` VALUES ('cb9b607afcd8a0a7adc8756adbc38e2d', '21', '2019-01-20 22:09:13', '127.0.0.1', '127.0.0.1', '1547993307', '1547993352');
INSERT INTO `sys_session` VALUES ('cba5e46ffcb46e91aec38e9e1ce576b7', '21', '2019-01-26 12:19:37', '127.0.0.1', '127.0.0.1', '1548476314', '1548476377');
INSERT INTO `sys_session` VALUES ('cc534d5b0b149c888d250e63b272ee69', '21', '2019-01-21 16:30:07', '127.0.0.1', '127.0.0.1', '1548058972', '1548059407');
INSERT INTO `sys_session` VALUES ('cc664f0580a8c4b829b914c6f0a1e7ce', '21', '2019-02-16 12:00:59', '127.0.0.1', '127.0.0.1', '1550115305', '1550289659');
INSERT INTO `sys_session` VALUES ('cccaff20cae66ee523863b0c00880c94', '21', '2019-02-01 13:36:06', '127.0.0.1', '127.0.0.1', '1548999256', '1548999366');
INSERT INTO `sys_session` VALUES ('ccdf2fe3cb004a19f3b0853f0d776044', '31', '2019-01-29 15:44:49', '127.0.0.1', '127.0.0.1', '1548747803', '1548747889');
INSERT INTO `sys_session` VALUES ('ccfb261004ed9a45bce47a697d589574', '21', '2019-02-01 12:30:48', '127.0.0.1', '127.0.0.1', '1548992439', '1548995448');
INSERT INTO `sys_session` VALUES ('ce4630a51d7a1ac9097135ab60c8b57b', '21', '2019-01-22 09:47:32', '127.0.0.1', '127.0.0.1', '1548121589', '1548121652');
INSERT INTO `sys_session` VALUES ('ceaad73dec47fcd2718380b7c9be0a03', '21', '2019-01-17 14:51:42', '127.0.0.1', '127.0.0.1', '1547707859', '1547707902');
INSERT INTO `sys_session` VALUES ('cf13a1a03789c624050b96bd36e44f08', '37', '2019-01-29 16:35:43', '127.0.0.1', '127.0.0.1', '1548742074', '1548750943');
INSERT INTO `sys_session` VALUES ('cf813ff80d8bf7d6593d4abfcf71d51f', '45', '2019-02-01 09:34:35', '127.0.0.1', null, '1548984875', '0');
INSERT INTO `sys_session` VALUES ('d00b4a83ce4ceaf2fec1acbfcf5696af', '21', '2019-03-04 12:00:04', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551667369', '1551672004');
INSERT INTO `sys_session` VALUES ('d0bff4970cb4aa3477c9b2be05dcc538', '21', '2019-01-16 17:04:55', '127.0.0.1', '127.0.0.1', '1547629491', '1547629495');
INSERT INTO `sys_session` VALUES ('d0c7c47ef847b2adc84348d7aa4f20f9', '21', '2019-01-17 10:58:26', '127.0.0.1', '127.0.0.1', '1547691264', '1547693906');
INSERT INTO `sys_session` VALUES ('d0cd789930f74a1af3d6a8b64b62f6a0', '21', '2019-03-04 10:42:49', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551664185', '1551667369');
INSERT INTO `sys_session` VALUES ('d12e9c32f9f22f92f56e62b82219d39e', '21', '2019-01-17 15:18:11', '127.0.0.1', '127.0.0.1', '1547709357', '1547709491');
INSERT INTO `sys_session` VALUES ('d13542c8314f40dac32c4ab79e7c5a8a', '37', '2019-01-25 15:23:29', '127.0.0.1', '127.0.0.1', '1548400806', '1548401009');
INSERT INTO `sys_session` VALUES ('d17f10f4757b48121b6648eb87360604', '21', '2019-01-25 10:43:38', '127.0.0.1', '127.0.0.1', '1548384176', '1548384218');
INSERT INTO `sys_session` VALUES ('d1ae1546c4b63f250049c023409f446c', '21', '2019-01-17 13:48:03', '127.0.0.1', '127.0.0.1', '1547703972', '1547704083');
INSERT INTO `sys_session` VALUES ('d1e4d9bd375076b9adf929ed4d82bf13', '21', '2019-01-31 17:02:51', '127.0.0.1', '127.0.0.1', '1548925245', '1548925371');
INSERT INTO `sys_session` VALUES ('d239932486f878a1ad6ab05254abb9dc', '37', '2019-01-28 11:08:17', '127.0.0.1', '127.0.0.1', '1548644873', '1548644897');
INSERT INTO `sys_session` VALUES ('d24eac26036fe55b1302ca7369cf3d33', '21', '2019-01-17 13:42:14', '127.0.0.1', '127.0.0.1', '1547703601', '1547703734');
INSERT INTO `sys_session` VALUES ('d25d48cd890bfe24ff27640a948a69ac', '21', '2019-02-28 17:42:00', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551345252', '1551346920');
INSERT INTO `sys_session` VALUES ('d2cbfd7f2f09acf93265fcc463e062aa', '37', '2019-01-28 10:28:58', '127.0.0.1', '127.0.0.1', '1548494372', '1548642538');
INSERT INTO `sys_session` VALUES ('d30c8cd452dbe99eab34ecddaa5e96b3', '21', '2019-02-22 10:23:52', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550797945', '1550802232');
INSERT INTO `sys_session` VALUES ('d35766fb1ef5e95bbf0859aa6ec9cf04', '21', '2019-02-26 17:29:56', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551172737', '1551173396');
INSERT INTO `sys_session` VALUES ('d39ae8733114893d4f12cdf1df159f26', '21', '2019-02-11 17:32:09', '127.0.0.1', '127.0.0.1', '1549877437', '1549877529');
INSERT INTO `sys_session` VALUES ('d3c9668eb5b30ac99ae91e538a0b9cb8', '37', '2019-01-29 14:07:54', '127.0.0.1', '127.0.0.1', '1548741861', '1548742074');
INSERT INTO `sys_session` VALUES ('d3e273e7b0353d6df5bdc9ea197c008a', '21', '2019-02-13 17:25:29', '127.0.0.1', '127.0.0.1', '1550049899', '1550049929');
INSERT INTO `sys_session` VALUES ('d58143ac1bcde8808dc83d00aa40ff69', '21', '2019-01-16 19:29:52', '127.0.0.1', '127.0.0.1', '1547638168', '1547638192');
INSERT INTO `sys_session` VALUES ('d5f11c669730f5680929170de517512b', '21', '2019-01-19 12:34:33', '127.0.0.1', '127.0.0.1', '1547781825', '1547872473');
INSERT INTO `sys_session` VALUES ('d61c0a6e0a37ff19eea99f8dc6a94614', '21', '2019-01-31 15:32:21', '127.0.0.1', '127.0.0.1', '1548919808', '1548919941');
INSERT INTO `sys_session` VALUES ('d648f921cb9836ee12ec244ba81c7484', '21', '2019-01-16 19:29:28', '127.0.0.1', '127.0.0.1', '1547632852', '1547638168');
INSERT INTO `sys_session` VALUES ('d65fa5d3be9d0a1ae884060b9819401b', '21', '2019-01-24 21:55:09', '127.0.0.1', '127.0.0.1', '1548337793', '1548338109');
INSERT INTO `sys_session` VALUES ('d6c32774765d6e2bef3bb030acc198de', '21', '2019-02-20 15:31:34', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550644711', '1550647894');
INSERT INTO `sys_session` VALUES ('d6dd7e4cad6d670b34b4f1e21932c5ce', '21', '2019-02-26 17:18:57', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551172729', '1551172737');
INSERT INTO `sys_session` VALUES ('d7282128f30f90239bda61080bd701cf', '21', '2019-01-24 20:10:01', '127.0.0.1', '127.0.0.1', '1548330612', '1548331801');
INSERT INTO `sys_session` VALUES ('d758857e8e82659aa1ef04ca124e5988', '21', '2019-02-01 16:02:06', '127.0.0.1', '127.0.0.1', '1549006169', '1549008126');
INSERT INTO `sys_session` VALUES ('d77fffa5db844463c80b36f83282d302', '37', '2019-01-28 11:32:40', '127.0.0.1', '127.0.0.1', '1548646067', '1548646360');
INSERT INTO `sys_session` VALUES ('d7a5cfe42df77c7f1c04663c9a81cb00', '21', '2019-02-12 15:19:45', '127.0.0.1', '127.0.0.1', '1549955795', '1549955985');
INSERT INTO `sys_session` VALUES ('d7be31560606e47cce05aef6559254e4', '21', '2019-02-20 14:26:26', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550643926', '1550643986');
INSERT INTO `sys_session` VALUES ('d7d91e120a5591fb1ae8f068c5b66fb4', '21', '2019-01-26 12:25:08', '127.0.0.1', '127.0.0.1', '1548476377', '1548476708');
INSERT INTO `sys_session` VALUES ('d7d941dc980301917dfbbf8cc1188895', '21', '2019-01-21 16:00:02', '127.0.0.1', '127.0.0.1', '1548057557', '1548057602');
INSERT INTO `sys_session` VALUES ('d7e304375bec4f0f5ce2d8e3d6b13753', '21', '2019-01-21 13:11:47', '127.0.0.1', '127.0.0.1', '1548047479', '1548047507');
INSERT INTO `sys_session` VALUES ('d82e83ea07f2fd39bf13e87a83888719', '21', '2019-02-11 17:48:09', '127.0.0.1', '127.0.0.1', '1549878382', '1549878489');
INSERT INTO `sys_session` VALUES ('d89be60005ac8b01ea8cacf068633ef3', '21', '2019-01-23 17:33:16', '127.0.0.1', '127.0.0.1', '1548235865', '1548235996');
INSERT INTO `sys_session` VALUES ('d921bf02153774f8fb977de2a86652df', '21', '2019-01-26 12:25:53', '127.0.0.1', '127.0.0.1', '1548476708', '1548476753');
INSERT INTO `sys_session` VALUES ('d96d78111162c45d5a5e4e79279c1b2c', '21', '2019-02-01 16:17:18', '127.0.0.1', '127.0.0.1', '1549008289', '1549009038');
INSERT INTO `sys_session` VALUES ('da4cdb2416d0430d80cb0236e3cbbd2c', '21', '2019-01-17 11:26:34', '127.0.0.1', '127.0.0.1', '1547695516', '1547695594');
INSERT INTO `sys_session` VALUES ('dab041f3b34da58bd619a0a47e05b51e', '21', '2019-02-12 16:37:44', '127.0.0.1', '127.0.0.1', '1549959589', '1549960664');
INSERT INTO `sys_session` VALUES ('dad886e0ee613cad2d53fd4ab3613381', '21', '2019-02-21 17:14:19', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550740318', '1550740459');
INSERT INTO `sys_session` VALUES ('daea3f4cf79a56500175c4dc21e482fc', '21', '2019-01-21 11:08:19', '127.0.0.1', '127.0.0.1', '1548036022', '1548040099');
INSERT INTO `sys_session` VALUES ('db12b63c892efeb9f05879455cf87a45', '21', '2019-02-01 15:12:53', '127.0.0.1', '127.0.0.1', '1549000058', '1549005173');
INSERT INTO `sys_session` VALUES ('db8a8e32b964faab061ad7f8fdc79866', '21', '2019-01-25 16:37:02', '127.0.0.1', '127.0.0.1', '1548399862', '1548405422');
INSERT INTO `sys_session` VALUES ('dbb9382e52bf00a2bfc1a86ba65f7396', '21', '2019-02-27 18:02:40', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551261294', '1551261760');
INSERT INTO `sys_session` VALUES ('dbd5f810e11712fbfe68eed38b8e4ae1', '21', '2019-01-20 21:52:39', '127.0.0.1', '127.0.0.1', '1547992145', '1547992359');
INSERT INTO `sys_session` VALUES ('dc097d3142a329a20c7cd94c3ae7e707', '45', '2019-02-01 09:34:35', '127.0.0.1', '127.0.0.1', '1548984175', '1548984875');
INSERT INTO `sys_session` VALUES ('dc4df02ec90a8e8395dac7dd3840778a', '21', '2019-02-26 09:24:56', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551087591', '1551144296');
INSERT INTO `sys_session` VALUES ('dc7f54e03becf3abc9358197097b83d4', '21', '2019-01-23 17:29:06', '127.0.0.1', '127.0.0.1', '1548235448', '1548235746');
INSERT INTO `sys_session` VALUES ('dceab33d907344b6b3417722cb2b1404', '21', '2019-02-13 15:03:09', '127.0.0.1', '127.0.0.1', '1550041343', '1550041389');
INSERT INTO `sys_session` VALUES ('dd125e31dee2c37d558e8e9ca500c7eb', '21', '2019-01-19 13:42:59', '127.0.0.1', '127.0.0.1', '1547876544', '1547876579');
INSERT INTO `sys_session` VALUES ('ddbb072e0c9f61a5171279452aa1ffd1', '21', '2019-02-13 14:39:23', '127.0.0.1', '127.0.0.1', '1550038492', '1550039963');
INSERT INTO `sys_session` VALUES ('dde0835b1da3e053b3d61d0bba636a87', '45', '2019-02-01 09:22:55', '127.0.0.1', '127.0.0.1', '1548984135', '1548984175');
INSERT INTO `sys_session` VALUES ('de004f99cf152a288884f13eb2986ea8', '21', '2019-02-12 10:30:24', '127.0.0.1', '127.0.0.1', '1549937304', '1549938624');
INSERT INTO `sys_session` VALUES ('de08bd9bac359d3041caf60470567f42', '21', '2019-02-11 16:59:03', '127.0.0.1', '127.0.0.1', '1549875496', '1549875543');
INSERT INTO `sys_session` VALUES ('de0f373abbc819308312aa7c13eb8cb1', '37', '2019-01-29 10:57:56', '127.0.0.1', '127.0.0.1', '1548730653', '1548730676');
INSERT INTO `sys_session` VALUES ('de3270ab7a2d48365d82b876b1c1b0d3', '21', '2019-01-16 16:55:14', '127.0.0.1', '127.0.0.1', '1547628278', '1547628914');
INSERT INTO `sys_session` VALUES ('de45b4854059178757c7428375cd104f', '21', '2019-02-08 08:18:24', '127.0.0.1', '127.0.0.1', '1549011007', '1549585104');
INSERT INTO `sys_session` VALUES ('de65adbc41ec4e6464f19dfe1dc11182', '21', '2019-01-22 14:55:02', '127.0.0.1', '127.0.0.1', '1548139011', '1548140102');
INSERT INTO `sys_session` VALUES ('dec73bc760a1f2c1dfb04411f73266b9', '21', '2019-01-26 12:10:38', '127.0.0.1', '127.0.0.1', '1548475429', '1548475838');
INSERT INTO `sys_session` VALUES ('dedb4bdb414722e447444110685468d8', '21', '2019-02-13 14:07:49', '127.0.0.1', '127.0.0.1', '1550037951', '1550038069');
INSERT INTO `sys_session` VALUES ('def357b5096e8ad901e67080fbc84438', '21', '2019-01-17 15:09:39', '127.0.0.1', '127.0.0.1', '1547708913', '1547708979');
INSERT INTO `sys_session` VALUES ('df620279d07b0261bd618de23ed3f8ee', '21', '2019-01-25 10:42:03', '127.0.0.1', '127.0.0.1', '1548384066', '1548384123');
INSERT INTO `sys_session` VALUES ('df83e1bc30d68b2e5ae4a05b01e757ab', '37', '2019-01-28 11:10:27', '127.0.0.1', '127.0.0.1', '1548644954', '1548645027');
INSERT INTO `sys_session` VALUES ('dfbc397ad9dcd6e3d85570bd41566d92', '37', '2019-01-28 15:14:57', '127.0.0.1', '127.0.0.1', '1548659535', '1548659697');
INSERT INTO `sys_session` VALUES ('e00874d03d17f0247d71a66dd8d4418a', '21', '2019-02-16 14:32:17', '127.0.0.1', '127.0.0.1', '1550298139', '1550298737');
INSERT INTO `sys_session` VALUES ('e00c61b4aa233df65996044df0174650', '21', '2019-02-27 17:54:54', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551260928', '1551261294');
INSERT INTO `sys_session` VALUES ('e07ba43b4c4ab7c838b7a2df68559521', '21', '2019-01-16 17:04:51', '127.0.0.1', '127.0.0.1', '1547629331', '1547629491');
INSERT INTO `sys_session` VALUES ('e0d1b478d7879b0185d6e7f16323775c', '21', '2019-01-31 15:22:37', '127.0.0.1', '127.0.0.1', '1548919244', '1548919357');
INSERT INTO `sys_session` VALUES ('e0ef814038762fe8d8b05f012a2052a1', '21', '2019-01-17 09:53:18', '127.0.0.1', '127.0.0.1', '1547689907', '1547689998');
INSERT INTO `sys_session` VALUES ('e193ebd175b2b359b175e5de05b8b368', '21', '2019-01-25 14:17:18', '127.0.0.1', '127.0.0.1', '1548396591', '1548397038');
INSERT INTO `sys_session` VALUES ('e19d97ad160e8f478f7a334e33431c8d', '21', '2019-01-20 20:53:17', '127.0.0.1', '127.0.0.1', '1547988554', '1547988797');
INSERT INTO `sys_session` VALUES ('e1aa26378d71885b9a6433ea6ca6e3f6', '21', '2019-01-25 13:42:52', '127.0.0.1', '127.0.0.1', '1548394860', '1548394972');
INSERT INTO `sys_session` VALUES ('e1e6c3a1079a20eb90e47917fc0bd524', '21', '2019-02-11 11:24:09', '127.0.0.1', '127.0.0.1', '1549855323', '1549855449');
INSERT INTO `sys_session` VALUES ('e23ba51dbc962d16b01ae9ebbd6e8c2c', '21', '2019-02-18 15:37:53', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550474671', '1550475473');
INSERT INTO `sys_session` VALUES ('e2c32c3f25ac9bc802ff7515704d9661', '21', '2019-01-17 15:25:58', '127.0.0.1', '127.0.0.1', '1547709871', '1547709958');
INSERT INTO `sys_session` VALUES ('e318c10c3ac7c20c278c57c4551b0341', '21', '2019-01-24 22:24:33', '127.0.0.1', '127.0.0.1', '1548338109', '1548339873');
INSERT INTO `sys_session` VALUES ('e32a5eb995b5ec7e45ec8783f097df70', '21', '2019-01-21 16:38:58', '127.0.0.1', '127.0.0.1', '1548059739', '1548059938');
INSERT INTO `sys_session` VALUES ('e33b2794a8f4e1f35f91c664b64991fe', '21', '2019-02-16 16:32:44', '127.0.0.1', '0:0:0:0:0:0:0:1', '1550305451', '1550305964');
INSERT INTO `sys_session` VALUES ('e34a6610f48c270a264ace2593ed024d', '21', '2019-01-16 16:00:23', '127.0.0.1', '127.0.0.1', '1547625591', '1547625623');
INSERT INTO `sys_session` VALUES ('e35f742b233e34441a2a3087495abdbc', '21', '2019-01-16 16:59:33', '127.0.0.1', '127.0.0.1', '1547629170', '1547629173');
INSERT INTO `sys_session` VALUES ('e36bf7066225dc46d5bb4d9a93ac8ba1', '21', '2019-01-21 15:58:57', '127.0.0.1', '127.0.0.1', '1548057501', '1548057537');
INSERT INTO `sys_session` VALUES ('e430ca70dd8658bb7d35cc1b9225e035', '21', '2019-02-28 09:14:44', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551316324', '1551316484');
INSERT INTO `sys_session` VALUES ('e471993502da708149f830004d485487', '21', '2019-01-21 16:07:34', '127.0.0.1', '127.0.0.1', '1548058013', '1548058054');
INSERT INTO `sys_session` VALUES ('e4c24f2d785758d5aadee706b4d5052e', '21', '2019-01-25 19:30:38', '127.0.0.1', '127.0.0.1', '1548415716', '1548415838');
INSERT INTO `sys_session` VALUES ('e4db8ceb96ad402a0d93b956f797deb3', '21', '2019-02-11 16:54:47', '127.0.0.1', '127.0.0.1', '1549875225', '1549875287');
INSERT INTO `sys_session` VALUES ('e5428da4d69bb16da795e66e0975ff99', '21', '2019-01-18 11:23:45', '127.0.0.1', '127.0.0.1', '1547781697', '1547781825');
INSERT INTO `sys_session` VALUES ('e5766a2d5b3481d5042a59ca63c560e6', '21', '2019-02-16 14:54:43', '0:0:0:0:0:0:0:1', '127.0.0.1', '1550299857', '1550300083');
INSERT INTO `sys_session` VALUES ('e5865d68fe3cffe9200f9ea8cfcc1ab4', '37', '2019-01-30 10:55:49', '127.0.0.1', '127.0.0.1', '1548813686', '1548816949');
INSERT INTO `sys_session` VALUES ('e639a452596243f5f3e05b8f81905bfc', '21', '2019-02-26 17:18:49', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551167946', '1551172729');
INSERT INTO `sys_session` VALUES ('e6894a5bd5d7bbb6269a755d2a51bc1f', '21', '2019-02-01 13:36:56', '127.0.0.1', '127.0.0.1', '1548999366', '1548999415');
INSERT INTO `sys_session` VALUES ('e68a722067729e9a3f966be1df455516', '21', '2019-01-23 17:15:20', '127.0.0.1', '127.0.0.1', '1548234715', '1548234920');
INSERT INTO `sys_session` VALUES ('e719b301d73279c5337058705440137c', '21', '2019-02-28 10:14:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551319785', '1551320041');
INSERT INTO `sys_session` VALUES ('e764cc322bd80ad808a2daa9ae85d620', '21', '2019-01-23 17:24:08', '127.0.0.1', '127.0.0.1', '1548235225', '1548235448');
INSERT INTO `sys_session` VALUES ('e7b0035d01b74fba9b7e6116588ebb2a', '21', '2019-01-17 14:58:44', '127.0.0.1', '127.0.0.1', '1547708245', '1547708324');
INSERT INTO `sys_session` VALUES ('e7ba06a9b9a2588d95079fc9f7a1d453', '21', '2019-02-01 13:33:30', '127.0.0.1', '127.0.0.1', '1548999129', '1548999210');
INSERT INTO `sys_session` VALUES ('e86a13bea519032d144b5c3314921e94', '21', '2019-01-17 13:48:56', '127.0.0.1', '127.0.0.1', '1547704083', '1547704136');
INSERT INTO `sys_session` VALUES ('e8c762bd73cc10f776da6481ab44d403', '21', '2019-01-25 10:42:46', '127.0.0.1', '127.0.0.1', '1548384123', '1548384166');
INSERT INTO `sys_session` VALUES ('e8f23a4078a3625cd9bc503d19ffb9dd', '21', '2019-02-21 17:23:06', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550740459', '1550740986');
INSERT INTO `sys_session` VALUES ('e998ce75e0d2a2892a6669ee3619840f', '21', '2019-01-31 15:22:49', '127.0.0.1', '127.0.0.1', '1548919357', '1548919369');
INSERT INTO `sys_session` VALUES ('ea02126cab23eba83fbbdaf45db62617', '37', '2019-01-28 11:39:38', '127.0.0.1', '127.0.0.1', '1548646751', '1548646777');
INSERT INTO `sys_session` VALUES ('ea698596003498115487c8ab8d515c04', '21', '2019-01-17 15:15:57', '127.0.0.1', '127.0.0.1', '1547709090', '1547709357');
INSERT INTO `sys_session` VALUES ('eadac2dbc62c848055f12ddb025e27f0', '21', '2019-02-13 16:50:21', '127.0.0.1', '127.0.0.1', '1550041410', '1550047821');
INSERT INTO `sys_session` VALUES ('eb25aa5021dbcc809e8d17df76522850', '21', '2019-03-01 15:16:08', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551424514', '1551424568');
INSERT INTO `sys_session` VALUES ('eb5f7685e2759646ae92f333a85cf1f8', '21', '2019-01-19 14:51:24', '127.0.0.1', '127.0.0.1', '1547880581', '1547880684');
INSERT INTO `sys_session` VALUES ('eb716def7b34c0b738a9328d434d552a', '21', '2019-01-16 18:00:24', '127.0.0.1', '127.0.0.1', '1547632737', '1547632824');
INSERT INTO `sys_session` VALUES ('eba939c514f676e57bc44ad0f0a0bc15', '21', '2019-01-25 14:06:47', '127.0.0.1', '127.0.0.1', '1548395474', '1548396406');
INSERT INTO `sys_session` VALUES ('ebb11e168fed78f7254d2feaeed956c5', '21', '2019-01-22 09:53:09', '127.0.0.1', '127.0.0.1', '1548121892', '1548121989');
INSERT INTO `sys_session` VALUES ('ebed5fc6e8ed11c615857757a5cf2680', '21', '2019-02-01 16:42:08', '127.0.0.1', '127.0.0.1', '1549010370', '1549010528');
INSERT INTO `sys_session` VALUES ('ebfbd9419b3bf86267108cf7b215f436', '21', '2019-01-24 18:07:33', '127.0.0.1', '127.0.0.1', '1548324327', '1548324453');
INSERT INTO `sys_session` VALUES ('ec11cd26aa0b6e0c8cc668a516d23f13', '21', '2019-02-27 17:15:51', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551257838', '1551258951');
INSERT INTO `sys_session` VALUES ('ec8b6b4da579458ae2f28164ed339b3d', '21', '2019-03-01 15:15:14', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551419007', '1551424514');
INSERT INTO `sys_session` VALUES ('eca147fd20e3bced0d4c46d77d46f2ca', '21', '2019-01-16 19:43:17', '127.0.0.1', '127.0.0.1', '1547638948', '1547638997');
INSERT INTO `sys_session` VALUES ('ecf34fcd166f498cf946039c2fadfc1c', '21', '2019-01-31 16:18:13', '127.0.0.1', '127.0.0.1', '1548922566', '1548922693');
INSERT INTO `sys_session` VALUES ('ed55f8171a365ada9273916ee4a5df46', '21', '2019-01-16 17:23:01', '127.0.0.1', '127.0.0.1', '1547630562', '1547630581');
INSERT INTO `sys_session` VALUES ('ed71e63d960a8162df7831d16c3ed251', '21', '2019-01-16 16:55:29', '127.0.0.1', '127.0.0.1', '1547628925', '1547628929');
INSERT INTO `sys_session` VALUES ('ed758060a16bdfeb4c6af14f3a0a2784', '21', '2019-02-25 09:22:56', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1550815502', '1551057776');
INSERT INTO `sys_session` VALUES ('edc89ca808c66ae919d32dac99199c52', '21', '2019-02-28 09:12:04', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551263265', '1551316324');
INSERT INTO `sys_session` VALUES ('edcf20dbd806f36e787efe9e43b514fe', '21', '2019-01-20 17:00:22', '127.0.0.1', '127.0.0.1', '1547950228', '1547974822');
INSERT INTO `sys_session` VALUES ('edfb1915023c0f586761ee1a87f375d9', '21', '2019-02-26 13:24:33', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551153493', '1551158673');
INSERT INTO `sys_session` VALUES ('ee0f4c18fbc2732462f875800960443f', '21', '2019-01-17 09:57:42', '127.0.0.1', '127.0.0.1', '1547690193', '1547690262');
INSERT INTO `sys_session` VALUES ('ee110bdfd4facd3d9d99310e37d40a80', '37', '2019-01-25 16:03:07', '127.0.0.1', '127.0.0.1', '1548403361', '1548403387');
INSERT INTO `sys_session` VALUES ('ef3e0fadea4d9e893b215cf918992c11', '37', '2019-01-29 09:57:36', '127.0.0.1', '127.0.0.1', '1548726996', '1548727056');
INSERT INTO `sys_session` VALUES ('ef56e0638feb233d9ab838b45e760e02', '21', '2019-01-22 10:49:37', '127.0.0.1', '127.0.0.1', '1548123117', '1548125377');
INSERT INTO `sys_session` VALUES ('eff96df16ca41b3146077e83a2b1da75', '21', '2019-01-25 18:07:06', '127.0.0.1', '127.0.0.1', '1548410567', '1548410826');
INSERT INTO `sys_session` VALUES ('f07e38479d1141caf6fbe23679e988d2', '21', '2019-02-13 10:31:13', '127.0.0.1', '127.0.0.1', '1550024597', '1550025073');
INSERT INTO `sys_session` VALUES ('f09cf58f894f09efa8f82c8288748198', '21', '2019-02-01 11:32:28', '127.0.0.1', '127.0.0.1', '1548990918', '1548991948');
INSERT INTO `sys_session` VALUES ('f0a206891a97f723e6b27035f542ac08', '21', '2019-01-16 16:00:23', '127.0.0.1', '127.0.0.1', '1547625623', '1547625623');
INSERT INTO `sys_session` VALUES ('f0abd20cc0c3d0ebef1063561de1a5b6', '21', '2019-01-17 13:57:11', '127.0.0.1', '127.0.0.1', '1547704290', '1547704631');
INSERT INTO `sys_session` VALUES ('f0f77097f0fb4dc7f6931a89bcc0143e', '21', '2019-03-01 10:59:12', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551403473', '1551409152');
INSERT INTO `sys_session` VALUES ('f11741e248a11359934d898ccad3e05e', '31', '2019-01-29 15:48:51', '127.0.0.1', '127.0.0.1', '1548747976', '1548748131');
INSERT INTO `sys_session` VALUES ('f1439117da5dbc977cc34837727f705f', '37', '2019-01-25 19:25:03', '127.0.0.1', '127.0.0.1', '1548414233', '1548415503');
INSERT INTO `sys_session` VALUES ('f17d4cee7832a8510fce853263728c94', '37', '2019-01-28 11:39:11', '127.0.0.1', '127.0.0.1', '1548646650', '1548646751');
INSERT INTO `sys_session` VALUES ('f1eb7f3d249140c52c30d2b608e6b879', '21', '2019-01-19 14:52:32', '127.0.0.1', '127.0.0.1', '1547880684', '1547880752');
INSERT INTO `sys_session` VALUES ('f23a287bfe498cf2d3bf813089ecd6eb', '31', '2019-02-11 20:16:01', '127.0.0.1', '127.0.0.1', '1548748131', '1549887361');
INSERT INTO `sys_session` VALUES ('f258e6a2ead7f4a69424d457d09df8e7', '21', '2019-02-27 11:44:44', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551238253', '1551239084');
INSERT INTO `sys_session` VALUES ('f3b5b5a24281a4742db176b61fb0e214', '21', '2019-01-16 17:10:59', '127.0.0.1', '127.0.0.1', '1547629495', '1547629859');
INSERT INTO `sys_session` VALUES ('f4f593625b10ecddf795073f7b22c307', '21', '2019-01-19 14:12:02', '127.0.0.1', '127.0.0.1', '1547878208', '1547878322');
INSERT INTO `sys_session` VALUES ('f501919596e949dbb01b7d956d6cdd30', '21', '2019-01-17 14:42:59', '127.0.0.1', '127.0.0.1', '1547707332', '1547707379');
INSERT INTO `sys_session` VALUES ('f58aa225683ebd611a58b7476cd2dd69', '21', '2019-01-21 12:38:28', '127.0.0.1', '127.0.0.1', '1548042762', '1548045508');
INSERT INTO `sys_session` VALUES ('f613654e3f159fd6dd84ebd948057649', '21', '2019-01-25 17:28:28', '127.0.0.1', '127.0.0.1', '1548405422', '1548408508');
INSERT INTO `sys_session` VALUES ('f644723033d777236b62d14f6d5ce7b9', '31', '2019-01-29 15:46:16', '127.0.0.1', '127.0.0.1', '1548747889', '1548747976');
INSERT INTO `sys_session` VALUES ('f7052b4a66b901a864538dfd01fe0b43', '21', '2019-01-23 15:49:35', '127.0.0.1', '127.0.0.1', '1548229146', '1548229775');
INSERT INTO `sys_session` VALUES ('f78688f1410a1cadc373a620eade5f17', '37', '2019-01-29 20:33:44', '127.0.0.1', '127.0.0.1', '1548751406', '1548765224');
INSERT INTO `sys_session` VALUES ('f7cbf459fb16aa2e48876da505d67e09', '37', '2019-01-30 17:12:50', '127.0.0.1', '127.0.0.1', '1548837151', '1548839570');
INSERT INTO `sys_session` VALUES ('f7f3a188ab6dac22f7a364df566b885f', '21', '2019-01-25 14:41:29', '127.0.0.1', '127.0.0.1', '1548398448', '1548398489');
INSERT INTO `sys_session` VALUES ('f7f810d88e8d184c6d37182a826e9254', '21', '2019-01-17 13:13:12', '127.0.0.1', '127.0.0.1', '1547695594', '1547701992');
INSERT INTO `sys_session` VALUES ('f855af2f314c1d75dc9151e13d4edf67', '21', '2019-01-26 13:50:39', '127.0.0.1', '127.0.0.1', '1548477028', '1548481839');
INSERT INTO `sys_session` VALUES ('f85b1ece749746a5e0e831783e3b1696', '21', '2019-01-24 10:09:15', '127.0.0.1', '127.0.0.1', '1548295701', '1548295755');
INSERT INTO `sys_session` VALUES ('f87bb5e7053546b1fcbb4ae31f4fddc7', '37', '2019-01-25 18:51:53', '127.0.0.1', '127.0.0.1', '1548412981', '1548413513');
INSERT INTO `sys_session` VALUES ('f97d28305b1d91dd0bc67728f796e1f6', '21', '2019-01-20 22:00:12', '127.0.0.1', '127.0.0.1', '1547992748', '1547992812');
INSERT INTO `sys_session` VALUES ('f98cf353eef8d9c82ceb66d8723a93e3', '37', '2019-01-28 21:23:14', '127.0.0.1', '127.0.0.1', '1548681782', '1548681794');
INSERT INTO `sys_session` VALUES ('f99624dcb701a8344ecf269473ade3bb', '21', '2019-01-25 14:56:47', '127.0.0.1', '127.0.0.1', '1548398576', '1548399407');
INSERT INTO `sys_session` VALUES ('f9c971afd2d6afad7c669eb6c9336ee7', '21', '2019-02-28 17:05:29', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551342075', '1551344729');
INSERT INTO `sys_session` VALUES ('fa61972969137ae43acb63f72176e794', '21', '2019-01-24 23:05:48', '127.0.0.1', '127.0.0.1', '1548341697', '1548342348');
INSERT INTO `sys_session` VALUES ('fa65dec610a469ffdebf4c826c54c570', '21', '2019-01-17 10:05:02', '127.0.0.1', '127.0.0.1', '1547690537', '1547690702');
INSERT INTO `sys_session` VALUES ('fa8dd6b4ce8548ca561c94b33ff6a67e', '21', '2019-01-17 13:45:38', '127.0.0.1', '127.0.0.1', '1547703880', '1547703938');
INSERT INTO `sys_session` VALUES ('faf385a87f4643953011401b95797f7d', '21', '2019-01-17 13:16:00', '127.0.0.1', '127.0.0.1', '1547702076', '1547702160');
INSERT INTO `sys_session` VALUES ('fafefb26852659b1129421b15f70d90c', '21', '2019-01-16 20:05:03', '127.0.0.1', '127.0.0.1', '1547640167', '1547640303');
INSERT INTO `sys_session` VALUES ('fb05723065de314b48b7f02e7ad0ac3e', '21', '2019-02-28 09:44:00', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551318101', '1551318240');
INSERT INTO `sys_session` VALUES ('fb3e6d76b85df54faac05f0d77f89d19', '21', '2019-02-01 11:40:39', '127.0.0.1', '127.0.0.1', '1548992142', '1548992439');
INSERT INTO `sys_session` VALUES ('fb3f9ac53929e80f1ead79ef01bac8b5', '21', '2019-01-24 11:23:09', '127.0.0.1', '127.0.0.1', '1548299986', '1548300189');
INSERT INTO `sys_session` VALUES ('fb695a98554c60f293c5e5106f1cedd8', '21', '2019-02-11 17:46:22', '127.0.0.1', '127.0.0.1', '1549878342', '1549878382');
INSERT INTO `sys_session` VALUES ('fbc1c185f1d1ba418d1f47aee043f2ec', '21', '2019-01-17 11:25:16', '127.0.0.1', '127.0.0.1', '1547695416', '1547695516');
INSERT INTO `sys_session` VALUES ('fbc539821f41cb0afe8328349c42158d', '21', '2019-01-23 15:04:30', '127.0.0.1', '127.0.0.1', '1548227005', '1548227070');
INSERT INTO `sys_session` VALUES ('fbcab11af6cdd0dc5b9eecd76b9b22b3', '21', '2019-02-25 17:39:51', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551072893', '1551087591');
INSERT INTO `sys_session` VALUES ('fbe1916b3dbd6e1a736209be026fb7a3', '21', '2019-01-23 15:50:16', '127.0.0.1', '127.0.0.1', '1548229775', '1548229816');
INSERT INTO `sys_session` VALUES ('fbe2d9e98ed2003de7a0bb3e779b0d20', '21', '2019-01-17 10:11:49', '127.0.0.1', '127.0.0.1', '1547691032', '1547691109');
INSERT INTO `sys_session` VALUES ('fc133de8215eaf0b5337337124a7b34c', '21', '2019-01-16 18:00:52', '127.0.0.1', '127.0.0.1', '1547632842', '1547632852');
INSERT INTO `sys_session` VALUES ('fc344ffaf3265d9d899e4fe1a371991d', '21', '2019-01-25 15:04:22', '127.0.0.1', '127.0.0.1', '1548399527', '1548399862');
INSERT INTO `sys_session` VALUES ('fc358e9cf28925761849b8e6af73310b', '21', '2019-01-23 14:22:10', '127.0.0.1', '127.0.0.1', '1548224329', '1548224530');
INSERT INTO `sys_session` VALUES ('fc4bffb0e8acc476c2f674f5132a060c', '21', '2019-01-21 15:58:21', '127.0.0.1', '127.0.0.1', '1548057070', '1548057501');
INSERT INTO `sys_session` VALUES ('fc656250f85e5540dd46c81cd7f01fbc', '21', '2019-01-23 17:55:06', '127.0.0.1', '127.0.0.1', '1548237045', '1548237306');
INSERT INTO `sys_session` VALUES ('fcb0d504adbee3f71b72b6c11b76959f', '21', '2019-01-21 13:30:39', '127.0.0.1', '127.0.0.1', '1548048538', '1548048639');
INSERT INTO `sys_session` VALUES ('fcb378740c886ce3cdc5a38757e2f051', '21', '2019-01-16 17:25:49', '127.0.0.1', '127.0.0.1', '1547630581', '1547630749');
INSERT INTO `sys_session` VALUES ('ff0de24c02108721e7cc8a0e6963002a', '21', '2019-02-27 10:33:23', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1551234411', '1551234803');
INSERT INTO `sys_session` VALUES ('ff4052005adb28ea4d6f79e5f9c05ec9', '21', '2019-01-22 10:11:57', '127.0.0.1', '127.0.0.1', '1548123050', '1548123117');
INSERT INTO `sys_session` VALUES ('ff5096829ec96e3479439f472f5651d8', '21', '2019-02-13 17:21:41', '127.0.0.1', '127.0.0.1', '1550049659', '1550049701');
INSERT INTO `sys_session` VALUES ('ff803bad193a28ecab7901924f841469', '37', '2019-01-25 15:58:23', '127.0.0.1', '127.0.0.1', '1548402841', '1548403103');

-- ----------------------------
-- Table structure for tt_wxconfig
-- ----------------------------
DROP TABLE IF EXISTS `tt_wxconfig`;
CREATE TABLE `tt_wxconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `appsecret` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `token` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dt_add` datetime DEFAULT NULL,
  `dt_edit` datetime DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识',
  `expirestime` int(11) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '公众号类型0为微信公众，1为微信小程序',
  `pay_mch_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信支付pay_mch_id',
  `pay_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信支付key',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信公众号配置表';

-- ----------------------------
-- Records of tt_wxconfig
-- ----------------------------
INSERT INTO `tt_wxconfig` VALUES ('1', 'wx1598bbd23c024f29', 'd92abc8cfaaedc95243ee16d0cced38b', '16_s7KapNU8JMwKMveUV157sNoae4hl68wbRN54UIoKoX4xivNZG_knI-hZhEyGDx1298IJfcFQDL5XlFTanWQuiXAQaElk3GA3vmYWl1v8HzkS0KfWo0_s2bNYGO9gGLhO3vkB7f1e-MtQIXE1PHPgAAAXPX', '2018-11-30 14:59:42', '2018-11-30 14:59:42', '', 'mytest', '1545051882', '0', '', '');
DROP TRIGGER IF EXISTS `gems`;
DELIMITER ;;
CREATE TRIGGER `gems` AFTER UPDATE ON `admin` FOR EACH ROW BEGIN

UPDATE gems SET fsid=new.fsid,cp=new.cp WHERE id=new.gemsid;
END
;;
DELIMITER ;
