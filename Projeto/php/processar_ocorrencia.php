<?php
// Conexão com o banco
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "registo";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Capturar os dados do formulário
$categoria_profissional = $_POST['categoria_profissional'];
$status = $_POST['status'];
$data_regs = $_POST['data_regs'];
$turno = $_POST['turno'];
$edificios = $_POST['edificio'];
$piso = $_POST['piso'];
$sala = $_POST['sala'];
$descricao = $_POST['descricao'];
$nivel_urgencia = $_POST['nivel_urgencia'];
$data = $_POST['data'];

// Inserir na tabela ocorrencias
$sql = "INSERT INTO ocorrencias (categoria_prof, status, data_regs, edificio, piso, sala, descricao, nivel_urgencia, data, turno)
        VALUES ('$categoria_profissional', '$status', '$data_regs', '$edificios', '$piso', '$sala', '$descricao', '$nivel_urgencia', '$data', '$turno')";

if ($conn->query($sql) === TRUE) {
    echo "Ocorrência registrada com sucesso!";
} else {
    echo "Erro: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
