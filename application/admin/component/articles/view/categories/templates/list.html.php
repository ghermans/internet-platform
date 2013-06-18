<?
/**
 * @package     Nooku_Server
 * @subpackage  Articles
 * @copyright   Copyright (C) 2011 - 2012 Timble CVBA and Contributors. (http://www.timble.net).
 * @license     GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link        http://www.nooku.org
 */
?>

<ul class="navigation">
	<li>
        <a class="<?= !is_numeric($state->category) ? 'active' : ''; ?>" href="<?= @route('category=' ) ?>">
            <?= @text('All articles')?>
        </a>
	</li>
	<li>
        <a class="<?= $state->category == '0' ? 'active' : ''; ?>" href="<?= @route('&category=0' ) ?>">
            <?= @text('Uncategorised') ?>
        </a>
	</li>

    <? foreach($categories as $category) : ?>
	<li>
        <a class="<?= $state->category == $category->id ? 'active' : ''; ?>" href="<?= @route('category='.$category->id ) ?>">
            <?= @escape($category->title) ?>
        </a>

        <? if($category->hasChildren()) : ?>
        <ul>
            <? foreach($category->getChildren() as $child) : ?>
            <li>
                <a class="<?= $state->category == $child->id ? 'active' : ''; ?>" href="<?= @route('sort=ordering&category='.$child->id ) ?>">
                    <?= $child->title; ?>
                </a>
            </li>
            <? endforeach ?>
        </ul>
        <? endif; ?>
    </li>

	<? endforeach ?>
</ul>