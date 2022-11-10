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

-- 正在导出表  supermarket.goods 的数据：~5 rows (大约)
INSERT INTO `goods` (`id`, `name`, `img`, `type`, `purchasing_price`, `sale_price`, `code`, `create_time`, `update_time`) VALUES
	('20fed4cf71a3465784984f1c93fd80e0', '阿萨姆', 'https://www.xdsucai.cn/wp-content/uploads/2021/01/1611107966-54446e0188f0434.png', 1, 110.000000, 120.000000, 'asm', '2022-11-04 14:50:15', '2022-11-10 15:01:19'),
	('281f5908608c44059096b99446b0d4a7', '可乐', 'https://ossmuyuanec.oss-cn-beijing.aliyuncs.com/Storage/Shop/1221/Products/17977/2.png', 1, 1.100000, 1.200000, 'kele', '2022-11-04 14:07:01', '2022-11-10 14:36:21'),
	('329437867128487ab3bd966645c9da9d', '香烟', 'https://th.bing.com/th/id/R.32b3469685726c03e3095eddcd9f2ba5?rik=JkDt3z1IHnnv0A&riu=http%3a%2f%2fpic3.nipic.com%2f20090625%2f47541_232010039_2.jpg&ehk=7KbtNeaMocQo83Xg8WGBOCukB6GpLflyIzgg%2bLFAPcw%3d&risl=&pid=ImgRaw&r=0', 3, 1.000000, 12.000000, 'xy', '2022-11-08 16:06:50', '2022-11-10 15:43:36'),
	('8245b5f363aa40618fb64d7694fefe0d', '东鹏', 'https://img.pkg.cn/worksimg/pkg-worksimg-95734--1496911489913480.jpg?x-oss-process=image/resize,m_lfit,w_1272', 2, 1.100000, 1.200000, 'dp', '2022-11-04 14:48:27', '2022-11-10 14:51:39'),
	('cdc0f57c5d8547b1941b103e170a6e5c', '百事可乐', 'https://th.bing.com/th/id/OIP.Zl1rZ9exM-UTmVWCBpS3gQHaHa?w=181&h=181&c=7&r=0&o=5&pid=1.7', 1, 1.100000, 1.200000, 'bskl', '2022-11-04 14:23:27', '2022-11-10 14:51:44');

-- 正在导出表  supermarket.goods_sales 的数据：~9 rows (大约)
INSERT INTO `goods_sales` (`id`, `goods_id`, `sale_num`, `create_time`) VALUES
	('02e37458b32840f0b910841d1438bad1', '281f5908608c44059096b99446b0d4a7', 0, '2022-11-10'),
	('2a2d1a404f2242938056218c660035cd', '329437867128487ab3bd966645c9da9d', 0, '2022-11-10'),
	('2ac2473f62b4426686ab11922f1ba77d', '20fed4cf71a3465784984f1c93fd80e0', 0, '2022-11-10'),
	('2db0a9e2d1c147d6ba1de052ad03af46', '20fed4cf71a3465784984f1c93fd80e0', 29, '2022-11-08'),
	('5e46a6d9129a47028b5c93e7a63cafcc', '8245b5f363aa40618fb64d7694fefe0d', 2, '2022-11-09'),
	('5fdf72b2ecd64ed79765cd886e299e55', '329437867128487ab3bd966645c9da9d', 7, '2022-11-08'),
	('669a2b966e0e40819e12177447ca2a9d', 'cdc0f57c5d8547b1941b103e170a6e5c', 11, '2022-11-09'),
	('6a0e3b3891294faa98a0ca09fb75e5fb', '329437867128487ab3bd966645c9da9d', 2, '2022-11-09'),
	('78ec2bd6e5234d10a9614a6a322c9e44', 'cdc0f57c5d8547b1941b103e170a6e5c', 9, '2022-11-08'),
	('832bc82a05294e9da3b2e1fd35b3ef25', '8245b5f363aa40618fb64d7694fefe0d', 8, '2022-11-08'),
	('939f03360fae425fa1168477b6ee1283', 'cdc0f57c5d8547b1941b103e170a6e5c', 0, '2022-11-10'),
	('9f750e50d27e47fba7750704e16c6a60', '281f5908608c44059096b99446b0d4a7', 7, '2022-11-08'),
	('b610f3da7fd142ae8e535e50da734aac', '8245b5f363aa40618fb64d7694fefe0d', 0, '2022-11-10'),
	('df9611140cc14e2dbc243bbf5915968e', '20fed4cf71a3465784984f1c93fd80e0', 7, '2022-11-09');

-- 正在导出表  supermarket.persistent_logins 的数据：~4 rows (大约)
INSERT INTO `persistent_logins` (`series`, `username`, `token`, `last_used`) VALUES
	('+8mwWuF/4AbX8F/svGGpxg==', 'sa', 'IeqLUatinoiitDIur/1xMw==', '2022-11-04 07:11:39'),
	('f1dWFrHsF2zIhTpXwT8jMg==', 'sa', '9uyA6NM56teEpEuVNiU0Rw==', '2022-11-10 07:43:15'),
	('sVQnrrVDhGMFT7qsVypxxA==', 'sa', '7S+d5vqbEgHNdVt5NfTCzg==', '2022-11-04 08:53:47'),
	('xDPlG7yprNyQPmJKIw0TBw==', 'sa', 'Rd+Qk9VUJuRHG/pJKDbrcg==', '2022-11-07 02:33:39');

-- 正在导出表  supermarket.sys_authority 的数据：~3 rows (大约)
INSERT INTO `sys_authority` (`authority_id`, `authority_name`, `authority_remark`, `create_time`, `update_time`, `authority_content`) VALUES
	('3fb1c570496d4c09ab99b8d31b06ccc', 'ROLE_USER', '普通用户', '2019-09-10 10:08:58', '2019-09-10 10:08:58', ''),
	('3fb1c570496d4c09ab99b8d31b06xxx', 'ROLE_SA', '超级管理员', '2019-09-10 10:08:58', '2019-09-10 10:08:58', '/sys/**,/logging'),
	('3fb1c570496d4c09ab99b8d31b06zzz', 'ROLE_ADMIN', '管理员', '2019-09-10 10:08:58', '2019-09-10 10:08:58', '/sys/**');

-- 正在导出表  supermarket.sys_menu 的数据：~12 rows (大约)
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `menu_path`, `menu_parent_id`, `sort_weight`, `create_time`, `update_time`) VALUES
	('098b591ac96e4f02beaa00f7e95f64a4', '销售报表', '/sales/report', '35cb950cebb04bb18bb1d8b742a02005', 0, '2022-11-09 11:41:33', '2022-11-09 14:20:35'),
	('35cb950cebb04bb18bb1d8b742a02005', '商品菜单', '/goods/index', '', 1, '2019-09-11 18:05:21', '2022-11-02 15:20:46'),
	('35cb950cebb04bb18bb1d8b742a02xaa', '权限管理', '/sys/sysAuthority/authority', '35cb950cebb04bb18bb1d8b742a02xxx', 1, '2019-09-10 10:08:58', '2019-09-10 10:08:58'),
	('35cb950cebb04bb18bb1d8b742a02xcc', '菜单管理', '/sys/sysMenu/menu', '35cb950cebb04bb18bb1d8b742a02xxx', 2, '2019-09-10 10:08:58', '2019-09-10 10:08:58'),
	('35cb950cebb04bb18bb1d8b742a02xxx', '系统管理', '/sys', '', 0, '2019-09-10 10:08:58', '2019-09-10 10:08:58'),
	('35cb950cebb04bb18bb1d8b742a02xzz', '用户管理', '/sys/sysUser/user', '35cb950cebb04bb18bb1d8b742a02xxx', 3, '2019-09-10 10:08:58', '2019-09-10 10:08:58'),
	('74315e162f524a4d88aa931f02416f26', '实时监控', '/monitor', '35cb950cebb04bb18bb1d8b742a02xxx', 4, '2020-06-10 15:07:07', '2020-06-10 15:07:07'),
	('78fb15a19e894777afbc239d574da423', 'yyy菜单', '', '', 2, '2020-10-16 13:04:41', '2020-10-16 13:04:41'),
	('914aa22c78af4327822061f3eada4067', '实时日志', '/logging', '35cb950cebb04bb18bb1d8b742a02xxx', 5, '2019-09-11 11:19:52', '2019-09-11 11:19:52'),
	('9a4b5cdab5604e4aad8e35de1350033c', '商品管理', '/goods/index', '35cb950cebb04bb18bb1d8b742a02005', 1, '2022-11-02 14:51:29', '2022-11-02 15:20:50'),
	('bcf17dc0ce304f0ba02d64ce21ddb4f9', '系统设置', '/sys/sysSetting/setting', '35cb950cebb04bb18bb1d8b742a02xxx', 0, '2019-09-17 10:46:11', '2019-09-17 10:46:11'),
	('d6d8b301316b43f2a9fb33caf1286376', '新增测试', '/aa', '35cb950cebb04bb18bb1d8b742a02xxx', 6, '2020-10-30 17:02:15', '2020-10-30 17:02:15'),
	('e464b792178043be887a5cc8aca941bd', '销售管理', '/sales/index', '35cb950cebb04bb18bb1d8b742a02005', 0, '2022-11-04 14:30:07', '2022-11-04 14:30:07');

-- 正在导出表  supermarket.sys_setting 的数据：~1 rows (大约)
INSERT INTO `sys_setting` (`id`, `sys_name`, `sys_logo`, `sys_bottom_text`, `sys_notice_text`, `create_time`, `update_time`, `user_init_password`, `sys_color`, `sys_api_encrypt`, `sys_open_api_limiter_encrypt`, `sys_check_pwd_encrypt`) VALUES
	('1', 'Base Admin', 'https://avatar.gitee.com/uploads/0/5137900_huanzi-qch.png!avatar100?1562729811', '© 2021 - 2023  Base Admin', '<h1 style="white-space: normal; text-align: center;"><span style="color: rgb(255, 0, 0);">通知</span></h1><p style="white-space: normal;"><span style="color: rgb(255, 0, 0);">1、不得在公共场合吸烟；</span></p><p style="white-space: normal;"><span style="color: rgb(255, 0, 0);">2、xxxxxxx；</span></p><p><br/></p>', '2019-09-17 10:15:38', '2019-09-17 10:15:40', '123456', 'rgba(54, 123, 183,  0.73)', 'Y', 'N', 'Y');

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

-- 正在导出表  supermarket.sys_user 的数据：~4 rows (大约)
INSERT INTO `sys_user` (`user_id`, `login_name`, `user_name`, `password`, `valid`, `limited_ip`, `expired_time`, `last_change_pwd_time`, `last_login_time`, `limit_multi_login`, `create_time`, `update_time`) VALUES
	('1', 'sa', '超级管理员', 'E10ADC3949BA59ABBE56E057F20F883E', 'Y', '', NULL, '2019-09-17 12:00:36', '2022-11-10 15:43:15', 'Y', '2019-07-19 16:36:03', '2022-11-09 14:18:33'),
	('2', 'admin', '管理员', 'E10ADC3949BA59ABBE56E057F20F883E', 'Y', '', NULL, '2019-09-17 12:00:36', '2019-09-17 12:00:36', 'N', '2019-07-19 16:36:03', '2019-09-12 16:14:28'),
	('3fb1c570496d4c09ab99b8d31b0671cf', 'daji', '妲己', 'E10ADC3949BA59ABBE56E057F20F883E', 'Y', '', NULL, '2019-09-17 12:00:36', '2022-11-01 17:45:40', 'Y', '2019-09-11 18:11:41', '2022-11-01 17:45:13'),
	('b5ac62e154964151a19c565346bb354a', 'xiaofang', '小芳', '96E79218965EB72C92A549DD5A330112', 'Y', '', NULL, '2019-09-17 12:00:36', '2019-09-17 12:00:36', 'N', '2019-09-17 14:12:41', '2019-09-17 14:28:57');

-- 正在导出表  supermarket.sys_user_authority 的数据：~7 rows (大约)
INSERT INTO `sys_user_authority` (`user_authority_id`, `user_id`, `authority_id`, `create_time`, `update_time`) VALUES
	('0dc1b156ed544c0986823e9cd818da08', '2', '3fb1c570496d4c09ab99b8d31b06ccc', '2019-09-12 16:14:28', '2019-09-12 16:14:28'),
	('115ae36af9574a3b9bf4744995560b7e', '1', '3fb1c570496d4c09ab99b8d31b06ccc', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('2897d72e70b24221810901b9f4c6ca16', '1', '3fb1c570496d4c09ab99b8d31b06xxx', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('a414567aaae54b42b8344da02795cb91', '2', '3fb1c570496d4c09ab99b8d31b06zzz', '2019-09-12 16:14:28', '2019-09-12 16:14:28'),
	('de60e5bbbacf4c739e44a60130d0f534', 'b5ac62e154964151a19c565346bb354a', '3fb1c570496d4c09ab99b8d31b06ccc', '2019-09-17 14:28:58', '2019-09-17 14:28:58'),
	('f8bec006f5d0479e8f8f577a22ddbfaa', '1', '3fb1c570496d4c09ab99b8d31b06zzz', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('fde4405ffa7d4523913090873bb419ff', '3fb1c570496d4c09ab99b8d31b0671cf', '3fb1c570496d4c09ab99b8d31b06ccc', '2022-11-01 17:45:13', '2022-11-01 17:45:13');

-- 正在导出表  supermarket.sys_user_menu 的数据：~21 rows (大约)
INSERT INTO `sys_user_menu` (`user_menu_id`, `user_id`, `menu_id`, `create_time`, `update_time`) VALUES
	('0417f6b3c63d4d37a25d4683f54671a6', '1', '35cb950cebb04bb18bb1d8b742a02xzz', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('3232782f25ec44b09438ab9805b85f83', '2', '35cb950cebb04bb18bb1d8b742a02xcc', '2019-09-12 16:14:28', '2019-09-12 16:14:28'),
	('33b886f285f644f58a70d86df3bd86ff', '1', '78fb15a19e894777afbc239d574da423', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('501bfd3baa164c95b7a30ef9f073b157', '1', '914aa22c78af4327822061f3eada4067', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('556fb21dec2949d6a1df0e2db4892428', '1', '35cb950cebb04bb18bb1d8b742a02xxx', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('57791437b9774d8abf74562a49c55a1a', '2', '35cb950cebb04bb18bb1d8b742a02xxx', '2019-09-12 16:14:28', '2019-09-12 16:14:28'),
	('5bb5789b5dc14156953bde07c1bfa7a9', '1', '9a4b5cdab5604e4aad8e35de1350033c', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('627343d2d9f24c268b8624fcbd2b7a72', '1', 'e464b792178043be887a5cc8aca941bd', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('64fe9898779546cfb37a2e850df1cfeb', '1', '098b591ac96e4f02beaa00f7e95f64a4', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('74051a4ccad2412e86fa132366a81173', '3fb1c570496d4c09ab99b8d31b0671cf', '914aa22c78af4327822061f3eada4067', '2022-11-01 17:45:13', '2022-11-01 17:45:13'),
	('790791142fec442498f8aa04c02ee74c', '1', 'bcf17dc0ce304f0ba02d64ce21ddb4f9', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('8f92d72625bd4a54baafd23c318f7c64', '1', '35cb950cebb04bb18bb1d8b742a02xaa', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('910fff6ce77e43d68de26c545db8a996', '3fb1c570496d4c09ab99b8d31b0671cf', '74315e162f524a4d88aa931f02416f26', '2022-11-01 17:45:13', '2022-11-01 17:45:13'),
	('9f8ccddc9fa84e0b9ff74128d20e9024', '2', '35cb950cebb04bb18bb1d8b742a02xaa', '2019-09-12 16:14:28', '2019-09-12 16:14:28'),
	('b1576a304bf34713a65bffa2bc49c77d', '1', '35cb950cebb04bb18bb1d8b742a02xcc', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('bfd1d3d41e74408cac0b0399730cce81', '3fb1c570496d4c09ab99b8d31b0671cf', '35cb950cebb04bb18bb1d8b742a02xxx', '2022-11-01 17:45:13', '2022-11-01 17:45:13'),
	('c4220e4602fd4f2ca70da046466c6b45', '2', '35cb950cebb04bb18bb1d8b742a02xzz', '2019-09-12 16:14:28', '2019-09-12 16:14:28'),
	('c4c865ce7e1247a7abc354d8a80c6158', '1', '35cb950cebb04bb18bb1d8b742a02005', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('d85419cba4164dd0b759af861f7b86df', '1', '74315e162f524a4d88aa931f02416f26', '2022-11-09 14:18:33', '2022-11-09 14:18:33'),
	('d8bfa6eb34ef4946bb2cd1b9c0dbac0d', 'b5ac62e154964151a19c565346bb354a', '35cb950cebb04bb18bb1d8b742a02005', '2019-09-17 14:28:58', '2019-09-17 14:28:58'),
	('e72b4226c0984f90a09cfa695b24f426', '3fb1c570496d4c09ab99b8d31b0671cf', '35cb950cebb04bb18bb1d8b742a02005', '2022-11-01 17:45:13', '2022-11-01 17:45:13'),
	('ebdbc0e58eb24231965602ab496fbcee', '1', 'd6d8b301316b43f2a9fb33caf1286376', '2022-11-09 14:18:33', '2022-11-09 14:18:33');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
