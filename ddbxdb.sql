/*
Navicat MySQL Data Transfer

Source Server         : localwork
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : ddbxdb

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2019-01-25 17:51:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comm_citys
-- ----------------------------
DROP TABLE IF EXISTS `comm_citys`;
CREATE TABLE `comm_citys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caid` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `namepy` varchar(255) DEFAULT NULL,
  `chrkey` char(1) DEFAULT NULL,
  `is_site` int(1) DEFAULT '0',
  `mapx` decimal(20,17) DEFAULT NULL,
  `mapy` decimal(20,17) DEFAULT NULL,
  `mapz` int(11) DEFAULT NULL,
  `mem_num` int(11) DEFAULT NULL,
  `vips_num` int(11) DEFAULT NULL,
  `pact_num` int(11) DEFAULT NULL COMMENT '签约量',
  `pact_price` int(11) DEFAULT NULL COMMENT '签约金额',
  `baseurl` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `addres` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `imgurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  KEY `is_site` (`is_site`),
  KEY `caid` (`caid`)
) ENGINE=MyISAM AUTO_INCREMENT=681 DEFAULT CHARSET=utf8;

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
  `name` varchar(255) DEFAULT NULL,
  `namepy` varchar(255) DEFAULT NULL,
  `chrkey` varchar(1) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for dd_fs
-- ----------------------------
DROP TABLE IF EXISTS `dd_fs`;
CREATE TABLE `dd_fs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid_add` int(11) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司名称',
  `mid_edit` int(11) DEFAULT NULL,
  `dt_add` datetime DEFAULT NULL,
  `dt_edit` datetime DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL COMMENT '所在省id',
  `city_id` int(11) DEFAULT NULL COMMENT '所在市id',
  `zone_id` int(11) DEFAULT NULL COMMENT '所在县id',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详细地址',
  `showtag` tinyint(4) DEFAULT NULL,
  `fs_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司logo',
  `name_py` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称拼音首字母',
  `code_pre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称拼音前缀',
  `deltag` tinyint(4) DEFAULT NULL COMMENT '删除标记 1 删除',
  `name_qy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '签约时完整名称',
  `purview_map` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '权限集合',
  `up_id` int(11) DEFAULT NULL COMMENT '代理上级id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_fs
-- ----------------------------
INSERT INTO `dd_fs` VALUES ('1', '1', '大地保险', '1', '2019-01-25 16:45:08', '2019-01-25 17:16:28', '17', '410', null, '806191630@qq.com', '1', '/upload/2019/01/25/7397bdb084900e46d666186f81974126.jpg', 'ddbx', null, null, '大地保险', null, '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_gems
-- ----------------------------
INSERT INTO `dd_gems` VALUES ('1', 'tutu', '0', null, '2019-01-25 17:36:50', null, '1', '1', '0', '/upload/2019/01/25/10a074b73cb60ce9f10968628e834edb.jpg', null, '1', '111111', 'a4bf3d1b793ee31147ed28cb849683eb', null, '0', null, null, null, '0', '0');

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
  `bc_status` tinyint(4) DEFAULT NULL COMMENT '订单状态',
  `gems_id` int(11) DEFAULT NULL COMMENT '人员ID',
  `gems_fs_id` int(11) DEFAULT NULL,
  `order_code` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `c_name` varchar(20) DEFAULT NULL COMMENT '客户姓名',
  `c_tel` varchar(15) DEFAULT NULL COMMENT '客户手机号',
  `c_cardno` varchar(32) DEFAULT NULL COMMENT '客户身份证号',
  `c_sex` tinyint(4) DEFAULT NULL,
  `po_c_name` varchar(20) DEFAULT NULL COMMENT '配偶姓名',
  `po_c_tel` varchar(15) DEFAULT NULL COMMENT '配偶手机号',
  `po_c_cardno` varchar(32) DEFAULT NULL COMMENT '配偶身份证号',
  `c_name_gj1` varchar(20) DEFAULT NULL COMMENT '共借人1姓名',
  `c_tel_gj1` varchar(15) DEFAULT NULL COMMENT '共借人1手机号',
  `c_cardno_gj1` varchar(32) DEFAULT NULL COMMENT '共借人1身份证号',
  `c_name_gj2` varchar(20) DEFAULT NULL COMMENT '共借人2姓名',
  `c_tel_gj2` varchar(15) DEFAULT NULL COMMENT '共借人2手机号',
  `c_cardno_gj2` varchar(32) DEFAULT NULL COMMENT '共借人2身份证号',
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
  `stateid` int(11) DEFAULT NULL COMMENT '所在省ID',
  `cityid` int(11) DEFAULT NULL COMMENT '所在市ID',
  `adminop_tag` tinyint(4) DEFAULT NULL COMMENT '当前操作人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_icbc
-- ----------------------------

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
  `order_id` int(11) DEFAULT NULL,
  `gems_id` int(11) DEFAULT NULL,
  `gems_fs_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT '业务类型id',
  `c_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `c_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `c_cardno` int(50) DEFAULT NULL COMMENT '身份证号',
  `c_carvin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车辆VIN',
  `c_carno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `adminop_tag` int(11) DEFAULT NULL COMMENT '当前操作人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_icbc_erp
-- ----------------------------

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
  `result_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '节点信息描述',
  `result_value` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '节点保存信息json文本',
  `type_id` int(11) DEFAULT NULL COMMENT '业务类型id',
  `order_id` int(11) DEFAULT NULL COMMENT '主订单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_icbc_erp_result
-- ----------------------------

-- ----------------------------
-- Table structure for dd_icbc_materials
-- ----------------------------
DROP TABLE IF EXISTS `dd_icbc_materials`;
CREATE TABLE `dd_icbc_materials` (
  `id` int(11) NOT NULL,
  `mid_add` int(11) DEFAULT NULL,
  `mid_edit` int(11) DEFAULT NULL,
  `dt_add` datetime DEFAULT NULL,
  `dt_edit` datetime DEFAULT NULL,
  `gems_fs_id` int(11) DEFAULT NULL,
  `gems_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL COMMENT '主订单id',
  `imgstep1_1ss` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '贷款材料集合',
  `imgstep1_2ss` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '银行材料集合',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_icbc_materials
-- ----------------------------

-- ----------------------------
-- Table structure for dd_icbc_result
-- ----------------------------
DROP TABLE IF EXISTS `dd_icbc_result`;
CREATE TABLE `dd_icbc_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '主订单ID',
  `mid_add` int(11) DEFAULT NULL COMMENT '添加人ID',
  `mid_edit` int(11) DEFAULT NULL COMMENT '编辑人ID',
  `dt_add` datetime DEFAULT NULL COMMENT '添加时间',
  `dt_edit` datetime DEFAULT NULL COMMENT '编辑时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_icbc_result
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menulevels
-- ----------------------------
DROP TABLE IF EXISTS `sys_menulevels`;
CREATE TABLE `sys_menulevels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='菜单级别';

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
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '子模块名称',
  `id_uplevel` int(11) NOT NULL COMMENT '上级模块id,主模块id，所属主模块',
  `mid_add` int(11) NOT NULL DEFAULT '0',
  `mid_edit` int(11) NOT NULL DEFAULT '0',
  `dt_add` datetime DEFAULT NULL,
  `dt_edit` datetime DEFAULT NULL,
  `showmmenutag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '后台菜单显示',
  `showmmenuname` varchar(20) NOT NULL DEFAULT '' COMMENT '后台菜单显示名称',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'url,type=的值',
  `cn` varchar(20) NOT NULL DEFAULT '' COMMENT 'url里面的cn的值，一般是表名',
  `sort` int(8) NOT NULL DEFAULT '100' COMMENT '排序，越小越高',
  `level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '菜单级别，1为1级，2为2级。。。。',
  `icohtml` varchar(255) NOT NULL DEFAULT '<i class="fa fa-arrow-circle-o-right"></i>' COMMENT '显示菜单时前面的图标html',
  `urlotherstr` varchar(255) NOT NULL DEFAULT '' COMMENT 'url里传入的其他参数',
  `sdo` varchar(20) NOT NULL DEFAULT 'list' COMMENT 'url里面的sdo',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`),
  KEY `showmmenutag` (`showmmenutag`),
  KEY `id_upmodal` (`id_uplevel`),
  KEY `sort_2` (`sort`),
  KEY `level` (`level`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='系统模块表';

-- ----------------------------
-- Records of sys_modal
-- ----------------------------
INSERT INTO `sys_modal` VALUES ('1', '系统角色管理', '6', '21', '21', '2019-01-21 00:00:00', '2019-01-21 10:03:17', '1', '角色管理', 'agp', 'agp_group', '100', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list');
INSERT INTO `sys_modal` VALUES ('2', '系统权限管理', '6', '21', '21', '2019-01-21 08:00:00', '2019-01-21 10:00:00', '1', '权限管理', 'agp', 'agp', '100', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list');
INSERT INTO `sys_modal` VALUES ('3', '演示列表list,用admin表', '5', '21', '21', '2019-01-21 00:00:00', '2019-01-21 00:00:00', '1', '会员列表', 'demo', 'admin', '2', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list');
INSERT INTO `sys_modal` VALUES ('4', '演示列表，用comm_citys', '5', '21', '21', '2018-08-08 00:00:00', '2019-01-22 14:44:19', '1', '城市列表', 'demo', 'comm_citys', '1', '2', '<i class=\"fa fa-crosshairs\"></i>', '', 'list');
INSERT INTO `sys_modal` VALUES ('5', '演示模块', '0', '21', '1', '2018-04-24 19:25:52', '2019-01-25 15:23:43', '0', '演示模块', '', '', '1', '1', '<i class=\"fa  fa-database\"></i>', '', 'list');
INSERT INTO `sys_modal` VALUES ('6', '系统设置', '0', '21', '21', '2018-08-08 00:00:00', '2019-01-22 15:00:43', '1', '系统设置', 'sys', 'sys_modal', '200', '1', '<i class=\"fa fa-asterisk\"></i>', '', 'list');
INSERT INTO `sys_modal` VALUES ('7', 'tt_form2', '5', '21', '21', '2018-08-08 00:00:00', '2018-08-08 00:00:00', '1', 'tt_form2', 'demo', 'admin2', '4', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '&id=25', 'form');
INSERT INTO `sys_modal` VALUES ('8', 'button', '5', '21', '21', '2018-08-08 00:00:00', '2018-08-08 00:00:00', '1', 'button', 'demo', 'button', '3', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'form');
INSERT INTO `sys_modal` VALUES ('9', '菜单和模块管理', '6', '21', '21', '2018-04-24 19:25:52', '2019-01-21 17:07:08', '1', '模块管理', 'sys', 'sys_modal', '1', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list');
INSERT INTO `sys_modal` VALUES ('10', 'Modals', '5', '21', '21', '2019-01-21 16:27:55', '2019-01-21 16:27:55', '1', 'Modals', 'demo', 'Modals', '200', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'form');
INSERT INTO `sys_modal` VALUES ('11', 'general', '5', '21', '21', '2019-01-21 16:36:36', '2019-01-21 16:36:36', '1', 'general', 'demo', 'general', '201', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'form');
INSERT INTO `sys_modal` VALUES ('12', 'table', '5', '21', '1', '2019-01-21 16:39:40', '2019-01-25 15:23:19', '0', 'table', 'demo', 'table', '202', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'form');
INSERT INTO `sys_modal` VALUES ('13', '贷后管理', '0', '21', '1', '2019-01-22 09:42:17', '2019-01-25 15:24:02', '0', '贷后管理', 'bank', 'dh', '3', '1', '<i class=\"fa fa-automobile\"></i>', '', 'list');
INSERT INTO `sys_modal` VALUES ('14', 'GPS定位管理', '13', '21', '21', '2019-01-22 09:48:26', '2019-01-22 09:48:26', '1', 'GPS管理', 'bank', 'gps', '1', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list');
INSERT INTO `sys_modal` VALUES ('15', '客户管理', '0', '21', '21', '2019-01-22 09:56:42', '2019-01-22 10:53:56', '1', '客户管理', 'demo', 'admin', '4', '1', '<i class=\"fa fa-home\"></i>', '', 'list');
INSERT INTO `sys_modal` VALUES ('16', '代理公司', '15', '21', '1', '2019-01-22 09:57:15', '2019-01-25 15:26:42', '1', '代理公司', 'ddbx', 'dd_fs', '1', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list');
INSERT INTO `sys_modal` VALUES ('17', '给客户开个号', '15', '21', '1', '2019-01-22 11:05:25', '2019-01-25 15:24:44', '0', '新增客户', 'demo', 'admin', '2', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'form');
INSERT INTO `sys_modal` VALUES ('18', '用户列表', '15', '1', '1', '2019-01-25 15:15:32', '2019-01-25 15:15:32', '1', '用户列表', 'ddbx', 'dd_gems', '3', '2', '<i class=\"fa fa-arrow-circle-o-right\"></i>', '', 'list');

-- ----------------------------
-- Table structure for sys_session
-- ----------------------------
DROP TABLE IF EXISTS `sys_session`;
CREATE TABLE `sys_session` (
  `idmd5` varchar(64) NOT NULL DEFAULT '',
  `mid` varchar(255) DEFAULT NULL,
  `lastdt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logip` varchar(64) DEFAULT NULL,
  `outip` varchar(64) DEFAULT NULL,
  `logdt` int(11) DEFAULT '0',
  `outdt` int(11) DEFAULT '0',
  PRIMARY KEY (`idmd5`),
  KEY `outdt` (`outdt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_session
-- ----------------------------
INSERT INTO `sys_session` VALUES ('008b6fbe9cb15ad4ce45453c30311d2d', '21', '2019-01-21 17:01:11', '127.0.0.1', '127.0.0.1', '1548061156', '1548061271');
INSERT INTO `sys_session` VALUES ('013b3e699ec6421a225c5a3e8de1a3e2', '21', '2019-01-22 11:03:46', '127.0.0.1', '127.0.0.1', '1548126112', '1548126226');
INSERT INTO `sys_session` VALUES ('02c5a6f9e942116f86b796b43189ccc5', '21', '2019-01-16 17:22:42', '127.0.0.1', '127.0.0.1', '1547630516', '1547630562');
INSERT INTO `sys_session` VALUES ('04098c4d177316170f14bccd712ff292', '21', '2019-01-20 21:48:29', '127.0.0.1', '127.0.0.1', '1547992071', '1547992109');
INSERT INTO `sys_session` VALUES ('045d92d5bc9bf5ac67afeb83e77fa0df', '21', '2019-01-19 17:55:21', '127.0.0.1', '127.0.0.1', '1547891667', '1547891721');
INSERT INTO `sys_session` VALUES ('04c1b13b90c6fd5f4b45cabd96221bcc', '21', '2019-01-16 19:37:23', '127.0.0.1', '127.0.0.1', '1547638393', '1547638643');
INSERT INTO `sys_session` VALUES ('0541f7d1a07b40958cdd169a9e49827f', '21', '2019-01-20 21:47:51', '127.0.0.1', '127.0.0.1', '1547991994', '1547992071');
INSERT INTO `sys_session` VALUES ('055c7108bc3f7cac707d071780e318bb', '21', '2019-01-21 11:11:44', '127.0.0.1', '127.0.0.1', '1548040099', '1548040304');
INSERT INTO `sys_session` VALUES ('05879fe377099e5e6c8c89b122ddde14', '1', '2019-01-25 15:32:04', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548401297', '1548401524');
INSERT INTO `sys_session` VALUES ('05fa215f23035da05229410616c6ef05', '21', '2019-01-20 22:01:33', '127.0.0.1', '127.0.0.1', '1547992873', '1547992893');
INSERT INTO `sys_session` VALUES ('060c9ed97a559b1e0d693fbf942cedc8', '21', '2019-01-16 15:59:51', '127.0.0.1', '127.0.0.1', '1547625419', '1547625591');
INSERT INTO `sys_session` VALUES ('065a89eae8b65745bd1ba2cfbfc90624', '21', '2019-01-20 22:01:13', '127.0.0.1', '127.0.0.1', '1547992812', '1547992873');
INSERT INTO `sys_session` VALUES ('06b10f9296b4355bebb1949a28d6c022', '21', '2019-01-16 21:28:07', '127.0.0.1', '127.0.0.1', '1547645083', '1547645287');
INSERT INTO `sys_session` VALUES ('0777aa1ba8c5d1351505ddb327e9eb08', '21', '2019-01-21 11:52:42', '127.0.0.1', '127.0.0.1', '1548042690', '1548042762');
INSERT INTO `sys_session` VALUES ('07865b7ffa7effcae1545b28efcb76d8', '21', '2019-01-19 13:41:35', '127.0.0.1', '127.0.0.1', '1547876413', '1547876495');
INSERT INTO `sys_session` VALUES ('078c4e6626b0c1f183ccd3391ee28204', '21', '2019-01-19 21:34:01', '127.0.0.1', '127.0.0.1', '1547904721', '1547904841');
INSERT INTO `sys_session` VALUES ('0a47f9b47d817ed16b93ed3e3cd3b2c7', '21', '2019-01-16 15:51:56', '127.0.0.1', '127.0.0.1', '1547624966', '1547625116');
INSERT INTO `sys_session` VALUES ('0b9394924e8c8f00eabc95a96826fa28', '21', '2019-01-19 14:54:16', '127.0.0.1', '127.0.0.1', '1547880820', '1547880856');
INSERT INTO `sys_session` VALUES ('0ede20ee11202053ae1de152e9c1393a', '21', '2019-01-21 16:51:13', '127.0.0.1', '127.0.0.1', '1548060473', '1548060673');
INSERT INTO `sys_session` VALUES ('0f6f9681a34152b3f5c3adf1e1f981c0', '21', '2019-01-17 13:40:01', '127.0.0.1', '127.0.0.1', '1547703504', '1547703601');
INSERT INTO `sys_session` VALUES ('10f8ad4ad99d72fae388f0560089c2c3', '21', '2019-01-16 15:56:59', '127.0.0.1', '127.0.0.1', '1547625391', '1547625419');
INSERT INTO `sys_session` VALUES ('10fcd56474aec164c2b68edc1a541cc5', '21', '2019-01-21 13:11:19', '127.0.0.1', '127.0.0.1', '1548047310', '1548047479');
INSERT INTO `sys_session` VALUES ('1159732b149f1be9fd0ca1a092c75bc2', '21', '2019-01-19 13:40:13', '127.0.0.1', '127.0.0.1', '1547876325', '1547876413');
INSERT INTO `sys_session` VALUES ('136074729e652668ea9b7fbddf440a8e', '21', '2019-01-16 17:41:53', '127.0.0.1', '127.0.0.1', '1547631353', '1547631713');
INSERT INTO `sys_session` VALUES ('13eb3823b6e9ffb49092bc63151dfafa', '21', '2019-01-17 13:14:36', '127.0.0.1', '127.0.0.1', '1547702040', '1547702076');
INSERT INTO `sys_session` VALUES ('142979ce43d69672e797be495aeaf4bd', '21', '2019-01-16 21:34:20', '127.0.0.1', '127.0.0.1', '1547645602', '1547645660');
INSERT INTO `sys_session` VALUES ('1447e7444a1a9d4f620489c023f6671c', '21', '2019-01-19 14:53:40', '127.0.0.1', '127.0.0.1', '1547880752', '1547880820');
INSERT INTO `sys_session` VALUES ('146a327a8b8e50b55637f5dfd9fa1c58', '21', '2019-01-16 17:04:55', '127.0.0.1', '127.0.0.1', '1547629495', '1547629495');
INSERT INTO `sys_session` VALUES ('15a5109cd38c67f7173a8bd232381faa', '21', '2019-01-19 21:36:39', '127.0.0.1', '127.0.0.1', '1547904911', '1547904999');
INSERT INTO `sys_session` VALUES ('16a531fd982d37e9bc67714320edcd53', '21', '2019-01-19 17:51:08', '127.0.0.1', '127.0.0.1', '1547891382', '1547891468');
INSERT INTO `sys_session` VALUES ('17d8790f7d339aafc37906e8c729f87d', '21', '2019-01-17 13:57:48', '127.0.0.1', '127.0.0.1', '1547704631', '1547704668');
INSERT INTO `sys_session` VALUES ('18ac30fcdf95a2c501212292f28a7bd2', '21', '2019-01-17 14:32:49', '127.0.0.1', '127.0.0.1', '1547706689', '1547706769');
INSERT INTO `sys_session` VALUES ('18cebdaade5814dfc58d13db049c4908', '21', '2019-01-21 11:47:55', '127.0.0.1', '127.0.0.1', '1548042356', '1548042475');
INSERT INTO `sys_session` VALUES ('18d067cacbb3809883038eb8fb319b24', '21', '2019-01-16 17:28:28', '127.0.0.1', '127.0.0.1', '1547630768', '1547630908');
INSERT INTO `sys_session` VALUES ('1957bdd7cd869102f2e6b9054293928e', '21', '2019-01-17 14:44:02', '127.0.0.1', '127.0.0.1', '1547707379', '1547707442');
INSERT INTO `sys_session` VALUES ('199da1bb19af5ee97983bca4ccf172d2', '21', '2019-01-20 00:40:09', '127.0.0.1', '127.0.0.1', '1547904999', '1547916009');
INSERT INTO `sys_session` VALUES ('19d21db42884804015df12ef68274173', '21', '2019-01-16 17:13:14', '127.0.0.1', '127.0.0.1', '1547629859', '1547629994');
INSERT INTO `sys_session` VALUES ('1acf7779f1b47c4c9ee693650bec1ebb', '21', '2019-01-16 16:55:25', '127.0.0.1', '127.0.0.1', '1547628914', '1547628925');
INSERT INTO `sys_session` VALUES ('1c042189a5154a1805a809de02d792e5', '21', '2019-01-21 09:50:40', '127.0.0.1', '127.0.0.1', '1548035263', '1548035440');
INSERT INTO `sys_session` VALUES ('1c6dd07c61a851cccd56821135938427', '21', '2019-01-22 10:10:50', '127.0.0.1', '127.0.0.1', '1548121989', '1548123050');
INSERT INTO `sys_session` VALUES ('1cb515bc1243f8b95d6122c066d49f51', '21', '2019-01-21 13:28:19', '127.0.0.1', '127.0.0.1', '1548048110', '1548048499');
INSERT INTO `sys_session` VALUES ('1d5511daccb0783abcc9646d9df6c856', '21', '2019-01-17 14:50:59', '127.0.0.1', '127.0.0.1', '1547707442', '1547707859');
INSERT INTO `sys_session` VALUES ('1e770f7bfae3765d1bbf9ed53871b88a', '21', '2019-01-19 17:52:46', '127.0.0.1', '127.0.0.1', '1547891562', '1547891566');
INSERT INTO `sys_session` VALUES ('1f03e10eeb9febd5ea315d3cfbf0e96c', '21', '2019-01-21 11:23:00', '127.0.0.1', '127.0.0.1', '1548040304', '1548040980');
INSERT INTO `sys_session` VALUES ('1f5d5714168cd8cda8882c3d7fa0c85a', '21', '2019-01-20 22:21:55', '127.0.0.1', '127.0.0.1', '1547993858', '1547994115');
INSERT INTO `sys_session` VALUES ('1fbb5e8d60e14ea098e2855a1e8f34a1', '21', '2019-01-16 16:44:38', '127.0.0.1', '127.0.0.1', '1547627178', '1547628278');
INSERT INTO `sys_session` VALUES ('20107e513ec3a2838bad540fe4441c05', '21', '2019-01-16 15:56:31', '127.0.0.1', '127.0.0.1', '1547625116', '1547625391');
INSERT INTO `sys_session` VALUES ('20358f3e0a83023f93b864eff4d440ed', '21', '2019-01-21 09:39:01', '127.0.0.1', '127.0.0.1', '1547994418', '1548034741');
INSERT INTO `sys_session` VALUES ('20759393ded4f98f16b20fb86164895c', '21', '2019-01-24 11:30:39', '127.0.0.1', '0:0:0:0:0:0:0:1', '1548150293', '1548300639');
INSERT INTO `sys_session` VALUES ('224e8f335d92e8947e303bbc532da1f6', '21', '2019-01-21 17:39:26', '127.0.0.1', '127.0.0.1', '1548061622', '1548063566');
INSERT INTO `sys_session` VALUES ('2314914b589be1b5df38152cf2d35051', '21', '2019-01-19 13:33:04', '127.0.0.1', '127.0.0.1', '1547872968', '1547875984');
INSERT INTO `sys_session` VALUES ('23be7f9abfa7d8fc2c44d516ca92fdf9', '21', '2019-01-20 20:40:39', '127.0.0.1', '127.0.0.1', '1547975474', '1547988039');
INSERT INTO `sys_session` VALUES ('25a6a3ffea10c0a8d39bb3a1a81b6188', '21', '2019-01-16 18:00:42', '127.0.0.1', '127.0.0.1', '1547632824', '1547632842');
INSERT INTO `sys_session` VALUES ('265b92efb3129069699c9cd4bafcb87a', '21', '2019-01-21 16:22:52', '127.0.0.1', '127.0.0.1', '1548058223', '1548058972');
INSERT INTO `sys_session` VALUES ('267574c80f719368d27a3a91baa599a7', '21', '2019-01-16 16:59:33', '127.0.0.1', '127.0.0.1', '1547629173', '1547629173');
INSERT INTO `sys_session` VALUES ('269ea256704bb3e8a121b8d15055fd8a', '21', '2019-01-19 14:18:03', '127.0.0.1', '127.0.0.1', '1547878557', '1547878683');
INSERT INTO `sys_session` VALUES ('26b18e940bb9462ce303e2d2c1bb84c7', '21', '2019-01-16 17:18:28', '127.0.0.1', '127.0.0.1', '1547630178', '1547630308');
INSERT INTO `sys_session` VALUES ('27075e3d760f10e6b4f56e75005b4738', '21', '2019-01-21 13:37:02', '127.0.0.1', '127.0.0.1', '1548048990', '1548049022');
INSERT INTO `sys_session` VALUES ('283fa6f7fd6e10e99feabc2eebb1dcee', '21', '2019-01-17 14:17:39', '127.0.0.1', '127.0.0.1', '1547705449', '1547705859');
INSERT INTO `sys_session` VALUES ('28b543f87c05726d9c5c8e23332b2f7a', '21', '2019-01-16 17:58:57', '127.0.0.1', '127.0.0.1', '1547632480', '1547632737');
INSERT INTO `sys_session` VALUES ('28f9b41428321c125220832951a11d9c', '21', '2019-01-21 12:48:00', '127.0.0.1', '127.0.0.1', '1548045621', '1548046080');
INSERT INTO `sys_session` VALUES ('29efee79bcb4929c5fff1f9574b2eb81', '21', '2019-01-21 13:28:58', '127.0.0.1', '127.0.0.1', '1548048499', '1548048538');
INSERT INTO `sys_session` VALUES ('2a1786df4e525f3e4750c05f300c9995', '21', '2019-01-16 17:42:15', '127.0.0.1', '127.0.0.1', '1547631713', '1547631735');
INSERT INTO `sys_session` VALUES ('2b6e221ba2e88e50825a71aa5a070317', '21', '2019-01-20 21:44:44', '127.0.0.1', '127.0.0.1', '1547991529', '1547991884');
INSERT INTO `sys_session` VALUES ('2bf54588e24f3a09d81df5596dd73ea3', '21', '2019-01-20 17:11:14', '127.0.0.1', '127.0.0.1', '1547974997', '1547975474');
INSERT INTO `sys_session` VALUES ('2c2d69d8da81f2951b6de113d5cc3b76', '21', '2019-01-20 22:08:27', '127.0.0.1', '127.0.0.1', '1547992983', '1547993307');
INSERT INTO `sys_session` VALUES ('2d49ca57f00d0258201183f79a2de83a', '21', '2019-01-17 14:24:59', '127.0.0.1', '127.0.0.1', '1547706259', '1547706299');
INSERT INTO `sys_session` VALUES ('2dc1e893521f7092d552e841695a05d9', '21', '2019-01-19 17:49:42', '127.0.0.1', '127.0.0.1', '1547880856', '1547891382');
INSERT INTO `sys_session` VALUES ('2f40d8fa73aeb1d8e6c04f84a93fe112', '21', '2019-01-19 14:22:48', '127.0.0.1', '127.0.0.1', '1547878871', '1547878968');
INSERT INTO `sys_session` VALUES ('3035bdfc9dc697563cf8934a1f8beabe', '21', '2019-01-22 09:46:29', '127.0.0.1', '127.0.0.1', '1548121309', '1548121589');
INSERT INTO `sys_session` VALUES ('30a1ad0a70236c6ad166cbca98886cad', '21', '2019-01-17 14:52:15', '127.0.0.1', '127.0.0.1', '1547707902', '1547707935');
INSERT INTO `sys_session` VALUES ('30b7831d8bfc76d2fb69eec3e08e668e', '21', '2019-01-17 09:56:33', '127.0.0.1', '127.0.0.1', '1547689998', '1547690193');
INSERT INTO `sys_session` VALUES ('3184fd4c0429d2e5d9f682b2c4c8861b', '1', '2019-01-25 15:41:05', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548401524', '1548402065');
INSERT INTO `sys_session` VALUES ('325ed41e21bab5858f88b8d201e94cbd', '21', '2019-01-17 13:51:30', '127.0.0.1', '127.0.0.1', '1547704136', '1547704290');
INSERT INTO `sys_session` VALUES ('32683f6ff0b6d9405dbcfed137930a35', '21', '2019-01-21 17:07:02', '127.0.0.1', '127.0.0.1', '1548061550', '1548061622');
INSERT INTO `sys_session` VALUES ('335d3da4ff39c923640f6a849fa4f1a4', '21', '2019-01-19 21:32:01', '127.0.0.1', '127.0.0.1', '1547891721', '1547904721');
INSERT INTO `sys_session` VALUES ('33702a127516ab5e8344ba7d4831f174', '21', '2019-01-19 13:44:16', '127.0.0.1', '127.0.0.1', '1547876579', '1547876656');
INSERT INTO `sys_session` VALUES ('33c42d51fe01a435392bbaa0cfdb6f91', '21', '2019-01-16 17:16:18', '127.0.0.1', '127.0.0.1', '1547629994', '1547630178');
INSERT INTO `sys_session` VALUES ('347dbb9bb3566513dfae34685c896020', '21', '2019-01-18 11:21:37', '127.0.0.1', '127.0.0.1', '1547781405', '1547781697');
INSERT INTO `sys_session` VALUES ('34987901e8ce9df14473cd034926e26b', '21', '2019-01-17 10:10:32', '127.0.0.1', '127.0.0.1', '1547690906', '1547691032');
INSERT INTO `sys_session` VALUES ('34c5345f0cf56a7294a95b5d319eed50', '21', '2019-01-16 16:26:18', '127.0.0.1', '127.0.0.1', '1547625623', '1547627178');
INSERT INTO `sys_session` VALUES ('34d9c53dedf116bbb18daad4532d0672', '21', '2019-01-22 14:55:43', '127.0.0.1', '127.0.0.1', '1548140102', '1548140143');
INSERT INTO `sys_session` VALUES ('359522ff8e8f029c5d21f3634c786a70', '21', '2019-01-19 17:49:42', '127.0.0.1', '127.0.0.1', '1547891382', '1547891382');
INSERT INTO `sys_session` VALUES ('36e4e8165eb673728c32693b5c297969', '21', '2019-01-21 13:21:50', '127.0.0.1', '127.0.0.1', '1548047830', '1548048110');
INSERT INTO `sys_session` VALUES ('3789c218f975ebe44165c2e1df6814ba', '21', '2019-01-16 17:19:35', '127.0.0.1', '127.0.0.1', '1547630364', '1547630375');
INSERT INTO `sys_session` VALUES ('37b53fa66d6412f8bfe1e7b406ef6064', '21', '2019-01-19 13:38:45', '127.0.0.1', '127.0.0.1', '1547875984', '1547876325');
INSERT INTO `sys_session` VALUES ('38d89c1bc818d2ef968c0d1038e8fae8', '21', '2019-01-16 17:18:28', '127.0.0.1', '127.0.0.1', '1547630178', '1547630308');
INSERT INTO `sys_session` VALUES ('38df065750fa35c2e790761437fdce02', '21', '2019-01-17 14:24:19', '127.0.0.1', '127.0.0.1', '1547705907', '1547706259');
INSERT INTO `sys_session` VALUES ('38df36726bcc7dbeeaec0d0e04a8a20b', '21', '2019-01-16 15:56:31', '127.0.0.1', '127.0.0.1', '1547625116', '1547625391');
INSERT INTO `sys_session` VALUES ('39510a146cf2c9734c0a99b4979cd5e9', '21', '2019-01-21 13:08:30', '127.0.0.1', '127.0.0.1', '1548046686', '1548047310');
INSERT INTO `sys_session` VALUES ('3cfbf4c91c5d7603a460ef0a4b6c141d', '21', '2019-01-16 16:55:29', '127.0.0.1', '127.0.0.1', '1547628929', '1547628929');
INSERT INTO `sys_session` VALUES ('3d4e14dbf2cc10fda20b313f7bf1f870', '21', '2019-01-21 16:47:53', '127.0.0.1', '127.0.0.1', '1548059938', '1548060473');
INSERT INTO `sys_session` VALUES ('3f0357996026e4c98338d3eb9dccaf8d', '21', '2019-01-20 21:49:05', '127.0.0.1', '127.0.0.1', '1547992109', '1547992145');
INSERT INTO `sys_session` VALUES ('4163a076c934838ab9634710d8d00c78', '21', '2019-01-17 13:46:12', '127.0.0.1', '127.0.0.1', '1547703938', '1547703972');
INSERT INTO `sys_session` VALUES ('422a52d3eefd6bcabddbf2337e4a3a1c', '21', '2019-01-21 11:45:56', '127.0.0.1', '127.0.0.1', '1548042262', '1548042356');
INSERT INTO `sys_session` VALUES ('4516fdb6ff7568441a38a40f31f220f6', '21', '2019-01-16 17:54:40', '127.0.0.1', '127.0.0.1', '1547632460', '1547632480');
INSERT INTO `sys_session` VALUES ('4523c5cd589ded32740ba4f69ac5714a', '21', '2019-01-20 20:45:21', '127.0.0.1', '127.0.0.1', '1547988241', '1547988321');
INSERT INTO `sys_session` VALUES ('47b5bcb47662e662027313d5a20ecfbf', '21', '2019-01-17 15:11:30', '127.0.0.1', '127.0.0.1', '1547708979', '1547709090');
INSERT INTO `sys_session` VALUES ('48fa287beb2be4db3cf948b768ee790d', '21', '2019-01-17 13:23:42', '127.0.0.1', '127.0.0.1', '1547702219', '1547702622');
INSERT INTO `sys_session` VALUES ('490026e3b5abced150953f1c9e8a8b88', '21', '2019-01-19 14:10:08', '127.0.0.1', '127.0.0.1', '1547877278', '1547878208');
INSERT INTO `sys_session` VALUES ('494174201897a2cb3a744cf3c36775ff', '21', '2019-01-19 12:42:48', '127.0.0.1', '127.0.0.1', '1547872889', '1547872968');
INSERT INTO `sys_session` VALUES ('4ac24e25aa93dd7307ab059f7219224c', '21', '2019-01-16 17:18:39', '127.0.0.1', '127.0.0.1', '1547630308', '1547630319');
INSERT INTO `sys_session` VALUES ('4d02328176b3ee39bfea1a447209c013', '1', '2019-01-25 16:00:42', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548402907', '1548403242');
INSERT INTO `sys_session` VALUES ('4dac4f3a40ba73e3ba0c760737c5b111', '21', '2019-01-20 22:26:58', '127.0.0.1', '127.0.0.1', '1547994163', '1547994418');
INSERT INTO `sys_session` VALUES ('4e12cd7372f45148f8a30629f2c86a5d', '21', '2019-01-17 10:02:17', '127.0.0.1', '127.0.0.1', '1547690446', '1547690537');
INSERT INTO `sys_session` VALUES ('4e24d38ef25a91bb40d13fa5639b17fd', '21', '2019-01-19 12:41:29', '127.0.0.1', '127.0.0.1', '1547872473', '1547872889');
INSERT INTO `sys_session` VALUES ('4f47a4ee48a74c2919da21463c08a3f5', '21', '2019-01-20 17:03:17', '127.0.0.1', '127.0.0.1', '1547974953', '1547974997');
INSERT INTO `sys_session` VALUES ('5078cdd900c744d858b63a0a852cc9d1', '1', '2019-01-25 16:31:48', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548403578', '1548405108');
INSERT INTO `sys_session` VALUES ('50a2e63531c11aa4d673d54a114e8ae8', '21', '2019-01-17 11:21:39', '127.0.0.1', '127.0.0.1', '1547693906', '1547695299');
INSERT INTO `sys_session` VALUES ('50c9491b56809d14638585bf1390f62d', '21', '2019-01-21 15:59:17', '127.0.0.1', '127.0.0.1', '1548057537', '1548057557');
INSERT INTO `sys_session` VALUES ('51e7451f911da3a56052dee3c0e68989', '21', '2019-01-17 13:31:36', '127.0.0.1', '127.0.0.1', '1547702641', '1547703096');
INSERT INTO `sys_session` VALUES ('5222935aee5b829fdd442894cd8a358e', '21', '2019-01-16 15:51:56', '127.0.0.1', '127.0.0.1', '1547624966', '1547625116');
INSERT INTO `sys_session` VALUES ('5341e481f4bee80b9915d7454fd797f6', '21', '2019-01-20 17:02:03', '127.0.0.1', '127.0.0.1', '1547974822', '1547974923');
INSERT INTO `sys_session` VALUES ('53c5e41816b75f077b25fd8e0ca75678', '21', '2019-01-17 10:06:36', '127.0.0.1', '127.0.0.1', '1547690702', '1547690796');
INSERT INTO `sys_session` VALUES ('55453b4575c0bfda87e1b845a443a16b', '21', '2019-01-16 17:21:56', '127.0.0.1', '127.0.0.1', '1547630375', '1547630516');
INSERT INTO `sys_session` VALUES ('55e3a2ae2aaf34883eb980994ccc0441', '21', '2019-01-16 15:47:17', '127.0.0.1', '127.0.0.1', '1547624808', '1547624837');
INSERT INTO `sys_session` VALUES ('56e5fa5b8167b2f23753dfbb5b429b57', '21', '2019-01-16 20:02:47', '127.0.0.1', '127.0.0.1', '1547639947', '1547640167');
INSERT INTO `sys_session` VALUES ('56f5f5b5cddbfcf52350556359d1d800', '21', '2019-01-22 09:41:49', '127.0.0.1', '127.0.0.1', '1548063566', '1548121309');
INSERT INTO `sys_session` VALUES ('5721b2b622f1acebb2fe64cef8538cf5', '21', '2019-01-20 20:49:14', '127.0.0.1', '127.0.0.1', '1547988511', '1547988554');
INSERT INTO `sys_session` VALUES ('574ae9a3c86ac8dca7ca4ae86ea2aae8', '21', '2019-01-16 21:24:43', '127.0.0.1', '127.0.0.1', '1547644434', '1547645083');
INSERT INTO `sys_session` VALUES ('57a420ed5afd6e5aaa6bdf4f65769c98', '21', '2019-01-21 12:58:06', '127.0.0.1', '127.0.0.1', '1548046080', '1548046686');
INSERT INTO `sys_session` VALUES ('57c3c28ac804cbac477d2f0658a13387', '21', '2019-01-16 16:44:38', '127.0.0.1', '127.0.0.1', '1547627178', '1547628278');
INSERT INTO `sys_session` VALUES ('5996c9b463709c81f9cfe005eb2fb89f', '21', '2019-01-16 19:33:13', '127.0.0.1', '127.0.0.1', '1547638192', '1547638393');
INSERT INTO `sys_session` VALUES ('59cb5277665a2143c2df1e16ac27182b', '21', '2019-01-16 21:28:07', '127.0.0.1', '127.0.0.1', '1547645083', '1547645287');
INSERT INTO `sys_session` VALUES ('5a1a2735ee4147f0a35e21942467f250', '21', '2019-01-18 11:03:48', '127.0.0.1', '127.0.0.1', '1547779918', '1547780628');
INSERT INTO `sys_session` VALUES ('5a99282b27c3d2e06d5f71f9cacda4f4', '21', '2019-01-16 17:18:39', '127.0.0.1', '127.0.0.1', '1547630319', '1547630319');
INSERT INTO `sys_session` VALUES ('5b913baa85e7da68ed05b44076580ab7', '21', '2019-01-19 14:20:32', '127.0.0.1', '127.0.0.1', '1547878683', '1547878832');
INSERT INTO `sys_session` VALUES ('5bc590562fe7451f45a8ea27e6e92a0b', '21', '2019-01-19 14:15:57', '127.0.0.1', '127.0.0.1', '1547878322', '1547878557');
INSERT INTO `sys_session` VALUES ('5bd3e87f1444bfceeddc1510f86f7265', '21', '2019-01-21 11:23:40', '127.0.0.1', '127.0.0.1', '1548040980', '1548041020');
INSERT INTO `sys_session` VALUES ('5fda50a473acdd0f57342bfc3b146a39', '21', '2019-01-21 16:06:15', '127.0.0.1', '127.0.0.1', '1548057602', '1548057975');
INSERT INTO `sys_session` VALUES ('606510119dcd6c499c255c72da7b5c5f', '21', '2019-01-20 22:22:43', '127.0.0.1', '127.0.0.1', '1547994115', '1547994163');
INSERT INTO `sys_session` VALUES ('60b35e5bd898b4b7fe6492683a17101e', '21', '2019-01-16 19:54:51', '127.0.0.1', '127.0.0.1', '1547638997', '1547639691');
INSERT INTO `sys_session` VALUES ('611b25f08a7e166639866f32e99e01f4', '21', '2019-01-16 17:19:24', '127.0.0.1', '127.0.0.1', '1547630319', '1547630364');
INSERT INTO `sys_session` VALUES ('613e9c779068bf708f7cbad84d667bda', '21', '2019-01-21 16:10:23', '127.0.0.1', '127.0.0.1', '1548058054', '1548058223');
INSERT INTO `sys_session` VALUES ('62dbb3ed24b949b60a7879fc64635ab2', '21', '2019-01-16 16:59:28', '127.0.0.1', '127.0.0.1', '1547629057', '1547629168');
INSERT INTO `sys_session` VALUES ('634b5b615b3d523d1bd716b5a602ab1e', '21', '2019-01-16 17:18:39', '127.0.0.1', '127.0.0.1', '1547630308', '1547630319');
INSERT INTO `sys_session` VALUES ('64830d1aec09b6d601449a0a0fe6dddf', '21', '2019-01-21 16:35:39', '127.0.0.1', '127.0.0.1', '1548059407', '1548059739');
INSERT INTO `sys_session` VALUES ('654110d49ccf0e3f68739261a472865d', '21', '2019-01-20 10:10:28', '127.0.0.1', '127.0.0.1', '1547916009', '1547950228');
INSERT INTO `sys_session` VALUES ('65b1eeafcbca122ad5280529a4b90ca4', '21', '2019-01-16 17:19:35', '127.0.0.1', '127.0.0.1', '1547630375', '1547630375');
INSERT INTO `sys_session` VALUES ('6664c69cf1edae1040631db65e50e71c', '21', '2019-01-18 11:16:45', '127.0.0.1', '127.0.0.1', '1547780628', '1547781405');
INSERT INTO `sys_session` VALUES ('66985892b52c2a1452254d792314c78e', '21', '2019-01-16 17:04:51', '127.0.0.1', '127.0.0.1', '1547629331', '1547629491');
INSERT INTO `sys_session` VALUES ('66fbbc74043c48978f3d111f1a3bc7bd', '21', '2019-01-20 20:44:01', '127.0.0.1', '127.0.0.1', '1547988039', '1547988241');
INSERT INTO `sys_session` VALUES ('6717941d926c8bac0d36e66708de5708', '21', '2019-01-21 11:32:16', '127.0.0.1', '127.0.0.1', '1548041283', '1548041536');
INSERT INTO `sys_session` VALUES ('676fe9231101ffcd06bf45b440b7df6d', '21', '2019-01-21 11:28:03', '127.0.0.1', '127.0.0.1', '1548041020', '1548041283');
INSERT INTO `sys_session` VALUES ('67a4c85ad7dece708f56eef2f0b04417', '21', '2019-01-17 13:38:24', '127.0.0.1', '127.0.0.1', '1547703482', '1547703504');
INSERT INTO `sys_session` VALUES ('680707b2a45d2bf63656a2c80f1a45be', '21', '2019-01-21 16:06:53', '127.0.0.1', '127.0.0.1', '1548057975', '1548058013');
INSERT INTO `sys_session` VALUES ('6aab03159fa7247fcac4af59670a94c0', '1', '2019-01-25 16:36:43', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548405316', '1548405403');
INSERT INTO `sys_session` VALUES ('6ad8de2da172bc8d8c75a052c779166f', '21', '2019-01-21 11:44:22', '127.0.0.1', '127.0.0.1', '1548041536', '1548042262');
INSERT INTO `sys_session` VALUES ('6b39f0f5e366a41f6f8e0c80fb591f1a', '21', '2019-01-16 21:13:54', '127.0.0.1', '127.0.0.1', '1547644362', '1547644434');
INSERT INTO `sys_session` VALUES ('6cae5f924ed0a98582f9ab5b07709751', '21', '2019-01-17 13:43:06', '127.0.0.1', '127.0.0.1', '1547703734', '1547703786');
INSERT INTO `sys_session` VALUES ('6fe37da0954cde3bb120e2a77bed84be', '21', '2019-01-17 14:57:25', '127.0.0.1', '127.0.0.1', '1547707935', '1547708245');
INSERT INTO `sys_session` VALUES ('7004a2576db932f3d240dd2259477e30', '21', '2019-01-17 11:23:36', '127.0.0.1', '127.0.0.1', '1547695299', '1547695416');
INSERT INTO `sys_session` VALUES ('74b8c76097ea7b48619390cca04d0aac', '21', '2019-01-17 14:31:29', '127.0.0.1', '127.0.0.1', '1547706520', '1547706689');
INSERT INTO `sys_session` VALUES ('74d117198b1e44763a298e0f2c10e2a6', '21', '2019-01-17 15:08:33', '127.0.0.1', '127.0.0.1', '1547708627', '1547708913');
INSERT INTO `sys_session` VALUES ('782b55e877af2e01ddc91019107f8ae6', '21', '2019-01-17 13:16:24', '127.0.0.1', '127.0.0.1', '1547702160', '1547702184');
INSERT INTO `sys_session` VALUES ('78e97774a78333e96820f3810d0d3018', '21', '2019-01-20 20:48:31', '127.0.0.1', '127.0.0.1', '1547988423', '1547988511');
INSERT INTO `sys_session` VALUES ('7a752b95907d0ac55511bcb4f42b9ffa', '21', '2019-01-16 16:57:37', '127.0.0.1', '127.0.0.1', '1547629057', '1547629057');
INSERT INTO `sys_session` VALUES ('7b6ee44acee02e6fb876800cf5159522', '21', '2019-01-21 09:41:15', '127.0.0.1', '127.0.0.1', '1548034741', '1548034875');
INSERT INTO `sys_session` VALUES ('7d47d1d08c469b15040376de9f0da9db', '21', '2019-01-18 10:51:58', '127.0.0.1', '127.0.0.1', '1547714639', '1547779918');
INSERT INTO `sys_session` VALUES ('7d727391d85d7710db64f11fd5e58fd9', '21', '2019-01-22 14:34:26', '127.0.0.1', '127.0.0.1', '1548138789', '1548138866');
INSERT INTO `sys_session` VALUES ('7da60db9c864aa4fee2ec5870703f71f', '1', '2019-01-25 15:28:16', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548400226', '1548401296');
INSERT INTO `sys_session` VALUES ('7e461ef45e9b61d775649086b486b9be', '21', '2019-01-21 15:51:10', '127.0.0.1', '127.0.0.1', '1548056916', '1548057070');
INSERT INTO `sys_session` VALUES ('80723edc07f446693a56d63f21b6b6f8', '21', '2019-01-24 11:38:51', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548300639', '1548301131');
INSERT INTO `sys_session` VALUES ('81c24233c403c107bef7efb4dd202568', '21', '2019-01-21 11:50:13', '127.0.0.1', '127.0.0.1', '1548042506', '1548042612');
INSERT INTO `sys_session` VALUES ('8252813e2ffd4247926c7fccc573b37a', '21', '2019-01-17 15:58:01', '127.0.0.1', '127.0.0.1', '1547711184', '1547711881');
INSERT INTO `sys_session` VALUES ('827c1f0ac8747b699ff4f9df7017deb1', '21', '2019-01-16 15:56:59', '127.0.0.1', '127.0.0.1', '1547625391', '1547625419');
INSERT INTO `sys_session` VALUES ('839bce0d9c523acbd3b1214646e2a210', '1', '2019-01-25 16:06:18', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548403463', '1548403578');
INSERT INTO `sys_session` VALUES ('83b9810fae0cccd8dc9fcb6895d98f5b', '21', '2019-01-16 16:00:23', '127.0.0.1', '127.0.0.1', '1547625591', '1547625623');
INSERT INTO `sys_session` VALUES ('850c55df8ce3fcbae04f1ddf3ecfbb15', '21', '2019-01-20 21:59:08', '127.0.0.1', '127.0.0.1', '1547992469', '1547992748');
INSERT INTO `sys_session` VALUES ('858190b751a90e4b2ea4f6bc6d6bf799', '1', '2019-01-25 15:06:49', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548399990', '1548400009');
INSERT INTO `sys_session` VALUES ('85eb08422eae7044e34036f37f1928f7', '1', '2019-01-25 16:36:43', '0:0:0:0:0:0:0:1', null, '1548405403', '0');
INSERT INTO `sys_session` VALUES ('864110af021274c3a8eaf8a8036227c4', '21', '2019-01-17 13:14:00', '127.0.0.1', '127.0.0.1', '1547701992', '1547702040');
INSERT INTO `sys_session` VALUES ('86afacd7142d409d7c528fca2cf0eace', '21', '2019-01-16 21:12:42', '127.0.0.1', '127.0.0.1', '1547644322', '1547644362');
INSERT INTO `sys_session` VALUES ('8771f32c1f828ea19250b124cc91c72f', '21', '2019-01-17 15:45:24', '127.0.0.1', '127.0.0.1', '1547710033', '1547711124');
INSERT INTO `sys_session` VALUES ('88f300a5831a08fafc65615f3109e9e5', '21', '2019-01-16 15:47:17', '127.0.0.1', '127.0.0.1', '1547624808', '1547624837');
INSERT INTO `sys_session` VALUES ('8a0f84c6ba7b80c5b946900399e6a968', '21', '2019-01-17 13:44:40', '127.0.0.1', '127.0.0.1', '1547703786', '1547703880');
INSERT INTO `sys_session` VALUES ('8b484384d1757bfefa0fbe20ccc18f66', '21', '2019-01-20 21:46:34', '127.0.0.1', '127.0.0.1', '1547991884', '1547991994');
INSERT INTO `sys_session` VALUES ('8b795c827e3e0c1baeab90ef24939952', '21', '2019-01-21 10:00:22', '127.0.0.1', '127.0.0.1', '1548035440', '1548036022');
INSERT INTO `sys_session` VALUES ('8bf63347c9b13b089200763f14109316', '21', '2019-01-22 11:01:52', '127.0.0.1', '127.0.0.1', '1548125735', '1548126112');
INSERT INTO `sys_session` VALUES ('8d09f904bdb4343456bb8c25bf363e73', '21', '2019-01-19 14:49:41', '127.0.0.1', '127.0.0.1', '1547878968', '1547880581');
INSERT INTO `sys_session` VALUES ('8e1044aed83a553e6341ae2472d4b8d7', '21', '2019-01-16 17:53:56', '127.0.0.1', '127.0.0.1', '1547631735', '1547632436');
INSERT INTO `sys_session` VALUES ('9007dee5b95842626f1d08c4f08c59a6', '21', '2019-01-20 21:38:49', '127.0.0.1', '127.0.0.1', '1547991471', '1547991529');
INSERT INTO `sys_session` VALUES ('90257d3e9e879d3f09e1386af7fb3c6a', '21', '2019-01-21 13:35:31', '127.0.0.1', '127.0.0.1', '1548048639', '1548048931');
INSERT INTO `sys_session` VALUES ('9025ecc7cb3336aaf397a54464e163de', '21', '2019-01-21 09:47:43', '127.0.0.1', '127.0.0.1', '1548034875', '1548035263');
INSERT INTO `sys_session` VALUES ('904037ef5760e7b99644db3876558d90', '21', '2019-01-22 11:13:51', '127.0.0.1', '127.0.0.1', '1548126226', '1548126831');
INSERT INTO `sys_session` VALUES ('916c354f0acacdfb27f7c2ee47f8081c', '21', '2019-01-20 17:02:33', '127.0.0.1', '127.0.0.1', '1547974923', '1547974953');
INSERT INTO `sys_session` VALUES ('91ac4bb5bc044ca04a6ec0617ec32731', '21', '2019-01-19 13:54:38', '127.0.0.1', '127.0.0.1', '1547876656', '1547877278');
INSERT INTO `sys_session` VALUES ('9246745dde944d3aa4d92d376f65d524', '21', '2019-01-17 16:43:59', '127.0.0.1', '127.0.0.1', '1547711881', '1547714639');
INSERT INTO `sys_session` VALUES ('9247b599b9663b9540d74c8e665bc38c', '21', '2019-01-16 17:02:11', '127.0.0.1', '127.0.0.1', '1547629173', '1547629331');
INSERT INTO `sys_session` VALUES ('932c408bdf8946050f84091625f7a4f9', '21', '2019-01-16 17:35:53', '127.0.0.1', '127.0.0.1', '1547630908', '1547631353');
INSERT INTO `sys_session` VALUES ('938cedbfe9020de639fbee7a75352da5', '21', '2019-01-20 21:37:51', '127.0.0.1', '127.0.0.1', '1547990426', '1547991471');
INSERT INTO `sys_session` VALUES ('93916cc40cf058620fb21241aa66161e', '21', '2019-01-17 14:28:40', '127.0.0.1', '127.0.0.1', '1547706425', '1547706520');
INSERT INTO `sys_session` VALUES ('93a6ca95a08b1e226685cc59ce2f4d76', '21', '2019-01-21 15:46:21', '127.0.0.1', '127.0.0.1', '1548056617', '1548056781');
INSERT INTO `sys_session` VALUES ('954e15fd43f068a3f222c5bc36d23725', '21', '2019-01-22 10:55:35', '127.0.0.1', '127.0.0.1', '1548125594', '1548125735');
INSERT INTO `sys_session` VALUES ('95690422e6f4134f35c3d342b888924c', '21', '2019-01-21 13:17:10', '127.0.0.1', '127.0.0.1', '1548047507', '1548047830');
INSERT INTO `sys_session` VALUES ('95721cd27a98a6e75a54214181a88c47', '21', '2019-01-22 14:36:51', '127.0.0.1', '127.0.0.1', '1548138866', '1548139011');
INSERT INTO `sys_session` VALUES ('95bbfed6eb894548855fbbe159303a31', '21', '2019-01-17 09:51:47', '127.0.0.1', '127.0.0.1', '1547645660', '1547689907');
INSERT INTO `sys_session` VALUES ('9779ec4579ed7592dbe37c339bdb27e1', '21', '2019-01-21 12:40:21', '127.0.0.1', '127.0.0.1', '1548045508', '1548045621');
INSERT INTO `sys_session` VALUES ('995e2d053df5887e42e45cecd99d0756', '21', '2019-01-22 14:57:15', '127.0.0.1', '127.0.0.1', '1548140143', '1548140235');
INSERT INTO `sys_session` VALUES ('9a0d6d1944ea883a55a17a7c16348335', '21', '2019-01-24 11:38:51', '0:0:0:0:0:0:0:1', null, '1548301131', '0');
INSERT INTO `sys_session` VALUES ('9ad6e54eea60ef323468dd301f2ddccb', '21', '2019-01-17 13:37:19', '127.0.0.1', '127.0.0.1', '1547703356', '1547703439');
INSERT INTO `sys_session` VALUES ('9b17a074afac02feaa548e20be9acaa9', '21', '2019-01-17 14:18:27', '127.0.0.1', '127.0.0.1', '1547705859', '1547705907');
INSERT INTO `sys_session` VALUES ('9ba20d252f528eddb0c2c85835877997', '21', '2019-01-21 17:05:50', '127.0.0.1', '127.0.0.1', '1548061470', '1548061550');
INSERT INTO `sys_session` VALUES ('9c2668dcd034c07495c15d449649cbb2', '21', '2019-01-21 17:04:30', '127.0.0.1', '127.0.0.1', '1548061271', '1548061470');
INSERT INTO `sys_session` VALUES ('9d2d8125c4b8b04d17f4643c2475986e', '21', '2019-01-17 15:27:13', '127.0.0.1', '127.0.0.1', '1547709958', '1547710033');
INSERT INTO `sys_session` VALUES ('9df30240279a947dd246d1b66b653092', '21', '2019-01-21 11:51:30', '127.0.0.1', '127.0.0.1', '1548042613', '1548042690');
INSERT INTO `sys_session` VALUES ('9ff6686b00968c9ad0f9cdf70309e3bc', '21', '2019-01-17 14:10:49', '127.0.0.1', '127.0.0.1', '1547705416', '1547705449');
INSERT INTO `sys_session` VALUES ('a04e06c9b98a3cde54eccf392ed53c9d', '21', '2019-01-19 17:52:42', '127.0.0.1', '127.0.0.1', '1547891468', '1547891562');
INSERT INTO `sys_session` VALUES ('a0f5f4c27c35039a3b8e7bedfd0f80a2', '21', '2019-01-17 14:27:05', '127.0.0.1', '127.0.0.1', '1547706299', '1547706425');
INSERT INTO `sys_session` VALUES ('a20795bb6c779a7f1eba1556b2bca12c', '1', '2019-01-25 16:35:16', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548405108', '1548405316');
INSERT INTO `sys_session` VALUES ('a5736e79c11885810c0ce7ad95d7269f', '21', '2019-01-19 14:21:11', '127.0.0.1', '127.0.0.1', '1547878832', '1547878871');
INSERT INTO `sys_session` VALUES ('a5d69596ce73d7a7116fa71bf55049c9', '21', '2019-01-16 17:54:20', '127.0.0.1', '127.0.0.1', '1547632436', '1547632460');
INSERT INTO `sys_session` VALUES ('a6e24760fe1fe2d4748bea31da700611', '21', '2019-01-17 09:59:26', '127.0.0.1', '127.0.0.1', '1547690262', '1547690366');
INSERT INTO `sys_session` VALUES ('a8934170b50500a68e4d2a696d8c4197', '21', '2019-01-16 15:49:26', '127.0.0.1', '127.0.0.1', '1547624837', '1547624966');
INSERT INTO `sys_session` VALUES ('aa29f3da4ecb04645bd48e0241b82ea4', '21', '2019-01-19 21:35:11', '127.0.0.1', '127.0.0.1', '1547904841', '1547904911');
INSERT INTO `sys_session` VALUES ('ab0525d6be0de8a35e06575a0828ee32', '21', '2019-01-22 17:44:53', '127.0.0.1', '127.0.0.1', '1548140235', '1548150293');
INSERT INTO `sys_session` VALUES ('ab1a0019fbd58e668e142db3301be40f', '21', '2019-01-17 10:14:24', '127.0.0.1', '127.0.0.1', '1547691109', '1547691264');
INSERT INTO `sys_session` VALUES ('ac7dde371a29027c05690d5c6ab542c2', '21', '2019-01-17 10:00:46', '127.0.0.1', '127.0.0.1', '1547690366', '1547690446');
INSERT INTO `sys_session` VALUES ('acf390d14f057a7df9399a4e8811996c', '21', '2019-01-16 19:59:07', '127.0.0.1', '127.0.0.1', '1547639773', '1547639947');
INSERT INTO `sys_session` VALUES ('ad60416273aa8b507e3f9a7e4e431248', '21', '2019-01-22 14:33:09', '127.0.0.1', '127.0.0.1', '1548126831', '1548138789');
INSERT INTO `sys_session` VALUES ('aef902dd8da09ad7a8583ab59c1f6188', '21', '2019-01-17 15:24:26', '127.0.0.1', '127.0.0.1', '1547709491', '1547709866');
INSERT INTO `sys_session` VALUES ('af128ebf392f3ae136dc68375aace6ca', '21', '2019-01-21 15:43:37', '127.0.0.1', '127.0.0.1', '1548049022', '1548056617');
INSERT INTO `sys_session` VALUES ('b03d3de75619ca22c1d493940cbd89c7', '21', '2019-01-20 22:17:38', '127.0.0.1', '127.0.0.1', '1547993353', '1547993858');
INSERT INTO `sys_session` VALUES ('b0caf37684724b04eda8f45a00d4112e', '21', '2019-01-16 15:46:48', '127.0.0.1', '127.0.0.1', '1547624546', '1547624808');
INSERT INTO `sys_session` VALUES ('b0ebb02e3972566075d1e2c6460517d9', '21', '2019-01-16 19:42:28', '127.0.0.1', '127.0.0.1', '1547638643', '1547638948');
INSERT INTO `sys_session` VALUES ('b11f768713e3387db0dd02a0d15c1652', '21', '2019-01-16 16:57:33', '127.0.0.1', '127.0.0.1', '1547629049', '1547629053');
INSERT INTO `sys_session` VALUES ('b20f3b4e806f0f2449aef61c41156205', '21', '2019-01-17 13:38:02', '127.0.0.1', '127.0.0.1', '1547703439', '1547703482');
INSERT INTO `sys_session` VALUES ('b214269a4ebeb57e873214d0ae1a5ffc', '21', '2019-01-16 19:56:13', '127.0.0.1', '127.0.0.1', '1547639691', '1547639773');
INSERT INTO `sys_session` VALUES ('b22eba8163f9ba26f661dd74136e4c44', '21', '2019-01-20 21:54:29', '127.0.0.1', '127.0.0.1', '1547992359', '1547992469');
INSERT INTO `sys_session` VALUES ('b2da3082490c7f2885663d7ac28168d6', '21', '2019-01-17 13:35:56', '127.0.0.1', '127.0.0.1', '1547703096', '1547703356');
INSERT INTO `sys_session` VALUES ('b4078fec373f0964d16910ddf0ca64b8', '21', '2019-01-17 13:24:01', '127.0.0.1', '127.0.0.1', '1547702622', '1547702641');
INSERT INTO `sys_session` VALUES ('b4b8da010b463ca968b32950ff78498e', '21', '2019-01-21 11:48:25', '127.0.0.1', '127.0.0.1', '1548042475', '1548042505');
INSERT INTO `sys_session` VALUES ('b54ecb287d0d542357d7ea008fb56525', '21', '2019-01-17 10:08:26', '127.0.0.1', '127.0.0.1', '1547690796', '1547690906');
INSERT INTO `sys_session` VALUES ('b6ef329dd633b4d953d525fac8286581', '21', '2019-01-17 13:16:59', '127.0.0.1', '127.0.0.1', '1547702184', '1547702219');
INSERT INTO `sys_session` VALUES ('b7d87d58cdb8ed3860305a78a0a28b67', '21', '2019-01-16 21:33:22', '127.0.0.1', '127.0.0.1', '1547645287', '1547645602');
INSERT INTO `sys_session` VALUES ('b8ecb0d86f2fafab0c7f06821c780e50', '21', '2019-01-16 21:12:02', '127.0.0.1', '127.0.0.1', '1547640303', '1547644322');
INSERT INTO `sys_session` VALUES ('b952d7f7246bbc56f590a66581eabb84', '21', '2019-01-20 21:20:26', '127.0.0.1', '127.0.0.1', '1547988797', '1547990426');
INSERT INTO `sys_session` VALUES ('bb28791525e850bfc91743b6a86ffba8', '21', '2019-01-20 22:03:03', '127.0.0.1', '127.0.0.1', '1547992893', '1547992983');
INSERT INTO `sys_session` VALUES ('bb870036bbc2cfc6c62798dc7540910f', '21', '2019-01-17 15:24:31', '127.0.0.1', '127.0.0.1', '1547709866', '1547709871');
INSERT INTO `sys_session` VALUES ('bc0446fb99149cc6201cfe65e189a621', '21', '2019-01-19 17:53:58', '127.0.0.1', '127.0.0.1', '1547891616', '1547891638');
INSERT INTO `sys_session` VALUES ('bc9650d5a6b0987c49ac6ab6a41323db', '21', '2019-01-22 10:53:14', '127.0.0.1', '127.0.0.1', '1548125377', '1548125594');
INSERT INTO `sys_session` VALUES ('bceb57d6e70d803755441b5f350d09b5', '21', '2019-01-16 15:59:51', '127.0.0.1', '127.0.0.1', '1547625419', '1547625591');
INSERT INTO `sys_session` VALUES ('bd51c6f57d9cbdbb28277607693f0c90', '21', '2019-01-17 14:10:16', '127.0.0.1', '127.0.0.1', '1547704668', '1547705416');
INSERT INTO `sys_session` VALUES ('bdcb6803c850432c5bfecf28f2ca668e', '21', '2019-01-17 15:46:24', '127.0.0.1', '127.0.0.1', '1547711124', '1547711184');
INSERT INTO `sys_session` VALUES ('be4a34e548758e679442bc9e8921d4dc', '21', '2019-01-17 14:42:12', '127.0.0.1', '127.0.0.1', '1547707315', '1547707332');
INSERT INTO `sys_session` VALUES ('c140f24f4e32ad58c3dbf10d6f312b52', '21', '2019-01-22 09:49:41', '127.0.0.1', '127.0.0.1', '1548121652', '1548121781');
INSERT INTO `sys_session` VALUES ('c1787b01b097f76acac5fd472700c35d', '21', '2019-01-17 14:41:55', '127.0.0.1', '127.0.0.1', '1547707084', '1547707315');
INSERT INTO `sys_session` VALUES ('c1bd2add7e96d958f78d1e66e600e62f', '21', '2019-01-21 13:36:30', '127.0.0.1', '127.0.0.1', '1548048931', '1548048990');
INSERT INTO `sys_session` VALUES ('c1c94bbd27d8e8f8187eb367558abed1', '21', '2019-01-17 15:03:47', '127.0.0.1', '127.0.0.1', '1547708325', '1547708627');
INSERT INTO `sys_session` VALUES ('c29c5d53dcd255f58a9903ad8fe6549b', '21', '2019-01-16 16:57:29', '127.0.0.1', '127.0.0.1', '1547628929', '1547629049');
INSERT INTO `sys_session` VALUES ('c2e5a818259c5ed3bc8eace440d5bd67', '21', '2019-01-19 17:53:36', '127.0.0.1', '127.0.0.1', '1547891566', '1547891616');
INSERT INTO `sys_session` VALUES ('c3823662975466471ed14e5493043b25', '21', '2019-01-16 17:26:08', '127.0.0.1', '127.0.0.1', '1547630749', '1547630768');
INSERT INTO `sys_session` VALUES ('c429beff697a56de59c8cf1f181fa815', '21', '2019-01-19 13:42:24', '127.0.0.1', '127.0.0.1', '1547876495', '1547876544');
INSERT INTO `sys_session` VALUES ('c4d75c57a9025023aab80b40f1515313', '21', '2019-01-16 16:57:37', '127.0.0.1', '127.0.0.1', '1547629053', '1547629057');
INSERT INTO `sys_session` VALUES ('c5b70635f71579169b752b9b242f1721', '21', '2019-01-16 16:59:30', '127.0.0.1', '127.0.0.1', '1547629168', '1547629170');
INSERT INTO `sys_session` VALUES ('c6489034cd9ff4918d160000daf02582', '21', '2019-01-16 15:49:26', '127.0.0.1', '127.0.0.1', '1547624837', '1547624966');
INSERT INTO `sys_session` VALUES ('c6792ec2fd3bb09fbc0b7abf39926992', '21', '2019-01-17 14:38:04', '127.0.0.1', '127.0.0.1', '1547706769', '1547707084');
INSERT INTO `sys_session` VALUES ('c6d1ddba9c3e16a59ef8a455ba45c725', '21', '2019-01-21 16:59:16', '127.0.0.1', '127.0.0.1', '1548060673', '1548061156');
INSERT INTO `sys_session` VALUES ('c7710514f8115fd71cb6d5bd41eeaaa0', '21', '2019-01-20 20:47:03', '127.0.0.1', '127.0.0.1', '1547988321', '1547988423');
INSERT INTO `sys_session` VALUES ('c8fd8da27c3a1c2bc33f6aa884ab4e28', '21', '2019-01-22 09:51:32', '127.0.0.1', '127.0.0.1', '1548121781', '1548121892');
INSERT INTO `sys_session` VALUES ('ca1ee15cba4b3c44bf0fcabc913a916d', '21', '2019-01-19 17:54:27', '127.0.0.1', '127.0.0.1', '1547891638', '1547891667');
INSERT INTO `sys_session` VALUES ('ca3882818f2090b145b46f07e55985fb', '21', '2019-01-21 15:48:36', '127.0.0.1', '127.0.0.1', '1548056781', '1548056916');
INSERT INTO `sys_session` VALUES ('cb9b607afcd8a0a7adc8756adbc38e2d', '21', '2019-01-20 22:09:13', '127.0.0.1', '127.0.0.1', '1547993307', '1547993352');
INSERT INTO `sys_session` VALUES ('cc534d5b0b149c888d250e63b272ee69', '21', '2019-01-21 16:30:07', '127.0.0.1', '127.0.0.1', '1548058972', '1548059407');
INSERT INTO `sys_session` VALUES ('ce4630a51d7a1ac9097135ab60c8b57b', '21', '2019-01-22 09:47:32', '127.0.0.1', '127.0.0.1', '1548121589', '1548121652');
INSERT INTO `sys_session` VALUES ('ceaad73dec47fcd2718380b7c9be0a03', '21', '2019-01-17 14:51:42', '127.0.0.1', '127.0.0.1', '1547707859', '1547707902');
INSERT INTO `sys_session` VALUES ('d0bff4970cb4aa3477c9b2be05dcc538', '21', '2019-01-16 17:04:55', '127.0.0.1', '127.0.0.1', '1547629491', '1547629495');
INSERT INTO `sys_session` VALUES ('d0c7c47ef847b2adc84348d7aa4f20f9', '21', '2019-01-17 10:58:26', '127.0.0.1', '127.0.0.1', '1547691264', '1547693906');
INSERT INTO `sys_session` VALUES ('d12e9c32f9f22f92f56e62b82219d39e', '21', '2019-01-17 15:18:11', '127.0.0.1', '127.0.0.1', '1547709357', '1547709491');
INSERT INTO `sys_session` VALUES ('d1ae1546c4b63f250049c023409f446c', '21', '2019-01-17 13:48:03', '127.0.0.1', '127.0.0.1', '1547703972', '1547704083');
INSERT INTO `sys_session` VALUES ('d24eac26036fe55b1302ca7369cf3d33', '21', '2019-01-17 13:42:14', '127.0.0.1', '127.0.0.1', '1547703601', '1547703734');
INSERT INTO `sys_session` VALUES ('d58143ac1bcde8808dc83d00aa40ff69', '21', '2019-01-16 19:29:52', '127.0.0.1', '127.0.0.1', '1547638168', '1547638192');
INSERT INTO `sys_session` VALUES ('d5f11c669730f5680929170de517512b', '21', '2019-01-19 12:34:33', '127.0.0.1', '127.0.0.1', '1547781825', '1547872473');
INSERT INTO `sys_session` VALUES ('d648f921cb9836ee12ec244ba81c7484', '21', '2019-01-16 19:29:28', '127.0.0.1', '127.0.0.1', '1547632852', '1547638168');
INSERT INTO `sys_session` VALUES ('d7d941dc980301917dfbbf8cc1188895', '21', '2019-01-21 16:00:02', '127.0.0.1', '127.0.0.1', '1548057557', '1548057602');
INSERT INTO `sys_session` VALUES ('d7e304375bec4f0f5ce2d8e3d6b13753', '21', '2019-01-21 13:11:47', '127.0.0.1', '127.0.0.1', '1548047479', '1548047507');
INSERT INTO `sys_session` VALUES ('da4cdb2416d0430d80cb0236e3cbbd2c', '21', '2019-01-17 11:26:34', '127.0.0.1', '127.0.0.1', '1547695516', '1547695594');
INSERT INTO `sys_session` VALUES ('da6320712edb0e6546e01b12a4f6756a', '1', '2019-01-25 15:43:51', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548402065', '1548402231');
INSERT INTO `sys_session` VALUES ('daea3f4cf79a56500175c4dc21e482fc', '21', '2019-01-21 11:08:19', '127.0.0.1', '127.0.0.1', '1548036022', '1548040099');
INSERT INTO `sys_session` VALUES ('dbd5f810e11712fbfe68eed38b8e4ae1', '21', '2019-01-20 21:52:39', '127.0.0.1', '127.0.0.1', '1547992145', '1547992359');
INSERT INTO `sys_session` VALUES ('dd125e31dee2c37d558e8e9ca500c7eb', '21', '2019-01-19 13:42:59', '127.0.0.1', '127.0.0.1', '1547876544', '1547876579');
INSERT INTO `sys_session` VALUES ('de3270ab7a2d48365d82b876b1c1b0d3', '21', '2019-01-16 16:55:14', '127.0.0.1', '127.0.0.1', '1547628278', '1547628914');
INSERT INTO `sys_session` VALUES ('de65adbc41ec4e6464f19dfe1dc11182', '21', '2019-01-22 14:55:02', '127.0.0.1', '127.0.0.1', '1548139011', '1548140102');
INSERT INTO `sys_session` VALUES ('def357b5096e8ad901e67080fbc84438', '21', '2019-01-17 15:09:39', '127.0.0.1', '127.0.0.1', '1547708913', '1547708979');
INSERT INTO `sys_session` VALUES ('e07ba43b4c4ab7c838b7a2df68559521', '21', '2019-01-16 17:04:51', '127.0.0.1', '127.0.0.1', '1547629331', '1547629491');
INSERT INTO `sys_session` VALUES ('e0ef814038762fe8d8b05f012a2052a1', '21', '2019-01-17 09:53:18', '127.0.0.1', '127.0.0.1', '1547689907', '1547689998');
INSERT INTO `sys_session` VALUES ('e19d97ad160e8f478f7a334e33431c8d', '21', '2019-01-20 20:53:17', '127.0.0.1', '127.0.0.1', '1547988554', '1547988797');
INSERT INTO `sys_session` VALUES ('e2c32c3f25ac9bc802ff7515704d9661', '21', '2019-01-17 15:25:58', '127.0.0.1', '127.0.0.1', '1547709871', '1547709958');
INSERT INTO `sys_session` VALUES ('e32a5eb995b5ec7e45ec8783f097df70', '21', '2019-01-21 16:38:58', '127.0.0.1', '127.0.0.1', '1548059739', '1548059938');
INSERT INTO `sys_session` VALUES ('e34a6610f48c270a264ace2593ed024d', '21', '2019-01-16 16:00:23', '127.0.0.1', '127.0.0.1', '1547625591', '1547625623');
INSERT INTO `sys_session` VALUES ('e35f742b233e34441a2a3087495abdbc', '21', '2019-01-16 16:59:33', '127.0.0.1', '127.0.0.1', '1547629170', '1547629173');
INSERT INTO `sys_session` VALUES ('e36bf7066225dc46d5bb4d9a93ac8ba1', '21', '2019-01-21 15:58:57', '127.0.0.1', '127.0.0.1', '1548057501', '1548057537');
INSERT INTO `sys_session` VALUES ('e471993502da708149f830004d485487', '21', '2019-01-21 16:07:34', '127.0.0.1', '127.0.0.1', '1548058013', '1548058054');
INSERT INTO `sys_session` VALUES ('e5428da4d69bb16da795e66e0975ff99', '21', '2019-01-18 11:23:45', '127.0.0.1', '127.0.0.1', '1547781697', '1547781825');
INSERT INTO `sys_session` VALUES ('e65b05f76cecbc9af378792e86d60921', '1', '2019-01-25 15:55:07', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548402232', '1548402907');
INSERT INTO `sys_session` VALUES ('e743a2eb6a812dfba8db73d8ba055b0f', '1', '2019-01-25 16:04:23', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548403242', '1548403463');
INSERT INTO `sys_session` VALUES ('e7b0035d01b74fba9b7e6116588ebb2a', '21', '2019-01-17 14:58:44', '127.0.0.1', '127.0.0.1', '1547708245', '1547708324');
INSERT INTO `sys_session` VALUES ('e86a13bea519032d144b5c3314921e94', '21', '2019-01-17 13:48:56', '127.0.0.1', '127.0.0.1', '1547704083', '1547704136');
INSERT INTO `sys_session` VALUES ('ea698596003498115487c8ab8d515c04', '21', '2019-01-17 15:15:57', '127.0.0.1', '127.0.0.1', '1547709090', '1547709357');
INSERT INTO `sys_session` VALUES ('eb5f7685e2759646ae92f333a85cf1f8', '21', '2019-01-19 14:51:24', '127.0.0.1', '127.0.0.1', '1547880581', '1547880684');
INSERT INTO `sys_session` VALUES ('eb716def7b34c0b738a9328d434d552a', '21', '2019-01-16 18:00:24', '127.0.0.1', '127.0.0.1', '1547632737', '1547632824');
INSERT INTO `sys_session` VALUES ('ebb11e168fed78f7254d2feaeed956c5', '21', '2019-01-22 09:53:09', '127.0.0.1', '127.0.0.1', '1548121892', '1548121989');
INSERT INTO `sys_session` VALUES ('eca147fd20e3bced0d4c46d77d46f2ca', '21', '2019-01-16 19:43:17', '127.0.0.1', '127.0.0.1', '1547638948', '1547638997');
INSERT INTO `sys_session` VALUES ('ed55f8171a365ada9273916ee4a5df46', '21', '2019-01-16 17:23:01', '127.0.0.1', '127.0.0.1', '1547630562', '1547630581');
INSERT INTO `sys_session` VALUES ('ed71e63d960a8162df7831d16c3ed251', '21', '2019-01-16 16:55:29', '127.0.0.1', '127.0.0.1', '1547628925', '1547628929');
INSERT INTO `sys_session` VALUES ('edcf20dbd806f36e787efe9e43b514fe', '21', '2019-01-20 17:00:22', '127.0.0.1', '127.0.0.1', '1547950228', '1547974822');
INSERT INTO `sys_session` VALUES ('ee0f4c18fbc2732462f875800960443f', '21', '2019-01-17 09:57:42', '127.0.0.1', '127.0.0.1', '1547690193', '1547690262');
INSERT INTO `sys_session` VALUES ('ef56e0638feb233d9ab838b45e760e02', '21', '2019-01-22 10:49:37', '127.0.0.1', '127.0.0.1', '1548123117', '1548125377');
INSERT INTO `sys_session` VALUES ('f0a206891a97f723e6b27035f542ac08', '21', '2019-01-16 16:00:23', '127.0.0.1', '127.0.0.1', '1547625623', '1547625623');
INSERT INTO `sys_session` VALUES ('f0abd20cc0c3d0ebef1063561de1a5b6', '21', '2019-01-17 13:57:11', '127.0.0.1', '127.0.0.1', '1547704290', '1547704631');
INSERT INTO `sys_session` VALUES ('f1eb7f3d249140c52c30d2b608e6b879', '21', '2019-01-19 14:52:32', '127.0.0.1', '127.0.0.1', '1547880684', '1547880752');
INSERT INTO `sys_session` VALUES ('f3b5b5a24281a4742db176b61fb0e214', '21', '2019-01-16 17:10:59', '127.0.0.1', '127.0.0.1', '1547629495', '1547629859');
INSERT INTO `sys_session` VALUES ('f3cdb8b6608bb95d1cd5f5c87a0d3cd5', '1', '2019-01-25 15:10:26', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '1548400009', '1548400226');
INSERT INTO `sys_session` VALUES ('f4f593625b10ecddf795073f7b22c307', '21', '2019-01-19 14:12:02', '127.0.0.1', '127.0.0.1', '1547878208', '1547878322');
INSERT INTO `sys_session` VALUES ('f501919596e949dbb01b7d956d6cdd30', '21', '2019-01-17 14:42:59', '127.0.0.1', '127.0.0.1', '1547707332', '1547707379');
INSERT INTO `sys_session` VALUES ('f58aa225683ebd611a58b7476cd2dd69', '21', '2019-01-21 12:38:28', '127.0.0.1', '127.0.0.1', '1548042762', '1548045508');
INSERT INTO `sys_session` VALUES ('f7f810d88e8d184c6d37182a826e9254', '21', '2019-01-17 13:13:12', '127.0.0.1', '127.0.0.1', '1547695594', '1547701992');
INSERT INTO `sys_session` VALUES ('f97d28305b1d91dd0bc67728f796e1f6', '21', '2019-01-20 22:00:12', '127.0.0.1', '127.0.0.1', '1547992748', '1547992812');
INSERT INTO `sys_session` VALUES ('fa65dec610a469ffdebf4c826c54c570', '21', '2019-01-17 10:05:02', '127.0.0.1', '127.0.0.1', '1547690537', '1547690702');
INSERT INTO `sys_session` VALUES ('fa8dd6b4ce8548ca561c94b33ff6a67e', '21', '2019-01-17 13:45:38', '127.0.0.1', '127.0.0.1', '1547703880', '1547703938');
INSERT INTO `sys_session` VALUES ('faf385a87f4643953011401b95797f7d', '21', '2019-01-17 13:16:00', '127.0.0.1', '127.0.0.1', '1547702076', '1547702160');
INSERT INTO `sys_session` VALUES ('fafefb26852659b1129421b15f70d90c', '21', '2019-01-16 20:05:03', '127.0.0.1', '127.0.0.1', '1547640167', '1547640303');
INSERT INTO `sys_session` VALUES ('fbc1c185f1d1ba418d1f47aee043f2ec', '21', '2019-01-17 11:25:16', '127.0.0.1', '127.0.0.1', '1547695416', '1547695516');
INSERT INTO `sys_session` VALUES ('fbe2d9e98ed2003de7a0bb3e779b0d20', '21', '2019-01-17 10:11:49', '127.0.0.1', '127.0.0.1', '1547691032', '1547691109');
INSERT INTO `sys_session` VALUES ('fc133de8215eaf0b5337337124a7b34c', '21', '2019-01-16 18:00:52', '127.0.0.1', '127.0.0.1', '1547632842', '1547632852');
INSERT INTO `sys_session` VALUES ('fc4bffb0e8acc476c2f674f5132a060c', '21', '2019-01-21 15:58:21', '127.0.0.1', '127.0.0.1', '1548057070', '1548057501');
INSERT INTO `sys_session` VALUES ('fcb0d504adbee3f71b72b6c11b76959f', '21', '2019-01-21 13:30:39', '127.0.0.1', '127.0.0.1', '1548048538', '1548048639');
INSERT INTO `sys_session` VALUES ('fcb378740c886ce3cdc5a38757e2f051', '21', '2019-01-16 17:25:49', '127.0.0.1', '127.0.0.1', '1547630581', '1547630749');
INSERT INTO `sys_session` VALUES ('ff4052005adb28ea4d6f79e5f9c05ec9', '21', '2019-01-22 10:11:57', '127.0.0.1', '127.0.0.1', '1548123050', '1548123117');

-- ----------------------------
-- Table structure for tt_wxconfig
-- ----------------------------
DROP TABLE IF EXISTS `tt_wxconfig`;
CREATE TABLE `tt_wxconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(32) DEFAULT NULL,
  `appsecret` varchar(64) DEFAULT NULL,
  `token` varchar(512) DEFAULT NULL,
  `dt_add` datetime DEFAULT NULL,
  `dt_edit` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `name` varchar(12) NOT NULL COMMENT '标识',
  `expirestime` int(11) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '公众号类型0为微信公众，1为微信小程序',
  `pay_mch_id` varchar(255) NOT NULL COMMENT '微信支付pay_mch_id',
  `pay_key` varchar(255) NOT NULL COMMENT '微信支付key',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='微信公众号配置表';

-- ----------------------------
-- Records of tt_wxconfig
-- ----------------------------
INSERT INTO `tt_wxconfig` VALUES ('1', 'wx1598bbd23c024f29', 'd92abc8cfaaedc95243ee16d0cced38b', '16_s7KapNU8JMwKMveUV157sNoae4hl68wbRN54UIoKoX4xivNZG_knI-hZhEyGDx1298IJfcFQDL5XlFTanWQuiXAQaElk3GA3vmYWl1v8HzkS0KfWo0_s2bNYGO9gGLhO3vkB7f1e-MtQIXE1PHPgAAAXPX', '2018-11-30 14:59:42', '2018-11-30 14:59:42', '', 'mytest', '1545051882', '0', '', '');
