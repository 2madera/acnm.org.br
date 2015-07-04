<?php

namespace Application\HtmlHelpers;


class Hiddenfield {
    public static function get_html($control_id, $field_params, $control_value) {

        $name = $field_params['name'];

        $output = "<input id='$control_id' name='$control_id' type='hidden' value='$control_value'/>";
        return $output;
    }
}