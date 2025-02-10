-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 10, 2025 at 04:49 PM
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
-- Database: `registo_ocorrencias`
--
CREATE DATABASE IF NOT EXISTS `registo_ocorrencias` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `registo_ocorrencias`;

-- --------------------------------------------------------

--
-- Table structure for table `edificios`
--

CREATE TABLE `edificios` (
  `id_edificio` int UNSIGNED NOT NULL,
  `edificio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
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
  `categoria_prof` int UNSIGNED NOT NULL,
  `status` int UNSIGNED NOT NULL,
  `data_regs` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `edificio` int UNSIGNED NOT NULL,
  `piso` int UNSIGNED NOT NULL,
  `sala` int UNSIGNED NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nivel_urgencia` int UNSIGNED NOT NULL,
  `data` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `turno` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ocorrencias`
--

INSERT INTO `ocorrencias` (`id_ocorrencia`, `categoria_prof`, `status`, `data_regs`, `edificio`, `piso`, `sala`, `descricao`, `nivel_urgencia`, `data`, `turno`) VALUES
(1, 1, 1, '2025-02-10', 1, 1, 11, 'Lampada', 1, '2025-02-06', 1),
(2, 1, 1, '2025-02-11', 2, 2, 39, 'Lampada Fundida', 3, '2025-02-10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `piso`
--

CREATE TABLE `piso` (
  `id_piso` int UNSIGNED NOT NULL,
  `pisos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
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
-- Table structure for table `salas`
--

CREATE TABLE `salas` (
  `cod_sala` int UNSIGNED NOT NULL,
  `salas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salas`
--

INSERT INTO `salas` (`cod_sala`, `salas`) VALUES
(1, 'Sala 1-CR'),
(2, 'Sala 2-CR'),
(3, 'Sala 3-CR'),
(5, 'Sala 5-Oficina Impressão 3 D-CR'),
(6, 'Sala 6-CR'),
(8, 'Sala Informática I-CR'),
(9, 'Sala Informática II-CR'),
(10, 'Sala CAD-CR'),
(11, 'Sala POSI-CR'),
(12, 'Sala Laboratório-CR'),
(13, 'Sala Desenho-CR'),
(14, 'Atelier Pintura-CR'),
(15, 'Atelier Modelação-CR'),
(16, 'Atelier Cerâmica Criativa-CR'),
(17, 'Oficina Marcenaria I-CR'),
(18, 'Oficina Marcenaria II-CR'),
(19, 'Sala Gestores-CR'),
(24, 'Sala CRC-CR'),
(25, 'Auditório-CR'),
(27, 'C.F. Cerâmica-CR'),
(35, 'C.F. Vidração-CR'),
(36, 'C.F. Acabamento-CR'),
(37, 'C.F. Ench.-via liquida-CR '),
(38, 'C.F. Ench.-via plástica-CR'),
(39, 'C.F. Escultura-CR'),
(40, 'Laboratório-CR'),
(41, 'Sala Reuniões'),
(47, 'Telheiro'),
(49, 'Serigrafia'),
(61, 'CR-Formação à Distância'),
(62, 'RVCC - Sessão à Distância'),
(65, 'Instalações Cliente'),
(66, 'Front -Office'),
(68, 'Formação na Empresa'),
(69, 'Sessão Assíncrona (Cencal - Teams)');

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
(1, 'Pendente'),
(2, 'Resolvido'),
(3, 'Em Andamento');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_user`
--

CREATE TABLE `tipo_user` (
  `id_tipo` int UNSIGNED NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipo_user`
--

INSERT INTO `tipo_user` (`id_tipo`, `tipo`) VALUES
(1, 'Administrador'),
(2, 'Formador'),
(3, 'Funcionario Externo'),
(4, 'Funcionario Interno');

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
(2, 'Tarde'),
(3, 'Noite');

-- --------------------------------------------------------

--
-- Table structure for table `urgencias`
--

CREATE TABLE `urgencias` (
  `id_urgencia` int UNSIGNED NOT NULL,
  `urgencia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int UNSIGNED NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nome`, `email`, `senha`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$jxv89/Rj.6SkhqXPFis3x.0mXqHd.akhzR8ddn.Uw/vcmSF4L4eya'),
(2, 'Martinho', 'martinho@gmail.com', '$2y$10$sZj9KP/Eg0mU6wVnerKhyuI/X2qn8AEiHRzhgD0SH2okKTSodUb7G');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `edificios`
--
ALTER TABLE `edificios`
  ADD PRIMARY KEY (`id_edificio`);

--
-- Indexes for table `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD PRIMARY KEY (`id_ocorrencia`),
  ADD KEY `categoria_prof` (`categoria_prof`),
  ADD KEY `edificio` (`edificio`),
  ADD KEY `nivel_urgencia` (`nivel_urgencia`),
  ADD KEY `piso` (`piso`),
  ADD KEY `sala` (`sala`),
  ADD KEY `status` (`status`),
  ADD KEY `turno` (`turno`);

--
-- Indexes for table `piso`
--
ALTER TABLE `piso`
  ADD PRIMARY KEY (`id_piso`);

--
-- Indexes for table `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`cod_sala`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `tipo_user`
--
ALTER TABLE `tipo_user`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indexes for table `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id_turno`);

--
-- Indexes for table `urgencias`
--
ALTER TABLE `urgencias`
  ADD PRIMARY KEY (`id_urgencia`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

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
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipo_user`
--
ALTER TABLE `tipo_user`
  MODIFY `id_tipo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD CONSTRAINT `ocorrencias_ibfk_1` FOREIGN KEY (`categoria_prof`) REFERENCES `tipo_user` (`id_tipo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ocorrencias_ibfk_2` FOREIGN KEY (`edificio`) REFERENCES `edificios` (`id_edificio`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ocorrencias_ibfk_3` FOREIGN KEY (`nivel_urgencia`) REFERENCES `urgencias` (`id_urgencia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ocorrencias_ibfk_4` FOREIGN KEY (`piso`) REFERENCES `piso` (`id_piso`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ocorrencias_ibfk_5` FOREIGN KEY (`sala`) REFERENCES `salas` (`cod_sala`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ocorrencias_ibfk_6` FOREIGN KEY (`status`) REFERENCES `status` (`id_status`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ocorrencias_ibfk_7` FOREIGN KEY (`turno`) REFERENCES `turnos` (`id_turno`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
