bjjkhjhkj<?php
$con=mysqli_connect("127.0.0.1","root","","project_test");
if (mysqli_connect_errno()) {
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
echo '<!DOCTYPE HTML>
<html>
<body>
Faculty
<select id="Faculty" name="Faculty">';
$sql = "SELECT Faculty FROM faculty";
$result = $con->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        $Faculty = $row["Faculty"];
        echo '<option value="'.$Faculty.'">'.$Faculty.'</option>';
    }
} 
echo '</select>
</body>
</html>';
?>