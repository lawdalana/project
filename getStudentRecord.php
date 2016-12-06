<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$searchType = $_GET['searchBy'];
$key = $_GET['sKey'];
$eventType = $_GET['eventType'];
$eventID = $_GET['eventID'];
$eType = $_GET['eType'];
$curYear = date('Y');
$outp ="[";
$con=mysqli_connect("127.0.0.1","root","","project_test");
if (mysqli_connect_errno()) {
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
$sql = "";
if($eType == "sid"){
	$sql .= "SELECT * FROM student WHERE AppID="."'".$key."'";
}
else if($eventType == "event"){
	$sql .= "SELECT * FROM eventdetails e JOIN student st ON e.AppID = st.AppID WHERE EventID = ".$eventID." AND ";
	if($searchType == 1){
		$sql .= "st.AppID = ".$key.";";
	}
	else{
		$sql .= "st.StudentID = ".$key.";";
	}
} 
else{
	$sql .= "SELECT e.AppID AS AppID,s.SubjectID AS SubjectID,SubjectName,SeatNo,Room,e.Time AS Time FROM examroom e JOIN subject s ON e.SubjectID = s.SubjectID JOIN student st ON e.AppID = st.AppID WHERE ";
	if($searchType == 1){
		$sql .= "st.AppID = ".$key." AND ";
	}
	else{
		$sql .= "st.StudentID = ".$key." AND ";
	}
	$sql .= "s.SubjectID = '".$eventID."' AND s.ED_year = ".$curYear.";";
}
//echo ($sql);
$result = $con->query($sql);
if($result->num_rows > 0 && $eType == "sid"){
	// output data of each row
    while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    	if ($outp != "[") {$outp .= ",";}
    $outp .= '{"AppID":"'  . $rs["AppID"] . '",';
    $outp .= '"StudentID":"'. $rs["StudentID"]     . '"}';
    }
}
else if ($result->num_rows > 0 && $eventType == "exam") {
    // output data of each row
    while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    	if ($outp != "[") {$outp .= ",";}
    	$outp .= '{"AppID":"'  . $rs["AppID"] . '",';
    $outp .= '"SubjectID":"'   . $rs["SubjectID"]        . '",';
	$outp .= '"SubjectName":"'   . $rs["SubjectName"]        . '",';
    $outp .= '"SeatNo":"'. $rs["SeatNo"]     . '",';
	$outp .= '"Room":"'   . $rs["Room"]        . '",';
    $outp .= '"Time":"'. $rs["Time"]     . '"}';
    }
} 
else if($result->num_rows > 0 && $eventType == "event"){
	// output data of each row
    while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    	if ($outp != "[") {$outp .= ",";}
    $outp .= '{"AppID":"'  . $rs["AppID"] . '",';
    $outp .= '"EventID":"'   . $rs["EventID"]        . '",';
	$outp .= '"AttributeNo":"'   . $rs["AttributeNo"]        . '",';
    $outp .= '"AttributeValue":"'. $rs["AttributeValue"]     . '"}';
    }
}

$outp.="]";
$con->close();
echo ($outp)
?>