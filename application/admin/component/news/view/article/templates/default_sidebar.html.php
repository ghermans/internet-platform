<?
/**
 * Belgian Police Web Platform - News Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */
?>

<fieldset>
    <legend><?= translate('Publish') ?></legend>
    <div>
        <label for="published"><?= translate('Published') ?></label>
        <div>
            <input type="checkbox" name="published" value="1" <?= $article->published ? 'checked="checked"' : '' ?> />
        </div>
    </div>
    <div>
        <label for="published"><?= translate('Sticky') ?></label>
        <div>
            <input type="checkbox" name="sticky" value="1" <?= $article->sticky ? 'checked="checked"' : '' ?> />
        </div>
    </div>
    <div>
        <label for="created_on"><?= translate('Created on') ?></label>
        <div class="controls">
            <input id="created_on" type="text" name="created_on" value="<?= helper('date.format', array('date'=> $article->ordering_date, 'format' => 'd-m-Y H:i')) ?>" />
            <script data-inline> $jQuery("#created_on").datetimepicker({format:'d-m-Y H:i', lang: '<?= $this->getObject('application.languages')->getActive()->slug; ?>', dayOfWeekStart: '1'}); </script>
        </div>
    </div>
</fieldset>

<? if($article->isAttachable()) : ?>
    <fieldset>
        <legend><?= translate('Attachments') ?></legend>
        <? if (!$article->isNew()) : ?>
            <?= import('com:attachments.view.attachments.list.html', array('attachments' => $article->getAttachments(), 'attachments_attachment_id' => $article->attachments_attachment_id)) ?>
        <? endif ?>
        <?= import('com:attachments.view.attachments.upload.html') ?>
    </fieldset>
<? endif ?>