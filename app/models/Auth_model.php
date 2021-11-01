<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 10/31/21
 * Time: 3:55 PM
 */

class Auth_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    function create_account()
    {
        $email = $this->inputs->post("email");
        $contacts = $this->inputs->post("contact");
        $password = $this->inputs->post("password");
        $location = $this->inputs->post("address");
        $gender = $this->inputs->post("gender");
        $dob = $this->inputs->post("date");
        $country = $this->inputs->post("sortby");
        $names = $this->inputs->post("names");

        if (! preg_match("/^[a-zA-Z-' ]*$/",$names) or empty($names) or strlen($names) < 3)
            return "Only%20letters%20and%20white%20space%20allowed";
        if ($this->is_email_exists($email))
            return "Email%20address%20either%20exists%20or%20is%20invalid.%20Try%20again%20with%20another%20email%20address";

//        $age = date_diff(date_create($dob), date_create('now'))->y;
//        if ($age < 18 or $age > 100)
//            return "Invalid date of birth. Try again with correct date format";
        if (empty($password) or strlen($password) < 5)
            return "Password should be of 5 characters and above";
        $user_name = $this->check_url_for_duplicates(strtolower(explode(" ", $names)[0]), "auth", "username");
        $id = $this->db->insert("auth", array("email" => $email, "password" => $this->password_hash($password), "username" => $user_name, "date_added" => date("Y-m-d")));
        $this->db->insert("users", array("id" => $id, "contacts" => $contacts, "names" => $names, "address" => $location, "dob" => $dob, "gender" => $gender, "country" => $country));
        return $id;
    }

    function is_email_exists($email) {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL))
            return true;

        $this->db->where("email", $email);
        return $this->db->getOne("auth", "id");
    }

    function check_url_for_duplicates($url, $table, $column) {
        $this->db->where($column,  $url);
        $this->db->orderBy($column, 'desc');

        $query = $this->db->get($table, null, array($column));
        if (empty($query))
            $url = $url;
        else{
            $url_string = explode("-", $url);
            $url_counter = end($url_string);
            if (is_numeric($url_counter))
                $url_counter++;
            else
                $url_counter = $url_counter."-1";
            array_pop($url_string);
            array_push($url_string, $url_counter);
            $url = implode("-", $url_string);
            $url = $this->check_url_for_duplicates($url, $table, $column);
        }
        return $url;
    }

    function verify_user($email, $password) {
        $this->db->where("(email = ? or username = ?)", array($email, $email));
        $this->db->where("password", $this->password_hash($password));
        $data = $this->db->getOne("auth", "id") ?? false;
        if ($data) {
            //$this->save_logs($data['id'], "Logged in system");
            $this->session->set_user_data("user", $data['id']);
        }
        return $data ? $data['id'] : "Incorrect%20details.%20Try%20again%20later.";
    }

}