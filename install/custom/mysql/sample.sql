SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
SET @OLD_TIME_ZONE=@@TIME_ZONE, TIME_ZONE='+00:00';
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;


--
-- Dumping sample data for table `news`
--

INSERT INTO `news` (`news_article_id`, `attachments_attachment_id`, `title`, `slug`, `introtext`, `fulltext`, `sticky`, `published`, `created_on`, `created_by`, `modified_on`, `modified_by`, `locked_by`, `locked_on`, `publish_on`, `unpublish_on`, `params`)
VALUES
	(1, 0, 'Sit Mattis Cursus', 'sit-mattis-cursus', '<p>Nullam id dolor id nibh ultricies vehicula ut id elit. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Donec id elit non mi porta gravida at eget metus.</p>\r\n\r\n<p>Donec ullamcorper nulla non metus auctor fringilla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu leo quam.</p>', '<p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Donec id elit non mi porta gravida at eget metus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\r\n\r\n<p>Curabitur blandit tempus porttitor. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Vestibulum id ligula porta felis euismod semper.</p>', NULL, 1, '2014-01-31 13:07:00', 1, NULL, 0, NULL, NULL, '2014-01-31 13:08:09', NULL, NULL),
	(2, 0, 'Fermentum Purus Cursus Consectetur', 'fermentum-purus-cursus-consectetur', '<p>Curabitur blandit tempus porttitor. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Sed posuere consectetur est at lobortis. Maecenas sed diam eget risus varius blandit sit amet non magna.</p>', '<p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.</p>\r\n\r\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Maecenas sed diam eget risus varius blandit sit amet non magna. Nullam id dolor id nibh ultricies vehicula ut id elit. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis.</p>', NULL, 1, '2014-01-31 13:08:00', 1, NULL, 0, NULL, NULL, '2014-01-31 13:08:26', NULL, NULL),
	(3, 0, 'Condimentum Commodo', 'condimentum-commodo', '<p>Curabitur blandit tempus porttitor. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Curabitur blandit tempus porttitor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sed odio dui.</p>', '<p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum. Nulla vitae elit libero, a pharetra augue.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dolor id nibh ultricies vehicula ut id elit. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur blandit tempus porttitor.</p>', NULL, 1, '2014-01-31 13:09:00', 1, NULL, 0, NULL, NULL, '2014-01-31 13:08:41', NULL, NULL),
	(4, 0, 'Risus Quam Egestas', 'risus-quam-egestas', '<p>Nullam id dolor id nibh ultricies vehicula ut id elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis risus eget urna mollis ornare vel eu leo. Etiam porta sem malesuada magna mollis euismod. Curabitur blandit tempus porttitor.</p>\r\n\r\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur.</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id elit non mi porta gravida at eget metus.</p>\r\n\r\n<p>Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis. Maecenas faucibus mollis interdum. Maecenas sed diam eget risus varius blandit sit amet non magna. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>', NULL, 1, '2014-01-31 13:10:00', 1, NULL, 0, NULL, NULL, '2014-01-31 13:08:58', NULL, NULL);


--
-- Dumping sample data for table `questions`
--

INSERT INTO `questions` (`questions_question_id`, `questions_category_id`, `attachments_attachment_id`, `title`, `slug`, `text`, `published`, `created_by`, `created_on`, `modified_by`, `modified_on`, `locked_by`, `locked_on`, `ordering`, `params`)
VALUES
	(1, 2, 0, 'Euismod Sollicitudin Magna Nibh', 'euismod-sollicitudin-magna-nibh', '<p>Donec id elit non mi porta gravida at eget metus. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna. Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\r\n\r\n<p>Nulla vitae elit libero, a pharetra augue. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n', 1, 1, '2014-01-31 13:13:42', NULL, NULL, NULL, NULL, 0, NULL),
	(2, 2, 0, 'Amet Mollis Malesuada', 'amet-mollis-malesuada', '<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Maecenas sed diam eget risus varius blandit sit amet non magna. Etiam porta sem malesuada magna mollis euismod. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Aenean lacinia bibendum nulla sed consectetur.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed posuere consectetur est at lobortis. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>\r\n', 1, 1, '2014-01-31 13:13:54', NULL, NULL, NULL, NULL, 0, NULL),
	(3, 1, 0, 'Sollicitudin Ipsum Justo Quam', 'sollicitudin-ipsum-justo-quam', '<p>Sed posuere consectetur est at lobortis. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Maecenas faucibus mollis interdum. Maecenas faucibus mollis interdum. Nulla vitae elit libero, a pharetra augue.</p>\r\n\r\n<p>Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum. Curabitur blandit tempus porttitor. Donec id elit non mi porta gravida at eget metus.</p>\r\n', 1, 1, '2014-01-31 13:14:12', NULL, NULL, NULL, NULL, 0, NULL);


INSERT INTO `questions_categories` (`questions_category_id`, `parent_id`, `attachments_attachment_id`, `title`, `slug`, `image`, `description`, `published`, `created_by`, `created_on`, `modified_by`, `modified_on`, `locked_by`, `locked_on`, `ordering`, `access`, `params`)
VALUES
	(1, 0, 0, 'Ornare', 'ornare', '', '', 1, 1, '2014-01-31 13:13:20', NULL, NULL, NULL, NULL, 1, 0, ''),
	(2, 0, 0, 'Mollis', 'mollis', '', '', 1, 1, '2014-01-31 13:13:26', NULL, NULL, NULL, NULL, 2, 0, '');

--
-- Dumping sample data for table `support_tickets`
--

INSERT INTO `support_tickets` (`support_ticket_id`, `title`, `slug`, `text`, `status`, `created_by`, `created_on`, `modified_by`, `modified_on`, `locked_by`, `locked_on`)
VALUES
	(1, 'Risus Ipsum', 'risus-ipsum', '<p>Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Vestibulum id ligula porta felis euismod semper. Curabitur blandit tempus porttitor. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\r\n', 'open', 1, '2014-02-06 12:13:20', 1, '2014-02-07 14:57:25', 1, '2014-02-07 15:26:00'),
	(2, 'Sit Ligula', 'sit-ligula', '<p>Etiam porta sem malesuada magna mollis euismod. Maecenas faucibus mollis interdum. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Aenean lacinia bibendum nulla sed consectetur. Maecenas sed diam eget risus varius blandit sit amet non magna.</p>\r\n', 'solved', 1, '2014-02-06 12:13:20', NULL, NULL, 1, '2014-02-07 11:11:12'),
	(3, 'Pharetra Euismod Magna', 'pharetra-euismod-magna', '<p>Maecenas faucibus mollis interdum. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Etiam porta sem malesuada magna mollis euismod. Vestibulum id ligula porta felis euismod semper.</p>\r\n', 'pending', 1, '2014-02-06 12:13:20', NULL, NULL, 1, '2014-02-07 08:27:09'),
	(4, 'Nullam Vestibulum Pharetra', 'nullam-vestibulum-pharetra', '<p>Sed posuere consectetur est at lobortis. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur blandit tempus porttitor. Aenean lacinia bibendum nulla sed consectetur. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.</p>\r\n', 'new', 1, '2014-02-06 12:13:20', NULL, NULL, 1, '2014-02-07 14:19:57');


--
-- Update creation date to today (this very moment)
--
UPDATE `news` SET `created_on` = now();
UPDATE `questions` SET `created_on` = now();
UPDATE `questions_categories` SET `created_on` = now();
UPDATE `support_tickets` SET `created_on` = now();


SET SQL_MODE=@OLD_SQL_MODE;
SET TIME_ZONE=@OLD_TIME_ZONE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;