CREATE TABLE `t_export` (
  `id` int(11) NOT NULL auto_increment,
  `goodsId` int(20) default NULL,
  `expoPrice` varchar(20) default NULL,
  `expoDate` datetime default NULL,
  `expoNum` varchar(20) default NULL,
  `expoDesc` varchar(1000) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_t_export` (`goodsId`),
  CONSTRAINT `FK_t_export` FOREIGN KEY (`goodsId`) REFERENCES `t_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL auto_increment,
  `goodsId` int(20) default NULL,
  `goodsName` varchar(20) default NULL,
  `proId` int(20) default NULL,
  `typeId` int(20) default NULL,
  `goodsDesc` varchar(1000) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_t_goods` (`typeId`),
  KEY `FK_t1_goods` (`proId`),
  CONSTRAINT `FK_t1_goods` FOREIGN KEY (`proId`) REFERENCES `t_provider` (`id`),
  CONSTRAINT `FK_t_goods` FOREIGN KEY (`typeId`) REFERENCES `t_goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

CREATE TABLE `t_goodstype` (
  `id` int(11) NOT NULL auto_increment,
  `typeName` varchar(20) default NULL,
  `typeDesc` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

CREATE TABLE `t_import` (
  `id` int(11) NOT NULL auto_increment,
  `goodsId` int(20) default NULL,
  `impoPrice` varchar(20) default NULL,
  `impoDate` datetime default NULL,
  `impoNum` varchar(20) default NULL,
  `impoDesc` varchar(1000) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_t_import` (`goodsId`),
  CONSTRAINT `FK_t_import` FOREIGN KEY (`goodsId`) REFERENCES `t_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

CREATE TABLE `t_provider` (
  `id` int(11) NOT NULL auto_increment,
  `proId` int(20) default NULL,
  `proName` varchar(20) default NULL,
  `linkman` varchar(20) default NULL,
  `proPhone` varchar(20) default NULL,
  `proDesc` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

CREATE TABLE `t_stock` (
  `id` int(11) NOT NULL auto_increment,
  `goodsId` int(20) default NULL,
  `stockNum` varchar(20) default NULL,
  `impoPrice` varchar(20) default NULL,
  `expoPrice` varchar(20) default NULL,
  `stockDesc` varchar(1000) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_t_stock` (`goodsId`),
  CONSTRAINT `FK_t_stock` FOREIGN KEY (`goodsId`) REFERENCES `t_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

