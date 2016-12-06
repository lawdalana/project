<?php
$programID = $_GET['programID'];
$outp ="[";
$con=mysqli_connect("127.0.0.1","root","","project_test");
if (mysqli_connect_errno()) {
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
$sql = "SELECT s.AppID, s.StudentID, s.fName, s.lName, e.Room, e.SeatNo, e.Time  FROM student s LEFT JOIN examroom e  ON e.AppID = s.AppID WHERE s.ProgramID = '".$programID."'";
$result = $con->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_array(MYSQLI_ASSOC)) {
    	if ($outp != "[") {$outp .= ",";}
    	$outp .= '{"AppID":"'. $row["AppID"].'",';
    	$outp .= '"StudentID":"'. $row["StudentID"].'",';
    	$outp .= '"fName":"'. $row["fName"].'",';
    	$outp .= '"lName":"'. $row["lName"]. '",';
    	$outp .= '"Room":"'. $row["Room"].'",';
    	$outp .= '"SeatNo":"'. $row["SeatNo"].'",';
    	$outp .= '"Time":"'. $row["Time"].'"}';
    }
} 
$outp.="]";
$con->close();
echo ($outp)
?>