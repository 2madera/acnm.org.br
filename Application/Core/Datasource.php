<?php

namespace Application\Core;

/**
 * Class Datasource
 * @package Application\Util
 */
class Datasource {

    /**
     * Retorna o PDO conectado no Banco de Dados
     * @return \PDO
     */
    public static function get_conn() {

        try {

            $host = Config::$db_host;
            $name = Config::$db_name;
            $user = Config::$db_user;
            $pass = Config::$db_pwrd;


            $pdo = new \PDO("mysql:host=$host;dbname=$name;charset=utf8", "$user", "$pass");
            return $pdo;
        } catch (\PDOException $pdoEx) {
            throw $pdoEx;
        }
    }
}