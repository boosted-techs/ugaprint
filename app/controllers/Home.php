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
        $this->model("Products_model");
    }

    function index() {
        $user = $this->model->Accounts_model->is_logged_in(false);
        $this->smarty->assign("index_page", true);
        $this->smarty->assign("user", $user);
        $this->smarty->assign("categories", $this->model->Products_model->get_categories());
        $this->smarty->assign("stories", $this->model->Products_model->get_stories());
        $this->smarty->display("dashboard/index.tpl");
    }

    function home() {
        $user = $this->model->Accounts_model->is_logged_in(false);
        $this->smarty->assign("index_page", true);
        $this->smarty->assign("user", $user);
        $this->smarty->assign("categories", $this->model->Products_model->get_categories());
        $this->smarty->assign("stories", $this->model->Products_model->get_stories());
        $this->smarty->display("dashboard/profile.tpl");
    }

    function products () {
        $user = $this->model->Accounts_model->is_logged_in(false);
        $this->smarty->assign("user", $user);
        $this->smarty->assign("categories", $this->model->Products_model->get_categories());
        $this->smarty->assign("stories", $this->model->Products_model->get_stories());
        $this->smarty->display("dashboard/products.tpl");
    }

    function shop() {
        $user = $this->model->Accounts_model->is_logged_in(false);
        $this->smarty->assign("user", $user);
        $this->smarty->assign("categories", $this->model->Products_model->get_categories());
        $this->smarty->assign("stories", $this->model->Products_model->get_stories());
        $this->smarty->display("dashboard/shop.tpl");
    }

    function profile() {
        $user = $this->model->Accounts_model->is_logged_in();
        $this->smarty->assign("no_side_bars", true);
        $this->smarty->assign("user", $user);
        $this->smarty->assign("categories", $this->model->Products_model->get_categories());
        $this->smarty->assign("stories", $this->model->Products_model->get_stories());
        $this->smarty->display("dashboard/profile.tpl");
    }

    function settings() {
        $user = $this->model->Accounts_model->is_logged_in();
        $this->smarty->assign("user", $user);
        $this->smarty->assign("categories", $this->model->Products_model->get_categories());
        $this->smarty->assign("stories", $this->model->Products_model->get_stories());
        $this->smarty->display("dashboard/settings.tpl");
    }

    function inbox() {
        $user = $this->model->Accounts_model->is_logged_in();
        $this->smarty->assign("user", $user);
        $this->smarty->assign("categories", $this->model->Products_model->get_categories());
        $this->smarty->assign("stories", $this->model->Products_model->get_stories());
        $this->smarty->display("dashboard/inbox.tpl");
    }

    function search() {
        $user = $this->model->Accounts_model->is_logged_in(false);
        $this->smarty->assign("user", $user);
        $this->smarty->assign("index_page", true);
        $this->smarty->assign("categories", $this->model->Products_model->get_categories());
        $this->smarty->assign("stories", $this->model->Products_model->get_stories());
        $this->smarty->display("dashboard/search.tpl");
    }

    function upload() {

    }

}