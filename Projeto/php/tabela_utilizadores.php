<?php
// Conexão com o banco de dados
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "registo";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar a conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Consulta para buscar os dados
$sql = "SELECT id_formador, nome, email, senha FROM registo_formadores";
$result = $conn->query($sql);

// Criar um array para armazenar os dados
$usuarios = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $usuarios[] = $row;
    }
}

// Converte o array de usuários em JSON
$usuarios_json = json_encode($usuarios);
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabela de Utilizadores</title>
    <link rel="stylesheet" href="../html/estilos.css">
</head>
<body>
    <div class="container">
        <div class="btn-container">
            <button onclick="window.location.href='../html/menu_admin.html'">Menu</button>
        </div>
        <div class="form">
            <input type="text" placeholder="Pesquisar..." class="search-bar" id="search-bar">
            <div class="btn-container">
                <button class="btn">Editar</button>
                <button class="btn">Eliminar</button>
                <button class="btn">Criar Novo Utilizador</button>
            </div>
        </div>

        <div class="tabela-container">
            <table class="tabela">
                <caption>Tabela de Utilizadores</caption>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome Completo</th>
                        <th>Email</th>
                        <th>Password (Hash)</th>
                    </tr>
                </thead>
                <tbody id="tabela-corpo">
                    <?php
                    // Exibe os dados iniciais da tabela
                    foreach ($usuarios as $usuario) {
                        echo "<tr>";
                        echo "<td>" . $usuario['id_formador'] . "</td>";
                        echo "<td>" . $usuario['nome'] . "</td>";
                        echo "<td>" . $usuario['email'] . "</td>";
                        echo "<td>" . $usuario['senha'] . "</td>";
                        echo "</tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        // Converte os dados PHP para um array JavaScript
        const usuarios = <?php echo $usuarios_json; ?>;

        // Elementos DOM
        const searchBar = document.getElementById('search-bar');
        const tabelaCorpo = document.getElementById('tabela-corpo');

        // Função para renderizar a tabela
        function renderTabela(usuariosFiltrados) {
            // Limpa a tabela
            tabelaCorpo.innerHTML = '';

            // Verifica se há usuários para exibir
            if (usuariosFiltrados.length === 0) {
                tabelaCorpo.innerHTML = '<tr><td colspan="4">Nenhum usuário encontrado</td></tr>';
                return;
            }

            // Preenche a tabela com os dados filtrados
            usuariosFiltrados.forEach(usuario => {
                const linha = `
                    <tr>
                        <td>${usuario.id_formador}</td>
                        <td>${usuario.nome}</td>
                        <td>${usuario.email}</td>
                        <td>${usuario.senha}</td>
                    </tr>
                `;
                tabelaCorpo.insertAdjacentHTML('beforeend', linha);
            });
        }

        // Event Listener para o campo de pesquisa
        searchBar.addEventListener('input', () => {
            const filtro = searchBar.value.toLowerCase();

            // Filtra os usuários com base no nome
            const usuariosFiltrados = usuarios.filter(usuario =>
                usuario.nome.toLowerCase().includes(filtro)
            );

            // Atualiza a tabela
            renderTabela(usuariosFiltrados);
        });
    </script>
</body>
</html>

<?php
// Fecha a conexão com o banco de dados
$conn->close();
?>
