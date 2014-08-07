<?php
/**
 * Belgian Police Web Platform - Support Component
 *
 * @copyright	Copyright (C) 2012 - 2014 Timble CVBA. (http://www.timble.net)
 * @license		GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link		https://github.com/belgianpolice/internet-platform
 */

namespace Nooku\Component\Support;

use Nooku\Library;

class ControllerComment extends Library\ControllerModel
{
    public function __construct(Library\ObjectConfig $config)
    {
        parent::__construct($config);

        $this->registerCallback('after.add'  , array($this, 'forceRedirect'));
    }

    protected function _initialize(Library\ObjectConfig $config)
    {
        $config->append(array(
            'behaviors' => array(
                'editable',
                'broadcastable',
                'indexable',
                'com:activities.controller.behavior.loggable',
                'com:attachments.controller.behavior.attachable'
            )
        ));

        parent::_initialize($config);
    }

    public function _actionRead(Library\CommandContext $context)
    {
        $comment = parent::_actionRead($context);

        if ($context->request->getFormat() == 'html')
        {
            $url = clone($context->request->getUrl());
            $url->query['option'] = 'com_support';
            $url->query['view'] = 'ticket';
            $url->query['id'] = $comment->row;

            $this->getObject('application')->getRouter()->build($url);

            return $this->getObject('component')->redirect($url);
        }

        return $comment;
    }

    protected function _actionAdd(Library\CommandContext $context)
    {
        $comment = $context->request->data;

        $id     = $comment->get('row', 'int');
        $ticket = $this->getObject('com:support.database.table.tickets')->select($id, Library\Database::FETCH_ROW);

        // Agent can change the ticket status when adding a comment
        if($ticket->status != $comment->get('status', 'string'))
        {
            $ticket->setData(array('status' => $comment->get('status', 'string')))->save();
        }

        // Update the last_commented_ columns directly and bypass the modifiable behavior of the row
        if($ticket->id)
        {
            $query = $this->getObject('lib:database.query.update')
                ->table(array('tbl' => $ticket->getTable()->getBase()))
                ->values(array('tbl.last_commented_by = :by', 'tbl.last_commented_on = :on'))
                ->where('tbl.support_ticket_id = :id');

            $query->bind(array(
                'id' => $ticket->id,
                'by' => (int) $this->getObject('user')->getId(),
                'on' => gmdate('Y-m-d H:i:s')
            ));

            $ticket->getTable()->getAdapter()->update($query);
        }

        return parent::_actionAdd($context);
    }

    public function forceRedirect(Library\CommandContext $context)
    {
        // @TODO: Find out why a form with enctype='multipart/form-data' (set in attachments.upload.js)
        // never sets the redirect back to the referrer.
        // For this reason, we force the redirect here:
        $context->response->setRedirect($context->request->getReferrer());
    }
}