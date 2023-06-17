<?php

$db_name = "SC_GreenaDB";
$db_server = "i-kf.ch";
$db_user = "SC_Greena";
$db_pass = "4ekF-5bE";

$db = new PDO("mysql:host={$db_server};dbname={$db_name};charset=utf8", $db_user, $db_pass);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

?>