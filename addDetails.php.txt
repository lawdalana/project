<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$event_id=(int)$_GET["EventName"];
/*$event_id=$_GET["EventName"];
$event_name=$_GET["event_name"];
if($event_name=="")
echo $event_id;
else
echo $event_name;
*/
$count=(int)$_GET['i'];
$con=mysqli_connect("127.0.0.1","root","","project_test");
if (mysqli_connect_errno()) {
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
$sqll = "SELECT EventID, HeaderTitle, HeaderNo FROM eventheader WHERE EventID =$event_id";
$result_select = mysqli_query($con,$sqll) or die(mysql_error());

for($i=1;$i<=$count;$i++)
{
	$row = mysqli_fetch_array($result_select);
    $CheckHeaderTitle = $row["HeaderTitle"];
    $CheckHeaderNo = $row["HeaderNo"];
 $col = "Column".$i;	
 $column = $_GET[$col];
 if($CheckHeaderTitle == $column && $CheckHeaderNo==$i)
 {}
else if("$column" === "")
	echo"Can't insert Column $i. Column is empty.\n";
else{
	if($CheckHeaderTitle != $column && $CheckHeaderNo==$i){
 	$sql = "UPDATE eventheader SET HeaderTitle = $column WHERE HeaderNo =$i";	
	}
	else{
	$sql = "INSERT INTO eventheader  (EventID,HeaderTitle,HeaderNo) VALUES ($event_id,'$column',$i)";
	}

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