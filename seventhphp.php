<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="https://use.typekit.net/yom8ypy.css">
</head>
<body>
<h2>Query 7: Conference Attendees</h2>


<?php
echo "<h3>You have asked to see information on the Conference Attendees.</h3>";
echo "<p>Here lists all of the conference attendees as 3 lists: students, professionals, sponsors.</p>";
echo "<br>";
echo "<h4>Students</h4>";
echo "<p>Here is a list of all the names of the student attendees:</p>";
echo "<table><tr><th>First Name</th><th>Last Name</th></tr>";

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "select FirstName, LastName from Attendees where AttendeeType = 'Student'";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute();   #bind the parameters

#stmt contains the result of the program execution
#use fetch to get results row by row.
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["FirstName"]."</td><td>".$row["LastName"]."</td></tr>";
}
echo "</table>";
echo "<br>";


echo "<h4>Professionals</h4>";
echo "<p>Here is a list of all the names of the professional attendees:</p>";
echo "<table><tr><th>First Name</th><th>Last Name</th></tr>";

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "select FirstName, LastName from Attendees where AttendeeType = 'Professional'";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute();   #bind the parameters

#stmt contains the result of the program execution
#use fetch to get results row by row.
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["FirstName"]."</td><td>".$row["LastName"]."</td></tr>";
}
echo "</table>";
echo "<br>";

echo "<h4>Sponsors</h4>";
echo "<p>Here is a list of all the names of the sponsor attendees:</p>";
echo "<table><tr><th>First Name</th><th>Last Name</th></tr>";

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "select FirstName, LastName from Attendees where AttendeeType = 'Sponsor'";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute();   #bind the parameters

#stmt contains the result of the program execution
#use fetch to get results row by row.
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["FirstName"]."</td><td>".$row["LastName"]."</td></tr>";
}

?>
</table>
<br>
<br> 
<button onclick="window.location.href = './index.html';">Back to home</button>
<br>
<br><br>
<br>
</body>
</html>
