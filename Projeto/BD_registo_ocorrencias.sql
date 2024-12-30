-- --------------------------------------------------------
-- Anfitrião:                    127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- SO do servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- A despejar dados para tabela registo.edificios: ~2 rows (aproximadamente)
INSERT INTO `edificios` (`id_edificio`, `edificio`) VALUES
	(1, 'Edificio 1'),
	(2, 'Edificio 2');

-- A despejar dados para tabela registo.ocorrencias: ~0 rows (aproximadamente)

-- A despejar dados para tabela registo.piso: ~3 rows (aproximadamente)
INSERT INTO `piso` (`id_piso`, `pisos`) VALUES
	(1, 'Piso 1'),
	(2, 'Piso 2'),
	(3, 'Res de Chão');

-- A despejar dados para tabela registo.registo_formadores: ~9 rows (aproximadamente)
INSERT INTO `registo_formadores` (`id_formador`, `nome`, `email`, `senha`) VALUES
	(1, 'Martinho', 'martinho@gmaial.vom', '$2y$10$ANp6Hn66D3cfmwZ5pgcq7OEHNM2J/9.sDeg2ifPCYbvKW1eTqc5L2'),
	(2, 'Martinho', 'martinhoduarte02@gmail.com', '$2y$10$MEVofCglD4hRuW2oilns/OiAqq4KdCwMgJLoDhrsTvgmqM.0i0JIa'),
	(3, 'João', 'Joaozinho@gmail.com', '12345'),
	(4, 'Maria', 'Mariazinha@gmail.com', 'abcde'),
	(5, 'Carlos', 'Carloszinho@gmail.com', '54321'),
	(6, 'Pedro', 'Pedrozinho@gmail.com', 'qwerty'),
	(7, 'Filipa', 'Filipazinha@gmail.com', 'zxcvb'),
	(8, 'Martinho', 'elethgamer02@gmail.com', '$2y$10$Zjqwv84416otM0/Gu2QT2.qHGcu6BnieKLja8hcZyQR8uQexlLf92'),
	(9, 'Admin', 'admin@gmail.com', '$2y$10$pHx.S26dwi4lQgpK7hMfSu7Zblm5noBcJ7uznQWaSbkWqWNYpmET2');

-- A despejar dados para tabela registo.salas: ~35 rows (aproximadamente)
INSERT INTO `salas` (`id_salas`, `cod_sala`, `salas`) VALUES
	(1, '1', 'Sala 1-CR'),
	(2, '3', 'Sala 3-CR'),
	(3, '2', 'Sala 2-CR'),
	(4, '18', 'Oficina Marcenaria II-CR'),
	(5, '17', 'Oficina Marcenaria I-CR'),
	(6, '16', 'Atelier Cerâmica Criativa-CR'),
	(7, '15', 'Atelier Modelação-CR'),
	(8, '14', 'Atelier Pintura-CR'),
	(9, '13', 'Sala Desenho-CR'),
	(10, '12', 'Sala Laboratório-CR'),
	(11, '11', 'Sala POSI-CR'),
	(12, '10', 'Sala CAD-CR'),
	(13, '9', 'Sala Informática II-CR'),
	(14, '8', 'Sala Informática I-CR'),
	(15, '6', 'Sala 6-CR'),
	(16, '5', 'Sala 5-Oficina Impressão 3 D-CR'),
	(17, '19', 'Sala Gestores-CR'),
	(18, '24', 'Sala CRC-CR'),
	(19, '25', 'Auditório-CR'),
	(20, '27', 'C.F. Cerâmica-CR'),
	(21, '39', 'C.F. Escultura-CR'),
	(22, '38', 'C.F. Ench.-via plástica-CR'),
	(23, '37', 'C.F. Ench.-via liquida-CR '),
	(24, '36', 'C.F. Acabamento-CR'),
	(25, '35', 'C.F. Vidração-CR'),
	(26, '40', 'Laboratório-CR'),
	(27, '41', 'Sala Reuniões'),
	(28, '47', 'Telheiro'),
	(29, '49', 'Serigrafia'),
	(30, '61', 'CR-Formação à Distância'),
	(31, '62', 'RVCC - Sessão à Distância'),
	(32, '65', 'Instalações Cliente'),
	(33, '66', 'Front -Office'),
	(34, '68', 'Formação na Empresa'),
	(35, '69', 'Sessão Assíncrona (Cencal - Teams)');

-- A despejar dados para tabela registo.status: ~3 rows (aproximadamente)
INSERT INTO `status` (`id_status`, `status`) VALUES
	(2, 'Em Andamento'),
	(1, 'Pendente'),
	(3, 'Resolvido');

-- A despejar dados para tabela registo.turnos: ~3 rows (aproximadamente)
INSERT INTO `turnos` (`id_turno`, `turno`) VALUES
	(1, 'Dia'),
	(3, 'Noite'),
	(2, 'Tarde');

-- A despejar dados para tabela registo.urgencias: ~5 rows (aproximadamente)
INSERT INTO `urgencias` (`id_urgencia`, `urgencia`) VALUES
	(1, '1-Não Urgente'),
	(2, '2-Pouco Urgente'),
	(3, '3-Urgente'),
	(4, '4-Muito Urgente'),
	(5, '5-Extremamente Urgente');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
