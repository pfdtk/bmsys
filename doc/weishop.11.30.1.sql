/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : mrblog

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-11-30 13:06:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bk_access`
-- ----------------------------
DROP TABLE IF EXISTS `bk_access`;
CREATE TABLE `bk_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色的ID',
  `permission_id` int(11) NOT NULL COMMENT '节点的ID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '标识是用户组还是用户1为用户组2为用户,默认为用户组',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `node_id` (`permission_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COMMENT='权限表_by_jiang';

-- ----------------------------
-- Records of bk_access
-- ----------------------------
INSERT INTO `bk_access` VALUES ('165', '3', '1', '2');
INSERT INTO `bk_access` VALUES ('166', '3', '4', '2');
INSERT INTO `bk_access` VALUES ('167', '3', '20', '2');
INSERT INTO `bk_access` VALUES ('168', '3', '27', '2');
INSERT INTO `bk_access` VALUES ('169', '3', '28', '2');
INSERT INTO `bk_access` VALUES ('170', '3', '29', '2');
INSERT INTO `bk_access` VALUES ('171', '3', '2', '2');
INSERT INTO `bk_access` VALUES ('172', '3', '23', '2');
INSERT INTO `bk_access` VALUES ('173', '3', '24', '2');
INSERT INTO `bk_access` VALUES ('174', '3', '25', '2');
INSERT INTO `bk_access` VALUES ('175', '3', '26', '2');
INSERT INTO `bk_access` VALUES ('176', '3', '3', '2');
INSERT INTO `bk_access` VALUES ('177', '3', '30', '2');
INSERT INTO `bk_access` VALUES ('178', '3', '31', '2');
INSERT INTO `bk_access` VALUES ('179', '3', '32', '2');
INSERT INTO `bk_access` VALUES ('180', '3', '33', '2');
INSERT INTO `bk_access` VALUES ('181', '3', '43', '2');
INSERT INTO `bk_access` VALUES ('182', '3', '55', '2');
INSERT INTO `bk_access` VALUES ('183', '3', '73', '2');
INSERT INTO `bk_access` VALUES ('184', '3', '56', '2');
INSERT INTO `bk_access` VALUES ('185', '3', '57', '2');
INSERT INTO `bk_access` VALUES ('186', '3', '58', '2');
INSERT INTO `bk_access` VALUES ('187', '3', '59', '2');
INSERT INTO `bk_access` VALUES ('188', '3', '60', '2');
INSERT INTO `bk_access` VALUES ('189', '3', '61', '2');
INSERT INTO `bk_access` VALUES ('190', '3', '62', '2');
INSERT INTO `bk_access` VALUES ('191', '3', '63', '2');
INSERT INTO `bk_access` VALUES ('192', '3', '66', '2');
INSERT INTO `bk_access` VALUES ('193', '3', '44', '2');
INSERT INTO `bk_access` VALUES ('194', '3', '74', '2');
INSERT INTO `bk_access` VALUES ('195', '3', '75', '2');
INSERT INTO `bk_access` VALUES ('196', '3', '76', '2');
INSERT INTO `bk_access` VALUES ('197', '3', '78', '2');
INSERT INTO `bk_access` VALUES ('198', '3', '53', '2');

-- ----------------------------
-- Table structure for `bk_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `bk_action_log`;
CREATE TABLE `bk_action_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '登录的用户名',
  `user_id` int(11) NOT NULL COMMENT '登录的用户ID',
  `ip` varchar(20) NOT NULL COMMENT 'ip地址',
  `ip_adress` varchar(255) NOT NULL COMMENT 'ip所属的地区',
  `add_time` int(11) NOT NULL,
  `realname` varchar(30) NOT NULL COMMENT '真实姓名',
  `content` text NOT NULL COMMENT '记录的内容',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `addtime` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=816 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_action_log
-- ----------------------------
INSERT INTO `bk_action_log` VALUES ('1', 'admin', '1', '127.0.0.1', '', '1433318628', '管理员', '');
INSERT INTO `bk_action_log` VALUES ('2', 'admin', '1', '127.0.0.1', '', '1433319059', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('3', 'admin', '1', '127.0.0.1', '', '1433319146', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('4', 'test', '2', '127.0.0.1', '', '1433323585', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('5', 'admin', '1', '127.0.0.1', '', '1433323596', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('6', 'test', '2', '127.0.0.1', '', '1433387021', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('7', 'admin', '1', '127.0.0.1', '', '1433387092', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('8', 'admin', '1', '127.0.0.1', '', '1433387394', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('9', 'admin', '1', '127.0.0.1', '', '1433387489', '管理员', '增加了新的系统用户：test1231231123');
INSERT INTO `bk_action_log` VALUES ('10', 'admin', '1', '127.0.0.1', '', '1433388058', '管理员', '编辑了系统用户：test1231231123');
INSERT INTO `bk_action_log` VALUES ('11', 'admin', '1', '127.0.0.1', '', '1433389439', '管理员', '增加了新的系统用户：123123aab');
INSERT INTO `bk_action_log` VALUES ('12', 'admin', '1', '127.0.0.1', '', '1433389488', '管理员', '增加了新的系统用户：12313123123');
INSERT INTO `bk_action_log` VALUES ('13', 'admin', '1', '127.0.0.1', '', '1433389702', '管理员', '增加了新的系统用户：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('14', 'admin', '1', '127.0.0.1', '', '1433389728', '管理员', '增加了新的系统用户：123123gg');
INSERT INTO `bk_action_log` VALUES ('15', 'admin', '1', '127.0.0.1', '', '1433390103', '管理员', '删除了系统用户：12313123123');
INSERT INTO `bk_action_log` VALUES ('16', 'admin', '1', '127.0.0.1', '', '1433390300', '管理员', '删除了系统用户：123123aab');
INSERT INTO `bk_action_log` VALUES ('17', 'admin', '1', '127.0.0.1', '', '1433390407', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('18', 'test', '2', '127.0.0.1', '', '1433390430', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('19', 'admin', '1', '127.0.0.1', '', '1433397520', '管理员', '增加了新的用户组：sdfasf');
INSERT INTO `bk_action_log` VALUES ('20', 'admin', '1', '127.0.0.1', '', '1433398047', '管理员', '编辑了用户组：sdfasf');
INSERT INTO `bk_action_log` VALUES ('21', 'admin', '1', '127.0.0.1', '', '1433398364', '管理员', '删除了系统用户：sdfasf');
INSERT INTO `bk_action_log` VALUES ('22', 'admin', '1', '127.0.0.1', '', '1433398384', '管理员', '删除了用户组：test123');
INSERT INTO `bk_action_log` VALUES ('23', 'admin', '1', '127.0.0.1', '', '1433398933', '管理员', '增加了新的用户组：:groupname');
INSERT INTO `bk_action_log` VALUES ('24', 'admin', '1', '127.0.0.1', '', '1433398963', '管理员', '改变了用户组的权限：测试用户组');
INSERT INTO `bk_action_log` VALUES ('25', 'admin', '1', '127.0.0.1', '', '1433399098', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('26', 'admin', '1', '127.0.0.1', '', '1433400975', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('27', 'admin', '1', '127.0.0.1', '', '1433408366', '管理员', '增加了新的系统用户：test123');
INSERT INTO `bk_action_log` VALUES ('28', 'admin', '1', '127.0.0.1', '', '1433408371', '管理员', '删除了系统用户：test123');
INSERT INTO `bk_action_log` VALUES ('29', 'admin', '1', '127.0.0.1', '', '1433408376', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('30', 'admin', '1', '127.0.0.1', '', '1433904485', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('31', 'admin', '1', '127.0.0.1', '', '1433904731', '管理员', '增加了新的用户组：1123');
INSERT INTO `bk_action_log` VALUES ('32', 'admin', '1', '127.0.0.1', '', '1433904744', '管理员', '删除了用户组：1123');
INSERT INTO `bk_action_log` VALUES ('33', 'test', '2', '127.0.0.1', '', '1433905009', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('34', 'admin', '1', '127.0.0.1', '', '1433907007', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('35', 'admin', '1', '127.0.0.1', '', '1433909004', '管理员', '增加了新的用户组：1123');
INSERT INTO `bk_action_log` VALUES ('36', 'admin', '1', '127.0.0.1', '', '1433985688', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('37', 'admin', '1', '127.0.0.1', '', '1434093122', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('38', 'admin', '1', '127.0.0.1', '', '1434094731', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('39', 'admin', '1', '127.0.0.1', '', '1434333022', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('40', 'admin', '1', '127.0.0.1', '', '1434333284', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('41', 'admin', '1', '127.0.0.1', '', '1434334022', '管理员', '增加了新的用户组：123123ssss');
INSERT INTO `bk_action_log` VALUES ('42', 'admin', '1', '127.0.0.1', '', '1434334039', '管理员', '编辑了用户组：123123ssssa');
INSERT INTO `bk_action_log` VALUES ('43', 'admin', '1', '127.0.0.1', '', '1434334965', '管理员', '删除了用户组：123123ssssa');
INSERT INTO `bk_action_log` VALUES ('44', 'admin', '1', '127.0.0.1', '', '1434334970', '管理员', '删除了用户组：1123');
INSERT INTO `bk_action_log` VALUES ('45', 'admin', '1', '127.0.0.1', '', '1434335101', '管理员', '增加了新的工作流：工作流2');
INSERT INTO `bk_action_log` VALUES ('46', 'admin', '1', '127.0.0.1', '', '1434335308', '管理员', '增加了新的工作流：工作流3');
INSERT INTO `bk_action_log` VALUES ('47', 'admin', '1', '127.0.0.1', '', '1434336740', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('48', 'admin', '1', '127.0.0.1', '', '1434337228', '管理员', '编辑了工作流：工作流11');
INSERT INTO `bk_action_log` VALUES ('49', 'admin', '1', '127.0.0.1', '', '1434337255', '管理员', '增加了新的工作流：123123');
INSERT INTO `bk_action_log` VALUES ('50', 'admin', '1', '127.0.0.1', '', '1434338302', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('51', 'admin', '1', '127.0.0.1', '', '1434338514', '管理员', '删除了工作流：工作流2');
INSERT INTO `bk_action_log` VALUES ('52', 'admin', '1', '127.0.0.1', '', '1434339359', '管理员', '增加了新的用户组：123');
INSERT INTO `bk_action_log` VALUES ('53', 'admin', '1', '127.0.0.1', '', '1434339370', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('54', 'admin', '1', '127.0.0.1', '', '1434339391', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('55', 'admin', '1', '127.0.0.1', '', '1434339412', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('56', 'admin', '1', '127.0.0.1', '', '1434339442', '管理员', '删除了用户组：123');
INSERT INTO `bk_action_log` VALUES ('57', 'admin', '1', '127.0.0.1', '', '1434339604', '管理员', '增加了新的系统用户：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('58', 'admin', '1', '127.0.0.1', '', '1434339625', '管理员', '改变了用户的权限：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('59', 'admin', '1', '127.0.0.1', '', '1434339648', '管理员', '删除了系统用户：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('60', 'admin', '1', '127.0.0.1', '', '1434339672', '管理员', '改变了用户组的权限：测试用户组');
INSERT INTO `bk_action_log` VALUES ('61', 'admin', '1', '127.0.0.1', '', '1434339687', '管理员', '增加了新的系统用户：123123gg');
INSERT INTO `bk_action_log` VALUES ('62', 'admin', '1', '127.0.0.1', '', '1434339703', '管理员', '改变了用户的权限：123123gg');
INSERT INTO `bk_action_log` VALUES ('63', 'admin', '1', '127.0.0.1', '', '1434339721', '管理员', '删除了系统用户：123123gg');
INSERT INTO `bk_action_log` VALUES ('64', 'admin', '1', '127.0.0.1', '', '1434339734', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('65', 'admin', '1', '127.0.0.1', '', '1434339747', '管理员', '删除了用户组：测试用户组');
INSERT INTO `bk_action_log` VALUES ('66', 'admin', '1', '127.0.0.1', '', '1434341772', '管理员', '编辑了工作流：工作流1');
INSERT INTO `bk_action_log` VALUES ('67', 'admin', '1', '127.0.0.1', '', '1434345134', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('68', 'admin', '1', '127.0.0.1', '', '1434347265', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('69', 'admin', '1', '127.0.0.1', '', '1434349496', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('70', 'admin', '1', '127.0.0.1', '', '1434352541', '管理员', '增加了新的工作流步骤：财务总监审核');
INSERT INTO `bk_action_log` VALUES ('71', 'admin', '1', '127.0.0.1', '', '1434352641', '管理员', '增加了新的工作流步骤：公司复责人审核');
INSERT INTO `bk_action_log` VALUES ('72', 'admin', '1', '127.0.0.1', '', '1434353123', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('73', 'admin', '1', '127.0.0.1', '', '1434354662', '管理员', '编辑了工作流步骤：公司负责人审核');
INSERT INTO `bk_action_log` VALUES ('74', 'admin', '1', '127.0.0.1', '', '1434354730', '管理员', '编辑了工作流步骤：公司负责人审核');
INSERT INTO `bk_action_log` VALUES ('75', 'admin', '1', '127.0.0.1', '', '1434354742', '管理员', '编辑了工作流步骤：公司负责人审核');
INSERT INTO `bk_action_log` VALUES ('76', 'admin', '1', '127.0.0.1', '', '1434354752', '管理员', '编辑了工作流步骤：公司负责人审核');
INSERT INTO `bk_action_log` VALUES ('77', 'admin', '1', '127.0.0.1', '', '1434354837', '管理员', '增加了新的工作流步骤：xx');
INSERT INTO `bk_action_log` VALUES ('78', 'admin', '1', '127.0.0.1', '', '1434354941', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('79', 'admin', '1', '127.0.0.1', '', '1434355261', '管理员', '删除了工作流步骤：xx');
INSERT INTO `bk_action_log` VALUES ('80', 'admin', '1', '127.0.0.1', '', '1434422513', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('81', 'admin', '1', '127.0.0.1', '', '1434441684', '管理员', '关联了用户test到工作流工作流1中的审核步骤财务审核');
INSERT INTO `bk_action_log` VALUES ('82', 'admin', '1', '127.0.0.1', '', '1434441764', '管理员', '关联了用户：test到工作流：工作流1中的审核步骤：财务审核');
INSERT INTO `bk_action_log` VALUES ('83', 'admin', '1', '127.0.0.1', '', '1434441764', '管理员', '关联了用户：管理员到工作流：工作流1中的审核步骤：财务审核');
INSERT INTO `bk_action_log` VALUES ('84', 'admin', '1', '127.0.0.1', '', '1434441789', '管理员', '关联了用户：test 到工作流：工作流1 中的审核步骤：财务审核');
INSERT INTO `bk_action_log` VALUES ('85', 'admin', '1', '127.0.0.1', '', '1434441789', '管理员', '关联了用户：管理员 到工作流：工作流1 中的审核步骤：财务审核');
INSERT INTO `bk_action_log` VALUES ('86', 'admin', '1', '127.0.0.1', '', '1434441843', '管理员', '关联了用户：test 到工作流：工作流1 中的审核步骤：财务审核');
INSERT INTO `bk_action_log` VALUES ('87', 'admin', '1', '127.0.0.1', '', '1434443074', '管理员', '增加了新的工作流：测试仪');
INSERT INTO `bk_action_log` VALUES ('88', 'admin', '1', '127.0.0.1', '', '1434443280', '管理员', '编辑了工作流：测试仪');
INSERT INTO `bk_action_log` VALUES ('89', 'admin', '1', '127.0.0.1', '', '1434443296', '管理员', '增加了新的工作流步骤：123');
INSERT INTO `bk_action_log` VALUES ('90', 'admin', '1', '127.0.0.1', '', '1434443311', '管理员', '增加了新的工作流步骤：ads');
INSERT INTO `bk_action_log` VALUES ('91', 'admin', '1', '127.0.0.1', '', '1434443332', '管理员', '关联了用户：test 到工作流：测试仪 中的审核步骤：123');
INSERT INTO `bk_action_log` VALUES ('92', 'admin', '1', '127.0.0.1', '', '1434443347', '管理员', '关联了用户：管理员 到工作流：测试仪 中的审核步骤：ads');
INSERT INTO `bk_action_log` VALUES ('93', 'admin', '1', '127.0.0.1', '', '1434443452', '管理员', '增加了新的工作流步骤：1231');
INSERT INTO `bk_action_log` VALUES ('94', 'admin', '1', '127.0.0.1', '', '1434443543', '管理员', '增加了新的工作流步骤：123123123');
INSERT INTO `bk_action_log` VALUES ('95', 'admin', '1', '127.0.0.1', '', '1434443554', '管理员', '删除了工作流步骤：123123123');
INSERT INTO `bk_action_log` VALUES ('96', 'admin', '1', '127.0.0.1', '', '1434443580', '管理员', '删除了工作流：测试仪');
INSERT INTO `bk_action_log` VALUES ('97', 'admin', '1', '127.0.0.1', '', '1434443792', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('98', 'admin', '1', '127.0.0.1', '', '1434443823', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('99', 'test', '2', '127.0.0.1', '', '1434443878', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('100', 'test', '2', '127.0.0.1', '', '1434444960', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('101', 'test', '2', '127.0.0.1', '', '1434444985', 'test', '增加了新的工作流：123');
INSERT INTO `bk_action_log` VALUES ('102', 'test', '2', '127.0.0.1', '', '1434444994', 'test', '编辑了工作流：123');
INSERT INTO `bk_action_log` VALUES ('103', 'test', '2', '127.0.0.1', '', '1434445001', 'test', '删除了工作流：123');
INSERT INTO `bk_action_log` VALUES ('104', 'admin', '1', '127.0.0.1', '', '1434445027', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('105', 'admin', '1', '127.0.0.1', '', '1434445038', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('106', 'admin', '1', '127.0.0.1', '', '1434507752', '管理员', '关联了用户：test 到工作流：工作流1 中的审核步骤：财务总监审核');
INSERT INTO `bk_action_log` VALUES ('107', 'admin', '1', '127.0.0.1', '', '1434507752', '管理员', '关联了用户：管理员 到工作流：工作流1 中的审核步骤：财务总监审核');
INSERT INTO `bk_action_log` VALUES ('108', 'admin', '1', '127.0.0.1', '', '1434507770', '管理员', '关联了用户：管理员 到工作流：工作流1 中的审核步骤：公司负责人审核');
INSERT INTO `bk_action_log` VALUES ('109', 'admin', '1', '127.0.0.1', '', '1434508916', '管理员', '增加了新的工作流：测试工作流');
INSERT INTO `bk_action_log` VALUES ('110', 'admin', '1', '127.0.0.1', '', '1434508942', '管理员', '编辑了工作流：测试工作流');
INSERT INTO `bk_action_log` VALUES ('111', 'admin', '1', '127.0.0.1', '', '1434509294', '管理员', '编辑了工作流：工作流1');
INSERT INTO `bk_action_log` VALUES ('112', 'admin', '1', '127.0.0.1', '', '1434509313', '管理员', '编辑了工作流：测试工作流');
INSERT INTO `bk_action_log` VALUES ('113', 'admin', '1', '127.0.0.1', '', '1434509520', '管理员', '编辑了工作流：测试工作流');
INSERT INTO `bk_action_log` VALUES ('114', 'admin', '1', '127.0.0.1', '', '1434516742', '管理员', '增加了新的工作流步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('115', 'admin', '1', '127.0.0.1', '', '1434516769', '管理员', '增加了新的工作流步骤：测试2');
INSERT INTO `bk_action_log` VALUES ('116', 'admin', '1', '127.0.0.1', '', '1434516774', '管理员', '关联了用户：管理员 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('117', 'admin', '1', '127.0.0.1', '', '1434516845', '管理员', '关联了用户：test 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('118', 'admin', '1', '127.0.0.1', '', '1434516853', '管理员', '关联了用户：test 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('119', 'admin', '1', '127.0.0.1', '', '1434516853', '管理员', '关联了用户：管理员 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('120', 'admin', '1', '127.0.0.1', '', '1434517331', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('121', 'admin', '1', '127.0.0.1', '', '1434520918', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('122', 'admin', '1', '127.0.0.1', '', '1434523410', '管理员', '关联了用户：test 到工作流：测试工作流 中的审核步骤：测试2');
INSERT INTO `bk_action_log` VALUES ('123', 'admin', '1', '127.0.0.1', '', '1434523426', '管理员', '编辑了工作流步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('124', 'admin', '1', '127.0.0.1', '', '1434523612', '管理员', '关联了用户：test 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('125', 'admin', '1', '127.0.0.1', '', '1434523635', '管理员', '关联了用户：管理员 到工作流：测试工作流 中的审核步骤：测试2');
INSERT INTO `bk_action_log` VALUES ('126', 'test', '2', '127.0.0.1', '', '1434523662', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('127', 'test', '2', '127.0.0.1', '', '1434524881', 'test', '增加了新的工作流：xx');
INSERT INTO `bk_action_log` VALUES ('128', 'test', '2', '127.0.0.1', '', '1434524889', 'test', '删除了工作流：xx');
INSERT INTO `bk_action_log` VALUES ('129', 'test', '2', '127.0.0.1', '', '1434524895', 'test', '删除了工作流：工作流11');
INSERT INTO `bk_action_log` VALUES ('130', 'admin', '1', '127.0.0.1', '', '1435044773', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('131', 'admin', '1', '127.0.0.1', '', '1435114399', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('132', 'admin', '1', '127.0.0.1', '', '1435117746', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('133', 'admin', '1', '127.0.0.1', '', '1435117778', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('134', 'admin', '1', '127.0.0.1', '', '1435118579', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('135', 'admin', '1', '127.0.0.1', '', '1435118762', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('136', 'admin', '1', '127.0.0.1', '', '1435126625', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('137', 'admin', '1', '127.0.0.1', '', '1435127311', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('138', 'admin', '1', '127.0.0.1', '', '1435127360', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('139', 'admin', '1', '127.0.0.1', '', '1435129351', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('140', 'admin', '1', '127.0.0.1', '', '1435288666', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('141', 'admin', '1', '127.0.0.1', '', '1435304943', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('142', 'admin', '1', '127.0.0.1', '', '1435304988', '管理员', '增加了新的用户组：123');
INSERT INTO `bk_action_log` VALUES ('143', 'admin', '1', '127.0.0.1', '', '1435305005', '管理员', '增加了新的用户组：123');
INSERT INTO `bk_action_log` VALUES ('144', 'admin', '1', '127.0.0.1', '', '1435305072', '管理员', '编辑了工作流：测试工作流');
INSERT INTO `bk_action_log` VALUES ('145', 'admin', '1', '127.0.0.1', '', '1435305087', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('146', 'admin', '1', '127.0.0.1', '', '1435305090', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('147', 'admin', '1', '127.0.0.1', '', '1435305093', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('148', 'admin', '1', '127.0.0.1', '', '1435305096', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('149', 'admin', '1', '127.0.0.1', '', '1435305098', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('150', 'admin', '1', '127.0.0.1', '', '1435305101', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('151', 'admin', '1', '127.0.0.1', '', '1435305104', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('152', 'admin', '1', '127.0.0.1', '', '1435305106', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('153', 'admin', '1', '127.0.0.1', '', '1435305109', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('154', 'admin', '1', '127.0.0.1', '', '1435305112', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('155', 'admin', '1', '127.0.0.1', '', '1435305114', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('156', 'admin', '1', '127.0.0.1', '', '1435305144', '管理员', '删除了用户组：123');
INSERT INTO `bk_action_log` VALUES ('157', 'admin', '1', '127.0.0.1', '', '1435305194', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('158', 'admin', '1', '127.0.0.1', '', '1435543884', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('159', 'admin', '1', '127.0.0.1', '', '1435543919', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('160', 'admin', '1', '127.0.0.1', '', '1435543924', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('161', 'admin', '1', '127.0.0.1', '', '1435544846', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('162', 'admin', '1', '127.0.0.1', '', '1435544858', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('163', 'admin', '1', '127.0.0.1', '', '1435544905', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('164', 'admin', '1', '127.0.0.1', '', '1435544909', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('165', 'admin', '1', '127.0.0.1', '', '1435545169', '管理员', '删除了用户组：123');
INSERT INTO `bk_action_log` VALUES ('166', 'admin', '1', '127.0.0.1', '', '1435545229', '管理员', '删除了系统用户：test');
INSERT INTO `bk_action_log` VALUES ('167', 'admin', '1', '127.0.0.1', '', '1435545383', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('168', 'admin', '1', '127.0.0.1', '', '1435545965', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('169', 'admin', '1', '127.0.0.1', '', '1435546040', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('170', 'admin', '1', '127.0.0.1', '', '1435546116', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('171', 'admin', '1', '127.0.0.1', '', '1435546127', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('172', 'admin', '1', '127.0.0.1', '', '1435546171', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('173', 'admin', '1', '127.0.0.1', '', '1435546175', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('174', 'admin', '1', '127.0.0.1', '', '1435548904', '管理员', '改变了用户组的权限：超级用户组');
INSERT INTO `bk_action_log` VALUES ('175', 'admin', '1', '127.0.0.1', '', '1435551384', '管理员', '关联了用户：管理员 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('176', 'admin', '1', '127.0.0.1', '', '1435551469', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('177', 'admin', '1', '127.0.0.1', '', '1435551480', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('178', 'admin', '1', '127.0.0.1', '', '1435551487', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('179', 'admin', '1', '127.0.0.1', '', '1435551491', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('180', 'admin', '1', '127.0.0.1', '', '1435551494', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('181', 'admin', '1', '127.0.0.1', '', '1435551504', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('182', 'admin', '1', '127.0.0.1', '', '1435563248', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('183', 'admin', '1', '127.0.0.1', '', '1435563266', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('184', 'admin', '1', '127.0.0.1', '', '1435563284', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('185', 'admin', '1', '127.0.0.1', '', '1435563326', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('186', 'admin', '1', '127.0.0.1', '', '1435563375', '管理员', '编辑了系统用户：admin');
INSERT INTO `bk_action_log` VALUES ('187', 'admin', '1', '127.0.0.1', '', '1435563479', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('188', 'admin', '1', '127.0.0.1', '', '1435563853', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('189', 'admin', '1', '127.0.0.1', '', '1435563866', '管理员', '改变了用户组的权限：超级用户组');
INSERT INTO `bk_action_log` VALUES ('190', 'admin', '1', '127.0.0.1', '', '1435568665', '管理员', '改变了用户组的权限：超级用户组');
INSERT INTO `bk_action_log` VALUES ('191', 'admin', '1', '127.0.0.1', '', '1435630315', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('192', 'admin', '1', '127.0.0.1', '', '1435631134', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('193', 'admin', '1', '127.0.0.1', '', '1435631327', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('194', 'admin', '1', '127.0.0.1', '', '1435632843', '管理员', '编辑了系统用户：admin');
INSERT INTO `bk_action_log` VALUES ('195', 'admin', '1', '127.0.0.1', '', '1435637075', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('196', 'admin', '1', '127.0.0.1', '', '1435638964', '管理员', '编辑了工作流步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('197', 'admin', '1', '127.0.0.1', '', '1435649867', '管理员', '改变了用户组的权限：超级用户组');
INSERT INTO `bk_action_log` VALUES ('198', 'admin', '1', '127.0.0.1', '', '1435737120', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('199', 'admin', '1', '127.0.0.1', '', '1435738202', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('200', 'admin', '1', '127.0.0.1', '', '1436147586', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('201', 'admin', '1', '127.0.0.1', '', '1436147922', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('202', 'admin', '1', '127.0.0.1', '', '1436150023', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('203', 'admin', '1', '127.0.0.1', '', '1436150360', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('204', 'admin', '1', '127.0.0.1', '', '1436150536', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('205', 'admin', '1', '127.0.0.1', '', '1436152462', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('206', 'admin', '1', '127.0.0.1', '', '1436153673', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('207', 'admin', '1', '127.0.0.1', '', '1436153740', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('208', 'admin', '1', '127.0.0.1', '', '1436156479', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('209', 'admin', '1', '127.0.0.1', '', '1436169648', '管理员', '增加了新的系统用户：test');
INSERT INTO `bk_action_log` VALUES ('210', 'admin', '1', '127.0.0.1', '', '1436169666', '管理员', '增加了新的用户组：test');
INSERT INTO `bk_action_log` VALUES ('211', 'admin', '1', '127.0.0.1', '', '1436169678', '管理员', '编辑了系统用户：test');
INSERT INTO `bk_action_log` VALUES ('212', 'admin', '1', '127.0.0.1', '', '1436169830', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('213', 'admin', '1', '127.0.0.1', '', '1436169901', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('214', 'admin', '1', '127.0.0.1', '', '1436169909', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('215', 'test', '2', '127.0.0.1', '', '1436169949', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('216', 'admin', '1', '127.0.0.1', '', '1436170007', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('217', 'test', '2', '127.0.0.1', '', '1436170015', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('218', 'admin', '1', '127.0.0.1', '', '1436170400', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('219', 'test', '2', '127.0.0.1', '', '1436170410', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('220', 'admin', '1', '127.0.0.1', '', '1436170781', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('221', 'test', '2', '127.0.0.1', '', '1436170792', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('222', 'test', '2', '127.0.0.1', '', '1436170892', 'test', '增加了新的用户组：test2');
INSERT INTO `bk_action_log` VALUES ('223', 'test', '2', '127.0.0.1', '', '1436170910', 'test', '增加了新的系统用户：test2');
INSERT INTO `bk_action_log` VALUES ('224', 'test', '2', '127.0.0.1', '', '1436171238', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('225', 'test', '2', '127.0.0.1', '', '1436171403', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('226', 'admin', '1', '127.0.0.1', '', '1436232722', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('227', 'admin', '1', '127.0.0.1', '', '1436237053', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('228', 'admin', '1', '127.0.0.1', '', '1436237105', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('229', 'test', '2', '127.0.0.1', '', '1436237162', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('230', 'admin', '1', '127.0.0.1', '', '1436237329', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('231', 'admin', '1', '127.0.0.1', '', '1436237524', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('232', 'admin', '1', '127.0.0.1', '', '1436237637', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('233', 'admin', '1', '127.0.0.1', '', '1436237837', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('234', 'test', '2', '127.0.0.1', '', '1436237855', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('235', 'admin', '1', '127.0.0.1', '', '1436237898', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('236', 'admin', '1', '127.0.0.1', '', '1436237901', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('237', 'admin', '1', '127.0.0.1', '', '1436237909', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('238', 'admin', '1', '127.0.0.1', '', '1436238450', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('239', 'admin', '1', '127.0.0.1', '', '1436238456', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('240', 'admin', '1', '127.0.0.1', '', '1436238502', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('241', 'admin', '1', '127.0.0.1', '', '1436238870', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('242', 'admin', '1', '127.0.0.1', '', '1436238871', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('243', 'admin', '1', '127.0.0.1', '', '1436239312', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('244', 'admin', '1', '127.0.0.1', '', '1436239313', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('245', 'admin', '1', '127.0.0.1', '', '1436239654', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('246', 'admin', '1', '127.0.0.1', '', '1436239658', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('247', 'admin', '1', '127.0.0.1', '', '1436239716', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('248', 'admin', '1', '127.0.0.1', '', '1436239767', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('249', 'admin', '1', '127.0.0.1', '', '1436239771', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('250', 'admin', '1', '127.0.0.1', '', '1436240071', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('251', 'admin', '1', '127.0.0.1', '', '1436240359', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('252', 'admin', '1', '127.0.0.1', '', '1436240365', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('253', 'admin', '1', '127.0.0.1', '', '1436240399', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('254', 'admin', '1', '127.0.0.1', '', '1436240488', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('255', 'admin', '1', '127.0.0.1', '', '1436240505', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('256', 'admin', '1', '127.0.0.1', '', '1436240705', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('257', 'admin', '1', '127.0.0.1', '', '1436240712', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('258', 'admin', '1', '127.0.0.1', '', '1436240856', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('259', 'admin', '1', '127.0.0.1', '', '1436241021', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('260', 'admin', '1', '127.0.0.1', '', '1436241046', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('261', 'admin', '1', '127.0.0.1', '', '1436241056', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('262', 'admin', '1', '127.0.0.1', '', '1436241060', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('263', 'admin', '1', '127.0.0.1', '', '1436241060', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('264', 'admin', '1', '127.0.0.1', '', '1436241253', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('265', 'admin', '1', '127.0.0.1', '', '1436241261', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('266', 'admin', '1', '127.0.0.1', '', '1436241264', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('267', 'admin', '1', '127.0.0.1', '', '1436241311', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('268', 'admin', '1', '127.0.0.1', '', '1436241317', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('269', 'admin', '1', '127.0.0.1', '', '1436241322', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('270', 'admin', '1', '127.0.0.1', '', '1436241338', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('271', 'admin', '1', '127.0.0.1', '', '1436241435', '管理员', '编辑了用户组：test2');
INSERT INTO `bk_action_log` VALUES ('272', 'admin', '1', '127.0.0.1', '', '1436241449', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('273', 'admin', '1', '127.0.0.1', '', '1436241533', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('274', 'test', '2', '127.0.0.1', '', '1436241545', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('275', 'test', '2', '127.0.0.1', '', '1436241556', 'test', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('276', 'test', '2', '127.0.0.1', '', '1436241995', 'test', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('277', 'admin', '1', '127.0.0.1', '', '1436242006', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('278', 'admin', '1', '127.0.0.1', '', '1436242054', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('279', 'admin', '1', '127.0.0.1', '', '1436242083', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('280', 'admin', '1', '127.0.0.1', '', '1436242180', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('281', 'admin', '1', '127.0.0.1', '', '1436242954', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('282', 'admin', '1', '127.0.0.1', '', '1436242957', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('283', 'admin', '1', '127.0.0.1', '', '1436242960', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('284', 'admin', '1', '127.0.0.1', '', '1436242963', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('285', 'admin', '1', '127.0.0.1', '', '1436242986', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('286', 'admin', '1', '127.0.0.1', '', '1436242989', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('287', 'admin', '1', '127.0.0.1', '', '1436244454', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('288', 'admin', '1', '127.0.0.1', '', '1436245828', '管理员', '编辑了用户组：test2');
INSERT INTO `bk_action_log` VALUES ('289', 'admin', '1', '127.0.0.1', '', '1436246346', '管理员', '删除了用户组：test2');
INSERT INTO `bk_action_log` VALUES ('290', 'admin', '1', '127.0.0.1', '', '1436246373', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('291', 'admin', '1', '127.0.0.1', '', '1436247233', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('292', 'admin', '1', '127.0.0.1', '', '1436321211', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('293', 'admin', '1', '127.0.0.1', '', '1436325559', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('294', 'admin', '1', '127.0.0.1', '', '1436499013', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('295', 'admin', '1', '127.0.0.1', '', '1436500439', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('296', 'admin', '1', '127.0.0.1', '', '1436501830', '管理员', '增加了新的工作流：测试辅助权限工作流');
INSERT INTO `bk_action_log` VALUES ('297', 'admin', '1', '127.0.0.1', '', '1436501908', '管理员', '编辑了工作流：测试辅助权限工作流');
INSERT INTO `bk_action_log` VALUES ('298', 'admin', '1', '127.0.0.1', '', '1436504505', '管理员', '增加了新的工作流步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('299', 'admin', '1', '127.0.0.1', '', '1436504716', '管理员', '编辑了工作流步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('300', 'admin', '1', '127.0.0.1', '', '1436504733', '管理员', '增加了新的工作流步骤：123');
INSERT INTO `bk_action_log` VALUES ('301', 'admin', '1', '127.0.0.1', '', '1436504748', '管理员', '编辑了工作流步骤：123');
INSERT INTO `bk_action_log` VALUES ('302', 'admin', '1', '127.0.0.1', '', '1436504788', '管理员', '增加了新的工作流步骤：测试辅助权限工作流步骤2');
INSERT INTO `bk_action_log` VALUES ('303', 'admin', '1', '127.0.0.1', '', '1436504811', '管理员', '编辑了工作流步骤：测试辅助权限工作流步骤2');
INSERT INTO `bk_action_log` VALUES ('304', 'admin', '1', '127.0.0.1', '', '1436504822', '管理员', '编辑了工作流步骤：测试辅助权限工作流步骤2');
INSERT INTO `bk_action_log` VALUES ('305', 'admin', '1', '127.0.0.1', '', '1436504830', '管理员', '编辑了工作流步骤：123');
INSERT INTO `bk_action_log` VALUES ('306', 'admin', '1', '127.0.0.1', '', '1436504841', '管理员', '增加了新的工作流步骤：123123gg');
INSERT INTO `bk_action_log` VALUES ('307', 'admin', '1', '127.0.0.1', '', '1436504850', '管理员', '编辑了工作流步骤：123123gg');
INSERT INTO `bk_action_log` VALUES ('308', 'admin', '1', '127.0.0.1', '', '1436504859', '管理员', '删除了工作流步骤：123');
INSERT INTO `bk_action_log` VALUES ('309', 'admin', '1', '127.0.0.1', '', '1436504863', '管理员', '删除了工作流步骤：123123gg');
INSERT INTO `bk_action_log` VALUES ('310', 'admin', '1', '127.0.0.1', '', '1436504877', '管理员', '关联了用户：test 到工作流：测试辅助权限工作流 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('311', 'admin', '1', '127.0.0.1', '', '1436504877', '管理员', '关联了用户：管理员 到工作流：测试辅助权限工作流 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('312', 'admin', '1', '127.0.0.1', '', '1436504889', '管理员', '关联了用户：1 到工作流：测试辅助权限工作流 中的审核步骤：测试辅助权限工作流步骤2');
INSERT INTO `bk_action_log` VALUES ('313', 'admin', '1', '127.0.0.1', '', '1436509226', '管理员', '关联了用户：1 到工作流：测试工作流 中的审核步骤：测试2');
INSERT INTO `bk_action_log` VALUES ('314', 'admin', '1', '127.0.0.1', '', '1436510712', '管理员', '增加了新的工作流：辅助权限测试2');
INSERT INTO `bk_action_log` VALUES ('315', 'admin', '1', '127.0.0.1', '', '1436510726', '管理员', '编辑了工作流：辅助权限测试2');
INSERT INTO `bk_action_log` VALUES ('316', 'admin', '1', '127.0.0.1', '', '1436510735', '管理员', '编辑了工作流：辅助权限测试2');
INSERT INTO `bk_action_log` VALUES ('317', 'admin', '1', '127.0.0.1', '', '1436510752', '管理员', '删除了工作流：测试辅助权限工作流');
INSERT INTO `bk_action_log` VALUES ('318', 'admin', '1', '127.0.0.1', '', '1436510782', '管理员', '增加了新的工作流步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('319', 'admin', '1', '127.0.0.1', '', '1436510790', '管理员', '编辑了工作流步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('320', 'admin', '1', '127.0.0.1', '', '1436510821', '管理员', '增加了新的工作流步骤：234');
INSERT INTO `bk_action_log` VALUES ('321', 'admin', '1', '127.0.0.1', '', '1436510828', '管理员', '删除了工作流步骤：234');
INSERT INTO `bk_action_log` VALUES ('322', 'admin', '1', '127.0.0.1', '', '1436510854', '管理员', '关联了用户：test 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('323', 'admin', '1', '127.0.0.1', '', '1436510871', '管理员', '删除了工作流：工作流1');
INSERT INTO `bk_action_log` VALUES ('324', 'admin', '1', '127.0.0.1', '', '1436510894', '管理员', '增加了新的工作流：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('325', 'admin', '1', '127.0.0.1', '', '1436510906', '管理员', '编辑了工作流：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('326', 'admin', '1', '127.0.0.1', '', '1436510918', '管理员', '增加了新的工作流步骤：123123');
INSERT INTO `bk_action_log` VALUES ('327', 'admin', '1', '127.0.0.1', '', '1436510925', '管理员', '编辑了工作流步骤：123123');
INSERT INTO `bk_action_log` VALUES ('328', 'admin', '1', '127.0.0.1', '', '1436510933', '管理员', '关联了用户：管理员 到工作流：123123ffffffff 中的审核步骤：123123');
INSERT INTO `bk_action_log` VALUES ('329', 'admin', '1', '127.0.0.1', '', '1436510945', '管理员', '删除了工作流：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('330', 'admin', '1', '127.0.0.1', '', '1439442301', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('331', 'admin', '1', '127.0.0.1', '', '1439442348', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('332', 'admin', '1', '127.0.0.1', '', '1439881984', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('333', 'admin', '1', '127.0.0.1', '', '1439958807', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('334', 'admin', '1', '127.0.0.1', '', '1440127383', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('335', 'admin', '1', '127.0.0.1', '', '1440141329', '管理员', '编辑了用户组：test');
INSERT INTO `bk_action_log` VALUES ('336', 'admin', '1', '127.0.0.1', '', '1440141343', '管理员', '编辑了用户组：test');
INSERT INTO `bk_action_log` VALUES ('337', 'admin', '1', '127.0.0.1', '', '1440141382', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('338', 'admin', '1', '127.0.0.1', '', '1440141971', '管理员', '删除了系统用户：test2');
INSERT INTO `bk_action_log` VALUES ('339', 'admin', '1', '127.0.0.1', '', '1440142130', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('340', 'admin', '1', '127.0.0.1', '', '1440143103', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('341', 'admin', '1', '127.0.0.1', '', '1440144726', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('342', 'test', '2', '127.0.0.1', '', '1440400566', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('343', 'admin', '1', '127.0.0.1', '', '1440553533', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('344', 'admin', '1', '127.0.0.1', '', '1440732870', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('345', 'admin', '1', '127.0.0.1', '', '1440732901', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('346', 'admin', '1', '127.0.0.1', '', '1440733134', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('347', 'admin', '1', '127.0.0.1', '', '1440733178', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('348', 'admin', '1', '127.0.0.1', '', '1440733192', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('349', 'admin', '1', '127.0.0.1', '', '1440747027', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('350', 'admin', '1', '127.0.0.1', '', '1440752422', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('351', 'admin', '1', '127.0.0.1', '', '1440752521', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('352', 'admin', '1', '127.0.0.1', '', '1440986204', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('353', 'admin', '1', '127.0.0.1', '', '1440987027', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('354', 'admin', '1', '127.0.0.1', '', '1440987038', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('355', 'admin', '1', '127.0.0.1', '', '1440990388', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('356', 'admin', '1', '172.16.1.16', '', '1440996634', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('357', 'admin', '1', '172.16.1.29', '', '1440997574', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('358', 'admin', '1', '172.16.1.29', '', '1440998409', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('359', 'admin', '1', '172.16.1.16', '', '1441010130', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('360', 'admin', '1', '127.0.0.1', '', '1441072471', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('361', 'admin', '1', '127.0.0.1', '', '1441073024', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('362', 'admin', '1', '127.0.0.1', '', '1441076322', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('363', 'admin', '1', '127.0.0.1', '', '1441076696', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('364', 'admin', '1', '127.0.0.1', '', '1441076910', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('365', 'admin', '1', '127.0.0.1', '', '1441078414', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('366', 'admin', '1', '127.0.0.1', '', '1441078679', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('367', 'admin', '1', '127.0.0.1', '', '1441078735', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('368', 'admin', '1', '127.0.0.1', '', '1441078764', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('369', 'admin', '1', '127.0.0.1', '', '1441081431', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('370', 'admin', '1', '127.0.0.1', '', '1441089446', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('371', 'admin', '1', '127.0.0.1', '', '1441089832', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('372', 'admin', '1', '127.0.0.1', '', '1441091508', '管理员', '编辑了工作流步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('373', 'admin', '1', '127.0.0.1', '', '1441095278', '管理员', '关联了用户：test 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('374', 'admin', '1', '127.0.0.1', '', '1441095278', '管理员', '关联了用户：管理员 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('375', 'admin', '1', '127.0.0.1', '', '1441164748', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('376', 'admin', '1', '127.0.0.1', '', '1441165379', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('377', 'admin', '1', '127.0.0.1', '', '1441166728', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('378', 'admin', '1', '127.0.0.1', '', '1441182102', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('379', 'admin', '1', '127.0.0.1', '', '1441184294', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('380', 'test', '2', '127.0.0.1', '', '1441184308', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('381', 'admin', '1', '127.0.0.1', '', '1441184420', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('382', 'admin', '1', '127.0.0.1', '', '1441184455', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('383', 'test', '2', '127.0.0.1', '', '1441184462', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('384', 'admin', '1', '127.0.0.1', '', '1441504557', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('385', 'admin', '1', '127.0.0.1', '', '1441514297', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('386', 'admin', '1', '127.0.0.1', '', '1441520184', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('387', 'admin', '1', '127.0.0.1', '', '1441593767', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('388', 'admin', '1', '127.0.0.1', '', '1441593826', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('389', 'admin', '1', '127.0.0.1', '', '1441595735', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('390', 'admin', '1', '127.0.0.1', '', '1441596952', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('391', 'test', '2', '127.0.0.1', '', '1441596968', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('392', 'admin', '1', '127.0.0.1', '', '1441597272', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('393', 'test', '2', '127.0.0.1', '', '1441597346', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('394', 'admin', '1', '127.0.0.1', '', '1441598281', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('395', 'admin', '1', '127.0.0.1', '', '1441598300', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('396', 'test', '2', '127.0.0.1', '', '1441598310', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('397', 'admin', '1', '127.0.0.1', '', '1441598447', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('398', 'admin', '1', '127.0.0.1', '', '1441599182', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('399', 'admin', '1', '127.0.0.1', '', '1441599228', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('400', 'admin', '1', '127.0.0.1', '', '1441599787', '管理员', '增加了新的工作流步骤：测试日志记录');
INSERT INTO `bk_action_log` VALUES ('401', 'admin', '1', '127.0.0.1', '', '1441599912', '管理员', '编辑了文章：测试日志记录');
INSERT INTO `bk_action_log` VALUES ('402', 'admin', '1', '127.0.0.1', '', '1441600083', '管理员', '编辑了文章：测试日志记录');
INSERT INTO `bk_action_log` VALUES ('403', 'admin', '1', '127.0.0.1', '', '1441600107', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('404', 'admin', '1', '127.0.0.1', '', '1441600410', '管理员', '删除了文章：测试日志记录');
INSERT INTO `bk_action_log` VALUES ('405', 'admin', '1', '127.0.0.1', '', '1441600410', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('406', 'admin', '1', '127.0.0.1', '', '1441600880', '管理员', '关联了文章：ZeroClipboard插件如何批量初始化。 到推荐位 原创首页金融头条');
INSERT INTO `bk_action_log` VALUES ('407', 'admin', '1', '127.0.0.1', '', '1441600880', '管理员', '关联了文章：ZeroClipboard插件如何批量初始化。 到推荐位 原创首页汽车头条');
INSERT INTO `bk_action_log` VALUES ('408', 'admin', '1', '127.0.0.1', '', '1441600880', '管理员', '关联了文章：[centos软件安装]iftop的安装 到推荐位 原创首页金融头条');
INSERT INTO `bk_action_log` VALUES ('409', 'admin', '1', '127.0.0.1', '', '1441600880', '管理员', '关联了文章：[centos软件安装]iftop的安装 到推荐位 原创首页汽车头条');
INSERT INTO `bk_action_log` VALUES ('410', 'admin', '1', '127.0.0.1', '', '1441601038', '管理员', '关联了文章：[centos使用记录]如何启动多个php-fpm且互不影响？ 到推荐位 原创首页时尚头条');
INSERT INTO `bk_action_log` VALUES ('411', 'admin', '1', '127.0.0.1', '', '1441601038', '管理员', '关联了文章：sphinx全文搜索Php方面的处理 到推荐位 原创首页时尚头条');
INSERT INTO `bk_action_log` VALUES ('412', 'admin', '1', '127.0.0.1', '', '1441601584', '管理员', '增加了新的文章分类：测试文章分类');
INSERT INTO `bk_action_log` VALUES ('413', 'admin', '1', '127.0.0.1', '', '1441601602', '管理员', '编辑了文章：:title');
INSERT INTO `bk_action_log` VALUES ('414', 'admin', '1', '127.0.0.1', '', '1441601627', '管理员', '编辑了文章分类：测试文章分类');
INSERT INTO `bk_action_log` VALUES ('415', 'admin', '1', '127.0.0.1', '', '1441601838', '管理员', '删除了文章分类：测试文章分类');
INSERT INTO `bk_action_log` VALUES ('416', 'admin', '1', '127.0.0.1', '', '1441606229', '管理员', '增加了新的文章推荐位：测试');
INSERT INTO `bk_action_log` VALUES ('417', 'admin', '1', '127.0.0.1', '', '1441606278', '管理员', '编辑了文章推荐位：测试');
INSERT INTO `bk_action_log` VALUES ('418', 'admin', '1', '127.0.0.1', '', '1441606421', '管理员', '编辑了文章推荐位：测试');
INSERT INTO `bk_action_log` VALUES ('419', 'admin', '1', '127.0.0.1', '', '1441606536', '管理员', '删除了文章推荐位：测试');
INSERT INTO `bk_action_log` VALUES ('420', 'admin', '1', '127.0.0.1', '', '1441607682', '管理员', '文章 [centos使用记录]如何启动多个php-fpm且互不影响？，推荐位：原创首页时尚头条，取消了关联');
INSERT INTO `bk_action_log` VALUES ('421', 'admin', '1', '127.0.0.1', '', '1441608226', '管理员', '排序了推荐位：原创首页移动互联网头条');
INSERT INTO `bk_action_log` VALUES ('422', 'admin', '1', '127.0.0.1', '', '1441608316', '管理员', '文章 sphinx全文搜索Php方面的处理，推荐位：原创首页移动互联网头条，取消了关联');
INSERT INTO `bk_action_log` VALUES ('423', 'admin', '1', '127.0.0.1', '', '1441608316', '管理员', '文章 [centos使用记录]如何启动多个php-fpm且互不影响？，推荐位：原创首页移动互联网头条，取消了关联');
INSERT INTO `bk_action_log` VALUES ('424', 'admin', '1', '127.0.0.1', '', '1441608652', '管理员', '删除了文章标签：123');
INSERT INTO `bk_action_log` VALUES ('425', 'admin', '1', '127.0.0.1', '', '1441608962', '管理员', '删除了文章标签：真的不错');
INSERT INTO `bk_action_log` VALUES ('426', 'admin', '1', '127.0.0.1', '', '1441608962', '管理员', '删除了文章标签：不错哦');
INSERT INTO `bk_action_log` VALUES ('427', 'admin', '1', '127.0.0.1', '', '1441608982', '管理员', '删除了文章评论：不错不错');
INSERT INTO `bk_action_log` VALUES ('428', 'admin', '1', '127.0.0.1', '', '1441608982', '管理员', '删除了文章评论：不错，楼主威武');
INSERT INTO `bk_action_log` VALUES ('429', 'admin', '1', '127.0.0.1', '', '1441610034', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('430', 'admin', '1', '127.0.0.1', '', '1441610141', '管理员', '回复了文章[[php扩展安装]opcache的安装]的评论[123123]，回复内容为[123123]');
INSERT INTO `bk_action_log` VALUES ('431', 'admin', '1', '127.0.0.1', '', '1441610191', '管理员', '删除了文章评论：牛B');
INSERT INTO `bk_action_log` VALUES ('432', 'admin', '1', '127.0.0.1', '', '1441610191', '管理员', '删除了文章评论：123');
INSERT INTO `bk_action_log` VALUES ('433', 'admin', '1', '127.0.0.1', '', '1441610191', '管理员', '删除了文章评论：123123');
INSERT INTO `bk_action_log` VALUES ('434', 'admin', '1', '127.0.0.1', '', '1441610191', '管理员', '删除了文章评论：123123');
INSERT INTO `bk_action_log` VALUES ('435', 'admin', '1', '127.0.0.1', '', '1441610191', '管理员', '删除了文章评论：123123');
INSERT INTO `bk_action_log` VALUES ('436', 'admin', '1', '127.0.0.1', '', '1441610218', '管理员', '回复了文章[[php扩展安装]opcache的安装]的评论[谢谢，谢谢]，回复内容为[hi, Tomy，已经补上简单的配置。]');
INSERT INTO `bk_action_log` VALUES ('437', 'admin', '1', '127.0.0.1', '', '1441610277', '管理员', '回复了文章[[php扩展安装]opcache的安装]的评论[谢谢，谢谢]，回复内容为[虎虎，好的。]');
INSERT INTO `bk_action_log` VALUES ('438', 'admin', '1', '127.0.0.1', '', '1441610309', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('439', 'test', '2', '127.0.0.1', '', '1441610467', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('440', 'admin', '1', '127.0.0.1', '', '1441612168', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('441', 'admin', '1', '127.0.0.1', '', '1441616855', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('442', 'admin', '1', '127.0.0.1', '', '1441617330', '管理员', '回复了文章[[centos软件安装]phpng的安装]的评论[不懂为什么用ab测试简单的一个脚本，phpng的比php5.5.x的慢了好几倍，为什么呢？]，回复内容为[你问我，我问谁啊]');
INSERT INTO `bk_action_log` VALUES ('443', 'admin', '1', '127.0.0.1', '', '1441685543', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('444', 'admin', '1', '127.0.0.1', '', '1441685675', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('445', 'admin', '1', '127.0.0.1', '', '1441687531', '管理员', '文章 ZeroClipboard插件如何批量初始化。，推荐位：测试推荐位，取消了关联');
INSERT INTO `bk_action_log` VALUES ('446', 'admin', '1', '127.0.0.1', '', '1441689658', '管理员', '增加了新的工作流：test');
INSERT INTO `bk_action_log` VALUES ('447', 'admin', '1', '127.0.0.1', '', '1441689668', '管理员', '编辑了工作流：test');
INSERT INTO `bk_action_log` VALUES ('448', 'admin', '1', '127.0.0.1', '', '1441689685', '管理员', '增加了新的工作流步骤：test123123');
INSERT INTO `bk_action_log` VALUES ('449', 'admin', '1', '127.0.0.1', '', '1441689708', '管理员', '增加了新的工作流步骤：23234');
INSERT INTO `bk_action_log` VALUES ('450', 'admin', '1', '127.0.0.1', '', '1441689718', '管理员', '编辑了工作流步骤：test123123');
INSERT INTO `bk_action_log` VALUES ('451', 'admin', '1', '127.0.0.1', '', '1441689729', '管理员', '关联了用户：test 到工作流：test 中的审核步骤：test123123');
INSERT INTO `bk_action_log` VALUES ('452', 'admin', '1', '127.0.0.1', '', '1441689729', '管理员', '关联了用户：管理员 到工作流：test 中的审核步骤：test123123');
INSERT INTO `bk_action_log` VALUES ('453', 'admin', '1', '127.0.0.1', '', '1441689737', '管理员', '删除了工作流步骤：test123123');
INSERT INTO `bk_action_log` VALUES ('454', 'admin', '1', '127.0.0.1', '', '1441689742', '管理员', '删除了工作流步骤：23234');
INSERT INTO `bk_action_log` VALUES ('455', 'admin', '1', '127.0.0.1', '', '1441689766', '管理员', '编辑了工作流：test');
INSERT INTO `bk_action_log` VALUES ('456', 'admin', '1', '127.0.0.1', '', '1441689776', '管理员', '删除了工作流：test');
INSERT INTO `bk_action_log` VALUES ('457', 'admin', '1', '127.0.0.1', '', '1441689806', '管理员', '增加了新的系统用户：123123');
INSERT INTO `bk_action_log` VALUES ('458', 'admin', '1', '127.0.0.1', '', '1441689820', '管理员', '改变了用户的权限：123123');
INSERT INTO `bk_action_log` VALUES ('459', 'admin', '1', '127.0.0.1', '', '1441689829', '管理员', '删除了系统用户：123123');
INSERT INTO `bk_action_log` VALUES ('460', 'admin', '1', '127.0.0.1', '', '1441689892', '管理员', '关联了文章：ZeroClipboard插件如何批量初始化。 到推荐位 原创首页汽车头条');
INSERT INTO `bk_action_log` VALUES ('461', 'admin', '1', '127.0.0.1', '', '1441689892', '管理员', '关联了文章：[centos软件安装]iftop的安装 到推荐位 原创首页汽车头条');
INSERT INTO `bk_action_log` VALUES ('462', 'admin', '1', '127.0.0.1', '', '1441689946', '管理员', '排序了推荐位：原创首页汽车头条');
INSERT INTO `bk_action_log` VALUES ('463', 'admin', '1', '127.0.0.1', '', '1441689952', '管理员', '文章 [centos软件安装]iftop的安装，推荐位：原创首页汽车头条，取消了关联');
INSERT INTO `bk_action_log` VALUES ('464', 'admin', '1', '127.0.0.1', '', '1441689976', '管理员', '删除了文章评论：你问我，我问谁啊');
INSERT INTO `bk_action_log` VALUES ('465', 'admin', '1', '127.0.0.1', '', '1441689997', '管理员', '回复了文章[[php扩展安装]opcache的安装]的评论[虎虎，好的。]，回复内容为[哈哈]');
INSERT INTO `bk_action_log` VALUES ('466', 'admin', '1', '127.0.0.1', '', '1441692588', '管理员', '删除了文章评论：哈哈');
INSERT INTO `bk_action_log` VALUES ('467', 'admin', '1', '127.0.0.1', '', '1441703310', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('468', 'admin', '1', '127.0.0.1', '', '1441763767', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('469', 'admin', '1', '127.0.0.1', '', '1441858886', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('470', 'admin', '1', '127.0.0.1', '', '1441874439', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('471', 'admin', '1', '127.0.0.1', '', '1441874933', '管理员', '删除了文章评论：那是当然，我从来不骗人的。');
INSERT INTO `bk_action_log` VALUES ('472', 'admin', '1', '127.0.0.1', '', '1441874933', '管理员', '删除了文章评论：谢谢，谢谢');
INSERT INTO `bk_action_log` VALUES ('473', 'admin', '1', '127.0.0.1', '', '1441874933', '管理员', '删除了文章评论：虎虎，好的。');
INSERT INTO `bk_action_log` VALUES ('474', 'admin', '1', '127.0.0.1', '', '1441874945', '管理员', '删除了文章评论：好的哦。');
INSERT INTO `bk_action_log` VALUES ('475', 'admin', '1', '127.0.0.1', '', '1441874983', '管理员', '回复了文章[[php扩展安装]opcache的安装]的评论[很好]，回复内容为[什么鬼东西]');
INSERT INTO `bk_action_log` VALUES ('476', 'admin', '1', '127.0.0.1', '', '1441936203', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('477', 'admin', '1', '127.0.0.1', '', '1441937322', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('478', 'admin', '1', '127.0.0.1', '', '1441937492', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('479', 'admin', '1', '127.0.0.1', '', '1441939999', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('480', 'admin', '1', '127.0.0.1', '', '1441940010', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('481', 'admin', '1', '127.0.0.1', '', '1441940588', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('482', 'admin', '1', '127.0.0.1', '', '1441940595', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('483', 'admin', '1', '127.0.0.1', '', '1441941493', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('484', 'admin', '1', '127.0.0.1', '', '1441941504', '管理员', '编辑了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('485', 'admin', '1', '127.0.0.1', '', '1441941509', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('486', 'admin', '1', '127.0.0.1', '', '1441942837', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('487', 'admin', '1', '127.0.0.1', '', '1441942844', '管理员', '编辑了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('488', 'admin', '1', '127.0.0.1', '', '1441942952', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('489', 'admin', '1', '127.0.0.1', '', '1441944088', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('490', 'admin', '1', '127.0.0.1', '', '1441944179', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('491', 'admin', '1', '127.0.0.1', '', '1441944205', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('492', 'admin', '1', '127.0.0.1', '', '1441944722', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('493', 'admin', '1', '127.0.0.1', '', '1441944754', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('494', 'admin', '1', '127.0.0.1', '', '1441944854', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('495', 'admin', '1', '127.0.0.1', '', '1441945875', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('496', 'admin', '1', '127.0.0.1', '', '1441947379', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('497', 'admin', '1', '127.0.0.1', '', '1441952605', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('498', 'admin', '1', '127.0.0.1', '', '1441952617', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('499', 'admin', '1', '127.0.0.1', '', '1441952629', '管理员', '编辑了文章：自动备份mysql数据库脚本');
INSERT INTO `bk_action_log` VALUES ('500', 'admin', '1', '127.0.0.1', '', '1441952636', '管理员', '编辑了文章：centos 使用过程中遇到的问题笔记');
INSERT INTO `bk_action_log` VALUES ('501', 'admin', '1', '127.0.0.1', '', '1441952644', '管理员', '编辑了文章：OpenVPN使用问题总结。');
INSERT INTO `bk_action_log` VALUES ('502', 'admin', '1', '127.0.0.1', '', '1441952683', '管理员', '编辑了文章：OpenVPN server端配置文件详细说明');
INSERT INTO `bk_action_log` VALUES ('503', 'admin', '1', '127.0.0.1', '', '1441952696', '管理员', '编辑了文章：How To Install OpenVPN On CentOS 7');
INSERT INTO `bk_action_log` VALUES ('504', 'admin', '1', '127.0.0.1', '', '1441952713', '管理员', '编辑了文章：[centos软件安装]openvpn的安装与配置');
INSERT INTO `bk_action_log` VALUES ('505', 'admin', '1', '127.0.0.1', '', '1441952756', '管理员', '编辑了文章：如何把网页生成imges,pdf？');
INSERT INTO `bk_action_log` VALUES ('506', 'admin', '1', '127.0.0.1', '', '1441952763', '管理员', '编辑了文章：[centos软件安装]phpng的安装');
INSERT INTO `bk_action_log` VALUES ('507', 'admin', '1', '127.0.0.1', '', '1441952772', '管理员', '编辑了文章：[php扩展安装]opcache的安装');
INSERT INTO `bk_action_log` VALUES ('508', 'admin', '1', '127.0.0.1', '', '1441952780', '管理员', '编辑了文章：[centos软件安装]如何独立安装apache的ab？');
INSERT INTO `bk_action_log` VALUES ('509', 'admin', '1', '127.0.0.1', '', '1441952788', '管理员', '编辑了文章：sphinx全文搜索Php方面的处理');
INSERT INTO `bk_action_log` VALUES ('510', 'admin', '1', '127.0.0.1', '', '1441952795', '管理员', '编辑了文章：[centos使用记录]如何启动多个php-fpm且互不影响？');
INSERT INTO `bk_action_log` VALUES ('511', 'admin', '1', '127.0.0.1', '', '1441952802', '管理员', '编辑了文章：[centos软件安装]iftop的安装');
INSERT INTO `bk_action_log` VALUES ('512', 'admin', '1', '127.0.0.1', '', '1441952813', '管理员', '编辑了文章：ZeroClipboard插件如何批量初始化。');
INSERT INTO `bk_action_log` VALUES ('513', 'admin', '1', '127.0.0.1', '', '1441952820', '管理员', '编辑了文章：[svn相关]使用记录');
INSERT INTO `bk_action_log` VALUES ('514', 'admin', '1', '127.0.0.1', '', '1441952842', '管理员', '编辑了文章：[centos问题集]yum install时报warning: rpmts_HdrFromFdno: Header V3 RSA/SHA256 Signature, key ID c105b9de: NOKEY');
INSERT INTO `bk_action_log` VALUES ('515', 'admin', '1', '127.0.0.1', '', '1441952855', '管理员', '编辑了文章：[问题集]重写session类的时候可能会导至nginx 502的问题的原因');
INSERT INTO `bk_action_log` VALUES ('516', 'admin', '1', '127.0.0.1', '', '1441952862', '管理员', '编辑了文章：[问题集]两个不同用户执行生成同一个文件所导至的读取权限问题。');
INSERT INTO `bk_action_log` VALUES ('517', 'admin', '1', '127.0.0.1', '', '1441952869', '管理员', '编辑了文章：[php扩展的安装]sphinx扩展的安装');
INSERT INTO `bk_action_log` VALUES ('518', 'admin', '1', '127.0.0.1', '', '1441952876', '管理员', '编辑了文章：[centos软件安装]sphinx的安装与配置以及php方面的处理');
INSERT INTO `bk_action_log` VALUES ('519', 'admin', '1', '127.0.0.1', '', '1441952883', '管理员', '编辑了文章：[centos软件安装]subversion的安装与多项目权限配置');
INSERT INTO `bk_action_log` VALUES ('520', 'admin', '1', '127.0.0.1', '', '1441952890', '管理员', '编辑了文章：[centos软件安装]安装memcached');
INSERT INTO `bk_action_log` VALUES ('521', 'admin', '1', '127.0.0.1', '', '1441952898', '管理员', '编辑了文章：[php扩展安装]为php安装memcached扩展');
INSERT INTO `bk_action_log` VALUES ('522', 'admin', '1', '127.0.0.1', '', '1441952905', '管理员', '编辑了文章：[php扩展安装]为php安装redis扩展');
INSERT INTO `bk_action_log` VALUES ('523', 'admin', '1', '127.0.0.1', '', '1441952911', '管理员', '编辑了文章：[Zephir官方文档翻译之一] 欢迎来到Zephir！');
INSERT INTO `bk_action_log` VALUES ('524', 'admin', '1', '127.0.0.1', '', '1441952919', '管理员', '编辑了文章：[Zephir官方文档翻译之二] 为什么选择 Zephir?');
INSERT INTO `bk_action_log` VALUES ('525', 'admin', '1', '127.0.0.1', '', '1441952925', '管理员', '编辑了文章：[Zephir官方文档翻译之三]  介绍 Zephir');
INSERT INTO `bk_action_log` VALUES ('526', 'admin', '1', '127.0.0.1', '', '1441952932', '管理员', '编辑了文章：[Zephir官方文档翻译之四] 安装Zephir');
INSERT INTO `bk_action_log` VALUES ('527', 'admin', '1', '127.0.0.1', '', '1441952964', '管理员', '编辑了文章：[Zephir官方文档翻译之五] 入门指导');
INSERT INTO `bk_action_log` VALUES ('528', 'admin', '1', '127.0.0.1', '', '1441969453', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('529', 'admin', '1', '127.0.0.1', '', '1441980183', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('530', 'admin', '1', '127.0.0.1', '', '1441980743', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('531', 'admin', '1', '127.0.0.1', '', '1441980918', '管理员', '编辑了工作流步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('532', 'admin', '1', '127.0.0.1', '', '1441980921', '管理员', '关联了用户：test 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('533', 'admin', '1', '127.0.0.1', '', '1441980921', '管理员', '关联了用户：管理员 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('534', 'admin', '1', '127.0.0.1', '', '1441980928', '管理员', '编辑了系统用户：test');
INSERT INTO `bk_action_log` VALUES ('535', 'admin', '1', '127.0.0.1', '', '1441980934', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('536', 'admin', '1', '127.0.0.1', '', '1441981059', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('537', 'admin', '1', '127.0.0.1', '', '1441981172', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('538', 'admin', '1', '127.0.0.1', '', '1441981184', '管理员', '编辑了系统用户：test');
INSERT INTO `bk_action_log` VALUES ('539', 'admin', '1', '127.0.0.1', '', '1441981188', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('540', 'admin', '1', '127.0.0.1', '', '1447768881', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('541', 'admin', '1', '127.0.0.1', '', '1447768890', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('542', 'admin', '1', '127.0.0.1', '', '1447769332', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('543', 'admin', '1', '127.0.0.1', '', '1447769550', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('544', 'admin', '1', '127.0.0.1', '', '1447769605', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('545', 'admin', '1', '127.0.0.1', '', '1447769663', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('546', 'admin', '1', '127.0.0.1', '', '1447769937', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('547', 'admin', '1', '127.0.0.1', '', '1447770298', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('548', 'admin', '1', '127.0.0.1', '', '1447771117', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('549', 'admin', '1', '127.0.0.1', '', '1447771635', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('550', 'admin', '1', '127.0.0.1', '', '1447838472', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('551', 'admin', '1', '127.0.0.1', '', '1447839200', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('552', 'admin', '1', '127.0.0.1', '', '1447840375', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('553', 'admin', '1', '127.0.0.1', '', '1447841987', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('554', 'admin', '1', '127.0.0.1', '', '1447842023', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('555', 'admin', '1', '127.0.0.1', '', '1447842499', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('556', 'admin', '1', '127.0.0.1', '', '1447842624', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('557', 'admin', '1', '127.0.0.1', '', '1447842627', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('558', 'admin', '1', '127.0.0.1', '', '1447842727', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('559', 'admin', '1', '127.0.0.1', '', '1447842753', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('560', 'admin', '1', '127.0.0.1', '', '1447842890', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('561', 'admin', '1', '127.0.0.1', '', '1447852243', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('562', 'admin', '1', '127.0.0.1', '', '1447852254', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('563', 'admin', '1', '127.0.0.1', '', '1447854400', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('564', 'admin', '1', '127.0.0.1', '', '1447856448', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('565', 'admin', '1', '127.0.0.1', '', '1447857288', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('566', 'admin', '1', '127.0.0.1', '', '1447899336', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('567', 'admin', '1', '127.0.0.1', '', '1447899487', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('568', 'admin', '1', '127.0.0.1', '', '1447906476', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('569', 'admin', '1', '127.0.0.1', '', '1447906503', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('570', 'admin', '1', '127.0.0.1', '', '1447907045', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('571', 'admin', '1', '127.0.0.1', '', '1447907101', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('572', 'admin', '1', '127.0.0.1', '', '1447907167', '管理员', '增加了新的系统用户：funny');
INSERT INTO `bk_action_log` VALUES ('573', 'admin', '1', '127.0.0.1', '', '1447907247', '管理员', '增加了新的系统用户：超前发展y');
INSERT INTO `bk_action_log` VALUES ('574', 'admin', '1', '127.0.0.1', '', '1447908154', '管理员', '增加了新的系统用户：虎皮');
INSERT INTO `bk_action_log` VALUES ('575', 'admin', '1', '127.0.0.1', '', '1447908170', '管理员', '增加了新的系统用户：123');
INSERT INTO `bk_action_log` VALUES ('576', 'admin', '1', '127.0.0.1', '', '1447908520', '管理员', '增加了新的系统用户：柘城');
INSERT INTO `bk_action_log` VALUES ('577', 'admin', '1', '127.0.0.1', '', '1447908528', '管理员', '编辑了系统用户：柘城');
INSERT INTO `bk_action_log` VALUES ('578', 'admin', '1', '127.0.0.1', '', '1447908535', '管理员', '编辑了系统用户：柘城');
INSERT INTO `bk_action_log` VALUES ('579', 'admin', '1', '127.0.0.1', '', '1447908720', '管理员', '编辑了系统用户：123');
INSERT INTO `bk_action_log` VALUES ('580', 'admin', '1', '127.0.0.1', '', '1447908850', '管理员', '编辑了系统用户：柘城');
INSERT INTO `bk_action_log` VALUES ('581', 'admin', '1', '127.0.0.1', '', '1447909533', '管理员', '增加了新的系统用户：asdf');
INSERT INTO `bk_action_log` VALUES ('582', 'admin', '1', '127.0.0.1', '', '1447909539', '管理员', '编辑了系统用户：asdf');
INSERT INTO `bk_action_log` VALUES ('583', 'admin', '1', '127.0.0.1', '', '1447909644', '管理员', '删除了系统用户：柘城');
INSERT INTO `bk_action_log` VALUES ('584', 'admin', '1', '127.0.0.1', '', '1447909964', '管理员', '删除了系统用户：123');
INSERT INTO `bk_action_log` VALUES ('585', 'admin', '1', '127.0.0.1', '', '1447910035', '管理员', '删除了系统用户：虎皮');
INSERT INTO `bk_action_log` VALUES ('586', 'admin', '1', '127.0.0.1', '', '1447910045', '管理员', '删除了系统用户：test');
INSERT INTO `bk_action_log` VALUES ('587', 'admin', '1', '127.0.0.1', '', '1447910065', '管理员', '删除了系统用户：超前发展y');
INSERT INTO `bk_action_log` VALUES ('588', 'admin', '1', '127.0.0.1', '', '1447910187', '管理员', '编辑了系统用户：funny');
INSERT INTO `bk_action_log` VALUES ('589', 'admin', '1', '127.0.0.1', '', '1447911875', '管理员', '增加了新的用户组：柘城1');
INSERT INTO `bk_action_log` VALUES ('590', 'admin', '1', '127.0.0.1', '', '1447911894', '管理员', '增加了新的用户组：压力');
INSERT INTO `bk_action_log` VALUES ('591', 'admin', '1', '127.0.0.1', '', '1447912156', '管理员', '编辑了用户组：压力1');
INSERT INTO `bk_action_log` VALUES ('592', 'admin', '1', '127.0.0.1', '', '1447912165', '管理员', '编辑了用户组：压力1在');
INSERT INTO `bk_action_log` VALUES ('593', 'admin', '1', '127.0.0.1', '', '1447912409', '管理员', '删除了用户组：压力1在');
INSERT INTO `bk_action_log` VALUES ('594', 'admin', '1', '127.0.0.1', '', '1447912443', '管理员', '编辑了用户组：柘城1a');
INSERT INTO `bk_action_log` VALUES ('595', 'admin', '1', '127.0.0.1', '', '1447912449', '管理员', '编辑了用户组：柘城1ab');
INSERT INTO `bk_action_log` VALUES ('596', 'admin', '1', '127.0.0.1', '', '1447912458', '管理员', '增加了新的用户组：asdf');
INSERT INTO `bk_action_log` VALUES ('597', 'admin', '1', '127.0.0.1', '', '1447912462', '管理员', '删除了用户组：asdf');
INSERT INTO `bk_action_log` VALUES ('598', 'admin', '1', '127.0.0.1', '', '1447912465', '管理员', '删除了用户组：柘城1ab');
INSERT INTO `bk_action_log` VALUES ('599', 'admin', '1', '127.0.0.1', '', '1447914894', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('600', 'admin', '1', '127.0.0.1', '', '1447916734', '管理员', '改变了用户的权限：funny');
INSERT INTO `bk_action_log` VALUES ('601', 'admin', '1', '127.0.0.1', '', '1447916955', '管理员', '改变了用户的权限：funny');
INSERT INTO `bk_action_log` VALUES ('602', 'admin', '1', '127.0.0.1', '', '1447917215', '管理员', '改变了用户组的权限：柘城');
INSERT INTO `bk_action_log` VALUES ('603', 'admin', '1', '127.0.0.1', '', '1447917226', '管理员', '改变了用户组的权限：柘城');
INSERT INTO `bk_action_log` VALUES ('604', 'admin', '1', '127.0.0.1', '', '1447927530', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('605', 'admin', '1', '127.0.0.1', '', '1447928974', '管理员', '删除了用户组：柘城');
INSERT INTO `bk_action_log` VALUES ('606', 'admin', '1', '127.0.0.1', '', '1447941118', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('607', 'admin', '1', '127.0.0.1', '', '1447941325', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('608', 'admin', '1', '127.0.0.1', '', '1447941444', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('609', 'admin', '1', '127.0.0.1', '', '1447941599', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('610', 'admin', '1', '127.0.0.1', '', '1447941615', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('611', 'admin', '1', '127.0.0.1', '', '1447943162', '管理员', '增加了新的工作流：sdfasdf');
INSERT INTO `bk_action_log` VALUES ('612', 'admin', '1', '127.0.0.1', '', '1447943176', '管理员', '增加了新的工作流：sdfasdfasdf');
INSERT INTO `bk_action_log` VALUES ('613', 'admin', '1', '127.0.0.1', '', '1447943188', '管理员', '增加了新的工作流：sfsdf');
INSERT INTO `bk_action_log` VALUES ('614', 'admin', '1', '127.0.0.1', '', '1447943463', '管理员', '编辑了工作流：sfsdfaaa');
INSERT INTO `bk_action_log` VALUES ('615', 'admin', '1', '127.0.0.1', '', '1447943518', '管理员', '编辑了工作流：sfsdfaaa');
INSERT INTO `bk_action_log` VALUES ('616', 'admin', '1', '127.0.0.1', '', '1447943531', '管理员', '删除了工作流：sfsdfaaa');
INSERT INTO `bk_action_log` VALUES ('617', 'admin', '1', '127.0.0.1', '', '1447943535', '管理员', '删除了工作流：sdfasdfasdf');
INSERT INTO `bk_action_log` VALUES ('618', 'admin', '1', '127.0.0.1', '', '1447943538', '管理员', '删除了工作流：sdfasdf');
INSERT INTO `bk_action_log` VALUES ('619', 'admin', '1', '127.0.0.1', '', '1447944819', '管理员', '增加了新的工作流：sfsdf');
INSERT INTO `bk_action_log` VALUES ('620', 'admin', '1', '127.0.0.1', '', '1447945175', '管理员', '增加了新的工作流步骤：asdfadsf');
INSERT INTO `bk_action_log` VALUES ('621', 'admin', '1', '127.0.0.1', '', '1447945190', '管理员', '增加了新的工作流步骤：asdfadsf');
INSERT INTO `bk_action_log` VALUES ('622', 'admin', '1', '127.0.0.1', '', '1447945203', '管理员', '增加了新的工作流步骤：asdfsdfsdfaaaaaaaaaaaaaa');
INSERT INTO `bk_action_log` VALUES ('623', 'admin', '1', '127.0.0.1', '', '1447945596', '管理员', '编辑了工作流步骤：asdfadsfadfasdf1');
INSERT INTO `bk_action_log` VALUES ('624', 'admin', '1', '127.0.0.1', '', '1447945685', '管理员', '删除了工作流步骤：asdfadsfadfasdf1');
INSERT INTO `bk_action_log` VALUES ('625', 'admin', '1', '127.0.0.1', '', '1447945693', '管理员', '编辑了工作流步骤：asdfsdfsdfaaaaaaaaaaaaaa');
INSERT INTO `bk_action_log` VALUES ('626', 'admin', '1', '127.0.0.1', '', '1447946224', '管理员', '关联了用户：天天向上 到工作流：sfsdf 中的审核步骤：asdfsdfsdfaaaaaaaaaaaaaa');
INSERT INTO `bk_action_log` VALUES ('627', 'admin', '1', '127.0.0.1', '', '1447946287', '管理员', '增加了新的工作流：1111');
INSERT INTO `bk_action_log` VALUES ('628', 'admin', '1', '127.0.0.1', '', '1447946298', '管理员', '编辑了工作流：1111');
INSERT INTO `bk_action_log` VALUES ('629', 'admin', '1', '127.0.0.1', '', '1447946315', '管理员', '编辑了工作流步骤：asdfsdfxx');
INSERT INTO `bk_action_log` VALUES ('630', 'admin', '1', '127.0.0.1', '', '1447946330', '管理员', '关联了用户：管理员 到工作流：sfsdf 中的审核步骤：asdfadsf');
INSERT INTO `bk_action_log` VALUES ('631', 'admin', '1', '127.0.0.1', '', '1447946340', '管理员', '删除了工作流步骤：asdfadsf');
INSERT INTO `bk_action_log` VALUES ('632', 'admin', '1', '127.0.0.1', '', '1447946498', '管理员', '删除了工作流：1111');
INSERT INTO `bk_action_log` VALUES ('633', 'admin', '1', '127.0.0.1', '', '1447946501', '管理员', '删除了工作流：sfsdf');
INSERT INTO `bk_action_log` VALUES ('634', 'admin', '1', '127.0.0.1', '', '1448028422', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('635', 'admin', '1', '127.0.0.1', '', '1448029796', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('636', 'admin', '1', '127.0.0.1', '', '1448031421', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('637', 'admin', '1', '127.0.0.1', '', '1448031482', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('638', 'admin', '1', '127.0.0.1', '', '1448031720', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('639', 'admin', '1', '127.0.0.1', '', '1448034345', '管理员', '关联了用户：天天向上 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('640', 'admin', '1', '127.0.0.1', '', '1448034345', '管理员', '关联了用户：管理员 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('641', 'admin', '1', '127.0.0.1', '', '1448034367', '管理员', '删除了用户组：柘城');
INSERT INTO `bk_action_log` VALUES ('642', 'admin', '1', '127.0.0.1', '', '1448034370', '管理员', '删除了用户组：柘城');
INSERT INTO `bk_action_log` VALUES ('643', 'admin', '1', '127.0.0.1', '', '1448034373', '管理员', '删除了用户组：test');
INSERT INTO `bk_action_log` VALUES ('644', 'admin', '1', '127.0.0.1', '', '1448034459', '管理员', '删除了系统用户：funny');
INSERT INTO `bk_action_log` VALUES ('645', 'admin', '1', '127.0.0.1', '', '1448073672', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('646', 'admin', '1', '127.0.0.1', '', '1448073840', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('647', 'admin', '1', '127.0.0.1', '', '1448074190', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('648', 'admin', '1', '127.0.0.1', '', '1448074236', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('649', 'admin', '1', '127.0.0.1', '', '1448090287', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('650', 'admin', '1', '127.0.0.1', '', '1448115358', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('651', 'admin', '1', '127.0.0.1', '', '1448116434', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('652', 'admin', '1', '127.0.0.1', '', '1448116568', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('653', 'admin', '1', '127.0.0.1', '', '1448116616', '管理员', '改变了用户组的权限：超级用户组');
INSERT INTO `bk_action_log` VALUES ('654', 'admin', '1', '127.0.0.1', '', '1448116793', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('655', 'admin', '1', '127.0.0.1', '', '1448198042', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('656', 'admin', '1', '127.0.0.1', '', '1448198171', '管理员', '编辑了系统用户：admin');
INSERT INTO `bk_action_log` VALUES ('657', 'admin', '1', '127.0.0.1', '', '1448198307', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('658', 'admin', '1', '127.0.0.1', '', '1448198326', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('659', 'admin', '1', '127.0.0.1', '', '1448198530', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('660', 'admin', '1', '127.0.0.1', '', '1448198821', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('661', 'admin', '1', '127.0.0.1', '', '1448199291', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('662', 'admin', '1', '127.0.0.1', '', '1448254520', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('663', 'admin', '1', '127.0.0.1', '', '1448276699', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('664', 'admin', '1', '127.0.0.1', '', '1448276775', '管理员', '关联了用户：管理员 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('665', 'admin', '1', '127.0.0.1', '', '1448278067', '管理员', '编辑了工作流：辅助权限测试2');
INSERT INTO `bk_action_log` VALUES ('666', 'admin', '1', '127.0.0.1', '', '1448285591', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('667', 'admin', '1', '127.0.0.1', '', '1448339107', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('668', 'admin', '1', '127.0.0.1', '', '1448339469', '管理员', '编辑了系统用户：admin');
INSERT INTO `bk_action_log` VALUES ('669', 'admin', '1', '127.0.0.1', '', '1448339478', '管理员', '增加了新的系统用户：sdfsdf');
INSERT INTO `bk_action_log` VALUES ('670', 'admin', '1', '127.0.0.1', '', '1448339488', '管理员', '编辑了系统用户：sdfsdf');
INSERT INTO `bk_action_log` VALUES ('671', 'admin', '1', '127.0.0.1', '', '1448339492', '管理员', '删除了系统用户：sdfsdf');
INSERT INTO `bk_action_log` VALUES ('672', 'admin', '1', '127.0.0.1', '', '1448339701', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('673', 'admin', '1', '127.0.0.1', '', '1448339708', '管理员', '增加了新的用户组：sdfsdf');
INSERT INTO `bk_action_log` VALUES ('674', 'admin', '1', '127.0.0.1', '', '1448339718', '管理员', '删除了用户组：sdfsdf');
INSERT INTO `bk_action_log` VALUES ('675', 'admin', '1', '127.0.0.1', '', '1448339829', '管理员', '增加了新的用户组：sdf');
INSERT INTO `bk_action_log` VALUES ('676', 'admin', '1', '127.0.0.1', '', '1448339832', '管理员', '编辑了用户组：sdf');
INSERT INTO `bk_action_log` VALUES ('677', 'admin', '1', '127.0.0.1', '', '1448339834', '管理员', '删除了用户组：sdf');
INSERT INTO `bk_action_log` VALUES ('678', 'admin', '1', '127.0.0.1', '', '1448340408', '管理员', '改变了用户组的权限：超级用户组');
INSERT INTO `bk_action_log` VALUES ('679', 'admin', '1', '127.0.0.1', '', '1448340510', '管理员', '增加了新的系统用户：test');
INSERT INTO `bk_action_log` VALUES ('680', 'admin', '1', '127.0.0.1', '', '1448340529', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('681', 'test', '3', '127.0.0.1', '', '1448340537', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('682', 'test', '3', '127.0.0.1', '', '1448340968', 'sdf', '增加了新的用户组：asdf');
INSERT INTO `bk_action_log` VALUES ('683', 'admin', '1', '127.0.0.1', '', '1448340990', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('684', 'admin', '1', '127.0.0.1', '', '1448340996', '管理员', '编辑了系统用户：test');
INSERT INTO `bk_action_log` VALUES ('685', 'test', '3', '127.0.0.1', '', '1448341001', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('686', 'admin', '1', '127.0.0.1', '', '1448341498', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('687', 'admin', '1', '127.0.0.1', '', '1448341506', '管理员', '增加了新的工作流：sdf');
INSERT INTO `bk_action_log` VALUES ('688', 'admin', '1', '127.0.0.1', '', '1448341509', '管理员', '编辑了工作流：sdf');
INSERT INTO `bk_action_log` VALUES ('689', 'admin', '1', '127.0.0.1', '', '1448341516', '管理员', '增加了新的工作流步骤：sdfsdf');
INSERT INTO `bk_action_log` VALUES ('690', 'admin', '1', '127.0.0.1', '', '1448341520', '管理员', '编辑了工作流步骤：sdfsdf');
INSERT INTO `bk_action_log` VALUES ('691', 'admin', '1', '127.0.0.1', '', '1448341525', '管理员', '关联了用户：sdf 到工作流：sdf 中的审核步骤：sdfsdf');
INSERT INTO `bk_action_log` VALUES ('692', 'admin', '1', '127.0.0.1', '', '1448341525', '管理员', '关联了用户：管理员 到工作流：sdf 中的审核步骤：sdfsdf');
INSERT INTO `bk_action_log` VALUES ('693', 'admin', '1', '127.0.0.1', '', '1448341534', '管理员', '编辑了工作流：sdf');
INSERT INTO `bk_action_log` VALUES ('694', 'admin', '1', '127.0.0.1', '', '1448341538', '管理员', '删除了工作流：sdf');
INSERT INTO `bk_action_log` VALUES ('695', 'test', '3', '127.0.0.1', '', '1448342182', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('696', 'test', '3', '127.0.0.1', '', '1448342319', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('697', 'test', '3', '127.0.0.1', '', '1448342388', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('698', 'admin', '1', '127.0.0.1', '', '1448342439', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('699', 'admin', '1', '127.0.0.1', '', '1448342454', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('700', 'test', '3', '127.0.0.1', '', '1448342468', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('701', 'admin', '1', '127.0.0.1', '', '1448342554', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('702', 'admin', '1', '127.0.0.1', '', '1448342602', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('703', 'admin', '1', '127.0.0.1', '', '1448343724', '管理员', '关联了用户：sdf 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('704', 'admin', '1', '127.0.0.1', '', '1448343724', '管理员', '关联了用户：管理员 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('705', 'admin', '1', '127.0.0.1', '', '1448367024', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('706', 'admin', '1', '127.0.0.1', '', '1448372569', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('707', 'admin', '1', '127.0.0.1', '', '1448372999', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('708', 'admin', '1', '127.0.0.1', '', '1448373923', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('709', 'admin', '1', '127.0.0.1', '', '1448418513', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('710', 'admin', '1', '127.0.0.1', '', '1448418948', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('711', 'admin', '1', '127.0.0.1', '', '1448418965', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('712', 'admin', '1', '127.0.0.1', '', '1448419302', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('713', 'admin', '1', '127.0.0.1', '', '1448425762', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('714', 'admin', '1', '127.0.0.1', '', '1448425780', '管理员', '编辑了系统用户：admin');
INSERT INTO `bk_action_log` VALUES ('715', 'admin', '1', '127.0.0.1', '', '1448426857', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('716', 'admin', '1', '127.0.0.1', '', '1448432114', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('717', 'admin', '1', '127.0.0.1', '', '1448433476', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('718', 'admin', '1', '127.0.0.1', '', '1448433483', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('719', 'admin', '1', '127.0.0.1', '', '1448433493', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('720', 'admin', '1', '127.0.0.1', '', '1448433509', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('721', 'admin', '1', '127.0.0.1', '', '1448436466', '管理员', '编辑了工作流：辅助权限测试2');
INSERT INTO `bk_action_log` VALUES ('722', 'test', '3', '127.0.0.1', '', '1448436831', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('723', 'admin', '1', '127.0.0.1', '', '1448436845', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('724', 'admin', '1', '127.0.0.1', '', '1448439389', '管理员', '编辑了工作流：辅助权限测试2');
INSERT INTO `bk_action_log` VALUES ('725', 'admin', '1', '127.0.0.1', '', '1448439395', '管理员', '关联了用户：sdf 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('726', 'admin', '1', '127.0.0.1', '', '1448439395', '管理员', '关联了用户：管理员 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('727', 'admin', '1', '127.0.0.1', '', '1448441146', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('728', 'test', '3', '127.0.0.1', '', '1448441152', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('729', 'admin', '1', '127.0.0.1', '', '1448441446', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('730', 'test', '3', '127.0.0.1', '', '1448441460', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('731', 'admin', '1', '127.0.0.1', '', '1448441495', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('732', 'admin', '1', '127.0.0.1', '', '1448441501', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('733', 'test', '3', '127.0.0.1', '', '1448441507', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('734', 'admin', '1', '127.0.0.1', '', '1448441843', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('735', 'test', '3', '127.0.0.1', '', '1448441848', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('736', 'admin', '1', '127.0.0.1', '', '1448441889', '管理员', '增加了新的用户组：tessdfadf');
INSERT INTO `bk_action_log` VALUES ('737', 'admin', '1', '127.0.0.1', '', '1448442095', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('738', 'test', '3', '127.0.0.1', '', '1448442101', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('739', 'admin', '1', '127.0.0.1', '', '1448442172', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('740', 'test', '3', '127.0.0.1', '', '1448442178', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('741', 'admin', '1', '127.0.0.1', '', '1448442200', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('742', 'test', '3', '127.0.0.1', '', '1448442207', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('743', 'admin', '1', '127.0.0.1', '', '1448443079', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('744', 'test', '3', '127.0.0.1', '', '1448443085', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('745', 'admin', '1', '127.0.0.1', '', '1448443373', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('746', 'test', '3', '127.0.0.1', '', '1448443379', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('747', 'admin', '1', '127.0.0.1', '', '1448443392', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('748', 'test', '3', '127.0.0.1', '', '1448443398', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('749', 'admin', '1', '127.0.0.1', '', '1448443503', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('750', 'test', '3', '127.0.0.1', '', '1448443509', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('751', 'admin', '1', '127.0.0.1', '', '1448443533', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('752', 'test', '3', '127.0.0.1', '', '1448443538', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('753', 'test', '3', '127.0.0.1', '', '1448443551', 'sdf', '关联了用户：sdf 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('754', 'test', '3', '127.0.0.1', '', '1448443551', 'sdf', '关联了用户：管理员 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('755', 'admin', '1', '127.0.0.1', '', '1448443612', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('756', 'test', '3', '127.0.0.1', '', '1448443618', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('757', 'test', '3', '127.0.0.1', '', '1448443955', 'sdf', '删除了用户组：tessdfadf');
INSERT INTO `bk_action_log` VALUES ('758', 'test', '3', '127.0.0.1', '', '1448444015', 'sdf', '增加了新的用户组：sdfsf');
INSERT INTO `bk_action_log` VALUES ('759', 'test', '3', '127.0.0.1', '', '1448444218', 'sdf', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('760', 'admin', '1', '127.0.0.1', '', '1448446691', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('761', 'admin', '1', '127.0.0.1', '', '1448446709', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('762', 'admin', '1', '127.0.0.1', '', '1448449635', '管理员', '删除了用户组：sdfsf');
INSERT INTO `bk_action_log` VALUES ('763', 'admin', '1', '127.0.0.1', '', '1448449638', '管理员', '删除了用户组：asdf');
INSERT INTO `bk_action_log` VALUES ('764', 'admin', '1', '127.0.0.1', '', '1448449660', '管理员', '编辑了系统用户：test');
INSERT INTO `bk_action_log` VALUES ('765', 'admin', '1', '127.0.0.1', '', '1448449680', '管理员', '增加了新的用户组：测试管理组');
INSERT INTO `bk_action_log` VALUES ('766', 'admin', '1', '127.0.0.1', '', '1448449685', '管理员', '编辑了用户组：测试管理组');
INSERT INTO `bk_action_log` VALUES ('767', 'admin', '1', '127.0.0.1', '', '1448449692', '管理员', '编辑了用户组：测试管理组');
INSERT INTO `bk_action_log` VALUES ('768', 'admin', '1', '127.0.0.1', '', '1448449699', '管理员', '编辑了系统用户：test');
INSERT INTO `bk_action_log` VALUES ('769', 'admin', '1', '127.0.0.1', '', '1448459968', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('770', 'admin', '1', '127.0.0.1', '', '1448460334', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('771', 'admin', '1', '127.0.0.1', '', '1448462298', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('772', 'admin', '1', '127.0.0.1', '', '1448463515', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('773', 'admin', '1', '127.0.0.1', '', '1448464245', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('774', 'admin', '1', '127.0.0.1', '', '1448464463', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('775', 'admin', '1', '127.0.0.1', '', '1448512596', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('776', 'admin', '1', '127.0.0.1', '', '1448517581', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('777', 'admin', '1', '127.0.0.1', '', '1448518797', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('778', 'admin', '1', '127.0.0.1', '', '1448518844', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('779', 'admin', '1', '127.0.0.1', '', '1448523726', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('780', 'admin', '1', '127.0.0.1', '', '1448523757', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('781', 'admin', '1', '127.0.0.1', '', '1448529214', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('782', 'admin', '1', '127.0.0.1', '', '1448536897', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('783', 'admin', '1', '127.0.0.1', '', '1448536962', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('784', 'admin', '1', '127.0.0.1', '', '1448601727', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('785', 'admin', '1', '127.0.0.1', '', '1448605097', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('786', 'admin', '1', '127.0.0.1', '', '1448605178', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('787', 'admin', '1', '127.0.0.1', '', '1448605221', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('788', 'admin', '1', '127.0.0.1', '', '1448605298', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('789', 'admin', '1', '127.0.0.1', '', '1448606878', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('790', 'admin', '1', '127.0.0.1', '', '1448622197', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('791', 'admin', '1', '127.0.0.1', '', '1448632345', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('792', 'admin', '1', '127.0.0.1', '', '1448632412', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('793', 'admin', '1', '127.0.0.1', '', '1448632433', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('794', 'admin', '1', '127.0.0.1', '', '1448632780', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('795', 'admin', '1', '127.0.0.1', '', '1448633176', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('796', 'admin', '1', '127.0.0.1', '', '1448635497', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('797', 'admin', '1', '127.0.0.1', '', '1448635621', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('798', 'admin', '1', '127.0.0.1', '', '1448635751', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('799', 'admin', '1', '127.0.0.1', '', '1448635930', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('800', 'admin', '1', '127.0.0.1', '', '1448635969', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('801', 'admin', '1', '127.0.0.1', '', '1448636108', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('802', 'admin', '1', '127.0.0.1', '', '1448636219', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('803', 'admin', '1', '127.0.0.1', '', '1448636267', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('804', 'admin', '1', '127.0.0.1', '', '1448683194', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('805', 'admin', '1', '127.0.0.1', '', '1448684636', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('806', 'admin', '1', '127.0.0.1', '', '1448685122', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('807', 'admin', '1', '127.0.0.1', '', '1448692189', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('808', 'admin', '1', '127.0.0.1', '', '1448693275', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('809', 'admin', '1', '127.0.0.1', '', '1448697418', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('810', 'admin', '1', '127.0.0.1', '', '1448697451', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('811', 'admin', '1', '127.0.0.1', '', '1448697648', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('812', 'admin', '1', '127.0.0.1', '', '1448697653', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('813', 'admin', '1', '127.0.0.1', '', '1448812220', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('814', 'admin', '1', '127.0.0.1', '', '1448857303', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('815', 'admin', '1', '127.0.0.1', '', '1448857566', '管理员', '登录系统成功');

-- ----------------------------
-- Table structure for `bk_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `bk_attachment`;
CREATE TABLE `bk_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_attachment
-- ----------------------------
INSERT INTO `bk_attachment` VALUES ('44', 'Chrysanthemum.jpg', '20151126/3822f0cb395bb613047e928f72303343.jpg', '308', 'jpg', '1', '0', '1448536286', '1');
INSERT INTO `bk_attachment` VALUES ('45', 'Chrysanthemum.jpg', '20151126/3822f0cb395bb613047e928f72303343_50_50_thumb.jpg', '308', 'jpg', '1', '1', '1448536286', '1');
INSERT INTO `bk_attachment` VALUES ('46', 'Chrysanthemum.jpg', '20151126/3822f0cb395bb613047e928f72303343_70_70_thumb.jpg', '308', 'jpg', '1', '1', '1448536286', '1');
INSERT INTO `bk_attachment` VALUES ('47', '201305171112277857.jpg', '20151126/04bae2e08a4d318027c9f02c183ed60a.jpg', '5', 'jpg', '1', '0', '1448536340', '1');
INSERT INTO `bk_attachment` VALUES ('48', '201305171112277857.jpg', '20151126/04bae2e08a4d318027c9f02c183ed60a_50_50_thumb.jpg', '5', 'jpg', '1', '1', '1448536340', '1');
INSERT INTO `bk_attachment` VALUES ('49', '201305171112277857.jpg', '20151126/04bae2e08a4d318027c9f02c183ed60a_70_70_thumb.jpg', '5', 'jpg', '1', '1', '1448536340', '1');
INSERT INTO `bk_attachment` VALUES ('50', 'ss.jpg', '20151126/2b172922732054d2fffa64dedf1af471.jpg', '221', 'jpg', '1', '0', '1448536482', '1');
INSERT INTO `bk_attachment` VALUES ('51', 'ss.jpg_thumb', '20151126/2b172922732054d2fffa64dedf1af471_50_50_thumb.jpg', '221', 'jpg', '1', '1', '1448536482', '1');
INSERT INTO `bk_attachment` VALUES ('52', 'ss.jpg_thumb', '20151126/2b172922732054d2fffa64dedf1af471_70_70_thumb.jpg', '221', 'jpg', '1', '1', '1448536482', '1');
INSERT INTO `bk_attachment` VALUES ('53', 'Hydrangeas.jpg', '20151126/37b06e2a910118c09f31df90226f7677.jpg', '213', 'jpg', '1', '0', '1448536558', '1');
INSERT INTO `bk_attachment` VALUES ('54', 'Hydrangeas.jpg 缩略图', '20151126/37b06e2a910118c09f31df90226f7677_50_50_thumb.jpg', '213', 'jpg', '1', '1', '1448536558', '1');
INSERT INTO `bk_attachment` VALUES ('55', 'Hydrangeas.jpg 缩略图', '20151126/37b06e2a910118c09f31df90226f7677_70_70_thumb.jpg', '213', 'jpg', '1', '1', '1448536558', '1');
INSERT INTO `bk_attachment` VALUES ('56', 'Chrysanthemum.jpg', '20151126/1ee3433fce378270eb31d3ea2b71e789.jpg', '215', 'jpg', '1', '0', '1448536907', '1');
INSERT INTO `bk_attachment` VALUES ('57', 'Chrysanthemum.jpg 缩略图', '20151126/1ee3433fce378270eb31d3ea2b71e789_50_50_thumb.jpg', '215', 'jpg', '1', '1', '1448536907', '1');
INSERT INTO `bk_attachment` VALUES ('58', 'Chrysanthemum.jpg 缩略图', '20151126/1ee3433fce378270eb31d3ea2b71e789_70_70_thumb.jpg', '215', 'jpg', '1', '1', '1448536907', '1');
INSERT INTO `bk_attachment` VALUES ('59', 'AXN-TEST.jpg', '20151126/8f62b4fbaac3cab8dcbfebfcd4c79a91.jpg', '184', 'jpg', '1', '0', '1448537004', '1');
INSERT INTO `bk_attachment` VALUES ('60', 'AXN-TEST.jpg 缩略图', '20151126/8f62b4fbaac3cab8dcbfebfcd4c79a91_50_50_thumb.jpg', '184', 'jpg', '1', '1', '1448537004', '1');
INSERT INTO `bk_attachment` VALUES ('61', 'AXN-TEST.jpg 缩略图', '20151126/8f62b4fbaac3cab8dcbfebfcd4c79a91_70_70_thumb.jpg', '184', 'jpg', '1', '1', '1448537004', '1');
INSERT INTO `bk_attachment` VALUES ('62', 'Sample01.jpg', '20151126/f90398e914346b0db5835005d6d0180d.jpg', '206', 'jpg', '1', '0', '1448537298', '1');
INSERT INTO `bk_attachment` VALUES ('63', 'Sample01.jpg 缩略图', '20151126/f90398e914346b0db5835005d6d0180d_50_50_thumb.jpg', '206', 'jpg', '1', '1', '1448537298', '1');
INSERT INTO `bk_attachment` VALUES ('64', 'Sample01.jpg 缩略图', '20151126/f90398e914346b0db5835005d6d0180d_70_70_thumb.jpg', '206', 'jpg', '1', '1', '1448537298', '1');
INSERT INTO `bk_attachment` VALUES ('65', 'Sample02.jpg', '20151126/2daef46e952bf842bbe69361622823d6.jpg', '133', 'jpg', '1', '0', '1448537298', '1');
INSERT INTO `bk_attachment` VALUES ('66', 'Sample02.jpg 缩略图', '20151126/2daef46e952bf842bbe69361622823d6_50_50_thumb.jpg', '133', 'jpg', '1', '1', '1448537298', '1');
INSERT INTO `bk_attachment` VALUES ('67', 'Sample02.jpg 缩略图', '20151126/2daef46e952bf842bbe69361622823d6_70_70_thumb.jpg', '133', 'jpg', '1', '1', '1448537298', '1');
INSERT INTO `bk_attachment` VALUES ('68', 'Sample03.jpg', '20151126/b6d336e3021c86a600c42f18b0103f67.jpg', '198', 'jpg', '1', '0', '1448537298', '1');
INSERT INTO `bk_attachment` VALUES ('69', 'Sample03.jpg 缩略图', '20151126/b6d336e3021c86a600c42f18b0103f67_50_50_thumb.jpg', '198', 'jpg', '1', '1', '1448537298', '1');
INSERT INTO `bk_attachment` VALUES ('70', 'Sample03.jpg 缩略图', '20151126/b6d336e3021c86a600c42f18b0103f67_70_70_thumb.jpg', '198', 'jpg', '1', '1', '1448537298', '1');
INSERT INTO `bk_attachment` VALUES ('71', 'Sample04.jpg', '20151126/cf2e2346d3ca1194e61b6ac7bff3d690.jpg', '271', 'jpg', '1', '0', '1448537299', '1');
INSERT INTO `bk_attachment` VALUES ('72', 'Sample04.jpg 缩略图', '20151126/cf2e2346d3ca1194e61b6ac7bff3d690_50_50_thumb.jpg', '271', 'jpg', '1', '1', '1448537299', '1');
INSERT INTO `bk_attachment` VALUES ('73', 'Sample04.jpg 缩略图', '20151126/cf2e2346d3ca1194e61b6ac7bff3d690_70_70_thumb.jpg', '271', 'jpg', '1', '1', '1448537299', '1');
INSERT INTO `bk_attachment` VALUES ('74', 'Sample06.jpg', '20151126/e781c1d59820894f076975bde3d58758.jpg', '127', 'jpg', '1', '0', '1448537299', '1');
INSERT INTO `bk_attachment` VALUES ('75', 'Sample06.jpg 缩略图', '20151126/e781c1d59820894f076975bde3d58758_50_50_thumb.jpg', '127', 'jpg', '1', '1', '1448537299', '1');
INSERT INTO `bk_attachment` VALUES ('76', 'Sample06.jpg 缩略图', '20151126/e781c1d59820894f076975bde3d58758_70_70_thumb.jpg', '127', 'jpg', '1', '1', '1448537299', '1');
INSERT INTO `bk_attachment` VALUES ('77', 'Sample05.jpg', '20151126/5372bafa89f4ccda3dddea5d2a8007b9.jpg', '230', 'jpg', '1', '0', '1448537299', '1');
INSERT INTO `bk_attachment` VALUES ('78', 'Sample05.jpg 缩略图', '20151126/5372bafa89f4ccda3dddea5d2a8007b9_50_50_thumb.jpg', '230', 'jpg', '1', '1', '1448537299', '1');
INSERT INTO `bk_attachment` VALUES ('79', 'Sample05.jpg 缩略图', '20151126/5372bafa89f4ccda3dddea5d2a8007b9_70_70_thumb.jpg', '230', 'jpg', '1', '1', '1448537299', '1');
INSERT INTO `bk_attachment` VALUES ('80', 'Sample07.jpg', '20151126/0c37d80ccb2e6f10248edc9653ca5828.jpg', '349', 'jpg', '1', '0', '1448537300', '1');
INSERT INTO `bk_attachment` VALUES ('81', 'Sample07.jpg 缩略图', '20151126/0c37d80ccb2e6f10248edc9653ca5828_50_50_thumb.jpg', '349', 'jpg', '1', '1', '1448537300', '1');
INSERT INTO `bk_attachment` VALUES ('82', 'Sample07.jpg 缩略图', '20151126/0c37d80ccb2e6f10248edc9653ca5828_70_70_thumb.jpg', '349', 'jpg', '1', '1', '1448537300', '1');
INSERT INTO `bk_attachment` VALUES ('83', 'Sample08.jpg', '20151126/c0114a8f78f2de892970cc2e1d988c92.jpg', '209', 'jpg', '1', '0', '1448537300', '1');
INSERT INTO `bk_attachment` VALUES ('84', 'Sample08.jpg 缩略图', '20151126/c0114a8f78f2de892970cc2e1d988c92_50_50_thumb.jpg', '209', 'jpg', '1', '1', '1448537300', '1');
INSERT INTO `bk_attachment` VALUES ('85', 'Sample08.jpg 缩略图', '20151126/c0114a8f78f2de892970cc2e1d988c92_70_70_thumb.jpg', '209', 'jpg', '1', '1', '1448537300', '1');
INSERT INTO `bk_attachment` VALUES ('86', 'Sample09.jpg', '20151126/67e749d8856e1c2b9f8d76bf171dc705.jpg', '235', 'jpg', '1', '0', '1448537300', '1');
INSERT INTO `bk_attachment` VALUES ('87', 'Sample09.jpg 缩略图', '20151126/67e749d8856e1c2b9f8d76bf171dc705_50_50_thumb.jpg', '235', 'jpg', '1', '1', '1448537300', '1');
INSERT INTO `bk_attachment` VALUES ('88', 'Sample09.jpg 缩略图', '20151126/67e749d8856e1c2b9f8d76bf171dc705_70_70_thumb.jpg', '235', 'jpg', '1', '1', '1448537300', '1');
INSERT INTO `bk_attachment` VALUES ('89', 'Sample11.jpg', '20151126/010721b9f13d46eb80ca92d9557511f0.jpg', '328', 'jpg', '1', '0', '1448537301', '1');
INSERT INTO `bk_attachment` VALUES ('90', 'Sample11.jpg 缩略图', '20151126/010721b9f13d46eb80ca92d9557511f0_50_50_thumb.jpg', '328', 'jpg', '1', '1', '1448537301', '1');
INSERT INTO `bk_attachment` VALUES ('91', 'Sample11.jpg 缩略图', '20151126/010721b9f13d46eb80ca92d9557511f0_70_70_thumb.jpg', '328', 'jpg', '1', '1', '1448537301', '1');
INSERT INTO `bk_attachment` VALUES ('92', 'Sample12.jpg', '20151126/09555d596e81a5678f2f8cc15571b0c0.jpg', '250', 'jpg', '1', '0', '1448537301', '1');
INSERT INTO `bk_attachment` VALUES ('93', 'Sample12.jpg 缩略图', '20151126/09555d596e81a5678f2f8cc15571b0c0_50_50_thumb.jpg', '250', 'jpg', '1', '1', '1448537301', '1');
INSERT INTO `bk_attachment` VALUES ('94', 'Sample12.jpg 缩略图', '20151126/09555d596e81a5678f2f8cc15571b0c0_70_70_thumb.jpg', '250', 'jpg', '1', '1', '1448537301', '1');
INSERT INTO `bk_attachment` VALUES ('95', 'Sample13.jpg', '20151126/d66e01df3b05ad1d44f5c8c46617dc53.jpg', '283', 'jpg', '1', '0', '1448537302', '1');
INSERT INTO `bk_attachment` VALUES ('96', 'Sample13.jpg 缩略图', '20151126/d66e01df3b05ad1d44f5c8c46617dc53_50_50_thumb.jpg', '283', 'jpg', '1', '1', '1448537302', '1');
INSERT INTO `bk_attachment` VALUES ('97', 'Sample13.jpg 缩略图', '20151126/d66e01df3b05ad1d44f5c8c46617dc53_70_70_thumb.jpg', '283', 'jpg', '1', '1', '1448537302', '1');
INSERT INTO `bk_attachment` VALUES ('98', 'Sample10.jpg', '20151126/0b4eff96d3cf25c2438135ffe8614cd9.jpg', '389', 'jpg', '1', '0', '1448537301', '1');
INSERT INTO `bk_attachment` VALUES ('99', 'Sample10.jpg 缩略图', '20151126/0b4eff96d3cf25c2438135ffe8614cd9_50_50_thumb.jpg', '389', 'jpg', '1', '1', '1448537301', '1');
INSERT INTO `bk_attachment` VALUES ('100', 'Sample10.jpg 缩略图', '20151126/0b4eff96d3cf25c2438135ffe8614cd9_70_70_thumb.jpg', '389', 'jpg', '1', '1', '1448537301', '1');
INSERT INTO `bk_attachment` VALUES ('101', 'Sample14.jpg', '20151126/f6ffa4993eb1eb4d6ff700acea621877.jpg', '149', 'jpg', '1', '0', '1448537302', '1');
INSERT INTO `bk_attachment` VALUES ('102', 'Sample14.jpg 缩略图', '20151126/f6ffa4993eb1eb4d6ff700acea621877_50_50_thumb.jpg', '149', 'jpg', '1', '1', '1448537302', '1');
INSERT INTO `bk_attachment` VALUES ('103', 'Sample14.jpg 缩略图', '20151126/f6ffa4993eb1eb4d6ff700acea621877_70_70_thumb.jpg', '149', 'jpg', '1', '1', '1448537302', '1');
INSERT INTO `bk_attachment` VALUES ('104', 'Sample15.jpg', '20151126/8cee996a0455478ac379e3bdd8d2616c.jpg', '203', 'jpg', '1', '0', '1448537302', '1');
INSERT INTO `bk_attachment` VALUES ('105', 'Sample15.jpg 缩略图', '20151126/8cee996a0455478ac379e3bdd8d2616c_50_50_thumb.jpg', '203', 'jpg', '1', '1', '1448537302', '1');
INSERT INTO `bk_attachment` VALUES ('106', 'Sample15.jpg 缩略图', '20151126/8cee996a0455478ac379e3bdd8d2616c_70_70_thumb.jpg', '203', 'jpg', '1', '1', '1448537302', '1');
INSERT INTO `bk_attachment` VALUES ('107', 'Sample16.jpg', '20151126/67b9737183503234002f3df1eb5d65ed.jpg', '128', 'jpg', '1', '0', '1448537303', '1');
INSERT INTO `bk_attachment` VALUES ('108', 'Sample16.jpg 缩略图', '20151126/67b9737183503234002f3df1eb5d65ed_50_50_thumb.jpg', '128', 'jpg', '1', '1', '1448537303', '1');
INSERT INTO `bk_attachment` VALUES ('109', 'Sample16.jpg 缩略图', '20151126/67b9737183503234002f3df1eb5d65ed_70_70_thumb.jpg', '128', 'jpg', '1', '1', '1448537303', '1');
INSERT INTO `bk_attachment` VALUES ('110', 'Sample17.jpg', '20151126/3bf73dd39e75fbc98bfb76de76a9a1e7.jpg', '311', 'jpg', '1', '0', '1448537303', '1');
INSERT INTO `bk_attachment` VALUES ('111', 'Sample17.jpg 缩略图', '20151126/3bf73dd39e75fbc98bfb76de76a9a1e7_50_50_thumb.jpg', '311', 'jpg', '1', '1', '1448537303', '1');
INSERT INTO `bk_attachment` VALUES ('112', 'Sample17.jpg 缩略图', '20151126/3bf73dd39e75fbc98bfb76de76a9a1e7_70_70_thumb.jpg', '311', 'jpg', '1', '1', '1448537303', '1');
INSERT INTO `bk_attachment` VALUES ('113', 'Sample18.jpg', '20151126/6ee59fa4d5b91eb9abe574bee696e252.jpg', '185', 'jpg', '1', '0', '1448537303', '1');
INSERT INTO `bk_attachment` VALUES ('114', 'Sample18.jpg 缩略图', '20151126/6ee59fa4d5b91eb9abe574bee696e252_50_50_thumb.jpg', '185', 'jpg', '1', '1', '1448537303', '1');
INSERT INTO `bk_attachment` VALUES ('115', 'Sample18.jpg 缩略图', '20151126/6ee59fa4d5b91eb9abe574bee696e252_70_70_thumb.jpg', '185', 'jpg', '1', '1', '1448537303', '1');
INSERT INTO `bk_attachment` VALUES ('116', 'Sample19.jpg', '20151126/757f62ddb36316ebfeb6611fd7397cdf.jpg', '170', 'jpg', '1', '0', '1448537304', '1');
INSERT INTO `bk_attachment` VALUES ('117', 'Sample19.jpg 缩略图', '20151126/757f62ddb36316ebfeb6611fd7397cdf_50_50_thumb.jpg', '170', 'jpg', '1', '1', '1448537304', '1');
INSERT INTO `bk_attachment` VALUES ('118', 'Sample19.jpg 缩略图', '20151126/757f62ddb36316ebfeb6611fd7397cdf_70_70_thumb.jpg', '170', 'jpg', '1', '1', '1448537304', '1');
INSERT INTO `bk_attachment` VALUES ('119', 'Sample20.jpg', '20151126/37a959d3545800345cdf4b177c795dc5.jpg', '346', 'jpg', '1', '0', '1448537304', '1');
INSERT INTO `bk_attachment` VALUES ('120', 'Sample20.jpg 缩略图', '20151126/37a959d3545800345cdf4b177c795dc5_50_50_thumb.jpg', '346', 'jpg', '1', '1', '1448537304', '1');
INSERT INTO `bk_attachment` VALUES ('121', 'Sample20.jpg 缩略图', '20151126/37a959d3545800345cdf4b177c795dc5_70_70_thumb.jpg', '346', 'jpg', '1', '1', '1448537304', '1');
INSERT INTO `bk_attachment` VALUES ('122', 'Sample04.jpg', '20151126/85cb73c7ba5d9c55f34f54dc5c5d0f3e.jpg', '271', 'jpg', '1', '0', '1448538747', '1');
INSERT INTO `bk_attachment` VALUES ('123', 'Sample04.jpg 缩略图', '20151126/85cb73c7ba5d9c55f34f54dc5c5d0f3e_50_50_thumb.jpg', '271', 'jpg', '1', '1', '1448538747', '1');
INSERT INTO `bk_attachment` VALUES ('124', 'Sample04.jpg 缩略图', '20151126/85cb73c7ba5d9c55f34f54dc5c5d0f3e_70_70_thumb.jpg', '271', 'jpg', '1', '1', '1448538747', '1');
INSERT INTO `bk_attachment` VALUES ('125', 'Sample13.jpg', '20151126/83607161b0211e920b36751fb2366818.jpg', '283', 'jpg', '1', '0', '1448538832', '1');
INSERT INTO `bk_attachment` VALUES ('126', 'Sample13.jpg 缩略图', '20151126/83607161b0211e920b36751fb2366818_50_50_thumb.jpg', '283', 'jpg', '1', '1', '1448538832', '1');
INSERT INTO `bk_attachment` VALUES ('127', 'Sample13.jpg 缩略图', '20151126/83607161b0211e920b36751fb2366818_70_70_thumb.jpg', '283', 'jpg', '1', '1', '1448538832', '1');
INSERT INTO `bk_attachment` VALUES ('128', 'Sample14.jpg', '20151126/c51103d89426f9c32b91cbc1acaf280a.jpg', '149', 'jpg', '1', '0', '1448538832', '1');
INSERT INTO `bk_attachment` VALUES ('129', 'Sample14.jpg 缩略图', '20151126/c51103d89426f9c32b91cbc1acaf280a_50_50_thumb.jpg', '149', 'jpg', '1', '1', '1448538832', '1');
INSERT INTO `bk_attachment` VALUES ('130', 'Sample14.jpg 缩略图', '20151126/c51103d89426f9c32b91cbc1acaf280a_70_70_thumb.jpg', '149', 'jpg', '1', '1', '1448538832', '1');
INSERT INTO `bk_attachment` VALUES ('131', 'Desert.jpg', '20151126/ac4d942fa520e2bc414cf88e2150983b.jpg', '228', 'jpg', '1', '0', '1448539348', '1');
INSERT INTO `bk_attachment` VALUES ('132', 'Desert.jpg 缩略图', '20151126/ac4d942fa520e2bc414cf88e2150983b_50_50_thumb.jpg', '228', 'jpg', '1', '1', '1448539348', '1');
INSERT INTO `bk_attachment` VALUES ('133', 'Desert.jpg 缩略图', '20151126/ac4d942fa520e2bc414cf88e2150983b_70_70_thumb.jpg', '228', 'jpg', '1', '1', '1448539348', '1');
INSERT INTO `bk_attachment` VALUES ('134', 'Hydrangeas.jpg', '20151126/5eab1618314845b49295bad954caffda.jpg', '159', 'jpg', '1', '0', '1448539404', '1');
INSERT INTO `bk_attachment` VALUES ('135', 'Hydrangeas.jpg 缩略图', '20151126/5eab1618314845b49295bad954caffda_50_50_thumb.jpg', '159', 'jpg', '1', '1', '1448539404', '1');
INSERT INTO `bk_attachment` VALUES ('136', 'Hydrangeas.jpg 缩略图', '20151126/5eab1618314845b49295bad954caffda_70_70_thumb.jpg', '159', 'jpg', '1', '1', '1448539404', '1');
INSERT INTO `bk_attachment` VALUES ('137', 'Chrysanthemum.jpg', '20151126/9d32c30974e2bba9196075a2c7695f96.jpg', '215', 'jpg', '1', '0', '1448544717', '1');
INSERT INTO `bk_attachment` VALUES ('138', 'Chrysanthemum.jpg 缩略图', '20151126/9d32c30974e2bba9196075a2c7695f96_50_50_thumb.jpg', '215', 'jpg', '1', '1', '1448544717', '1');
INSERT INTO `bk_attachment` VALUES ('139', 'Chrysanthemum.jpg 缩略图', '20151126/9d32c30974e2bba9196075a2c7695f96_70_70_thumb.jpg', '215', 'jpg', '1', '1', '1448544717', '1');
INSERT INTO `bk_attachment` VALUES ('140', 'XEN-TEST.jpg', '20151126/405b3b8591b76e8f2acfca9a7e1c00bc.jpg', '198', 'jpg', '1', '0', '1448545191', '1');
INSERT INTO `bk_attachment` VALUES ('141', 'XEN-TEST.jpg 缩略图', '20151126/405b3b8591b76e8f2acfca9a7e1c00bc_50_50_thumb.jpg', '198', 'jpg', '1', '1', '1448545191', '1');
INSERT INTO `bk_attachment` VALUES ('142', 'XEN-TEST.jpg 缩略图', '20151126/405b3b8591b76e8f2acfca9a7e1c00bc_70_70_thumb.jpg', '198', 'jpg', '1', '1', '1448545191', '1');
INSERT INTO `bk_attachment` VALUES ('143', 'Desert.jpg', '20151126/ee06cac9208faf995dbfed2449bdc405.jpg', '228', 'jpg', '1', '0', '1448545283', '1');
INSERT INTO `bk_attachment` VALUES ('144', 'Desert.jpg 缩略图', '20151126/ee06cac9208faf995dbfed2449bdc405_50_50_thumb.jpg', '228', 'jpg', '1', '1', '1448545283', '1');
INSERT INTO `bk_attachment` VALUES ('145', 'Desert.jpg 缩略图', '20151126/ee06cac9208faf995dbfed2449bdc405_70_70_thumb.jpg', '228', 'jpg', '1', '1', '1448545283', '1');
INSERT INTO `bk_attachment` VALUES ('146', 'Hydrangeas.jpg', '20151126/759adc06aabd556f095bcd2b6df08aaa.jpg', '159', 'jpg', '1', '0', '1448545340', '1');
INSERT INTO `bk_attachment` VALUES ('147', 'Hydrangeas.jpg 缩略图', '20151126/759adc06aabd556f095bcd2b6df08aaa_150_150_thumb.jpg', '159', 'jpg', '1', '1', '1448545340', '1');
INSERT INTO `bk_attachment` VALUES ('148', 'Hydrangeas.jpg 缩略图', '20151126/759adc06aabd556f095bcd2b6df08aaa_170_170_thumb.jpg', '159', 'jpg', '1', '1', '1448545340', '1');
INSERT INTO `bk_attachment` VALUES ('149', 'Koala.jpg', '20151126/44ee8c3779920fb9bb42b88e1370f334.jpg', '248', 'jpg', '1', '0', '1448545414', '1');
INSERT INTO `bk_attachment` VALUES ('150', 'Koala.jpg 缩略图', '20151126/44ee8c3779920fb9bb42b88e1370f334_150_150_thumb.jpg', '248', 'jpg', '1', '1', '1448545414', '1');
INSERT INTO `bk_attachment` VALUES ('151', 'Koala.jpg 缩略图', '20151126/44ee8c3779920fb9bb42b88e1370f334_170_170_thumb.jpg', '248', 'jpg', '1', '1', '1448545414', '1');
INSERT INTO `bk_attachment` VALUES ('152', 'Lighthouse.jpg', '20151126/ff1520f006ca5523e12bafa217bedf9e.jpg', '166', 'jpg', '1', '0', '1448545414', '1');
INSERT INTO `bk_attachment` VALUES ('153', 'Lighthouse.jpg 缩略图', '20151126/ff1520f006ca5523e12bafa217bedf9e_150_150_thumb.jpg', '166', 'jpg', '1', '1', '1448545414', '1');
INSERT INTO `bk_attachment` VALUES ('154', 'Lighthouse.jpg 缩略图', '20151126/ff1520f006ca5523e12bafa217bedf9e_170_170_thumb.jpg', '166', 'jpg', '1', '1', '1448545414', '1');
INSERT INTO `bk_attachment` VALUES ('155', 'QQ截图20151126214351.jpg', '20151126/9deafaee27b951edc7bcdd650ca5eb8e.jpg', '33', 'jpg', '1', '0', '1448545442', '1');
INSERT INTO `bk_attachment` VALUES ('156', 'QQ截图20151126214351.jpg 缩略图', '20151126/9deafaee27b951edc7bcdd650ca5eb8e_150_150_thumb.jpg', '33', 'jpg', '1', '1', '1448545442', '1');
INSERT INTO `bk_attachment` VALUES ('157', 'QQ截图20151126214351.jpg 缩略图', '20151126/9deafaee27b951edc7bcdd650ca5eb8e_170_170_thumb.jpg', '33', 'jpg', '1', '1', '1448545442', '1');
INSERT INTO `bk_attachment` VALUES ('158', 'Sample03.jpg', '20151127/a3297233c87942513bfede4605c59ac9.jpg', '198', 'jpg', '1', '0', '1448633350', '1');
INSERT INTO `bk_attachment` VALUES ('159', 'Sample03.jpg 缩略图', '20151127/a3297233c87942513bfede4605c59ac9_150_150_thumb.jpg', '198', 'jpg', '1', '1', '1448633350', '1');
INSERT INTO `bk_attachment` VALUES ('160', 'Sample03.jpg 缩略图', '20151127/a3297233c87942513bfede4605c59ac9_170_170_thumb.jpg', '198', 'jpg', '1', '1', '1448633350', '1');
INSERT INTO `bk_attachment` VALUES ('161', 'Sample06.jpg', '20151127/1591e7cd343db796c21c6285ed05e2bb.jpg', '127', 'jpg', '1', '0', '1448639351', '1');
INSERT INTO `bk_attachment` VALUES ('162', 'Sample06.jpg 缩略图', '20151127/1591e7cd343db796c21c6285ed05e2bb_150_150_thumb.jpg', '127', 'jpg', '1', '1', '1448639351', '1');
INSERT INTO `bk_attachment` VALUES ('163', 'Sample06.jpg 缩略图', '20151127/1591e7cd343db796c21c6285ed05e2bb_170_170_thumb.jpg', '127', 'jpg', '1', '1', '1448639351', '1');

-- ----------------------------
-- Table structure for `bk_group`
-- ----------------------------
DROP TABLE IF EXISTS `bk_group`;
CREATE TABLE `bk_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL COMMENT '用户组名',
  `mark` varchar(255) NOT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否禁用',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '用户组等级，低等级的不能对高等级的用户做修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户组表_by_jiang';

-- ----------------------------
-- Records of bk_group
-- ----------------------------
INSERT INTO `bk_group` VALUES ('1', '超级用户组', '123123as', '1', '1');
INSERT INTO `bk_group` VALUES ('7', '测试管理组', '用来测试的', '1', '2');

-- ----------------------------
-- Table structure for `bk_permission`
-- ----------------------------
DROP TABLE IF EXISTS `bk_permission`;
CREATE TABLE `bk_permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL COMMENT '模块',
  `class` varchar(255) NOT NULL COMMENT '类',
  `action` varchar(255) NOT NULL COMMENT '函数',
  `name` varchar(255) NOT NULL COMMENT '节点的名字',
  `display` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为显示为菜单，0则不显示',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '节点的父节点，此值一般用于输出树形结构，0则为顶级',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `level` tinyint(2) NOT NULL DEFAULT '1' COMMENT '第几级菜单',
  `mark` varchar(255) NOT NULL COMMENT '备注',
  `add_time` bigint(20) NOT NULL COMMENT '增加的日期',
  PRIMARY KEY (`id`),
  KEY `module` (`module`) USING BTREE,
  KEY `class` (`class`) USING BTREE,
  KEY `action` (`action`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='权限节点表_by_jiang';

-- ----------------------------
-- Records of bk_permission
-- ----------------------------
INSERT INTO `bk_permission` VALUES ('1', 'foundation', '系统管理', '系统管理', '系统管理', '1', '0', '0', '1', '系统管理页面，不作权限验证，只用做菜单显示', '0');
INSERT INTO `bk_permission` VALUES ('2', 'foundation', 'group', 'index', '用户组管理', '1', '1', '2', '2', '用户组管理页面', '0');
INSERT INTO `bk_permission` VALUES ('3', 'foundation', 'acl', 'index', '功能管理', '1', '1', '1', '2', '功能管理页面', '0');
INSERT INTO `bk_permission` VALUES ('4', 'foundation', 'user', 'index', '用户管理', '1', '1', '3', '2', '用户管理页面', '0');
INSERT INTO `bk_permission` VALUES ('20', 'foundation', 'user', 'add', '增加用户', '0', '4', '0', '3', '增加一个用户', '0');
INSERT INTO `bk_permission` VALUES ('23', 'foundation', 'group', 'add', '增加用户组', '0', '2', '0', '3', '增加用户组', '1406882443');
INSERT INTO `bk_permission` VALUES ('24', 'foundation', 'group', 'edit', '用户组编辑', '0', '2', '0', '3', '用户组编辑', '1406882515');
INSERT INTO `bk_permission` VALUES ('25', 'foundation', 'group', 'delete', '用户组删除', '0', '2', '0', '3', '用户组删除、批量删除', '1406882542');
INSERT INTO `bk_permission` VALUES ('26', 'foundation', 'acl', 'group', '用户组权限管理', '0', '2', '0', '3', '用户组权限管理', '1406882568');
INSERT INTO `bk_permission` VALUES ('27', 'foundation', 'user', 'edit', '用户编辑', '0', '4', '0', '3', '用户编辑', '1406882640');
INSERT INTO `bk_permission` VALUES ('28', 'foundation', 'user', 'delete', '用户删除', '0', '4', '0', '3', '用户删除', '1406882664');
INSERT INTO `bk_permission` VALUES ('29', 'foundation', 'acl', 'user', '用户权限管理', '0', '4', '0', '3', '用户权限管理、设置用户权限', '1406882698');
INSERT INTO `bk_permission` VALUES ('30', 'foundation', 'acl', 'add', '增加功能菜单', '0', '3', '0', '3', '增加功能菜单', '1406882729');
INSERT INTO `bk_permission` VALUES ('31', 'foundation', 'acl', 'edit', '功能菜单编辑', '0', '3', '0', '3', '功能菜单编辑', '1406882754');
INSERT INTO `bk_permission` VALUES ('32', 'foundation', 'acl', 'delete', '功能菜单删除', '0', '3', '0', '3', '功能菜单删除', '1406882775');
INSERT INTO `bk_permission` VALUES ('33', 'foundation', 'acl', 'sort', '功能菜单排序', '0', '3', '0', '3', '功能菜单排序', '1406882815');
INSERT INTO `bk_permission` VALUES ('43', 'foundation', 'index', 'cs', '功能示例', '1', '1', '0', '2', '一些小功能的合集，可以用来加快开发的速度。', '1427788812');
INSERT INTO `bk_permission` VALUES ('44', 'foundation', 'upload', 'index', '弹出窗口上传', '0', '66', '0', '2', '通用的弹出窗口上传。', '1427790345');
INSERT INTO `bk_permission` VALUES ('53', 'foundation', 'log', 'action', '操作日志', '1', '78', '0', '2', '查看操作日志', '1433319136');
INSERT INTO `bk_permission` VALUES ('55', '工作流管理', '工作流管理', '工作流管理', '工作流管理', '1', '0', '0', '1', '', '1434093108');
INSERT INTO `bk_permission` VALUES ('56', 'workflow', 'index', 'add', '工作流增加', '0', '73', '0', '3', '增加新的工作流程', '1434333268');
INSERT INTO `bk_permission` VALUES ('57', 'workflow', 'index', 'edit', '工作流编辑', '0', '73', '0', '3', '修改工作流信息', '1434336714');
INSERT INTO `bk_permission` VALUES ('58', 'workflow', 'index', 'delete', '工作流删除', '0', '73', '0', '3', '删除工作流', '1434338279');
INSERT INTO `bk_permission` VALUES ('59', 'workflow', 'step', 'index', '工作流详情', '0', '55', '1', '3', '查看工作流详情', '1434345119');
INSERT INTO `bk_permission` VALUES ('60', 'workflow', 'step', 'add', '增加工作流步骤', '0', '59', '0', '3', '增加工作流步骤', '1434349481');
INSERT INTO `bk_permission` VALUES ('61', 'workflow', 'step', 'edit', '编辑工作流步骤', '0', '59', '0', '3', '编辑工作流步骤', '1434353110');
INSERT INTO `bk_permission` VALUES ('62', 'workflow', 'step', 'delete', '工作流步骤删除', '0', '59', '0', '3', '工作流步骤删除', '1434354926');
INSERT INTO `bk_permission` VALUES ('63', 'workflow', 'step', 'relation', '工作流设置关联人员', '0', '59', '0', '3', '工作流设置关联人员', '1434422499');
INSERT INTO `bk_permission` VALUES ('66', '通用功能', '通用功能', '通用功能', '通用功能', '0', '0', '0', '1', '通用功能，一般会开发这些功能给用户。', '1435545336');
INSERT INTO `bk_permission` VALUES ('73', 'workflow', 'index', 'index', '工作流列表', '1', '55', '2', '3', '', '1436232634');
INSERT INTO `bk_permission` VALUES ('74', 'foundation', 'index', 'index', '默认首页', '0', '66', '0', '2', '', '0');
INSERT INTO `bk_permission` VALUES ('75', 'foundation', 'upload', 'process', '弹窗上传处理', '0', '44', '0', '3', '', '1448029789');
INSERT INTO `bk_permission` VALUES ('76', 'foundation', 'user', 'mpassword', '修改个人登陆密码', '0', '66', '0', '2', '', '1448031475');
INSERT INTO `bk_permission` VALUES ('78', '系统日志', '系统日志', '系统日志', '系统日志', '1', '0', '0', '1', '', '1448342575');
INSERT INTO `bk_permission` VALUES ('79', '店铺配置', '店铺配置', '店铺配置', '店铺配置（重要）', '1', '0', '0', '1', '', '1448446537');
INSERT INTO `bk_permission` VALUES ('80', 'product', 'index', 'index', '商品管理', '1', '86', '0', '2', '商品管理列表', '1448446686');
INSERT INTO `bk_permission` VALUES ('81', 'foundation', 'upload', 'imagelist', '弹窗上传图库', '0', '44', '0', '3', '', '1448518776');
INSERT INTO `bk_permission` VALUES ('82', 'shop', 'category', 'index', '核心分类管理', '1', '79', '0', '2', '', '1448632405');
INSERT INTO `bk_permission` VALUES ('83', 'shop', 'brand', 'index', '品牌管理', '1', '79', '0', '2', '', '1448632513');
INSERT INTO `bk_permission` VALUES ('84', 'shop', 'series', 'index', '系列管理', '1', '79', '0', '2', '', '1448632734');
INSERT INTO `bk_permission` VALUES ('85', 'shop', 'attribute', 'index', '属性管理', '1', '79', '0', '2', '', '1448632776');
INSERT INTO `bk_permission` VALUES ('86', '商品管理', '商品管理', '商品管理', '商品管理', '1', '0', '0', '1', '', '1448635615');
INSERT INTO `bk_permission` VALUES ('87', 'product', 'category', 'index', '自定义分类管理', '1', '86', '0', '2', '', '1448635925');
INSERT INTO `bk_permission` VALUES ('88', '报表管理', '报表管理', '报表管理', '报表管理', '1', '0', '0', '1', '', '1448636071');
INSERT INTO `bk_permission` VALUES ('89', '测试报表', '测试报表', '测试报表', '测试报表', '1', '88', '0', '2', '', '1448636103');
INSERT INTO `bk_permission` VALUES ('90', 'product', 'trash', 'index', '回收站', '1', '86', '0', '2', '', '1448636214');
INSERT INTO `bk_permission` VALUES ('91', 'shop', 'category', 'add', '添加核心分类', '0', '82', '0', '3', '', '1448685116');
INSERT INTO `bk_permission` VALUES ('92', 'shop', 'category', 'sort', '核心分类排序', '0', '82', '0', '3', '', '1448692183');
INSERT INTO `bk_permission` VALUES ('93', 'shop', 'category', 'edit', '核心分类编辑', '0', '82', '0', '3', '', '1448693249');
INSERT INTO `bk_permission` VALUES ('94', 'shop', 'category', 'delete', '核心分类删除', '0', '82', '0', '3', '', '1448693270');

-- ----------------------------
-- Table structure for `bk_product_attrname`
-- ----------------------------
DROP TABLE IF EXISTS `bk_product_attrname`;
CREATE TABLE `bk_product_attrname` (
  `attrname_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attrname` varchar(255) NOT NULL COMMENT '属性名',
  `attrname_sort` int(11) NOT NULL COMMENT '排序',
  `attrname_status` tinyint(1) NOT NULL COMMENT '状态',
  `is_must_attrname` tinyint(1) NOT NULL COMMENT '是否必须属性',
  `is_multy_attrname` tinyint(1) NOT NULL COMMENT '是否多选属性',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`attrname_id`),
  KEY `attrname_status` (`attrname_status`) USING BTREE,
  KEY `is_must_attrname` (`is_must_attrname`) USING BTREE,
  KEY `is_multy_attrname` (`is_multy_attrname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品属性名';

-- ----------------------------
-- Records of bk_product_attrname
-- ----------------------------

-- ----------------------------
-- Table structure for `bk_product_attrname_attrvalue`
-- ----------------------------
DROP TABLE IF EXISTS `bk_product_attrname_attrvalue`;
CREATE TABLE `bk_product_attrname_attrvalue` (
  `nv_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attrname_id` int(11) NOT NULL COMMENT '属性名ID',
  `attrvalue_id` int(11) NOT NULL COMMENT '属性值ID',
  PRIMARY KEY (`nv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品属性名与属性值的多对多关系表';

-- ----------------------------
-- Records of bk_product_attrname_attrvalue
-- ----------------------------

-- ----------------------------
-- Table structure for `bk_product_attrvalue`
-- ----------------------------
DROP TABLE IF EXISTS `bk_product_attrvalue`;
CREATE TABLE `bk_product_attrvalue` (
  `attrvalue_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attrvalue_name` varchar(255) NOT NULL COMMENT '属性值名称',
  `attrname_id` int(11) NOT NULL COMMENT '属性名ID',
  `attrvalue_sort` int(11) NOT NULL COMMENT '排序',
  `attrvalue_status` tinyint(1) NOT NULL COMMENT '状态',
  `category_id` int(11) NOT NULL COMMENT '类目的ID',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`attrvalue_id`),
  KEY `attrname_id` (`attrname_id`) USING BTREE,
  KEY `attrvalue_status` (`attrvalue_status`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='属性值表';

-- ----------------------------
-- Records of bk_product_attrvalue
-- ----------------------------

-- ----------------------------
-- Table structure for `bk_product_attr_relation`
-- ----------------------------
DROP TABLE IF EXISTS `bk_product_attr_relation`;
CREATE TABLE `bk_product_attr_relation` (
  `p_attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `attrname_id` int(11) NOT NULL COMMENT '属性名ID',
  `attrvalue_id` int(11) NOT NULL COMMENT '属性值ID',
  `is_sku` tinyint(1) NOT NULL COMMENT '是否SKU',
  `sku_id` int(11) NOT NULL COMMENT 'skuid',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`p_attr_id`),
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `attrname_id` (`attrname_id`) USING BTREE,
  KEY `attrvalue_id` (`attrvalue_id`) USING BTREE,
  KEY `is_sku` (`is_sku`) USING BTREE,
  KEY `sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SKU的属性会拆分后存入这个表';

-- ----------------------------
-- Records of bk_product_attr_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `bk_product_brand`
-- ----------------------------
DROP TABLE IF EXISTS `bk_product_brand`;
CREATE TABLE `bk_product_brand` (
  `brand_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cn_name` varchar(255) NOT NULL COMMENT '品牌中文名称',
  `en_name` varchar(255) NOT NULL COMMENT '品牌英文名称',
  `description` text NOT NULL COMMENT '品牌描述',
  `brand_status` tinyint(1) NOT NULL COMMENT '状态',
  `official_website` varchar(255) NOT NULL COMMENT '品牌官网',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`brand_id`),
  KEY `brand_status` (`brand_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品品牌表';

-- ----------------------------
-- Records of bk_product_brand
-- ----------------------------

-- ----------------------------
-- Table structure for `bk_product_brand_category`
-- ----------------------------
DROP TABLE IF EXISTS `bk_product_brand_category`;
CREATE TABLE `bk_product_brand_category` (
  `bc_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL COMMENT '分类ID',
  `brand_id` int(11) NOT NULL COMMENT '品牌ID',
  PRIMARY KEY (`bc_id`),
  KEY `bc_id` (`category_id`,`brand_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌与分类的多对多关系表';

-- ----------------------------
-- Records of bk_product_brand_category
-- ----------------------------

-- ----------------------------
-- Table structure for `bk_product_category`
-- ----------------------------
DROP TABLE IF EXISTS `bk_product_category`;
CREATE TABLE `bk_product_category` (
  `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL COMMENT '类目名称',
  `category_pid` int(11) NOT NULL COMMENT '类目的父ID',
  `category_sort` int(11) NOT NULL COMMENT '排序',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `category_status` tinyint(1) NOT NULL COMMENT '是否启用',
  `category_level` tinyint(2) NOT NULL COMMENT '第几层',
  PRIMARY KEY (`category_id`),
  KEY `category_pid` (`category_pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='产品分类表';

-- ----------------------------
-- Records of bk_product_category
-- ----------------------------
INSERT INTO `bk_product_category` VALUES ('1', '服饰鞋帽', '0', '1', '1448691201', '1448858323', '1', '1');
INSERT INTO `bk_product_category` VALUES ('2', '礼品箱包', '0', '1', '1448691494', '1448858333', '1', '1');
INSERT INTO `bk_product_category` VALUES ('3', '家居家装', '0', '1', '1448691508', '1448858336', '1', '1');
INSERT INTO `bk_product_category` VALUES ('4', '女装', '1', '2', '1448693608', '1448859932', '1', '2');
INSERT INTO `bk_product_category` VALUES ('5', '男装', '1', '3', '1448694668', '1448858325', '1', '2');

-- ----------------------------
-- Table structure for `bk_product_category_attrname`
-- ----------------------------
DROP TABLE IF EXISTS `bk_product_category_attrname`;
CREATE TABLE `bk_product_category_attrname` (
  `c_attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL COMMENT '分类的ID',
  `attrname_id` int(11) NOT NULL COMMENT '属性名ID',
  PRIMARY KEY (`c_attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类与属性名的多对多关系表';

-- ----------------------------
-- Records of bk_product_category_attrname
-- ----------------------------

-- ----------------------------
-- Table structure for `bk_product_detail`
-- ----------------------------
DROP TABLE IF EXISTS `bk_product_detail`;
CREATE TABLE `bk_product_detail` (
  `product_detail_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `product_content` text NOT NULL COMMENT '产品描述',
  PRIMARY KEY (`product_detail_id`),
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_product_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `bk_product_images`
-- ----------------------------
DROP TABLE IF EXISTS `bk_product_images`;
CREATE TABLE `bk_product_images` (
  `pi_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image_path` varchar(255) NOT NULL COMMENT '图片地址',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`pi_id`),
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品图库';

-- ----------------------------
-- Records of bk_product_images
-- ----------------------------

-- ----------------------------
-- Table structure for `bk_product_main`
-- ----------------------------
DROP TABLE IF EXISTS `bk_product_main`;
CREATE TABLE `bk_product_main` (
  `product_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_title` varchar(255) NOT NULL COMMENT '产品标题',
  `brand_id` int(11) NOT NULL COMMENT '品牌ID',
  `product_price` int(11) NOT NULL COMMENT '产品价格',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  `product_status` tinyint(1) NOT NULL COMMENT '产品状态',
  `delete_time` int(11) NOT NULL COMMENT '删除时间',
  `product_code` varchar(255) NOT NULL COMMENT '产品编码',
  PRIMARY KEY (`product_id`),
  KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `product_status` (`product_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品主表';

-- ----------------------------
-- Records of bk_product_main
-- ----------------------------

-- ----------------------------
-- Table structure for `bk_product_sku`
-- ----------------------------
DROP TABLE IF EXISTS `bk_product_sku`;
CREATE TABLE `bk_product_sku` (
  `sku_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `nums` int(11) NOT NULL COMMENT '产品数量',
  `price` int(11) NOT NULL COMMENT '价格',
  `sku_code` varchar(255) NOT NULL COMMENT 'sku产品编码',
  `sku_status` tinyint(1) NOT NULL COMMENT 'sku产品状态',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`sku_id`),
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `sku_status` (`sku_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_product_sku
-- ----------------------------

-- ----------------------------
-- Table structure for `bk_users`
-- ----------------------------
DROP TABLE IF EXISTS `bk_users`;
CREATE TABLE `bk_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '用户密码',
  `group_id` int(11) NOT NULL,
  `realname` varchar(255) NOT NULL DEFAULT '' COMMENT '真实性名',
  `token` varchar(255) NOT NULL COMMENT '用户注册时的密钥',
  `add_time` bigint(20) NOT NULL COMMENT '用户注册的时间',
  `modify_time` bigint(20) NOT NULL COMMENT '用户信息所修改的时间',
  `mobile` varchar(11) NOT NULL COMMENT '手机',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户禁用0正常的1',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `last_login_ip` varchar(255) NOT NULL COMMENT '最后登录ip',
  `last_login_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `password` (`password`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表_by_jiang';

-- ----------------------------
-- Records of bk_users
-- ----------------------------
INSERT INTO `bk_users` VALUES ('1', 'admin', 'c4ca4238a0b923820dcc509a6f75849b', '1', '管理员', 'oyzzO7YxmgJHlAfdK5HaZMscegJPcTrw5drPQRS6bjlfAkTB6NELPvqpc12q', '0', '0', '12', '1', '超级用户组', '127.0.0.1', '1448857566');
INSERT INTO `bk_users` VALUES ('3', 'test', 'c4ca4238a0b923820dcc509a6f75849b', '7', '测试姓名', '', '1448340510', '0', '23123123', '1', '测试帐号', '127.0.0.1', '1448444217');

-- ----------------------------
-- Table structure for `bk_workflow`
-- ----------------------------
DROP TABLE IF EXISTS `bk_workflow`;
CREATE TABLE `bk_workflow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '工作流的名字',
  `description` text NOT NULL COMMENT '描述',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '数据插入的时间',
  `code` varchar(20) NOT NULL COMMENT '调用字符串，用于与程序结合',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '工作流的类型，1为多用户的类OA审核，2为辅助权限',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='工作流表';

-- ----------------------------
-- Records of bk_workflow
-- ----------------------------
INSERT INTO `bk_workflow` VALUES ('8', '测试工作流', '测试工作流2', '1434508916', 'W_sdfg', '1');
INSERT INTO `bk_workflow` VALUES ('10', '辅助权限测试2', '辅助权限测试2a', '1436510712', 'W_dd', '2');

-- ----------------------------
-- Table structure for `bk_workflow_step`
-- ----------------------------
DROP TABLE IF EXISTS `bk_workflow_step`;
CREATE TABLE `bk_workflow_step` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL COMMENT '所属的工作流',
  `name` varchar(255) NOT NULL COMMENT '工作流步骤的名称',
  `description` text NOT NULL COMMENT '工作流步骤的描述',
  `step_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '该工作流步骤所处的第几步,如果为99代表已经审核完成',
  `code` varchar(20) NOT NULL COMMENT '主要用于权限辅助调用',
  `addtime` int(11) NOT NULL COMMENT '数据增加的日期',
  PRIMARY KEY (`id`),
  KEY `workflow_id` (`workflow_id`) USING BTREE,
  KEY `step_level` (`step_level`) USING BTREE,
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='工作流的详细步骤';

-- ----------------------------
-- Records of bk_workflow_step
-- ----------------------------
INSERT INTO `bk_workflow_step` VALUES ('9', '8', '测试1', '1', '1', '', '1434516742');
INSERT INTO `bk_workflow_step` VALUES ('10', '8', '测试2', '2', '2', '', '1434516769');
INSERT INTO `bk_workflow_step` VALUES ('15', '10', '测试辅助权限工作流步骤', '测试辅助权限工作流步骤a', '0', 'W_sdfsf', '1436510782');

-- ----------------------------
-- Table structure for `bk_workflow_user`
-- ----------------------------
DROP TABLE IF EXISTS `bk_workflow_user`;
CREATE TABLE `bk_workflow_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_step_id` int(11) NOT NULL COMMENT '工作流步骤的ID',
  `user_id` int(11) NOT NULL COMMENT '后台管理员的ID',
  `workflow_id` int(11) NOT NULL COMMENT '工作流ID',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `workflow_step_id` (`workflow_step_id`) USING BTREE,
  KEY `workflow_id` (`workflow_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_workflow_user
-- ----------------------------
INSERT INTO `bk_workflow_user` VALUES ('23', '10', '3', '8');
INSERT INTO `bk_workflow_user` VALUES ('29', '9', '3', '8');
INSERT INTO `bk_workflow_user` VALUES ('30', '9', '1', '8');
INSERT INTO `bk_workflow_user` VALUES ('38', '15', '3', '10');
INSERT INTO `bk_workflow_user` VALUES ('39', '15', '1', '10');
