<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT c.CourseID AS Preliminary_Course,app.AppType AS AppType,COUNT(*)AS Student_Count FROM student s JOIN apptype app ON s.AppTypeID = app.AppTypeID JOIN student_course sc ON s.AppID = sc.AppID JOIN course c ON sc.CourseID = c.CourseID GROUP BY s.AppTypeID,c.CourseID ");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"PreCourse":"'  . $rs["Preliminary_Course"] . '",';
	$outp .= '"AppType":"'   . $rs["AppType"]        . '",';
    $outp .= '"SCount":"'. $rs["Student_Count"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>