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
        <label for="published"><?= translate('Published') ?></label>
        <div>
            <input type="text" name="reference" value="<?= $object->reference ?>" />
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