/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : train_db

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2019-04-09 15:14:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c3p0_test
-- ----------------------------
DROP TABLE IF EXISTS `c3p0_test`;
CREATE TABLE `c3p0_test` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c3p0_test
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  `URL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('2', '账户管理', 'user/index');
INSERT INTO `menu` VALUES ('3', '车票管理', 'train/index');
INSERT INTO `menu` VALUES ('4', '订单管理', 'order/index');
INSERT INTO `menu` VALUES ('5', '公告管理', 'notice/index');
INSERT INTO `menu` VALUES ('6', '留言管理', 'msg/index');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `send_id` bigint(30) DEFAULT NULL COMMENT '发件人',
  `state` int(11) DEFAULT '0' COMMENT '0未读1已读',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('25', '1', '测试留言001', '19', '1', '2019-03-22 17:16:07');
INSERT INTO `message` VALUES ('26', '19', '测试回复001', '1', '1', '2019-03-22 17:17:05');
INSERT INTO `message` VALUES ('27', '1', '测试回复002', '19', '1', '2019-03-22 17:17:51');
INSERT INTO `message` VALUES ('28', '19', '测试回复003', '1', '1', '2019-03-22 17:18:28');
INSERT INTO `message` VALUES ('29', '1', 'over', '19', '0', '2019-03-22 17:18:56');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('2', '测试公告', '按实际的拉撒大声地', '2018-04-06 12:49:31');
INSERT INTO `notice` VALUES ('3', '关于铁路的通知', '按山东矿机安徽省的框架挥洒的客户', '2018-04-06 16:58:42');
INSERT INTO `notice` VALUES ('4', '价格调整', '啊沙发沙发', '2019-03-21 14:58:43');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', null);
INSERT INTO `role` VALUES ('2', '普通用户', null);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(11) DEFAULT NULL,
  `MENU_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '1', '1');
INSERT INTO `role_menu` VALUES ('2', '1', '2');
INSERT INTO `role_menu` VALUES ('4', '1', '3');
INSERT INTO `role_menu` VALUES ('5', '1', '4');
INSERT INTO `role_menu` VALUES ('6', '1', '5');
INSERT INTO `role_menu` VALUES ('7', '1', '6');
INSERT INTO `role_menu` VALUES ('8', '1', '7');

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `start_address` varchar(30) DEFAULT NULL,
  `end_address` varchar(30) DEFAULT NULL,
  `type` int(11) DEFAULT '1' COMMENT '1动车2高铁3普快4特快',
  `sleep_price` decimal(10,1) DEFAULT NULL COMMENT '卧铺价格',
  `seat_price` decimal(10,1) DEFAULT NULL COMMENT '坐票价格',
  `stand_price` decimal(10,1) DEFAULT NULL COMMENT '站票价格',
  `valid` int(11) DEFAULT '1' COMMENT '0删除1未删除',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES ('4', 'K121', '2018-04-05', '2018-04-28', null, null, '上海', '淮南', '3', '160.0', '80.0', '80.0', '1', '2018-04-05 16:30:39');
INSERT INTO `train` VALUES ('5', 'K515', '2018-04-06', '2018-05-12', null, null, '上海', '南京', '3', '120.0', '70.0', '70.0', '1', '2018-04-06 16:58:01');
INSERT INTO `train` VALUES ('6', 'D121', '2018-04-07', '2018-05-04', null, null, '上海', '南京', '1', '200.0', '150.0', '150.0', '1', '2018-04-06 17:39:26');
INSERT INTO `train` VALUES ('7', 'D6573', '2019-03-20', '2020-03-20', null, null, '南昌', '赣州', '1', '300.0', '150.0', '100.0', '1', '2019-03-20 16:39:36');
INSERT INTO `train` VALUES ('8', 'D7431', '2019-03-21', '2020-03-21', null, null, '南昌', '杭州', '1', '400.0', '150.0', '150.0', '1', '2019-03-21 13:24:38');
INSERT INTO `train` VALUES ('9', 'K6688', '2019-03-20', '2020-03-21', null, null, '赣州', '南昌', '4', '268.0', '128.0', '128.0', '1', '2019-03-21 15:44:09');

-- ----------------------------
-- Table structure for train_car
-- ----------------------------
DROP TABLE IF EXISTS `train_car`;
CREATE TABLE `train_car` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `train_id` bigint(20) DEFAULT NULL,
  `car_no` int(11) DEFAULT NULL COMMENT '车厢',
  `type` int(11) DEFAULT NULL COMMENT '1卧铺2坐票',
  `seat_num` int(11) DEFAULT NULL COMMENT '卧铺（坐票）数量',
  `no_mun` int(11) DEFAULT NULL COMMENT '无座数量',
  PRIMARY KEY (`id`),
  KEY `IDX_TRAINID` (`train_id`),
  KEY `IDX_CARNO` (`car_no`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of train_car
-- ----------------------------
INSERT INTO `train_car` VALUES ('1', '3', '1', '2', '108', '100');
INSERT INTO `train_car` VALUES ('2', '3', '2', '2', '109', '100');
INSERT INTO `train_car` VALUES ('3', '4', '1', '2', '108', '100');
INSERT INTO `train_car` VALUES ('4', '4', '2', '2', '109', '100');
INSERT INTO `train_car` VALUES ('5', '5', '1', '1', '108', '0');
INSERT INTO `train_car` VALUES ('6', '5', '2', '2', '108', '100');
INSERT INTO `train_car` VALUES ('7', '6', '1', '2', '108', '40');
INSERT INTO `train_car` VALUES ('8', '6', '2', '2', '108', '50');
INSERT INTO `train_car` VALUES ('9', '7', '1', '1', '60', '0');
INSERT INTO `train_car` VALUES ('10', '7', '2', '2', '108', '40');
INSERT INTO `train_car` VALUES ('11', '8', '1', '1', '60', '0');
INSERT INTO `train_car` VALUES ('12', '8', '2', '1', '60', '0');
INSERT INTO `train_car` VALUES ('13', '8', '3', '2', '108', '30');
INSERT INTO `train_car` VALUES ('14', '8', '4', '2', '108', '30');
INSERT INTO `train_car` VALUES ('15', '9', '1', '2', '108', '30');
INSERT INTO `train_car` VALUES ('16', '9', '2', '2', '108', '30');
INSERT INTO `train_car` VALUES ('17', '9', '3', '1', '60', '0');
INSERT INTO `train_car` VALUES ('18', '9', '4', '1', '60', '0');
INSERT INTO `train_car` VALUES ('19', '9', '5', '2', '108', '30');

-- ----------------------------
-- Table structure for train_order
-- ----------------------------
DROP TABLE IF EXISTS `train_order`;
CREATE TABLE `train_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trian_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT '购买用户',
  `start_address` varchar(30) DEFAULT NULL,
  `start_station_id` bigint(20) DEFAULT NULL,
  `end_address` varchar(30) DEFAULT NULL,
  `end_station_id` bigint(20) DEFAULT NULL,
  `trian_car_id` int(11) DEFAULT NULL,
  `car_no` int(11) DEFAULT NULL COMMENT '车厢号',
  `seat_num` int(11) DEFAULT NULL COMMENT '座位号',
  `train_date` date DEFAULT NULL,
  `train_time` varchar(255) DEFAULT NULL,
  `train_type` int(11) DEFAULT NULL COMMENT '1卧铺2座票3无座',
  `price` decimal(10,1) DEFAULT NULL,
  `state` int(11) DEFAULT '0' COMMENT '0待支付1已支付',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of train_order
-- ----------------------------
INSERT INTO `train_order` VALUES ('1', '4', '1', '上海', null, '苏州', null, null, '1', '1', '2018-04-07', '21:00', '2', '15.0', '3', '2018-04-06 11:58:30');
INSERT INTO `train_order` VALUES ('2', '4', '1', '上海', null, '苏州', null, null, '1', '-1', '2018-04-09', '21:00', '3', '15.0', '2', '2018-04-06 15:58:54');
INSERT INTO `train_order` VALUES ('3', '4', '11', '上海', null, '苏州', null, null, '1', '1', '2018-04-09', '21:00', '2', '15.0', '2', '2018-04-06 17:34:12');
INSERT INTO `train_order` VALUES ('4', '4', '11', '上海', null, '苏州', null, null, '1', '-1', '2018-04-10', '21:00', '2', '15.0', '3', '2018-04-06 17:34:57');
INSERT INTO `train_order` VALUES ('5', '6', '1', '上海', null, '无锡', null, null, '1', '1', '2018-04-09', '10:00', '2', '75.0', '2', '2019-03-28 13:48:31');
INSERT INTO `train_order` VALUES ('6', '7', '1', '南昌', null, '赣州', null, null, '1', '1', '2019-03-20', '8:00', '1', '150.0', '3', '2019-03-28 13:48:33');
INSERT INTO `train_order` VALUES ('7', '9', '1', '兴国', null, '南昌', null, null, '3', '1', '2019-03-21', '12:10', '1', '179.0', '1', '2019-03-28 13:48:36');
INSERT INTO `train_order` VALUES ('8', '8', '19', '南昌', null, '杭州', null, null, '1', '1', '2019-03-22', '10:00', '1', '400.0', '1', '2019-03-28 13:48:40');

-- ----------------------------
-- Table structure for train_station
-- ----------------------------
DROP TABLE IF EXISTS `train_station`;
CREATE TABLE `train_station` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `train_id` bigint(20) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `sleep_price` decimal(10,1) DEFAULT NULL,
  `seat_price` decimal(10,1) DEFAULT NULL,
  `stand_price` decimal(10,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_TRAINID` (`train_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of train_station
-- ----------------------------
INSERT INTO `train_station` VALUES ('1', '4', '上海', '1', '21:00', '', '0.0', '0.0', '0.0');
INSERT INTO `train_station` VALUES ('2', '4', '苏州', '2', '22:05', '22:00', '30.0', '15.0', '15.0');
INSERT INTO `train_station` VALUES ('3', '4', '淮南', '3', '', '08:00', '120.0', '60.0', '60.0');
INSERT INTO `train_station` VALUES ('4', '5', '上海', '1', '17:00', '', '0.0', '0.0', '0.0');
INSERT INTO `train_station` VALUES ('6', '5', '苏州', '2', '18:15', '18:10', '30.0', '15.0', '15.0');
INSERT INTO `train_station` VALUES ('7', '5', '南京', '3', '', '22:00', '90.0', '55.0', '55.0');
INSERT INTO `train_station` VALUES ('8', '6', '上海', '1', '10:00', '', '0.0', '0.0', '0.0');
INSERT INTO `train_station` VALUES ('9', '6', '无锡', '2', '12:05', '12:00', '100.0', '75.0', '75.0');
INSERT INTO `train_station` VALUES ('10', '6', '南京', '3', '', '14:00', '100.0', '75.0', '75.0');
INSERT INTO `train_station` VALUES ('11', '7', '南昌', '1', '8:00', '', '0.0', '0.0', '0.0');
INSERT INTO `train_station` VALUES ('12', '7', '吉安', '2', '10:05', '10:00', '150.0', '75.0', '50.0');
INSERT INTO `train_station` VALUES ('13', '7', '赣州', '3', '', '12:00', '150.0', '75.0', '50.0');
INSERT INTO `train_station` VALUES ('14', '8', '南昌', '1', '10:00', '', '0.0', '0.0', '0.0');
INSERT INTO `train_station` VALUES ('15', '8', '金华', '2', '12:10', '12:00', '200.0', '75.0', '75.0');
INSERT INTO `train_station` VALUES ('16', '8', '义乌', '3', '16:10', '16:00', '100.0', '35.0', '35.0');
INSERT INTO `train_station` VALUES ('17', '8', '杭州', '4', '', '18:00', '100.0', '40.0', '40.0');
INSERT INTO `train_station` VALUES ('18', '9', '赣州', '1', '10:00', '', '0.0', '0.0', '0.0');
INSERT INTO `train_station` VALUES ('19', '9', '兴国', '2', '12:10', '12:00', '89.0', '42.0', '42.0');
INSERT INTO `train_station` VALUES ('20', '9', '吉安', '3', '14:20', '14:10', '89.0', '42.0', '42.0');
INSERT INTO `train_station` VALUES ('21', '9', '南昌', '4', '', '16:20', '90.0', '44.0', '44.0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) DEFAULT NULL,
  `psw` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK36EBCBD76753CD` (`role_id`),
  CONSTRAINT `FK36EBCBD76753CD` FOREIGN KEY (`role_id`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '管理员', null, '1', null, null, null, '2019-03-22 17:39:25');
INSERT INTO `user` VALUES ('10', 'wangwu', '123456', '王五', '男', '2', null, '18615744235', '342121231123123123', '2019-03-22 17:33:17');
INSERT INTO `user` VALUES ('11', 'zhangsan', '123456', '张三', '男', '2', null, '18516599110', '342121231123123123', '2019-03-22 17:33:21');
INSERT INTO `user` VALUES ('19', 'zeng_fanrong', 'zfr1277588404', '曾凡荣', '男', '1', null, '15180484023', '360731199505285933', '2019-03-22 17:33:24');
