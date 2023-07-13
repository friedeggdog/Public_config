<?php
$host    = "172.25.0.1";
$user    = "root";
$pass    = "1234";
$db_name = "students";

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$connection = mysqli_connect($host, $user, $pass, $db_name);

$username = $_POST['user'];
$password = $_POST['pass'];

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
        $result = mysqli_query($connection, "SELECT * FROM Details");
        $all_property = array();
    }
    else{ 
        $result = mysqli_query($connection, "SELECT * FROM Details where Name='{$username}' or Hostel='{$username}'");
        $all_property = array();
    }
    echo '<table class="data-table">
            <tr class="data-heading">';  //initialize table tag
    while ($property = mysqli_fetch_field($result)) {
        echo '<td>' . $property->name . '</td>';  //get field name for header
        $all_property[] = $property->name;  //save those to array
    }
    echo '</tr>'; //end tr tag

    //showing all data
    while ($row = mysqli_fetch_array($result)) {
        echo "<tr>";
        foreach ($all_property as $item) {
            echo '<td>' . $row[$item] . '</td>'; //get items using property value
        }
        echo '</tr>';
    }
    echo "</table>";
}
else{
    echo "<h1> Login failed. Invalid username or password.</h1>";
}
?>