<?php
$subjectID = $_GET['subjectID'];
$outp ="[";
$con=mysqli_connect("127.0.0.1","root","","project_test");
if (mysqli_connect_errno()) {
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
$sql = "SELECT SubjectID, ED_year FROM subject 
		WHERE SubjectID='".$subjectID."'";
$result = $con->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_array(MYSQLI_ASSOC)) {
    	if ($outp != "[") {$outp .= ",";}
    	$outp .= '{"SubjectID":"'. $row["SubjectID"].'",';
    	$outp .= '"Year":"'. $row["ED_year"]. '"}';
    }
} 
$outp.="]";
$con->close();
echo ($outp)
?>