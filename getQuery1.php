<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT COUNT(*) AS NumberofStudents,c.CourseID AS CourseID,CourseName FROM course c JOIN student_course s ON c.CourseID = s.CourseID GROUP BY c.CourseID;");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"NumberofStudents":"'  . $rs["NumberofStudents"] . '",';
    $outp .= '"CourseID":"'   . $rs["CourseID"]        . '",';
    $outp .= '"CourseName":"'. $rs["CourseName"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>