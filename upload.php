<?php
$csv = array();
$insert_data = array();
$i=0;
$row = 0;
$colName = array();
$tableName = $_POST['table'];
//read file
// check there are no errors
if($_FILES['csv']['error'] == 0){

    $name = $_FILES['csv']['name'];
    $ext = strtolower(end(explode('.', $_FILES['csv']['name'])));
    $type = $_FILES['csv']['type'];
    $tmpName = $_FILES['csv']['tmp_name'];

    // check the file is a csv
    if($ext === 'csv'){

        if(($handle = fopen($tmpName, 'r')) !== FALSE) {
            // necessary if a large csv file
            set_time_limit(0);

            $row = 0;
            while(($data = fgetcsv($handle, 1000, ',')) !== FALSE) {
                // number of fields in the csv
                $col_count = count($data);
                //echo($col_count);

                // get the values from the csv
                for($i=0 ; $i<$col_count ;$i++)
                {   
                    $csv[$row][$i] = $data[$i];
                    echo($csv[$row][$i]);
                    echo(" ");
                }
                echo "<br>";

                // inc the row
                $row++;
            }
            fclose($handle);
        }
    }
}

//keep in SQL
$con=mysqli_connect("127.0.0.1","root","","project_test");
// Check connection
if (mysqli_connect_errno()) {
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
    for($j=0;$j<$col_count;$j++){
            // escape variables for security
            $colName[$j] = mysqli_real_escape_string($con, $csv[0][$j]);
    }
    for($i=1;$i<$row;$i++){
       for($j=0;$j<$col_count;$j++){
            // escape variables for security
            $insert_data[$j] = mysqli_real_escape_string($con, $csv[$i][$j]);
       }
        $sql="INSERT INTO ".$tableName."(";
       for($j=0;$j<$col_count-1;$j++){
       		$sql .= $colName[$j].",";
       }
       $sql = $sql.$colName[$j].")VALUES (";
       for($j=0;$j<$col_count-1;$j++){
       		$sql = $sql."'".$insert_data[$j]."',";
       }
       $sql = $sql."'".$insert_data[$j]."')";
         if (!mysqli_query($con,$sql)) {
            die('Error: ' . mysqli_error($con));
       	 }
	}
echo "records added";
mysqli_close($con);

?>