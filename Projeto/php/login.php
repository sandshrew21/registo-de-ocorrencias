<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Start the session
session_start();

// Initialize error message
$errorMessage = 'Os dados introduzidos não existem ou estão errados';

// Verificar se o formulário foi enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Conexão com o banco de dados
    $servername = "localhost"; // Altere para o nome do servidor
    $username = "root"; // Altere para o nome de usuário do banco de dados
    $password = ""; // Altere para a senha do banco de dados
    $dbname = "registo"; // Altere para o nome do seu banco de dados

    $conn = new mysqli($servername, $username, $password, $dbname);

    // Verificar a conexão
    if ($conn->connect_error) {
        die("Conexão falhou: " . $conn->connect_error);
    }

    // Capturar os dados do formulário
    $email = trim($_POST['email_login']);
    $senha = trim($_POST['password_login']);

    // Validações
    if (empty($email) || empty($senha)) {
        $_SESSION['errorMessage'] = "Por favor, preencha todos os campos.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $_SESSION['errorMessage'] = "E-mail inválido.";
    } else {
        // Verificar o usuário no banco de dados
        $sql = "SELECT id_formador, senha FROM registo_formadores WHERE email = ?";
        $stmt = $conn->prepare($sql);

        if ($stmt === false) {
            die("Erro na preparação da consulta: " . $conn->error);
        }

        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $row = $result->fetch_assoc();

            // Verificar a senha usando password_verify()
            $passwordCheck = password_verify($senha, $row['senha']);

            if ($passwordCheck) {
                // Login bem-sucedido
                $_SESSION['user_id'] = $row['id_formador'];

                // Redirect after successful login (Admin or User)
                if ($row['id_formador'] == 1) {
                    header("Location: ../html/menu_admin.html");
                    exit;
                } else {
                    header("Location: ../html/menu_user.html");
                    exit;
                }
            } else {
                $_SESSION['errorMessage'] = "Senha incorreta.";
            }
        } else {
            $_SESSION['errorMessage'] = "Usuário não encontrado.";
        }

        // Fechar a conexão
        $stmt->close();
        $conn->close();
    }

    // Redirect back to the login page with the error message
    if (isset($_SESSION['errorMessage'])) {
        header("Location: ../html/login.html");
        exit;
    }
}
?>
