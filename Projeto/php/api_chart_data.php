<?php
include 'conexao.php';

$query = "SELECT 
    MONTH(data_regs) AS mes, 
    COUNT(*) AS ocorrencias,
    SUM(CASE WHEN status = 'Concluído' THEN 1 ELSE 0 END) AS concluidas
    FROM ocorrencias
    GROUP BY MONTH(data_regs)";

$result = $conn->query($query);

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

header('Content-Type: application/json');
echo json_encode($data);

$conn->close();
?>
