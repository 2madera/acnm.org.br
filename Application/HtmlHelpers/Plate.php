<?php

namespace Application\HtmlHelpers;


use Application\Descriptors\Descriptor;
use Application\Core\Url;

class Plate {
    public static function get_html($class, $action = "", $buttons = null) {

        $url = new Url();
        $url_address = $url->make($action);

        $output = "<div>";
        $description = Descriptor::get($class);
        foreach ($description['fields'] as $field => $field_params) {
            if ($field_params['editable']) {
                switch ($field_params['type']) {
                    case "string":
                        $output .= "<p>" . $field_params['name'] . ": " . $class->$field . "</p>";
                        break;
                    case "text":
                        $output .= "<p>" . $field_params['name'] . ": " . $class->$field . "</p>";
                        break;
                    case "datetime":
                        $output .= "<p>" . $field_params['name'] . ": " . $class->$field . "</p>";
                        break;
                    case "bool":
                        $output .= "<p>" . $field_params['name'] . ": " . $class->$field . "</p>";
                        break;
                    case "object":
                        $output .= "<p>" . $field_params['name'] . ": " . $class->$field . "</p>";
                        break;
                    case "index":
                        $output .= "<p>" . $field_params['name'] . ": " . $class->$field . "</p>";
                        break;
                    case "photo":
                        $output .= Photocontainer::get_html($url->make("uploads/" . $class->$field), $field_params['name']);
                        break;
                    default:
                        $output .= "<p>" . $field_params['name'] . ": " . $class->$field . "</p>";
                }
            }
        }
        $output .= "</div>";
        return $output;
    }
}