<?php
session_start();
if(!isset($_SESSION['logged_state']))
{

    require('views/registrar.html');    

}
else
{

    header('location: logged.php');

}
?>