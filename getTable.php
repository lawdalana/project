<?php
$programID = $_GET['programID'];
$outp ="[";
$con=mysqli_connect("127.0.0.1","root","","project_test");
if (mysqli_connect_errno()) {
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
$sql = "SELECT AppID, ProgramID, StudentID, fName, lName FROM student WHERE ProgramID ='".$programID."'";
$result = $con->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_array(MYSQLI_ASSOC)) {
    	if ($outp != "[") {$outp .= ",";}
    	$outp .= '{"AppID":"'. $row["AppID"].'",';
    	$outp .= '"ProgramID":"'. $row["ProgramID"].'",';
    	$outp .= '"StudentID":"'. $row["StudentID"].'",';
    	$outp .= '"fName":"'. $row["fName"].'",';
    	$outp .= '"lName":"'. $row["lName"]. '"}';
    }
} 
$outp.="]";
$con->close();
echo ($outp)
?>