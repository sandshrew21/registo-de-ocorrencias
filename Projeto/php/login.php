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
    $email = trim($_POST['email_login']);
    $senha = trim($_POST['password_login']);

    // Validações
    if (empty($email) || empty($senha)) {
        die("Por favor, preencha todos os campos.");
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("E-mail inválido.");
    }

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

        // Verificar a senha
        if (password_verify($senha, $row['senha'])) {
            echo "Login bem-sucedido!";
            // Aqui você pode iniciar a sessão ou redirecionar para outra página
            session_start();
            if ($row['id']=9) {
                $_SESSION['user_id'] = $row['id_formador'];
                header("Location: ../html/menu_admin.html"); // Altere para a página desejada
                exit;
            }else{
            $_SESSION['user_id'] = $row['id_formador'];
            header("Location: ../html/menu_user.html"); // Altere para a página desejada
            exit;
            }
        } else {
            echo "Senha incorreta.";
        }
    } else {
        echo "Usuário não encontrado.";
    }

    // Fechar a conexão
    $stmt->close();
    $conn->close();
}
?>
