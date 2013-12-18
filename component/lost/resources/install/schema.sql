CREATE TABLE `lost_objects` (
  `lost_object_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `text` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(11) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  PRIMARY KEY (`lost_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;