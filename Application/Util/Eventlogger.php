<?php

namespace Application\Util;

use Application\Core\Config;

class Eventlogger {
    public static function debug($message) {

        if (is_array($message)) {
            $message = implode(",", $message);
        }

        $now = date("d-m-Y h:i");

        $msg =  "[$now] $message\n";

        file_put_contents(Config::$log_directory . "/debug.txt", $msg, FILE_APPEND);
    }
}