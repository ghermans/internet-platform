<?
/**
 * Nooku Framework - http://www.nooku.org
 *
 * @copyright	Copyright (C) 2011 - 2013 Johan Janssens and Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		git://git.assembla.com/nooku-framework.git for the canonical source repository
 */
?>

<? if(!$contact->contacts_category_id) : ?>
    <script>
        // Set default value for categories radiolist
        $jQuery(document).ready(
            function(){
                $jQuery('fieldset[name=contacts_category_id] label:first-of-type input:radio').prop('checked', true);
            }
        );
    </script>
<? endif ?>

<fieldset>
    <legend><?= translate('Publish'); ?></legend>
    <div>
        <label for="published"><?= translate( 'Published' ); ?></label>
        <div>
            <input type="checkbox" name="published" value="1" <?= $contact->published ? 'checked="checked"' : '' ?> />
        </div>
    </div>
</fieldset>

<fieldset>
    <legend><?= translate('Category') ?></legend>
    <?= helper('com:questions.radiolist.categories', array('row' => $contact, 'name' => 'contacts_category_id', 'package' => 'contacts')) ?>
</fieldset>

<? if($contact->isAttachable()) : ?>
    <fieldset>
        <legend><?= translate('Image'); ?></legend>
        <? if (!$contact->isNew()) : ?>
            <?= import('com:attachments.view.attachments.list.html', array('attachments' => $contact->getAttachments(), 'assignable' => false)) ?>
        <? endif ?>
        <? if(!count($contact->getAttachments())) : ?>
            <?= import('com:attachments.view.attachments.upload.html') ?>
        <? endif ?>
    </fieldset>
<? endif ?>

<fieldset>
    <legend><?= translate('Parameters'); ?></legend>
    <?= $contact->params->render(); ?>
</fieldset>