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

<form action="" method="get" class="-koowa-grid">
	<?= @template('default_scopebar.html'); ?>
	<table>
	<thead>
		<tr>
			<th width="10">
				<?= @helper( 'grid.checkall'); ?>
			</th>
			<th>
				<?= @helper('grid.sort', array('column' => 'title')) ?>
			</th>
			<th>
				<?= @helper('grid.sort', array('column' => 'contact')) ?>
			</th>
			<th>
				<?= @text('Officers') ?>
			</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="5">
				<?= @helper('com:application.paginator.pagination', array('total' => $total)) ?>
			</td>
		</tr>
	</tfoot>
	<tbody>
		<? foreach ($districts as $district) : ?>
		<tr>
			<td align="center">
				<?= @helper('grid.checkbox', array('row' => $district))?>
			</td>
			<td>
				<a href="<?= @route( 'view=district&id='. $district->id ); ?>"><?= @escape($district->title); ?></a>
			</td>
			<td>
				<?= @escape($district->contact); ?>
			</td>
			<td class="array-separator">
				<? foreach($districts_officers->find(array('districts_district_id' => $district->id)) as $officer) : ?>
					<span><?= $officer->firstname.' '.$officer->lastname ?></span>
				<? endforeach; ?>
			</td>
		</tr>
		<? endforeach; ?>
	</tbody>
	</table>
</form>