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
$site = object('application')->getCfg('site');
$zone = object('com:police.model.zone')->id($site)->getRow();
$cities = object('com:streets.model.cities')->zone($site)->getRowset()->title;

$languages  = $this->getObject('application.languages');
$active     = $languages->getActive();

$path = '/'.$site;
$path .= count($languages) > '1' ? '/'.$active->slug : '';
?>

<? $description = translate('Website of the local Police zone').' '.$zone->title ?>

<? if(count($cities) > '1') : ?>
    <? $description .= ' ('; ?>
    <? $description .= implode(", ", $cities) ?>
    <? $description .= ')'; ?>
<? endif ?>

<meta content="<?= $description ?>." name="description" />

<div class="clearfix">
    <div class="homepage__sticky">
        <? $stickies = object('com:news.model.articles')->sticky(true)->published(true)->getRowset();
            $article = $stickies->count() ? $stickies->top() : object('com:news.model.articles')->limit('1')->sort('published_on')->direction('DESC')->published(true)->getRowset()->top(); ?>
        <? $link = $path.'/'.object('lib:filter.slug')->sanitize(translate('News')).'/'.$article->id.'-'.$article->slug ?>
        <article>
            <header class="article__header">
                <h1><a href="<?= $link ?>"><?= escape($article->title) ?></a></h1>
                <span class="text--small">
                    <?= helper('date.format', array('date'=> $article->published_on, 'format' => translate('DATE_FORMAT_LC5'))) ?>
                </span>
            </header>

            <div class="clearfix">
                <? if($article->attachments_attachment_id) : ?>
                    <a class="article__thumbnail" tabindex="-1" href="<?= $link ?>">
                        <?= helper('com:police.image.thumbnail', array(
                            'attachment' => $article->attachments_attachment_id,
                            'attribs' => array('width' => '400', 'height' => '300'))) ?>
                    </a>
                <? endif ?>

                <?= $article->introtext ?>

                <? if ($article->fulltext) : ?>
                    <a href="<?= $link ?>"><?= translate('Read more') ?></a>
                <? endif; ?>
            </div>
        </article>
        <div class="homepage__news">
            <?= import('com:news.view.articles.list.html', array('articles' =>  object('com:news.model.articles')->sort('published_on')->direction('DESC')->published(true)->limit('2')->exclude($article->id)->getRowset())) ?>
        </div>
    </div>
    <div class="homepage__contact">
        <div class="contact__inner">
            <h3><?= translate('Contact us') ?></h3>
            <div class="well well--small">
                <p>
                    <span class="muted"><?= translate('Urgent police assistance') ?></span><br />
                    <span class="text--strong">101</span>
                    <? if($zone->phone_emergency) : ?>
                    <?= @translate('or') ?> <span class="text--strong"><?= $zone->phone_emergency ?></span>
                    <? endif ?>
                </p>
                <? if($zone->phone_information) : ?>
                <p>
                    <span class="muted"><?= translate('General information') ?></span><br />
                    <span class="text--strong"><?= $zone->phone_information ?></span>
                </p>
                <? endif ?>
            </div>

            <ul class="nav nav--list">
                <? foreach(object('com:pages.model.pages')->menu('1')->published('true')->hidden('false')->getRowset() as $page) : ?>
                    <? if(in_array($page->id, array('42', '43', '44', '66'))) : ?>
                    <li><a href="<?= $path ?>/contact/<?= $page->slug ?>"><?= $page->title ?></a></li>
                    <? endif ?>
                <? endforeach ?>
            </ul>
        </div>
    </div>
</div>
