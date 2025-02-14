<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Ocorrência</title>
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
        .login-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 500px;
            width: 100%;
            justify-content: center;
        }
        .form-group {
            margin-bottom: 15px;
        }

        select,input,textarea {
            background-color: #F4F4F9; 
            color: #000; 

        }

        select.selected {
            color: #000; 
        }

        textarea{
            width: 100%;  
            height: 100px;  
            min-height: 100px; 
            resize: vertical; 
            overflow-y: auto; 
            overflow-x: hidden; 
        }

        .menu_button {
            display: flex;
            justify-content: flex-start;
            margin-bottom: 15px;
            width: 15%;
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


        label {
            display: block;
            margin-bottom: 5px;
        }
        input, select, textarea, button {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
        }
        button {
            background-color: #A7A9AC;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #BDBEBF;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="menu_button">
            <button onclick="window.location.href = '../html/login.html'">Menu</button>
        </div>

        <h1>Criar Ocorrência</h1>

        <?php
        // Conexão com o banco
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "registo_ocorrencias";

        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Conexão falhou: " . $conn->connect_error);
        }

        // Consultar categorias
        $sql_categorias = "SELECT id_tipo, tipo FROM tipo_user";
        $result_categorias = $conn->query($sql_categorias);

        // Consultar status
        $sql_status = "SELECT id_status, status FROM status";
        $result_status = $conn->query($sql_status);

        // Consultar edifícios
        $sql_edificios = "SELECT id_edificio, edificio FROM edificios";
        $result_edificios = $conn->query($sql_edificios);

        // Consultar pisos
        $sql_pisos = "SELECT id_piso, pisos FROM piso";
        $result_pisos = $conn->query($sql_pisos);

        // Consultar salas
        $sql_salas = "SELECT cod_sala, salas FROM salas";
        $result_salas = $conn->query($sql_salas);

        // Consultar niveis de urgencias
        $sql_urgencias = "SELECT id_urgencia, urgencia FROM urgencias";
        $result_urgencias = $conn->query($sql_urgencias);

        // Consultar turnos
        $sql_turno = "SELECT id_turno, turno FROM turnos";
        $result_turno = $conn->query($sql_turno);

        $conn->close();
        ?>
        <form action="processar_ocorrencia.php" method="post">
            <!-- Campo Categoria Profissional -->
            <div class="form-group">
                <label>Categoria Profissional</label>
                <select id="categoria" name="categoria_profissional" required>
                    <option value="" disabled selected>Selecione uma categoria</option>
                    <?php
                    if ($result_categorias->num_rows > 0) {
                        while ($row = $result_categorias->fetch_assoc()) {
                            echo "<option value='" . $row['id_tipo'] . "'>" . $row['tipo'] . "</option>";
                        }
                    }
                    ?>
                </select>
            </div>

            <div class="form-group">
                <label>Turno</label>
                <select id="turno" name="turno" required>
                    <option value="" disabled selected>Selecione um turno</option>
                    <?php
                    if ($result_turno->num_rows > 0) {
                        while ($row = $result_turno->fetch_assoc()) {
                            echo "<option value='" . $row['id_turno'] . "'>" . $row['turno'] . "</option>";
                        }
                    }
                    ?>
                </select>
            </div>

            <!-- Campo Status -->
            <div class="form-group">
                <label>Status</label>
                <select id="status" name="status" required>
                    <option value="" disabled selected>Selecione um status</option>
                    <?php
                    if ($result_status->num_rows > 0) {
                        while ($row = $result_status->fetch_assoc()) {
                            echo "<option value='" . $row['id_status'] . "'>" . $row['status'] . "</option>";
                        }
                    }
                    ?>
                </select>
            </div>

            <!-- Campo Edifício -->
            <div class="form-group">
                <label>Edifício</label>
                <select id="edificio" name="edificio" required>
                    <option value="" disabled selected>Selecione um edifício</option>
                    <?php
                    if ($result_edificios->num_rows > 0) {
                        while ($row = $result_edificios->fetch_assoc()) {
                            echo "<option value='" . $row['id_edificio'] . "'>" . $row['edificio'] . "</option>";
                        }
                    }
                    ?>
                </select>
            </div>

            <!-- Campo Piso -->
            <div class="form-group">
                <label>Piso</label>
                <select id="piso" name="piso" required>
                    <option value="" disabled selected>Selecione um piso</option>
                    <?php
                    if ($result_pisos->num_rows > 0) {
                        while ($row = $result_pisos->fetch_assoc()) {
                            echo "<option value='" . $row['id_piso'] . "'>" . $row['pisos'] . "</option>";
                        }
                    }
                    ?>
                </select>
            </div>

            <!-- Campo Sala -->
            <div class="form-group">
                <label>Sala</label>
                <select id="sala" name="sala" required>
                    <option value="" disabled selected>Selecione uma sala</option>
                    <?php
                    if ($result_salas->num_rows > 0) {
                        while ($row = $result_salas->fetch_assoc()) {
                            echo "<option value='" . $row['cod_sala'] . "'>" . $row['salas'] . "</option>";
                        }
                    }
                    ?>
                </select>
            </div>

            <!-- Outros Campos -->
            <div class="form-group">
                <label for="data">Data de Registro</label>
                <input type="date" id="data" name="data_regs" required>
            </div>
            <div class="form-group">
                <label>Nível de Urgência</label>
                <select id="urgencia" name="nivel_urgencia" required>
                    <option value="" disabled selected>Selecione uma urgência</option>
                    <?php
                    if ($result_urgencias->num_rows > 0) {
                        while ($row = $result_urgencias->fetch_assoc()) {
                            echo "<option value='" . $row['id_urgencia'] . "'>" . $row['urgencia'] . "</option>";
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label>Descrição</label>
                <textarea id="descricao" name="descricao" required rows="4"></textarea>
            </div>
            <div class="form-group">
                <label>Data do Ocorrido</label>
                <input type="date" id="data_ocorrencia" name="data" required>
            </div>
            <div class="form-group">
                <button type="submit">Enviar</button>
            </div>
        </form>
    </div>
    <script>
        const urlParams = new URLSearchParams(window.location.search);
        const menuType = urlParams.get('menu'); 

        const menuButton = document.querySelector('.menu_button button');

        if (menuType === 'admin') {
            menuButton.onclick = () => window.location.href = '../html/menu_admin.html';
        } else if (menuType === 'user') {
            menuButton.onclick = () => window.location.href = '../html/menu_user.html';
        } else {
            menuButton.onclick = () => window.location.href = '../html/login.html';
        }
    </script>
</body>

</html>
