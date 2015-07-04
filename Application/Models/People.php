<?php

namespace Application\Models;

class People extends Model_base {

    public $id;
    public $name;
    public $photo;
    public $birth;
    public $address;
    public $phone;
    public $cell;
    public $scholl_name;
    public $mother_name;
    public $cpf;
    public $public_school;
    public $graduation;
    public $school_period;
    public $brother_count;
    public $extra_courses;
    public $school_projects;
    public $acnm_projects;
    public $how_knows;
    public $emergency_call;
    public $created_at;
    public $status;
    public $user;

    function __construct($obj = null) {
        if ($obj) {
            $this->id = $obj->id;
            $this->name = $obj->name;
            $this->photo = $obj->photo;
            $this->birth = $obj->birth;
            $this->address = $obj->address;
            $this->phone = $obj->phone;
            $this->cell = $obj->cell;
            $this->scholl_name = $obj->scholl_name;
            $this->mother_name = $obj->mother_name;
            $this->cpf = $obj->cpf;
            $this->public_school = $obj->public_school;
            $this->graduation = $obj->graduation;
            $this->school_period = $obj->school_period;
            $this->brother_count = $obj->brother_count;
            $this->extra_courses = $obj->extra_courses;
            $this->school_projects = $obj->school_projects;
            $this->acnm_projects = $obj->acnm_projects;
            $this->how_knows = $obj->how_knows;
            $this->emergency_call = $obj->emergency_call;
            $this->created_at = $obj->created_at;
            $this->status = $obj->status;
            $this->user = $obj->user;
        }
    }
}