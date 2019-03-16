<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="https://use.typekit.net/yom8ypy.css">
</head>
<body>
<h2>Sub-Committee Members</h2>


<?php
$givenName = $_POST["firstname"];                      
$surname = $_POST["lastname"];
$committee = $_POST["subcommittee"];
echo "<h3>You have selected the $committee sub-committee.</h3>";
echo "<p>Here is a list of all the names of the committee members!</p>";
echo "<br>";
echo "<table><tr><th>First Name</th><th>Last Name</th></tr>";

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");

$sql = "select name, salary from instructor where dept_name = ?";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$committee]);   #bind the parameters

#stmt contains the result of the program execution
#use fetch to get results row by row.
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["firstname"]."</td><td>".$row["lastname"]."</td></tr>";
}

?>
</table>
</body>
</html> 
