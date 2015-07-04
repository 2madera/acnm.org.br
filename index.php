<?php
/**
 * ============================================================
 *                     FRAMEWORK SEM NOME
 * ============================================================
 * PARA QUE O SCAFFOLDING FUNCIONE É NECESSÁRIO INFORMAR OS
 * DESCRITORES, PREFERENCIALMENTE UM PARA CADA MODELO
 *
 *
 *
 *
 *
 *
 *
 */
session_start();
spl_autoload_register(function ($class) {
    $class = str_replace("\\", "/", $class);
    include_once  "$_SERVER[DOCUMENT_ROOT]/$class.php";
});
new \Application\Core\Main();
exit();