<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = new mysqli("127.0.0.1", "root", "", "project_test");

$result = $conn->query("SELECT COUNT(*)AS sCount,a.AppType AS APPTYPE FROM student s JOIN apptype a ON s.AppTypeID = a.AppTypeID GROUP BY s.AppTypeID");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"sCount":"'  . $rs["sCount"] . '",';
    $outp .= '"APPTYPE":"'. $rs["APPTYPE"]     . '"}'; 
}
$outp .="]";

$conn->close();

echo($outp);
?>