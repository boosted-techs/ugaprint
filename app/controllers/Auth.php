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
        $this->smarty->display("index.tpl");

    }

}