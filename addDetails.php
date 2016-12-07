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
 for($j=1;$j<=$cCount+1;$j++)	
 {
 	$col = "attr".$j."r".$i;
 	$cell = $_GET[$col];
 	$app = "attr1r".$i;
 	$appID =$_GET[$app];
 	$sql = "INSERT INTO eventdetails  (EventID,AttributeValue,AttributeNo,AppID) VALUES (".$event_id.",'".$cell."',".$j.",'".$appID."')";
 	//echo($sql);
 	//$con->query($sql);
 	if ($con->query($sql) === TRUE) {
 	   echo "Column $i created successfully\n";
	} 
	else {
  	  echo "Error: " . $sql . "<br/>" . $con->error;
	}
 }
}

$con->close();
header( "Refresh:3; url=http://127.0.0.1/project/form3.html", true, 303);
?>