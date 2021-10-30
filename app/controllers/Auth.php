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
    }

    function index() {
        if (! empty($this->session->data("user")))
            $this->smarty->display("login/index.tpl");
        else
            $this->smarty->display("dashboard/index.tpl");

    }

}