<?php
$host    = "172.25.0.1";
$user    = "root";
$pass    = "1234";
$db_name = "students";

$connection = mysqli_connect($host, $user, $pass, $db_name);

$username = $_POST['user'];
$password = $_POST['pass'];

$username = stripcslashes($username);
$password = stripcslashes($password);
$username = mysqli_real_escape_string($connection, $username);
$password = mysqli_real_escape_string($connection, $password);

$sql = "select * from uandp where Username = '{$username}' and Pass = '{$password}'";
$query = mysqli_query($connection, $sql);
$row = mysqli_fetch_array($query, MYSQLI_ASSOC);
$no = mysqli_num_rows($query);


if($no == 1){
    if($username == "HAD"){ 
        $query = mysqli_query($connection, "SELECT * FROM Details");
        $all_property = array();
    }
    else{ 
        $query = mysqli_query($connection, "SELECT * FROM Details where Name='{$username}' or Hostel='{$username}'");
        $all_property = array();
    }
    echo '<table class="maintable">
            <tr class="heading">';
    while ($property = mysqli_fetch_field($query)) {
        echo '<td>' . $property->name . '</td>';
        $all_property[] = $property->name;
    }
    echo '</tr>';

    while ($row = mysqli_fetch_array($query)) {
        echo "<tr>";
        foreach ($all_property as $item) {
            echo '<td>' . $row[$item] . '</td>';
        }
        echo '</tr>';
    }
    echo "</table>";
}
else{
    echo "<h1> Login failed. Invalid username or password.</h1>";
}
?>
<a href="http://obser.er/">
    <button>BACK</button>
</a>