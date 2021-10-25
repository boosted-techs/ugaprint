<?php
class Media_model extends Model {
    function __construct() {
        parent::__construct();
    }

    function get_latest_media($deleted = false) {
        if (! $deleted)
            $this->db->where("deleted", 0);
        $this->db->join("basic_info", "basic_info.user = user_images.user", "left");
        $this->db->orderBy("user_images.timestamp", "desc");
        return $this->db->get("user_images", 20, "names, basic_info.image as profile, (select username from user_logins where id = basic_info.user) as username,
        user_images.description, user_images.time_added, profile_pic, user_images.image, 
        (select count(id) from user_image_likes where user_image_likes.image = user_images.id) as likes");
    }
}