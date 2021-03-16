-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 06-Mar-2021 às 18:00
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `geostatics`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `casos`
--

DROP TABLE IF EXISTS `casos`;
CREATE TABLE IF NOT EXISTS `casos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `nome` varchar(80) NOT NULL,
  `codigo_zona` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codiigo_zona` (`codigo_zona`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `casos`
--

INSERT INTO `casos` (`id`, `data`, `nome`, `codigo_zona`) VALUES
(1, '2021-03-05', 'disenteria bacteriana', 'zn01'),
(2, '2020-10-06', 'síndrome do bebê azul', 'zn04'),
(3, '2020-10-06', 'diarreia', 'zn04'),
(4, '2021-01-11', 'disenteria bacteriana', 'zn02'),
(5, '2021-01-11', 'cólera', 'zn02'),
(6, '2020-12-08', 'disenteria bacteriana', 'zn01'),
(7, '2020-11-19', 'hepatite A', 'zn05'),
(8, '2020-11-19', 'cólera', 'zn05'),
(9, '2021-06-05', 'disenteria bacteriana', 'zn06'),
(10, '2020-11-06', 'síndrome do bebê azul', 'zn04'),
(11, '2020-09-06', 'diarreia', 'zn04'),
(12, '2020-01-11', 'disenteria bacteriana', 'zn02'),
(13, '2021-11-11', 'cólera', 'zn03'),
(14, '2021-02-08', 'disenteria bacteriana', 'zn03'),
(15, '2020-04-19', 'hepatite A', 'zn05'),
(16, '2021-07-19', 'cólera', 'zn05'),
(17, '2021-03-11', 'cólera', 'zn03'),
(18, '2021-05-08', 'disenteria bacteriana', 'zn01'),
(19, '2021-05-19', 'hepatite A', 'zn05'),
(20, '2020-09-19', 'cólera', 'zn06');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coordenadas`
--

DROP TABLE IF EXISTS `coordenadas`;
CREATE TABLE IF NOT EXISTS `coordenadas` (
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `codigo_unico` varchar(11) NOT NULL,
  KEY `codigo_unico_fk` (`codigo_unico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `coordenadas`
--

INSERT INTO `coordenadas` (`lat`, `lng`, `codigo_unico`) VALUES
(-5.665915, -35.417622, 'zn01'),
(-5.665573, -35.421741, 'zn01'),
(-5.664655, -35.421997, 'zn01'),
(-5.664324, -35.427254, 'zn01'),
(-5.652750, -35.425583, 'zn01'),
(-5.652302, -35.434120, 'zn01'),
(-5.651939, -35.434677, 'zn01'),
(-5.649654, -35.432682, 'zn01'),
(-5.651363, -35.419037, 'zn01'),
(-5.656509, -35.418758, 'zn01'),
(-5.657085, -35.418972, 'zn01'),
(-5.651512, -35.416031, 'zn02'),
(-5.649547, -35.432552, 'zn02'),
(-5.640536, -35.424999, 'zn02'),
(-5.643867, -35.416805, 'zn02'),
(-5.647540, -35.416031, 'zn02'),
(-5.643739, -35.416805, 'zn03'),
(-5.640494, -35.425087, 'zn03'),
(-5.639298, -35.427704, 'zn03'),
(-5.630628, -35.427147, 'zn03'),
(-5.630799, -35.425388, 'zn03'),
(-5.630457, -35.425217, 'zn03'),
(-5.631525, -35.421909, 'zn03'),
(-5.631995, -35.421909, 'zn03'),
(-5.633575, -35.418350, 'zn03'),
(-5.640451, -35.428112, 'zn04'),
(-5.640365, -35.433067, 'zn04'),
(-5.639874, -35.435642, 'zn04'),
(-5.633191, -35.436802, 'zn04'),
(-5.632892, -35.435902, 'zn04'),
(-5.630799, -35.436115, 'zn04'),
(-5.630713, -35.427170, 'zn04'),
(-5.639383, -35.427750, 'zn04'),
(-5.655195, -35.436382, 'zn05'),
(-5.653231, -35.435955, 'zn05'),
(-5.653017, -35.436428, 'zn05'),
(-5.644988, -35.435741, 'zn05'),
(-5.644561, -35.436985, 'zn05'),
(-5.639906, -35.435665, 'zn05'),
(-5.640493, -35.428112, 'zn05'),
(-5.639404, -35.427715, 'zn05'),
(-5.640547, -35.425034, 'zn05'),
(-5.642970, -35.426662, 'zn05'),
(-5.651960, -35.434711, 'zn05'),
(-5.652451, -35.434078, 'zn05'),
(-5.655355, -35.434700, 'zn05'),
(-5.656871, -35.435535, 'zn05'),
(-5.644614, -35.436974, 'zn06'),
(-5.644529, -35.438606, 'zn06'),
(-5.646280, -35.438732, 'zn06'),
(-5.646536, -35.439762, 'zn06'),
(-5.648800, -35.440105, 'zn06'),
(-5.647775, -35.445343, 'zn06'),
(-5.647817, -35.446415, 'zn06'),
(-5.647049, -35.446545, 'zn06'),
(-5.647220, -35.449162, 'zn06'),
(-5.643248, -35.449677, 'zn06'),
(-5.643248, -35.450062, 'zn06'),
(-5.642073, -35.450191, 'zn06'),
(-5.641646, -35.444675, 'zn06'),
(-5.641219, -35.444054, 'zn06'),
(-5.641070, -35.445427, 'zn06'),
(-5.636842, -35.445988, 'zn06'),
(-5.635945, -35.436245, 'zn06'),
(-5.639874, -35.435753, 'zn06');

-- --------------------------------------------------------

--
-- Estrutura da tabela `medicoes`
--

DROP TABLE IF EXISTS `medicoes`;
CREATE TABLE IF NOT EXISTS `medicoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `P_id` int(11) NOT NULL,
  `nitrato` double NOT NULL,
  `ph` double NOT NULL,
  `cloro` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `P_id` (`P_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `medicoes`
--

INSERT INTO `medicoes` (`id`, `data`, `P_id`, `nitrato`, `ph`, `cloro`) VALUES
(3, '2021-01-11', 5, 3.5, 8.5, 0.78),
(4, '2021-02-16', 6, 2.6, 8, 0.58),
(5, '2021-02-19', 7, 52.8, 5.7, 11.73),
(6, '2021-01-21', 8, 57.3, 6, 12.73),
(7, '2021-01-14', 9, 64.7, 6.5, 14.38),
(8, '2020-12-31', 10, 69, 5.5, 15.33),
(9, '2020-12-17', 11, 71.5, 6, 15.89),
(10, '2020-12-14', 12, 72.9, 8, 16.2),
(11, '2020-11-09', 13, 80.8, 5, 17.96),
(12, '2021-02-22', 14, 88.2, 6.5, 19.6),
(13, '2021-01-21', 15, 67.7, 7, 15.04),
(14, '2021-02-11', 16, 68.4, 7.5, 15.2),
(15, '2021-01-05', 17, 3.3, 8.5, 0.73),
(16, '2021-02-09', 18, 4.3, 9, 0.96),
(17, '2021-01-20', 19, 6.5, 8, 1.44),
(18, '2021-01-21', 20, 6.6, 7, 1.47),
(19, '2021-01-11', 21, 6.8, 7.5, 1.51),
(20, '2021-01-25', 22, 7.1, 7, 1.58),
(21, '2021-01-14', 23, 8.5, 7.5, 1.89),
(22, '2021-02-02', 24, 16.5, 6, 3.67),
(23, '2021-02-09', 25, 24.4, 6, 5.42),
(24, '2020-11-16', 26, 46, 6.5, 10.22),
(25, '2020-11-20', 27, 84.1, 5.5, 16.69),
(26, '2020-11-18', 28, 119.8, 4.5, 26.62),
(27, '2020-10-12', 29, 8.9, 7, 1.8),
(28, '2020-11-12', 30, 7.1, 7.5, 1.58),
(29, '2020-08-18', 31, 3.1, 8.5, 0.69),
(30, '2020-08-11', 32, 8.4, 6, 1.87),
(31, '2020-08-18', 33, 9.2, 7.5, 2.04),
(32, '2020-09-03', 34, 7.8, 7.5, 1.73),
(33, '2020-08-28', 35, 31.09, 6, 7.09),
(34, '2020-11-20', 36, 7.2, 8, 1.6),
(35, '2021-01-05', 37, 35.7, 6.5, 7.93),
(36, '2020-10-23', 38, 48.6, 6.5, 10.8),
(37, '2021-01-12', 39, 65.7, 7, 14.6),
(38, '2020-11-10', 40, 74.5, 5.5, 16.56),
(39, '2021-01-20', 41, 78.2, 6, 17.38),
(40, '2021-01-25', 42, 81.5, 5, 18.11),
(41, '2021-01-25', 43, 83, 5, 18.44),
(42, '2020-11-16', 44, 87.5, 5, 19.44),
(43, '2021-02-17', 45, 96.2, 6.5, 21.38),
(44, '2021-02-17', 46, 3.3, 8, 0.73),
(45, '2021-02-17', 47, 3.6, 8, 0.8),
(46, '2021-02-20', 48, 7.8, 7, 1.73),
(47, '2021-02-17', 49, 8.4, 7, 1.7),
(48, '2020-12-15', 50, 20.8, 6.5, 4.62),
(49, '2020-12-15', 51, 27.7, 6.5, 6.16),
(50, '2020-12-16', 52, 31, 6.5, 6.89),
(51, '2020-12-16', 53, 58, 7, 12.89),
(52, '2020-12-16', 54, 62.5, 6, 13.89),
(53, '2020-12-16', 55, 82.8, 5, 18.4),
(54, '2020-12-16', 56, 68.5, 6, 15.22),
(55, '2020-12-18', 57, 7.6, 8, 1.69),
(56, '2020-12-18', 58, 95, 4, 21.11),
(57, '2020-12-18', 59, 95.6, 4, 21.24),
(58, '2020-12-17', 60, 69.6, 7, 15.47),
(59, '2020-12-18', 61, 41.4, 7, 9.2),
(60, '2021-01-22', 62, 62.8, 6.5, 13.96),
(61, '2021-01-22', 63, 71.81, 6.5, 15.96),
(62, '2020-09-16', 64, 6.5, 8.5, 1.44),
(63, '2020-09-16', 65, 8.5, 8, 1.89),
(64, '2020-09-25', 66, 7.8, 8.5, 1.73);

-- --------------------------------------------------------

--
-- Estrutura da tabela `poco`
--

DROP TABLE IF EXISTS `poco`;
CREATE TABLE IF NOT EXISTS `poco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_unico` varchar(11) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_unico_f` (`codigo_unico`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `poco`
--

INSERT INTO `poco` (`id`, `codigo_unico`, `lat`, `lng`) VALUES
(5, 'zn01', -5.651822, -35.432037),
(6, 'zn01', -5.650818, -35.430195),
(7, 'zn01', -5.652057, -35.429462),
(8, 'zn01', -5.652185, -35.426846),
(9, 'zn01', -5.665125, -5.665125),
(10, 'zn01', -5.663673, -35.425774),
(11, 'zn01', -5.661452, -35.422085),
(12, 'zn01', -5.658334, -35.424145),
(13, 'zn01', -5.659359, -35.422127),
(14, 'zn01', -5.655003, -35.423286),
(15, 'zn01', -5.651715, -35.423630),
(16, 'zn01', -5.653466, -35.420494),
(17, 'zn02', -5.648256, -35.429379),
(18, 'zn02', -5.646633, -35.428947),
(19, 'zn02', -5.648213, -35.427277),
(20, 'zn02', -5.642917, -35.425087),
(21, 'zn02', -5.649537, -35.423714),
(22, 'zn02', -5.650733, -35.416634),
(23, 'zn02', -5.645693, -35.424786),
(24, 'zn02', -5.647487, -35.422726),
(25, 'zn02', -5.647359, -35.421097),
(26, 'zn02', -5.646761, -35.419422),
(27, 'zn02', -5.645223, -35.417706),
(28, 'zn02', -5.642576, -35.421394),
(29, 'zn02', -5.646120, -35.417664),
(30, 'zn02', -5.641636, -35.423286),
(31, 'zn03', -5.640376, -35.419552),
(32, 'zn03', -5.637515, -35.424999),
(33, 'zn03', -5.635379, -35.422211),
(34, 'zn03', -5.631792, -35.425903),
(35, 'zn03', -5.633927, -35.419510),
(36, 'zn04', -5.631536, -35.435257),
(37, 'zn04', -5.632945, -35.432899),
(38, 'zn04', -5.631322, -35.430279),
(39, 'zn04', -5.634525, -35.427834),
(40, 'zn04', -5.635721, -35.435642),
(41, 'zn04', -5.635636, -35.431953),
(42, 'zn04', -5.636319, -35.429977),
(43, 'zn04', -5.637942, -35.428520),
(44, 'zn04', -5.639308, -35.434528),
(45, 'zn04', -5.639437, -35.428650),
(46, 'zn05', -5.655665, -35.435688),
(47, 'zn05', -5.654128, -35.435600),
(48, 'zn05', -5.652975, -35.434788),
(49, 'zn05', -5.651266, -35.435818),
(50, 'zn05', -5.650113, -35.433929),
(51, 'zn05', -5.647764, -35.435516),
(52, 'zn05', -5.647209, -35.433540),
(53, 'zn05', -5.648021, -35.431953),
(54, 'zn05', -5.645117, -35.435387),
(55, 'zn05', -5.643579, -35.435860),
(56, 'zn05', -5.641102, -35.435215),
(57, 'zn05', -5.640803, -35.427059),
(58, 'zn05', -5.644519, -35.434227),
(59, 'zn05', -5.644391, -35.432083),
(60, 'zn05', -5.644775, -35.429420),
(61, 'zn05', -5.641615, -35.433067),
(62, 'zn05', -5.642554, -35.430279),
(63, 'zn05', -5.643494, -35.428177),
(64, 'zn06', -5.644262, -35.447662),
(65, 'zn06', -5.645330, -35.440708),
(66, 'zn06', -5.641444, -35.440022);

-- --------------------------------------------------------

--
-- Estrutura da tabela `zona`
--

DROP TABLE IF EXISTS `zona`;
CREATE TABLE IF NOT EXISTS `zona` (
  `id` int(11) NOT NULL,
  `codigo_unico` varchar(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  PRIMARY KEY (`codigo_unico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `zona`
--

INSERT INTO `zona` (`id`, `codigo_unico`, `nome`) VALUES
(1, 'zn01', 'zona 1'),
(2, 'zn02', 'zona 2'),
(3, 'zn03', 'zona 3'),
(4, 'zn04', 'zona 4'),
(5, 'zn05', 'zona 5'),
(6, 'zn06', 'zona 6');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `casos`
--
ALTER TABLE `casos`
  ADD CONSTRAINT `codiigo_zona` FOREIGN KEY (`codigo_zona`) REFERENCES `zona` (`codigo_unico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `coordenadas`
--
ALTER TABLE `coordenadas`
  ADD CONSTRAINT `codigo_unico_fk` FOREIGN KEY (`codigo_unico`) REFERENCES `zona` (`codigo_unico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `medicoes`
--
ALTER TABLE `medicoes`
  ADD CONSTRAINT `P_id` FOREIGN KEY (`P_id`) REFERENCES `poco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `poco`
--
ALTER TABLE `poco`
  ADD CONSTRAINT `codigo_unico_f` FOREIGN KEY (`codigo_unico`) REFERENCES `zona` (`codigo_unico`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
