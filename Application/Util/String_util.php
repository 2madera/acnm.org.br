<?php

namespace Application\Util;


class String_util {
    public function format_date($date_string, $format = null) {

        if ($format == null) {
            $format = 'd-m-Y \a\s h:i';
        }
        $date = \DateTime::createFromFormat('Y-m-d H:i:s', $date_string);
        return $date->format($format);
    }
}