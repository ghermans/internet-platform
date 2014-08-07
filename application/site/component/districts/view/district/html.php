<?php
/**
 * Belgian Police Web Platform - Districts Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

use Nooku\Library;

class DistrictsViewDistrictHtml extends Library\ViewHtml
{
    public function render()
    {
        //Get the article
        $district = $this->getModel()->getData();

        //Set the pathway
        $this->getObject('application')->getPathway()->addItem($district->title, '');

        //setcookie ("district_street", $state->street, time()+3600*24*(2), '/5388' );
        //setcookie ("district_number", $state->number, time()+3600*24*(2), '/5388' );

        $this->contact = $this->getObject('com:contacts.model.contact')->id($district->contacts_contact_id)->getRow();

        return parent::render();
    }
}