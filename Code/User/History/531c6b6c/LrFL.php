<style>
    body {
        background-color: #1e2124;
        color: rgb(187, 187, 187);
    }

    .maintable {
        margin: auto;
        width: 45%;
        background-color: #36393e;
        border: 2px #424549 solid;
        border-radius: 5px;
    }

    th, td {
        border: 1px #424549 solid;
    }

    a{
        margin-left: 45%;
        width: 5%;
    }

    button {
        border-radius: 3px;
        background-color: #7289da;
        width: 5%;
        height: 30px;
        padding: 10px;
        border:none;
        color: rgb(187, 187, 187) ;
        font-size: 15px;
        font-weight: bold;
        line-height: 6px;
        box-sizing: border-box
    }

    .title{
      text-align: center;
    }
    
</style>

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
    while ($property = mysqli_fetch_field($query)) {#creates an object with column details and iterates over 
        echo '<td>' . $property->name . '</td>';#display the name property of the column
        $all_property[] = $property->name;#add this name to allproperty
    }
    echo '</tr>';

    while ($row = mysqli_fetch_array($query)) {#iterates over every row in the data
        echo "<tr>";
        foreach ($all_property as $item) {#all property consists of the headings of the columns
            echo '<td>' . $row[$item] . '</td>';#for each heading display the element in the row
        }
        echo '</tr>';
    }
    echo "</table>";
}
else{
    echo "<h1 class="title" WRONG USERNAME OR PASSWORD</h1>";
}
?>
<a id="btn" href="http://obser.er/">
    <button>BACK</button>
</a>