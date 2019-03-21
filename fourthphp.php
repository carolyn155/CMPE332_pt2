<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="https://use.typekit.net/yom8ypy.css">
</head>
<body>
<h2>Sponsors</h2>


<?php
echo "<h3>You have asked to see information on the Sponsors and their Level of Sponsorship.</h3>";
echo "<p>Here is a list of all the Sponsor companies and their Level of Sponsorship:</p>";
echo "<br>";
echo "<table><tr><th>Company Name</th><th>Level of Sponsorship</th></tr>";

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "select CompanyName, SponsorLevel from Sponsors";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([]);   #bind the parameters

#stmt contains the result of the program execution
#use fetch to get results row by row.
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["CompanyName"]."</td><td>".$row["SponsorLevel"]."</td></tr>";
}

?>
</table>
<br>
<br> 
<button onclick="window.location.href = './index.html';">Back to home</button>
</body>
</html>
