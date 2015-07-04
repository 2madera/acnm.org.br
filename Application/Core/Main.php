<?php

namespace Application\Core;

use Application\Controllers\Controller_base;
use Application\Controllers\Scaffolding_controller;
use Application\Descriptors\Descriptor;

/**
 * Class Main
 * @package Application
 */
class Main {

    function __construct() {

        $url = new Url();

        try {
            //Verify if Controller has a descriptor file
            // In this case, using standard scaffolding controller
            if (Descriptor::descriptor_exists($url->controller)) {

                $controller = new Scaffolding_controller($url);
                if (method_exists($controller, $url->action)) {
                    call_user_func_array(array($controller, $url->action), array($url));
                }
            }

            // If Controller not have descriptor file, search for specific controller
            $controller_file = str_replace('/Core', '', __DIR__) . '/Controllers/' . ucfirst($url->controller) . '_controller.php';
            $controller_class = "\\Application\\Controllers\\" . ucfirst($url->controller) . '_controller';


            if (file_exists($controller_file)) {

                $controller = new $controller_class($url);
                if (method_exists($controller, $url->action)) {
                    call_user_func_array(array($controller, $url->action), array($url));
                }

            }

            //No controller has found, call 404 view
            $controller = new Controller_base($url);
            $controller->render_not_found($url);

        } catch (\Exception $ex) {

            $error = "Message:" . $ex->getMessage() . "\n";
            $error .= "File:" . $ex->getFile() . "\n";
            $error .= "Line:" . $ex->getLine() . "\n";
            $error .= "Code:" . $ex->getCode() . "\n";
            $error .= "Trace:" . $ex->getTraceAsString() . "\n";
            $data['message'] = $error;

            //Error, call 503 view
            $controller = new Controller_base($url);
            $controller->render_error($url, $data);

        }
    }
}