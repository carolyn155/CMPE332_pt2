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



echo "<h3>You have asked to add a new attendee.</h3>";
echo "<p>Here lists all the attendees and their information, including the added attendee.</p>";
echo "<br>";
echo "<table><tr><th>Identification</th><th>First Name</th><th>Last Name</th><th>Attendee Type</th></tr>";

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "INSERT INTO Attendees (ID, FirstName,LastName,AttendeeType) VALUES ('$ID', '$Fname', '$Lname', '$Type')";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$ID]);   #bind the parameters



$sql = "SELECT ID, FirstName,LastName,AttendeeType from Attendees ";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute();   #bind the parameters

while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["ID"]."</td><td>".$row["FirstName"]."</td><td>".$row["LastName"]."</td><td>".$row["AttendeeType"]."</td></tr>";
}

echo "</table><br>";

#stmt contains the result of the program execution
#use fetch to get results row by row.

 if ($Type == 'Student' OR $Type == 'student'){

	$sql = "INSERT INTO StudentAttendees (ID, RoomNumber) VALUES ('$ID', '3')";
	$stmt = $pdo->prepare($sql);   #create the query
	$stmt->execute([$ID]);   #bind the parameters

echo "<p>Here lists all the student attendees and their information, including the added attendee:</p><br>";
echo "<table><tr><th>Identification</th><th>First Name</th><th>Last Name</th><th>Room Number</th></tr>";

$sql = "SELECT Attendees.ID, FirstName, LastName, RoomNumber from StudentAttendees, Attendees where Attendees.ID = StudentAttendees.ID ";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute();   #bind the parameters

while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["ID"]."</td><td>".$row["FirstName"]."</td><td>".$row["LastName"]."</td><td>".$row["RoomNumber"]."</td></tr>";
}

#stmt contains the result of the program execution
#use fetch to get results row by row.



$sql = "update RoomingArrangements 
set RoomingArrangements.RoomCapacity = (select count(ID)
                                        from StudentAttendees 
                                        where StudentAttendees.RoomNumber = RoomingArrangements.RoomNumber 
                                        group by RoomNumber)";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$ID]);   #bind the parameters

$sql = "update RoomingArrangements 
set RoomCapacity = 0
where isnull(RoomCapacity)";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$ID]);   #bind the parameters



}

?>
</table>
<br>
<br>
<button onclick="window.location.href = './index.html';">Back to home</button>
</body>
</html>
