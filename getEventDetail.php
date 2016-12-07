<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$eventSelected = $_GET['eventID'];
$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$query = "SELECT * FROM eventdetails WHERE EventID='".$eventSelected."' ORDER BY AppID, AttributeNo;";
$result = $conn->query($query);

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"EventID":"'  . $rs["EventID"] . '",';
    $outp .= '"AttributeValue":"'   . $rs["AttributeValue"]        . '",';
    $outp .= '"AttributeNo":"'. $rs["AttributeNo"]     . '",';
    $outp .= '"AppID":"'. $rs["AppID"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>