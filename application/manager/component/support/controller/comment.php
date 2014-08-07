<?php
use Nooku\Library;
use Nooku\Component\Support;

class SupportControllerComment extends Support\ControllerComment
{
    public function __construct(Library\ObjectConfig $config)
    {
        parent::__construct($config);

        $this->registerCallback('after.post'  , array($this, 'resetDatabase'));
    }

    public function getModel()
    {
        // Make sure to switch to the correct database before
        // the table is queried for information.
        $this->setDatabase($this->getRequest()->data->site);

        return parent::getModel();
    }

    public function setDatabase($db)
    {
        if (!empty($db))
        {
            $adapter = $this->getObject('lib:database.adapter.mysql');

            if ($adapter->getDatabase() != $db) {
                $adapter->setDatabase($db);
            }
        }
    }

    public function resetDatabase(Library\CommandContext $context)
    {
        $adapter = $this->getObject('lib:database.adapter.mysql');

        if ($adapter->getDatabase() != 'manager') {
            $adapter->setDatabase('manager');
        }
    }
}
