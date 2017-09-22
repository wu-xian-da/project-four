/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.24 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;
 
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('1','用户管理','/system','/system/users','users:list','1','1');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('2','角色管理','/system','/system/roles','roles:list','1','2');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('3','权限管理','/system','/system/menus','menus:list','1','3');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('4','新增','/system/users','/system/users/insert','users:insert','2','1');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('5','新增','/system/roles','/system/roles/insert','roles:insert','2','1');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('6','新增','/system/menus','/system/menus/insert','menus:insert','2','1');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('7','删除','/system/users','/system/users/delete/*','users:delete','2','3');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('8','查询','/system/menus','/system/menus/select','menus:select','2','4');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('9','查询','/system/roles','/system/roles/select','roles:select','2','4');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('10','编辑','/system/users','/system/users/update/*','users:update','2','2');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('11','查询','/system/users','/system/users/select','users:select','2','4');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('12','删除','/system/roles','/system/roles/delete/*','roles:delete','2','3');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('13','编辑','/system/roles','/system/roles/update/*','roles:update','2','2');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('14','删除','/system/menus','/system/menus/delete/*','menus:delete','2','3');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('15','编辑','/system/menus','/system/menus/update/*','menus:update','2','2');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('16','系统管理','/system','','system','0','1');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('17','系统日志','/log','','login','0','2');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('18','登录日志','/log','/log/logins','login:logins','1','1');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('19','访问日志','/log','/log/access','login:access','1','2');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('20','查询','/log/logins','/log/logins/select','logins:select','2','1');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('21','查询','/log/access','/log/access/select','access:select','2','1');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('22','测试项目','/test','','test','0','3');
insert into `sys_menus` (`id`, `name`, `parenthref`, `childshref`, `permission`, `type`, `sort`) values('23','测试1','/test','/test/one','test:one','1','1');
