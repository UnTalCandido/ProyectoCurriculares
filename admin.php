<?php
session_start();
require('./config.php');
if(isset($_SESSION['logged_state']) && isset($_SESSION['permiso']))
{
    if($_SESSION['permiso'] == 1)
    {

        $datos = "";
        $link = new mysqli(HOST, USER, PASS, DATA);
        $r = $link->query("SELECT tb_pcurriculares.NoUsuario AS Usuario, tb_usuarios.User as Matricula, tb_usuarios.nombre AS Nombre, tb_tipoespecial.Nombre AS Tipo, tb_pcurriculares.especificacion as Descripcion FROM `tb_pcurriculares` INNER JOIN tb_usuarios ON tb_pcurriculares.NoUsuario = tb_usuarios.ID INNER JOIN tb_tipoespecial ON tb_pcurriculares.id = tb_tipoespecial.ID WHERE tb_pcurriculares.especial > 0 AND tb_pcurriculares.Estado = 0");
        while($result = $r->fetch_array()){
            
	    $datos .= "<tr>".
            "<form method='POST' action='update.php'>".
            "<td>".$result['Matricula']."</td>".
            "<td>".$result['Nombre']."</td>".
            "<td>".$result['Tipo']."</td>".
            "<td>".$result['Descripcion']."</td>".
            "<td><button name='btnAceptar' value='".$result['Usuario']."'>Aceptar</button></td>".
            "<td><button name='btnDenegar' value='".$result['Usuario']."'>Denegar</button></td>".
            "</form>".
            "</tr>";

        }

        $html = file_get_contents('./views/admin.html');
        $html = str_replace('{{ datos }}', $datos, $html);
        echo $html;

    }
}
else
{
    echo "FORBIDDEN";
}
?>