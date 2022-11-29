-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.31 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 supermarket 的数据库结构
DROP DATABASE IF EXISTS `supermarket`;
CREATE DATABASE IF NOT EXISTS `supermarket` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `supermarket`;

-- 导出  表 supermarket.goods 结构
DROP TABLE IF EXISTS `goods`;
CREATE TABLE IF NOT EXISTS `goods` (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `img` varchar(512) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `purchasing_price` decimal(20,6) DEFAULT NULL,
  `sale_price` decimal(20,6) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='商品';

-- 正在导出表  supermarket.goods 的数据：~8 rows (大约)
INSERT INTO `goods` (`id`, `name`, `img`, `type`, `purchasing_price`, `sale_price`, `code`, `create_time`, `update_time`, `stock`) VALUES
	('20fed4cf71a3465784984f1c93fd80e0', '阿萨姆', 'https://www.xdsucai.cn/wp-content/uploads/2021/01/1611107966-54446e0188f0434.png', 1, 2.000000, 3.000000, 'asm', '2022-11-04 14:50:15', '2022-11-18 16:01:16', 87),
	('281f5908608c44059096b99446b0d4a7', '可乐', 'https://ossmuyuanec.oss-cn-beijing.aliyuncs.com/Storage/Shop/1221/Products/17977/2.png', 1, 1.000000, 3.000000, 'kele9', '2022-11-04 14:07:01', '2022-11-18 16:01:41', 50),
	('329437867128487ab3bd966645c9da9d', '香烟', 'https://th.bing.com/th/id/R.32b3469685726c03e3095eddcd9f2ba5?rik=JkDt3z1IHnnv0A&riu=http%3a%2f%2fpic3.nipic.com%2f20090625%2f47541_232010039_2.jpg&ehk=7KbtNeaMocQo83Xg8WGBOCukB6GpLflyIzgg%2bLFAPcw%3d&risl=&pid=ImgRaw&r=0', 4, 2.000000, 3.000000, 'xy', '2022-11-08 16:06:50', '2022-11-18 16:01:30', 0),
	('8245b5f363aa40618fb64d7694fefe0d', '王中王', 'https://img.pkg.cn/worksimg/pkg-worksimg-95734--1496911489913480.jpg?x-oss-process=image/resize,m_lfit,w_1272', 3, 1.100000, 1.200000, 'dp', '2022-11-04 14:48:27', '2022-11-18 16:02:15', 7),
	('85a40045f63e45068b2daf5e48c78a6f', '1233', 'https://th.bing.com/th/id/OIP.Zl1rZ9exM-UTmVWCBpS3gQHaHa?w=181&h=181&c=7&r=0&o=5&pid=1.7', 1, 1.000000, 2.000000, '1', '2022-11-25 17:40:29', '2022-11-25 17:41:17', 1),
	('cdc0f57c5d8547b1941b103e170a6e5c', '百事可乐', 'https://th.bing.com/th/id/OIP.Zl1rZ9exM-UTmVWCBpS3gQHaHa?w=181&h=181&c=7&r=0&o=5&pid=1.7', 1, 10.000000, 12.000000, 'bskl', '2022-11-04 14:23:27', '2022-11-18 16:01:59', 0),
	('cdc0f57c5d8547b1941b103e170a6e5c1', '百事可乐2', 'https://th.bing.com/th/id/R.171e8fe1aa1544a1868ab710eed82d82?rik=FLPxvVVL9C9bnQ&riu=http%3a%2f%2fwww.pp3.cn%2fuploads%2fallimg%2f200710%2f14-200G00Z321.jpg&ehk=Lb0IHCCZIdqYQOi28m%2borU8c1ARGbTEC%2f8WYzfwRuHo%3d&risl=&pid=ImgRaw&r=0', 1, 10.000000, 12.000000, 'a', NULL, NULL, 0),
	('cdc0f57c5d8547b1941b103e170a6e5c2', '百事可乐3', 'https://th.bing.com/th/id/R.171e8fe1aa1544a1868ab710eed82d82?rik=FLPxvVVL9C9bnQ&riu=http%3a%2f%2fwww.pp3.cn%2fuploads%2fallimg%2f200710%2f14-200G00Z321.jpg&ehk=Lb0IHCCZIdqYQOi28m%2borU8c1ARGbTEC%2f8WYzfwRuHo%3d&risl=&pid=ImgRaw&r=0', 1, 10.000000, 12.000000, 'a', NULL, NULL, 0);

-- 导出  表 supermarket.orders 结构
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '销售额',
  `create_time` datetime NOT NULL,
  `pay_type` tinyint NOT NULL DEFAULT '0',
  `user_name` varchar(50) DEFAULT NULL,
  `cost` decimal(20,6) DEFAULT NULL COMMENT '成本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='订单表';

-- 正在导出表  supermarket.orders 的数据：~0 rows (大约)
INSERT INTO `orders` (`id`, `amount`, `create_time`, `pay_type`, `user_name`, `cost`) VALUES
	('33828de1e040412c9a4ec4b1b5bce913', 9.000000, '2022-11-29 15:58:51', 1, 'sa', 5.000000);

-- 导出  表 supermarket.order_details 结构
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `good_id` varchar(50) DEFAULT NULL,
  `purchasing_price` decimal(20,6) DEFAULT '0.000000',
  `sale_price` decimal(20,6) DEFAULT '0.000000',
  `sale_num` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='订单详情';

-- 正在导出表  supermarket.order_details 的数据：~0 rows (大约)
INSERT INTO `order_details` (`id`, `order_id`, `good_id`, `purchasing_price`, `sale_price`, `sale_num`) VALUES
	('0200b7a598d248608b35ee1374c45e1a', '33828de1e040412c9a4ec4b1b5bce913', '20fed4cf71a3465784984f1c93fd80e0', 2.000000, 3.000000, 2),
	('dd293e844030406d8573ef0a279eca4a', '33828de1e040412c9a4ec4b1b5bce913', '281f5908608c44059096b99446b0d4a7', 1.000000, 3.000000, 1);

-- 导出  表 supermarket.persistent_logins 结构
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE IF NOT EXISTS `persistent_logins` (
  `series` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'id',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登陆账号',
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cookie令牌',
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='persistent_logins表，用户实现记住我功能';

-- 正在导出表  supermarket.persistent_logins 的数据：~6 rows (大约)
INSERT INTO `persistent_logins` (`series`, `username`, `token`, `last_used`) VALUES
	('52SGaDrvdkDVL95VVhHxqg==', 'sa', '6wQn22EKegRcuqEtacoExw==', '2022-11-15 02:31:46'),
	('f1dWFrHsF2zIhTpXwT8jMg==', 'sa', 'n21x2ljQFnmNn/064ey7Ow==', '2022-11-15 01:46:13'),
	('KNxy7uas7FtvViFXANqJmw==', 'sa', '5Q5hkPJ5+fxlj3oyT79BDA==', '2022-11-29 07:58:16'),
	('sVQnrrVDhGMFT7qsVypxxA==', 'sa', '7S+d5vqbEgHNdVt5NfTCzg==', '2022-11-04 08:53:47'),
	('wVoY7t1z07nPWaWc/CZVuw==', 'sa', '0Spf5ZZJnj7bmKgx2RVDtQ==', '2022-11-28 08:46:48'),
	('xDPlG7yprNyQPmJKIw0TBw==', 'sa', 'Rd+Qk9VUJuRHG/pJKDbrcg==', '2022-11-07 02:33:39');

-- 导出  表 supermarket.sys_authority 结构
DROP TABLE IF EXISTS `sys_authority`;
CREATE TABLE IF NOT EXISTS `sys_authority` (
  `authority_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '权限id',
  `authority_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '权限名称，ROLE_开头，全大写',
  `authority_remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '权限描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `authority_content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '权限内容，可访问的url，多个时用,隔开',
  PRIMARY KEY (`authority_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统权限表';

-- 正在导出表  supermarket.sys_authority 的数据：~2 rows (大约)
INSERT INTO `sys_authority` (`authority_id`, `authority_name`, `authority_remark`, `create_time`, `update_time`, `authority_content`) VALUES
	('3fb1c570496d4c09ab99b8d31b06ccc', 'ROLE_USER', '普通用户', '2019-09-10 10:08:58', '2019-09-10 10:08:58', ''),
	('3fb1c570496d4c09ab99b8d31b06xxx', 'ROLE_SA', '超级管理员', '2019-09-10 10:08:58', '2019-09-10 10:08:58', '/sys/**,/logging'),
	('3fb1c570496d4c09ab99b8d31b06zzz', 'ROLE_ADMIN', '管理员', '2019-09-10 10:08:58', '2019-09-10 10:08:58', '/sys/**');

-- 导出  表 supermarket.sys_menu 结构
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `menu_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单id',
  `menu_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单名称',
  `menu_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单路径',
  `menu_parent_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '上级id',
  `sort_weight` int DEFAULT NULL COMMENT '同级排序权重：0-10',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统菜单表';

-- 正在导出表  supermarket.sys_menu 的数据：~15 rows (大约)
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `menu_path`, `menu_parent_id`, `sort_weight`, `create_time`, `update_time`) VALUES
	('098b591ac96e4f02beaa00f7e95f64a4', '订单报表管理', '/report/reportAdmin', '35cb950cebb04bb18bb1d8b742a02005', 3, '2022-11-09 11:41:33', '2022-11-29 14:22:32'),
	('22c09d38c2ec4121a903a9f5eb34f1d3', '年度销售管理', '/report/reports', '35cb950cebb04bb18bb1d8b742a02005', 4, '2022-11-16 17:25:55', '2022-11-29 12:03:36'),
	('35cb950cebb04bb18bb1d8b742a02005', '商品菜单', '/goods/index', '', 1, '2019-09-11 18:05:21', '2022-11-02 15:20:46'),
	('35cb950cebb04bb18bb1d8b742a02xaa', '权限管理', '/sys/sysAuthority/authority', '35cb950cebb04bb18bb1d8b742a02xxx', 1, '2019-09-10 10:08:58', '2019-09-10 10:08:58'),
	('35cb950cebb04bb18bb1d8b742a02xcc', '菜单管理', '/sys/sysMenu/menu', '35cb950cebb04bb18bb1d8b742a02xxx', 2, '2019-09-10 10:08:58', '2019-09-10 10:08:58'),
	('35cb950cebb04bb18bb1d8b742a02xxx', '系统管理', '/sys', '', 0, '2019-09-10 10:08:58', '2019-09-10 10:08:58'),
	('35cb950cebb04bb18bb1d8b742a02xzz', '用户管理', '/sys/sysUser/user', '35cb950cebb04bb18bb1d8b742a02xxx', 3, '2019-09-10 10:08:58', '2019-09-10 10:08:58'),
	('74315e162f524a4d88aa931f02416f26', '实时监控', '/monitor', '35cb950cebb04bb18bb1d8b742a02xxx', 4, '2020-06-10 15:07:07', '2020-06-10 15:07:07'),
	('78fb15a19e894777afbc239d574da423', 'yyy菜单', '', '', 2, '2020-10-16 13:04:41', '2020-10-16 13:04:41'),
	('7ef2bb01c26b43c0ae93fac2243993ab', '订单页面', '/report/report', '35cb950cebb04bb18bb1d8b742a02005', 0, '2022-11-29 12:01:27', '2022-11-29 14:22:52'),
	('914aa22c78af4327822061f3eada4067', '实时日志', '/logging', '35cb950cebb04bb18bb1d8b742a02xxx', 5, '2019-09-11 11:19:52', '2019-09-11 11:19:52'),
	('9a4b5cdab5604e4aad8e35de1350033c', '商品管理', '/goods/index', '35cb950cebb04bb18bb1d8b742a02005', 2, '2022-11-02 14:51:29', '2022-11-29 12:03:54'),
	('bcf17dc0ce304f0ba02d64ce21ddb4f9', '系统设置', '/sys/sysSetting/setting', '35cb950cebb04bb18bb1d8b742a02xxx', 0, '2019-09-17 10:46:11', '2019-09-17 10:46:11'),
	('d6d8b301316b43f2a9fb33caf1286376', '新增测试', '/aa', '35cb950cebb04bb18bb1d8b742a02xxx', 6, '2020-10-30 17:02:15', '2020-10-30 17:02:15'),
	('e464b792178043be887a5cc8aca941bd', '销售页面', '/sales/index', '35cb950cebb04bb18bb1d8b742a02005', 1, '2022-11-04 14:30:07', '2022-11-29 12:03:29');

-- 导出  表 supermarket.sys_setting 结构
DROP TABLE IF EXISTS `sys_setting`;
CREATE TABLE IF NOT EXISTS `sys_setting` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表id',
  `sys_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '系统名称',
  `sys_logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '系统logo图标',
  `sys_bottom_text` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '系统底部信息',
  `sys_notice_text` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '系统公告',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `user_init_password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户管理：初始、重置密码',
  `sys_color` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '系统颜色',
  `sys_api_encrypt` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'API加密 Y/N',
  `sys_open_api_limiter_encrypt` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'OpenAPI限流 Y/N',
  `sys_check_pwd_encrypt` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '检查密码复杂度 Y/N',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统设置表';

-- 正在导出表  supermarket.sys_setting 的数据：~0 rows (大约)
INSERT INTO `sys_setting` (`id`, `sys_name`, `sys_logo`, `sys_bottom_text`, `sys_notice_text`, `create_time`, `update_time`, `user_init_password`, `sys_color`, `sys_api_encrypt`, `sys_open_api_limiter_encrypt`, `sys_check_pwd_encrypt`) VALUES
	('1', 'Base Admin', 'https://avatar.gitee.com/uploads/0/5137900_huanzi-qch.png!avatar100?1562729811', '© 2021 - 2023  Base Admin', '<h1 style="white-space: normal; text-align: center;"><span style="color: rgb(255, 0, 0);">通知</span></h1><p style="white-space: normal;"><span style="color: rgb(255, 0, 0);">1、不得在公共场合吸烟；</span></p><p style="white-space: normal;"><span style="color: rgb(255, 0, 0);">2、xxxxxxx；</span></p><p><br/></p>', '2019-09-17 10:15:38', '2019-09-17 10:15:40', '123456', 'rgba(54, 123, 183,  0.73)', 'Y', 'N', 'Y');

-- 导出  表 supermarket.sys_shortcut_menu 结构
DROP TABLE IF EXISTS `sys_shortcut_menu`;
CREATE TABLE IF NOT EXISTS `sys_shortcut_menu` (
  `shortcut_menu_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户快捷菜单id',
  `shortcut_menu_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户快捷菜单名称',
  `shortcut_menu_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户快捷菜单路径',
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户id',
  `shortcut_menu_parent_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '上级id',
  `sort_weight` int DEFAULT NULL COMMENT '同级排序权重：0-10',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`shortcut_menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='用户快捷菜单表';

-- 正在导出表  supermarket.sys_shortcut_menu 的数据：~8 rows (大约)
INSERT INTO `sys_shortcut_menu` (`shortcut_menu_id`, `shortcut_menu_name`, `shortcut_menu_path`, `user_id`, `shortcut_menu_parent_id`, `sort_weight`, `create_time`, `update_time`) VALUES
	('104370a3fa7948bab156afd4a5f2a730', '个性化菜单', '', '1', '', 0, '2019-09-12 18:35:13', '2019-09-12 18:35:13'),
	('72d94b41b9994038bd2f2135a1de28d8', '快捷菜单', '', 'b5ac62e154964151a19c565346bb354a', '', 0, '2019-09-17 14:36:28', '2019-09-17 14:36:28'),
	('88353f04ad5d47b182c984bfbb1693cc', 'ggg', '/xxx', 'b5ac62e154964151a19c565346bb354a', '72d94b41b9994038bd2f2135a1de28d8', 0, '2019-09-17 14:36:50', '2019-09-17 14:36:50'),
	('bd36d4507327434eb57b67b21343246f', '腾讯云', 'https://cloud.tencent.com/', '1', '104370a3fa7948bab156afd4a5f2a730', 0, '2020-10-15 18:42:39', '2020-12-31 14:44:18'),
	('c309dafafe964a9d8de021b0da193bad', '啊啊啊', '/aaa', '1', 'db234c8f4fad4b0c9a4522e872c0f588', 0, '2020-10-16 10:20:20', '2020-10-16 10:20:20'),
	('cf78ced9ce7b480c85812540d1936145', '百度', 'https://www.baidu.com', '1', '104370a3fa7948bab156afd4a5f2a730', 2, '2019-09-12 18:35:39', '2020-12-31 14:44:27'),
	('cf78ced9ce7b480c85fd2540d1936145', '阿里云', 'https://www.aliyun.com/', '1', '104370a3fa7948bab156afd4a5f2a730', 1, '2019-09-12 18:35:39', '2020-12-31 14:44:23'),
	('db234c8f4fad4b0c9a4522e872c0f588', '菜单2', '', '1', '', 1, '2020-10-16 10:20:02', '2020-10-16 10:20:02');

-- 导出  表 supermarket.sys_user 结构
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户id',
  `login_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录名',
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录密码',
  `valid` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '软删除标识，Y/N',
  `limited_ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '限制允许登录的IP集合',
  `expired_time` datetime DEFAULT NULL COMMENT '账号失效时间，超过时间将不能登录系统',
  `last_change_pwd_time` datetime NOT NULL COMMENT '最近修改密码时间，超出时间间隔，提示用户修改密码',
  `last_login_time` datetime NOT NULL COMMENT '最近登录时间，最后活跃时间',
  `limit_multi_login` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否允许账号同一个时刻多人在线，Y/N',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统用户表';

-- 正在导出表  supermarket.sys_user 的数据：~4 rows (大约)
INSERT INTO `sys_user` (`user_id`, `login_name`, `user_name`, `password`, `valid`, `limited_ip`, `expired_time`, `last_change_pwd_time`, `last_login_time`, `limit_multi_login`, `create_time`, `update_time`) VALUES
	('1', 'sa', '超级管理员', 'E10ADC3949BA59ABBE56E057F20F883E', 'Y', '', NULL, '2019-09-17 12:00:36', '2022-11-29 15:58:16', 'Y', '2019-07-19 16:36:03', '2022-11-29 12:04:37'),
	('2', 'admin', '管理员', 'E10ADC3949BA59ABBE56E057F20F883E', 'Y', '', NULL, '2019-09-17 12:00:36', '2019-09-17 12:00:36', 'N', '2019-07-19 16:36:03', '2019-09-12 16:14:28'),
	('3fb1c570496d4c09ab99b8d31b0671cf', 'daji', '妲己', 'E10ADC3949BA59ABBE56E057F20F883E', 'Y', '', NULL, '2019-09-17 12:00:36', '2022-11-01 17:45:40', 'Y', '2019-09-11 18:11:41', '2022-11-01 17:45:13'),
	('b5ac62e154964151a19c565346bb354a', 'xiaofang', '小芳', '96E79218965EB72C92A549DD5A330112', 'Y', '', NULL, '2019-09-17 12:00:36', '2019-09-17 12:00:36', 'N', '2019-09-17 14:12:41', '2019-09-17 14:28:57');

-- 导出  表 supermarket.sys_user_authority 结构
DROP TABLE IF EXISTS `sys_user_authority`;
CREATE TABLE IF NOT EXISTS `sys_user_authority` (
  `user_authority_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户权限表id',
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户id',
  `authority_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '权限id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_authority_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='用户权限表';

-- 正在导出表  supermarket.sys_user_authority 的数据：~7 rows (大约)
INSERT INTO `sys_user_authority` (`user_authority_id`, `user_id`, `authority_id`, `create_time`, `update_time`) VALUES
	('0b995c4b5aaa482ca3f57766d3720f2d', '1', '3fb1c570496d4c09ab99b8d31b06zzz', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('0dc1b156ed544c0986823e9cd818da08', '2', '3fb1c570496d4c09ab99b8d31b06ccc', '2019-09-12 16:14:28', '2019-09-12 16:14:28'),
	('3255bb7382ec4ae7ac5961c93db3a871', '1', '3fb1c570496d4c09ab99b8d31b06ccc', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('8e1868f515524e5ca3ba316ba8660b49', '1', '3fb1c570496d4c09ab99b8d31b06xxx', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('a414567aaae54b42b8344da02795cb91', '2', '3fb1c570496d4c09ab99b8d31b06zzz', '2019-09-12 16:14:28', '2019-09-12 16:14:28'),
	('de60e5bbbacf4c739e44a60130d0f534', 'b5ac62e154964151a19c565346bb354a', '3fb1c570496d4c09ab99b8d31b06ccc', '2019-09-17 14:28:58', '2019-09-17 14:28:58'),
	('fde4405ffa7d4523913090873bb419ff', '3fb1c570496d4c09ab99b8d31b0671cf', '3fb1c570496d4c09ab99b8d31b06ccc', '2022-11-01 17:45:13', '2022-11-01 17:45:13');

-- 导出  表 supermarket.sys_user_menu 结构
DROP TABLE IF EXISTS `sys_user_menu`;
CREATE TABLE IF NOT EXISTS `sys_user_menu` (
  `user_menu_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户菜单表id',
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户id',
  `menu_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='用户菜单表';

-- 正在导出表  supermarket.sys_user_menu 的数据：~24 rows (大约)
INSERT INTO `sys_user_menu` (`user_menu_id`, `user_id`, `menu_id`, `create_time`, `update_time`) VALUES
	('3232782f25ec44b09438ab9805b85f83', '2', '35cb950cebb04bb18bb1d8b742a02xcc', '2019-09-12 16:14:28', '2019-09-12 16:14:28'),
	('57791437b9774d8abf74562a49c55a1a', '2', '35cb950cebb04bb18bb1d8b742a02xxx', '2019-09-12 16:14:28', '2019-09-12 16:14:28'),
	('5beb57606c99471cb7dbddda6bd29e3c', '1', 'e464b792178043be887a5cc8aca941bd', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('5dbbdf3d3d4c46e599e6b580ebc324fa', '1', '9a4b5cdab5604e4aad8e35de1350033c', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('682324fcbc0e488f9f576597d49a5b1c', '1', '35cb950cebb04bb18bb1d8b742a02005', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('6d7c5e3e57544052af735902cbc43b39', '1', '78fb15a19e894777afbc239d574da423', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('6f86d9fb64684a0baf023479de9fbe23', '1', '35cb950cebb04bb18bb1d8b742a02xxx', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('74051a4ccad2412e86fa132366a81173', '3fb1c570496d4c09ab99b8d31b0671cf', '914aa22c78af4327822061f3eada4067', '2022-11-01 17:45:13', '2022-11-01 17:45:13'),
	('887e055d956545c7825a49620954abd4', '1', '35cb950cebb04bb18bb1d8b742a02xcc', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('910fff6ce77e43d68de26c545db8a996', '3fb1c570496d4c09ab99b8d31b0671cf', '74315e162f524a4d88aa931f02416f26', '2022-11-01 17:45:13', '2022-11-01 17:45:13'),
	('922ca64356a042c7a4033327cd496529', '1', '22c09d38c2ec4121a903a9f5eb34f1d3', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('9f8ccddc9fa84e0b9ff74128d20e9024', '2', '35cb950cebb04bb18bb1d8b742a02xaa', '2019-09-12 16:14:28', '2019-09-12 16:14:28'),
	('a48270a483ee49998d86e355ab973165', '1', '74315e162f524a4d88aa931f02416f26', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('aa39920d5899475ab0e9d7e4651fcf99', '1', '35cb950cebb04bb18bb1d8b742a02xzz', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('aa7b80b22dcc4da394b13e5812ee0ad0', '1', 'bcf17dc0ce304f0ba02d64ce21ddb4f9', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('bfd1d3d41e74408cac0b0399730cce81', '3fb1c570496d4c09ab99b8d31b0671cf', '35cb950cebb04bb18bb1d8b742a02xxx', '2022-11-01 17:45:13', '2022-11-01 17:45:13'),
	('bfd65a162aba4c00a6426bbf024795a1', '1', '35cb950cebb04bb18bb1d8b742a02xaa', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('c4220e4602fd4f2ca70da046466c6b45', '2', '35cb950cebb04bb18bb1d8b742a02xzz', '2019-09-12 16:14:28', '2019-09-12 16:14:28'),
	('cdccce7256f84fe8bbcc0e3147a15f06', '1', '7ef2bb01c26b43c0ae93fac2243993ab', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('d8bfa6eb34ef4946bb2cd1b9c0dbac0d', 'b5ac62e154964151a19c565346bb354a', '35cb950cebb04bb18bb1d8b742a02005', '2019-09-17 14:28:58', '2019-09-17 14:28:58'),
	('e32734766faf4191bb4bc7a68877be2c', '1', 'd6d8b301316b43f2a9fb33caf1286376', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('e72b4226c0984f90a09cfa695b24f426', '3fb1c570496d4c09ab99b8d31b0671cf', '35cb950cebb04bb18bb1d8b742a02005', '2022-11-01 17:45:13', '2022-11-01 17:45:13'),
	('f148b416ebef44c386ff2670713960fa', '1', '914aa22c78af4327822061f3eada4067', '2022-11-29 12:04:37', '2022-11-29 12:04:37'),
	('f495d81612cb41f89e17daf32c011829', '1', '098b591ac96e4f02beaa00f7e95f64a4', '2022-11-29 12:04:37', '2022-11-29 12:04:37');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
