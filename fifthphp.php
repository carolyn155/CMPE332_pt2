<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="https://use.typekit.net/yom8ypy.css">
</head>
<body>
<h2>Jobs By Company</h2>


<?php
$company = $_POST["CompanyName"];
echo "<h3>You have selected $company.</h3>";
echo "<p>Here is a list of all the available jobs:</p>";
echo "<br>";
echo "<table><tr><th>Job Title</th></tr>";

#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conferencedb', "root", "");
$sql = "select jobtitle from jobpostings where companyname = ?";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$company]);   #bind the parameters

#stmt contains the result of the program execution
#use fetch to get results row by row.
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["jobtitle"]."</td></tr>";
}

?>
</table>
<button onclick="window.location.href = './index.html';">Back to home</button>
</body>
</html> 