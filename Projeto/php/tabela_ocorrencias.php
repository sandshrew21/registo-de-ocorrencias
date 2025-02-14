<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabela de Ocorrências</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            height: 100vh;
            align-items: flex-start;
            overflow-y: auto;  /* Permite rolagem quando o zoom for aplicado */
            padding-top: 2%;
        }

        .container {
            width: 95%;
            max-width: 1200px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .back-btn {
            background-color: #f39c12;
            padding: 8px 16px;
            text-decoration: none;
            color: white;
            border-radius: 5px;
            font-size: 16px;
        }

        h1 {
            font-size: 24px;
            color: #333;
        }

        .search-container {
            margin-bottom: 20px;
        }

        #search-input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .table-container {
            max-height: 500px;
            overflow-y: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        .btn, .btn-edit {
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn-edit {
            background-color: #f39c12;
        }

    </style>
</head>
<body>

<div class="container">
    <!-- Barra superior com botão de voltar -->
    <div class="top-bar">
        <a href="../html/menu_admin.html" class="back-btn">Voltar ao Menu</a>
        <h1>Tabela de Ocorrências</h1>
    </div>

    <!-- Filtros de pesquisa -->
    <div class="search-container">
        <label for="search-input">Pesquisar:</label>
        <input type="text" id="search-input" onkeyup="filterTable()" placeholder="Pesquisar ocorrências...">

        <label for="status-filter">Filtrar por Status:</label>
        <select id="status-filter" onchange="filterTable()">
            <option value="all">Todos</option>
            <option value="Concluído">Concluído</option>
            <option value="Em Andamento">Em Andamento</option>
            <option value="Pendente">Pendente</option>
        </select>

        <label for="urgency-filter">Filtrar por Urgência:</label>
        <select id="urgency-filter" onchange="filterTable()">
            <option value="all">Todos</option>
            <option value="1-Não Urgente">1-Não Urgente</option>
            <option value="2-Pouco Urgente">2-Pouco Urgente</option>
            <option value="3-Urgente">3-Urgente</option>
            <option value="4-Muito Urgente">4-Muito Urgente</option>
            <option value="5-Extremamente Urgente">5-Extremamente Urgente</option>
        </select>

    </div>

    <!-- Tabela de ocorrências -->
    <div class="table-container">
        <table id="occurrences-table">
            <thead>
                <tr>
                    <th>Cargo</th>
                    <th>Status</th>
                    <th>Data do Registo</th>
                    <th>Edificio</th>
                    <th>Turno</th>
                    <th>Sala</th>
                    <th>Descrição</th>
                    <th>Nível de Urgência</th>
                    <th>Data da Ocorrencia</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    // Conexão com o banco de dados
                    $conn = new mysqli('localhost', 'root', '', 'registo_ocorrencias');
                    if ($conn->connect_error) {
                        die("Falha na conexão: " . $conn->connect_error);
                    }

                    $sql = "SELECT tipo_user.tipo, status.status, ocorrencias.data_regs, edificios.edificio,turnos.turno, salas.salas, ocorrencias.descricao, urgencias.urgencia, ocorrencias.data FROM ocorrencias INNER JOIN tipo_user ON ocorrencias.categoria_prof = tipo_user.id_tipo INNER JOIN status ON ocorrencias.status = status.id_status INNER JOIN edificios ON ocorrencias.edificio = edificios.id_edificio INNER JOIN piso ON ocorrencias.piso = piso.id_piso INNER JOIN salas ON ocorrencias.sala = salas.cod_sala INNER JOIN urgencias ON ocorrencias.nivel_urgencia = urgencias.id_urgencia INNER JOIN turnos ON ocorrencias.turno = turnos.id_turno;";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<tr>
                                <td>{$row['tipo']}</td>
                                <td>{$row['status']}</td>
                                <td>{$row['data_regs']}</td>
                                <td>{$row['edificio']}</td>
                                <td>{$row['turno']}</td>
                                <td>{$row['salas']}</td>
                                <td>{$row['descricao']}</td>
                                <td>{$row['urgencia']}</td>
                                <td>{$row['data']}</td>
                            </tr>";
                        }
                    } else {
                        echo "<tr><td colspan='7'>Nenhuma ocorrência encontrada</td></tr>";
                    }

                    $conn->close();
                ?>
            </tbody>
        </table>
    </div>
</div>

<script>
    function filterTable() {
    let statusFilter = document.getElementById('status-filter').value;
    let urgencyFilter = document.getElementById('urgency-filter').value;
    let searchQuery = document.getElementById('search-input').value.toLowerCase();
    let rows = document.querySelectorAll('#occurrences-table tbody tr');

    rows.forEach(row => {
        let status = row.cells[1].innerText.trim(); 
        let urgency = row.cells[7].innerText.trim(); 
        let description = row.cells[6].innerText.toLowerCase();
        
        let statusMatch = (statusFilter === 'all' || status === statusFilter);
        let urgencyMatch = (urgencyFilter === 'all' || urgency === urgencyFilter);
        let searchMatch = description.includes(searchQuery); 

        if (statusMatch && urgencyMatch && searchMatch) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
}

    function changeStatus(button) {
        let row = button.parentElement.parentElement;
        row.cells[0].innerText = 'Concluído';
        button.style.display = 'none'; 
    }

    function removeRow(button) {
        let row = button.parentElement.parentElement;
        row.remove();
    }
</script>

</body>
</html>
