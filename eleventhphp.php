<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="https://use.typekit.net/yom8ypy.css">
</head>
<body>
<h2>Delete Sponsors</h2>

<!--delete a sponsoring company and it's associated attendees-->

<?php
$sponsor = $_POST["CompanyName"];
echo "<h3>You have selected the $sponsor to be deleted.</h3>";
echo "<p>Here is the updated list of companies:</p>";
echo "<br>";
echo "<table><tr><th>Companies</th></tr>";


#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "delete from Sponsors where CompanyName = ?";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$sponsor]);   #bind the parameters


#stmt contains the result of the program execution
#use fetch to get results row by row.
$sql = "select CompanyName from Sponsors";
$stmt = $pdo->prepare($sql);
$stmt->execute([]);

while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["CompanyName"]."</td></tr>";
}

?>
</table>
</body>
<br/>
<br/>
<button onclick="window.location.href = './index.html';">Back to home</button>
</html> 