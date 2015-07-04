<?php

include "Testify/Testify.php";
include "../Autoloader.php";

Autoloader::registerAutoloader();

/**
 * Testify
 */
$testify = new \Testify\Testify("Ideos Framework, testing...");

$testify->test("String utility", function ($tf) {
    $string_util = new \Application\Util\String_util();
    $tf->assertEqual($string_util->format_date("2012-01-16"), "16-01-2012", "Date format: Format only date");
    $tf->assertEqual($string_util->format_date("2012-01-16 10:00:00"), "16-01-2012 as 10:00", "Date format: Format datetime");
    $tf->assertEqual($string_util->format_date("2012-01-16 10:00:00", "d-m-Y"), "16-01-2012", "Date format: Format datetime with mask");
});

$testify->test("Url", function ($tf) {
    $url = new \Application\Core\Url();
    $tf->assertEqual($url->make(), "http://localhost/ideos-framework/", "Url Make: null link");
    $tf->assertEqual($url->make("teste"), "http://localhost/ideos-framework/teste", "Url Make: teste link");
    $tf->assertEqual($url->make(2), "http://localhost/ideos-framework/2", "Url Make: numeric link");
    $tf->assertEqual($url->get_param(0), null, "Url get param: numeric link");
});

$testify->test("Security", function ($tf) {
    \Application\Core\Security::set_session('test', '1');
    $tf->assertEqual(\Application\Core\Security::get_session('test'), '1', "Security: set and get session object");
    $tf->assertEqual(\Application\Core\Security::get_session('2'), null, "Security: set and get null object");
    $tf->assertEqual(\Application\Core\Security::get_session(null), null, "Security: set and get null index");
});

$testify->test("Descriptor", function ($tf) {
    $descriptor = new \Application\Descriptors\Descriptor();
    $tf->assertEqual($descriptor->descriptor_exists(new \Application\Models\User()), true, "Descriptor: Exists");
    $tf->assertEqual($descriptor->descriptor_exists(new \Application\Core\Security()), false, "Descriptor: Not Exists");
    $tf->assertEqual($descriptor->descriptor_exists("User"), true, "Descriptor: Name of existent class");
    $tf->assertEqual($descriptor->descriptor_exists("Foo"), false, "Descriptor: Name of not existent class");
});


$testify->run();