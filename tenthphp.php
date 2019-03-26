<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="https://use.typekit.net/yom8ypy.css">
</head>
<body>
<h2>Query 10: Add Sponsoring Company</h2>


<?php
$name = $_POST["CompanyName"];                      
$level = $_POST["SponsorLevel"];
$job = $_POST["JobPosting"];
echo "<h3>You have entered $name as a new sponsoring company.</h3>";
echo "<p>Here is the new tuple in the database for $name.</p>";
echo "<br>";
echo "<table><tr><th>Company Name</th><th>Sponsor Level</th><th>Job Posting</th><th>Number of Emails Sent</th></tr>";

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");


$sql1 = "insert into Sponsors(CompanyName, SponsorLevel, EmailsSent) values ('$name', '$level', '0')";
$stmt = $pdo->prepare($sql1);   #create the query
$stmt->execute([$name]);   #bind the parameters

$sql2 = "select * from Sponsors where CompanyName = '$name'";
$stmt = $pdo->prepare($sql2);   #create the query
$stmt->execute();   #bind the parameters


#stmt contains the result of the program execution
#use fetch to get results row by row.
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["CompanyName"]."</td><td>".$row["SponsorLevel"]."</td><td>".$row["EmailsSent"]."</td></tr>";
}

?>
</table>
<br>
<br> 
<button onclick="window.location.href = './index.html';">Back to home</button>
</body>
</html>
