<?php

namespace Application\Models;

class Rent extends Model_base {

    public $id;
    public $created_at;
    public $leave_date;
    public $user;
    public $people;
    public $book;


    function __construct($input = null) {
        if ($input) {
            $this->id = $input->id;
            $this->created_at = $input->created_at;
            $this->leave_date = $input->leave_date;
        }
    }
}