<?php
$con=mysqli_connect("127.0.0.1","root","","project_test");
// Check connection
if (mysqli_connect_errno()) {
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
$sql = "SELECT* FROM login WHERE Username = '".mysql_real_escape_string($_POST['username'])."' 
	AND Password = '".mysql_real_escape_string($_POST['password'])."';";
$result = $con->query($sql);
$objResult = $result->fetch_array(MYSQLI_ASSOC);
if($objResult['Username'] != $_POST['username']&&$objResult['Password'] != $_POST['password'])
{
    echo "Username and Password Incorrect!";
    include("login.html");
	exit;
}
else
{
		session_write_close();
		echo "Login Success!";
}
mysql_close();
?>