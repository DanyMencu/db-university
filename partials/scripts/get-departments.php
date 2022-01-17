<?php
require_once __DIR__ . '/partials/scripts/database.php';

$sql = "SELECT * 
        FROM `teachers`";

$result = $conn->query($sql);

$departments = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $departments[] = $row;
    }
} elseif ($result) {
    echo "No result";
} else {
    echo "Query error";
}

$conn->close();