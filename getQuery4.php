<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT DepartmentName AS Department,CourseName,COUNT(*) AS NumberofStudent FROM course c JOIN student_course sc ON c.CourseID = sc.CourseID JOIN student s ON sc.AppID = s.AppID JOIN program p ON s.ProgramID = p.ProgramID JOIN department d ON p.DepartmentID = d.DepartmentID GROUP BY c.CourseID,d.DepartmentID ");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"Department":"'  . $rs["Department"] . '",';
	$outp .= '"CourseName":"'   . $rs["CourseName"]        . '",';
    $outp .= '"NumberofStudent":"'. $rs["NumberofStudent"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>