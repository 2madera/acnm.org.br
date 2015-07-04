<?php

namespace Application\Controllers;

use Application\Core\Security;
use Application\Core\Url;

class Login_controller extends Controller_base {

    /**
     * @param Url $url
     */
    function index($url) {
        $url->redirect('login/login');
    }

    /**
     * @param Url $url
     */
    function login($url) {
        $username = $url->get_param('username');
        $password = $url->get_param('password');
        $method = $url->get_param('method');
        if ($method && $method === 'login') {
            if (Security::authenticate($username, $password)) {
                Url::redirect("admin");
            }
        }
        parent::render_view($url);
    }

    /**
     * @param Url $url
     */
    function logout($url) {
        Security::unauthenticate();
        Url::redirect("home");
    }

}