<?php

namespace Application\Util;


use Application\Core\Config;

class File_util {

    /**
     * @param $name
     * @return String|null
     * @throws \RuntimeException
     */
    public static function process_upload($name) {


        $tmp_name = $_FILES[$name]["tmp_name"];

        if ($_FILES[$name]['error'] == UPLOAD_ERR_OK) {

            $old_name = $_FILES[$name]["name"];
            $extension = end(explode(".", $old_name));
            $file_name = $name . '_' . time() . '.' . $extension;

            if (move_uploaded_file($tmp_name, Config::$upload_directory . DIRECTORY_SEPARATOR . $file_name)) {

                return $file_name;

            } else {

                throw new \RuntimeException("Could not move uploaded file '" . $tmp_name . "' to '" . $file_name);

            }

        }

        throw new \RuntimeException("Upload error '" . $_FILES[$name]['error']);


    }

}