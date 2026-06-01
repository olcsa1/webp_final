<?php
include './connect.php';
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <title>Lekérdezések</title>
</head>
<body>

<h3>Ingatlanok</h3>
<?php
$sql = "SELECT * FROM ingatlanok";
$result = $conn->query($sql);

echo "<table border='1'>\n";
echo "<tr><th>ID</th><th>Cím</th><th>Ár</th></tr>\n";
while ($row = $result->fetch_assoc()) {
    echo "<tr><td>" . $row['id'] . "</td><td>" . htmlspecialchars($row['cim']) . "</td><td>" . $row['ar'] . "</td></tr>\n";
}
echo "</table>\n";
?>
</body>
</html>