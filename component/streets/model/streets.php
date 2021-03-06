<?php
/**
 * Belgian Police Web Platform - Streets Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

namespace Nooku\Component\Streets;
use Nooku\Library;

class ModelStreets extends Library\ModelTable
{	
	public function __construct(Library\ObjectConfig $config)
	{
		parent::__construct($config);

		$this->getState()
		    ->insert('city' , 'int')
            ->insert('islp' , 'string')
            ->insert('no_islp' , 'int')
            ->insert('no_district' , 'int')
            ->insert('district' , 'int')
            ->insert('row' , 'int')
            ->insert('table' , 'string')
            ->insert('iso' , 'string')
            ->insert('sort'      , 'cmd', 'title');
	}

    protected function _buildQueryColumns(Library\DatabaseQuerySelect $query)
    {
        parent::_buildQueryColumns($query);
        $state = $this->getState();

        $cities = $this->getObject('com:police.model.zones')->id($this->getObject('application')->getSite())->getRow()->cities;

        $query->columns(array(
            'title'             => $cities == '1' ? 'tbl.title' : "CONCAT(tbl.title,' (',city.title,')')",
            'title_short'       => 'tbl.title',
            'district_count'    => 'district.district_count',
            'bin_count'         => 'bin.district_count',
            'city'              => 'city.title',
            'islp'              => 'islps.islp'
        ));
    }

    protected function _buildQueryJoins(Library\DatabaseQuerySelect $query)
    {
        $state = $this->getState();

        // Join the ISLP ID
        $query->join(array('islps' => 'data.streets_streets_islps'), 'islps.streets_street_identifier = tbl.streets_street_identifier');

        if(!$state->isUnique() && $state->row && $state->table)
        {
            $query->join(array('relations' => 'streets_relations'), 'relations.streets_street_identifier = tbl.streets_street_identifier');
        }

        $query->join(array('city' => 'data.streets_cities'), 'city.streets_city_id = tbl.streets_city_id');

        $subquery = $this->getObject('lib:database.query.select')
            ->columns(array('streets_street_identifier', 'district_count' => 'COUNT(row)'))
            ->table('streets_relations')
            ->where('table = :table')
            ->bind(array('table' => 'districts_relations'))
            ->group('streets_street_identifier');

        $query->join(array('district' => $subquery), 'district.streets_street_identifier = tbl.streets_street_identifier');

        $subquery = $this->getObject('lib:database.query.select')
            ->columns(array('streets_street_identifier', 'district_count' => 'COUNT(row)'))
            ->table('streets_relations')
            ->where('table = :table')
            ->bind(array('table' => 'bin_relations'))
            ->group('streets_street_identifier');

        $query->join(array('bin' => $subquery), 'bin.streets_street_identifier = tbl.streets_street_identifier');

        parent::_buildQueryJoins($query);
    }
	
    protected function _buildQueryWhere(Library\DatabaseQuerySelect $query)
	{
		parent::_buildQueryWhere($query);
		$state = $this->getState();

        if ($state->iso) {
            $query->where('tbl.iso = :iso')->bind(array('iso' => $state->iso));
        }

        if ($state->search) {
            $query->where('(tbl.title LIKE :search OR islps.islp LIKE :search OR tbl.streets_street_id LIKE :search)')->bind(array('search' => '%' . $state->search . '%'));
        }

        if(!$state->isUnique() && $state->row && $state->table)
        {
            if($state->table) {
                $query->where('relations.table = :table')->bind(array('table' => $state->table));
            }

            if($state->row) {
                $query->where('relations.row IN :row')->bind(array('row' => (array) $state->row));
            }
        }

        if ($state->title) {
            $query->where('tbl.title LIKE :title')->bind(array('title' => $state->title));
        }

        if ($state->city) {
            $query->where('tbl.streets_city_id = :city')->bind(array('city' => $state->city));
        }

        // com:uploads uses ISLP column to find a street
        if ($state->islp) {
            $query->where('islps.islp = :islp')->bind(array('islp' => $state->islp));
        }

        if ($state->no_islp) {
            $query->where('islps.islp IS NULL');
        }

        if ($state->no_district == '1') {
            $query->where('district.district_count IS NULL');
        }

        if ($state->district == '1') {
            $query->where('district.district_count IS NOT NULL');
        }

        if(!in_array($this->getObject('application')->getSite(), array('default'))) {
            $query->where('city.police_zone_id = :zone')->bind(array('zone' => $this->getObject('application')->getSite()));
        }
	}

    protected function _buildQueryGroup(Library\DatabaseQuerySelect $query)
    {
        $state = $this->getState();

        if(!$state->isUnique() && $state->row && $state->table) {
            $query->group('relations.streets_street_identifier');
        }

        return parent::_buildQueryGroup($query);
    }
}