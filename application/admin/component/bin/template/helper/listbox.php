<?php
/**
 * Belgian Police Web Platform - Bin Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

use Nooku\Library;

class BinTemplateHelperListbox extends Library\TemplateHelperListbox
{
	public function districts( $config = array())
	{
		$config = new Library\ObjectConfig($config);
		$config->append(array(
			'model'  => 'districts',
			'name' 	 => 'bin_district_id',
			'value'	 => 'id',
            'label'  => 'title'
		));

		return parent::_listbox($config);
	}
}