<?php
include '../connection.php';
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
//header("Access-Control-Allow-Headers: X-Requested-With");
header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");

$email = $_POST['email'];

$password = md5($_POST['password']);

$sql = "SELECT * FROM user
        WHERE
        email = '$email' AND password = '$password'
        ";

$result = $connect->query($sql);

if ($result->num_rows > 0) {
    $user = array();
    while ($row = $result->fetch_assoc()) {
        $user[] = $row;
    }
        //echo $sql;
        echo json_encode(array(
        "success" => true,
        "data" => $user[0]    
    ));
    
} else {
     
     echo json_encode(array(
        "success" => false
    ));

}

