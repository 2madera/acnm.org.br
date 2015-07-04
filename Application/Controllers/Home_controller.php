<?php

namespace Application\Controllers;

class Home_controller extends Controller_base {

    function index($url) {
        parent::render_view($url);
    }

    function historia($url){
        parent::render_view($url);
    }

    function sobre($url){
        parent::render_view($url);
    }

    function contato($url){
        parent::render_view($url);
    }

}