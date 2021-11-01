<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 11/1/21
 * Time: 7:27 AM
 */

class Accounts_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    function is_logged_in() {
        if (empty($this->session->data->user))
            $this->redirect("//" . $this->server->server_name);

        return $this->get_account($this->session->data->user);
    }
    function get_account($user) {
        $this->db->where('auth.id', $user);
        $this->db->join("auth", "auth.id = users.id");
        return $this->db->getOne("users", "names, role,
        users.id, email, username, dob, address, auth.status, date_added,
          profile_pic, contacts, gender, country");
    }


}