<?php


class Accounts_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    function create_account() {
        $email = trim($this->inputs->post("email"));
        $names = trim($this->inputs->post("names"));
        $password = trim($this->inputs->post("password"));
        $location = trim($this->inputs->post("location"));
        $gender = trim($this->inputs->post("gender"));
        $gender = $gender == "male" ? 1 : 2;
        $dob = trim($this->inputs->post("dob"));
        /*
         * Check if name is a valid name
         */
        if (!preg_match("/^[a-zA-Z-' ]*$/",$names))
            return "Only letters and white space allowed";
        if ($this->is_email_exists($email))
            return "Email address either exists or is invalid. Try again with another email address";
        if (! $this->verify_location($location))
            return "Invalid Location";
        $age = date_diff(date_create($dob), date_create('now'))->y;
        if ($age < 18 or $age > 100)
            return "Invalid date of birth. Try again with correct date format";
        if (empty($password) or strlen($password) < 5)
            return "Password should be of 5 characters and above";
        $user_name = $this->check_url_for_duplicates(strtolower(explode(" ", $names)[0]), "basic_info", "username");
        $token =  $this->password_hash($email.time().$user_name);
        $id = $this->db->insert("user_logins", array("email" => $email, "password" => $this->password_hash($password), "status" => 1, "login_token" => $token));
        $this->db->insert("basic_info", array("user" => $id, "names" => $names, "email" => $email, "country" => $location, "dob" => $dob, "gender" => $gender, "username" => $user_name));
        $this->check_profile_progress($id);
        return array("email" => $email, "token" => $token, "username" => $user_name, "names" => $names);
    }

    function verify_location($location) {
        $this->db->where("id", $location);
        return $this->db->getOne("country_list", "id");
    }

    function is_email_exists($email) {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL))
           return true;

        $this->db->where("email", $email);
        return $this->db->getOne("user_logins", "id");
    }

    function check_profile_progress($user) {
        $this->db->where("user", $user);
        $a = $this->db->getValue("general_information", "id");
        if (empty($a))
            $this->db->insert("general_information", array("user" => $user));

        $this->db->where("user", $user);
        $b = $this->db->getValue("appearance", "id");
        if (empty($b))
            $this->db->insert("appearance", array("user" => $user));

        $this->db->where("user", $user);
        $c = $this->db->getValue("life_style", "id");
        if (empty($c))
            $this->db->insert("life_style", array("user" => $user));

        $this->db->where("user", $user);
        $username = $this->db->get("basic_info", null, "username, names");
        if (! empty($username[0]['username']))
            return true;
        //print_r($username);
        $username = $this->check_url_for_duplicates(
            strtolower(
                $this->remove_special_chars(
                    $this->remove_none_utf_char($username[0]['names'])
                )
            ), "basic_info", "username"
        );
        $this->db->where("user", $user);
        $this->db->update("basic_info", array("username" => $username));
        return true;
    }

    function check_url_for_duplicates($url, $table, $column) {
        $this->db->where($column,  $url);
        $this->db->orderBy($column, 'desc');

        $query = $this->db->get($table, null, array($column));
        if (empty($query))
            $url = $url;
        else{
            $url_string = explode("-", $url);
            $url_counter = end($url_string);
            if (is_numeric($url_counter))
                $url_counter++;
            else
                $url_counter = $url_counter."-1";
            array_pop($url_string);
            array_push($url_string, $url_counter);
            $url = implode("-", $url_string);
            $url = $this->check_url_for_duplicates($url, $table, $column);
        }
        return $url;
    }

    function get_about_user_progress($user) {
        $this->db->where("general_information.user", $user);
        $this->db->join("appearance", "appearance.user = general_information.user");
        $this->db->join("life_style", "life_style.user = general_information.user");
        return $this->db->get("general_information",
            1,
            "appearance.complete as appearance, 
        life_style.complete as life_style, general_information.complete as general");
    }

    function update_profile($user) {
        $change_type = $this->inputs->post("type");
        if ($change_type == 1)
            $this->update_profile_description($user);
        elseif ($change_type == 2)
            $this->update_user_appearance($user);
        elseif ($change_type == 3)
            $this->update_user_life_style($user);
    }

    function update_profile_description($user) {
        $heading = $this->replace_multiple_spaces($this->xss_clean($this->remove_none_utf_char($this->inputs->post("heading"))));
        $description = $this->replace_multiple_spaces($this->xss_clean($this->remove_none_utf_char($this->inputs->post("description"))));
        $match = $this->replace_multiple_spaces($this->xss_clean($this->remove_none_utf_char($this->inputs->post("match"))));
        $this->db->where("user", $user);
        $this->db->update("general_information", array("profile_heading" => $heading,
            "short_description" => $description,
            "looking_for" => $match,
            "complete" => 1));
        return true;
    }

    function profile_get_description($user) {
        $this->db->where("user", $user);
        return $this->db->get("general_information", 1, "profile_heading, short_description, looking_for, complete, timestamp");
    }

    function update_user_appearance($user) {
        $this->db->where("user", $user);
        $this->db->update("appearance", array(
            "hair_color" => $this->inputs->post("hair-color"), "hair_type" => $this->inputs->post("hair-type"),
            "hair_length" => $this->inputs->post("hair-length"), "eye_color" => $this->inputs->post("eye-color"),
            "eye_wear" => $this->inputs->post("eye-wear"), "height" => $this->inputs->post("height"),
            "weight" => $this->inputs->post("weight"), "body_type" => $this->inputs->post("body-type"),
            "ethnicity" => $this->inputs->post("ethnicity"),
            "facial_hair" => $this->inputs->post("facial_hair"),
            "best_feature" => $this->inputs->post("best-feature"),
            "body_art" => $this->inputs->post("body-art"),
            "appearance_rate" => $this->inputs->post("appearance"),
            "user" => $user,
            "complete" => 1
        ));
        $this->redirect("//". $this->server->server_name . "/profile/life-style");
    }

    function get_user_appearance($user) {
        $this->db->where("user", $user);
        return $this->db->get("appearance", 1,
            "hair_color, hair_type, hair_length, eye_color, eye_wear, height, weight, 
            body_type, ethnicity, facial_hair, best_feature, body_art, appearance_rate
            ");
    }
    function update_user_life_style($user) {
        $currency = $this->replace_multiple_spaces($this->xss_clean($this->remove_none_utf_char($this->inputs->post("currency"))));
        $income = $this->replace_multiple_spaces($this->xss_clean($this->remove_none_utf_char($this->inputs->post("income"))));
        $drink = $this->xss_clean($this->inputs->post("drink"));
        $smoke = $this->xss_clean($this->inputs->post("smoke"));
        $marital_status = $this->xss_clean($this->inputs->post("marital-status"));
        $children_status = $this->xss_clean($this->inputs->post("children-status"));
        $children_no = $this->xss_clean($this->inputs->post("children-no"));
        $max_age = $this->xss_clean($this->inputs->post("age-oldest"));
        $min_age = $this->xss_clean($this->inputs->post("age-youngest"));
        $more_children = $this->xss_clean($this->inputs->post("more_children"));
        $pets_have = $this->inputs->post("petsHave");
        $occupation = $this->xss_clean($this->inputs->post("occupation"));
        $occupation_status = $this->xss_clean($this->inputs->post("occupation-status"));
        $home_type = $this->xss_clean($this->inputs->post("home-type"));
        $home_situation = $this->xss_clean($this->inputs->post("home-situation"));
        $relocation = $this->xss_clean($this->inputs->post("relocation"));
        $interest = $this->inputs->post("interest");

        if (! empty($interest))
            $interest = implode($interest, ", ");
        if (! empty($pets_have))
            $pets_have = implode($pets_have, ", ");
        $this->db->where("user", $user);
        $this->db->update("life_style",
            array("drinker" => $drink, "smoker" => $smoke, "marital_status" => $marital_status,
                "children" => $children_status, "oldest_child" => $max_age, "youngest_child" => $min_age,
                "more_children" => $more_children,"pets" => $pets_have,
                "children_no" => $children_no, "employment" => $occupation,
                "employment_status" => $occupation_status,"income" => $income,
                "currency" => $currency,"home_type" => $home_type,
                "home_situation" => $home_situation,"relocation" => $relocation,
                "interest" => $interest, "complete" => 1));
        $this->redirect("//". $this->server->server_name . "/profile");
    }

    function get_user_life_style($user) {
        $this->db->where("user", $user);
        return $this->db->get("life_style", 1,
            "drinker, smoker, marital_status, children, oldest_child, oldest_child, youngest_child,
         more_children,
         pets,
         children_no,
         employment,
            employment_status,
                income,
                 currency,
                 home_type,
                 home_situation,
                 relocation,
                 interest,
                 complete
         ");
    }

    function get_accounts($user = false, $activated = true, $limit = 10) {
        if ($activated)
            $this->db->where("status", 2);
        if ($user)
            $this->db->where("basic_info.id", $user, "!=");
        
        $this->db->join("basic_info", "basic_info.user = user_logins.id", "left");
        $this->db->join("country_list", "country_list.id = basic_info.country", "left");
        $this->db->orderBy("user_logins.id", "desc");
        return $this->db->get("user_logins", 10, "user_logins.id, username, names, country_list.country, country_list.city, image, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age");
        //echo $this->db->getLastError();
    }

}