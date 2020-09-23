/*
Navicat MySQL Data Transfer

Source Server         : zhang01
Source Server Version : 80000
Source Host           : localhost:3306
Source Database       : hotel

Target Server Type    : MYSQL
Target Server Version : 80000
File Encoding         : 65001

Date: 2020-09-23 16:23:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for haha
-- ----------------------------
DROP TABLE IF EXISTS `haha`;
CREATE TABLE `haha` (
  `id` int(11) NOT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `roleDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of haha
-- ----------------------------
INSERT INTO `haha` VALUES ('1', 'ADMIN', '系统管理员');
INSERT INTO `haha` VALUES ('2', 'USER', '用户');
INSERT INTO `haha` VALUES ('3', 'sss', 'ssss');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `nickName` varchar(25) DEFAULT NULL COMMENT '昵称',
  `phoneNum` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '张三', '小三', '1388888888', 'zhangsan@QQ.com');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` timestamp NULL DEFAULT NULL,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` int(32) DEFAULT NULL,
  `memberId` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_o_p` (`productId`) USING BTREE,
  KEY `fk_o_m` (`memberId`) USING BTREE,
  CONSTRAINT `fk_o_m` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`),
  CONSTRAINT `fk_o_p` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '12345', '2018-02-03 00:00:00', '2', '北京两日游', '0', '1', '1', '1');
INSERT INTO `orders` VALUES ('2', '12346', '2020-04-15 11:15:17', '2', '大连三日游', '0', '2', '1', '1');
INSERT INTO `orders` VALUES ('3', '12347', '2020-08-12 10:55:10', '2', '云南双飞六日游', '1', '3', '1', '1');
INSERT INTO `orders` VALUES ('4', '12348', '2020-08-12 10:55:10', '2', '海南海岛游', '1', '4', '1', '1');
INSERT INTO `orders` VALUES ('5', '12349', '2020-08-12 10:55:10', '2', '四川生态游', '1', '2', '1', '1');
INSERT INTO `orders` VALUES ('6', '12350', '2020-08-15 10:57:38', '2', '山西文化游', '0', '1', '1', '1');
INSERT INTO `orders` VALUES ('7', '12351', '2018-02-03 00:00:00', '2', '大同两日游', '0', '3', '1', '1');
INSERT INTO `orders` VALUES ('8', '12352', '2020-04-15 11:15:17', '2', '魔都三日游', '0', '1', '1', '1');
INSERT INTO `orders` VALUES ('9', '12353', '2020-08-12 10:55:10', '2', '云贵六日游', '1', '1', '1', '1');
INSERT INTO `orders` VALUES ('10', '12354', '2020-08-12 10:55:10', '2', '湖南三日游', '1', '1', '1', '1');
INSERT INTO `orders` VALUES ('11', '12355', '2020-08-12 10:55:10', '2', '山东五日游', '1', '1', '1', '1');
INSERT INTO `orders` VALUES ('12', '12356', '2020-08-15 10:57:38', '2', '长安文化游', '0', '1', '1', '1');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller` (
  `orderid` int(11) NOT NULL,
  `travellerid` varchar(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`orderid`,`travellerid`) USING BTREE,
  CONSTRAINT `order1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('1', '1');
INSERT INTO `order_traveller` VALUES ('1', '2');
INSERT INTO `order_traveller` VALUES ('2', '1');
INSERT INTO `order_traveller` VALUES ('3', '1');
INSERT INTO `order_traveller` VALUES ('4', '1');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('107', '角色管理', '/role/findAll.do');
INSERT INTO `permission` VALUES ('1943', '资源权限管理', '/permission/findAll.do');
INSERT INTO `permission` VALUES ('23527', '超级管理员', '/user/findAll.do');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` date DEFAULT NULL,
  `productPrice` double(11,0) DEFAULT NULL,
  `productDesc` varchar(250) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '001', '云南一日游', '云南', '2020-04-07', '2100', '云南欢迎你', '0');
INSERT INTO `product` VALUES ('2', '002', '昆明三日游', '昆明', '2020-06-06', '1800', '昆明欢迎你', '1');
INSERT INTO `product` VALUES ('3', '003', '上海一日游', '上海', '2020-05-08', '3800', '魔都欢迎你', '1');
INSERT INTO `product` VALUES ('4', '004', '北京三日游', '北京', '2020-05-09', '5800', '北京我来了', '1');
INSERT INTO `product` VALUES ('5', '005', '深圳七日游', '昆明', '2020-04-07', '18000', '深圳欢迎你', '1');
INSERT INTO `product` VALUES ('6', '006', '昭通一日游', '昭通', '2020-05-08', '1200', '昭通大山包', '0');
INSERT INTO `product` VALUES ('7', '007', '丽江一日游', '昆明', '2020-06-04', '1500', '丽江古镇', '0');
INSERT INTO `product` VALUES ('8', 'aaa', 'aaaaa', 'aaaaa', '2020-04-07', '18000', 'aaaa', '1');
INSERT INTO `product` VALUES ('9', '33333', '333333', '333', '2020-08-07', '3333', '3333', '0');
INSERT INTO `product` VALUES ('10', '1', 'ddd', 'ddd', '2020-09-18', '222', 'ddddddd', '1');
INSERT INTO `product` VALUES ('11', '12', '222', '222', '2020-09-19', '2222', '2222222222', '1');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`) USING BTREE,
  KEY `r_id` (`roleId`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `haha` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('107', '1');
INSERT INTO `role_permission` VALUES ('1943', '1');
INSERT INTO `role_permission` VALUES ('23527', '1');
INSERT INTO `role_permission` VALUES ('107', '2');
INSERT INTO `role_permission` VALUES ('1943', '2');
INSERT INTO `role_permission` VALUES ('23527', '2');
INSERT INTO `role_permission` VALUES ('107', '3');
INSERT INTO `role_permission` VALUES ('1943', '3');
INSERT INTO `role_permission` VALUES ('23527', '3');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` varchar(70) DEFAULT NULL,
  `visitTime` datetime DEFAULT NULL COMMENT '访问时间',
  `username` varchar(50) DEFAULT NULL COMMENT '操作者用户名',
  `ip` varchar(40) DEFAULT NULL COMMENT '访问ip',
  `url` varchar(40) DEFAULT NULL COMMENT '访问资源url',
  `executionTime` int(11) DEFAULT NULL COMMENT '执行时长',
  `method` varchar(255) DEFAULT NULL COMMENT '访问方法'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('1945daa5941849ada68f3d6cb4031510', '2020-04-16 16:57:45', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '22', '[类名] com.hz.controller.UserController [方法名] findAll');
INSERT INTO `syslog` VALUES ('3004d6b5db9949ae9e5d7c3a61e35a31', '2020-04-22 03:34:22', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '7', '[类名] com.hz.controller.OrdersController [方法名] findAll');
INSERT INTO `syslog` VALUES ('5c5f1a0fdcd24c7bbfee6502fa166c65', '2020-04-22 03:20:43', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '23', '[类名] com.hz.controller.UserController [方法名] findAll');
INSERT INTO `syslog` VALUES ('a2184cdd4c3f417d9d211d3d28a04d4b', '2020-04-22 03:48:32', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '23', '[类名] com.hz.controller.OrdersController [方法名] findAll');
INSERT INTO `syslog` VALUES ('da96c3577bab4e26949aadaa19ca75b3', '2020-04-22 03:34:15', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '22', '[类名] com.hz.controller.OrdersController [方法名] findAll');
INSERT INTO `syslog` VALUES ('e46c2915c47f413c9b4b7d3b1beee561', '2020-04-22 03:20:54', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '16', '[类名] com.hz.controller.ProductController [方法名] findAll');
INSERT INTO `syslog` VALUES ('fbdd9303270e4e16921ca938652ac1ca', '2020-04-22 03:20:57', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '48', '[类名] com.hz.controller.OrdersController [方法名] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:31:24', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '27', '[??] com.hotel.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:32:19', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '48', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:32:23', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '10', '[??] com.hotel.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:32:27', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[??] com.hotel.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:32:33', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '8', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:32:35', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '6', '[??] com.hotel.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:32:37', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '6', '[??] com.hotel.ssm.controller.SysLogController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:04', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '9', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:06', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '5', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:14', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:15', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '5', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:16', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '3', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:16', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '6', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:17', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '6', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:18', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '5', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:19', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '7', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:26', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '3', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:28', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:29', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '3', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:30', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:31', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:32', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:32', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '3', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:34', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:35', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:36', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:37', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '5', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:42', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:43', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '3', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:44', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '3', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:45', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:46', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:47', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '3', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:48', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '3', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:48', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:49', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '5', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:33:57', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '7', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:34:02', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:34:05', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '6', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:34:07', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:34:35', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '124', '[??] com.hotel.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:34:35', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '2', '[??] com.hotel.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:35:34', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '2', '[??] com.hotel.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:36:35', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '2', '[??] com.hotel.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:36:48', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '3', '[??] com.hotel.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:36:50', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:36:59', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '3', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:37:09', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:37:29', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '5', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:37:31', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '2', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:37:42', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '2', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:39:08', 'user', '0:0:0:0:0:0:0:1', '/user/findAll.do', '3', '[??] com.hotel.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:39:10', 'user', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:39:12', 'user', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '4', '[??] com.hotel.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:39:15', 'user', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '6', '[??] com.hotel.ssm.controller.SysLogController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:39:27', 'user', '0:0:0:0:0:0:0:1', '/product/findAll.do', '2', '[??] com.hotel.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:39:34', 'user', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-18 21:41:37', 'user', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:51:35', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '21', '[??] com.hotel.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:52:30', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '10', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:52:38', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '6', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:52:45', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '144', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:52:45', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '3', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:52:52', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '2', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:52:55', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '5', '[??] com.hotel.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:53:01', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '2', '[??] com.hotel.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:53:04', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '8', '[??] com.hotel.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:53:09', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '17', '[??] com.hotel.ssm.controller.SysLogController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:54:24', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '8', '[??] com.hotel.ssm.controller.SysLogController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:54:51', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '10', '[??] com.hotel.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:55:34', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '52', '[??] com.hotel.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:55:34', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '4', '[??] com.hotel.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:55:57', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '48', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:56:10', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '7', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:56:12', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '6', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:56:14', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '7', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:56:15', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:56:17', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '3', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:56:18', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '3', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:56:19', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '5', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:56:20', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-19 15:56:36', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '4', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-21 16:22:46', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '24', '[??] com.hotel.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-21 17:43:07', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '7', '[??] com.hotel.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-21 17:43:10', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '10', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-21 17:43:15', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '16', '[??] com.hotel.ssm.controller.SysLogController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-23 15:38:42', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '35', '[??] com.hotel.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-23 15:40:15', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '16', '[??] com.hotel.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-23 15:40:57', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[??] com.hotel.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-23 15:41:28', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '259', '[??] com.hotel.ssm.controller.OrdersController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-23 15:41:53', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '24', '[??] com.hotel.ssm.controller.SysLogController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-23 15:42:31', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '11', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-23 15:43:06', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '9', '[??] com.hotel.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-23 15:43:17', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '3', '[??] com.hotel.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-23 15:43:19', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[??] com.hotel.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES (null, '2020-09-23 15:43:23', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '17', '[??] com.hotel.ssm.controller.SysLogController[???] findAll');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `sex` varchar(8) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL COMMENT '证件类型 0身份证 1护照 2军官证',
  `credentialsNum` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `travellerType` int(11) DEFAULT NULL COMMENT '旅客类型(人群) 0 成人 1 儿童',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('1', '赵龙', '男', '13888888888', '0', '123456789009876543', '0');
INSERT INTO `traveller` VALUES ('2', '张三', '男', '13999999999', '0', '123456789009876543', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态0 未开启 1 开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20616 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'a@qq.com', 'admin', '$2a$10$Ce8LB3jdYDZ2f6HB281zA.4eC7v6ziJdK8MMWg0Yu8ETMg5ToMpIe', '13888888888', '1');
INSERT INTO `users` VALUES ('2', 'adfa', 'tom', '$2a$10$Ce8LB3jdYDZ2f6HB281zA.4eC7v6ziJdK8MMWg0Yu8ETMg5ToMpIe', '546514684', '1');
INSERT INTO `users` VALUES ('3', '1847481@QQ.com', 'wBekvam', '$2a$10$Ce8LB3jdYDZ2f6HB281zA.4eC7v6ziJdK8MMWg0Yu8ETMg5ToMpIe', '15752250992', '1');
INSERT INTO `users` VALUES ('4', '11948939@qq.com', '等灯', '$2a$10$Ce8LB3jdYDZ2f6HB281zA.4eC7v6ziJdK8MMWg0Yu8ETMg5ToMpIe', '15752250992', '0');
INSERT INTO `users` VALUES ('5', 'a@qq.com', 'user', '$2a$10$i7QFXNog.2TT3pCrekha1uJsw54fcBPqVK1ncWtW6HxaGkiMFCBw.', '54154151', '1');
INSERT INTO `users` VALUES ('6', 'a@qq.com', '赵龙', '$2a$10$Ce8LB3jdYDZ2f6HB281zA.4eC7v6ziJdK8MMWg0Yu8ETMg5ToMpIe', '13888888888', '1');
INSERT INTO `users` VALUES ('6862', '11919@qq.com', 'hz', '$2a$10$mEKoiccVd9lmBJh7czLgy.3bIzaGLiUmn1nsQ65mEvSlI7G3K.1J6', '15752250992', '1');
INSERT INTO `users` VALUES ('20614', 'zhixing1010@163.com', 'root', '$2a$10$xmIe31HlXwR5xLKAzzEnju.CDiYZ.qFuCaO832.fFQB0mWYNc/xya', '15752250992', '0');

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`) USING BTREE,
  KEY `roleId` (`roleId`) USING BTREE,
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `haha` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('1', '1');
INSERT INTO `users_role` VALUES ('5', '1');
INSERT INTO `users_role` VALUES ('6', '1');
INSERT INTO `users_role` VALUES ('6862', '1');
INSERT INTO `users_role` VALUES ('1', '2');
INSERT INTO `users_role` VALUES ('2', '2');
INSERT INTO `users_role` VALUES ('3', '2');
INSERT INTO `users_role` VALUES ('4', '2');
INSERT INTO `users_role` VALUES ('5', '2');
INSERT INTO `users_role` VALUES ('6', '2');
INSERT INTO `users_role` VALUES ('6862', '2');
