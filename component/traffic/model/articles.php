<?php
/**
 * Belgian Police Web Platform - Traffic Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		http://www.police.be
 */

namespace Nooku\Component\Traffic;
use Nooku\Library;

class ModelArticles extends Library\ModelTable
{
	public function __construct(Library\ObjectConfig $config)
	{
		parent::__construct($config);

		$this->getState()
		    ->insert('published' , 'int')
            ->insert('category' , 'int')
            ->insert('type' , 'string')
		    ->insert('date' , 'string');
	}
	
	protected function _buildQueryJoins(Library\DatabaseQuerySelect $query)
	{
		$query->join(array('street_relation' => 'streets_relations'), 'street_relation.table = :table AND street_relation.row = tbl.traffic_article_id')->bind(array('table' => 'traffic_articles'));
	}
	
	protected function _buildQueryWhere(Library\DatabaseQuerySelect $query)
	{
	    parent::_buildQueryWhere($query);
		$state = $this->getState();

		if ($state->search) {
			$query->where('tbl.title LIKE :search')->bind(array('search' => '%'.$state->search.'%'));
		}

        if(is_numeric($state->category)) {
            $query->where('tbl.categories_category_id = :category')->bind(array('category' => $state->category));
        }
		
		if (is_numeric($state->published)) {
			$query->where('tbl.published = :published')->bind(array('published' => $state->published));
		}

		if ($state->date == 'past') {
			$query->where('tbl.end_on < :past')->bind(array('past' => date('Y-m-d')));
		}

		if ($state->date == 'upcoming') {
            $query->where('(tbl.end_on >= :today OR (tbl.end_on IS NULL AND tbl.start_on >= :today))')->bind(array('today' => date('Y-m-d')));
		}
	}
}