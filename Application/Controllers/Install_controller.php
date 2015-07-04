<?php

namespace Application\Controllers;

use Application\Core\Url;
use Application\Util\Installer;

class Install_controller extends Controller_base {

    function __construct($url) {
        parent::__construct($url);
    }

    /**
     * @param Url $url
     */
    function index($url) {
        header("Content-Type:text/plain");
        Installer::install();
        exit();
    }

}