<?php

namespace Application\Core;

/**
 * Class Security
 * @package Application\Util
 */
class Security {

    function __construct() {
        if (session_status() == PHP_SESSION_DISABLED) {
            session_start();
        }
    }

    /**
     * Put objects in session
     * @param $index
     * @param $value
     */
    public static function set_session($index, $value) {
        $_SESSION[$index] = $value;
    }

    /**
     * Get session objects
     * @param $index
     * @return bool
     */
    public static function get_session($index) {
        return (isset($_SESSION[$index]) ? $_SESSION[$index] : null);
    }

    /**
     * Verifica se o usuário está logado
     * @return bool
     */
    public static function is_logged() {
        return Security::get_session('current_user_login');
    }

    /**
     * Verifica se o usuário é administrador
     * @return bool
     */
    public static function is_admin() {
        if (Security::is_logged()) {
            return (Security::get_session('current_user_admin') == "1");
        }

        return false;
    }

    /**
     * Autentica um usuário
     * @param $username
     * @param $password
     * @return bool
     */
    public static function authenticate($username, $password) {

        $username = filter_var($username, FILTER_SANITIZE_STRING);
        $password = filter_var($password, FILTER_SANITIZE_STRING);

        $options['cost'] = Config::$encryption_cost;
        $options['salt'] = Config::$encryption_salt;

        $password = password_hash($password, PASSWORD_BCRYPT, $options);

        $conn = null;

        try {
            $conn = Datasource::get_conn();
        } catch (\PDOException $ex) {
            throw $ex;
        }

        $stmt = $conn->prepare("SELECT * FROM USER u WHERE u.login = :login AND u.pwrd = :pwrd");

        $stmt->execute(array(':login' => $username, ':pwrd' => $password));

        $row = $stmt->fetch(\PDO::FETCH_OBJ);

        if (!$row) {
            return false;
        }

        if ($row->status !== "1") {
            return false;
        }

        Security::set_session('current_user_id', $row->id);
        Security::set_session('current_user_name', $row->name);
        Security::set_session('current_user_login', $row->login);
        Security::set_session('current_user_admin', $row->is_admin);

        $stmt = Datasource::get_conn()->prepare("INSERT INTO LOGIN_REGISTER (user) VALUES (?)");
        $stmt->bindParam(1, $row->id);
        $stmt->execute();

        return true;
    }

    /**
     * Remove a autenticação de um usuário
     * @return bool
     */
    public static function unauthenticate() {
        return session_destroy();
    }

}