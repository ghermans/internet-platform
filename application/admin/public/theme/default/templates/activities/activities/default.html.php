<? $disabled = $this->getObject('user')->getRole() < 25 ?>

<!--
<script src="assets://js/koowa.js" />
<style src="assets://css/koowa.css" />
-->

<? if(!$disabled): ?>
<ktml:module position="actionbar">
    <ktml:toolbar type="actionbar">
</ktml:module>
<? endif ?>

<ktml:module position="sidebar">
    <?= import('default_sidebar.html'); ?>
</ktml:module>

<form action="" method="get" class="-koowa-grid">
    <?= import('default_scopebar.html') ?>
    <table>
        <thead>
        <tr>
            <th width="10">
                <?= helper('grid.checkall') ?>
            </th>
            <th width="55"><?=translate('Time')?></th>
            <th><?=translate('Message')?></th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <td colspan="3">
                <?= helper('com:application.paginator.pagination', array('total' => $total)) ?>
            </td>
        </tr>
        </tfoot>
        <tbody>
        <? $date = $old_date = '';   ?>
        <? foreach ($activities as $activity) : ?>
            <? $date = date(array('date' => $activity->created_on, 'format' => 'l d M Y'))?>
            <? if ($date != $old_date): ?>
                <? $old_date = $date; ?>
                <tr class="no-hover separator">
                    <td colspan="3">
                        <?= $date; ?>
                    </td>
                </tr>
            <? endif; ?>
            <tr>
                <td>
                    <?= helper('grid.checkbox',array('row' => $activity)); ?>
                </td>

                <td align="left">
                    <?= date(array('date' => $activity->created_on, 'format' => 'H:i'))?>
                </td>

                <td>
                    <i class="icon-<?= $activity->action ?>"></i> <?= helper('activity.message', array('row' => $activity))?>
                </td>
            </tr>
        <? endforeach; ?>
        </tbody>
    </table>
</form>