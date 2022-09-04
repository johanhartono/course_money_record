<?php
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'money_record';

$connect = new mysqli($host,$user,$password,$database);

if (mysqli_connect_errno()){
	echo "Koneksi database gagal : " . mysqli_connect_error();
}
?>