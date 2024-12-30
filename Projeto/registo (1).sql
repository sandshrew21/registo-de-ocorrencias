-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 192.168.12.73:3306
-- Generation Time: Dec 30, 2024 at 10:54 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `registo`
--

-- --------------------------------------------------------

--
-- Table structure for table `edificios`
--

CREATE TABLE `edificios` (
  `id_edificio` int UNSIGNED NOT NULL,
  `edificio` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `edificios`
--

INSERT INTO `edificios` (`id_edificio`, `edificio`) VALUES
(1, 'Edificio 1'),
(2, 'Edificio 2');

-- --------------------------------------------------------

--
-- Table structure for table `ocorrencias`
--

CREATE TABLE `ocorrencias` (
  `id_ocorrencia` int UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `data_regs` date NOT NULL,
  `edificio` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `piso` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `sala` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nivel_urgencia` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `data` date NOT NULL,
  `turno` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piso`
--

CREATE TABLE `piso` (
  `id_piso` int UNSIGNED NOT NULL,
  `pisos` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `piso`
--

INSERT INTO `piso` (`id_piso`, `pisos`) VALUES
(1, 'Piso 1'),
(2, 'Piso 2'),
(3, 'Res de Chão');

-- --------------------------------------------------------

--
-- Table structure for table `registo_formadores`
--

CREATE TABLE `registo_formadores` (
  `id_formador` int NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registo_formadores`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `salas`
--

CREATE TABLE `salas` (
  `id_salas` int UNSIGNED NOT NULL,
  `cod_sala` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `salas` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salas`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` int UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id_status`, `status`) VALUES
(2, 'Em Andamento'),
(1, 'Pendente'),
(3, 'Resolvido');

-- --------------------------------------------------------

--
-- Table structure for table `turnos`
--

CREATE TABLE `turnos` (
  `id_turno` int UNSIGNED NOT NULL,
  `turno` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `turnos`
--

INSERT INTO `turnos` (`id_turno`, `turno`) VALUES
(1, 'Dia'),
(3, 'Noite'),
(2, 'Tarde');

-- --------------------------------------------------------

--
-- Table structure for table `urgencias`
--

CREATE TABLE `urgencias` (
  `id_urgencia` int UNSIGNED NOT NULL,
  `urgencia` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `urgencias`
--

INSERT INTO `urgencias` (`id_urgencia`, `urgencia`) VALUES
(1, '1-Não Urgente'),
(2, '2-Pouco Urgente'),
(3, '3-Urgente'),
(4, '4-Muito Urgente'),
(5, '5-Extremamente Urgente');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `edificios`
--
ALTER TABLE `edificios`
  ADD PRIMARY KEY (`id_edificio`),
  ADD UNIQUE KEY `edificio` (`edificio`);

--
-- Indexes for table `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD PRIMARY KEY (`id_ocorrencia`),
  ADD KEY `edificio` (`edificio`),
  ADD KEY `piso` (`piso`),
  ADD KEY `status` (`status`),
  ADD KEY `nivel_urgencia` (`nivel_urgencia`),
  ADD KEY `turno` (`turno`),
  ADD KEY `sala` (`sala`);

--
-- Indexes for table `piso`
--
ALTER TABLE `piso`
  ADD PRIMARY KEY (`id_piso`),
  ADD UNIQUE KEY `pisos` (`pisos`);

--
-- Indexes for table `registo_formadores`
--
ALTER TABLE `registo_formadores`
  ADD PRIMARY KEY (`id_formador`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`id_salas`),
  ADD UNIQUE KEY `salas` (`salas`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`),
  ADD UNIQUE KEY `status` (`status`);

--
-- Indexes for table `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id_turno`),
  ADD UNIQUE KEY `turno` (`turno`);

--
-- Indexes for table `urgencias`
--
ALTER TABLE `urgencias`
  ADD PRIMARY KEY (`id_urgencia`),
  ADD UNIQUE KEY `urgencia` (`urgencia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `edificios`
--
ALTER TABLE `edificios`
  MODIFY `id_edificio` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ocorrencias`
--
ALTER TABLE `ocorrencias`
  MODIFY `id_ocorrencia` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `piso`
--
ALTER TABLE `piso`
  MODIFY `id_piso` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `registo_formadores`
--
ALTER TABLE `registo_formadores`
  MODIFY `id_formador` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `salas`
--
ALTER TABLE `salas`
  MODIFY `id_salas` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id_turno` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `urgencias`
--
ALTER TABLE `urgencias`
  MODIFY `id_urgencia` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD CONSTRAINT `ocorrencias_ibfk_1` FOREIGN KEY (`edificio`) REFERENCES `edificios` (`edificio`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ocorrencias_ibfk_2` FOREIGN KEY (`piso`) REFERENCES `piso` (`pisos`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ocorrencias_ibfk_3` FOREIGN KEY (`status`) REFERENCES `status` (`status`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ocorrencias_ibfk_4` FOREIGN KEY (`nivel_urgencia`) REFERENCES `urgencias` (`urgencia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ocorrencias_ibfk_5` FOREIGN KEY (`turno`) REFERENCES `turnos` (`turno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ocorrencias_ibfk_6` FOREIGN KEY (`sala`) REFERENCES `salas` (`salas`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
