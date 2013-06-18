<?
/**
 * Belgian Police Web Platform - Streets Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		http://www.police.be
 */
?>

<h3><?= @text('Municipality')?></h3>
<?= @template('com:police.view.municipalities.list.html', array('municipalities' => @object('com:police.model.municipalities')->sort('title')->zone('5388')->getRowset())); ?>