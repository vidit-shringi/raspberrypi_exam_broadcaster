<?php
session_start();
include 'db.php';

if (!isset($_SESSION['user_id'])) {
    echo "You must be logged in to view questions.";
    exit();
}

$stmt = $pdo->query("SELECT * FROM questions");
$questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($questions);
?>