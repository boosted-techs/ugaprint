<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 4/29/21
 * Time: 11:04 AM
 */

class Messages extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Accounts_model");
        $this->model("Products_model");
        $this->model("Messages_model");
    }

    function index() {
        $user = $this->model->Accounts_model->is_logged_in(false);

        $this->smarty->assign("user", $user);
        $this->smarty->assign("categories", $this->model->Products_model->get_categories());
        $this->smarty->assign("stories", $this->model->Products_model->get_stories());
        $this->smarty->assign("messages", $this->model->Messages_model->get_chats($user['id']));
        $this->smarty->display("dashboard/inbox.tpl");
    }

    function inbox($username) {
        $user = $this->model->Accounts_model->is_logged_in(false);

        $this->smarty->assign("user", $user);
        $this->smarty->assign("categories", $this->model->Products_model->get_categories());
        $this->smarty->assign("stories", $this->model->Products_model->get_stories());

        $user_profile = $this->model->Accounts_model->get_user_profile(! empty($username)? $username : $user['username']);

        if ($user_profile['id'] == $user['id'])
            die(print("Sender and receiver are the same"));

        $inbox = $this->model->Messages_model->get_chat($user['id'], $user_profile['id']);
        $this->smarty->assign("inbox", $this->get_chat($user, $user_profile, $inbox));
        $this->smarty->display("messages/inbox.tpl");
    }

    function save() {
        $user = $this->model->Accounts_model->is_logged_in(false);
        $this->model->Messages_model->save_messages($user['id']);
    }

    private function get_chat($user_bio, $staff, $inbox) {
        $this->smarty->assign("user_bio", $user_bio);
        $this->smarty->assign("staff", $staff);
        $this->smarty->assign("inbox", $inbox);
        return $this->smarty->fetch("messages/chat.tpl");
    }

    function update_chat($username) {
        $user = $this->model->Accounts_model->is_logged_in(false);
        $user_profile = $this->model->Accounts_model->get_user_profile(! empty($username)? $username : $user['username']);
        $inbox = $this->model->Messages_model->get_chat($user['id'], $user_profile['id']);
        $messages = $this->get_chat($user, $user_profile, $inbox);
        $check_sum = md5($messages);
        echo json_encode(array("messages" => $messages, "checksum_code" => $check_sum));
    }

    function notifications() {
        $this->model->Auth_model->is_logged_in();
        $user_id = $this->model->Auth_model->get_user_by_cookie();
        $user_bio = $this->model->Auth_model->get_user_basic_information($user_id);

        $inbox = $this->model->Messages_model->get_new_messages($user_bio['id']);

        $check_sum = md5(json_encode($inbox));
        echo json_encode(array("messages" => $inbox[0]['unread'], "checksum_code" => $check_sum));
    }


}