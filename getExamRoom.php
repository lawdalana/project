<?php
$outp ="[";
$con=mysqli_connect("127.0.0.1","root","","project_test");
if (mysqli_connect_errno()) {
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
$sql = "SELECT Faculty, FacultyID FROM faculty";
$result = $con->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_array(MYSQLI_ASSOC)) {
    	if ($outp != "[") {$outp .= ",";}
    	$outp .= '{"Faculty":"'. $row["Faculty"].'",';
    	$outp .= '"FacultyID":"'. $row["FacultyID"]. '"}';
    }
} 
$outp.="]";
$con->close();
echo ($outp)
?>

SELECT e.AppID, s.StudentID, s.fName, s.lName, e.Room, e.SeatNo, e.Time  FROM student s, examroom e  WHERE e.AppID = s.AppID AND s.ProgramID = 'CPE01'