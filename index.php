<?php
session_start();
if(!isset($_SESSION['logged_state']))
{

    require('views/index.html');

}
else
{

    header('location: logged.php');

}
?>