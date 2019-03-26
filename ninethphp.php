<!DOCTYPE html>

<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="https://use.typekit.net/yom8ypy.css">
</head>
<body>
<h2>Conference Intake</h2>

<!--show the total intake of the conference broken -->
<!--down by total registration amounts and total sponsorship amounts.-->
<?php


echo "<p>Here is the conference intake:</p>";
echo "<br>";
echo "<table><tr><th>Registration</th><th>Sponsorship</th></tr>";

#(SELECT E.FName, E.LName ,null AS SupeFName, null AS SupeLName from employee as E where E.SuperSSN is null) union (select L.FName, L.LName, S.FName, S.LName from employee as L, employee as S where L.SuperSSN = S.SSN);

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "select (b.attendancecost), (c.financialsupport) from attendees as a, attendeetypes as b, sponsorlevels as c, sponsors as k where a.attendeetype = b. attendeetype and k.sponsorlevel = c.sponsorlevel";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([]);   #bind the parameters

#stmt contains the result of the program execution
#use fetch to get results row by row.
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["firstname"]."</td><td>".$row["lastname"]."</td></tr>";
}

?>
</table>
</body>
</html> 