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
$sponsor = $_POST["Sponsor"];
echo "<h3>You have selected the $sponsor to be deleted.</h3>";


#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "delete from sponsors where compnayname = ?";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$sponsor]);   #bind the parameters

#stmt contains the result of the program execution
#use fetch to get results row by row.


?>
</table>
</body>
</html> 