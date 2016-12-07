<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT MAX(sub1.sCon),sub1.sCon,sub1.fac,sub1.dep,sub1.cos FROM ( SELECT COUNT(*)AS sCon,f.Faculty AS fac,d.DepartmentName AS dep,sc.CourseID AS cos FROM student s JOIN student_course sc ON s.AppID = sc.AppID JOIN program p ON s.ProgramID = p.ProgramID JOIN department d ON p.DepartmentID = d.DepartmentID JOIN faculty f ON d.FacultyID = f.FacultyID GROUP BY sc.CourseID, d.DepartmentID )AS sub1 GROUP BY sub1.dep,sub1.cos ORDER BY sub1.cos ;");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"sCon":"'  . $rs["sCon"] . '",';
	$outp .= '"fac":"'   . $rs["fac"]        . '",';
	$outp .= '"dep":"'   . $rs["dep"]        . '",';
    $outp .= '"cos":"'. $rs["cos"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>