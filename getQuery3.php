<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT s.SubjectName AS Subject,Room,s.ED_year AS 'ED_YEAR',COUNT(*)AS NumberofStudents FROM subject s JOIN examroom e ON s.SubjectID = e.SubjectID AND s.ED_year = e.ED_year GROUP BY Room,s.SubjectID ");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"NumberofStudents":"'  . $rs["NumberofStudents"] . '",';
	$outp .= '"Subject":"'   . $rs["Subject"]        . '",';
	$outp .= '"Room":"'   . $rs["Room"]        . '",';
    $outp .= '"ED_YEAR":"'. $rs["ED_YEAR"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>