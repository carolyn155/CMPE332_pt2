<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="https://use.typekit.net/yom8ypy.css">
</head>
<body>
<h2>Query 3: Display the conference schedule for a particular day</h2>


<?php
$day = $_POST["SessionDay"];
echo "<h3>You have asked to see information on the Conference Schedule.</h3>";
echo "<p>Here lists the details of the conference schedule for $day.</p>";
echo "<br>";
echo "<table><tr><th>Session Name</th><th>Speaker ID</th><th>Start Time</th>
<th>End Time</th><th>Room Location</th><th>Session Day</th></tr>";

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "select SessionName, ID, StartTime, EndTime, RoomLocation, SessionDay from ScheduleInformation, SpeakerAttendees where SessionSpeakingAt = SessionName and SessionDay = ?";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$day]);   #bind the parameters

#stmt contains the result of the program execution
#use fetch to get results row by row.
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["SessionName"]."</td><td>".$row["ID"]."</td><td>".$row["StartTime"]."</td><td>".$row["EndTime"]."</td><td>".$row["RoomLocation"]."</td><td>".$row["SessionDay"]."</td></tr>";
}

?>
</table>
<br>
<br>
<button onclick="window.location.href = './index.html';">Back to home</button>
</body>
</html>
