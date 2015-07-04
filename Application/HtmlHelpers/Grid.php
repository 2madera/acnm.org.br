<?php

namespace Application\HtmlHelpers;


class Grid {

    public $fields;
    public $actions;
    public $object_list;
    public $url_base;

    /**
     * Gera uma grade de Visualização
     * @param $fields
     * @param $actions
     * @param $object_list
     * @param $url_base
     */
    function __construct($fields, $actions, $object_list, $url_base) {
        $this->fields = $fields;
        $this->actions = $actions;
        $this->object_list = $object_list;
        $this->url_base = $url_base;
    }

    public function get_html() {
        $output = '<table class="table table-bordered table-hover">';
        $output .= '<theader>';
        $output .= '<tr>';

        foreach ($this->fields as $field_name => $field_value) {
            $output .= "<th class='$field_name'>$field_value</th>";
        }

        $output .= "<th class='actions'>Ações</th>";
        $output .= '</tr>';
        $output .= '</theader>';
        $output .= '<tbody>';

        foreach ($this->object_list as $obj) {
            $output .= '<tr>';
            foreach ($this->fields as $field_name => $field_value) {
                $val = $obj->$field_name;
                $output .= "<td class=''>";
                if ($field_name == 'name') {
                    $view_url = $this->url_base . "/view/" . $obj->id;
                    $output .= "<a class='' href='$view_url'>";
                }
                $output .= $val;
                if ($field_name == 'name') {
                    $output .= "</a>";
                }
                $output .= "</td>";
            }
            $output .= "<td>";
            foreach ($this->actions as $action => $name) {
                $view_edit = $this->url_base . "/$action/" . $obj->id;
                $output .= "<a href='$view_edit' class='btn btn-xs btn-default'>$name</a>";
            }
            $output .= "<input type='hidden' id='id' value='" . $obj->id . "' />";
            $output .= "</td>";
            $output .= '</tr>';
        }

        $output .= '</tbody>';
        $output .= '</table>';
        return $output;
    }


}