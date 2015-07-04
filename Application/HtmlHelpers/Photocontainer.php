<?php

namespace Application\HtmlHelpers;


class Photocontainer {
    public static function get_html($img_url, $title = null) {

        $output = "<div>";
        $output .= "<img width='100' src='$img_url' alt='$title'>";
        $output .= "</div>";
        return $output;
    }
}