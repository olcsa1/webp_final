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
$sql = "SELECT felhasznalok.felhasznalonev, felhasznalok.telefonszam, ingatlanok.*  FROM ingatlanok, felhasznalok WHERE ingatlanok.tulajdonos_id = felhasznalok.id";
$result = $conn->query($sql);

echo "<table border='1'>\n";
echo "<tr><th>Cím</th><th>Ár</th><th>Felhasználó neve</th><th>Telefonszám</th><th>Város</th><th>Kerület</th><th>Alapterület</th><th>Szobaszám</th><th>Leírás</th><th>Lakás Típus</th><th>Kép</th><th>Bejegyzés létrehozva</th></tr>\n";
while ($row = $result->fetch_assoc()) {
    echo "<tr><td>" . htmlspecialchars($row['cim']) . "</td><td>" . $row['ar'] . "</td><td>" . htmlspecialchars($row['felhasznalonev']) . "</td><td>" . htmlspecialchars($row['telefonszam']) . "</td><td>" . htmlspecialchars($row['varos']) . "</td><td>" . htmlspecialchars($row['kerulet']) . "</td><td>" . htmlspecialchars($row['alapterulet']) . "</td><td>" . htmlspecialchars($row['szobak_szama']) . "</td><td>" . htmlspecialchars($row['leiras']) . "</td><td>" . htmlspecialchars($row['tipus']) . "</td><td>" . htmlspecialchars($row['kep_url']) . "</td><td>" . htmlspecialchars($row['letrehozva']) . "</td></tr>\n";
}
echo "</table>\n";
?>
</body>
</html>