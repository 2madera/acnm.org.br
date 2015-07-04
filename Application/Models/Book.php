<?php

namespace Application\Models;

/**
 * Class Book
 * @package Application\Models
 */
class Book extends Model_base {


    /**
     * @var String
     */
    public $name;
    /**
     * @var String
     */
    public $author;
    /**
     * @var Integer|User
     */
    public $user;
    /**
     * @var Integer|Publisher
     */
    public $publisher;
    /**
     * @var String
     */
    public $summary;
    /**
     * @var String
     */
    public $edition;
    /**
     * @var String
     */
    public $volume;
    /**
     * @var Integer
     */
    public $quantity;
    /**
     * @var |DateTime
     */
    public $created_at;
    /**
     * @var Integer
     */
    public $status;
    /**
     * @var Integer
     */
    public $shelf;
    /**
     * @var Integer|Category
     */
    public $category;

    /**
     * @param null $obj
     */
    function __construct($obj = null) {
        if ($obj) {
            $this->id = $obj->id;
            $this->name = $obj->name;
            $this->author = $obj->author;
            $this->summary = $obj->summary;
            $this->edition = $obj->edition;
            $this->volume = $obj->volume;
            $this->quantity = $obj->quantity;
            $this->created_at = $obj->created_at;
            $this->status = $obj->status;
            $this->shelf = $obj->shelf;

            $this->user = $obj->user;

            if (isset($obj->user_name)) {
                $user = new User();
                $user->id = $obj->user;
                $user->name = $obj->user_name;
                $this->user = $user;
            } else {
                $this->category = $obj->category;
            }

            if (isset($obj->category_name)) {
                $category = new Category();
                $category->id = $obj->category;
                $category->name = $obj->category_name;
                $this->category = $category;
            } else {
                $this->category = $obj->category;
            }

            if (isset($obj->publisher_name)) {
                $publisher = new Publisher();
                $publisher->id = $obj->publisher;
                $publisher->name = $obj->publisher_name;
                $this->publisher = $publisher;
            } else {
                $this->publisher = $obj->publisher;
            }
        }
    }
}