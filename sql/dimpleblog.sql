/*
Navicat MySQL Data Transfer

Source Server         : 116.62.231.166
Source Server Version : 50727
Source Host           : 116.62.231.166:3306
Source Database       : dimpleblog

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2019-10-25 11:31:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bg_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `bg_blacklist`;
CREATE TABLE `bg_blacklist` (
  `blacklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_addr` varchar(64) DEFAULT NULL COMMENT '黑名单的IP地址',
  `description` varchar(128) DEFAULT NULL COMMENT '封禁原因',
  `count` int(11) DEFAULT '0' COMMENT '拦截次数',
  `last_access_time` datetime DEFAULT NULL COMMENT '最近一次访问的时间',
  `last_access_url` varchar(64) DEFAULT NULL COMMENT '上一次请求的地址',
  `create_by` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`blacklist_id`),
  UNIQUE KEY `ip_addr` (`ip_addr`) COMMENT 'IP地址唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='黑名单';

-- ----------------------------
-- Records of bg_blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for bg_blog
-- ----------------------------
DROP TABLE IF EXISTS `bg_blog`;
CREATE TABLE `bg_blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客id\n',
  `category_id` int(11) DEFAULT NULL COMMENT '归类id',
  `title` varchar(256) DEFAULT NULL COMMENT '博文标题',
  `summary` varchar(256) DEFAULT NULL COMMENT '博文摘要',
  `status` char(1) DEFAULT '1' COMMENT '博文状态，1表示已经发表，2表示在草稿箱，3表示在垃圾箱',
  `weight` int(11) DEFAULT '0' COMMENT '权重',
  `support` char(1) DEFAULT '0' COMMENT '是否推荐，1表示推荐，0表示不推荐',
  `click` int(11) DEFAULT '0' COMMENT '点击次数',
  `header_img` varchar(256) DEFAULT NULL COMMENT '标图展示地址',
  `allow_comment` tinyint(1) DEFAULT '1' COMMENT '是否允许评论',
  `type` char(1) DEFAULT '2' COMMENT '博文类型，1表示markdown，2表示富文本',
  `content` text COMMENT '博文正文内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  UNIQUE KEY `blog_id` (`blog_id`,`category_id`) COMMENT '博文ID和分类Id的联合唯一索引',
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='博客';

-- ----------------------------
-- Records of bg_blog
-- ----------------------------
INSERT INTO `bg_blog` VALUES ('78', '53', '新增数据', '新增数据', '3', '1', '0', '2', 'http://localhost/img/blog-default.png', '1', '2', '<p>新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据<br></p>', 'admin', '2019-10-14 17:14:32', null, null);
INSERT INTO `bg_blog` VALUES ('79', '53', '博客标题', '博客标题', '1', '0', '0', '1', 'http://localhost/img/blog-default.png', '1', '2', '<p>博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题<br></p>', 'admin', '2019-10-17 13:04:42', null, null);
INSERT INTO `bg_blog` VALUES ('80', '50', 'nginx简单配置负载均衡、静态资源', 'nginx', '2', '1', '0', '6', 'http://localhost/img/blog-default.png', '1', '2', '<p><br></p><p>#user&nbsp; nobody;</p><p>worker_processes&nbsp; 1;</p><p><br></p><p>#error_log&nbsp; logs/error.log;</p><p>#error_log&nbsp; logs/error.log&nbsp; notice;</p><p>#error_log&nbsp; logs/error.log&nbsp; info;</p><p><br></p><p>#pid&nbsp; &nbsp; &nbsp; &nbsp; logs/nginx.pid;</p><p><br></p><p><br></p><p>events {</p><p>&nbsp; &nbsp; worker_connections&nbsp; 1024;</p><p>}</p><p><br></p><p><br></p><p>http {</p><p>&nbsp; &nbsp; include&nbsp; &nbsp; &nbsp; &nbsp;mime.types;</p><p>&nbsp; &nbsp; default_type&nbsp; application/octet-stream;</p><p><br></p><p>&nbsp; &nbsp; #log_format&nbsp; main&nbsp; \'$remote_addr - $remote_user [$time_local] \"$request\" \'</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \'$status $body_bytes_sent \"$http_referer\" \'</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \'\"$http_user_agent\" \"$http_x_forwarded_for\"\';</p><p><br></p><p>&nbsp; &nbsp; #access_log&nbsp; logs/access.log&nbsp; main;</p><p><br></p><p>&nbsp; &nbsp; sendfile&nbsp; &nbsp; &nbsp; &nbsp; on;</p><p>&nbsp; &nbsp; #tcp_nopush&nbsp; &nbsp; &nbsp;on;</p><p><br></p><p>&nbsp; &nbsp; #keepalive_timeout&nbsp; 0;</p><p>&nbsp; &nbsp; keepalive_timeout&nbsp; 65;</p><p><br></p><p>&nbsp; &nbsp; #gzip&nbsp; on;</p><p><span style=\"white-space:pre\">	</span></p><p><span style=\"white-space:pre\">	</span>upstream blogserver {&nbsp; #配置轮训请求应用服务器</p><p><span style=\"white-space:pre\">		</span>server 192.168.6.177:10088;&nbsp;&nbsp;</p><p><span style=\"white-space:pre\">		</span>server 192.168.6.177:10099;&nbsp;&nbsp;</p><p>&nbsp; &nbsp; }</p><p><br></p><p>&nbsp; &nbsp; server {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; listen&nbsp; &nbsp; &nbsp; &nbsp;80; #默认端口</p><p>&nbsp; &nbsp; &nbsp; &nbsp; server_name&nbsp; localhost;#默认id</p><p><br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; #charset koi8-r;</p><p><br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; #access_log&nbsp; logs/host.access.log&nbsp; main;</p><p><br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; location / {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; root&nbsp; &nbsp;html;</p><p><span style=\"white-space:pre\">			</span>proxy_pass&nbsp; &nbsp;http://blogserver;&nbsp; #拦截所有/请求 跳转到</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; index&nbsp; index.html index.htm;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; }</p><p><br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; #error_page&nbsp; 404&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /404.html;</p><p><br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; # redirect server error pages to the static page /50x.html</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #</p><p>&nbsp; &nbsp; &nbsp; &nbsp; error_page&nbsp; &nbsp;500 502 503 504&nbsp; /50x.html;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; location = /50x.html {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; root&nbsp; &nbsp;html;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; }</p><p><br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; # proxy the PHP scripts to Apache listening on 127.0.0.1:80</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #location ~ \\.php$ {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #&nbsp; &nbsp; proxy_pass&nbsp; &nbsp;http://127.0.0.1;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #}</p><p><br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #location ~ \\.php$ {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #&nbsp; &nbsp; root&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #&nbsp; &nbsp; fastcgi_pass&nbsp; &nbsp;127.0.0.1:9000;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #&nbsp; &nbsp; fastcgi_index&nbsp; index.php;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #&nbsp; &nbsp; fastcgi_param&nbsp; SCRIPT_FILENAME&nbsp; /scripts$fastcgi_script_name;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #&nbsp; &nbsp; include&nbsp; &nbsp; &nbsp; &nbsp; fastcgi_params;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #}</p><p><br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; # deny access to .htaccess files, if Apache\'s document root</p><p>&nbsp; &nbsp; &nbsp; &nbsp; # concurs with nginx\'s one</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #location ~ /\\.ht {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #&nbsp; &nbsp; deny&nbsp; all;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; #}</p><p>&nbsp; &nbsp; }</p><p><span style=\"white-space:pre\">	</span></p><p><span style=\"white-space:pre\">	</span>server {&nbsp; #这里是我自己配置服务端口</p><p>&nbsp; &nbsp; &nbsp; &nbsp; listen&nbsp; &nbsp; &nbsp; &nbsp;8081;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; server_name resouce;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; root&nbsp; F:/nginx/nginx-1.8.1/image-test;&nbsp; #访问文件根目录</p><p>&nbsp; &nbsp; &nbsp; &nbsp; autoindex on;&nbsp; #是否浏览文件下的列表</p><p>&nbsp; &nbsp; &nbsp; &nbsp; location / {&nbsp; #是否允许跨域</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; add_header Access-Control-Allow-Origin *;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; }</p><p>&nbsp; &nbsp; &nbsp; &nbsp; add_header Cache-Control \"no-cache,must-revalidate\";# 是否缓存</p><p>&nbsp; &nbsp; }</p><p><br></p><p><br></p><p>&nbsp; &nbsp; # another virtual host using mix of IP-, name-, and port-based configuration</p><p>&nbsp; &nbsp; #</p><p>&nbsp; &nbsp; #server {</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; listen&nbsp; &nbsp; &nbsp; &nbsp;8000;</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; listen&nbsp; &nbsp; &nbsp; &nbsp;somename:8080;</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; server_name&nbsp; somename&nbsp; alias&nbsp; another.alias;</p><p><br></p><p>&nbsp; &nbsp; #&nbsp; &nbsp; location / {</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; &nbsp; &nbsp; root&nbsp; &nbsp;html;</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; &nbsp; &nbsp; index&nbsp; index.html index.htm;</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; }</p><p>&nbsp; &nbsp; #}</p><p><br></p><p><br></p><p>&nbsp; &nbsp; # HTTPS server</p><p>&nbsp; &nbsp; #</p><p>&nbsp; &nbsp; #server {</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; listen&nbsp; &nbsp; &nbsp; &nbsp;443 ssl;</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; server_name&nbsp; localhost;</p><p><br></p><p>&nbsp; &nbsp; #&nbsp; &nbsp; ssl_certificate&nbsp; &nbsp; &nbsp; cert.pem;</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; ssl_certificate_key&nbsp; cert.key;</p><p><br></p><p>&nbsp; &nbsp; #&nbsp; &nbsp; ssl_session_cache&nbsp; &nbsp; shared:SSL:1m;</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; ssl_session_timeout&nbsp; 5m;</p><p><br></p><p>&nbsp; &nbsp; #&nbsp; &nbsp; ssl_ciphers&nbsp; HIGH:!aNULL:!MD5;</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; ssl_prefer_server_ciphers&nbsp; on;</p><p><br></p><p>&nbsp; &nbsp; #&nbsp; &nbsp; location / {</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; &nbsp; &nbsp; root&nbsp; &nbsp;html;</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; &nbsp; &nbsp; index&nbsp; index.html index.htm;</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; }</p><p>&nbsp; &nbsp; #}</p><p><br></p><p>}</p><div><br></div>', 'admin', '2019-10-17 13:11:08', null, null);
INSERT INTO `bg_blog` VALUES ('81', '45', 'fastdfs上传文件', 'springboot+fastdfs', '1', '0', '1', '8', 'http://localhost:8888/img/blog-default.png', '1', '2', '<p><img src=\"http://116.62.231.166/group1/M00/00/00/rBEyTV2xCHOAIL9VAABtbKRuLU8400.jpg\" data-filename=\"http://116.62.231.166/group1/M00/00/00/rBEyTV2xCHOAIL9VAABtbKRuLU8400.jpg\" style=\"width: 500px;\"><br></p>', 'admin', '2019-10-24 10:13:00', null, null);

-- ----------------------------
-- Table structure for bg_blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `bg_blog_tag`;
CREATE TABLE `bg_blog_tag` (
  `blog_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_id`,`tag_id`),
  UNIQUE KEY `blog_id` (`blog_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bg_blog_tag
-- ----------------------------
INSERT INTO `bg_blog_tag` VALUES ('1', '30');
INSERT INTO `bg_blog_tag` VALUES ('2', '18');
INSERT INTO `bg_blog_tag` VALUES ('3', '19');
INSERT INTO `bg_blog_tag` VALUES ('4', '18');
INSERT INTO `bg_blog_tag` VALUES ('4', '31');
INSERT INTO `bg_blog_tag` VALUES ('5', '18');
INSERT INTO `bg_blog_tag` VALUES ('6', '18');
INSERT INTO `bg_blog_tag` VALUES ('7', '20');
INSERT INTO `bg_blog_tag` VALUES ('8', '18');
INSERT INTO `bg_blog_tag` VALUES ('9', '21');
INSERT INTO `bg_blog_tag` VALUES ('9', '22');
INSERT INTO `bg_blog_tag` VALUES ('10', '18');
INSERT INTO `bg_blog_tag` VALUES ('10', '29');
INSERT INTO `bg_blog_tag` VALUES ('12', '20');
INSERT INTO `bg_blog_tag` VALUES ('13', '20');
INSERT INTO `bg_blog_tag` VALUES ('14', '20');
INSERT INTO `bg_blog_tag` VALUES ('15', '20');
INSERT INTO `bg_blog_tag` VALUES ('16', '20');
INSERT INTO `bg_blog_tag` VALUES ('17', '27');
INSERT INTO `bg_blog_tag` VALUES ('17', '28');
INSERT INTO `bg_blog_tag` VALUES ('18', '24');
INSERT INTO `bg_blog_tag` VALUES ('18', '26');
INSERT INTO `bg_blog_tag` VALUES ('19', '24');
INSERT INTO `bg_blog_tag` VALUES ('20', '24');
INSERT INTO `bg_blog_tag` VALUES ('20', '25');
INSERT INTO `bg_blog_tag` VALUES ('23', '24');
INSERT INTO `bg_blog_tag` VALUES ('24', '23');
INSERT INTO `bg_blog_tag` VALUES ('25', '23');
INSERT INTO `bg_blog_tag` VALUES ('25', '32');
INSERT INTO `bg_blog_tag` VALUES ('27', '23');
INSERT INTO `bg_blog_tag` VALUES ('27', '33');
INSERT INTO `bg_blog_tag` VALUES ('31', '23');
INSERT INTO `bg_blog_tag` VALUES ('31', '34');
INSERT INTO `bg_blog_tag` VALUES ('32', '23');
INSERT INTO `bg_blog_tag` VALUES ('32', '35');
INSERT INTO `bg_blog_tag` VALUES ('34', '23');
INSERT INTO `bg_blog_tag` VALUES ('34', '36');
INSERT INTO `bg_blog_tag` VALUES ('35', '23');
INSERT INTO `bg_blog_tag` VALUES ('36', '23');
INSERT INTO `bg_blog_tag` VALUES ('36', '37');
INSERT INTO `bg_blog_tag` VALUES ('40', '23');
INSERT INTO `bg_blog_tag` VALUES ('40', '38');
INSERT INTO `bg_blog_tag` VALUES ('40', '39');
INSERT INTO `bg_blog_tag` VALUES ('41', '41');
INSERT INTO `bg_blog_tag` VALUES ('41', '42');
INSERT INTO `bg_blog_tag` VALUES ('43', '23');
INSERT INTO `bg_blog_tag` VALUES ('43', '40');
INSERT INTO `bg_blog_tag` VALUES ('44', '17');
INSERT INTO `bg_blog_tag` VALUES ('49', '14');
INSERT INTO `bg_blog_tag` VALUES ('49', '15');
INSERT INTO `bg_blog_tag` VALUES ('49', '16');
INSERT INTO `bg_blog_tag` VALUES ('50', '13');
INSERT INTO `bg_blog_tag` VALUES ('51', '12');
INSERT INTO `bg_blog_tag` VALUES ('51', '43');
INSERT INTO `bg_blog_tag` VALUES ('78', '58');
INSERT INTO `bg_blog_tag` VALUES ('79', '59');
INSERT INTO `bg_blog_tag` VALUES ('80', '60');
INSERT INTO `bg_blog_tag` VALUES ('81', '61');

-- ----------------------------
-- Table structure for bg_carousel_map
-- ----------------------------
DROP TABLE IF EXISTS `bg_carousel_map`;
CREATE TABLE `bg_carousel_map` (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(128) DEFAULT '' COMMENT '背景图片地址',
  `title` varchar(64) DEFAULT '' COMMENT '标题\n',
  `sub_title` varchar(256) DEFAULT '' COMMENT '副标题',
  `display` char(1) DEFAULT '0' COMMENT '是否显示，1表示显示，0表示不显示',
  `url` varchar(256) DEFAULT '' COMMENT '点击的url地址',
  `target` char(1) DEFAULT '' COMMENT '是否当前窗口打开，0表示否，1表示是',
  `click` int(11) DEFAULT '0' COMMENT '点击量',
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `update_by` varchar(128) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`carousel_id`),
  UNIQUE KEY `carousel_id` (`carousel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='轮播图设置';

-- ----------------------------
-- Records of bg_carousel_map
-- ----------------------------

-- ----------------------------
-- Table structure for bg_category
-- ----------------------------
DROP TABLE IF EXISTS `bg_category`;
CREATE TABLE `bg_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_title` varchar(64) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL COMMENT '权重\n',
  `description` varchar(128) DEFAULT NULL COMMENT '描述',
  `support` char(1) DEFAULT '0' COMMENT '是否推荐，1表示推荐，0表示不推荐',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id` (`category_id`),
  KEY `description` (`description`),
  FULLTEXT KEY `category_title` (`category_title`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='分类管理';

-- ----------------------------
-- Records of bg_category
-- ----------------------------
INSERT INTO `bg_category` VALUES ('15', '其他资料', '1', '其他资料', '0', 'admin', '2019-04-02 15:34:58', 'admin', '2019-04-02 16:37:43');
INSERT INTO `bg_category` VALUES ('45', 'SpringBoot', '1', 'SpringBoot', '1', null, '2019-01-30 11:22:38', null, '2019-01-30 11:22:38');
INSERT INTO `bg_category` VALUES ('46', '前端知识', '0', '包括BootStrap、Layui、Echart等多个开源前端框架使用', '0', null, '2019-01-12 11:19:15', null, '2019-02-01 14:14:11');
INSERT INTO `bg_category` VALUES ('47', 'HEXO博客', '0', '以前使用HEXO的时候的一些博客，虽然HEXO在更新换代，但它已经很稳定了，所以这个分类下面的博文仍然适用', '1', null, '2019-01-30 11:23:04', null, '2019-01-30 11:23:04');
INSERT INTO `bg_category` VALUES ('48', 'Java基础', '12', 'Java基础相关，包括Java常见语法，Java集合，Java多线程等知识', '1', null, '2019-01-12 11:19:23', null, '2019-02-01 15:42:39');
INSERT INTO `bg_category` VALUES ('49', 'JavaEE', '0', 'JavaEE 部分知识，包括SpringMVC，Spring，Mybatis，Hibernate，JPA等知识', '1', null, '2019-02-01 14:11:48', null, '2019-02-01 14:11:48');
INSERT INTO `bg_category` VALUES ('50', '软件工具', '0', '软件工具的使用教程，破解方法等', '0', null, '2019-02-01 14:12:59', null, '2019-02-01 14:12:59');
INSERT INTO `bg_category` VALUES ('51', '大学期间资料', '0', '大学期间的资料分享', '0', null, '2019-02-01 14:14:40', null, '2019-02-01 14:14:40');
INSERT INTO `bg_category` VALUES ('52', 'Android', '0', 'Android相关知识', '0', null, '2019-02-01 14:15:04', null, '2019-02-01 14:15:04');
INSERT INTO `bg_category` VALUES ('53', '闲言碎语', '10', '关于我的一些生活感悟之类的', '1', null, '2019-02-02 08:03:45', null, '2019-02-02 08:03:45');
INSERT INTO `bg_category` VALUES ('54', '最代码', '11', 'zuidaima分类', '1', 'admin', '2019-04-23 23:39:40', null, null);

-- ----------------------------
-- Table structure for bg_comment
-- ----------------------------
DROP TABLE IF EXISTS `bg_comment`;
CREATE TABLE `bg_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(128) DEFAULT NULL COMMENT 'QQ昵称',
  `qq_num` varchar(128) DEFAULT NULL COMMENT 'QQ号码',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱地址',
  `avatar` varchar(128) DEFAULT NULL COMMENT 'QQ头像地址',
  `content` varchar(1024) DEFAULT NULL COMMENT '留言',
  `reply_id` int(11) DEFAULT NULL COMMENT '回复的上一个留言的id',
  `reply` tinyint(1) DEFAULT '1' COMMENT '收到评论是否邮件通知',
  `url` varchar(128) DEFAULT NULL COMMENT '评论的页面地址',
  `review_msg` varchar(512) DEFAULT NULL,
  `display` tinyint(1) DEFAULT '1',
  `page_id` int(11) DEFAULT NULL COMMENT '页面id',
  `good` int(11) DEFAULT '0' COMMENT '点赞数',
  `bad` int(11) DEFAULT '0' COMMENT '踩数',
  `ip` varchar(128) DEFAULT NULL COMMENT 'IP 地址',
  `location` varchar(128) DEFAULT NULL COMMENT '地理位置',
  `os` varchar(128) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(128) DEFAULT NULL COMMENT '浏览器类型',
  `create_by` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(128) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COMMENT='留言';

-- ----------------------------
-- Records of bg_comment
-- ----------------------------

-- ----------------------------
-- Table structure for bg_file_item_info
-- ----------------------------
DROP TABLE IF EXISTS `bg_file_item_info`;
CREATE TABLE `bg_file_item_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `hash` varchar(128) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `mime_type` varchar(128) DEFAULT NULL,
  `put_time` datetime DEFAULT NULL,
  `server_type` int(11) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bg_file_item_info
-- ----------------------------
INSERT INTO `bg_file_item_info` VALUES ('305', 'u_2411341495,3097540968_fm_26_gp_0.jpg', '533694446', '28012', 'image/jpeg', '2019-10-24 10:12:03', '1', 'http://116.62.231.166/group1/M00/00/00/rBEyTV2xCHOAIL9VAABtbKRuLU8400.jpg');

-- ----------------------------
-- Table structure for bg_link
-- ----------------------------
DROP TABLE IF EXISTS `bg_link`;
CREATE TABLE `bg_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL COMMENT '友链的名称',
  `description` varchar(128) DEFAULT '' COMMENT '友链描述',
  `header_img` varchar(64) DEFAULT '' COMMENT '友链图标地址',
  `click` int(11) DEFAULT '0' COMMENT '友链点击数',
  `weight` int(11) DEFAULT '0' COMMENT '友链权重',
  `available` int(11) DEFAULT '1' COMMENT '友链是否能访问，1表示能，0表示不能',
  `processed` int(11) DEFAULT '0' COMMENT '友链是否已经处理，1表示已经处理，0表示没有处理',
  `display` int(11) DEFAULT '0' COMMENT '友链是否显示，1表示显示，0表示不显示',
  `url` varchar(64) DEFAULT NULL COMMENT '友链的地址',
  `email` varchar(64) DEFAULT NULL COMMENT '联系邮箱',
  `create_by` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `link_id` (`link_id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='友链信息';

-- ----------------------------
-- Records of bg_link
-- ----------------------------

-- ----------------------------
-- Table structure for bg_tag
-- ----------------------------
DROP TABLE IF EXISTS `bg_tag`;
CREATE TABLE `bg_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_title` varchar(64) DEFAULT NULL COMMENT '标签内容',
  `create_by` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `bg_tag_tag_title_uindex` (`tag_title`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='标签';

-- ----------------------------
-- Records of bg_tag
-- ----------------------------
INSERT INTO `bg_tag` VALUES ('12', '测试', 'admin', '2019-04-02 12:10:20', null, null);
INSERT INTO `bg_tag` VALUES ('13', 'IDEA', 'admin', '2019-04-02 14:43:42', null, null);
INSERT INTO `bg_tag` VALUES ('14', 'Spring', 'admin', '2019-04-02 14:55:54', null, null);
INSERT INTO `bg_tag` VALUES ('15', 'Java', 'admin', '2019-04-02 14:55:54', null, null);
INSERT INTO `bg_tag` VALUES ('16', '注解', 'admin', '2019-04-02 14:55:54', null, null);
INSERT INTO `bg_tag` VALUES ('17', '个人博客', 'admin', '2019-04-02 14:58:48', null, null);
INSERT INTO `bg_tag` VALUES ('18', 'HEXO', 'admin', '2019-04-02 15:10:33', null, null);
INSERT INTO `bg_tag` VALUES ('19', 'Android Studio', 'admin', '2019-04-02 15:10:56', null, null);
INSERT INTO `bg_tag` VALUES ('20', 'Android', 'admin', '2019-04-02 15:27:13', null, null);
INSERT INTO `bg_tag` VALUES ('21', '视频文档', 'admin', '2019-04-02 15:28:50', null, null);
INSERT INTO `bg_tag` VALUES ('22', '大学资料', 'admin', '2019-04-02 15:28:50', null, null);
INSERT INTO `bg_tag` VALUES ('23', 'Java基础', 'admin', '2019-04-02 15:33:18', null, null);
INSERT INTO `bg_tag` VALUES ('24', 'JavaEE', 'admin', '2019-04-02 15:33:34', null, null);
INSERT INTO `bg_tag` VALUES ('25', '表单数据', 'admin', '2019-04-02 15:34:04', null, null);
INSERT INTO `bg_tag` VALUES ('26', 'Session', 'admin', '2019-04-02 15:34:23', null, null);
INSERT INTO `bg_tag` VALUES ('27', 'Qt', 'admin', '2019-04-02 15:35:26', null, null);
INSERT INTO `bg_tag` VALUES ('28', 'C++', 'admin', '2019-04-02 15:35:27', null, null);
INSERT INTO `bg_tag` VALUES ('29', 'VSCode', 'admin', '2019-04-02 15:35:58', null, null);
INSERT INTO `bg_tag` VALUES ('30', 'MyEclipse', 'admin', '2019-04-02 15:36:18', null, null);
INSERT INTO `bg_tag` VALUES ('31', '收录', 'admin', '2019-04-02 15:41:34', null, null);
INSERT INTO `bg_tag` VALUES ('32', '异常', 'admin', '2019-04-02 15:42:47', null, null);
INSERT INTO `bg_tag` VALUES ('33', 'Object类', 'admin', '2019-04-02 15:43:16', null, null);
INSERT INTO `bg_tag` VALUES ('34', '线程', 'admin', '2019-04-02 15:43:39', null, null);
INSERT INTO `bg_tag` VALUES ('35', '创建对象', 'admin', '2019-04-02 15:43:57', null, null);
INSERT INTO `bg_tag` VALUES ('36', 'HashMap', 'admin', '2019-04-02 15:44:55', null, null);
INSERT INTO `bg_tag` VALUES ('37', 'Properties文件', 'admin', '2019-04-02 15:46:09', null, null);
INSERT INTO `bg_tag` VALUES ('38', '接口', 'admin', '2019-04-02 15:46:40', null, null);
INSERT INTO `bg_tag` VALUES ('39', '抽象类', 'admin', '2019-04-02 15:46:40', null, null);
INSERT INTO `bg_tag` VALUES ('40', '归并排序', 'admin', '2019-04-02 15:47:18', null, null);
INSERT INTO `bg_tag` VALUES ('41', 'JavaWeb', 'admin', '2019-04-02 15:48:25', null, null);
INSERT INTO `bg_tag` VALUES ('42', 'Tomcat', 'admin', '2019-04-02 15:48:25', null, null);
INSERT INTO `bg_tag` VALUES ('43', '最代码', 'admin', '2019-04-23 23:37:30', null, null);
INSERT INTO `bg_tag` VALUES ('58', '新增数据', 'admin', '2019-10-14 17:14:32', null, null);
INSERT INTO `bg_tag` VALUES ('59', '博客标题', 'admin', '2019-10-17 13:04:42', null, null);
INSERT INTO `bg_tag` VALUES ('60', 'nginx配置', 'admin', '2019-10-17 13:11:08', null, null);
INSERT INTO `bg_tag` VALUES ('61', 'springboot+fastdfs', 'admin', '2019-10-24 10:13:00', null, null);

-- ----------------------------
-- Table structure for bg_tool
-- ----------------------------
DROP TABLE IF EXISTS `bg_tool`;
CREATE TABLE `bg_tool` (
  `tool_id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(128) DEFAULT NULL COMMENT '工具名称',
  `description` varchar(512) DEFAULT NULL COMMENT '工具描述	',
  `display` char(1) DEFAULT '1' COMMENT '显示状态，1表示显示，0表示不显示',
  `url` varchar(128) DEFAULT NULL COMMENT '链接地址',
  `type` char(1) DEFAULT NULL,
  `head_img` varchar(128) DEFAULT NULL COMMENT '头像地址',
  `weight` int(11) DEFAULT '0' COMMENT '权重',
  `tool_category_id` int(11) DEFAULT NULL,
  `update_by` varchar(128) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`tool_id`),
  KEY `bg_tool_bg_tool_category_tool_category_id_fk` (`tool_category_id`),
  CONSTRAINT `bg_tool_bg_tool_category_tool_category_id_fk` FOREIGN KEY (`tool_category_id`) REFERENCES `bg_tool_category` (`tool_category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='常用工具';

-- ----------------------------
-- Records of bg_tool
-- ----------------------------

-- ----------------------------
-- Table structure for bg_tool_category
-- ----------------------------
DROP TABLE IF EXISTS `bg_tool_category`;
CREATE TABLE `bg_tool_category` (
  `tool_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_category_title` varchar(64) DEFAULT NULL COMMENT '分类的标题',
  `weight` int(11) DEFAULT NULL COMMENT '权重',
  `display` char(1) DEFAULT NULL COMMENT '是否显示，1表示显示，0表示不显示',
  `create_by` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`tool_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工具的分类';

-- ----------------------------
-- Records of bg_tool_category
-- ----------------------------

-- ----------------------------
-- Table structure for bg_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `bg_visit_log`;
CREATE TABLE `bg_visit_log` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_addr` varchar(64) DEFAULT NULL COMMENT 'ip地址',
  `location` varchar(64) DEFAULT NULL COMMENT '访问地址',
  `browser` varchar(64) DEFAULT NULL COMMENT '浏览器类型',
  `os` varchar(64) DEFAULT NULL COMMENT '操作系统',
  `spider` varchar(64) DEFAULT NULL COMMENT '爬虫',
  `request_url` varchar(64) DEFAULT NULL COMMENT '请求地址',
  `error_msg` varchar(256) DEFAULT NULL COMMENT '访问错误的提示信息',
  `title` varchar(64) DEFAULT NULL COMMENT '请求的模块',
  `create_by` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL COMMENT '访问状态,1表示正常，0表示不正常',
  `entry_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`visit_id`),
  UNIQUE KEY `visit_id` (`visit_id`),
  KEY `ip_addr` (`ip_addr`)
) ENGINE=InnoDB AUTO_INCREMENT=202285 DEFAULT CHARSET=utf8 COMMENT='访问日志记录';

-- ----------------------------
-- Records of bg_visit_log
-- ----------------------------
INSERT INTO `bg_visit_log` VALUES ('201797', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '472be1bf-ba19-4276-8f11-e974dab6b56c', '2019-10-14 16:43:44', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201798', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '472be1bf-ba19-4276-8f11-e974dab6b56c', '2019-10-14 16:44:34', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201799', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '472be1bf-ba19-4276-8f11-e974dab6b56c', '2019-10-14 16:45:21', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201800', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '094b5f68-899e-42ce-bdbe-5251b093dac2', '2019-10-14 16:58:57', '1', 'http://localhost/swagger-ui.html');
INSERT INTO `bg_visit_log` VALUES ('201801', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/f/linkRedirect', null, '友链跳转', '472be1bf-ba19-4276-8f11-e974dab6b56c', '2019-10-14 17:00:05', '1', 'http://localhost/');
INSERT INTO `bg_visit_log` VALUES ('201802', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/f/linkRedirect', null, '友链跳转', '094b5f68-899e-42ce-bdbe-5251b093dac2', '2019-10-14 17:00:08', '1', 'http://localhost/');
INSERT INTO `bg_visit_log` VALUES ('201803', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '472be1bf-ba19-4276-8f11-e974dab6b56c', '2019-10-14 17:14:02', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201804', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '472be1bf-ba19-4276-8f11-e974dab6b56c', '2019-10-14 17:14:55', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201805', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/f/article/78.html', null, '博客', '472be1bf-ba19-4276-8f11-e974dab6b56c', '2019-10-14 17:15:03', '1', 'http://localhost/');
INSERT INTO `bg_visit_log` VALUES ('201806', '117.14.62.38', '天津 天津', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b3d47a01-5f9c-443e-8f74-9afcb0aea951', '2019-10-14 17:23:55', '1', 'http://116.62.231.166:8080/index');
INSERT INTO `bg_visit_log` VALUES ('201807', '117.14.62.38', '天津 天津', 'Chrome', 'Windows 10', null, '/', null, '首页', '1ca2a586-4501-4db2-8283-5a79949c77e5', '2019-10-14 17:26:03', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201808', '202.99.89.223', '天津 天津', 'Chrome Mobile', 'Android Mobile', null, '/', null, '首页', 'b3d47a01-5f9c-443e-8f74-9afcb0aea951', '2019-10-14 17:26:21', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201809', '117.14.62.38', '天津 天津', 'Chrome', 'Windows 10', null, '/', null, '首页', '1ca2a586-4501-4db2-8283-5a79949c77e5', '2019-10-14 17:26:30', '1', 'http://116.62.231.166:8080/index');
INSERT INTO `bg_visit_log` VALUES ('201810', '117.14.62.38', '天津 天津', 'Chrome', 'Windows 10', null, '/f/about.html', null, '关于我', 'b3d47a01-5f9c-443e-8f74-9afcb0aea951', '2019-10-14 17:26:56', '1', 'http://116.62.231.166:8080/');
INSERT INTO `bg_visit_log` VALUES ('201811', '116.239.12.216', '上海 上海', 'Chrome 39', 'Windows 10', null, '/', null, '首页', 'b3d47a01-5f9c-443e-8f74-9afcb0aea951', '2019-10-14 17:28:58', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201812', '116.239.12.216', '上海 上海', 'Chrome 39', 'Windows 10', null, '/f/tag/23.html', null, '标签', '1ca2a586-4501-4db2-8283-5a79949c77e5', '2019-10-14 17:29:11', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201813', '101.89.239.230', '上海 上海', 'Chrome', 'Android 4.x', null, '/', null, '首页', 'b3d47a01-5f9c-443e-8f74-9afcb0aea951', '2019-10-14 17:29:55', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201814', '61.129.6.251', '上海 上海', 'Apple WebKit', 'Mac OS X (iPhone)', null, '/', null, '首页', 'b3d47a01-5f9c-443e-8f74-9afcb0aea951', '2019-10-14 17:29:57', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201815', '61.129.6.251', '上海 上海', 'Chrome 39', 'Windows 7', null, '/f/tag/23.html', null, '标签', '6b14a47b-d143-48d5-b10c-172b72a2a436', '2019-10-14 17:30:11', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201816', '117.14.62.38', '天津 天津', 'Chrome', 'Windows 10', null, '/', null, '首页', '875b7a03-0753-436b-87f5-a2b777ccaa3d', '2019-10-14 18:05:33', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201817', '117.14.62.38', '天津 天津', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b3d47a01-5f9c-443e-8f74-9afcb0aea951', '2019-10-14 18:19:44', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201818', '117.14.62.38', '天津 天津', 'Chrome', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 18:25:05', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201819', '117.14.62.38', '天津 天津', 'Chrome', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 18:27:38', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201820', '117.14.62.38', '天津 天津', 'Chrome', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 18:28:43', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201821', '117.14.62.38', '天津 天津', 'Chrome', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 18:31:32', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201822', '116.62.231.166', '浙江 杭州', 'Chrome Mobile', 'Android Mobile', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 18:38:41', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201823', '47.101.46.10', '上海 上海', 'Firefox 36', 'Ubuntu', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 18:45:06', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201824', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 18:57:36', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201825', '111.125.137.83', '德里国家首都辖区 德里', 'Chrome', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 18:59:01', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201826', '138.97.183.123', 'XX XX', 'Chrome', 'Windows 7', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 19:09:57', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201827', '220.200.167.103', '宁夏 银川', 'Chrome', 'Windows 7', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 19:29:08', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201828', '171.34.177.88', '江西 南昌', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 19:29:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201829', '113.128.104.211', '山东 济南', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 19:29:13', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201830', '106.45.0.129', '宁夏 银川', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '105fadf9-51e7-4a10-bcaf-f215afede7ab', '2019-10-14 19:29:14', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201831', '175.184.166.114', '青海 西宁', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '97787db1-78aa-4eaa-96f8-9a1b3780e3b0', '2019-10-14 19:29:16', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201832', '124.235.138.239', 'XX XX', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 19:29:18', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201833', '116.62.231.166', '浙江 杭州', 'Firefox 36', 'Ubuntu', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 19:44:43', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201834', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 21:30:44', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201835', '118.28.190.107', '天津 天津', 'Chrome Mobile', 'Android Mobile', null, '/', null, '首页', '97787db1-78aa-4eaa-96f8-9a1b3780e3b0', '2019-10-14 22:06:07', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201836', '113.57.183.121', '湖北 武汉', 'Chrome Mobile', 'Android Mobile', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 22:06:14', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201837', '113.57.183.121', '湖北 武汉', 'Chrome Mobile', 'Android Mobile', null, '/f/tag/34.html', null, '标签', '9e9b475e-7b03-46ce-8b9d-a1aed4243829', '2019-10-14 22:06:42', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201838', '118.28.190.107', '天津 天津', 'Chrome Mobile', 'Android Mobile', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 22:07:38', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201839', '61.129.6.251', '上海 上海', 'Chrome', 'Android 5.x', null, '/f/tag/34.html', null, '标签', '1abb8b60-3980-49b1-9a20-5fe0c66ef8ff', '2019-10-14 22:07:40', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201840', '61.151.207.205', '上海 上海', 'Chrome 39', 'Windows 7', null, '/f/tag/34.html', null, '标签', '61b786c4-a165-42b8-9e14-cc3340c79995', '2019-10-14 22:07:42', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201841', '186.211.3.41', 'XX XX', 'Chrome', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 22:25:44', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201842', '74.82.47.5', '加利福尼亚 费利蒙', 'Unknown', 'Unknown', null, '/', null, '首页', 'f03dbb4c-d759-4259-b2ca-c5314a67c4e8', '2019-10-14 22:30:00', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201843', '198.55.103.31', '加利福尼亚 XX', 'Unknown', 'Unknown', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 22:58:54', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201844', '198.55.103.31', '加利福尼亚 XX', 'Unknown', 'Unknown', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 22:58:56', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201845', '120.55.81.217', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'e6594f41-c946-4350-be4b-03daab5556e3', '2019-10-14 23:03:02', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201846', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'dfea7207-536d-49b2-99cc-f89322c7aab5', '2019-10-14 23:27:18', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201847', '123.157.192.236', '浙江 杭州', 'Opera', 'Windows 7', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 23:31:23', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201848', '119.39.46.157', '湖南 长沙', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '15bc0a15-6bd1-40aa-b15c-164ea3f261cf', '2019-10-14 23:31:25', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201849', '125.120.63.7', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 23:31:27', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201850', '182.245.45.49', '云南 昆明', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'ffb89b28-f3e5-406a-a2fb-363aff87d4ea', '2019-10-14 23:31:29', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201851', '180.95.231.87', '甘肃 兰州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '105fadf9-51e7-4a10-bcaf-f215afede7ab', '2019-10-14 23:31:32', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201852', '171.34.179.89', '江西 南昌', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '614680ff-8068-4a9d-966d-f8c5435c757f', '2019-10-14 23:31:32', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201853', '114.221.127.37', 'XX XX', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-14 23:31:34', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201854', '201.68.77.24', '圣保罗 XX', 'Chrome', 'Windows 7', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 01:24:37', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201855', '187.57.194.150', '圣保罗 XX', 'Safari 9', 'Mac OS X', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 01:36:48', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201856', '175.106.18.246', '中爪哇 XX', 'Chrome', 'Windows 10', null, '/', null, '首页', 'dfea7207-536d-49b2-99cc-f89322c7aab5', '2019-10-15 04:11:19', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201857', '45.185.113.13', 'XX XX', 'Chrome', 'Windows 7', null, '/', null, '首页', '614680ff-8068-4a9d-966d-f8c5435c757f', '2019-10-15 04:55:16', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201858', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '97787db1-78aa-4eaa-96f8-9a1b3780e3b0', '2019-10-15 05:08:21', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201859', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'ffb89b28-f3e5-406a-a2fb-363aff87d4ea', '2019-10-15 05:33:19', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201860', '187.110.208.16', 'XX XX', 'Chrome', 'Windows 7', null, '/', null, '首页', '1abb8b60-3980-49b1-9a20-5fe0c66ef8ff', '2019-10-15 06:11:44', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201861', '193.242.212.12', 'XX XX', 'Safari 9', 'Mac OS X', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 06:16:28', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201862', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 06:34:20', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201863', '13.91.241.93', '加利福尼亚 圣克拉拉', 'Mozilla', 'Unknown', null, '/', null, '首页', '4a6aac20-77f9-4103-898c-7ecbc6e6e9c1', '2019-10-15 06:35:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201864', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 06:36:26', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201865', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'f03dbb4c-d759-4259-b2ca-c5314a67c4e8', '2019-10-15 07:05:40', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201866', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'f03dbb4c-d759-4259-b2ca-c5314a67c4e8', '2019-10-15 07:11:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201867', '201.76.113.108', 'XX XX', 'Chrome', 'Windows 7', null, '/', null, '首页', 'e6594f41-c946-4350-be4b-03daab5556e3', '2019-10-15 07:17:36', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201868', '185.101.33.138', 'Oslo XX', 'Unknown', 'Unknown', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 07:17:51', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201869', '41.191.205.184', 'XX XX', 'Safari 9', 'Mac OS X', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 07:30:41', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201870', '121.57.229.69', '内蒙古 呼和浩特', 'Chrome', 'Windows 7', null, '/', null, '首页', 'dfea7207-536d-49b2-99cc-f89322c7aab5', '2019-10-15 07:37:56', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201871', '61.159.238.190', '云南 昆明', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 07:37:57', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201872', '222.82.52.65', '新疆 乌鲁木齐', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 07:37:58', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201873', '111.162.155.123', '天津 天津', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '105fadf9-51e7-4a10-bcaf-f215afede7ab', '2019-10-15 07:37:58', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201874', '113.24.80.154', '山西 太原', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 07:38:04', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201875', '219.140.117.146', '湖北 武汉', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '97787db1-78aa-4eaa-96f8-9a1b3780e3b0', '2019-10-15 07:38:06', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201876', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 08:49:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201877', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '68b7153e-1fe7-40ec-9d2b-fd1780e6ec36', '2019-10-15 09:28:20', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201878', '209.17.96.234', '纽约 纽约', 'Robot/Spider', 'Unknown', null, '/', null, '首页', '4a6aac20-77f9-4103-898c-7ecbc6e6e9c1', '2019-10-15 09:33:41', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201879', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 09:41:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201880', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'f03dbb4c-d759-4259-b2ca-c5314a67c4e8', '2019-10-15 09:41:58', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201881', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'f03dbb4c-d759-4259-b2ca-c5314a67c4e8', '2019-10-15 09:42:06', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201882', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 09:44:21', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201883', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/f/link.html', null, '友链显示', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 09:44:26', '1', 'http://www.wx-blog.top/');
INSERT INTO `bg_visit_log` VALUES ('201884', '47.93.180.168', '北京 北京', 'Unknown', 'Unknown', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 09:45:27', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201885', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 09:51:01', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201886', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/f/archives.html', null, '归档', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 09:51:03', '1', 'http://116.62.231.166/');
INSERT INTO `bg_visit_log` VALUES ('201887', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/f/link.html', null, '友链显示', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 09:51:06', '1', 'http://116.62.231.166/f/archives.html');
INSERT INTO `bg_visit_log` VALUES ('201888', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/f/archives.html', null, '归档', '614680ff-8068-4a9d-966d-f8c5435c757f', '2019-10-15 09:51:10', '1', 'http://116.62.231.166/f/link.html');
INSERT INTO `bg_visit_log` VALUES ('201889', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'ffb89b28-f3e5-406a-a2fb-363aff87d4ea', '2019-10-15 09:51:12', '1', 'http://116.62.231.166/f/archives.html');
INSERT INTO `bg_visit_log` VALUES ('201890', '116.62.231.166', 'XX XX', 'Chrome', 'Windows 10', null, '/f/leaveComment.html', null, '留言页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 09:51:16', '1', 'http://116.62.231.166/');
INSERT INTO `bg_visit_log` VALUES ('201891', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'ffb89b28-f3e5-406a-a2fb-363aff87d4ea', '2019-10-15 09:51:20', '1', 'http://116.62.231.166/f/leaveComment.html');
INSERT INTO `bg_visit_log` VALUES ('201892', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 09:58:43', '1', 'http://116.62.231.166/f/leaveComment.html');
INSERT INTO `bg_visit_log` VALUES ('201893', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', '61b786c4-a165-42b8-9e14-cc3340c79995', '2019-10-15 10:00:37', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201894', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '4a6aac20-77f9-4103-898c-7ecbc6e6e9c1', '2019-10-15 10:01:17', '1', 'http://116.62.231.166/f/leaveComment.html');
INSERT INTO `bg_visit_log` VALUES ('201895', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 10:01:35', '1', 'http://116.62.231.166/');
INSERT INTO `bg_visit_log` VALUES ('201896', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 10:01:50', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201897', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/f/tag/32.html', null, '标签', 'f03dbb4c-d759-4259-b2ca-c5314a67c4e8', '2019-10-15 10:02:13', '1', 'http://116.62.231.166/');
INSERT INTO `bg_visit_log` VALUES ('201898', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '15dcf919-cfdf-470c-9c1d-14437b7ee6a8', '2019-10-15 10:11:23', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201899', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '15dcf919-cfdf-470c-9c1d-14437b7ee6a8', '2019-10-15 10:12:13', '1', 'http://localhost/swagger-ui.html');
INSERT INTO `bg_visit_log` VALUES ('201900', '47.100.161.54', '上海 上海', 'Firefox 36', 'Ubuntu', null, '/', null, '首页', 'f03dbb4c-d759-4259-b2ca-c5314a67c4e8', '2019-10-15 10:54:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201901', '190.122.179.246', 'XX XX', 'Chrome', 'Windows 7', null, '/', null, '首页', 'e6594f41-c946-4350-be4b-03daab5556e3', '2019-10-15 11:02:17', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201902', '185.38.208.126', 'XX XX', 'Chrome', 'Windows 7', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 11:09:35', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201903', '116.62.231.166', '浙江 杭州', 'Firefox 3', 'Windows Vista', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 11:12:43', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201904', '39.105.16.6', '北京 北京', 'Firefox 3', 'Windows Vista', null, '/', null, '首页', 'ffb89b28-f3e5-406a-a2fb-363aff87d4ea', '2019-10-15 11:13:03', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201905', '177.184.188.18', 'XX XX', 'Chrome', 'Windows 7', null, '/', null, '首页', 'dfea7207-536d-49b2-99cc-f89322c7aab5', '2019-10-15 11:56:03', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201906', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '97787db1-78aa-4eaa-96f8-9a1b3780e3b0', '2019-10-15 12:05:14', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201907', '171.67.70.80', '加利福尼亚 XX', 'Mozilla', 'Unknown', null, '/', null, '首页', '4a6aac20-77f9-4103-898c-7ecbc6e6e9c1', '2019-10-15 12:47:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201908', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 13:20:48', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201909', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'f03dbb4c-d759-4259-b2ca-c5314a67c4e8', '2019-10-15 14:09:52', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201910', '86.122.148.118', 'XX XX', 'Chrome', 'Windows 7', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 14:19:26', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201911', '221.13.12.240', '贵州 贵阳', 'Chrome', 'Windows 7', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 15:32:38', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201912', '123.160.175.42', '河南 郑州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 15:32:41', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201913', '122.96.73.77', '江苏 南京', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'ffb89b28-f3e5-406a-a2fb-363aff87d4ea', '2019-10-15 15:32:42', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201914', '220.200.165.130', '宁夏 银川', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'dfea7207-536d-49b2-99cc-f89322c7aab5', '2019-10-15 15:32:43', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201915', '175.152.29.252', '四川 成都', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 15:32:44', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201916', '220.200.160.167', '宁夏 银川', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'ac2de4d2-7fb4-4fc9-9118-b7bb8043200c', '2019-10-15 15:32:46', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201917', '121.57.231.184', 'XX XX', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 15:32:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201918', '116.62.231.166', '浙江 杭州', 'Unknown', 'Chrome OS', null, '/', null, '首页', '9e9b475e-7b03-46ce-8b9d-a1aed4243829', '2019-10-15 16:37:50', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201919', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 16:53:41', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201920', '209.17.96.218', '纽约 纽约', 'Robot/Spider', 'Unknown', null, '/', null, '首页', '165c20eb-33c2-4a65-8f72-276943b70115', '2019-10-15 17:14:24', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201921', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:40:27', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201922', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:40:31', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201923', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:40:33', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201924', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:41:00', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201925', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:41:05', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201926', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:41:09', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201927', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:41:11', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201928', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:41:14', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201929', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:41:16', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201930', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:41:18', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201931', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:41:20', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201932', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '472d6203-40f9-4bdd-b3c1-0cc4205c1e4d', '2019-10-16 17:41:22', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201933', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:41:24', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201934', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:44:20', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201935', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:44:24', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201936', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:44:27', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201937', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:44:30', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201938', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:44:32', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201939', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '472d6203-40f9-4bdd-b3c1-0cc4205c1e4d', '2019-10-16 17:50:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201940', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:53:53', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201941', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:53:56', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201942', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:56:00', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201943', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:56:04', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201944', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 17:58:05', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201945', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 18:06:02', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201946', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 18:06:32', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201947', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 18:07:01', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201948', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 18:10:22', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201949', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 18:12:49', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201950', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 18:18:17', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201951', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 18:22:35', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201952', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 18:30:17', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201953', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'd915bf45-3935-41eb-9e75-d2802b21f923', '2019-10-16 18:31:19', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201954', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '774439f7-ef4f-4cf2-bf2d-3cff056af69f', '2019-10-17 09:34:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201955', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '774439f7-ef4f-4cf2-bf2d-3cff056af69f', '2019-10-17 09:51:04', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201956', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-17 09:52:03', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201957', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-17 10:54:18', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201958', '116.62.231.166', '浙江 杭州', 'Chrome 20', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-17 11:00:34', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201959', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-17 11:00:37', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201960', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-17 11:00:39', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201961', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-17 11:00:43', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201962', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'a20755ea-b7ae-44e1-b44d-5cd0a6428a2e', '2019-10-17 11:00:46', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201963', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'ebc3d32c-947b-440d-9021-13ad18039317', '2019-10-17 11:00:46', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201964', '116.62.231.166', 'XX XX', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '53acba7c-e9a4-40c4-a944-7887c822700c', '2019-10-17 11:00:48', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201965', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', '5f8a4ac3-5338-49c4-8b92-23248a7b0299', '2019-10-17 11:17:41', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201966', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'a20755ea-b7ae-44e1-b44d-5cd0a6428a2e', '2019-10-17 12:04:21', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201967', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '774439f7-ef4f-4cf2-bf2d-3cff056af69f', '2019-10-17 13:03:57', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201968', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '774439f7-ef4f-4cf2-bf2d-3cff056af69f', '2019-10-17 13:04:59', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201969', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/f/article/79.html', null, '博客', '774439f7-ef4f-4cf2-bf2d-3cff056af69f', '2019-10-17 13:05:06', '1', 'http://localhost/');
INSERT INTO `bg_visit_log` VALUES ('201970', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '774439f7-ef4f-4cf2-bf2d-3cff056af69f', '2019-10-17 13:06:31', '1', 'http://localhost/swagger-ui.html');
INSERT INTO `bg_visit_log` VALUES ('201971', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '774439f7-ef4f-4cf2-bf2d-3cff056af69f', '2019-10-17 13:07:45', '1', 'http://localhost/index');
INSERT INTO `bg_visit_log` VALUES ('201972', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/f/category/54.html', null, '分类', '774439f7-ef4f-4cf2-bf2d-3cff056af69f', '2019-10-17 13:07:51', '1', 'http://localhost/');
INSERT INTO `bg_visit_log` VALUES ('201973', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/f/leaveComment.html', null, '留言页', '774439f7-ef4f-4cf2-bf2d-3cff056af69f', '2019-10-17 13:08:03', '1', 'http://localhost/f/category/54.html');
INSERT INTO `bg_visit_log` VALUES ('201974', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 13:11:13', '1', 'http://localhost/index');
INSERT INTO `bg_visit_log` VALUES ('201975', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 13:17:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201976', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/f/article/80.html', null, '博客', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 13:17:32', '1', 'http://localhost:8888/');
INSERT INTO `bg_visit_log` VALUES ('201977', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/f/article/80.html', null, '博客', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 13:17:33', '1', 'http://localhost:8888/');
INSERT INTO `bg_visit_log` VALUES ('201978', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', null, '/f/article/80.html', null, '博客', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 13:18:42', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201979', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/f/article/80.html', null, '博客', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 13:20:45', '1', 'http://localhost:8888/');
INSERT INTO `bg_visit_log` VALUES ('201980', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/f/article/80.html', null, '博客', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 13:23:27', '1', 'http://localhost:8888/');
INSERT INTO `bg_visit_log` VALUES ('201981', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/f/about.html', null, '关于我', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 13:39:26', '1', 'http://localhost:8888/f/article/80.html');
INSERT INTO `bg_visit_log` VALUES ('201982', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/f/about.html', null, '关于我', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 13:39:27', '1', 'http://localhost:8888/f/article/80.html');
INSERT INTO `bg_visit_log` VALUES ('201983', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 13:41:07', '1', 'http://localhost:8888/f/about.html');
INSERT INTO `bg_visit_log` VALUES ('201984', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-17 14:49:07', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201985', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-17 15:27:06', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201986', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'a20755ea-b7ae-44e1-b44d-5cd0a6428a2e', '2019-10-17 15:42:00', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201987', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 16:40:43', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201988', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/f/archives.html', null, '归档', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 16:43:32', '1', 'http://localhost:8888/');
INSERT INTO `bg_visit_log` VALUES ('201989', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/f/link.html', null, '友链显示', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 16:43:32', '1', 'http://localhost:8888/');
INSERT INTO `bg_visit_log` VALUES ('201990', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/f/leaveComment.html', null, '留言页', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 16:43:32', '1', 'http://localhost:8888/');
INSERT INTO `bg_visit_log` VALUES ('201991', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/f/about.html', null, '关于我', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 16:43:33', '1', 'http://localhost:8888/');
INSERT INTO `bg_visit_log` VALUES ('201992', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', '4faee13f-99fd-4e37-b146-dcad7ffa7f5a', '2019-10-17 16:43:34', '1', 'http://localhost:8888/');
INSERT INTO `bg_visit_log` VALUES ('201993', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-17 16:58:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201994', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-17 18:25:05', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201995', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-17 19:01:25', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201996', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', '2badbfb6-5216-4341-a3d9-e4c534e90c42', '2019-10-17 19:08:38', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201997', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-17 19:22:20', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201998', '116.62.231.166', '浙江 杭州', 'Firefox 36', 'Ubuntu', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-17 19:46:29', '1', null);
INSERT INTO `bg_visit_log` VALUES ('201999', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-17 20:15:07', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202000', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '9f695f96-723a-4aca-a6e0-c5b50c3f933e', '2019-10-17 21:04:14', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202001', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', '8b22da6f-9070-4aa0-a8af-cd981f2f28a7', '2019-10-17 21:39:02', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202002', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-17 22:35:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202003', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-17 23:41:37', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202004', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-18 00:03:16', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202005', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', '8b22da6f-9070-4aa0-a8af-cd981f2f28a7', '2019-10-18 04:08:25', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202006', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 04:48:30', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202007', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-18 06:44:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202008', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '2badbfb6-5216-4341-a3d9-e4c534e90c42', '2019-10-18 06:45:33', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202009', '116.62.231.166', '浙江 杭州', 'Firefox', 'Windows 7', null, '/', null, '首页', '5f8a4ac3-5338-49c4-8b92-23248a7b0299', '2019-10-18 06:56:06', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202010', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 06:56:07', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202011', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 06:56:09', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202012', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 06:56:10', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202013', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-18 06:56:11', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202014', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 06:56:14', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202015', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', '82c9afe1-e737-4f6f-9bd5-36c083b50788', '2019-10-18 08:28:42', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202016', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 08:51:59', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202017', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 09:39:29', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202018', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-18 10:39:08', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202019', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', '2badbfb6-5216-4341-a3d9-e4c534e90c42', '2019-10-18 11:11:46', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202020', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 11:26:03', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202021', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 11:37:38', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202022', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 11:43:20', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202023', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 14:59:40', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202024', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 15:24:45', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202025', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 16:19:27', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202026', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 17:25:37', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202027', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 17:48:15', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202028', '116.62.231.166', '浙江 杭州', 'Firefox', 'Windows 7', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-18 19:09:59', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202029', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '82c9afe1-e737-4f6f-9bd5-36c083b50788', '2019-10-18 19:34:28', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202030', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '53acba7c-e9a4-40c4-a944-7887c822700c', '2019-10-18 20:03:00', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202031', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 20:30:28', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202032', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 20:37:07', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202033', '116.62.231.166', '浙江 杭州', 'Internet Explorer 8', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 21:16:54', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202034', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-18 21:16:59', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202035', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-18 21:16:59', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202036', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-18 21:17:00', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202037', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '5f8a4ac3-5338-49c4-8b92-23248a7b0299', '2019-10-18 21:17:03', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202038', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 21:17:05', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202039', '116.62.231.166', 'XX XX', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 21:17:06', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202040', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 21:41:17', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202041', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'ca9be0f5-3b85-4cc3-bebd-5c67b7cf3810', '2019-10-18 21:41:22', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202042', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 21:41:22', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202043', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-18 21:41:22', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202044', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-18 21:41:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202045', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'a20755ea-b7ae-44e1-b44d-5cd0a6428a2e', '2019-10-18 21:41:53', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202046', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 04:13:53', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202047', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 04:28:01', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202048', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '8b22da6f-9070-4aa0-a8af-cd981f2f28a7', '2019-10-19 05:50:21', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202049', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 05:52:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202050', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 06:05:44', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202051', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-19 07:40:01', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202052', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-19 08:05:20', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202053', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-19 09:59:26', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202054', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 10:28:13', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202055', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', '53acba7c-e9a4-40c4-a944-7887c822700c', '2019-10-19 11:35:01', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202056', '116.62.231.166', '浙江 杭州', 'Firefox 36', 'Ubuntu', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 12:07:01', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202057', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 12:39:26', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202058', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 12:50:01', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202059', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 13:47:27', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202060', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 14:10:30', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202061', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '2badbfb6-5216-4341-a3d9-e4c534e90c42', '2019-10-19 14:13:02', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202062', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-19 14:13:17', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202063', '116.62.231.166', '浙江 杭州', 'Internet Explorer 8', 'Windows 7', null, '/', null, '首页', 'ca9be0f5-3b85-4cc3-bebd-5c67b7cf3810', '2019-10-19 14:21:23', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202064', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 14:21:26', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202065', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 14:21:29', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202066', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-19 14:21:29', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202067', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 14:21:31', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202068', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'a20755ea-b7ae-44e1-b44d-5cd0a6428a2e', '2019-10-19 14:21:32', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202069', '116.62.231.166', 'XX XX', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '82c9afe1-e737-4f6f-9bd5-36c083b50788', '2019-10-19 14:21:33', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202070', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 14:54:00', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202071', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 14:54:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202072', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 16:40:34', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202073', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-19 16:40:41', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202074', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 16:58:41', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202075', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-19 17:02:09', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202076', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '2badbfb6-5216-4341-a3d9-e4c534e90c42', '2019-10-19 17:13:13', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202077', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-19 17:56:00', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202078', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 19:25:26', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202079', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', '8b22da6f-9070-4aa0-a8af-cd981f2f28a7', '2019-10-19 19:33:16', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202080', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 20:21:02', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202081', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-19 22:14:18', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202082', '116.62.231.166', '浙江 杭州', 'Unknown', 'Linux', 'python爬虫', '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 22:16:57', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202083', '116.62.231.166', '浙江 杭州', 'Unknown', 'Linux', 'python爬虫', '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 22:17:07', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202084', '116.62.231.166', '浙江 杭州', 'Unknown', 'Linux', 'python爬虫', '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-19 22:17:07', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202085', '116.62.231.166', '浙江 杭州', 'Unknown', 'Linux', 'python爬虫', '/', null, '首页', '2badbfb6-5216-4341-a3d9-e4c534e90c42', '2019-10-19 22:17:07', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202086', '116.62.231.166', '浙江 杭州', 'Unknown', 'Linux', 'python爬虫', '/', null, '首页', '2badbfb6-5216-4341-a3d9-e4c534e90c42', '2019-10-19 22:17:07', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202087', '116.62.231.166', '浙江 杭州', 'Unknown', 'Linux', 'python爬虫', '/', null, '首页', 'ca9be0f5-3b85-4cc3-bebd-5c67b7cf3810', '2019-10-19 22:17:07', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202088', '116.62.231.166', '浙江 杭州', 'Unknown', 'Linux', 'python爬虫', '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 22:17:08', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202089', '116.62.231.166', '浙江 杭州', 'Unknown', 'Linux', 'python爬虫', '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-19 22:17:38', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202090', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '8b22da6f-9070-4aa0-a8af-cd981f2f28a7', '2019-10-20 00:15:35', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202091', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '53acba7c-e9a4-40c4-a944-7887c822700c', '2019-10-20 00:22:11', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202092', '116.62.231.166', '浙江 杭州', 'Chrome', 'Linux', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-20 00:50:14', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202093', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-20 02:22:31', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202094', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'ca9be0f5-3b85-4cc3-bebd-5c67b7cf3810', '2019-10-20 02:43:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202095', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-20 02:47:19', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202096', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-20 03:18:15', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202097', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-20 03:19:57', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202098', '116.62.231.166', '浙江 杭州', 'Firefox 36', 'Ubuntu', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-20 06:30:18', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202099', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-20 06:31:43', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202100', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-20 07:41:14', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202101', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'ca9be0f5-3b85-4cc3-bebd-5c67b7cf3810', '2019-10-20 08:37:54', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202102', '116.62.231.166', '浙江 杭州', 'Firefox', 'Mac OS X', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-20 09:40:35', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202103', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-20 10:29:29', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202104', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'ebc3d32c-947b-440d-9021-13ad18039317', '2019-10-20 10:51:34', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202105', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', '53acba7c-e9a4-40c4-a944-7887c822700c', '2019-10-20 11:25:57', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202106', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-20 11:48:00', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202107', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-20 11:55:33', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202108', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-20 11:55:38', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202109', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-20 11:55:39', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202110', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '5f8a4ac3-5338-49c4-8b92-23248a7b0299', '2019-10-20 13:06:25', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202111', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'ca9be0f5-3b85-4cc3-bebd-5c67b7cf3810', '2019-10-20 13:06:25', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202112', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-20 13:44:35', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202113', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-20 14:25:42', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202114', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '5f8a4ac3-5338-49c4-8b92-23248a7b0299', '2019-10-20 19:37:53', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202115', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-20 19:37:57', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202116', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-20 19:37:57', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202117', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-20 19:37:59', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202118', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-20 19:38:01', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202119', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-20 19:38:02', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202120', '116.62.231.166', 'XX XX', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '82c9afe1-e737-4f6f-9bd5-36c083b50788', '2019-10-20 19:38:03', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202121', '116.62.231.166', '浙江 杭州', 'Internet Explorer 11', 'Windows 10', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-20 23:30:22', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202122', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-21 00:10:09', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202123', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', '2badbfb6-5216-4341-a3d9-e4c534e90c42', '2019-10-21 00:39:51', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202124', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '82c9afe1-e737-4f6f-9bd5-36c083b50788', '2019-10-21 01:28:46', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202125', '116.62.231.166', '浙江 杭州', 'Firefox 36', 'Ubuntu', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 01:50:48', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202126', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 02:07:16', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202127', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '8b22da6f-9070-4aa0-a8af-cd981f2f28a7', '2019-10-21 03:08:20', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202128', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-21 07:46:59', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202129', '116.62.231.166', '浙江 杭州', 'Firefox 3', 'Windows Vista', null, '/', null, '首页', 'ca9be0f5-3b85-4cc3-bebd-5c67b7cf3810', '2019-10-21 08:10:07', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202130', '116.62.231.166', '浙江 杭州', 'Firefox 36', 'Ubuntu', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 08:35:20', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202131', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 09:28:14', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202132', '116.62.231.166', '浙江 杭州', 'Firefox', 'Windows 7', null, '/', null, '首页', '8b22da6f-9070-4aa0-a8af-cd981f2f28a7', '2019-10-21 09:30:48', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202133', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '53acba7c-e9a4-40c4-a944-7887c822700c', '2019-10-21 09:30:49', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202134', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 09:30:51', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202135', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 09:30:53', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202136', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 09:30:53', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202137', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 09:30:54', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202138', '116.62.231.166', 'XX XX', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 09:31:05', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202139', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', '5f8a4ac3-5338-49c4-8b92-23248a7b0299', '2019-10-21 11:26:03', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202140', '93.173.39.115', 'XX XX', 'Internet Explorer 7', 'Windows 7', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-21 11:35:15', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202141', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', 'a20755ea-b7ae-44e1-b44d-5cd0a6428a2e', '2019-10-21 12:02:46', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202142', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 14:46:40', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202143', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 15:06:17', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202144', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 16:26:35', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202145', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 17:41:58', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202146', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-21 17:52:20', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202147', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 18:43:38', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202148', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', '82c9afe1-e737-4f6f-9bd5-36c083b50788', '2019-10-21 18:45:37', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202149', '116.62.231.166', '浙江 杭州', 'Firefox', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 18:55:10', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202150', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 19:57:08', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202151', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 20:01:33', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202152', '116.62.231.166', '浙江 杭州', 'Internet Explorer 9', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 20:57:29', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202153', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 21:34:01', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202154', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-21 21:55:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202155', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '82c9afe1-e737-4f6f-9bd5-36c083b50788', '2019-10-22 00:24:27', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202156', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 00:24:50', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202157', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-22 00:37:11', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202158', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 00:57:32', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202159', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 01:12:48', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202160', '116.62.231.166', '浙江 杭州', 'Apple WebKit', 'Mac OS X (iPhone)', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 02:16:33', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202161', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 02:16:35', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202162', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-22 02:16:36', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202163', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 02:16:38', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202164', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-22 02:16:42', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202165', '116.62.231.166', 'XX XX', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 02:16:43', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202166', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows', null, '/', null, '首页', '2badbfb6-5216-4341-a3d9-e4c534e90c42', '2019-10-22 02:18:15', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202167', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 06:11:50', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202168', '116.62.231.166', '浙江 杭州', 'Firefox 36', 'Ubuntu', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 06:16:11', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202169', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 07:08:37', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202170', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 09:46:29', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202171', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-22 09:49:08', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202172', '116.62.231.166', '浙江 杭州', 'Chrome', 'Mac OS X', null, '/', null, '首页', 'a20755ea-b7ae-44e1-b44d-5cd0a6428a2e', '2019-10-22 10:03:45', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202173', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '82c9afe1-e737-4f6f-9bd5-36c083b50788', '2019-10-22 10:23:09', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202174', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 12:23:41', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202175', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-22 16:25:27', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202176', '116.62.231.166', '浙江 杭州', 'Internet Explorer 8', 'Windows 7', null, '/', null, '首页', 'ca9be0f5-3b85-4cc3-bebd-5c67b7cf3810', '2019-10-22 16:49:04', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202177', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 16:49:08', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202178', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 16:49:10', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202179', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-22 16:49:11', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202180', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-22 16:49:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202181', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'ebc3d32c-947b-440d-9021-13ad18039317', '2019-10-22 16:49:14', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202182', '116.62.231.166', 'XX XX', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 16:49:14', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202183', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 16:59:27', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202184', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', 'WinHTTP', '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-22 18:30:05', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202185', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '2badbfb6-5216-4341-a3d9-e4c534e90c42', '2019-10-22 19:51:16', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202186', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-22 22:56:58', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202187', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 00:25:58', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202188', '116.62.231.166', '浙江 杭州', 'Unknown', 'Windows', 'python爬虫', '/', null, '首页', '8b22da6f-9070-4aa0-a8af-cd981f2f28a7', '2019-10-23 00:27:33', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202189', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 00:49:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202190', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 00:54:03', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202191', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 00:54:03', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202192', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 00:54:04', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202193', '116.62.231.166', '浙江 杭州', 'Firefox 42', 'Mac OS X', null, '/', null, '首页', '2badbfb6-5216-4341-a3d9-e4c534e90c42', '2019-10-23 00:54:04', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202194', '116.62.231.166', '浙江 杭州', 'Unknown', 'Chrome OS', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 01:17:06', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202195', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 03:06:14', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202196', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '8b22da6f-9070-4aa0-a8af-cd981f2f28a7', '2019-10-23 03:06:16', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202197', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 03:06:17', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202198', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '82c9afe1-e737-4f6f-9bd5-36c083b50788', '2019-10-23 03:06:18', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202199', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '53acba7c-e9a4-40c4-a944-7887c822700c', '2019-10-23 03:06:19', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202200', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 03:06:22', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202201', '116.62.231.166', 'XX XX', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 03:06:26', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202202', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 04:55:53', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202203', '116.62.231.166', '浙江 杭州', 'Chrome', 'Mac OS X', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-23 05:14:29', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202204', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', '2badbfb6-5216-4341-a3d9-e4c534e90c42', '2019-10-23 05:23:18', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202205', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '82c9afe1-e737-4f6f-9bd5-36c083b50788', '2019-10-23 06:29:04', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202206', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 08:40:00', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202207', '116.62.231.166', '浙江 杭州', 'Firefox 36', 'Ubuntu', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 09:00:37', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202208', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '8b22da6f-9070-4aa0-a8af-cd981f2f28a7', '2019-10-23 09:35:51', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202209', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 09:43:52', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202210', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '2badbfb6-5216-4341-a3d9-e4c534e90c42', '2019-10-23 10:41:21', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202211', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-23 11:04:33', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202212', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-23 11:26:01', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202213', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'a20755ea-b7ae-44e1-b44d-5cd0a6428a2e', '2019-10-23 11:58:54', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202214', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-23 11:58:55', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202215', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 11:59:25', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202216', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 13:59:42', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202217', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '82c9afe1-e737-4f6f-9bd5-36c083b50788', '2019-10-23 18:10:31', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202218', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'a20755ea-b7ae-44e1-b44d-5cd0a6428a2e', '2019-10-23 18:10:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202219', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 19:16:44', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202220', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 22:08:28', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202221', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 22:51:03', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202222', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-23 23:01:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202223', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', '5f8a4ac3-5338-49c4-8b92-23248a7b0299', '2019-10-23 23:14:41', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202224', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 02:16:21', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202225', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 02:51:19', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202226', '116.62.231.166', '浙江 杭州', 'Firefox 36', 'Ubuntu', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-24 03:46:57', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202227', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-24 04:34:48', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202228', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '5f8a4ac3-5338-49c4-8b92-23248a7b0299', '2019-10-24 05:10:34', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202229', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'a20755ea-b7ae-44e1-b44d-5cd0a6428a2e', '2019-10-24 05:57:18', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202230', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 06:04:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202231', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 06:59:17', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202232', '116.62.231.166', '浙江 杭州', 'Firefox 36', 'Ubuntu', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 07:15:16', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202233', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 08:22:31', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202234', '116.62.231.166', '浙江 杭州', 'Firefox 9', 'Windows XP', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 08:27:34', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202235', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/f/article/81.html', null, '博客', 'bc99886d-aa52-42e5-a2a8-4919814c346a', '2019-10-24 10:13:13', '1', 'http://localhost:8888/blog/blog');
INSERT INTO `bg_visit_log` VALUES ('202236', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'bc99886d-aa52-42e5-a2a8-4919814c346a', '2019-10-24 10:24:45', '1', 'http://localhost:8888/f/article/81.html');
INSERT INTO `bg_visit_log` VALUES ('202237', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/f/article/81.html', null, '博客', 'bc99886d-aa52-42e5-a2a8-4919814c346a', '2019-10-24 10:24:53', '1', 'http://localhost:8888/');
INSERT INTO `bg_visit_log` VALUES ('202238', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/f/article/81.html', null, '博客', 'bc99886d-aa52-42e5-a2a8-4919814c346a', '2019-10-24 10:24:54', '1', 'http://localhost:8888/');
INSERT INTO `bg_visit_log` VALUES ('202239', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/f/article/81.html', null, '博客', 'bc99886d-aa52-42e5-a2a8-4919814c346a', '2019-10-24 10:24:55', '1', 'http://localhost:8888/');
INSERT INTO `bg_visit_log` VALUES ('202240', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/f/article/81.html', null, '博客', 'bc99886d-aa52-42e5-a2a8-4919814c346a', '2019-10-24 10:24:56', '1', 'http://localhost:8888/');
INSERT INTO `bg_visit_log` VALUES ('202241', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/', null, '首页', 'bc99886d-aa52-42e5-a2a8-4919814c346a', '2019-10-24 10:25:19', '1', 'http://localhost:8888/f/article/81.html');
INSERT INTO `bg_visit_log` VALUES ('202242', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-24 10:25:52', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202243', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', null, '/f/article/81.html', null, '博客', 'bc99886d-aa52-42e5-a2a8-4919814c346a', '2019-10-24 10:31:33', '1', 'http://localhost:8888/blog/blog');
INSERT INTO `bg_visit_log` VALUES ('202244', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '82c9afe1-e737-4f6f-9bd5-36c083b50788', '2019-10-24 11:12:26', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202245', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 15:00:34', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202246', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-24 15:12:24', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202247', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 15:41:01', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202248', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 15:53:41', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202249', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-24 15:56:04', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202250', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 16:32:35', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202251', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-24 16:32:45', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202252', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '82c9afe1-e737-4f6f-9bd5-36c083b50788', '2019-10-24 16:48:32', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202253', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'ca9be0f5-3b85-4cc3-bebd-5c67b7cf3810', '2019-10-24 17:22:01', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202254', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 18:52:28', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202255', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 18:58:36', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202256', '116.62.231.166', '浙江 杭州', 'Firefox', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 19:22:05', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202257', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 20:47:08', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202258', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 20:47:38', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202259', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 20:48:18', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202260', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-24 20:48:54', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202261', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', '2e3d1a8d-3720-4718-a284-f11b1bae4846', '2019-10-24 20:55:36', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202262', '116.62.231.166', '浙江 杭州', 'Chrome 41', 'Windows 7', null, '/', null, '首页', 'a20755ea-b7ae-44e1-b44d-5cd0a6428a2e', '2019-10-24 21:26:53', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202263', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 21:36:15', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202264', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', 'ebc3d32c-947b-440d-9021-13ad18039317', '2019-10-24 21:59:26', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202265', '116.62.231.166', '浙江 杭州', 'Mozilla', 'Unknown', null, '/', null, '首页', '8b22da6f-9070-4aa0-a8af-cd981f2f28a7', '2019-10-24 21:59:27', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202266', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-24 22:19:52', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202267', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 7', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-25 01:55:04', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202268', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-25 01:55:10', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202269', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-25 01:55:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202270', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-25 01:55:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202271', '116.62.231.166', '浙江 杭州', 'Chrome 45', 'Windows 10', null, '/', null, '首页', 'a20755ea-b7ae-44e1-b44d-5cd0a6428a2e', '2019-10-25 01:55:12', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202272', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-25 02:41:47', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202273', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-25 04:10:46', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202274', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-25 04:28:38', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202275', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-25 06:04:23', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202276', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', '5f8a4ac3-5338-49c4-8b92-23248a7b0299', '2019-10-25 06:39:23', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202277', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-25 06:49:31', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202278', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'a20755ea-b7ae-44e1-b44d-5cd0a6428a2e', '2019-10-25 06:52:23', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202279', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-25 07:10:50', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202280', '116.62.231.166', '浙江 杭州', 'Firefox 36', 'Ubuntu', null, '/', null, '首页', '2305cee4-fdfb-4ee8-93c5-58941b4f70c0', '2019-10-25 08:08:26', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202281', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-25 08:25:45', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202282', '116.62.231.166', '浙江 杭州', 'Safari 9', 'Mac OS X', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-25 08:44:44', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202283', '116.62.231.166', '浙江 杭州', 'Unknown', 'Unknown', null, '/', null, '首页', 'b2179760-41f6-4b01-a398-a28dc1a545f8', '2019-10-25 10:02:31', '1', null);
INSERT INTO `bg_visit_log` VALUES ('202284', '116.62.231.166', '浙江 杭州', 'Chrome', 'Windows 10', null, '/', null, '首页', '24b73540-7617-4f9e-b4a4-129aa35dc10a', '2019-10-25 10:13:50', '1', null);

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('DimpleScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('DimpleScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('DimpleScheduler', 'izbp140achw5z4k56hjzr3z1571277011412', '1571974315012', '15000');

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-16 19:25:41', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('24', '8', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('25', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('26', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '1', '已发布', '1', 'blog_blog_status', '', 'primary', 'N', '0', 'admin', '2019-03-16 08:34:13', 'admin', '2019-03-23 12:04:37', '博客正常状态');
INSERT INTO `sys_dict_data` VALUES ('101', '2', '草稿箱', '2', 'blog_blog_status', '', 'warning', 'Y', '0', 'admin', '2019-03-16 16:40:13', 'admin', '2019-03-16 16:40:49', '博客草稿箱状态');
INSERT INTO `sys_dict_data` VALUES ('102', '3', '垃圾箱', '3', 'blog_blog_status', '', 'danger', 'Y', '0', 'admin', '2019-03-16 16:40:34', 'admin', '2019-03-16 16:40:58', '博客垃圾箱状态');
INSERT INTO `sys_dict_data` VALUES ('103', '1', '是', '1', 'blog_blog_support', '', 'success', 'Y', '0', 'admin', '2019-03-24 13:29:44', 'admin', '2019-03-24 13:30:26', '');
INSERT INTO `sys_dict_data` VALUES ('104', '2', '否', '0', 'blog_blog_support', null, 'default', 'Y', '0', 'admin', '2019-03-24 13:30:40', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('105', '1', '是', '1', 'blog_category_support', null, 'primary', 'Y', '0', 'admin', '2019-03-25 17:29:52', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('106', '2', '否', '0', 'blog_category_support', null, 'default', 'Y', '0', 'admin', '2019-03-25 17:30:05', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('107', '1', '死链', '0', 'link_link_available', '', 'danger', 'Y', '0', 'admin', '2019-03-26 09:47:44', 'admin', '2019-03-26 10:14:42', '死链');
INSERT INTO `sys_dict_data` VALUES ('108', '2', '正常', '1', 'link_link_available', '', 'success', 'Y', '0', 'admin', '2019-03-26 09:48:01', 'admin', '2019-03-26 10:14:37', '');
INSERT INTO `sys_dict_data` VALUES ('109', '1', '显示', '1', 'link_link_display', '', 'primary', 'Y', '0', 'admin', '2019-03-26 09:50:23', 'admin', '2019-03-26 10:26:19', '');
INSERT INTO `sys_dict_data` VALUES ('110', '2', '隐藏', '0', 'link_link_display', null, 'default', 'Y', '0', 'admin', '2019-03-26 09:50:38', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('111', '1', '显示', '1', 'system_carouselMap_display', null, 'primary', 'Y', '0', 'admin', '2019-04-08 16:48:55', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('112', '1', '隐藏', '0', 'system_carouselMap_display', null, 'default', 'Y', '0', 'admin', '2019-04-08 16:49:10', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('113', '1', '是', '1', 'system_carouselMap_target', null, 'primary', 'Y', '0', 'admin', '2019-04-08 16:55:34', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('114', '2', '否', '0', 'system_carouselMap_target', null, 'default', 'Y', '0', 'admin', '2019-04-08 16:55:55', '', null, null);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('10', '博客状态', 'blog_blog_status', '0', 'admin', '2019-03-16 08:37:55', 'admin', '2019-03-16 08:38:02', '博客状态列表');
INSERT INTO `sys_dict_type` VALUES ('101', '博客推荐', 'blog_blog_support', '0', 'admin', '2019-03-24 13:28:43', 'admin', '2019-03-24 13:29:00', '博客推荐列表');
INSERT INTO `sys_dict_type` VALUES ('102', '分类推荐', 'blog_category_support', '0', 'admin', '2019-03-25 17:29:27', 'admin', '2019-03-25 17:29:36', '分类推荐列表');
INSERT INTO `sys_dict_type` VALUES ('103', '友链死链状态', 'link_link_available', '0', 'admin', '2019-03-26 09:46:29', '', null, '友链死链状态');
INSERT INTO `sys_dict_type` VALUES ('104', '友链显示状态', 'link_link_display', '0', 'admin', '2019-03-26 09:49:53', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('105', '轮播图状态', 'system_carouselMap_display', '0', 'admin', '2019-04-08 16:48:37', '', null, '轮播图是否显示');
INSERT INTO `sys_dict_type` VALUES ('106', '轮播图打开状态', 'system_carouselMap_target', '0', 'admin', '2019-04-08 16:55:11', '', null, '轮播图是否当前窗口打开');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5684 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('5654', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-10-14 16:11:44');
INSERT INTO `sys_logininfor` VALUES ('5655', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-10-14 16:11:47');
INSERT INTO `sys_logininfor` VALUES ('5656', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-10-14 16:11:54');
INSERT INTO `sys_logininfor` VALUES ('5657', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-14 16:16:35');
INSERT INTO `sys_logininfor` VALUES ('5658', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-10-14 16:16:40');
INSERT INTO `sys_logininfor` VALUES ('5659', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2019-10-14 16:19:56');
INSERT INTO `sys_logininfor` VALUES ('5660', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误3次', '2019-10-14 16:22:17');
INSERT INTO `sys_logininfor` VALUES ('5661', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误4次', '2019-10-14 16:22:35');
INSERT INTO `sys_logininfor` VALUES ('5662', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误5次', '2019-10-14 16:22:42');
INSERT INTO `sys_logininfor` VALUES ('5663', 'dimple', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '对不起，您的账号已被删除', '2019-10-14 16:23:23');
INSERT INTO `sys_logininfor` VALUES ('5664', 'dimple', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-10-14 16:23:47');
INSERT INTO `sys_logininfor` VALUES ('5665', 'dimple', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-10-14 16:41:06');
INSERT INTO `sys_logininfor` VALUES ('5666', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-14 16:42:05');
INSERT INTO `sys_logininfor` VALUES ('5667', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 16:42:09');
INSERT INTO `sys_logininfor` VALUES ('5668', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 16:42:47');
INSERT INTO `sys_logininfor` VALUES ('5669', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 16:44:22');
INSERT INTO `sys_logininfor` VALUES ('5670', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-14 16:44:38');
INSERT INTO `sys_logininfor` VALUES ('5671', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-10-14 16:45:02');
INSERT INTO `sys_logininfor` VALUES ('5672', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2019-10-14 16:45:06');
INSERT INTO `sys_logininfor` VALUES ('5673', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 16:45:12');
INSERT INTO `sys_logininfor` VALUES ('5674', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-14 17:15:23');
INSERT INTO `sys_logininfor` VALUES ('5675', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-14 17:15:33');
INSERT INTO `sys_logininfor` VALUES ('5676', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 17:15:36');
INSERT INTO `sys_logininfor` VALUES ('5677', 'admin', '117.14.62.38', '天津 天津', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 17:24:12');
INSERT INTO `sys_logininfor` VALUES ('5678', 'admin', '202.99.89.223', '天津 天津', 'Chrome Mobile', 'Android Mobile', '0', '登录成功', '2019-10-14 17:25:37');
INSERT INTO `sys_logininfor` VALUES ('5679', 'admin', '192.168.6.177', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-17 13:54:55');
INSERT INTO `sys_logininfor` VALUES ('5680', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-10-24 09:52:46');
INSERT INTO `sys_logininfor` VALUES ('5681', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2019-10-24 09:52:54');
INSERT INTO `sys_logininfor` VALUES ('5682', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误3次', '2019-10-24 09:57:24');
INSERT INTO `sys_logininfor` VALUES ('5683', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-24 09:57:32');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2052 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '10', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-16 17:00:22', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '9', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-16 17:00:31', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '0', '9', '#', 'M', '0', '', 'fa fa-at', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-16 17:41:31', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '系统图表', '2013', '3', '/chart/server', 'C', '0', 'chart:server:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '2', '3', '/monitor/swagger', 'C', '0', 'monitor:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-15 18:06:14', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/log/operlog', 'C', '0', 'log:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-16 19:12:30', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/log/logininfor', 'C', '0', 'log:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-16 19:12:43', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', 'F', '0', 'log:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-16 19:12:54', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', 'F', '0', 'log:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-16 19:13:03', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', 'F', '0', 'log:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-16 19:13:12', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', 'F', '0', 'log:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-16 19:13:22', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', 'F', '0', 'log:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-16 19:13:32', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', 'F', '0', 'log:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-16 19:13:43', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', 'F', '0', 'log:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-16 19:13:55', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务详细', '110', '6', '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务导出', '110', '7', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2000', '博客模块', '0', '1', '#', 'M', '0', null, 'fa fa-sign-language', 'admin', '2019-03-16 16:59:44', '', null, '');
INSERT INTO `sys_menu` VALUES ('2001', '博客管理', '2000', '1', '/blog/blog', 'C', '0', 'blog:blog:view', '#', 'admin', '2019-03-16 17:01:22', 'admin', '2019-03-16 17:02:37', '');
INSERT INTO `sys_menu` VALUES ('2002', '分类管理', '2000', '2', '/blog/category', 'C', '0', 'blog:category:view', '#', 'admin', '2019-03-16 17:02:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '标签管理', '2000', '3', '/blog/tag', 'C', '0', 'blog:tag:view', '#', 'admin', '2019-03-16 17:03:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '畅言评论', '2000', '4', 'http://changyan.kuaizhan.com/', 'C', '0', null, '#', 'admin', '2019-03-16 19:21:57', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '友链管理', '0', '5', '#', 'M', '0', null, 'fa fa-code', 'admin', '2019-03-16 19:22:45', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '友链列表', '2006', '1', '/link/link', 'C', '0', '', '#', 'admin', '2019-03-16 19:23:16', 'admin', '2019-03-25 21:11:01', '');
INSERT INTO `sys_menu` VALUES ('2008', '调度日志', '108', '4', '/log/jobLog', 'C', '0', 'log:job:view', '#', 'admin', '2019-03-16 22:18:07', '', null, '');
INSERT INTO `sys_menu` VALUES ('2009', '日志查询', '2008', '1', '#', 'F', '0', 'log:job:list', '#', 'admin', '2019-03-16 22:19:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '日志删除', '2008', '2', '#', 'F', '0', 'log:job:remove', '#', 'admin', '2019-03-16 22:19:30', '', null, '');
INSERT INTO `sys_menu` VALUES ('2011', '日志导出', '2008', '3', '#', 'F', '0', 'log:job:export', '#', 'admin', '2019-03-16 22:19:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '日志详细', '2008', '4', '#', 'F', '0', 'log:job:detail', '#', 'admin', '2019-03-16 22:20:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '统计图表', '0', '6', '#', 'M', '0', null, 'fa fa-bar-chart-o', 'admin', '2019-03-17 11:05:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('2014', '访问日志', '108', '1', '/log/visitLog', 'C', '0', '', '#', 'admin', '2019-03-26 17:40:13', 'admin', '2019-03-26 17:42:19', '');
INSERT INTO `sys_menu` VALUES ('2015', '黑名单', '2', '4', '/monitor/blacklist', 'C', '0', 'monitor:blacklist:view', '#', 'admin', '2019-03-29 10:32:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '内容管理', '0', '5', '#', 'M', '0', '', 'fa fa-archive', 'admin', '2019-04-03 15:53:17', 'admin', '2019-04-03 18:20:56', '');
INSERT INTO `sys_menu` VALUES ('2017', '图片管理', '2016', '1', '/file/img', 'C', '0', null, '#', 'admin', '2019-04-03 15:53:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '轮播设置', '1', '9', '/system/carouselMap', 'C', '0', 'system:carouselMap:view', '#', 'admin', '2019-04-08 16:43:39', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '轮播删除', '2018', '1', '#', 'F', '0', 'system:carouselMap:remove', '#', 'admin', '2019-04-08 16:44:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '轮播增加', '2018', '1', '#', 'F', '0', 'system:carouselMap:add', '#', 'admin', '2019-04-08 16:44:31', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '轮播修改', '2018', '1', '#', 'F', '0', 'system:carouselMap:edit', '#', 'admin', '2019-04-08 16:44:48', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '轮播查询', '2018', '1', '#', 'F', '0', 'system:carouselMap:list', '#', 'admin', '2019-04-08 16:45:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('2023', '业务图表', '2013', '2', '/chart/business', 'C', '0', null, '#', 'admin', '2019-04-08 19:20:08', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(128) NOT NULL COMMENT '公告标题',
  `display` char(1) DEFAULT '0' COMMENT '公告状态（0隐藏 1显示）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '欢迎来到边小丰的个人博客网站', '1', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-08 16:05:47');
INSERT INTO `sys_notice` VALUES ('2', '如果有什么问题请到留言板留言', '1', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-08 16:06:06');
INSERT INTO `sys_notice` VALUES ('3', '欢迎来到最代码网站zuidaima.com', '0', 'admin', '2019-04-23 23:48:56', '', null);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11724 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('11707', '系统博客', '1', 'com.dimple.project.blog.blog.controller.BlogController.addSave()', '1', 'admin', '', '/blog/blog/add', '127.0.0.1', '内网IP', '{\"headerImg\":[\"http://localhost/img/blog-default.png\"],\"title\":[\"新增数据\"],\"summary\":[\"新增数据\"],\"tags\":[\"新增数据\"],\"categoryId\":[\"53\"],\"weight\":[\"1\"],\"content\":[\"<p>新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据新增数据<br></p>\"]}', '0', null, '2019-10-14 17:14:33');
INSERT INTO `sys_oper_log` VALUES ('11708', '博客分类', '2', 'com.dimple.project.blog.category.controller.CategoryController.supportSave()', '1', 'admin', '', '/blog/category/support/0', '127.0.0.1', '内网IP', '{\"categoryId\":[\"51\"]}', '0', null, '2019-10-15 10:13:20');
INSERT INTO `sys_oper_log` VALUES ('11709', '系统友链', '3', 'com.dimple.project.link.controller.LinkController.remove()', '1', 'admin', '', '/link/link/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '0', null, '2019-10-15 10:18:20');
INSERT INTO `sys_oper_log` VALUES ('11710', '系统友链', '3', 'com.dimple.project.link.controller.LinkController.remove()', '1', 'admin', '', '/link/link/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2019-10-15 10:18:22');
INSERT INTO `sys_oper_log` VALUES ('11711', '系统友链', '3', 'com.dimple.project.link.controller.LinkController.remove()', '1', 'admin', '', '/link/link/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '0', null, '2019-10-15 10:18:26');
INSERT INTO `sys_oper_log` VALUES ('11712', '系统博客', '1', 'com.dimple.project.blog.blog.controller.BlogController.addSave()', '1', 'admin', '', '/blog/blog/add', '192.168.6.177', '内网IP', '{\"headerImg\":[\"http://localhost/img/blog-default.png\"],\"title\":[\"博客标题\"],\"summary\":[\"博客标题\"],\"tags\":[\"博客标题\"],\"categoryId\":[\"53\"],\"weight\":[\"0\"],\"content\":[\"<p>博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题博客标题<br></p>\"]}', '0', null, '2019-10-17 13:04:42');
INSERT INTO `sys_oper_log` VALUES ('11713', '定时任务', '3', 'com.dimple.project.monitor.job.controller.JobController.remove()', '1', 'admin', '', '/monitor/job/remove', '192.168.6.177', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-10-17 13:05:47');
INSERT INTO `sys_oper_log` VALUES ('11714', '系统博客', '1', 'com.dimple.project.blog.blog.controller.BlogController.addSave()', '1', 'admin', '', '/blog/blog/add', '192.168.6.177', '内网IP', '{\"headerImg\":[\"http://localhost/img/blog-default.png\"],\"title\":[\"nginx简单配置负载均衡、静态资源\"],\"summary\":[\"nginx\"],\"tags\":[\"nginx配置\"],\"categoryId\":[\"50\"],\"weight\":[\"1\"],\"content\":[\"<p><br></p><p>#user&nbsp; nobody;</p><p>worker_processes&nbsp; 1;</p><p><br></p><p>#error_log&nbsp; logs/error.log;</p><p>#error_log&nbsp; logs/error.log&nbsp; notice;</p><p>#error_log&nbsp; logs/error.log&nbsp; info;</p><p><br></p><p>#pid&nbsp; &nbsp; &nbsp; &nbsp; logs/nginx.pid;</p><p><br></p><p><br></p><p>events {</p><p>&nbsp; &nbsp; worker_connections&nbsp; 1024;</p><p>}</p><p><br></p><p><br></p><p>http {</p><p>&nbsp; &nbsp; include&nbsp; &nbsp; &nbsp; &nbsp;mime.types;</p><p>&nbsp; &nbsp; default_type&nbsp; application/octet-stream;</p><p><br></p><p>&nbsp; &nbsp; #log_format&nbsp; main&nbsp; \'$remote_addr - $remote_user [$time_local] \\\"$request\\\" \'</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \'$status $body_bytes_sent \\\"$http_referer\\\" \'</p><p>&nbsp; &nbsp; #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \'\\\"$http_user_agent\\\" \\\"$http_x_forwarded_for\\\"\';</p><p><br></p><p>&nbsp; &nbsp; #access_log&nbsp; logs/access.log&nbsp; main;</p><p><br></p><p>&nbsp; &nbsp; sendfile&nbsp; &nbsp; &nbsp; &nbsp; on;</p><p>&nbsp; &nbsp; #tcp_nopush&nbsp; &nbsp; &nbsp;on;</p><p><br></p><p>&nbsp; &nbsp; #keepalive_timeout&nbsp; 0;</p><p>&nbsp; &nbsp; keepalive_timeout&nbsp; 65;</p><p><br></p><p>&nbsp; &nbsp; #gzip&nbsp; on;</p><p><span style=\\\"white-space:pre\\\">\\t</span></p><p><span style=\\\"white-space:pre\\\">\\t</span>upstream blogserver {&nbsp; #配置轮训请求应用服务器</p><p><span style=\\\"white-space:pre\\\">\\t\\t</span>server 192.168.6.177:10088;&nbsp;&nbsp;</p><p><span style=\\\"white-space:pre\\\">\\t\\t</span>server 192.168.6.177:10099;&nbsp;&nbsp;</p><p>&nbsp; &nbsp; }</p><p><br></p><p>&nbsp; &nbsp; server {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; listen&nbsp; &nbsp; &nbsp; &nbsp;80; #默认端口</p><p>&nbsp; &nbsp; &nbsp; &nbsp; server_name&nbsp; localhost;#默认id</p><p><br></p><p>&nbsp;', '0', null, '2019-10-17 13:11:08');
INSERT INTO `sys_oper_log` VALUES ('11715', '系统博客', '2', 'com.dimple.project.blog.blog.controller.BlogController.statusSave()', '1', 'admin', '', '/blog/blog/status/2', '192.168.6.177', '内网IP', '{\"blogIds\":[\"80\"]}', '0', null, '2019-10-17 13:46:08');
INSERT INTO `sys_oper_log` VALUES ('11716', '系统博客', '2', 'com.dimple.project.blog.blog.controller.BlogController.statusSave()', '1', 'admin', '', '/blog/blog/status/3', '192.168.6.177', '内网IP', '{\"blogIds\":[\"78\"]}', '0', null, '2019-10-17 13:46:49');
INSERT INTO `sys_oper_log` VALUES ('11717', '系统图片', '10', 'com.dimple.project.file.image.ImageController.add()', '1', 'admin', '', '/file/image/add', '127.0.0.1', '内网IP', '{\"fileId\":[\"80860_wanxiaochao.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"],\"serverType\":[\"2\"]}', '1', '', '2019-10-24 10:01:37');
INSERT INTO `sys_oper_log` VALUES ('11718', '系统图片', '10', 'com.dimple.project.file.image.ImageController.add()', '1', 'admin', '', '/file/image/add', '127.0.0.1', '内网IP', '{\"fileId\":[\"80860_wanxiaochao.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"],\"serverType\":[\"2\"]}', '1', '', '2019-10-24 10:01:53');
INSERT INTO `sys_oper_log` VALUES ('11719', '系统图片', '10', 'com.dimple.project.file.image.ImageController.add()', '1', 'admin', '', '/file/image/add', '127.0.0.1', '内网IP', '{\"fileId\":[\"80860_wanxiaochao.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"],\"serverType\":[\"2\"]}', '1', '', '2019-10-24 10:03:03');
INSERT INTO `sys_oper_log` VALUES ('11720', '系统图片', '10', 'com.dimple.project.file.image.ImageController.add()', '1', 'admin', '', '/file/image/add', '127.0.0.1', '内网IP', '{\"fileId\":[\"80860_wanxiaochao.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"],\"serverType\":[\"1\"]}', '1', '系统找不到指定的路径。', '2019-10-24 10:03:24');
INSERT INTO `sys_oper_log` VALUES ('11721', '系统图片', '10', 'com.dimple.project.file.image.ImageController.add()', '1', 'admin', '', '/file/image/add', '127.0.0.1', '内网IP', '{\"fileId\":[\"28012_u=2411341495,3097540968&fm=26&gp=0.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"],\"serverType\":[\"2\"]}', '0', null, '2019-10-24 10:12:04');
INSERT INTO `sys_oper_log` VALUES ('11722', '系统博客', '1', 'com.dimple.project.blog.blog.controller.BlogController.addSave()', '1', 'admin', '', '/blog/blog/add', '127.0.0.1', '内网IP', '{\"headerImg\":[\"http://localhost:8888/img/blog-default.png\"],\"title\":[\"fastdfs上传文件\"],\"summary\":[\"springboot+fastdfs\"],\"tags\":[\"springboot+fastdfs\"],\"categoryId\":[\"45\"],\"weight\":[\"0\"],\"content\":[\"<p><img src=\\\"http://116.62.231.166/group1/M00/00/00/rBEyTV2xCHOAIL9VAABtbKRuLU8400.jpg\\\" data-filename=\\\"http://116.62.231.166/group1/M00/00/00/rBEyTV2xCHOAIL9VAABtbKRuLU8400.jpg\\\" style=\\\"width: 500px;\\\"><br></p>\"]}', '0', null, '2019-10-24 10:13:01');
INSERT INTO `sys_oper_log` VALUES ('11723', '系统博客', '2', 'com.dimple.project.blog.blog.controller.BlogController.supportSave()', '1', 'admin', '', '/blog/blog/support/1', '127.0.0.1', '内网IP', '{\"blogId\":[\"81\"]}', '0', null, '2019-10-24 10:24:35');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '6', '1', '1', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-08 21:00:23', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-08 21:00:26', '普通角色');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'Dimple', '00', 'bianxiaofeng@sohu.com', '18582872818', '1', '', 'e63aa47c7eef584015e37a57200db50d', '8a6753', '0', '0', '127.0.0.1', '2019-10-24 09:57:32', 'admin', '2018-03-16 11:33:00', 'admin', '2019-10-24 09:57:32', '管理员');
INSERT INTO `sys_user` VALUES ('2', 'dimple', 'Dimple', '00', 'dimple@qq.com', '15666666666', '1', '', '85a0664b1a9c9cdb2bbbd69f84fa65ea', '3b90c6', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'admin', '2019-10-14 16:40:47', '测试员');
INSERT INTO `sys_user` VALUES ('3', 'zuidaima', 'zuidaima', '00', 'zuidaima@qq.com', '13520109202', '2', '', 'fd36f8e5c309e2c838b5b62a42362145', 'cacd62', '0', '0', '', null, 'admin', '2019-04-23 23:47:13', '', '2019-10-14 16:40:47', 'zuidaima.com管理员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
