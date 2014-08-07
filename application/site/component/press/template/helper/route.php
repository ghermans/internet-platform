<?php
/**
 * Belgian Police Web Platform - Press Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

use Nooku\Library;

class PressTemplateHelperRoute extends PagesTemplateHelperRoute
{
    public function article($config = array())
	{
        $config   = new Library\ObjectConfig($config);
        $config->append(array(
            'layout'   => null,
            'format'   => 'html'
        ));

        $article = $config->row;

        $needles = array(
            array('view' => 'article' , 'id' => $article->id),
		);

        $route = array(
            'view'     => 'article',
            'id'       => $article->getSlug(),
            'layout'   => $config->layout,
            'format'   => $config->format,
        );

		if($item = $this->_findPage($needles)) {
			$route['Itemid'] = $item->id;
		};

        return $this->getTemplate()->getView()->getRoute($route);
	}
}