<?php
session_start();
if(!isset($_SESSION['logged_state']))
{

    header('location: index.php');

}

else if($_SESSION['permiso'] == 2)

{

    require('views/curriculares.html');

}

else if($_SESSION['permiso'] == 1)

{
    header('Location: admin.php');
}
?>