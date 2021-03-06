<?php
namespace Nooku\Component\Announcements;

use Nooku\Library;

class DatabaseRowsetAnnouncements extends Library\DatabaseRowsetAbstract
{
    protected function _initialize(Library\ObjectConfig $config)
    {
        $config->append(array(
            'identity_column' => 'identifier'
        ));

        parent::_initialize($config);
    }
}