<?php

namespace Application\Models;

use Application\Core\Config;
use Application\Core\Security;
use Application\Descriptors\Descriptor;
use Application\Core\Datasource;
use Application\Util\Eventlogger;
use Application\Util\File_util;
use Application\Util\Mysql_util;

class Model_base {

    /**
     * @var Integer
     */
    public $id;

    /**
     * @var Array
     */
    public $descriptor;


    //Private Funcions

    /**
     * @return array
     */
    private function get_fields() {
        return get_object_vars($this);
    }

    /**
     * @param $class_name
     * @return string
     */
    private static function get_table_name($class_name) {
        return strtoupper(str_replace("Application\\Models\\", "", $class_name));
    }







    //Protected Functions

    /**
     * Busca a conexão
     * @return \PDO
     */
    protected static function get_connection() {
        $conn = null;
        try {
            return Datasource::get_conn();
        } catch (\PDOException $ex) {
            throw $ex;
        }
    }

    function __construct() {
        $this->descriptor = Descriptor::get($this);
    }





    //Public functions

    /**
     * Busca a quantidade de registros
     * @return Integer
     */
    public static function count_all() {
        $table_name = Model_base::get_table_name(get_called_class());
        $query = "SELECT count(*) total FROM $table_name";
        $stmt = Model_base::get_connection()->prepare($query);
        $stmt->execute();
        return $stmt->fetch(\PDO::FETCH_OBJ)->total;
    }

    /**
     * Busca uma lista de Objetos
     * @param null $limit
     * @param int $offset
     * @return Model_base[]
     */
    public static function get_all($limit = null, $offset = 0) {
        $table_name = Model_base::get_table_name(get_called_class());
        $query = "SELECT * FROM $table_name ";
        if ($limit) {
            $query .= "LIMIT $limit OFFSET $offset";
        }
        $stmt = Model_base::get_connection()->prepare($query);
        $stmt->execute();
        $model_list = array();
        foreach ($stmt->fetchAll(\PDO::FETCH_OBJ) as $obj) {
            $my_class = get_called_class();
            array_push($model_list, new $my_class($obj));
        }
        return $model_list;
    }

    /**
     * Realiza uma busca
     * @param $search_string
     * @param null $limit
     * @param int $offset
     * @return array
     */
    public static function search($search_string, $limit = null, $offset = 0) {
        $table_name = Model_base::get_table_name(get_called_class());
        $query = "SELECT * FROM $table_name ";
        if ($limit) {
            $query .= "LIMIT $limit OFFSET $offset ";
        }
        $query .= "WHERE name like ('%$search_string%');";
        $stmt = Model_base::get_connection()->prepare($query);
        //$data[1] = $search_string;
        $stmt->execute();
        $book_list = array();
        $fetch_objects = $stmt->fetchAll(\PDO::FETCH_OBJ);
        $stmt->errorInfo();
        foreach ($fetch_objects as $obj) {
            $my_class = get_called_class();
            array_push($book_list, new $my_class($obj));
        }
        return $book_list;
    }

    /**
     * Preenche os dados do objeto com uma busca pelo ID
     * @param $id
     * @return Model_base
     */
    public static function get($id) {
        $table_name = Model_base::get_table_name(get_called_class());
        $query = "SELECT * FROM $table_name WHERE id = :id";
        $stmt = Model_base::get_connection()->prepare($query);
        $stmt->bindParam(':id', $id);
        if ($stmt->execute()) {
            $my_class = get_called_class();
            $fetch_obj = $stmt->fetch(\PDO::FETCH_OBJ);
            return $fetch_obj ? new $my_class($fetch_obj) : null;
        } else {
            return null;
        }
    }

    /**
     * Salva o registro no banco de dados
     * @return bool
     */
    public function save() {
        $this->bind_params($this->get_fields());
        $table_name = Model_base::get_table_name(get_called_class());
        $data_fields = $this->get_fields();
        $query = "";


        if ($this->id) {

            //Perform a UPDATE statement

            $query .= "UPDATE $table_name SET ";
            foreach ($data_fields as $field_name => $field_value) {
                if (!is_array($field_value) && !is_null($field_value) && ($field_name != "id")) {
                    $query .= "$field_name = :$field_name ,";
                }
            }
            $query = rtrim($query, ",");
            $query .= " where id = :id;";
        } else {
            $query .= "INSERT INTO $table_name (";
            $table_fields = "";
            foreach ($data_fields as $field_name => $field_value) {
                if (!is_array($field_value) && !is_null($field_value) && ($field_name != "id")) {
                    $table_fields .= "$field_name, ";
                }
            }
            $query .= rtrim($table_fields, ', ');
            $query .= ") VALUES (";
            $table_values = "";
            foreach ($data_fields as $field_name => $field_value) {
                if (!is_array($field_value) && !is_null($field_value) && ($field_name != "id")) {
                    $table_values .= ":$field_name, ";
                }
            }
            $query .= rtrim($table_values, ', ');
            $query .= ");";
        }

        $db = Model_base::get_connection();

        $stmt = $db->prepare($query);

        $data = array();

        foreach ($data_fields as $field_name => $field_value) {
            if (!is_array($field_value) && !is_null($field_value)) {

                if (is_object($field_value)) {
                    $value = $field_value->id;
                } else {
                    $value = $field_value;
                }
                $data[":$field_name"] = $value;
            }
        }


        if ($stmt->execute($data)) {
            if (!$this->id) {
                $this->id = $db->lastInsertId();
            }
            return true;
        } else {

            Eventlogger::debug("========== Object $table_name cannot be saved ========");
            Eventlogger::debug($stmt->errorInfo());
            Eventlogger::debug($query);
            Eventlogger::debug($data);
            return false;
        }
    }

    /**
     * Deleta um registro do Banco de Dados
     * @return bool
     */
    public function delete() {
        $table_name = Model_base::get_table_name(get_called_class());
        $query = "DELETE FROM $table_name WHERE id = :id";
        $stmt = Model_base::get_connection()->prepare($query);
        $stmt->bindParam(':id', $this->id);
        return $stmt->execute();
    }

    /**
     * Busca uma lista de Objetos filhos de acordo com uma relação
     * @param $target
     * @param null $limit
     * @param int $offset
     * @return array
     */
    public function get_children($target, $limit = null, $offset = 0) {
        $this->descriptor = Descriptor::get($this);
        if (array_key_exists('has_many', $this->descriptor) && $this->id) {

            $has_many = $this->descriptor['has_many'];

            if (array_key_exists($target, $has_many)) {

                $has_many = $has_many[$target];
                $table_name = $has_many['object'];
                $where_field = $has_many['field'];

                $query = "SELECT * FROM $table_name ";
                if ($limit) {
                    $query .= "LIMIT $limit OFFSET $offset";
                }
                $query .= " WHERE $where_field = :wherefield";
                $stmt = Model_base::get_connection()->prepare($query);
                $stmt->execute(array(':wherefield' => $this->id));
                $child_list = array();
                foreach ($stmt->fetchAll(\PDO::FETCH_OBJ) as $obj) {
                    $my_class = "\\Application\\Models\\" . $has_many['object'];
                    array_push($child_list, new $my_class($obj));
                }
                return $child_list;

            }
        }
    }

    /**
     * Altera dados de um objeto mediante um array
     * @param array $params
     */
    public function bind_params($params) {

        $description = Descriptor::get($this);
        $definitionList = $description['fields'];

        ///Percorrendo as definições de campo
        foreach ($definitionList as $field_name => $field_definitions) {


            if ($field_name != "id") {

                $value = array_key_exists($field_name, $params) ? $params[$field_name] : null;

                if ($value == null) {

                    switch ($field_definitions['type']) {
                        case "photo":
                            $value = File_util::process_upload($field_name);
                            break;
                        case "file":
                            $value = File_util::process_upload($field_name);
                            break;
                    }

                    //TODO bug, default == 0 == "now"
                    if (array_key_exists('default', $field_definitions)) {
                        switch ($field_definitions['default']) {
                            case "now":
                                $value = date('Y-m-d', time());
                                break;
                            case "current_user":
                                $value = Security::get_session('current_user_id');
                                break;
                            default:
                                $value = $field_definitions['default'];
                        }
                    }
                } else {
                    switch ($field_definitions['type']) {
                        case "string":
                            break;
                        case "text":
                            break;
                        case "password":
                            $options['cost'] = Config::$encryption_cost;
                            $options['salt'] = Config::$encryption_salt;
                            $value = password_hash($value, PASSWORD_BCRYPT, $options);
                            break;
                        case "cpf":
                            $value = str_replace(array('.', '-'), '', $value);
                            break;
                        case "datetime":
                            $value = implode('-', array_reverse(explode('/', $value)));
                            break;
                        case "bool":
                            $value = ($value == "on" || $value == true) ? 1 : 0;
                            break;
                        case "object":
                            if (is_object($value)) {
                                $value = $value->id;
                            }
                            break;
                        case "index":
                            break;
                        default:
                    }
                }

                $this->$field_name = $value;

            }
        }
    }

    /**
     * @return string
     */
    public static function generate_sql_creation() {

        $class_name = strtolower(str_replace("Application\\Models\\", "", get_called_class()));

        $table_name = strtoupper($class_name);
        $descriptor = Descriptor::get($class_name);

        $output = "####CRIAÇÃO DA TABELA $table_name\n";
        $output .= "CREATE TABLE IF NOT EXISTS `$table_name` ( \n";

        $index_field = null;

        $foreign_keys = array();

        foreach ($descriptor['fields'] as $field_name => $field_params) {
            $output .= "\t`$field_name` ";
            if ($field_params['type'] == "index") {
                if (!$index_field = null) {
                    $output .= "int(11) NOT NULL AUTO_INCREMENT";
                    $index_field = $field_name;
                }
            } else {

                switch ($field_params['type']) {
                    case "string":
                        $output .= "varchar(512)";
                        break;
                    case "password":
                        $output .= "varchar(256)";
                        break;
                    case "text":
                        $output .= "text";
                        break;
                    case "cpf":
                        $output .= "char(11)";
                        break;
                    case "datetime":
                        $output .= "datetime";
                        break;
                    case "bool":
                        $output .= "int(11)";
                        break;
                    case "object":
                        $output .= "int(11)";
                        array_push($foreign_keys, $field_params['object']);
                        break;
                    case "int":
                        $output .= "int(11)";
                        break;
                    case "choose_one":
                        $output .= "varchar(128)";
                        break;
                    case "photo":
                        $output .= "varchar(512)";
                        break;
                    case "file":
                        $output .= "varchar(512)";
                        break;
                    default:
                        $output .= "varchar(512)";
                        break;
                }

                if (array_key_exists('nullable', $field_params) && !$field_params['nullable']) {

                    if (array_key_exists('default', $field_params) && array_search($field_params['default'], Mysql_util::$default_function_list)) {
                        $output .= " DEFAULT " . $field_params['default'];
                    } else {
                        $output .= " NOT NULL";
                    }

                } else {
                    if (array_key_exists('default', $field_params) && array_search($field_params['default'], Mysql_util::$default_function_list)) {
                        $output .= " DEFAULT " . $field_params['default'];
                    } else {
                        $output .= " DEFAULT NULL";
                    }
                }

            }

            $output .= ",\n";
        }

        if ($index_field) {
            $output .= "\tPRIMARY KEY (`$index_field`),\n";
        }

        foreach ($foreign_keys as $foreign_key) {

            $output .= "\tKEY `fk_" . $table_name . "_" . strtoupper($foreign_key) . "_idx` (`" . strtoupper($foreign_key) . "`),\n";
        }

        foreach ($foreign_keys as $foreign_key) {
            $output .= "\tCONSTRAINT `fk_" . $table_name . "_" . strtoupper($foreign_key) . "1` FOREIGN KEY (`" . strtoupper($foreign_key) . "`) REFERENCES `" . strtoupper($foreign_key) . "` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,\n";
        }


        $output = rtrim($output, ",\n") . "\n";

        $output .= ") ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;\n\n\n\n";

        Model_base::get_connection()->query($output);

    }
}