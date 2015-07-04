<?php

namespace Application\Models;

class Category extends Model_base {

    public $id;
    public $name;

    function __construct($input = null) {
        if ($input) {
            $this->id = $input->id;
            $this->name = $input->name;
        }
    }
}