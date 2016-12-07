<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="text.css">
    <link href="carousel.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.t{
	margin-top:50px;
}
</style>
</head>
<body>
 <div>
    <nav class="navbar navbar-inverse navbar-fixed-top " >
      <div class="container">
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav ">
            <li><a href="home.html">Home</a></li>
            <li><a href="">About</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
        </div>
      </div>
     </nav>
 </div>
<div class ="t container jumbotron"id="content">
	<table class="table" border="1px">
		<col width="400">
		<col width="400">
		<tr>
			<th>
				<h1 id="events">Data forms</h1>
			</th>
			<th>
				<h1 id="exams">Data analysis</h1>
			</th>
		</tr>
		<tr>
			<td>
				<div id="listForms">
					<!--<a href="">event01</a>-->
				</div>
			</td>
			<td>
				<div id="listAnalysis">
					<!--<a href="">physic01</a>-->
				</div>
			</td>
		</tr>
	</table>
</div>
<script type="text/javascript">
    var staffType = <?php echo $_POST['staffType'];?>;
	load();
	function load(){
		var forms = "";
		var dA = "";
		if(staffType == 1){
			forms = "<table>";
			forms += "<tr><td><a href=\"http://127.0.0.1:80/project/form1.html\">ExamRoom Form</a></td></tr>";
			forms += "<tr><td><a href=\"http://127.0.0.1:80/project/form2.html\">StudentID Form</a></td></tr>";
			forms += "<tr><td><a href=\"http://127.0.0.1:80/project/form3.html\">General Announcement</a></td></tr>";
			forms += "<tr><td><a href=\"http://127.0.0.1:80/project/form4.html\">Preliminary Course for students</a></td></tr>";
			forms += "<tr><td><a href=\"http://127.0.0.1:80/project/form5.html\">Multiple Preliminary Course for a Single student</a></td></tr>";
			forms += "</table>";
		}
		else{
			forms = "<p>No available forms</p>";
		}
		document.getElementById("listForms").innerHTML = forms;
		if(staffType == 1 || 1){
			dA = "<table>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query1.html\">data analysis 1</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query2.html\">data analysis 2</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query3.html\">data analysis 3</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query4.html\">data analysis 4</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query5.html\">data analysis 5</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query6.html\">data analysis 6</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query7.html\">data analysis 7</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query8.html\">data analysis 8</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query9.html\">data analysis 9</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query10.html\">data analysis 10</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query11.html\">data analysis 11</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query12.html\">data analysis 12</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query13.html\">data analysis 13</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query14.html\">data analysis 14</a></td></tr>";
			dA += "<tr><td><a href=\"http://127.0.0.1:80/project/query15.html\">data analysis 15</a></td></tr>";
			dA += "</table>";
		}
		else{
			dA = "<p>No available data analysis</p>";
		}
		document.getElementById("listAnalysis").innerHTML = dA;
	}
</script>
	
</body>
</html>