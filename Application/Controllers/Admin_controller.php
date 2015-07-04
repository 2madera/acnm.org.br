<?php

namespace Application\Controllers;

use Application\Models\Book;
use Application\Models\Category;
use Application\Models\Publisher;
use Application\Models\User;

class Admin_controller extends Controller_base {

    function __construct($url) {
        parent::__construct($url);
    }

    function index($url) {

        $data['book_total'] = Book::count_all();
        $data['publisher_total'] = Publisher::count_all();
        $data['category_total'] = Category::count_all();
        $data['user_total'] = User::count_all();

        parent::render_view($url, $data);
    }

//    function teste($url) {
//        $d = Book::get(50);
//        echo Form::get_html($d);
//    }
}