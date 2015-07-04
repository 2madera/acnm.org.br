<?php

namespace Application\HtmlHelpers;


class Checkbox {
    public static function get_html($control_id, $field_params, $control_value) {

        $name = $field_params['name'];

        $output = "<div class='checkbox'>";
        $output .= "<label for='$control_id'>";
        $checked = '';
        if ($control_value == null) {
            if (array_key_exists('default', $field_params)) {
                $checked = ($field_params['default']) ? "checked='checked'" : "";
            }
        } else {
            $checked = ($control_value == 1) ? "checked='checked'" : "";
        }

        $output .= "<input id='$control_id' name='$control_id' type='checkbox' $checked />";
        $output .= "$name</label></div>";
        return $output;
    }

}