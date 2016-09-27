<?php

namespace Application\Core;

/**
 * Class Config
 * @package Application
 */
class Config
{
    public static $site_url = null;
    public static $db_host = null;
    public static $db_name = null;
    public static $db_user = null;
    public static $db_pwrd = null;
    public static $encryption_cost = null;
    public static $encryption_salt = null;
    public static $default_controller = "home";
    public static $default_action = "index";
    public static $htaccess_param = "p";
    public static $log_directory = "/var/www/html/acnm.org.br/Application/logs";
    public static $upload_directory = "/var/www/html/acnm.org.br/uploads";
    public static $upload_max_file_size = 5 * (1024 * 1024);

    public static function getEnvironmentValues()
    {
        Config::$site_url = getenv('SITE_URL');
        Config::$db_host = getenv('DB_HOST');
        Config::$db_name = getenv('DB_NAME');
        Config::$db_user = getenv('DB_USER');
        Config::$db_pwrd = getenv('DB_PASS');
        Config::$encryption_cost = getenv('ENC_COST');
        Config::$encryption_salt = getenv('ENC_SALT');

    }
}