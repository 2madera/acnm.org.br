<?php

namespace Application\HtmlHelpers;


use Application\Core\Config;

class Fileinput {
    public static function get_html($control_id, $field_params, $control_value) {

        $name = $field_params['name'];
        $attributes = '';
        if (array_key_exists('required', $field_params)) {
            $attributes .= $field_params['required'] ? " required" : '';
        }

        $output = "<div class='form-group'>";
        $output .= '<input type="hidden" name="MAX_FILE_SIZE" value="' . Config::$upload_max_file_size . '" />';
        $output .= "<label for='$control_id'>$name</label>";
        $output .= "<input id='$control_id' name='$control_id' type='file' $attributes />";
        $output .= "</div>";
        return $output;
    }
}