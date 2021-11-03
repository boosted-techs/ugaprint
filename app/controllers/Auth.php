<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 10/29/21
 * Time: 10:47 PM
 */

class Auth extends  Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Auth_model");
    }

    function index() {
        if (! empty($this->session->data("user")))
            $this->redirect("//" . $this->server->server_name . "/home");
        $this->smarty->display("login/index.tpl");
    }

    function create_account() {
        if (! empty($this->session->data("user")))
            $this->redirect("//" . $this->server->server_name . "/home");
        else {
            $i = $this->model->Auth_model->create_account();
            if (is_numeric($i)) {
                $this->session->set_user_data("user", $i);
                $this->redirect("//" . $this->server->server_name . "/home");
            } else
                $this->redirect("//" . $this->server->server_name . "/auth?error=" . $i);

        }
    }

    function login() {
        $i = $this->model->Auth_model->verify_user($this->inputs->post->email, $this->inputs->post->password);
        if (is_numeric($i))
            $this->redirect("//" . $this->server->server_name . "/home");
        else
            $this->redirect("//" . $this->server->server_name . "/auth?error=" . $i);
    }

    function logout() {
        $this->session->destroy();
        $this->redirect("//" . $this->server->server_name);
    }

}