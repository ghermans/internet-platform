<?
/**
 * Nooku Framework - http://www.nooku.org
 *
 * @copyright	Copyright (C) 2011 - 2013 Johan Janssens and Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		git://git.assembla.com/nooku-framework.git for the canonical source repository
 */
?>

<? $email_to = str_replace("@", "&#64;", $contact->email_to) ?>
<? $email_to = str_replace(".", "&#46;", $email_to) ?>

<address class="vcard">
    <h1 class="article__header fn"><?= $contact->title?></h1>
    <? if($contact->name) : ?>
    <h2><?= $contact->name?></h2>
    <? endif ?>
    <? if($contact->isAttachable()) : ?>
        <? foreach($contact->getAttachments() as $item) : ?>
            <? if($item->file->isImage()) : ?>
                <img width="400" height="300" class="photo article__thumbnail" align="right" src="attachments://<?= $item->thumbnail ?>" />
            <? endif ?>
        <? endforeach ?>
    <? endif ?>
    <div class="adr">
        <? if ($contact->address) : ?>
            <div class="street-address"><?= $contact->address?></div>
        <? endif; ?>
        <?if ($contact->postcode) : ?>
            <span class="postal-code"><?= $contact->postcode?></span>
        <? endif; ?>
        <? if ( $contact->suburb) : ?>
            <span class="locality"><?= $contact->suburb?></span>
        <? endif; ?>
    </div>
    <ul>
        <? if ($contact->telephone) :?>
            <li class="tel">
                <span class="type"><?= translate('Phone') ?></span>:
                <span class="value"><?= $contact->telephone?></span>
            </li>
        <? endif; ?>
        <? if ($contact->fax) :?>
            <li class="tel">
                <span class="type"><?= translate('Fax') ?></span>:
                <span class="value"><?= $contact->fax?></span>
            </li>
        <? endif; ?>
        <?if ($contact->mobile) :?>
            <li class="tel">
                <span class="type"><?= translate('Mobile') ?></span>:
                <span class="value"><?= $contact->mobile?></span>
            </li>
        <? endif; ?>
        <?if ($contact->email_to) :?>
            <li>
                <span><?= translate('Email') ?></span>:
                <a class="email" href="mailto:<?= $email_to?>"><?= $email_to?></a>
            </li>
        <? endif; ?>
        <?if ($contact->url) :?>
            <li>
                <span><?= translate('Website') ?></span>:
                <a class="url" href="<?= $contact->url ?>"><?= str_replace('http://', '', $contact->url); ?></a>
            </li>
        <? endif; ?>
    </ul>

    <?if ($contact->misc) :?>
        <span class="note">
            <?= $contact->misc ?>
        </span>
    <? endif; ?>
</address>
