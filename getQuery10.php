<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT * FROM ( SELECT COUNT(sc.CourseID) AS NumCourse, sc.AppID AS App,st.StudentID AS sid FROM student st JOIN student_course sc ON st.AppID = sc.AppID GROUP BY st.AppID ) AS sub3 WHERE sub3.NumCourse = (SELECT MAX(sub1.Numcourse) AS maxim FROM ( SELECT COUNT(sc.CourseID) AS NumCourse, sc.AppID AS App,st.StudentID AS sid FROM student st JOIN student_course sc ON st.AppID = sc.AppID GROUP BY st.AppID ) AS sub1)");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"NumCourse":"'  . $rs["NumCourse"] . '",';
	$outp .= '"App":"'   . $rs["App"]        . '",';
    $outp .= '"sid":"'. $rs["sid"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>