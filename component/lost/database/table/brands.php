<?php
/**
 * Belgian Police Web Platform - Lost Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

namespace Nooku\Component\Lost;
use Nooku\Library;

class DatabaseTableBrands extends Library\DatabaseTableAbstract
{
    public function  _initialize(Library\ObjectConfig $config)
    {
        $config->append(array(
            'behaviors'    =>  array(
                'sluggable', 'lockable', 'creatable', 'modifiable',
            )
        ));

        parent::_initialize($config);
    }
}