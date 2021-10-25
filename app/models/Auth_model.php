<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-07-31
 * Time: 13:50
 */

class Auth_model extends Model{
    function __construct()
    {
        parent::__construct();
    }

    public $security_key;

    function add_security_key() {
        $this->security_key = "BOOSTED-TECHS XYZ !!7898788987889 978686757!@#$%^&*((*&^" . date("Y-m-d");
    }

    function verify_user($email, $password) {
        $this->db->where("(email = ? or username = ?)", array($email, $email));
        $this->db->where("password", $password);
        $data = $this->db->getOne("user_logins", "id") ?? false;
        if ($data) {
            //$this->save_logs($data['id'], "Logged in system");
            $this->save_user_login_tokens($data['id']);
        }
        return $data;
    }

    function validate_password() {
        $email = $this->session->data->login_email;
        if (empty($email))
            return "An error occurred. Try again later";
        $password = $this->inputs->post("password");
        $this->db->where("email", $email);
        $this->db->where("password", $this->password_hash($password));
        $user = $this->db->getOne("user_logins", "id, status");
        if ($user) {
            if ($user['status'] == 2) {
                $this->save_user_login_tokens($user['id']);
                return true;
            } else
                return "Account not verified. Please check your email to for verification link";
        }
        return "Password incorrect";
    }

    function save_logs($user, $log, $type = 1) {
        $data = array("user" => $user, "log" => $log, "log_type" => $type);
        $this->db->insert("user_logs", $data);
    }

    function save_user_login_tokens($user) {
        $token = $this->password_hash(time().$user.rand(100, 500));
        $this->db->insert("secure_login_token", array("user" => $user, "token" => $token));
        $this->cookie->set("secure_login_token", $token);
    }

    function delete_session() {
        $this->cookie->destroy();
    }

    function is_logged_in() {
        return empty($this->cookie->cookie->secure_login_token) ? false : true;
    }

    function get_user_by_cookie() {
        $this->db->where("token", $this->cookie->cookie->secure_login_token);
        return $this->db->getValue("secure_login_token", "user");
    }

    function get_user_basic_information($user) {
        $this->db->where("user_logins.id", $user);
        $this->db->join("basic_info", "basic_info.user = user_logins.id", "left");
        return $this->db->getOne("user_logins", "user_logins.email, username, status, names, telephone, dob, image, gender, verified");
    }

    function get_districts() {
        $this->db->orderBy("district", "asc");
        return $this->db->get("districts", null, "id, district");
    }

    function create_recovery_token($post_data) {
        $email = $this->xss_clean(trim($post_data));
        if (empty($email))
            return false;

        $data = $this->db->rawQuery("select user_logins.id, user_logins.email, names from user_logins left join basic_info on basic_info.user = user_logins.id where  user_logins.email = ?", array($email));
        if ($data) {
            $token = $this->send_recovery_mail($data[0]);
            $data[0]['token'] = $token;
        }
        return $data;
    }

    function send_recovery_mail($data) {
        $token = $this->password_hash($data['email'] . $data['id'] . time());
        $time = time() + 1000;
        $this->db->insert("account_recovery", array("user" => $data['id'], "token" => $token, "expiry_time" => $time, "date_created" => date("Y-m-d")));
        $this->save_logs($data['id'], "Requested for password reset", 12);
        return $token;
    }

    function validate_token($token) {
        $this->db->where("token", $token);
        $this->db->where("used_token", 0);
        //$this->db->where("expiry_time", time(), ">=");
        return $this->db->getOne("account_recovery", "id, user");
    }

    function update_token($user, $id) {
        $this->db->rawQuery("update account_recovery set used_token  = 1 where id = ? and user = ?", array($id, $user));
        $this->save_logs($id, "Reset password", 13);
        return true;
    }

    function create_security_key($string) {
        return $this->password_hash($string . $this->security_key );
    }

    function verify_security_key($string, $key) {
        return strcmp($this->password_hash($string . $this->security_key), $key) == 0 ? $key : false;
    }

    function get_city_location($string) {
        if (strlen(trim($string) < 2))
            return false;
        //print_r($string); die();
        //$params  = [$string, $string, $string];
        return $this->db->Query("(select city, id, country from country_list where (city like '%$string%' or country like '%$string%' or city_ascii like '%$string%') order by city asc limit 20)");
    }
}