<?php

namespace Application\HtmlHelpers;


class Dropdownlist {
    public static function get_html($control_id, $field_params, $control_value) {

        $name = $field_params['name'];

        $output = "<div class='form-group'>";
        $output .= "<label for='$control_id'>$name</label>";
        $output .= "<select id='$control_id' name='$control_id' class='form-control' >";
        $output .= "<option value='0'>Selecione um item</option>";
        $collection = "Application\\Models\\" . $field_params['object'];
        $my_class = new $collection();
        $my_collection = $my_class::get_all();
        foreach ($my_collection as $item) {
            $selected = ($control_value == $item->id) ? "selected='selected'" : "";
            $output .= "<option $selected value='$item->id'>$item->name</option>";
        }
        $output .= "</select>";
        $output .= "</div>";
        return $output;
    }
}