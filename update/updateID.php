<?php
$con=mysqli_connect("127.0.0.1","root","","project_test");
// Check connection
if (mysqli_connect_errno()) {
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

// escape variables for security
$FacultyID = mysqli_real_escape_string($con, $_POST['Faculty']);
$DepartmentID = mysqli_real_escape_string($con, $_POST['Department']);
$ProgramID = mysqli_real_escape_string($con, $_POST['Program']);
// Get each student's ID

$sql="SELECT AppID FROM student WHERE ProgramID = '$ProgramID'";
$result_select = mysqli_query($con,$sql) or die(mysql_error());
while($row = mysqli_fetch_array($result_select)) {
        $AppID = stripslashes($row['AppID']);
        if (isset($_POST[$AppID])){
            $buffer = $_POST[$AppID];
            $sql="UPDATE student SET StudentID = '$buffer' WHERE AppID = '$AppID'";
            if (!mysqli_query($con,$sql)) {
            die('Error: ' . mysqli_error($con));
            }
        }
}


echo "Record Added";
mysqli_close($con);

header( "Refresh:1; url=http://127.0.0.1/project/form2.html", true, 303);
?>
