<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 11/1/21
 * Time: 7:12 AM
 */

class Home extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Accounts_model");
    }

    function index() {
        $user = $this->model->Accounts_model->is_logged_in();
        $this->smarty->assign("user", $user);
        $this->smarty->display("dashboard/index.tpl");
    }

}