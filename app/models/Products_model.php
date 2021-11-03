<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 11/3/21
 * Time: 8:12 AM
 */

class Products_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    function get_categories() {
        $this->db->where("status", 1);
        $this->db->orderBy("category", "asc");
        return $this->db->get("categories", null, "id, url, category, thumbnail");
    }

    function get_stories() {
        $this->db->where("status", 1);
        $this->db->join("users", "users.id = stories.user");
        $this->db->orderBy("stories.id", "desc");
        $stories = $this->db->get("stories", null, "story, names, profile_pic, image, stories.date_added, (select url from categories where id = stories.category) as cat_url, 
        (select category from categories where id = stories.category) as category, (select count(id) from comments where story = stories.id) as comments,
        (select count(id) from story_likes where story = stories.id) as likes, url, stories.date_added, (select username from auth where id = stories.user) as username");
        return $stories;
    }

}