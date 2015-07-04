<?php

namespace Application\HtmlHelpers;


class Textarea {
    public static function get_html($control_id, $field_params, $control_value) {

        $name = $field_params['name'];
        $attributes = '';
        if (array_key_exists('required', $field_params)) {
            $attributes .= $field_params['required'] ? ' required' : '';
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
        $output .= "<textarea style='resize: none' rows='6' id='$control_id' name='$control_id' class='form-control' $attributes >$control_value</textarea>";
        $output .= "</div>";
        return $output;
    }
}