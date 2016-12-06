<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT s.SubjectID AS Subject,COUNT(DISTINCT Room) AS NumberofRoomUsed FROM `examroom` e JOIN subject s ON e.SubjectID = s.SubjectID AND e.ED_year = s.ED_year GROUP BY s.SubjectID");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"Subject":"'  . $rs["Subject"] . '",';
    $outp .= '"NumberofRoomUsed":"'. $rs["NumberofRoomUsed"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>