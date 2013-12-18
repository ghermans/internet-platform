<?php
/**
 * Belgian Police Web Platform - Districts Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

use Nooku\Library;

class LostTemplateHelperListbox extends Library\TemplateHelperListbox
{
    public function brands( $config = array())
    {
        $config = new Library\ObjectConfig($config);
        $config->append(array(
            'model'         => 'brands',
            'value'		    => 'id',
            'label'         => 'title'
        ));

        return parent::_listbox($config);
    }
}