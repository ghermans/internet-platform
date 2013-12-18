<?
/**
 * Belgian Police Web Platform - Lost Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */
?>

<!--
<script src="assets://js/koowa.js" />
<style src="assets://css/koowa.css" />
-->

<ktml:module position="actionbar">
    <ktml:toolbar type="actionbar">
</ktml:module>

<form action="" method="get" class="-koowa-grid">
	<table>
	<thead>
		<tr>
            <th width="10">
				<?= helper( 'grid.checkall'); ?>
			</th>
			<th>
				<?= helper('grid.sort', array('column' => 'title')) ?>
			</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="7">
				<?= helper('com:application.paginator.pagination', array('total' => $total)) ?>
			</td>
		</tr>
	</tfoot>
	<tbody>
		<? foreach ($brands as $brand) : ?>
		<tr>
            <td align="center">
				<?= helper('grid.checkbox', array('row' => $brand))?>
			</td>
            <td class="ellipsis">
				<a href="<?= route( 'view=brand&task=edit&id='.$brand->id ); ?>">
					<?= $brand->title ?>
				</a>
			</td>
		</tr>
		<? endforeach; ?>
	</tbody>
	</table>
</form>