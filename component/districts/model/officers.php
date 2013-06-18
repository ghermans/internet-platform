<?php
/**
 * Belgian Police Web Platform - Districts Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		http://www.police.be
 */

namespace Nooku\Component\Districts;
use Nooku\Library;

class ModelOfficers extends Library\ModelTable
{	
    public function __construct(Library\ObjectConfig $config)
	{
		parent::__construct($config);

		$this->getState()
		    ->insert('location' , 'int');
	}
	
	protected function _buildQueryColumns(Library\DatabaseQuerySelect $query)
    {
        parent::_buildQueryColumns($query);

        $query->columns(array('district_count' => 'COUNT(districts_officers.districts_district_id)'));
    }
	
	protected function _buildQueryJoins(Library\DatabaseQuerySelect $query)
	{
		$query->join(array('districts_officers' => 'districts_districts_officers'), 'districts_officers.districts_officer_id = tbl.districts_officer_id');
		$query->join(array('district' => 'districts'), 'district.districts_district_id = districts_officers.districts_district_id');
	}
    
    protected function _buildQueryWhere(Library\DatabaseQuerySelect $query)
	{
		parent::_buildQueryWhere($query);
		$state = $this->getState();

		if ($state->search) {
			$query->where('tbl.firstname LIKE :search')->bind(array('search' => '%'.$state->search.'%'));
		}
	}
	
	protected function _buildQueryOrder(Library\DatabaseQuerySelect $query)
    {
        $state = $this->getState();

        $direction = strtoupper($state->direction);

        if ($state->sort == 'firstname')
        {
            $query->order($state->sort, $direction)
                  ->order('lastname', $direction);
        }
    } 
    
    protected function _buildQueryGroup(Library\DatabaseQuerySelect $query)
    {
        parent::_buildQueryGroup($query);

        $query->group('tbl.districts_officer_id');
    }
}