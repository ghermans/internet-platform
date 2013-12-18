<fieldset>
    <legend><?= translate('Publish') ?></legend>
    <div>
        <label for="published"><?= translate('Published') ?></label>
        <div>
            <input type="checkbox" name="published" value="1" <?= $object->published ? 'checked="checked"' : '' ?> />
        </div>
    </div>
</fieldset>

<fieldset>
    <legend><?= translate('Details') ?></legend>
    <div>
        <label for="reference"><?= translate('Reference') ?></label>
        <div>
            <input type="text" name="reference" value="<?= $object->reference ?>" />
        </div>
    </div>
    <div>
        <label for="date"><?= translate('Date found') ?></label>
        <div class="controls">
            <input type="date" name="date" value="<?= $object->date ?>" />
        </div>
    </div>
    <div>
        <label for="brand"><?= translate('Brand') ?></label>
        <div>
            <?= helper('com:lost.listbox.brands', array('name' => 'lost_brand_id', 'selected' => $object->lost_brand_id, 'attribs' => array('class' => 'select-brand', 'style' => 'width:100%'))) ?>
            <script data-inline> $jQuery(".select-brand").select2(); </script>
        </div>
    </div>
</fieldset>

<fieldset>
    <legend><?= translate('Category') ?></legend>
    <?= helper('com:categories.radiolist.categories', array('row' => $object, 'uncategorised' => false)) ?>
</fieldset>

<? if($object->isAttachable()) : ?>
<fieldset>
    <legend><?= translate('Attachments') ?></legend>
    <? if (!$object->isNew()) : ?>
        <?= import('com:attachments.view.attachments.list.html', array('attachments' => $object->getAttachments())) ?>
    <? endif ?>
    <?= import('com:attachments.view.attachments.upload.html') ?>
</fieldset>
<? endif ?>