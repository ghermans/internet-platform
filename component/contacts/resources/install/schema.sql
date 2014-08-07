
-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contacts_contact_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_by` int(11) unsigned,
  `created_on` datetime,
  `modified_by` int(11) unsigned,
  `modified_on` datetime,
  `locked_by` int(11) unsigned,
  `locked_on` datetime,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `categories_category_id` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`contacts_contact_id`),
  KEY `category` (`categories_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `contacts_hours`
--

CREATE TABLE `contacts_hours` (
  `contacts_hour_id` int(11) NOT NULL AUTO_INCREMENT,
  `contacts_contact_id` int(11) NOT NULL DEFAULT '0',
  `day_of_week` tinyint(4) DEFAULT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `published` tinyint(1) DEFAULT '0',
  `created_by` int(11) unsigned DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locked_by` int(11) unsigned DEFAULT NULL,
  `locked_on` datetime DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`contacts_hour_id`),
  KEY `published` (`published`),
  KEY `contacts_hours__contacts_contact_id` (`contacts_contact_id`),
  CONSTRAINT `contacts_hours__contacts_contact_id` FOREIGN KEY (`contacts_contact_id`) REFERENCES `contacts` (`contacts_contact_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;