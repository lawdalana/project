<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$departID = $_GET['depart'];
$courseID = $_GET['courseID'];
$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT st.StudentID AS STID,fName,lName,p.ProgramName AS Program,d.DepartmentName AS Department FROM student st JOIN student_course sc ON st.AppID = sc.AppID JOIN program p ON st.ProgramID = p.ProgramID JOIN department d ON p.DepartmentID = d.DepartmentID WHERE sc.CourseID = '".$courseID."' AND p.DepartmentID = '".$departID."';");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"StudentID":"'  . $rs["STID"] . '",';
	$outp .= '"fName":"'   . $rs["fName"]        . '",';
	$outp .= '"lName":"'   . $rs["lName"]        . '",';
	$outp .= '"Program":"'   . $rs["Program"]        . '",';
    $outp .= '"Department":"'. $rs["Department"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>