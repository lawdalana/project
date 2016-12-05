<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$eventSelected = $_GET['eventID'];

$query = "SELECT * FROM eventheader WHERE EventID='".$eventSelected."';";
$result = $conn->query($query);

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"EventID":"'  . $rs["EventID"] . '",';
    $outp .= '"HeaderTitle":"'   . $rs["HeaderTitle"]        . '",';
    $outp .= '"HeaderNo":"'. $rs["HeaderNo"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>