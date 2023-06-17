<?php
header('Content-Type: application/json');
include "../flutter_api/db.php";

$date = $_POST['date'];

$stmt = $db->prepare("SELECT c.CampNr FROM TCampsite c, TBelege b, TKunden k WHERE k.KundBeginMiete <= ? AND k.KundEndeMiete >=? AND k.KundId = b.KundId AND b.CampNr = c.CampNr;'");
$stmt->execute([$date, $date]);
$result = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode([
'result' => $result
]);

$conn->close();
?>

