<?php
session_start();
require('./config.php');
if(isset($_SESSION['logged_state']) && isset($_SESSION['permiso']))
{
    if($_SESSION['permiso'] == 1)
    {

        $link = new mysqli(HOST, USER, PASS, DATA);
        $valor = 0;
        if(isset($_POST['btnAceptar']))

        {

            $valor = $_POST['btnAceptar'];
            $link->query("UPDATE tb_pcurriculares SET Estado = 1 WHERE NoUsuario = $valor");

        }

        else if(isset($_POST['btnDenegar']))

        {

            $valor = $_POST['btnDenegar'];
            $link->query("UPDATE tb_pcurriculares SET Estado = 2 WHERE NoUsuario = $valor");
        }

        header('location: admin.php');
    }
}
?>