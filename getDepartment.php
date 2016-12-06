<?php
$facultyID = $_GET['facultyID'];
$outp ="[";
$con=mysqli_connect("127.0.0.1","root","","project_test");
if (mysqli_connect_errno()) {
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
$sql = "SELECT DepartmentName, DepartmentID FROM department WHERE FacultyID ='".$facultyID."'";
$result = $con->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_array(MYSQLI_ASSOC)) {
    	if ($outp != "[") {$outp .= ",";}
    	$outp .= '{"DepartmentName":"'. $row["DepartmentName"].'",';
    	$outp .= '"DepartmentID":"'. $row["DepartmentID"]. '"}';
    }
} 
$outp.="]";
$con->close();
echo ($outp)
?>