<?php

namespace Application\Controllers;

use Application\HtmlHelpers\Navigation;
use Application\Descriptors\Descriptor;
use Application\Util\String_util;
use Application\Core\Security;
use Application\Core\Url;

class Controller_base {

    private $view_directory;

    private $descriptor;

    /**
     * @param Url $url
     */
    function __construct($url) {

        $this->view_directory = str_replace('Controllers', '', __DIR__) . 'Views' . DIRECTORY_SEPARATOR;

        $descriptor_exists = Descriptor::descriptor_exists($url->controller);

        if ($descriptor_exists || $url->controller == "admin") {

            if ($descriptor_exists) {

                $this->descriptor = Descriptor::get($url->controller);

                if (!Security::is_admin()) {

                    if (array_key_exists("roles", $this->descriptor)) {

                        $roles = $this->descriptor['roles'];

                        if (Security::is_logged()) {
                            $roles = $roles['normal'];
                        } else {
                            $roles = $roles['free'];
                        }

                        if (array_search($url->action, $roles) === false) {
                            if (Security::is_logged()) {
                                $url->redirect('admin');
                            } else {
                                $url->redirect('login/login');
                            }
                        }


                    } else {
                        if (!Security::is_logged()) {
                            $url->redirect('login/login');
                        }
                    }

                }

            } else {
                if (!Security::is_logged()) {
                    $url->redirect('login/login');
                }
            }
        }
    }

    /**
     * @param Url $url
     * @param array $variables
     * @return string
     */
    protected function render_view($url, $variables = array()) {

        extract($variables);

        $str = new String_util();
        $security = new Security();
        $navigation = Navigation::get_html();

        $view_file = $url->controller . DIRECTORY_SEPARATOR . $url->action . '.php';

        if (file_exists($this->view_directory . $view_file)) {
            ob_start();
            include $this->view_directory . "_header.php";
            include $this->view_directory . $view_file;
            include $this->view_directory . "_footer.php";
            $renderedView = ob_get_clean();
            echo $renderedView;
            exit();
        } else {
            echo "view not exists:" . $view_file;
            exit();
        }
    }

    /**
     * @param $url
     * @param array $variables
     * @param $model_description
     */
    protected function render_scaffolding_view($url, $variables = array(), $model_description) {

        extract($variables);

        $str = new String_util();
        $security = new Security();
        $navigation = Navigation::get_html();

        $custom_view_file = $url->controller . DIRECTORY_SEPARATOR . $url->action . '.php';
        $scaffolding_view_file = "scaffolding" . DIRECTORY_SEPARATOR . $url->action . '.php';

        if (file_exists($this->view_directory . $scaffolding_view_file)) {
            ob_start();
            include $this->view_directory . "_header.php";
            if (file_exists($this->view_directory . $custom_view_file)) {
                include $this->view_directory . $custom_view_file;
            } else {
                include $this->view_directory . $scaffolding_view_file;
            }
            include $this->view_directory . "_footer.php";
            $renderedView = ob_get_clean();
            echo $renderedView;
            exit();
        } else {
            echo "view not exists:" . $scaffolding_view_file;
            exit();
        }
    }

    /**
     * @param $url
     */
    public function render_not_found($url) {
        $str = new String_util();
        $security = new Security();
        $navigation = Navigation::get_html();
        ob_start();
        include $this->view_directory . "_header.php";
        include $this->view_directory . "404.php";
        include $this->view_directory . "_footer.php";
        $renderedView = ob_get_clean();
        header("HTTP/1.0 404 Not Found");
        echo $renderedView;
        exit();
    }

    public function render_error($url, $variables = array()) {
        extract($variables);
        $str = new String_util();
        $security = new Security();
        $navigation = Navigation::get_html();
        ob_start();
        include $this->view_directory . "_header.php";
        include $this->view_directory . "500.php";
        include $this->view_directory . "_footer.php";
        $renderedView = ob_get_clean();
        header("HTTP/1.0 500 Internal Server Error");
        echo $renderedView;
        exit();
    }
}