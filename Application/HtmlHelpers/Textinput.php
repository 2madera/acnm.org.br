<?php

namespace Application\HtmlHelpers;


class Textinput {
    public static function get_html($control_id, $field_params, $control_value) {

        $name = $field_params['name'];
        $attributes = '';
        if (array_key_exists('required', $field_params)) {
            $attributes .= $field_params['required'] ? " required" : '';
        }
        if (array_key_exists('regex', $field_params)) {
            $pattern = $field_params['regex'];
            $attributes .= " pattern='$pattern'";
        }
        if (array_key_exists('mask', $field_params)) {
            $pattern = $field_params['mask'];
            $attributes .= " data-mask='$pattern'";
        }


        $output = "<div class='form-group'>";
        $output .= "<label for='$control_id'>$name</label>";
        $output .= "<input id='$control_id' name='$control_id' type='text' class='form-control' value='$control_value' $attributes />";
        $output .= '<div class="help-block with-errors"></div>';
        $output .= "</div>";
        return $output;
    }
}