<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="https://use.typekit.net/yom8ypy.css">
</head>
<body>
<h2>Sub-Committee Members</h2>

<!--switch a session's day/time and/or location.-->

<?php
$session = $_POST["SessionName"];
$start = $_POST["StartTime"];
$end = $_POST["EndTime"];
$location = $_POST["RoomLocation"];

echo "<p> You have altered the session $session.";
echo "<p>Here is the new schedule:</p>";
echo "<br>";
echo "<table><tr><th>Session Name</th><th>Start Time</th><th>End Time</th><th>Room Location</th></tr>";

if($start && $end && !$location ){
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "update scheduleinformation set starttime = '$start', endtime='$end' where sessionname=?";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$session]);   #bind the parameters
} elseif($location && !$start){
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "update scheduleinformation set roomlocation='$location where sessionname=?";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$session]);  
}else {
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "update scheduleinformation set starttime = '$start', endtime='$end', roomlocation='$location' where sessionname= '$session'";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$session]);  

}

$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "select sessionname, starttime, endtime, roomlocation from scheduleinformation";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([]);   #bind the parameters
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["sessionname"]."</td><td>".$row["starttime"]."</td><td>".$row["endtime"]."</td><td>".$row["roomlocation"]."</td></tr>";
}



#connect to the database


?>
</table>
</body>
<br/>
<br/>
<button onclick="window.location.href = './index.html';">Back to home</button>
</html> 