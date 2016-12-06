<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT COUNT(*) AS NoAnn,MONTH(LogTime)AS Month,YEAR(LogTime) AS 'Year' FROM `event` GROUP BY YEAR(LogTime), MONTH(LogTime)");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"NoAnnouncement":"'  . $rs["NoAnn"] . '",';
	$outp .= '"Month":"'   . $rs["Month"]        . '",';
    $outp .= '"Year":"'. $rs["Year"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>