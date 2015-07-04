<?php

namespace Application\HtmlHelpers;


use Application\Descriptors\Descriptor;
use Application\Core\Url;

class Form {
    public static function get_html($class, $action = "", $buttons = null) {

        $url = new Url();
        $url_address = $url->make($action);

        $enctype = 'text/plain';

        $form_content = '';
        $description = Descriptor::get($class);
        foreach ($description['fields'] as $field => $field_params) {
            if ($field_params['editable']) {
                switch ($field_params['type']) {
                    case "string":
                        $form_content .= Textinput::get_html($field, $field_params, $class->$field);
                        break;
                    case "text":
                        $form_content .= Textarea::get_html($field, $field_params, $class->$field);
                        break;
                    case "datetime":
                        $form_content .= Datepicker::get_html($field, $field_params, $class->$field);
                        break;
                    case "bool":
                        $form_content .= Checkbox::get_html($field, $field_params, $class->$field);
                        break;
                    case "object":
                        $form_content .= Dropdownlist::get_html($field, $field_params, $class->$field);
                        break;
                    case "index":
                        $form_content .= Hiddenfield::get_html($field, $field_params, $class->$field);
                        break;
                    case "photo":
                        $enctype = "multipart/form-data";
                        $form_content .= Fileinput::get_html($field, $field_params, $class->$field);
                        break;
                    case "file":
                        $enctype = "multipart/form-data";
                        $form_content .= Fileinput::get_html($field, $field_params, $class->$field);
                        break;
                    default:
                        $form_content .= Textinput::get_html($field, $field_params, $class->$field);
                }
            }
        }

        $form = "<form class='validator' method='post' enctype='$enctype' action='$url_address'>";

        if (!$buttons) {
            $form_content .= "<button class='btn btn-default' type='submit'>Salvar</button>";
        }
        $form .= $form_content;
        $form .= "</form>";
        return $form;
    }
}