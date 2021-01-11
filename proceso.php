<?php
session_start();
require('./config.php');
if(isset($_POST['btnCurricular']))
{

    // Variables de la peticion POST
    $periodo = $_POST['cbxPeriodo'];
    $curricular = 0;
    $especial = 0;
    $especificacion = '';
    $nousuario = $_SESSION['ID'];
    $directo = true;

    // Asignar valores
    if(isset($_POST['tbxCurricular']))
    {
        $curricular = $_POST['tbxCurricular'];
    }    
    
    if(isset($_POST['cbxEspecial']) && isset($_POST['tbxEspecial']))
    {

        $especial = $_POST['cbxEspecial'];
        $especificacion = $_POST['tbxEspecial'];

    }
    
    // Procesamiento de los datos
    $link = new mysqli(HOST, USER, PASS, DATA);

    $r = $link->query("SELECT * FROM tb_pcurriculares WHERE NoUsuario = $nousuario");
    $results = $r->fetch_array();
    
    if($r->num_rows <= 0)
    {
        if($especial != 0)
        {
            $link->query("INSERT INTO tb_pcurriculares (NoUsuario, periodo, curricular, especial, especificacion, Estado) VALUE ($nousuario, $periodo, $curricular, $especial, '$especificacion', 0)");
        }
        else if($link->query("SELECT (Cupo - (SELECT COUNT(*) FROM tb_alumnosc WHERE NoGrupo = $curricular)) AS CupoRestante FROM tb_grupos")->fetch_array()['CupoRestante'] > 0 && $curricular != 0)
        {
            $link->query("INSERT INTO tb_pcurriculares (NoUsuario, periodo, curricular, especial, especificacion, Estado) VALUE ($nousuario, $periodo, $curricular, $especial, '$especificacion', 0)");
            $link->query("INSERT INTO tb_alumnosc (NoUsuario, NoGrupo) VALUES ($nousuario, $curricular)");
        }
        else
        {
            echo "Cupo lleno para curricular solicitado";
        }
        if($link->affected_rows > 0)
        {
            echo "Se agrego una peticion";
        }
        else
        {
            echo "SQL ERROR";
        }
        /*if($results['especial'] == 1)
        {
            echo "Usted cuenta con una peticion";
            $estado = $results['Estado'];
            if($estado == 1)
            {
                echo "<br>El estado es: Aceptado";
            }
            else if($estado == 2)
            {
                echo "<br>El estado es: Rechazado";
                echo "<br>Se a elminado la peticion, puede realizar una nueva.";
                //$link->query();
            }
            else
            {
                echo "<br>El estado es: A la espera";
            }
        }
        else if($results['curricular'] != 0)
        {
            
        }
        else
        {
            echo "Usted no puede llevar mas de un curricular";
        }*/
    }
    else
    {
        echo "Solo puede existir una peticion";
    }
    
    $link->close();
}
echo "<br><br><a href='index.php'>Volver</a>";