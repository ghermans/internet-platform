<?
/**
 * Nooku Framework - http://www.nooku.org
 *
 * @copyright	Copyright (C) 2011 - 2013 Johan Janssens and Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		git://git.assembla.com/nooku-framework.git for the canonical source repository
 */
?>

<?= helper('behavior.mootools') ?>
<?= helper('behavior.modal') ?>

<? $list = (isset($row) && isset($table)) ? $attachments->find(array('row' => $row, 'table' => $table)) : $attachments ?>

<? if(count($list)) : ?>
    <ul class="thumbnails">
        <? foreach($list as $item) : ?>
            <? if($item->file->isImage() && !in_array($item->id, Nooku\Library\ObjectConfig::unbox($exclude))) : ?>
                <li class="thumbnails__item">
                    <a onClick="_gaq.push(['_trackEvent', 'Attachments', 'Modalbox', 'Image']);" class="thumbnail modal" href="attachments://<?= $item->path; ?>" rel="{handler: 'image'}">
                        <img width="640px" src="attachments://<?= $item->thumbnail ?>" />
                    </a>
                </li>
            <? endif ?>
        <? endforeach ?>
    </ul>

    <ul>
        <? foreach($list as $item) : ?>
            <? if(!$item->file->isImage()) : ?>
                <li><a onClick="_gaq.push(['_trackEvent', 'Attachments', 'Download', '<?=escape($item->name)?>']);" href="attachments://<?= $item->path; ?>"><?= escape($item->name) ?></a> (<?= helper('com:files.filesize.humanize', array('size' => $item->file->size));?>, <?= $item->file->extension ?>)</li>
            <? endif ?>
        <? endforeach ?>
    </ul>
<? endif ?>