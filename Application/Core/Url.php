<?php

namespace Application\Core;


class Url {

    /**
     * @var string
     */
    public $controller;

    /**
     * @var string
     */
    public $action;

    /**
     * @var string
     */
    public $index;

    /**
     * @var array
     */
    private $url_params;

    /**
     * @var array
     */
    public $post_params;

    function __construct() {

        $url_query = isset($_REQUEST[Config::$htaccess_param]) ? $_REQUEST[Config::$htaccess_param] : '';

        $url_params = explode('/', $url_query);

        $url_params = $this->clean_params($url_params);

        $post_params = $this->clean_post_params($_POST);

        $param_count = count($url_params);

        $this->controller = Config::$default_controller;
        $this->action = Config::$default_action;
        $this->index = null;

        if ($param_count > 0) {
            $this->controller = array_shift($url_params);
        }

        if ($param_count > 1) {
            $this->action = array_shift($url_params);
        }

        if ($param_count > 2) {
            $this->index = array_shift($url_params);
        }

        $this->url_params = $url_params;

        $this->post_params = $post_params;

    }

    /**
     * @param Array $params
     * @return Array mixed
     */
    private function clean_params($params) {
        for ($i = 0; $i < count($params); $i++) {
            $params[$i] = preg_replace('[A-Za-z0-9-]', '', $params[$i]);
            //$params[$i] = htmlentities($params[$i], ENT_QUOTES);
        }
        $params = array_filter($params);
        return $params;
    }

    private function clean_post_params($post_params) {

        foreach ($post_params as $i => $param) {
            $post_params[$i] = preg_replace('[A-Za-z0-9-]', '', $post_params[$i]);
        }

        return $post_params;
    }

    /**
     * Get param from POST inputs
     * @param Int $index index of param
     * @return String|null Param string of null
     */
    public function get_param($index) {
        if (isset($this->post_params[$index])) {
            return $this->post_params[$index];
        } else {
            return null;
        }
    }

    /**
     * Get param from URL
     * @param $index
     * @return String|null Param string of null
     */
    public function get_url_param($index) {
        if (isset($this->url_params[$index])) {
            return $this->url_params[$index];
        } else {
            return null;
        }
    }

    /**
     * Make Url to anyplace in website
     * @param String $address
     * @return string
     */
    public function make($address = null) {
        return Config::$site_url . '/' . $address;
    }

    /**
     * Redirect page to a internal URL
     * @param String $address
     */
    public static function redirect($address = null) {
        $address = Config::$site_url . "/" . $address;
        header("Location:$address");
        exit();
    }
}