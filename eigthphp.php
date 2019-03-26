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
$Type = $_POST["AttendeeType"];
$Fname = $_POST["FirstName"];
$Lname = $_POST["LastName"];
$ID = $_POST["ID"];

if ($Type = 'Student' OR $Type = 'student'){

echo "<h3>You have asked to add a new student attendee.</h3>";
echo "<p>Here lists the students and their information.</p>";
echo "<br>";
echo "<table><tr><th>Identification</th><th>First name</th><th>Last name</th><th>Attendee type</th></tr>";

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "INSERT INTO Attendees (ID, FirstName,LastName,AttendeeType) VALUES ('$ID', '$Fname', '$Lname', 'Student')";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$Type]);   #bind the parameters

$sql = "INSERT INTO StudentAttendees (ID, FirstName,LastName,RoomNumber) VALUES ('$ID', '$Fname', '$Lname', '3')";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$Type]);   #bind the parameters

// $pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
// $sql = "SELECT ID, FirstName,LastName,AttendeeType from Attendees  where AttendeeType = 'student'";
// $stmt = $pdo->prepare($sql);   #create the query
// $stmt->execute();   #bind the parameters

$sql = "SELECT ID, FirstName,LastName,AttendeeType from Attendees  where AttendeeType = 'Student'";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute();   #bind the parameters

while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["ID"]."</td><td>".$row["FirstName"]."</td><td>".$row["LastName"]."</td><td>".$row["AttendeeType"]."</td></tr>";
}

echo "</table><br>";
echo "<table><tr><th>Identification</th><th>First name</th><th>Last name</th><th>Room Number</th></tr>";

$sql = "SELECT ID, FirstName,LastName,RoomNumber from StudentAttendees ";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute();   #bind the parameters

while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["ID"]."</td><td>".$row["FirstName"]."</td><td>".$row["LastName"]."</td><td>".$row["RoomNumber"]."</td></tr>";
}
#stmt contains the result of the program execution
#use fetch to get results row by row.

}
# end of stuff

?>
</table>
<br>
<br>
<button onclick="window.location.href = './index.html';">Back to home</button>
</body>
</html>
