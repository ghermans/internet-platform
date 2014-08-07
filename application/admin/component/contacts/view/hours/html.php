<?php
/**
 * Nooku Framework - http://www.nooku.org
 *
 * @copyright	Copyright (C) 2011 - 2013 Johan Janssens and Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		git://git.assembla.com/nooku-framework.git for the canonical source repository
 */

use Nooku\Library;

class ContactsViewHoursHtml extends Library\ViewHtml
{
    public function render()
    {
        $this->contacts = $this->getObject('com:contacts.model.contacts')->sort('title')->getRowset();
        $this->categories = $this->getObject('com:contacts.model.categories')->sort('title')->getRowset();

        return parent::render();
    }
}