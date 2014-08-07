<?php
/**
 * Belgian Police Web Platform - Districts Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

namespace Nooku\Component\Districts;
use Nooku\Library;

class DatabaseTableDistricts extends Library\DatabaseTableAbstract
{
    public function  _initialize(Library\ObjectConfig $config)
    {        
        $config->append(array(
            'name'         => 'districts',
            'behaviors'    =>  array(
                'lockable', 'creatable', 'modifiable', 'sluggable',
                'com:languages.database.behavior.translatable'
            )
        ));
     
        parent::_initialize($config);
     }
}