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

    function is_logged_in($reload = true) {
        if ($reload)
            if (empty($this->session->data->user))
                $this->redirect("//" . $this->server->server_name);

        return $this->get_account(empty($this->session->data->user) ? null : $this->session->data->user );
    }
    function get_account($user) {
        if (is_numeric($user))
            $this->db->where('auth.id', $user);
        else
            $this->db->where('auth.username', $user);
        $this->db->join("auth", "auth.id = users.id");
        return $this->db->getOne("users", "names, role,
        users.id, email, username, dob, address, auth.status, date_added,
          profile_pic, contacts, gender, country");
    }

    function get_user_profile($username) {
        return $this->get_account($username);
    }


}