<?php
/**
 * Belgian Police Web Platform - News Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

use Nooku\Library;

class NewsViewArticleHtml extends Library\ViewHtml
{
    public function render()
    {
        //Get the article
        $article = $this->getModel()->getData();

        //Set the pathway
        $this->getObject('application')->getPathway()->addItem($article->title, '');

        //Get the thumbnail
        if ($article->attachments_attachment_id) {
            $this->thumbnail = $this->getObject('com:attachments.database.row.attachment')->set('id', $article->attachments_attachment_id)->load()->path;
        }

        $this->url = $this->getObject('application')->getRequest()->getUrl()->toString(Library\HttpUrl::HOST);

        $this->zone = $this->getObject('com:police.model.zone')->id($this->getObject('application')->getSite())->getRow();

        //Get the attachments
        if ($article->id && $article->isAttachable()) {
            $this->attachments($article->getAttachments());
        }

        $published_on = new DateTime($article->ordering_date);
        $this->published_on = $published_on->format('c');

        return parent::render();
    }
}