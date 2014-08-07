<?php
/**
 * Belgian Police Web Platform - Uploads Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

namespace Nooku\Component\Uploads;

use Nooku\Library;

/**
 * Article Controller Actionbar
 *
 * @author  Johan Janssens <http://nooku.assembla.com/profile/johanjanssens>
 * @package Nooku\Component\Articles
 */
class ControllerToolbarUpload extends Library\ControllerToolbarActionbar
{
    protected function _afterControllerBrowse(Library\CommandContext $context)
    {
        parent::_afterControllerBrowse($context);

        $this->reset();
        $this->addOfficers();
        $this->addDistricts();
        $this->addLocalstreets();
        $this->addDistrictsofficers();
        $this->addRelations();
        $this->addSeparator();
        $this->addNews();
        $this->addSeparator();
        $this->addPress();
        $this->addSeparator();
        $this->addContacts();
        $this->addSeparator();
        $this->addStreets();
    }

    protected function _commandDistricts(Library\ControllerToolbarCommand $command)
    {
        $command->label = 'Districts';
        $command->href = 'option=com_uploads&view=upload&table=districts';
    }

    protected function _commandDistrictsofficers(Library\ControllerToolbarCommand $command)
    {
        $command->label = 'Districts - Officers';
        $command->href = 'option=com_uploads&view=upload&table=districts_officers';
    }

    protected function _commandRelations(Library\ControllerToolbarCommand $command)
    {
        $command->label = 'Districts - Streets';
        $command->href = 'option=com_uploads&view=upload&table=districts_relations';
    }

    protected function _commandLocalstreets(Library\ControllerToolbarCommand $command)
    {
        $command->label = 'Local Streets';
        $command->href = 'option=com_uploads&view=upload&table=localstreets';
    }

    protected function _commandOfficers(Library\ControllerToolbarCommand $command)
    {
        $command->label = 'Officers';
        $command->href = 'option=com_uploads&view=upload&table=officers';
    }

    protected function _commandNews(Library\ControllerToolbarCommand $command)
    {
        $command->label = 'News';
        $command->href = 'option=com_uploads&view=upload&table=news';
    }

    protected function _commandPress(Library\ControllerToolbarCommand $command)
    {
        $command->label = 'Press';
        $command->href = 'option=com_uploads&view=upload&table=press';
    }

    protected function _commandContacts(Library\ControllerToolbarCommand $command)
    {
        $command->label = 'Contacts';
        $command->href = 'option=com_uploads&view=upload&table=contacts';
    }

    protected function _commandStreets(Library\ControllerToolbarCommand $command)
    {
        $command->label = 'Streets';
        $command->href = 'option=com_uploads&view=upload&table=streets';
    }
}