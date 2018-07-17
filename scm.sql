/*
MySQL Data Transfer
Source Host: localhost
Source Database: scm
Target Host: localhost
Target Database: scm
Date: 2018/7/17 20:32:33
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for account
-- ----------------------------
CREATE TABLE `account` (
  `acc_id` int(11) NOT NULL auto_increment,
  `acc_login` varchar(20) default NULL,
  `acc_name` varchar(20) default NULL,
  `acc_pass` varchar(20) default NULL,
  PRIMARY KEY  (`acc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for account_records
-- ----------------------------
CREATE TABLE `account_records` (
  `ar_id` varchar(36) NOT NULL,
  `sup_id` int(11) default NULL,
  `ar_date` date default NULL,
  `ar_order_id` varchar(36) default NULL,
  `ar_bus_type` varchar(10) default NULL,
  `ar_payable` decimal(12,2) default NULL,
  `ar_paid` decimal(12,2) default NULL,
  `ar_arrears` decimal(12,2) default NULL,
  `ar_discount` decimal(12,2) default NULL,
  `ar_attn` varchar(20) default NULL,
  `ar_operator` int(11) default NULL,
  `ar_remark` varchar(100) default NULL,
  PRIMARY KEY  (`ar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for buy_order
-- ----------------------------
CREATE TABLE `buy_order` (
  `bo_id` varchar(36) NOT NULL,
  `sup_id` int(11) default NULL,
  `sh_id` varchar(10) default NULL,
  `bo_date` date default NULL,
  `bo_payable` decimal(12,2) default NULL,
  `bo_paid` decimal(12,2) default NULL,
  `bo_arrears` decimal(12,2) default NULL,
  `bo_original` varchar(20) default NULL,
  `bo_remark` varchar(100) default NULL,
  `bo_attn` varchar(20) default NULL,
  `bo_operator` int(11) default NULL,
  PRIMARY KEY  (`bo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for buy_order_detail
-- ----------------------------
CREATE TABLE `buy_order_detail` (
  `bod_id` varchar(36) NOT NULL,
  `goods_id` varchar(36) default NULL,
  `goods_name` varchar(20) default NULL,
  `goods_unit` varchar(10) default NULL,
  `goods_type` varchar(10) default NULL,
  `goods_color` varchar(10) default NULL,
  `bod_amount` int(11) default NULL,
  `bod_buy_price` decimal(12,2) default NULL,
  `bod_total_price` decimal(12,2) default NULL,
  `bo_id` varchar(36) default NULL,
  `bod_imei_list` text,
  PRIMARY KEY  (`bod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
CREATE TABLE `goods` (
  `goods_Id` varchar(36) NOT NULL,
  `goods_name` varchar(20) default NULL,
  `goods_unit` varchar(10) default NULL,
  `goods_type` varchar(10) default NULL,
  `goods_color` varchar(10) default NULL,
  `goods_store` int(11) default NULL,
  `goods_limit` int(11) default NULL,
  `goods_commission` decimal(2,2) default NULL,
  `goods_producer` varchar(50) default NULL,
  `goods_remark` varchar(100) default NULL,
  `goods_sel_price` decimal(12,2) default NULL,
  `goods_buy_price` decimal(12,2) default NULL,
  PRIMARY KEY  (`goods_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inorder
-- ----------------------------
CREATE TABLE `inorder` (
  `goods_name` varchar(12) character set utf8 collate utf8_bin default NULL,
  `goods_amount` varchar(12) default NULL,
  `sup_name` varchar(50) default NULL,
  `order_id` varchar(12) NOT NULL default '',
  `ordertime` varchar(12) default '',
  `order_ok` varchar(12) default NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for outorder
-- ----------------------------
CREATE TABLE `outorder` (
  `goods_name` varchar(50) default NULL,
  `goods_amount` varchar(12) default NULL,
  `sup_name` varchar(50) default NULL,
  `order_id` varchar(12) default NULL,
  `ordertime` varchar(12) default NULL,
  `order_ok` varchar(12) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for return_order
-- ----------------------------
CREATE TABLE `return_order` (
  `ro_id` varchar(36) NOT NULL,
  `sup_id` int(11) default NULL,
  `sh_id` varchar(10) default NULL,
  `ro_date` date default NULL,
  `ro_payable` decimal(12,2) default NULL,
  `ro_paid` decimal(12,2) default NULL,
  `ro_remark` varchar(100) default NULL,
  `ro_attn` varchar(20) default NULL,
  `ro_operator` int(11) default NULL,
  PRIMARY KEY  (`ro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for return_order_detail
-- ----------------------------
CREATE TABLE `return_order_detail` (
  `rod_id` varchar(36) NOT NULL,
  `goods_id` varchar(36) default NULL,
  `goods_unit` varchar(10) default NULL,
  `goods_name` varchar(20) default NULL,
  `goods_type` varchar(10) default NULL,
  `goods_color` varchar(10) default NULL,
  `rod_amount` int(11) default NULL,
  `rod_return_price` decimal(12,2) default NULL,
  `rod_total_price` decimal(12,2) default NULL,
  `rod_imei_list` text,
  `ro_id` varchar(36) default NULL,
  PRIMARY KEY  (`rod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
CREATE TABLE `stock` (
  `stock_id` varchar(40) NOT NULL,
  `sh_id` varchar(10) default NULL,
  `goods_id` varchar(36) default NULL,
  `stock_firstdate` date default NULL,
  `stock_lastdate` date default NULL,
  `stock_amount` int(11) default NULL,
  `stock_price` decimal(12,2) default NULL,
  PRIMARY KEY  (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for store_house
-- ----------------------------
CREATE TABLE `store_house` (
  `sh_id` varchar(10) NOT NULL,
  `sh_name` varchar(20) default NULL,
  `sh_responsible` varchar(20) default NULL,
  `sh_phone` varchar(11) default NULL,
  `sh_address` varchar(50) default NULL,
  `sh_type` varchar(10) default NULL,
  `sh_remark` varchar(100) default NULL,
  PRIMARY KEY  (`sh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
CREATE TABLE `supplier` (
  `sup_id` int(11) NOT NULL,
  `sup_name` varchar(20) default NULL,
  `sup_linkman` varchar(20) default NULL,
  `sup_phone` varchar(11) default NULL,
  `sup_address` varchar(100) default NULL,
  `sup_remark` varchar(100) default NULL,
  `sup_pay` decimal(12,2) default NULL,
  `sup_type` varchar(10) default NULL,
  PRIMARY KEY  (`sup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
CREATE TABLE `sys_param` (
  `sys_param_id` bigint(20) NOT NULL auto_increment,
  `sys_param_field` varchar(50) default NULL,
  `sys_param_value` varchar(500) default NULL,
  `sys_param_text` varchar(50) default NULL,
  `sys_param_type` varchar(2) default NULL,
  PRIMARY KEY  (`sys_param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'admin', null, 'admin');
INSERT INTO `account` VALUES ('2', 'admin2', null, 'admin2');
INSERT INTO `goods` VALUES ('1', 'note4', '部', null, '1', null, null, null, null, 'red note4', '2500.00', '2000.00');
INSERT INTO `goods` VALUES ('2', 'note5', '部', null, '5', null, null, null, null, 'red note5', '3500.00', '3000.00');
INSERT INTO `goods` VALUES ('3', 'note6', '部', null, '6', null, null, null, null, 'blue note5', '4500.00', '4000.00');
INSERT INTO `inorder` VALUES ('note5', '123', '苹果供应商', '123', '', '');
INSERT INTO `store_house` VALUES ('1', '主仓库', null, null, '广州', null, null);
INSERT INTO `store_house` VALUES ('2', '分仓库', null, null, '广州', null, null);
INSERT INTO `supplier` VALUES ('1', '苹果供应商', '小张', '12388888887', '广州花都', '普通供应商', '0.00', '1');
INSERT INTO `supplier` VALUES ('2', '三星供应商', '小王', '12388888888', '广州增城', '普通供应商', '0.00', '1');
INSERT INTO `supplier` VALUES ('3', '华为供应商', '小王', '12388888889', '广东深圳', '一级供应商', '0.00', '2');
INSERT INTO `supplier` VALUES ('4', 'TCL供应商', '小王', '12388888666', '广州增城', '普通供应商', '0.00', '1');
INSERT INTO `supplier` VALUES ('5', 'Nokia供应商', '小王', '12388888777', '广东深圳', '一级供应商', '0.00', '2');
INSERT INTO `sys_param` VALUES ('1', 'shId', 'select s.sh_id as sys_param_value,s.sh_name as sys_param_text from store_house s', null, '1');
INSERT INTO `sys_param` VALUES ('2', 'supType', '1', '一级供应商', null);
INSERT INTO `sys_param` VALUES ('3', 'supType', '2', '二级供应商', null);
INSERT INTO `sys_param` VALUES ('4', 'supType', '3', '普通供应商', null);
INSERT INTO `sys_param` VALUES ('5', 'goodsColor', '1', '红色', null);
INSERT INTO `sys_param` VALUES ('6', 'goodsColor', '2', '绿色', null);
INSERT INTO `sys_param` VALUES ('7', 'goodsColor', '3', '蓝色', null);
