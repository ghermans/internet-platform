

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table about
# ------------------------------------------------------------

DROP TABLE IF EXISTS `about`;

CREATE TABLE `about` (
  `about_article_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attachments_attachment_id` int(11) unsigned NOT NULL DEFAULT '0',
  `categories_category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(11) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  `publish_on` datetime DEFAULT NULL,
  `unpublish_on` datetime DEFAULT NULL,
  `params` text,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`about_article_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `idx_access` (`access`),
  KEY `idx_state` (`published`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_catid` (`categories_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table activities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activities`;

CREATE TABLE `activities` (
  `activities_activity_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL DEFAULT '',
  `application` varchar(10) NOT NULL DEFAULT '',
  `package` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(50) NOT NULL DEFAULT '',
  `row` varchar(2048) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `metadata` text NOT NULL,
  PRIMARY KEY (`activities_activity_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `package` (`package`),
  KEY `name` (`name`),
  KEY `row` (`row`(255)),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table articles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `articles_article_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attachments_attachment_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `categories_category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by` int(11) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(11) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  `publish_on` datetime DEFAULT NULL,
  `unpublish_on` datetime DEFAULT NULL,
  `params` text,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`articles_article_id`),
  KEY `idx_access` (`access`),
  KEY `idx_state` (`published`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_catid` (`categories_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attachments`;

CREATE TABLE `attachments` (
  `attachments_attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `container` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `description` text,
  `created_by` int(11) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(11) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  PRIMARY KEY (`attachments_attachment_id`),
  KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table attachments_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attachments_relations`;

CREATE TABLE `attachments_relations` (
  `attachments_attachment_id` int(10) unsigned NOT NULL,
  `table` varchar(64) NOT NULL,
  `row` int(10) unsigned NOT NULL,
  KEY `attachments_attachment_id` (`attachments_attachment_id`),
  CONSTRAINT `attachments_relations_ibfk_1` FOREIGN KEY (`attachments_attachment_id`) REFERENCES `attachments` (`attachments_attachment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `categories_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `attachments_attachment_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(10) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`categories_category_id`),
  UNIQUE KEY `slug` (`slug`,`table`),
  KEY `cat_idx` (`table`,`published`,`access`),
  KEY `idx_access` (`access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `comments_comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table` varchar(64) NOT NULL,
  `row` int(10) unsigned NOT NULL,
  `text` text,
  `created_on` datetime DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  `locked_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`comments_comment_id`),
  KEY `idx_table_row` (`table`,`row`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table contacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `contacts_contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_category_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `email_to` varchar(255) DEFAULT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_by` int(11) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(11) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`contacts_contact_id`),
  KEY `category` (`categories_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table districts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `districts`;

CREATE TABLE `districts` (
  `districts_district_id` varchar(250) NOT NULL DEFAULT '',
  `contacts_contact_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`districts_district_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table districts_districts_officers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `districts_districts_officers`;

CREATE TABLE `districts_districts_officers` (
  `districts_district_id` varchar(250) NOT NULL DEFAULT '',
  `districts_officer_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`districts_district_id`,`districts_officer_id`),
  KEY `districts_districts_officers__districts_officer_id` (`districts_officer_id`),
  CONSTRAINT `districts_districts_officers__districts_district_id` FOREIGN KEY (`districts_district_id`) REFERENCES `districts` (`districts_district_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `districts_districts_officers__districts_officer_id` FOREIGN KEY (`districts_officer_id`) REFERENCES `districts_officers` (`districts_officer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table districts_officers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `districts_officers`;

CREATE TABLE `districts_officers` (
  `districts_officer_id` int(11) unsigned NOT NULL,
  `attachments_attachment_id` int(11) unsigned DEFAULT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `position` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `mobile` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `show_image` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  `old_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`districts_officer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table districts_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `districts_relations`;

CREATE TABLE `districts_relations` (
  `districts_relation_id` varchar(40) NOT NULL DEFAULT '',
  `districts_district_id` varchar(10) NOT NULL DEFAULT '',
  `streets_street_id` int(11) DEFAULT NULL,
  `range_start` int(11) NOT NULL DEFAULT '1',
  `range_end` int(11) NOT NULL DEFAULT '9999',
  `range_parity` varchar(250) NOT NULL,
  `islp` varchar(250) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`districts_relation_id`),
  KEY `districts_relations__districts_district_id` (`districts_district_id`),
  CONSTRAINT `districts_relations__districts_district_id` FOREIGN KEY (`districts_district_id`) REFERENCES `districts` (`districts_district_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relations table for streets';



# Dump of table extensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `extensions`;

CREATE TABLE `extensions` (
  `extensions_extension_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`extensions_extension_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `extensions` WRITE;
/*!40000 ALTER TABLE `extensions` DISABLE KEYS */;

INSERT INTO `extensions` (`extensions_extension_id`, `title`, `name`, `params`, `enabled`)
VALUES
	(7,'Contacts','com_contacts','',1),
	(19,'Files','com_files','pload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nimage_path=images\nrestrict_uploads=1\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html',1),
	(20,'Articles','com_articles','',1),
	(23,'Languages','com_languages','',1),
	(25,'Pages','com_pages','',1),
	(28,'Extensions','com_extensions','',1),
	(31,'Users','com_users','allowUserRegistration=\"1\"\nnew_usertype=\"18\"\nuseractivation=\"1\"\nfrontend_userparams=\"1\"\npassword_length=\"5\"\npassword_expire=\"0\"\nrecaptcha_public_key=\"\"\nrecaptcha_private_key=\"\"',1),
	(32,'Cache','com_cache','',1),
	(34,'Activities','com_activities','',1),
	(35,'Dashboard','com_dashboard','',1),
	(36,'Districts','com_districts','',1),
	(37,'Traffic','com_traffic','',1),
	(38,'News','com_news','',1),
	(39,'Streets','com_streets','',1),
	(40,'Questions','com_questions','',1),
	(41,'Police','com_police','',1),
	(42,'Zendesk','com_zendesk','',1),
	(43,'About','com_about','',1),
	(44,'Uploads','com_uploads','',1),
	(45,'Fora','com_fora','',1),
	(46,'Lost','com_lost','',1);

/*!40000 ALTER TABLE `extensions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table files_containers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `files_containers`;

CREATE TABLE `files_containers` (
  `files_container_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `parameters` text NOT NULL,
  PRIMARY KEY (`files_container_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `files_containers` WRITE;
/*!40000 ALTER TABLE `files_containers` DISABLE KEYS */;

INSERT INTO `files_containers` (`files_container_id`, `slug`, `title`, `path`, `parameters`)
VALUES
	(1,'files-files','Files','files','{\"thumbnails\": true,\"maximum_size\":\"10485760\",\"allowed_extensions\": [\"bmp\", \"csv\", \"doc\", \"gif\", \"ico\", \"jpg\", \"jpeg\", \"odg\", \"odp\", \"ods\", \"odt\", \"pdf\", \"png\", \"ppt\", \"swf\", \"txt\", \"xcf\", \"xls\"],\"allowed_mimetypes\": [\"image/jpeg\", \"image/gif\", \"image/png\", \"image/bmp\", \"application/x-shockwave-flash\", \"application/msword\", \"application/excel\", \"application/pdf\", \"application/powerpoint\", \"text/plain\", \"application/x-zip\"],\"allowed_media_usergroup\":3}'),
	(2,'attachments-attachments','Attachments','attachments','{\"thumbnails\": false,\"maximum_size\":\"10485760\",\"allowed_extensions\": [\"bmp\", \"csv\", \"doc\", \"gif\", \"ico\", \"jpg\", \"jpeg\", \"odg\", \"odp\", \"ods\", \"odt\", \"pdf\", \"png\", \"ppt\", \"sql\", \"swf\", \"txt\", \"xcf\", \"xls\"],\"allowed_mimetypes\": [\"image/jpeg\", \"image/gif\", \"image/png\", \"image/bmp\", \"application/x-shockwave-flash\", \"application/msword\", \"application/excel\", \"application/pdf\", \"application/powerpoint\", \"text/plain\", \"application/x-zip\"]}');

/*!40000 ALTER TABLE `files_containers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table files_thumbnails
# ------------------------------------------------------------

DROP TABLE IF EXISTS `files_thumbnails`;

CREATE TABLE `files_thumbnails` (
  `files_thumbnail_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `files_container_id` varchar(255) NOT NULL,
  `folder` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `thumbnail` mediumtext NOT NULL,
  PRIMARY KEY (`files_thumbnail_id`),
  KEY `filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table languages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `languages_language_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `application` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `native_name` varchar(150) NOT NULL,
  `iso_code` varchar(8) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `primary` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`languages_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;

INSERT INTO `languages` (`languages_language_id`, `application`, `name`, `native_name`, `iso_code`, `slug`, `enabled`, `primary`)
VALUES
	(1,'admin','English (United Kingdom)','English (United Kingdom)','en-GB','en',1,1),
	(2,'site','English (United Kingdom)','English (United Kingdom)','en-GB','en',1,1);

/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table languages_tables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `languages_tables`;

CREATE TABLE `languages_tables` (
  `languages_table_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `extensions_extension_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `unique_column` varchar(64) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`languages_table_id`),
  KEY `languages_tables__extensions_extension_id` (`extensions_extension_id`),
  CONSTRAINT `languages_tables__extensions_extension_id` FOREIGN KEY (`extensions_extension_id`) REFERENCES `extensions` (`extensions_extension_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `languages_tables` WRITE;
/*!40000 ALTER TABLE `languages_tables` DISABLE KEYS */;

INSERT INTO `languages_tables` (`languages_table_id`, `extensions_extension_id`, `name`, `unique_column`, `enabled`)
VALUES
	(1,20,'articles','articles_article_id',0),
	(2,20,'categories','categories_category_id',0);

/*!40000 ALTER TABLE `languages_tables` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table languages_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `languages_translations`;

CREATE TABLE `languages_translations` (
  `languages_translation_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `iso_code` varchar(8) NOT NULL,
  `table` varchar(64) NOT NULL,
  `row` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `original` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`languages_translation_id`),
  KEY `table_row_iso_code` (`table`,`row`,`iso_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `news_article_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attachments_attachment_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` text NOT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `sticky` tinyint(1) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `modified_on` datetime DEFAULT NULL,
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `locked_by` int(11) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  `publish_on` datetime DEFAULT NULL,
  `unpublish_on` datetime DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`news_article_id`),
  KEY `idx_state` (`published`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `pages_page_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pages_menu_id` int(10) unsigned NOT NULL,
  `users_group_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `link_url` text,
  `link_id` int(11) unsigned DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `home` tinyint(1) NOT NULL DEFAULT '0',
  `extensions_extension_id` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(10) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`pages_page_id`),
  KEY `pages__pages_menu_id` (`pages_menu_id`),
  KEY `pages__link_id` (`link_id`),
  KEY `ix_published` (`published`),
  KEY `ix_home` (`home`),
  KEY `ix_extensions_extension_id` (`extensions_extension_id`),
  CONSTRAINT `pages__link_id` FOREIGN KEY (`link_id`) REFERENCES `pages` (`pages_page_id`) ON DELETE CASCADE,
  CONSTRAINT `pages__pages_menu_id` FOREIGN KEY (`pages_menu_id`) REFERENCES `pages_menus` (`pages_menu_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`pages_page_id`, `pages_menu_id`, `users_group_id`, `title`, `slug`, `link_url`, `link_id`, `type`, `published`, `hidden`, `home`, `extensions_extension_id`, `created_by`, `created_on`, `modified_by`, `modified_on`, `locked_by`, `locked_on`, `access`, `params`)
VALUES
	(1,1,0,'Home','home','option=com_police&view=page&layout=homepage',NULL,'component',1,1,1,41,1,NULL,NULL,NULL,NULL,NULL,0,'page_title=\"Politie Leuven\"'),
	(2,2,0,'Dashboard','dashboard','option=com_dashboard&view=dashboard',NULL,'component',1,0,0,35,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(3,2,2,'Pages','pages','option=com_pages&view=pages',NULL,'component',1,0,0,25,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(4,2,0,'Content','content',NULL,NULL,'separator',1,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(5,2,0,'Files','files','option=com_files&view=files',NULL,'component',1,0,0,19,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(6,2,0,'Users','users','option=com_users&view=users',NULL,'component',1,0,0,31,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(7,2,2,'Extensions','extensions',NULL,NULL,'separator',1,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(8,2,2,'Settings','settings','option=com_extensions&view=settings',NULL,'component',1,0,0,28,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(9,2,0,'Tools','tools',NULL,NULL,'separator',1,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(10,2,0,'Activity Logs','activity-logs','option=com_activities&view=activities',NULL,'component',1,0,0,34,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(11,2,2,'Clean Cache','clean-cache','option=com_cache&view=items',NULL,'component',1,0,0,32,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(12,2,0,'Articles','articles','option=com_articles&view=articles',NULL,'component',1,0,0,20,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(14,2,0,'Contacts','contacts','option=com_contacts&view=contacts',NULL,'component',1,0,0,7,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(15,2,2,'Languages','languages','option=com_languages&view=languages',NULL,'component',1,0,0,23,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(16,2,0,'Articles','articles','option=com_articles&view=articles',NULL,'component',1,0,0,20,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(17,2,2,'Categories','categories','option=com_articles&view=categories',NULL,'component',1,0,0,20,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(20,2,0,'Contacts','contacts','option=com_contacts&view=contacts',NULL,'component',1,0,0,7,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(21,2,2,'Categories','categories','option=com_contacts&view=categories',NULL,'component',1,0,0,7,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(22,2,2,'Languages','languages','option=com_languages&view=languages',NULL,'component',1,0,0,23,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(23,2,2,'Components','components','option=com_languages&view=components',NULL,'component',1,0,0,23,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(24,2,2,'Pages','pages','option=com_pages&view=pages',NULL,'component',1,0,0,25,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(25,2,2,'Menus','menus','option=com_pages&view=menus',NULL,'component',1,0,0,25,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(26,2,2,'Modules','modules','option=com_pages&view=modules',NULL,'component',1,0,0,25,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(27,2,0,'Users','users','option=com_users&view=users',NULL,'component',1,0,0,31,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(28,2,0,'Groups','groups','option=com_users&view=groups',NULL,'component',1,0,0,31,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(29,2,2,'Items','items','option=com_cache&view=items',NULL,'component',1,0,0,32,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(30,2,2,'Groups','groups','option=com_cache&view=groups',NULL,'component',1,0,0,32,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(31,2,2,'Terms','terms','option=com_articles&view=terms',NULL,'component',1,0,0,20,1,NULL,NULL,NULL,NULL,NULL,0,NULL),
	(32,2,0,'Questions','questions','option=com_questions&view=questions',NULL,'component',1,0,0,40,1,'2013-04-28 19:35:06',NULL,NULL,NULL,NULL,0,''),
	(33,2,0,'Questions','questions','option=com_questions&view=questions',NULL,'component',1,0,0,40,1,'2013-04-28 19:35:47',NULL,NULL,NULL,NULL,0,''),
	(34,2,0,'Categories','categories','option=com_questions&view=categories',NULL,'component',1,0,0,40,1,'2013-04-28 19:36:02',NULL,NULL,NULL,NULL,0,''),
	(36,1,0,'Vragen','vragen','option=com_questions&view=questions',NULL,'component',1,0,0,40,1,'2013-04-28 19:37:58',NULL,NULL,NULL,NULL,0,'page_title=\"Veelgestelde vragen\"'),
	(37,1,0,'Nieuws','nieuws','option=com_news&view=articles',NULL,'component',1,0,0,38,1,'2013-04-28 19:41:46',NULL,NULL,NULL,NULL,0,'page_title=\"\"'),
	(39,1,0,'Verkeer','verkeer','option=com_traffic&view=categories',NULL,'component',1,0,0,37,1,'2013-04-28 19:44:21',NULL,NULL,NULL,NULL,0,'show_create_date=\"0\"\nshow_modify_date=\"0\"\npage_title=\"\"'),
	(40,1,0,'Over ons','over-ons','option=com_about&view=categories',NULL,'component',1,0,0,43,1,'2013-04-28 19:50:18',NULL,NULL,NULL,NULL,0,'show_create_date=\"0\"\nshow_modify_date=\"0\"\npage_title=\"\"'),
	(41,1,0,'Contact','contact','option=com_contacts&view=categories',NULL,'component',1,0,0,20,1,'2013-04-28 19:50:47',NULL,NULL,NULL,NULL,0,'page_title=\"\"'),
	(42,1,0,'Commissariaten','commissariaten','option=com_contacts&view=contacts&category=1',NULL,'component',1,0,0,7,1,'2013-04-28 19:52:30',NULL,NULL,NULL,NULL,0,'page_title=\"\"'),
	(43,1,0,'Je wijkinspecteur','je-wijkinspecteur','option=com_districts&view=relations',NULL,'component',1,0,0,36,1,'2013-04-28 19:52:41',NULL,NULL,NULL,NULL,0,'page_title=\"\"'),
	(44,1,0,'Diensten','diensten','option=com_contacts&view=contacts&category=2',NULL,'component',1,0,0,7,1,'2013-04-28 19:52:53',NULL,NULL,NULL,NULL,0,'page_title=\"\"'),
	(45,2,0,'News','news','option=com_news&view=articles',NULL,'component',1,0,0,38,1,'2013-04-28 20:05:02',NULL,NULL,NULL,NULL,0,''),
	(47,2,0,'Traffic','traffic','option=com_traffic&view=articles',NULL,'component',1,0,0,37,1,'2013-05-11 15:29:00',NULL,NULL,NULL,NULL,0,'articles_per_page=\"10\"'),
	(53,2,0,'Districts','districts','option=com_districts&view=districts',NULL,'component',1,0,0,36,1,'2013-05-12 14:37:42',NULL,NULL,NULL,NULL,0,''),
	(54,2,0,'Districts','districts','option=com_districts&view=districts',NULL,'component',1,0,0,36,1,'2013-05-12 14:37:52',NULL,NULL,NULL,NULL,0,''),
	(55,2,0,'Officers','officers','option=com_districts&view=officers',NULL,'component',1,0,0,36,1,'2013-05-12 14:38:01',NULL,NULL,NULL,NULL,0,''),
	(56,2,0,'Relations','relations','option=com_districts&view=relations',NULL,'component',1,0,0,36,1,'2013-05-12 14:38:14',NULL,NULL,NULL,NULL,0,''),
	(57,2,0,'Streets','streets','option=com_streets&view=streets',NULL,'component',1,0,0,39,1,'2013-05-12 14:38:41',NULL,NULL,NULL,NULL,0,''),
	(66,1,0,'Noodnummers','noodnummers','option=com_contacts&view=contacts&category=18',NULL,'component',1,0,0,7,1,'2013-05-13 14:28:47',NULL,NULL,NULL,NULL,0,'page_title=\"\"'),
	(89,1,0,'Downloads','downloads','option=com_files&view=directory&folder=downloads&layout=table',NULL,'component',1,1,0,19,1,'2013-05-17 12:50:26',NULL,NULL,NULL,NULL,0,'show_folders=\"1\"\nhumanize_filenames=\"1\"\nlimit=\"-1\"\nsort=\"name\"\ndirection=\"asc\"\npage_title=\"\"'),
	(92,2,0,'Support','support','option=com_zendesk&view=zendesks',NULL,'component',1,0,0,42,1,'2013-09-25 13:36:11',NULL,NULL,NULL,NULL,0,''),
	(93,2,0,'About us','about-us','option=com_about&view=articles',NULL,'component',1,0,0,43,1,'2013-10-03 14:41:43',NULL,NULL,NULL,NULL,0,''),
	(94,2,0,'Articles','articles','option=com_about&view=articles',NULL,'component',1,0,0,43,1,'2013-10-03 14:42:47',NULL,NULL,NULL,NULL,0,''),
	(95,2,0,'Categories','categories','option=com_about&view=categories',NULL,'component',1,0,0,43,1,'2013-10-03 14:42:55',NULL,NULL,NULL,NULL,0,'');

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages_closures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages_closures`;

CREATE TABLE `pages_closures` (
  `ancestor_id` int(11) unsigned NOT NULL,
  `descendant_id` int(11) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ancestor_id`,`descendant_id`),
  KEY `ix_level` (`level`),
  KEY `ix_descendant_id` (`descendant_id`),
  CONSTRAINT `pages_closures__ancestor_id` FOREIGN KEY (`ancestor_id`) REFERENCES `pages` (`pages_page_id`) ON DELETE CASCADE,
  CONSTRAINT `pages_closures__descendant_id` FOREIGN KEY (`descendant_id`) REFERENCES `pages` (`pages_page_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pages_closures` WRITE;
/*!40000 ALTER TABLE `pages_closures` DISABLE KEYS */;

INSERT INTO `pages_closures` (`ancestor_id`, `descendant_id`, `level`)
VALUES
	(1,1,0),
	(2,2,0),
	(3,3,0),
	(4,4,0),
	(5,5,0),
	(6,6,0),
	(7,7,0),
	(8,8,0),
	(9,9,0),
	(10,10,0),
	(11,11,0),
	(12,12,0),
	(14,14,0),
	(15,15,0),
	(16,16,0),
	(17,17,0),
	(20,20,0),
	(21,21,0),
	(22,22,0),
	(23,23,0),
	(24,24,0),
	(25,25,0),
	(26,26,0),
	(27,27,0),
	(28,28,0),
	(29,29,0),
	(30,30,0),
	(31,31,0),
	(32,32,0),
	(33,33,0),
	(34,34,0),
	(36,36,0),
	(37,37,0),
	(39,39,0),
	(40,40,0),
	(41,41,0),
	(42,42,0),
	(43,43,0),
	(44,44,0),
	(45,45,0),
	(47,47,0),
	(53,53,0),
	(54,54,0),
	(55,55,0),
	(56,56,0),
	(57,57,0),
	(66,66,0),
	(89,89,0),
	(92,92,0),
	(93,93,0),
	(94,94,0),
	(95,95,0),
	(3,24,1),
	(3,25,1),
	(3,26,1),
	(4,12,1),
	(4,14,1),
	(4,15,1),
	(4,32,1),
	(4,45,1),
	(4,47,1),
	(4,53,1),
	(4,57,1),
	(4,93,1),
	(6,27,1),
	(6,28,1),
	(7,8,1),
	(9,10,1),
	(9,11,1),
	(11,29,1),
	(11,30,1),
	(12,16,1),
	(12,17,1),
	(12,31,1),
	(14,20,1),
	(14,21,1),
	(15,22,1),
	(15,23,1),
	(32,33,1),
	(32,34,1),
	(41,42,1),
	(41,43,1),
	(41,44,1),
	(41,66,1),
	(53,54,1),
	(53,55,1),
	(53,56,1),
	(93,94,1),
	(93,95,1),
	(4,16,2),
	(4,17,2),
	(4,20,2),
	(4,21,2),
	(4,22,2),
	(4,23,2),
	(4,31,2),
	(4,33,2),
	(4,34,2),
	(4,54,2),
	(4,55,2),
	(4,56,2),
	(4,94,2),
	(4,95,2),
	(9,29,2),
	(9,30,2);

/*!40000 ALTER TABLE `pages_closures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages_menus`;

CREATE TABLE `pages_menus` (
  `pages_menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `application` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(10) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  PRIMARY KEY (`pages_menu_id`),
  KEY `ix_application` (`application`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pages_menus` WRITE;
/*!40000 ALTER TABLE `pages_menus` DISABLE KEYS */;

INSERT INTO `pages_menus` (`pages_menu_id`, `application`, `title`, `slug`, `description`, `created_by`, `created_on`, `modified_by`, `modified_on`, `locked_by`, `locked_on`)
VALUES
	(1,'site','Main Menu','mainmenu','The main menu for the site',1,NULL,NULL,NULL,NULL,NULL),
	(2,'admin','Menubar','menubar','1',1,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `pages_menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages_modules`;

CREATE TABLE `pages_modules` (
  `pages_module_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(10) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `extensions_extension_id` int(11) unsigned NOT NULL,
  `application` varchar(50) NOT NULL,
  PRIMARY KEY (`pages_module_id`),
  KEY `published` (`published`,`access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pages_modules` WRITE;
/*!40000 ALTER TABLE `pages_modules` DISABLE KEYS */;

INSERT INTO `pages_modules` (`pages_module_id`, `title`, `content`, `ordering`, `position`, `created_by`, `created_on`, `modified_by`, `modified_on`, `locked_by`, `locked_on`, `published`, `name`, `access`, `params`, `extensions_extension_id`, `application`)
VALUES
	(1,'Main Menu','',2,'navigation',1,NULL,1,'2013-04-28 19:51:32',NULL,NULL,1,'mod_menu',0,'menu_id=\"1\"\nshow_title=\"0\"\nstart_level=\"0\"\nend_level=\"1\"\nshow_children=\"never\"\nclass=\"nav\"\ncache=\"1\"',25,'site'),
	(2,'Left Menu','',1,'left',NULL,NULL,62,'2013-04-18 17:05:29',1,'2013-08-02 19:37:11',1,'mod_menu',0,'menu_id=\"1\"\nshow_title=\"0\"\nstart_level=\"2\"\nend_level=\"0\"\nshow_children=\"active\"\nclass=\"nav nav-tabs nav-stacked\"\ncache=\"0\"',25,'site'),
	(4,'Breadcrumbs','',1,'breadcrumbs',1,'2013-05-07 13:17:47',NULL,NULL,0,'0000-00-00 00:00:00',1,'mod_breadcrumbs',0,'showHome=1\nhomeText=Home\nshowLast=1',25,'site');

/*!40000 ALTER TABLE `pages_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages_modules_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages_modules_pages`;

CREATE TABLE `pages_modules_pages` (
  `pages_module_id` int(11) unsigned NOT NULL,
  `pages_page_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`pages_module_id`,`pages_page_id`),
  KEY `pages_modules_pages__pages_page_id` (`pages_page_id`),
  CONSTRAINT `pages_modules_pages__pages_module_id` FOREIGN KEY (`pages_module_id`) REFERENCES `pages_modules` (`pages_module_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pages_modules_pages__pages_page_id` FOREIGN KEY (`pages_page_id`) REFERENCES `pages` (`pages_page_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pages_modules_pages` WRITE;
/*!40000 ALTER TABLE `pages_modules_pages` DISABLE KEYS */;

INSERT INTO `pages_modules_pages` (`pages_module_id`, `pages_page_id`)
VALUES
	(1,0),
	(2,39),
	(2,40),
	(2,41),
	(2,42),
	(2,43),
	(2,44),
	(2,66),
	(4,0);

/*!40000 ALTER TABLE `pages_modules_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages_orderings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages_orderings`;

CREATE TABLE `pages_orderings` (
  `pages_page_id` int(11) unsigned NOT NULL,
  `title` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000',
  `custom` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000',
  PRIMARY KEY (`pages_page_id`),
  KEY `ix_title` (`title`),
  KEY `ix_custom` (`custom`),
  CONSTRAINT `pages_orderings__pages_page_id` FOREIGN KEY (`pages_page_id`) REFERENCES `pages` (`pages_page_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pages_orderings` WRITE;
/*!40000 ALTER TABLE `pages_orderings` DISABLE KEYS */;

INSERT INTO `pages_orderings` (`pages_page_id`, `title`, `custom`)
VALUES
	(1,00000000003,00000000001),
	(2,00000000002,00000000001),
	(3,00000000005,00000000002),
	(4,00000000001,00000000003),
	(5,00000000004,00000000004),
	(6,00000000008,00000000005),
	(7,00000000003,00000000006),
	(8,00000000001,00000000001),
	(9,00000000007,00000000008),
	(10,00000000001,00000000001),
	(11,00000000002,00000000002),
	(12,00000000002,00000000001),
	(14,00000000003,00000000003),
	(15,00000000005,00000000004),
	(16,00000000001,00000000001),
	(17,00000000002,00000000001),
	(20,00000000002,00000000001),
	(21,00000000001,00000000002),
	(22,00000000002,00000000001),
	(23,00000000001,00000000002),
	(24,00000000003,00000000001),
	(25,00000000001,00000000002),
	(26,00000000002,00000000003),
	(27,00000000002,00000000001),
	(28,00000000001,00000000002),
	(29,00000000002,00000000001),
	(30,00000000001,00000000002),
	(31,00000000003,00000000002),
	(32,00000000007,00000000005),
	(33,00000000001,00000000002),
	(34,00000000002,00000000003),
	(36,00000000006,00000000004),
	(37,00000000004,00000000002),
	(39,00000000005,00000000005),
	(40,00000000002,00000000006),
	(41,00000000002,00000000007),
	(42,00000000001,00000000002),
	(43,00000000003,00000000001),
	(44,00000000002,00000000003),
	(45,00000000006,00000000006),
	(47,00000000009,00000000007),
	(53,00000000004,00000000008),
	(54,00000000001,00000000001),
	(55,00000000002,00000000002),
	(56,00000000003,00000000003),
	(57,00000000008,00000000009),
	(66,00000000004,00000000004),
	(89,00000000001,00000000008),
	(92,00000000006,00000000007),
	(93,00000000001,00000000010),
	(94,00000000001,00000000001),
	(95,00000000002,00000000002);

/*!40000 ALTER TABLE `pages_orderings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `questions_question_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `categories_category_id` int(11) NOT NULL DEFAULT '0',
  `attachments_attachment_id` int(11) unsigned NOT NULL DEFAULT '0',
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
  `ordering` int(11) DEFAULT '0',
  `params` text,
  PRIMARY KEY (`questions_question_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table revisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `revisions`;

CREATE TABLE `revisions` (
  `table` varchar(64) NOT NULL,
  `row` bigint(20) unsigned NOT NULL,
  `revision` bigint(20) unsigned NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `data` longtext NOT NULL COMMENT '@Filter("json")',
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`table`,`row`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `tags_tag_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `table` varchar(50) NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(10) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`tags_tag_id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `title` (`title`),
  KEY `table` (`table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tags_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags_relations`;

CREATE TABLE `tags_relations` (
  `tags_tag_id` bigint(20) unsigned NOT NULL,
  `row` bigint(20) unsigned NOT NULL,
  `table` varchar(255) NOT NULL,
  PRIMARY KEY (`tags_tag_id`,`row`,`table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table traffic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `traffic`;

CREATE TABLE `traffic` (
  `traffic_article_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `categories_category_id` int(11) DEFAULT NULL,
  `title` varchar(250) NOT NULL DEFAULT '',
  `slug` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  `start_on` datetime DEFAULT NULL,
  `end_on` datetime DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(11) DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  PRIMARY KEY (`traffic_article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table traffic_streets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `traffic_streets`;

CREATE TABLE `traffic_streets` (
  `streets_street_id` int(11) unsigned NOT NULL,
  `traffic_article_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`streets_street_id`,`traffic_article_id`),
  KEY `traffic_streets__traffic_article_id` (`traffic_article_id`),
  CONSTRAINT `traffic_streets__traffic_article_id` FOREIGN KEY (`traffic_article_id`) REFERENCES `traffic` (`traffic_article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relations table for streets';



# Dump of table trafficinfo_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trafficinfo_categories`;

CREATE TABLE `trafficinfo_categories` (
  `trafficinfo_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(10) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  PRIMARY KEY (`trafficinfo_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table trafficinfo_events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trafficinfo_events`;

CREATE TABLE `trafficinfo_events` (
  `trafficinfo_event_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `trafficinfo_category_id` int(11) DEFAULT NULL,
  `trafficinfo_item_id_incident` int(11) DEFAULT NULL,
  `trafficinfo_item_id_place` int(11) DEFAULT NULL,
  `trafficinfo_item_id_place_direction` int(11) DEFAULT NULL,
  `trafficinfo_item_id_place_end` int(11) DEFAULT NULL,
  `trafficinfo_item_id_road` int(11) DEFAULT NULL,
  `trafficinfo_item_id_road_bis` int(11) DEFAULT NULL,
  `trafficinfo_item_id_situation` int(11) DEFAULT NULL,
  `trafficinfo_item_id_source` int(11) DEFAULT NULL,
  `trafficinfo_item_id_traffic` int(11) DEFAULT NULL,
  `title` varchar(250) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `information` text NOT NULL,
  `densities` text,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`trafficinfo_event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table trafficinfo_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trafficinfo_items`;

CREATE TABLE `trafficinfo_items` (
  `trafficinfo_item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group` enum('incident','situation','traffic','source','roads','places','text') NOT NULL DEFAULT 'incident',
  `title` varchar(250) NOT NULL DEFAULT '',
  `title_fr` varchar(250) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`trafficinfo_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table uploads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `uploads`;

CREATE TABLE `uploads` (
  `uploads_upload_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uploads_upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `users_user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `send_email` tinyint(1) DEFAULT '0',
  `users_role_id` int(11) unsigned NOT NULL DEFAULT '18',
  `last_visited_on` datetime DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(10) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `uuid` char(36) NOT NULL,
  PRIMARY KEY (`users_user_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `email` (`email`),
  KEY `users_role_id` (`users_role_id`),
  CONSTRAINT `users_user_role` FOREIGN KEY (`users_role_id`) REFERENCES `users_roles` (`users_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`users_user_id`, `name`, `email`, `enabled`, `send_email`, `users_role_id`, `last_visited_on`, `created_by`, `created_on`, `modified_by`, `modified_on`, `locked_by`, `locked_on`, `activation`, `params`, `uuid`)
VALUES
	(1,'Administrator','admin@localhost.home',1,1,25,'2013-11-05 14:23:08',NULL,NULL,1,'2013-11-05 14:23:08',NULL,NULL,'','timezone=\n\n','3b8abc10-b038-11e2-9296-102175e93138');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `users_group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`users_group_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;

INSERT INTO `users_groups` (`users_group_id`, `name`, `description`)
VALUES
	(1,'Webmasters',''),
	(2,'Super Administrators','');

/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_groups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_groups_users`;

CREATE TABLE `users_groups_users` (
  `users_group_id` int(11) unsigned NOT NULL,
  `users_user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`users_group_id`,`users_user_id`),
  KEY `users_groups_users__users_user_id` (`users_user_id`),
  CONSTRAINT `users_groups_users__users_group_id` FOREIGN KEY (`users_group_id`) REFERENCES `users_groups` (`users_group_id`) ON DELETE CASCADE,
  CONSTRAINT `users_groups_users__users_user_id` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`users_user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users_groups_users` WRITE;
/*!40000 ALTER TABLE `users_groups_users` DISABLE KEYS */;

INSERT INTO `users_groups_users` (`users_group_id`, `users_user_id`)
VALUES
	(2,1);

/*!40000 ALTER TABLE `users_groups_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_passwords
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_passwords`;

CREATE TABLE `users_passwords` (
  `email` varchar(100) NOT NULL DEFAULT '',
  `expiration` date DEFAULT NULL,
  `hash` varchar(100) NOT NULL DEFAULT '',
  `reset` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`email`),
  CONSTRAINT `users_password__email` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users_passwords` WRITE;
/*!40000 ALTER TABLE `users_passwords` DISABLE KEYS */;

INSERT INTO `users_passwords` (`email`, `expiration`, `hash`, `reset`)
VALUES
	('admin@localhost.home',NULL,'$2y$10$UT7uLipGnbJbTcjZ6D.OAeVByFn.2ZpPmd.thZ5e5xHLwKXAxdvNG','');

/*!40000 ALTER TABLE `users_passwords` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_roles`;

CREATE TABLE `users_roles` (
  `users_role_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`users_role_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;

INSERT INTO `users_roles` (`users_role_id`, `name`, `description`)
VALUES
	(18,'Registered',''),
	(19,'Author',''),
	(20,'Editor',''),
	(21,'Publisher',''),
	(23,'Manager',''),
	(24,'Administrator',''),
	(25,'Super Administrator','');

/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_sessions`;

CREATE TABLE `users_sessions` (
  `time` varchar(14) DEFAULT '',
  `users_session_id` varchar(128) NOT NULL,
  `guest` tinyint(4) DEFAULT '1',
  `email` varchar(100) NOT NULL COMMENT '@Filter("email")',
  `application` varchar(50) NOT NULL,
  `data` longtext,
  PRIMARY KEY (`users_session_id`(64)),
  KEY `whosonline` (`guest`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


# Create data database
# ------------------------------------------------------------

DROP DATABASE IF EXISTS `data`;

CREATE DATABASE `data`;


DROP TABLE IF EXISTS `data`.`police_municipalities`;

-- Create syntax for TABLE 'police_municipalities'
CREATE TABLE `data`.`police_municipalities` (
  `police_municipality_id` int(20) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `police_zone_id` int(11) NOT NULL DEFAULT '0',
  `postcode` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `iso_code` varchar(250) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`police_municipality_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2775 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `data`.`police_zones`;

-- Create syntax for TABLE 'police_zones'
CREATE TABLE `data`.`police_zones` (
  `police_zone_id` int(11) unsigned NOT NULL,
  `title` varchar(250) NOT NULL DEFAULT '',
  `language` int(11) NOT NULL,
  `phone_emergency` varchar(250) DEFAULT NULL,
  `phone_information` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `chief_name` varchar(250) NOT NULL,
  `chief_email` varchar(250) NOT NULL,
  `twitter` varchar(250) DEFAULT NULL,
  `facebook` varchar(250) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`police_zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `data`.`streets`;

-- Create syntax for TABLE 'streets'
CREATE TABLE `data`.`streets` (
  `streets_street_id` int(11) unsigned NOT NULL,
  `streets_city_id` int(5) DEFAULT NULL,
  `title` varchar(80) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title2` varchar(80) DEFAULT NULL,
  `language1` varchar(2) DEFAULT NULL,
  `language2` varchar(2) DEFAULT NULL,
  `language3` varchar(2) DEFAULT NULL,
  `title0` varchar(80) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(11) DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  PRIMARY KEY (`streets_street_id`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `data`.`streets_cities`;

-- Create syntax for TABLE 'streets_cities'
CREATE TABLE `data`.`streets_cities` (
  `streets_city_id` int(11) unsigned NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `language` varchar(2) DEFAULT NULL,
  `police_zone_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`streets_city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# Dump of table users_groups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lost_brands`;

CREATE TABLE `lost_brands` (
  `lost_brand_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(11) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  PRIMARY KEY (`lost_brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# Dump of table lost_brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lost_brands`;

CREATE TABLE `lost_objects` (
  `lost_object_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `categories_category_id` int(11) DEFAULT NULL,
  `lost_brand_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `text` mediumtext NOT NULL,
  `reference` varchar(250) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(11) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  PRIMARY KEY (`lost_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;