<?php
session_start();
if(!isset($_SESSION['logged_state']))
{
    header('location: index.php');
}
else if($_SESSION['permiso'] == 2)
{
    $html = file_get_contents('./views/logged.html');
    $html = str_replace('{{ full_name }}', $_SESSION['full_name'], $html);
    $html = str_replace('{{ matricula }}', $_SESSION['matricula'], $html);
    echo $html;
    //require('views/logged.html');
}
else if($_SESSION['permiso'] == 1)
{
    header('Location: admin.php');
}
?>