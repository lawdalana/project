<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$eventSelected = $_GET['eventID'];
echo ($eventSelected);
$conn = new mysqli("127.0.0.1", "root", "", "kmutt_annoucement");

$query = "SELECT * FROM subject WHERE ED_year='".$curYear."';";
$result = $conn->query($query);

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"SubjectID":"'  . $rs["SubjectID"] . '",';
    $outp .= '"SubjectName":"'   . $rs["SubjectName"]        . '",';
    $outp .= '"ED_year":"'. $rs["ED_year"]     . '",';
	$outp .= '"Semester":"'   . $rs["Semester"]        . '",';
    $outp .= '"Description":"'. $rs["Description"]     . '"}';
}
$outp .="]";

$conn->close();

echo($outp);
?>