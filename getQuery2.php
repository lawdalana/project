<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT COUNT(*) AS NumberofStudents, d.DepartmentName AS Department FROM student s JOIN program p ON s.ProgramID = p.ProgramID JOIN department d ON p.DepartmentID = d.DepartmentID GROUP BY d.DepartmentID;");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"NumberofStudents":"'  . $rs["NumberofStudents"] . '",';
    $outp .= '"Department":"'. $rs["Department"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>