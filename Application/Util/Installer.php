<?php

namespace Application\Util;

use Application\Core\Datasource;
use Application\Models\Book;
use Application\Models\Category;
use Application\Models\People;
use Application\Models\Publisher;
use Application\Models\Rent;
use Application\Models\User;

class Installer {
    public static function install() {
        echo "===================================\n";
        echo "Installing...\n";
        Publisher::generate_sql_creation();
        Category::generate_sql_creation();
        User::generate_sql_creation();
        Book::generate_sql_creation();
        People::generate_sql_creation();
        Rent::generate_sql_creation();

        $login_register_table = "CREATE TABLE `LOGIN_REGISTER` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` INT(11) DEFAULT NULL,
  `date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;";

        $conn = null;

        try {
            $conn = Datasource::get_conn();
        } catch (\PDOException $ex) {
            throw $ex;
        }

        $conn->query($login_register_table);

        echo "Tables created successfully\n";

        if (User::count_all() == 0) {
            echo "===================================\n";
            echo "Creating Master User\n";
            $user = new User();
            $user->name = "administrator";
            $user->email = "maderabatera@gmail.com";
            $user->login = "admin";
            $user->pwrd = "admin";
            $user->is_admin = true;
            if ($user->save()) {
                echo "\tCreated Master User\n";
                echo "\tLogin: admin\n";
                echo "\tPassw: admin\n";
            } else {
                echo "Error creating Master User\n";
            }
        } else {
            echo "===================================\n";
            echo "Table USERS exists and contains rows\n";
        }

    }
}