<?php
$host    = "172.25.0.1";
$user    = "root";
$pass    = "1234";
$db_name = "students";

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$connection = mysqli_connect($host, $user, $pass, $db_name);

$username = $_POST['user'];
$password = $_POST['pass'];
echo "$username $pass";

$username = stripcslashes($username);
$password = stripcslashes($password);
$username = mysqli_real_escape_string($connection, $username);
$password = mysqli_real_escape_string($connection, $password);

$sql = "select * from uandp where Username = '{$username}' and Pass = '{$password}'";
$result = mysqli_query($connection, $sql);
$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
$count = mysqli_num_rows($result);


if($count == 1){
    if($username == "HAD"){ 
        echo "I AM HAD";

    }
    else{ 
        $result = mysqli_query($connection, "SELECT * FROM Details where Name='{$webuser}' or Hostel='{$webuser}'");
        $all_property = array();
    }
    




}
else{
    echo "<h1> Login failed. Invalid username or password.</h1>";
}
?>