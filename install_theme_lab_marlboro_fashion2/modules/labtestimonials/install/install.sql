CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'labtestimonials` (
    `id_labtestimonials` int(11) NOT NULL AUTO_INCREMENT,
    `name_post` varchar(100) NOT NULL,
    `email` varchar(100) NOT NULL,
    `company` varchar(255) DEFAULT NULL,
    `address` varchar(500) NOT NULL,
    `media_link` varchar(500) DEFAULT NULL,
    `media_link_id` varchar(20) DEFAULT NULL,
    `media` varchar(255) DEFAULT NULL,
    `media_type` varchar(25) DEFAULT NULL,
    `content` text NOT NULL,
    `date_add` datetime DEFAULT NULL,
    `active` tinyint(1) DEFAULT NULL,
    `position` int(11) DEFAULT NULL ,
    PRIMARY KEY (`id_labtestimonials`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
INSERT INTO `'._DB_PREFIX_.'labtestimonials` VALUES (1, 'Jane Doe', 'JaneDoe@gmai.com', 'Online Marketer', 'Online Marketer', '', '', '630-client-3.png', 'png', 'Aliquam quis risus viverra, ornare ipsum vitae, congue tellus. Vestibulum nunc lorem, scelerisque a tristique non, accumsan ornare eros. Nullam sapien metus.', '2014-10-21 05:51:42', 1, 0);
INSERT INTO `'._DB_PREFIX_.'labtestimonials` VALUES (2, 'Cornelius Reeves', 'CorneliusReeves@gmai.com', 'Project Manager', 'Project Manager', '', '', '993-client-6.png', 'png', 'This is Photoshop\'s version  of Lorem Ipsum. Proin gravida nibh vel velit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. In molestie augue magna.', '2014-10-21 05:55:43', 1, 1);
INSERT INTO `'._DB_PREFIX_.'labtestimonials` VALUES (3, 'Jochen Rechsteiner', 'JochenRechsteiner@gmai.com', 'Stylish Manager', 'Stylish Manager', '', '', '58-client-8.png', 'png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '2014-10-21 05:57:44', 1, 2);

CREATE TABLE IF NOT EXISTS `ps_labtestimonials_shop` (
    `id_labtestimonials` int(10) unsigned NOT NULL,
    `id_shop` int(10) unsigned NOT NULL,
    PRIMARY KEY (`id_labtestimonials`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `'._DB_PREFIX_.'labtestimonials_shop` VALUES (1, 1);
INSERT INTO `'._DB_PREFIX_.'labtestimonials_shop` VALUES (2, 1);
INSERT INTO `'._DB_PREFIX_.'labtestimonials_shop` VALUES (3, 1);
/*database custom fields*/
