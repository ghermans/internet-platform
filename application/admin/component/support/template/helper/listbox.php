<?php
/**
 * Belgian Police Web Platform - Support Component
 *
 * @copyright	Copyright (C) 2012 - 2014 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

use Nooku\Library;

class SupportTemplateHelperListbox extends Library\TemplateHelperListbox
{
    /**
     * @param array $config
     * @return string
     */
    public function statuses($config = array())
    {
        $config = new Library\ObjectConfig($config);
        $config->append(array(
            'model' => 'statuses',
            'value'	=> 'text',
            'label'	=> 'text',
            'filter'    => array(),
            'deselect'  => false
        ));

        return parent::_render($config);
    }
}