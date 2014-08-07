<?
/**
 * Belgian Police Web Platform - Police Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */
?>
<?
$languages  = $this->getObject('application.languages');
$active     = $languages->getActive();

$zone = object('com:police.model.zone')->id($site)->getRow();
$singleColumn = $extension == 'police' OR $extension == 'files' ? 'true' : 'false';

$pages = object('com:pages.model.pages')->menu('1')->published('true')->getRowset();

$path = '/'.$site;
$path .= count($languages) > '1' ? '/'.$active->slug : '';
?>
<!DOCTYPE HTML>
<html lang="<?= $language; ?>" dir="<?= $direction; ?>" prefix="og: http://ogp.me/ns# article: http://ogp.me/ns/article#"">

<?= import('page_head.html') ?>
<body id="page" class="no-js">
<script data-inline type="text/javascript" pagespeed_no_defer="">function hasClass(e,t){return e.className.match(new RegExp("(\\s|^)"+t+"(\\s|$)"))}var el=document.getElementById("page");var cl="no-js";if(hasClass(el,cl)){var reg=new RegExp("(\\s|^)"+cl+"(\\s|$)");el.className=el.className.replace(reg,"js-enabled")}</script>

<div id="wrap">
    <div class="container container__header">
        <div class="header">
            <div class="organization" itemscope itemtype="http://schema.org/Organization">
                <a itemprop="url" href="<?= $path ?>">
                    <div class="organization__logo organization__logo--<?= $active->slug; ?>"></div>
                    <div class="organization__name"><span><?= translate('Police') ?></span> <?= escape($zone->title); ?></div>
                    <meta itemprop="logo" content="assets://application/images/logo-<?= array_shift(str_split($language, 2)); ?>.png" />
                </a>
                <button id="hamburger" class="button--hamburger" aria-hidden="true" aria-pressed="false" aria-controls="navigation" onclick="apollo.toggleClass(document.getElementById('navigation'), 'is-shown');apollo.toggleClass(document.getElementById('hamburger'), 'close');hamburger()">MENU <span class="lines"></span></button>
            </div>

            <div class="navigation">
                <span class="slogan">
                    <?= JText::sprintf('Call for urgent police assistance', '101') ?>.
                    <?= JText::sprintf('No emergency, just police', escape($zone->phone_information)) ?>.
                </span>
                <div id="navigation" class="navbar">
                    <ktml:modules position="navigation">
                        <ktml:modules:content>
                    </ktml:modules>
                </div>
            </div>
        </div>
    </div>

    <div class="container container__banner">
        <div class="banner__image banner__image--<?= $site ?>">

        </div>
    </div>

    <ktml:modules position="breadcrumbs">
        <div class="container container__breadcrumb">
            <?= @import('default_languages.html', array('languages' => $languages, 'active' => $active)) ?>
            <ktml:modules:content>
        </div>
    </ktml:modules>

    <div class="container container__content<?= $extension == 'police' ? ' homepage' : '' ?>">
        <ktml:modules position="left">
            <aside class="sidebar">
                <ktml:modules:content>
            </aside>
        </ktml:modules>

        <? if(!$singleColumn) : ?>
        <div class="component <?= $extension ?>">
            <? endif ?>
            <ktml:content>
                <? if(!$singleColumn) : ?>
        </div>
    <? endif ?>
    </div>

    <ktml:modules position="quicklinks">
        <div class="container container__footer">
            <div class="container__quicklinks">
                <ktml:modules:content>
            </div>
        </div>
    </ktml:modules>

    <? if($extension !== 'police') : ?>
        <div class="container container__footer">
            <div class="row">
                <div class="footer__news">
                    <h3><?= translate('Latest news') ?></h3>
                    <?= import('com:news.view.articles.list.html', array('articles' =>  object('com:news.model.articles')->sort('ordering_date')->direction('DESC')->published(true)->limit('2')->getRowset())) ?>
                </div>
                <? if($site !== '5888') : ?>
                    <div class="footer__districts">
                        <h3><?= translate('Your district officer') ?></h3>
                        <p><?= translate('You know the responsible district officer in your area? He or she is your first contact with the police.') ?></p>
                        <a href="<?= $path ?>/contact/<?= object('lib:filter.slug')->sanitize(translate('Your district officer')) ?>"><?= translate('Contact your district officer') ?>.</a>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    <?php endif; ?>

    <div class="container container__footer_menu">
        <ul class="nav nav--list">
            <li><a href="<?= $path ?>"><?= translate('Home') ?></a></li>
            <? foreach($pages as $page) : ?>
                <? if($page->level == '1' && $page->hidden == false) : ?>
                    <li><a href="<?= $path ?>/<?= $page->slug ?>"><?= $page->title ?></a></li>
                <? endif ?>
            <? endforeach ?>
        </ul>
    </div>
</div>

<div id="copyright">
    <div class="container container__copyright">
        <div class="copyright--left">
            <? if($zone->twitter) : ?>
                <a href="http://www.twitter.com/<?= $zone->twitter ?>"><i class="icon-twitter"></i> Twitter</a>
            <? endif ?>
            <?= $zone->twitter && $zone->facebook ? '&nbsp;|&nbsp;' : '' ?>
            <? if($zone->facebook) : ?>
                <a href="http://www.facebook.com/<?= $zone->facebook ?>"><i class="icon-facebook"></i> Facebook</a>
            <? endif ?>
            <? foreach($pages as $page) : ?>
                <? if($page->id == '89' || $page->id == '101') : ?>
                    &nbsp;|&nbsp;&nbsp;<a href="<?= $path ?>/<?= $page->slug ?>"><?= $page->title ?></a>
                <? endif ?>
            <? endforeach ?>
        </div>
        <div class="copyright--right">
            © <?= date(array('format' => 'Y')) ?> <?= translate('Local Police') ?> - <?= escape($zone->title); ?>
            <a style="margin-left: 10px" target="_blank" href="http://www.lokalepolitie.be/portal/<?= $active->slug ?>/disclaimer.html">Disclaimer</a> -
            <a target="_blank" href="http://www.lokalepolitie.be/portal/<?= $active->slug ?>/privacy.html">Privacy</a> -
            <a href="http://www.belgium.be/<?= $active->slug ?>">Belgium.be</a>
        </div>
    </div>
</div>

</body>
</html>