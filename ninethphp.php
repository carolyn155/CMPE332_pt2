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


echo "<h3>Here is the conference intake:</h3>";
echo "<br>";
echo "<p> Intake comes from both Sponsors and Attendees<p>";
echo "<p> Here is the intake of money from all attendees that are not also sponsors.<p>";

echo "<tr><table><tr><th>Registration</th></tr>";



#(SELECT E.FName, E.LName ,null AS SupeFName, null AS SupeLName from employee as E where E.SuperSSN is null) union (select L.FName, L.LName, S.FName, S.LName from employee as L, employee as S where L.SuperSSN = S.SSN);

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "select sum(b.attendancecost) as Attendance from attendees as a, attendeetypes as b where a.attendeetype = b.attendeetype";
$stmt1 = $pdo->prepare($sql);   #create the query
$stmt1->execute([]);   #bind the parameters
$regtotal = $stmt1;
#stmt contains the result of the program execution
#use fetch to get results row by row.

while ($row = $stmt1->fetch()) {
	echo "<tr><td>".$row["Attendance"]."</td></tr>";
}

echo"</table></tr>";

echo "<p> Here is the intake of money from sponsors alone.<p>";
echo "<tr><table><tr><th>Sponsorship</th></tr>";

$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql2 = "select sum(k.financialsupport) as Sponsor from sponsors as c, sponsorlevels as k where c.sponsorlevel = k.sponsorlevel";
$stmt2 = $pdo->prepare($sql2);   #create the query
$stmt2->execute([]);   #bind the parameters
$regtotal2 = $stmt2;
#stmt contains the result of the program execution
#use fetch to get results row by row.
while ($row = $stmt2->fetch()) {
	echo "<tr><td>".$row["Sponsor"]."</td></tr>";
}
echo "</tr>";
?>
</table>
</body>
</html> 