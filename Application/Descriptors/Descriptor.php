<?php

namespace Application\Descriptors;

class Descriptor {

    /**
     * @param mixed $class
     * @return mixed
     */
    public static function get($class) {

        if (is_object($class)) {
            $class = ucfirst(str_replace("Application\\Models\\", "", get_class($class)));
        }

        $descriptor_file_name = __DIR__ . DIRECTORY_SEPARATOR . ucfirst("$class.json");

        if (file_exists($descriptor_file_name)) {
            $descriptor_content = file_get_contents($descriptor_file_name);
            return json_decode($descriptor_content, true);
        }

        return null;
    }

    /**
     * Check if descriptor file exists
     * @param String|Object $class
     * @return bool
     */
    public static function descriptor_exists($class) {

        if (is_object($class)) {
            $class = ucfirst(str_replace("Application\\Models\\", "", get_class($class)));
        }

        $class = ucfirst($class);
        $descriptor_file_name = __DIR__ . DIRECTORY_SEPARATOR . "$class.json";
        return file_exists($descriptor_file_name);
    }
}