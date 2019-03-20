<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="https://use.typekit.net/yom8ypy.css">
</head>
<body>
<h2>Hotel Room</h2>


<?php
$roomno = $_POST["RoomNumber"];
echo "<h3>You have selected room $roomno.</h3>";
echo "<p>Here is a list of all the names of the students housed in the selected room:</p>";
echo "<br>";
echo "<table><tr><th>First Name</th><th>Last Name</th></tr>";

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "select FirstName, LastName from StudentAttendees where RoomNumber = ?";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$roomno]);   #bind the parameters

#stmt contains the result of the program execution
#use fetch to get results row by row.
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["FirstName"]."</td><td>".$row["LastName"]."</td></tr>";
}

?>
</table>
</body>
</html> 
