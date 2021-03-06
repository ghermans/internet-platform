<?php
/**
 * Belgian Police Web Platform - Questions Component
 *
 * @copyright	Copyright (C) 2012 - 2013 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

namespace Nooku\Component\Questions;

use Nooku\Library;

class DatabaseBehaviorDeletable extends Library\DatabaseBehaviorAbstract
{
    protected function _beforeTableDelete(Library\CommandContext $context)
    {
        $identifier = 'com:questions.database.table.questions';

        $rowset = $this->getObject($identifier)->select(array('questions_category_id' => $this->id));

        //Prevent the item from being deleted
        if($rowset->count()) {
            return false;
        }

        return true;
    }
}