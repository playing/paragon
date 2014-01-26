/*
MySQL Data Transfer
Source Host: localhost
Source Database: shortrent
Target Host: localhost
Target Database: shortrent
Date: 2014-1-17 ���� 10:01:15
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for house_extrainfo
-- ----------------------------
DROP TABLE IF EXISTS `house_extrainfo`;
CREATE TABLE `house_extrainfo` (
  `House_ID` int(11) NOT NULL auto_increment,
  `Facilities` varchar(255) NOT NULL,
  `Bed_Num` int(11) NOT NULL,
  `Toilet_Num` int(11) NOT NULL,
  `Room_Describe` varchar(255) NOT NULL,
  PRIMARY KEY  (`House_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for house_info
-- ----------------------------
DROP TABLE IF EXISTS `house_info`;
CREATE TABLE `house_info` (
  `House_ID` int(11) NOT NULL auto_increment,
  `House_Address` varchar(255) NOT NULL,
  `House_Picture` varchar(255) NOT NULL,
  `Live_Num` int(11) NOT NULL,
  `House_Price` int(11) NOT NULL,
  `House_Intro` varchar(255) NOT NULL,
  `Check_in_Time` varchar(255) NOT NULL,
  `Check_out_Time` varchar(255) NOT NULL,
  `House_Type` varchar(255) NOT NULL,
  `Rent_Type` varchar(255) NOT NULL,
  `House_Area` int(11) NOT NULL,
  `Bedroom_Num` int(11) NOT NULL,
  PRIMARY KEY  (`House_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `User_ID` int(11) NOT NULL auto_increment,
  `User_Phone` varchar(255) default NULL,
  `User_TName` varchar(255) default NULL,
  `User_Address` varchar(255) default NULL,
  `Sex` varchar(255) default NULL,
  PRIMARY KEY  (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_register
-- ----------------------------
DROP TABLE IF EXISTS `user_register`;
CREATE TABLE `user_register` (
  `User_ID` int(11) NOT NULL auto_increment,
  `User_RegName` varchar(255) default NULL,
  `Password` varchar(255) default NULL,
  `Email` varchar(255) default NULL,
  PRIMARY KEY  (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for userconnhouse
-- ----------------------------
DROP TABLE IF EXISTS `userconnhouse`;
CREATE TABLE `userconnhouse` (
  `House_ID` int(11) NOT NULL auto_increment,
  `User_ID` int(11) NOT NULL,
  PRIMARY KEY  (`House_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `house_extrainfo` VALUES ('1', 'tv=1####computer=1####', '12', '12', '输入房间的详细描述信息.有热水器，空调wifi');
INSERT INTO `house_extrainfo` VALUES ('2', 'tv=1#air=1##wash=1##kitchen=1#bath=1##', '2', '2', '适合一个人居住，优雅的环境和适宜的房间！');
INSERT INTO `house_extrainfo` VALUES ('3', 'tv=1####computer=1##bath=1##', '1', '1', '位于汉口区，周边环境舒适，交通方便');
INSERT INTO `house_extrainfo` VALUES ('4', 'tv=1#air=1#ice=1#wash=1###bath=1#warm=1#', '2', '1', '处于光谷周边，交通便利。房间设备齐全，适宜居住');
INSERT INTO `house_extrainfo` VALUES ('5', '#air=1#ice=1#wash=1##kitchen=1#bath=1##', '5', '2', '处于市区当中，交通便利，但是环境清幽，安静，条件舒适，保证适合居住');
INSERT INTO `house_extrainfo` VALUES ('6', 'tv=1#air=1#ice=1##computer=1####', '2', '1', '房间阳光很好，有阳台，从阳台看风景很美。处于市区，各种方便。');
INSERT INTO `house_extrainfo` VALUES ('7', 'tv=1#air=1##wash=1#computer=1##bath=1##', '2', '1', '蓝色格调，清新舒适。处于安静地段，但交通便利，生活便捷。且处于大学城周边，氛围好。');
INSERT INTO `house_extrainfo` VALUES ('8', 'tv=1#air=1#ice=1###kitchen=1###', '6', '3', '床大，舒服，明亮，宽敞');
INSERT INTO `house_extrainfo` VALUES ('9', 'tv=1#air=1###computer=1#kitchen=1###', '4', '4', '发加热io');
INSERT INTO `house_info` VALUES ('1', '湖北省武汉市华中科技大学', 'http://www.sheepvillage.com/upfiles/rooms/1021.jpg', '3', '1500', '套间三间房海边', '2013-1-17', '2013-1-18', '0', '0', '120', '3');
INSERT INTO `house_info` VALUES ('2', '湖北省武汉市武昌区新生路8号12栋', 'http://www.anjiala.com/d/file/hometextile/daren/2011-02-23/ecf0df4120d84eb98d5cc3925f26e409.jpg', '2', '3000', '粉色小屋', '2013-1-17', '2013-1-18', '2', '2', '100', '2');
INSERT INTO `house_info` VALUES ('3', '湖北省武汉市硚口区汉西三路常青花园12栋6楼', 'http://pic6.nipic.com/20100420/3595098_143447848766_2.jpg', '1', '200', '适合单人，环境优美舒适', '2013-1-17', '2013-1-18', '0', '0', '30', '1');
INSERT INTO `house_info` VALUES ('4', '湖北省武汉市洪山区关山大道369-附25剑桥小区13栋3楼', 'http://shuitou.indigoculture.com/wp-content/uploads/2011/12/shuitounomalroom-0061.jpg', '2', '200', '房屋设备齐全，适合情侣居住', '2013-1-17', '2013-1-20', '1', '0', '40', '1');
INSERT INTO `house_info` VALUES ('5', '湖北省武汉市武昌区东湖路168号阳光花园小区3栋5楼', 'http://www.homesy.com.cn/files/chanpin/200904/200942112120637652.jpg', '3', '800', '安静舒适，适宜居住', '2013-1-17', '2013-1-19', '1', '1', '100', '3');
INSERT INTO `house_info` VALUES ('6', '湖北省武汉市武昌区首义路金色沙滩小区7栋3楼', 'http://pica.nipic.com/2007-12-26/200712269513783_2.jpg', '2', '300', '房间向阳，光线好', '2013-1-17', '2013-1-20', '0', '0', '50', '1');
INSERT INTO `house_info` VALUES ('7', '湖北省武汉市武昌区沙湖路绿光森林小区3区12栋5楼', 'http://www.cnfina.com/uploadfile/2011/0426/20110426125804436.jpg', '1', '500', '蓝色格调的房间，安静舒适', '2013-1-17', '2013-1-21', '2', '0', '30', '1');
INSERT INTO `house_info` VALUES ('8', '湖北省武汉市硚口区汉中路144汉正小区3单元2栋4楼', 'http://pic.to8to.com/case/1212/03/20121203_80866418b85f4c8631095dhspHYH5NPP.jpg', '3', '200', '清新明亮的设计，空间大，适合全家居住', '2013-1-07', '2013-1-15', '2', '1', '250', '3');
INSERT INTO `house_info` VALUES ('9', '湖北省武汉市汉阳区琴台大道金蛇', 'http://pic.to8to.com/case/1212/03/20121203_80866418b85f4c8631095dhspHYH5NPP.jpg', '4', '200', '明亮宽敞', '2013-1-17', '2013-1-18', '1', '1', '200', '4');
INSERT INTO `user_info` VALUES ('2', '15623838117', '黄凯', '华中科技大学韵苑16栋', '男');
INSERT INTO `user_info` VALUES ('3', '13026197638', '黄威', '华中科技大学韵苑11栋', '男');
INSERT INTO `user_info` VALUES ('4', '13387503119', '黄杰', '华中科技大学韵苑16栋', '男');
INSERT INTO `user_info` VALUES ('5', '13512345678', '姜昊良', '华中科技大学韵苑16栋', '男');
INSERT INTO `user_info` VALUES ('6', '13324567891', '王一桐', '华中科技大学韵苑16栋420', '男');
INSERT INTO `user_register` VALUES ('2', 'yinshi', '123456', '781446944@qq.com');
INSERT INTO `user_register` VALUES ('3', 'huangwei', '123456', 'huangwei@gmail.com');
INSERT INTO `user_register` VALUES ('4', 'huangjie', '123456', 'huangjie@163.com');
INSERT INTO `user_register` VALUES ('5', 'jianghaoliang', '123456', 'jianghaoliang@126.com');
INSERT INTO `user_register` VALUES ('6', 'wangyitong', '123456', 'wangyitong');
INSERT INTO `userconnhouse` VALUES ('1', '1');
INSERT INTO `userconnhouse` VALUES ('2', '1');
INSERT INTO `userconnhouse` VALUES ('3', '1');
INSERT INTO `userconnhouse` VALUES ('4', '1');
INSERT INTO `userconnhouse` VALUES ('5', '1');
INSERT INTO `userconnhouse` VALUES ('6', '1');
INSERT INTO `userconnhouse` VALUES ('7', '1');
INSERT INTO `userconnhouse` VALUES ('8', '1');
INSERT INTO `userconnhouse` VALUES ('9', '1');
