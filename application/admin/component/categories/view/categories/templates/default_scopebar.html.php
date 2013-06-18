<?
/**
 * @package     Nooku_Server
 * @subpackage  Contacts
 * @copyright   Copyright (C) 2011 - 2012 Timble CVBA and Contributors. (http://www.timble.net).
 * @license     GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link        http://www.nooku.org
 */
?>

<div class="scopebar">
    <div class="scopebar__group">
        <a class="<?= is_null($state->published) ? 'active' : ''; ?>" href="<?= @route('published=' ) ?>">
            <?= @text('All') ?>
        </a>
    </div>
    <div class="scopebar__group">
        <a class="<?= $state->published === true ? 'active' : ''; ?>" href="<?= @route($state->published === true ? 'published=' : 'published=1') ?>">
            <?= @text('Published') ?>
        </a>
        <a class="<?= $state->published === false ? 'active' : ''; ?>" href="<?= @route($state->published === false ? 'published=' : 'published=0' ) ?>">
            <?= @text('Unpublished') ?>
        </a>
    </div>
    <div class="scopebar__group">
    	<a class="<?= $state->access === true ? 'active' : ''; ?>" href="<?= @route($state->access === true ? 'access=' : 'access=1' ) ?>">
    	    <?= 'Registered' ?>
    	</a>
    </div>
    <div class="scopebar__search">
        <?= @helper('grid.search') ?>
    </div>
</div>