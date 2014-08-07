<?php
/**
 * @package     Nooku_Server
 * @subpackage  Contacts
 * @copyright   Copyright (C) 2011 - 2012 Timble CVBA and Contributors. (http://www.timble.net).
 * @license     GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link        http://www.nooku.org
 */

use Nooku\Library;

/**
 * Category Controller Class
 *
 * @author      Johan Janssens <http://nooku.assembla.com/profile/johanjanssens>
 * @package     Nooku_Server
 * @subpackage  Contacts
 */
class TrafficControllerCategory extends PoliceControllerLanguage
{
    public function getRequest()
    {
        $request = parent::getRequest();

        $request->query->published = 1;
        $request->query->sort      = 'title';

        return $request;
    }
}