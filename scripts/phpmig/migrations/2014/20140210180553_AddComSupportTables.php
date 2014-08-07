<?php

use MyPhpmig\Police\Migration;

class AddComSupportTables extends Migration
{
    /**
     * Do the migration
     */
    public function up()
    {
        $zones = $this->getZones()->get();

        // Target `data` database
        $this->getZones()->set(array('data' => 'Data'));

        $this->_queries = "CREATE TABLE `support_announcements` (
                          `support_announcement_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                          `title` varchar(255) NOT NULL,
                          `slug` varchar(255) DEFAULT NULL,
                          `text` text NOT NULL,
                          `published` tinyint(1) NOT NULL DEFAULT '1',
                          `created_by` int(10) unsigned DEFAULT NULL,
                          `created_on` datetime DEFAULT NULL,
                          `modified_by` int(10) unsigned DEFAULT NULL,
                          `modified_on` datetime DEFAULT NULL,
                          `locked_by` int(11) DEFAULT NULL,
                          `locked_on` datetime DEFAULT NULL,
                          PRIMARY KEY (`support_announcement_id`),
                          KEY `idx_enabled` (`published`),
                          KEY `created_on` (`created_on`)
                        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;";

        parent::up();

        // Target all zones databases
        $this->getZones()->set($zones);

        $this->_queries = "CREATE TABLE `support_tickets` (
                          `support_ticket_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                          `title` varchar(255) NOT NULL,
                          `slug` varchar(255) DEFAULT NULL,
                          `text` text NOT NULL,
                          `status` varchar(25) DEFAULT 'new',
                          `created_by` int(10) unsigned DEFAULT NULL,
                          `created_on` datetime DEFAULT NULL,
                          `modified_by` int(10) unsigned DEFAULT NULL,
                          `modified_on` datetime DEFAULT NULL,
                          `locked_by` int(11) DEFAULT NULL,
                          `locked_on` datetime DEFAULT NULL,
                          `last_commented_by` int(11) DEFAULT NULL,
                          `last_commented_on` datetime DEFAULT NULL,
                          PRIMARY KEY (`support_ticket_id`),
                          KEY `created_on` (`created_on`)
                        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;";

        $this->_queries .= "CREATE VIEW `support_announcements` AS SELECT * FROM `data`.`support_announcements`;";

        parent::up();
    }

    /**
     * Undo the migration
     */
    public function down()
    {
        $this->_queries = "DROP VIEW IF EXISTS `support_announcements`;";
        $this->_queries .= "DROP TABLE IF EXISTS `support_tickets`;";

        parent::down();

        // Target `data` database
        $this->getZones()->set(array('data' => 'data'));

        $this->_queries = "DROP TABLE IF EXISTS `support_announcements`;";

        parent::down();
    }
}
