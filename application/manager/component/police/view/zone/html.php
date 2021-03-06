<?php
/**
 * Belgian Police Web Platform - Zone Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

use Nooku\Library;

class PoliceViewZoneHtml extends Library\ViewHtml
{
    public function render()
    {
        $zone = $this->getModel()->getRow();

        $zone->titles = json_decode($zone->titles);

        return parent::render();
    }
}