<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="https://use.typekit.net/yom8ypy.css">
</head>
<body>
<h2>Query 8: add a new attendee.  If the attendee is a student, add them to a hotel room.</h2>

<!-- beginning of stuff -->
<?php
echo "<h3>You have asked to add a new attendee.</h3>";
echo "<p>Here lists the details available jobs.</p>";
echo "<br>";
echo "<table><tr><th>Company Name</th><th>Job Title</th><th>Pay Rate Per Year</th><th>City</th><th>Province</th></tr>";

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "select CompanyName, JobTitle, PayRatePerYear, City, Province from JobPostings ";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute();   #bind the parameters

#stmt contains the result of the program execution
#use fetch to get results row by row.
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["CompanyName"]."</td><td>".$row["JobTitle"]."</td><td>".$row["PayRatePerYear"]."</td><td>".$row["City"]."</td><td>".$row["Province"]."</td></tr>";
}
# end of stuff

?>
</table>
<br>
<br>
<button onclick="window.location.href = './index.html';">Back to home</button>
</body>
</html>
