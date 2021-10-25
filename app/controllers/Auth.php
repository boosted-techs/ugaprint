<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-07-31
 * Time: 09:17
 */
class Auth extends Controller
{
    function __construct() {
        parent::__construct();
        $this->model("Mail_model");
        $this->model("Auth_model");
        $this->model("Accounts_model");
   }

    function index() {
       if (! isset($this->cookie->cookie->secure_login_token))
            $this->smarty->assign("login_btn", true);
        $this->session->set_user_data("account_creation", time());
        $this->smarty->display("login/index.tpl");
    }

    function search_location() {
        $location  = $this->inputs->post("locationString");
        echo json_encode($this->model->Auth_model->get_city_location($location));
    }

    function sign_in() {
        $email = strtolower(trim($this->inputs->post("email")));
        $password = $this->password_hash($this->inputs->post("password"));
        echo json_encode($this->model->Auth_model->verify_user($email, $password));
    }

    function sign_out() {
        $this->cookie->destroy();
        $this->redirect("//" . $this->server->server_name);
    }

    function logged_in() {
        if (! $this->model->Auth_model->is_logged_in())
            return false;
        return $this->model->Auth_model->get_user_basic_information($this->model->Auth_model->get_user_by_cookie());
    }

    function forgot_password() {
        if (isset($this->cookie->cookie->secure_login_token))
            $this->redirect("//" . $this->server->server_name . "/dashboard");

        else {
            //$this->session->set_user_data("account_creation", time());
            $this->smarty->display("login/forgot-password.tpl");
        }
    }

    function send_recovery_mail() {
        $response = $this->model->Auth_model->create_recovery_token($this->inputs->post("email"));
        if ($response) {
            $message = "Hello, " . $response[0]['names'] . ", You have requested for a password reset. Click on this link to change your password.
            <br/>THIS LINK EXPIRES AFTER SOME SHORT PERIOD.";
            $message .= "<br/>";
            $message .= "<a href='http://" . $this->server->server_name . "/recover-password/" . $response[0]['token'] . "'>CHANGE PASSWORD </a>";
            $message .= "<br/><hr/>";
            $message .= "To login, click on this link below.";
            $message .= "<br/>";
            $message .= "<a href='http://" . $this->server->server_name ."'>LOGIN</a>";
            $message .= "<br/>If you think this mail came in error, try to ignore it or report the issue to the system administrator";

            $this->smarty->assign("message", $message);
            $message = $this->smarty->fetch("mail_template/mail.tpl");
            $this->model->Mail_model->send_mail($response[0]['email'], $message, "Class example 2021");
            $response = true;
        } else
            $response = "An error occurred";
        echo json_encode($response);
    }

    function reset_password($token) {
        $response = $this->model->Auth_model->validate_token($token);
        //print_r( $response); die();
        if ($response) {
            $this->session->set_user_data("password_reset", time());
            $this->smarty->assign("user_details", $this->model->Auth_model->get_user_basic_information($response['user']));
        }
        $this->smarty->assign("user_token", $response);
        $this->smarty->display("login/reset-password.tpl");
    }

    function change_passwords() {
        //echo json_encode(false);
        //print_r($this->inputs->post());

            if (strcmp($this->inputs->post("password"), $this->inputs->post("password2")) == 0) {
                $this->model("Staff_model");
                if ($this->model->Staff_model->update_user_password($this->inputs->post("uid"))) {
                    $this->model->Auth_model->update_token($this->inputs->post("uid"), $this->inputs->post("token"));
                    echo true;
                }
                else
                    echo false;
            }else
                echo false;
    }

    function solve() {
        $string = "c n a w r e";
        //phpinfo(); die();
        $string = explode(" ", $string);
        //$pspell_link = pspell_new("en");
        $this->pc_permute($string);
    }

    function pc_permute($items,  $perms = array( )) {
        if (empty($items)) {

            $word = join('', $perms);
                echo "<center><h1>";
                print  $word . "\n <br/>";
                echo "</center></h1>";

        }  else {
            for ($i = count($items) - 1; $i >= 0; --$i) {
                $newitems = $items;
                $newperms = $perms;
                list($foo) = array_splice($newitems, $i, 1);
                array_unshift($newperms, $foo);
                $this->pc_permute($newitems,  $newperms);
            }
        }
    }

    function login()
    {
        $is_logged = $this->logged_in();
        if ($is_logged)
            $this->redirect("../p/");
        $this->smarty->display("login/login.tpl");
    }

    function validate_email() {
        if (! empty($this->session->data->login_email) && strcmp($this->session->data->login_email,$this->inputs->post("email")) == 0) {
            $response = true;
        } else {
            $response = $this->model->Accounts_model->is_email_exists(trim($this->inputs->post("email")));
            if ($response) {
                $this->session->set_user_data("login_email", trim($this->inputs->post("email")));
                $response = true;
            } else {
                $response = false;
            }
        }
        echo json_encode($response);
    }

    function validate_password() {
        $response  = false;
        if (! empty($this->session->data->login_email)) {
            $response = $this->model->Auth_model->validate_password();
        }
        echo json_encode($response);
    }
}