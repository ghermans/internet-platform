<?php
/**
 * Belgian Police Web Platform - Support Component
 *
 * @copyright	Copyright (C) 2012 - 2014 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

use Nooku\Library;
use Nooku\Library\DatabaseQuerySelect;

class SupportModelTickets extends Library\ModelTable
{
    public function __construct(Library\ObjectConfig $config)
    {
        parent::__construct($config);

        $this->getState()
            ->insert('created_by', 'int')
            ->insert('status', 'string');

        $this->getState()->remove('sort')->insert('sort', 'cmd', 'ordering');
    }

    protected function _buildQueryColumns(Library\DatabaseQuerySelect $query)
    {
        parent::_buildQueryColumns($query);

        $query->columns(array(
            'created_by_name'           => 'creator.name',
            'last_activity_on'          => 'IF(tbl.last_commented_on, tbl.last_commented_on, IF(tbl.modified_on, tbl.modified_on, tbl.created_on))',
            'last_activity_by_name'     => 'IF(tbl.last_commented_on, commenter.name, IF(tbl.modified_on, modifier.name, creator.name))',
        ));
    }

    protected function _buildQueryJoins(Library\DatabaseQuerySelect $query)
    {
        parent::_buildQueryJoins($query);

        $query->join(array('creator' => 'users'), 'creator.users_user_id = tbl.created_by')
              ->join(array('modifier' => 'users'), 'modifier.users_user_id = tbl.modified_by')
              ->join(array('commenter' => 'users'), 'commenter.users_user_id = tbl.last_commented_by');
    }

    protected function _buildQueryWhere(Library\DatabaseQuerySelect $query)
    {
        parent::_buildQueryWhere($query);
        $state = $this->getState();

        if(is_numeric($state->created_by)) {
            $query->where('tbl.created_by = :created_by')->bind(array('created_by' => (int) $state->created_by));
        }

        if($state->status) {
            $query->where('tbl.status = :status')->bind(array('status' => $state->status));
        }

        if($state->search) {
            $query->where('(tbl.title LIKE :search OR tbl.text LIKE :search)')->bind(array('search' => '%'.$state->search.'%'));
        }
    }
}