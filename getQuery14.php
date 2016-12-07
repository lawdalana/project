<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT COUNT(*) AS Num_of_uses,Room FROM (SELECT * FROM examroom GROUP BY DATE(`Time`),Room) AS t GROUP BY Room");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"NoUses":"'  . $rs["Num_of_uses"] . '",';
    $outp .= '"Room":"'. $rs["Room"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>