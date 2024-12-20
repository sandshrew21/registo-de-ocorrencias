<?php

// Verificar se o formulário foi enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Conexão com o banco de dados
    $servername = "192.168.12.73"; // Altere para o nome do servidor
    $username = "registo_ocorrencias"; // Altere para o nome de usuário do banco de dados
    $password = ""; // Altere para a senha do banco de dados
    $dbname = "registo"; // Altere para o nome do seu banco de dados

    $conn = new mysqli($servername, $username, $password, $dbname);

    // Verificar a conexão
    if ($conn->connect_error) {
        die("Conexão falhou: " . $conn->connect_error);
    }

    // Capturar os dados do formulário
    $nome = trim($_POST['name']);
    $email = trim($_POST['email']);
    $senha = trim($_POST['password']);
    $repass = trim($_POST['repass']);

    // Validações
    if (empty($nome) || empty($email) || empty($senha) || empty($repass)) {
        die("Por favor, preencha todos os campos.");
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("E-mail inválido.");
    }

    if ($senha !== $repass) {
        die("As senhas não correspondem.");
    }

    // Hash da senha
    $senhaHash = password_hash($senha, PASSWORD_BCRYPT);

    // Inserir os dados no banco de dados
    $sql = "INSERT INTO registo_formadores (nome, email, senha) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);

    if ($stmt === false) {
        die("Erro na preparação da consulta: " . $conn->error);
    }

    $stmt->bind_param("sss", $nome, $email, $senhaHash);

    if ($stmt->execute()) {
        echo "Registro realizado com sucesso!";
    } else {
        echo "Erro ao registrar: " . $stmt->error;
    }

    // Fechar a conexão
    $stmt->close();
    $conn->close();
}
?>
