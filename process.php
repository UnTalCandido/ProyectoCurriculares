<?php
session_start();
require('./database.php');
if(isset($_POST['process']))
{
    if(isset($_POST['user']) && isset($_POST['password']))
    {
        $user = $_POST['user'];
        $password = $_POST['password'];
        if($_POST['process'] == "Ingresar")
        {
            if(Database::Loggin($user, $password))
            {
                $_SESSION['logged_state'] = md5($user.$password);
                $_SESSION['permiso'] = Database::GetData($user, $password)['permiso'];
                if($_SESSION['permiso'] == 2)
                {
                    $_SESSION['ID'] = Database::GetData($user, $password)['ID'];
                    $_SESSION['matricula'] = $user;
                    $_SESSION['full_name'] = Database::GetData($user, $password)['nombre'];
                }
                header('location: logged.php');
            }
            else echo "USER OR PASSWORD ERROR";
        }
    }
}
else echo "FORBIDDEN";