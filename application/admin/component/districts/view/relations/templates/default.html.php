<?
/**
 * Belgian Police Web Platform - Districts Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		http://www.police.be
 */
?>

<!--
<script src="media://js/koowa.js" />
<style src="media://css/koowa.css" />
-->

<ktml:module position="toolbar">
    <?= @helper('toolbar.render', array('toolbar' => $toolbar))?>
</ktml:module>

<ktml:module position="sidebar">
	<?= @template('default_sidebar.html'); ?>
</ktml:module>

<form action="" method="get" class="-koowa-grid">
	<?= @template('default_scopebar.html'); ?>
	<table class="adminlist">
	<thead>
		<tr>
			<th width="10">
				<?= @helper( 'grid.checkall'); ?>
			</th>
			<th>
				<?= @helper('grid.sort', array('column' => 'street')) ?>
			</th>
			<th>
				<?= @helper('grid.sort', array('column' => 'district')) ?>
			</th>
			<th width="40">
				<?= @helper('grid.sort', array('column' => 'range_start', 'title' => 'Start')) ?>
			</th>
			<th width="40">
				<?= @helper('grid.sort', array('column' => 'range_end', 'title' => 'End')) ?>
			</th>
			<th width="70">
				<?= @helper('grid.sort', array('column' => 'range_parity', 'title' => 'Parity')) ?>
			</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="7">
				<?= @helper('com:application.paginator.pagination', array('total' => $total)) ?>
			</td>
		</tr>
	</tfoot>
	<tbody>
		<? foreach ($relations as $relation) : ?>
		<tr>
			<td align="center">
				<?= @helper('grid.checkbox', array('row' => $relation))?>
			</td>
			<td>
				<a href="<?= @route( 'view=relation&id='. $relation->id ); ?>"><?= @escape($relation->street); ?></a>
			</td>
			<td>
				<?= @escape($relation->district); ?>
			</td>
			<td>
				<?= @escape($relation->range_start); ?>
			</td>
			<td>
				<?= @escape($relation->range_end); ?>
			</td>
			<td>
				<?= @escape($relation->range_parity); ?>
			</td>
		</tr>
		<? endforeach; ?>
	</tbody>
	</table>
</form>
