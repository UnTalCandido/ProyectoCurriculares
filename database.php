<?php
require('./config.php');
class Database
{
    private static function Connection()
    {
        $link = new mysqli(HOST, USER, PASS, DATA);
        return $link;
    }

    public static function Loggin($user, $pass)
    {
        $pass = md5($pass);
        $query = Database::Connection()->query("SELECT * FROM tb_usuarios WHERE User = '$user' AND Password='$pass'");
        if($query->num_rows > 0)
        {
            return true;
        }
        return false;
    }

    public static function AddUser($user, $pass)
    {
        $pass = md5($pass);
        $date = date('Y-m-d');
        if(Database::Connection()->query("SELECT User FROM tb_usuarios WHERE User='$user'")->num_rows <= 0)
        {
            Database::Connection()->query("INSERT INTO tb_usuarios (User, Password, CreateAt) VALUES ('$user', '$pass', '$date')");
            return true;
        }
        else
        {
            return false;
        }
    }

    public static function GetData($user, $pass)
    {
        $pass = md5($pass);
        $query = Database::Connection()->query("SELECT * FROM tb_usuarios WHERE User = '$user' AND Password='$pass'");
        if($query->num_rows > 0)
        {
            return $query->fetch_array();
        }
    }
}