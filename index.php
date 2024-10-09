<?php

$dbServername = "localhost";
$dbUsername = "root";
$dbPassword = "";
$bdName = "users";

$conn = new mysqli($dbServername, $dbUsername, $dbPassword, $dbName);

require 'config.php';
if(issert ($_POST[Sign_up]))
{
    $fullname= $_POST["fullname"];
    $username= $_POST["username"];
    $email= $_POST["email"];
    $password= $_POST["password"];
    $comfirmpassword= $_POST["comfirmpassword"];

    $conn = new mysqli($fullname,$username,$email,$password,$comfirmpassword);
    
}
?>