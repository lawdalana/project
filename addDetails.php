<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$event_id=(int)$_GET["eventID"];
$cCount = (int)$_GET["columnCount"];
$rCount=(int)$_GET["rowCount"];
$con=mysqli_connect("127.0.0.1","root","","project_test");
if (mysqli_connect_errno()) {
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
for($i=1;$i<=$rCount;$i++)
{
	$app = "attr1r".$i;
 	$appID = $_GET[$app];
	$state = "appIDr".$i;
	$stateS = $_GET[$state];
	echo($appID."\n");
	if($appID == ""){
		if($stateS != "NEW"){
			$sql = "DELETE FROM eventdetails WHERE EventID=".$event_id." AND AppID = '".$stateS."';";
			$con->query($sql);
		}
	}
	else{
		for($j=2;$j<=$cCount+1;$j++)	
		 {
			 $sql = "SELECT * FROM eventdetails WHERE AttributeNo=".($j-1)." AND EventID=".$event_id." AND AppID='".$appID."'";
			 echo($sql);
			 $result = $con->query($sql);
			 $rc = "attr".($j)."r".$i;
			 $value = $_GET[$rc];
			 if($result->fetch_array(MYSQLI_ASSOC)){
				 echo ("Found\n");
				 /* Update */
				 $sql = "UPDATE eventdetails SET AttributeValue='".$value."' WHERE "."AttributeNo=".($j-1)." AND EventID=".$event_id." AND AppID='".$appID."'";
				 echo ("___".$sql."\n");
			 }
			 else{
				 echo ("Not Found\n");
				 /* Add */
				 $sql = "INSERT INTO eventdetails(EventID,AttributeValue,AttributeNo,AppID) VALUES (".$event_id.",'".$value."',".($j-1).",'".$appID."')";
				echo ("___".$sql."\n");
			 }
			 $con->query($sql);
		 }
	}
}

$con->close();
header( "Refresh:3; url=http://127.0.0.1:80/project/form3.html", true, 303);
?>