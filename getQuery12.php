<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT sCount*100/totalS AS percent,sub2.AppType,sub2.CourseName FROM ( SELECT sub1.totalS,COUNT(*)AS sCount,app.AppType,c.CourseName FROM (SELECT COUNT(*)AS totalS,s.AppTypeID FROM student s GROUP BY s.AppTypeID) AS sub1 JOIN student s ON s.AppTypeID = sub1.AppTypeID JOIN apptype app ON s.AppTypeID = app.AppTypeID JOIN student_course sc ON s.AppID = sc.AppID JOIN course c ON sc.CourseID = c.CourseID GROUP BY c.CourseID,app.AppTypeID ) AS sub2 ORDER BY AppType");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"percent":"'  . $rs["percent"] . '",';
	$outp .= '"AppType":"'   . $rs["AppType"]        . '",';
    $outp .= '"CourseName":"'. $rs["CourseName"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>