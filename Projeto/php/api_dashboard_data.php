<?php
include 'conexao.php'; // Conectar ao banco

$query = "SELECT 
    SUM(CASE WHEN nivel_urgencia = 'Extremamente Urgente' THEN 1 ELSE 0 END) AS extremamenteUrgente,
    SUM(CASE WHEN nivel_urgencia = 'Muito Urgente' THEN 1 ELSE 0 END) AS muitoUrgente,
    SUM(CASE WHEN nivel_urgencia = 'Urgente' THEN 1 ELSE 0 END) AS urgente,
    SUM(CASE WHEN nivel_urgencia = 'Pouco Urgente' THEN 1 ELSE 0 END) AS poucoUrgente,
    SUM(CASE WHEN nivel_urgencia = 'Não Urgente' THEN 1 ELSE 0 END) AS naoUrgente
    FROM ocorrencias";

$result = $conn->query($query);
$data = $result->fetch_assoc();

header('Content-Type: application/json');
echo json_encode($data);

$conn->close();
?>
