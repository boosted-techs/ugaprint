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
        $search_term = $this->inputs->get("q");

        if (isset($search_term)) {
            $this->db->where("story", "%" . $search_term . "%", "like");
            $this->db->orWhere("names", "%" . $search_term . "%", 'like');
        }
        $this->db->where("status", 1);
        $this->db->join("users", "users.id = stories.user");
        $this->db->orderBy("stories.id", "desc");
        $stories = $this->db->get("stories", null, "story, names, profile_pic, image, stories.date_added, (select url from categories where id = stories.category) as cat_url, 
        (select category from categories where id = stories.category) as category, (select count(id) from comments where story = stories.id) as comments,
        (select count(id) from story_likes where story = stories.id) as likes, url, stories.date_added, (select username from auth where id = stories.user) as username");
        return $stories;
    }

    function upload_story($user) {
        $story = trim($this->inputs->post("share"));
        $category = $this->inputs->post("category");

        if (empty($story))
            return 1;
        $image = $this->upload_image();
        $image = $image ? $image : 1;
        $this->db->insert("stories",  array("image" => $image, "story" => $story, "url" => $this->password_hash(time().rand(34000000, 4000000000)), "user" => $user['id'], "category" => $category, "date_added" => date("Y-m-d")));
        return 2;
    }

    function upload_image() {
        $file_name = $_FILES['file']['name'];
        $tmp_file = $_FILES['file']['tmp_name'];
        $extension = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
        $accepted_types = array("png", "jpg", "jpeg", "gif", "webp");
        if (! is_executable($tmp_file)) {
            if (in_array($extension, $accepted_types)) {
                $image_name = hash('md5', time() . rand(0, 2000)) . "_nlb." . $extension;
                $image_path = "media/" . $image_name;
                //                if (is_dir("media/products_thumbnails/"))
                //                    echo 1;
                if (move_uploaded_file($tmp_file, $image_path))
                   return $image_name;
            }
        }
        return false;
    }

}