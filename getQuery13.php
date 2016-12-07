<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT sCount*100/totalS AS percent,DepartmentName,CourseName FROM ( SELECT totalS,COUNT(sc.AppID)AS sCount,sub2.DepartmentName,c.CourseName FROM (SELECT COUNT(*)AS totalS,d.DepartmentName FROM student s JOIN program p ON s.ProgramID = p.ProgramID JOIN department d ON p.DepartmentID = d.DepartmentID GROUP BY d.DepartmentID) AS sub1 JOIN (SELECT s.AppID,d.DepartmentName FROM student s JOIN program p ON s.ProgramID = p.ProgramID JOIN department d ON p.DepartmentID = d.DepartmentID GROUP BY d.DepartmentID) AS sub2 ON sub1.DepartmentName = sub2.DepartmentName JOIN student_course sc ON sub2.AppID = sc.AppID JOIN course c ON sc.CourseID = c.CourseID GROUP BY c.CourseID,sub2.DepartmentName ) AS sub3 ORDER BY DepartmentName;");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"percent":"'  . $rs["percent"] . '",';
	$outp .= '"DepartmentName":"'   . $rs["DepartmentName"]        . '",';
    $outp .= '"CourseName":"'. $rs["CourseName"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>