<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 4/29/21
 * Time: 12:30 PM
 */

class Messages_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    function save_messages($user) {
        $message = trim($this->inputs->post("message"));
        if (empty($message))
            return false;

        $staff = $this->inputs->post("staff");
        if (empty($staff))
            return false;

        $id = $this->db->rawQuery("select id from auth where id = ?", array($staff));

        if (empty($id))
            return false;
        $message = $this->security->xss_clean($message);
        $this->db->insert("messages", array("receiver" => $staff, "sender" => $user, "message" => $message, "date_sent" => date("Y-m-d")));
    }

    function get_chat($receiver, $sender) {
        $this->mark_read($receiver, $sender);
        return $this->db->rawQuery("select id, receiver, message, sender, seen, date_sent, deleted from messages where (receiver = '" . $receiver . "' and sender = '" .$sender . "') or (receiver = '" . $sender . "' and sender = '" .$receiver . "')");
    }

    function get_chats($user) {
        $this->db->pageLimit = 40;
        $page = 1;
        $this->db->where("messages.id IN (select max(messages.id) from messages group by messages.sender)");
        $this->db->where("receiver", $user);
        $this->db->orderBy("id", "desc");
        $messages = $this->db->paginate("messages", $page, "message, seen, date_sent, receiver, sender,
        (select username from auth where id = messages.sender) as username,
            (select names from users where id = messages.sender) as names");
        return $messages;
    }

    function get_new_messages($user) {
        $this->db->where("receiver", $user);
        $this->db->where("seen", 0);
        return $this->db->get("messages", null, "count(id) as unread");
    }

    function mark_read($user, $sender) {
        $this->db->where("receiver", $user);
        $this->db->where("sender", $sender);
        $this->db->update("messages", array("seen" => 1));
    }
}