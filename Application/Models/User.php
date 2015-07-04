<?php

namespace Application\Models;

class User extends Model_base {

    public $id;
    public $name;
    public $email;
    public $login;
    public $pwrd;
    public $is_admin;
    public $status;
    public $user;

    function __construct($input = null) {
        if ($input) {
            $this->id = $input->id;
            $this->name = $input->name;
            $this->email = $input->email;
            $this->login = $input->login;
            $this->pwrd = $input->pwrd;
            $this->is_admin = $input->is_admin;
            $this->status = $input->status;
            $this->user = $input->user;
        }
    }
}