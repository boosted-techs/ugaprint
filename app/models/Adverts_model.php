<?php
class Adverts_model extends Model {
    function __construct () {
        parent::__construct();
    }

    function get_adverts() {
        $this->db->where("status", 1);
        $this->db->orderBy("id", "desc");
        return $this->db->get("adverts", 10, "company, title, link, description, id, image");
    }
}