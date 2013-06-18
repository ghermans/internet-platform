<?php
/**
 * Belgian Police Web Platform - Questions Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		http://www.police.be
 */

use Nooku\Library;

class QuestionsTemplateHelperRoute extends PagesTemplateHelperRoute
{
    public function article($config = array())
	{
        $config   = new Library\ObjectConfig($config);
        $config->append(array(
            'layout'   => null
        ));

        $article = $config->row;

        $needles = array(
            array('view' => 'articles' , 'category' => $article->categories_category_id),
		);

        $route = array(
            'view'     => 'article',
            'id'       => $article->getSlug(),
            'layout'   => $config->layout,
        );

		if($item = $this->_findPage($needles)) {
            $route['Itemid'] = $item->id;
		};

        return $this->getTemplate()->getView()->getRoute($route);
	}

    public function category($config = array())
    {
        $config   = new Library\ObjectConfig($config);
        $config->append(array(
            'layout' => 'default'
        ));

        $category = $config->row;

        $needles = array(
            array('view' => 'articles'   , 'category' => $category->id)
        );

        $route = array(
            'view'      => 'articles',
            'category'  => $category->getSlug(),
            'layout'    => $config->layout
        );

        if($item = $this->_findPage($needles))
        {
            if(isset($item->getLink()->query['layout'])) {
                $route['layout'] = $item->getLink()->query['layout'];
            }

            $route['Itemid'] = $item->id;
        };

        return $this->getTemplate()->getView()->getRoute($route);
    }
}