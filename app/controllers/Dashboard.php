<?php


class Dashboard extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->controller("Auth");
        $this->model("Adverts_model");
        $this->model("Auth_model");
        $this->model("Accounts_model");
    }

    function index($user = false) {
        $is_logged = $this->controller->Auth->logged_in();
        if (! $is_logged)
            echo json_encode(false);
        else
            echo json_encode($is_logged);
    }

    function get_adverts() {
        $r = $this->model->Adverts_model->get_adverts();
        //print_r($r);
        echo json_encode($r);
    }

    function get_latest_users() {
        if (! $this->model->Auth_model->is_logged_in())
            return false;
        $is_logged = $this->controller->Auth->logged_in();
        $response = $this->model->Accounts_model->get_accounts($is_logged['id']);
        echo json_encode($response);
    }

}