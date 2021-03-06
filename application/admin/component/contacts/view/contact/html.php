<?php
/**
 * Nooku Framework - http://www.nooku.org
 *
 * @copyright	Copyright (C) 2011 - 2013 Johan Janssens and Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		git://git.assembla.com/nooku-framework.git for the canonical source repository
 */

use Nooku\Library;

class ContactsViewContactHtml extends Library\ViewHtml
{
    public function render()
    {
        $model      = $this->getModel();
        $contact    = $model->getData();

        if($contact->isLocatable())
        {
            $this->street = $contact->getStreets()->top();
        }

        return parent::render();
    }
}