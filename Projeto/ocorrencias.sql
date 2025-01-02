-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 02, 2025 at 10:47 AM
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
-- Table structure for table `ocorrencias`
--

CREATE TABLE `ocorrencias` (
  `id_ocorrencia` int UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data_regs` date NOT NULL,
  `edificio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `piso` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sala` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nivel_urgencia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data` date NOT NULL,
  `turno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ocorrencias`
--

INSERT INTO `ocorrencias` (`id_ocorrencia`, `status`, `data_regs`, `edificio`, `piso`, `sala`, `descricao`, `nivel_urgencia`, `data`, `turno`) VALUES
(1, 'Pendente', '2024-11-06', 'Edificio 2', 'Res de Chão', 'Atelier Cerâmica Criativa-CR', 'Problema elétrico', '4-Muito Urgente', '2024-11-13', 'Tarde'),
(2, 'Resolvido', '2024-08-06', 'Edificio 1', 'Piso 1', 'Sala 6-CR', 'Canalização entupida', '3-Urgente', '2024-11-14', 'Dia'),
(3, 'Em Andamento', '2024-10-17', 'Edificio 2', 'Piso 2', 'Sala Informática I-CR', 'Ar condicionado não funciona', '2-Pouco Urgente', '2024-11-08', 'Noite'),
(4, 'Pendente', '2024-10-25', 'Edificio 1', 'Res de Chão', 'Auditório-CR', 'Problema de acesso', '4-Muito Urgente', '2024-12-06', 'Dia'),
(5, 'Resolvido', '2024-12-04', 'Edificio 2', 'Piso 1', 'Sala Desenho-CR', 'Iluminação defeituosa', '1-Não Urgente', '2024-12-10', 'Tarde');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ocorrencias`
--
ALTER TABLE `ocorrencias`
  MODIFY `id_ocorrencia` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
