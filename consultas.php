<?php
session_start();
require('./config.php');
if(isset($_SESSION['logged_state']) && isset($_SESSION['permiso']))
{


    if($_SESSION['permiso'] == 1)
    {


        $datos = "";
        $link = new mysqli(HOST, USER, PASS, DATA);
        $r = $link->query("SELECT tb_curriculares.Nombre AS Curricular, tb_grupos.Cupo - (SELECT COUNT(*) FROM tb_alumnosc WHERE tb_alumnosc.NoGrupo = tb_grupos.NoCurricular) AS Cupo, (SELECT COUNT(*) FROM tb_alumnosc WHERE tb_alumnosc.NoGrupo = tb_grupos.NoCurricular) AS Inscritos FROM tb_grupos INNER JOIN tb_curriculares ON tb_grupos.NoCurricular = tb_curriculares.ID");
        while($result = $r->fetch_array()){
            $datos .= "<tr>".
            "<td>".$result['Curricular']."</td>".
            "<td align=\"center\">".$result['Cupo']."</td>".
            "<td align=\"center\">".$result['Inscritos']."</td>".
            "</tr>";



        }
        $html = file_get_contents('./views/consultas.html');
        $html = str_replace('{{ datos }}', $datos, $html);
        echo $html;
    }
}
else
{

    echo "FORBIDDEN";
}
?>