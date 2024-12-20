<?php
// Conexão com o banco de dados
$servername = "192.168.12.73";
$username = "registo_ocorrencias";
$password = "";
$dbname = "registo";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar a conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Consulta para buscar os dados
$sql = "SELECT status, data_regs, local, descricao, nivel_urgencia, data, turno FROM ocorrencias";
$result = $conn->query($sql);

// Criar um array para armazenar os dados
$ocorrencias = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $ocorrencias[] = $row;
    }
}

// Converte o array de ocorrências em JSON
$ocorrencias_json = json_encode($ocorrencias);
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ocorrências</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            align-items: flex-start;
            overflow: hidden; /* Evita scroll na página principal */
        }

        .form-container {
            margin-top: 2rem;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 500px;
            width: 100%;
            justify-content: center;
        }

        .form-container h1 {
            display: flex;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        .butoes_filtro {
            margin-top: 15px;
            margin-bottom: 15px;
            display: flex;
            justify-content: center;
            gap: 10px;
            padding: 10px 20px;
        }

        .butoes_filtro input,
        .butoes_filtro button {
            background-color: #A7A9AC;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .butoes_filtro input:hover,
        .butoes_filtro button:hover {
            background-color: #BDBEBF;
        }

        .menu_button {
            display: flex;
            justify-content: flex-start;
            margin-bottom: 15px;
        }

        .menu_button button {
            background-color: #A7A9AC;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .menu_button button:hover {
            background-color: #BDBEBF;
        }

        .status-container {
            max-height: 400px; /* Altura máxima do contêiner */
            overflow-y: auto; /* Scroll vertical */
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .status-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .status-card h3 {
            margin: 0 0 10px;
        }

        .description-box {
            width: 95%;
            height: 100px;
            background-color: #eee;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Ocorrências</h1>

        <div class="menu_button">
            <button id="menuButton">Menu</button>
        </div>

        <div class="butoes_filtro">
            <label><input type="button" value="Resolvido"></label>
            <label><input type="button" value="Em Andamento"></label>
            <label><input type="button" value="Pendente"></label>
        </div>

        <!-- Contêiner com scroll -->
        <div class="status-container" id="status-container">
            <!-- Os cartões serão renderizados aqui -->
        </div>
    </div>

    <script>
        // Converte os dados PHP para um array JavaScript
        const ocorrencias = <?php echo $ocorrencias_json; ?>;

        // Elemento DOM onde os cartões serão renderizados
        const statusContainer = document.getElementById('status-container');

        // Função para renderizar os cartões
        function renderOcorrencias(ocorrencias) {
            statusContainer.innerHTML = '';

            if (ocorrencias.length === 0) {
                statusContainer.innerHTML = '<p>Nenhuma ocorrência encontrada.</p>';
                return;
            }

            ocorrencias.forEach(ocorrencia => {
                const card = `
                    <div class="status-card">
                        <h3>Status: ${ocorrencia.status}</h3>
                        <p>Data do Registo: ${ocorrencia.data_regs}</p>
                        <p>Local: ${ocorrencia.local}</p>
                        <div class="description-box">Descrição: ${ocorrencia.descricao}</div>
                        <p>Nível de Urgência: ${ocorrencia.nivel_urgencia}</p>
                        <p>Data: ${ocorrencia.data}</p>
                        <p>Turno: ${ocorrencia.turno}</p>
                    </div>
                `;
                statusContainer.insertAdjacentHTML('beforeend', card);
            });
        }

        // Renderiza as ocorrências ao carregar a página
        renderOcorrencias(ocorrencias);

        // Configura o botão do menu
        const urlParams = new URLSearchParams(window.location.search);
        const menuType = urlParams.get('menu'); 

        const menuButton = document.getElementById('menuButton');

        if (menuType === 'admin') {
            menuButton.onclick = () => window.location.href = 'menu_admin.html';
        } else if (menuType === 'user') {
            menuButton.onclick = () => window.location.href = 'menu_user.html';
        } else {
            menuButton.onclick = () => window.location.href = 'login.html';
        }
    </script>
</body>
</html>

<?php
// Fecha a conexão com o banco de dados
$conn->close();
?>
