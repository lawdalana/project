<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$appID = $_GET['appID'];
$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT Room,SubjectName,SeatNo,Time(`Time`)AS Tim FROM examroom e JOIN subject s ON e.SubjectID = s.SubjectID WHERE AppID = '".$appID."';");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"Room":"'  . $rs["Room"] . '",';
	$outp .= '"SubjectName":"'   . $rs["SubjectName"]        . '",';
	$outp .= '"SeatNo":"'   . $rs["SeatNo"]        . '",';
    $outp .= '"Tim":"'. $rs["Tim"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>