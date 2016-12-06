<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT * FROM course;");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"CourseID":"'  . $rs["CourseID"] . '",';
    $outp .= '"CourseName":"'   . $rs["CourseName"]        . '",';
    $outp .= '"CourseDescription":"'. $rs["CourseDescription"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>