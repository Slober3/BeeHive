-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Gegenereerd op: 19 mei 2019 om 12:07
-- Serverversie: 8.0.13-4
-- PHP-versie: 7.2.17-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `KJTvuGdiET`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `airp`
--

CREATE TABLE `airp` (
  `id` int(11) NOT NULL,
  `Did` int(11) NOT NULL,
  `hpa` float NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `airp`
--

INSERT INTO `airp` (`id`, `Did`, `hpa`) VALUES
(1, 1, 100496),
(2, 1, 100486),
(3, 1, 100474),
(4, 1, 100468),
(5, 1, 100472),
(6, 1, 100465),
(7, 1, 100463),
(8, 1, 100453),
(9, 1, 100447),
(10, 1, 100439),
(11, 1, 100427),
(12, 1, 100416),
(13, 1, 100408),
(14, 1, 100412),
(15, 1, 100408),
(16, 1, 100414),
(17, 1, 100433),
(18, 1, 100439),
(19, 1, 100451),
(20, 1, 100449),
(21, 1, 100451),
(22, 1, 100457),
(23, 1, 100463),
(24, 1, 100465),
(25, 1, 100465),
(26, 1, 100463),
(27, 1, 100470),
(28, 1, 100453),
(29, 1, 100457),
(30, 1, 100465),
(31, 1, 100468),
(32, 1, 100459),
(33, 1, 100453),
(34, 1, 100437),
(35, 1, 100447),
(36, 1, 100453),
(37, 1, 100449),
(38, 1, 100433),
(39, 1, 100429),
(40, 1, 100429);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `airq`
--

CREATE TABLE `airq` (
  `id` int(11) NOT NULL,
  `Did` int(11) NOT NULL,
  `airq` float NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `airq`
--

INSERT INTO `airq` (`id`, `Did`, `airq`) VALUES
(1, 1, 3793),
(2, 1, 3818),
(3, 1, 3829),
(4, 1, 3892),
(5, 1, 3900),
(6, 1, 3936),
(7, 1, 3968),
(8, 1, 4002),
(9, 1, 4057),
(10, 1, 4102),
(11, 1, 4131),
(12, 1, 4170),
(13, 1, 4207),
(14, 1, 4244),
(15, 1, 4275),
(16, 1, 4321),
(17, 1, 4361),
(18, 1, 4408),
(19, 1, 4423),
(20, 1, 4461),
(21, 1, 4484),
(22, 1, 4530),
(23, 1, 4558),
(24, 1, 4651),
(25, 1, 4680),
(26, 1, 4634),
(27, 1, 4598),
(28, 1, 4582),
(29, 1, 4590),
(30, 1, 4590),
(31, 1, 4598),
(32, 1, 4622),
(33, 1, 4606),
(34, 1, 4558),
(35, 1, 4515),
(36, 1, 4526),
(37, 1, 4530),
(38, 1, 4511),
(39, 1, 4491);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Devices`
--

CREATE TABLE `Devices` (
  `Did` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Devices`
--

INSERT INTO `Devices` (`Did`, `userID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `hum`
--

CREATE TABLE `hum` (
  `id` int(11) NOT NULL,
  `Did` int(11) NOT NULL,
  `hum` float NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `hum`
--

INSERT INTO `hum` (`id`, `Did`, `hum`) VALUES
(2, 1, 53.25),
(3, 1, 53.28),
(4, 1, 53.38),
(5, 1, 53.57),
(6, 1, 53.63),
(7, 1, 53.62),
(8, 1, 53.75),
(9, 1, 53.71),
(10, 1, 53.67),
(11, 1, 53.62),
(12, 1, 53.63),
(13, 1, 53.64),
(14, 1, 53.68),
(15, 1, 53.63),
(16, 1, 53.58),
(17, 1, 53.71),
(18, 1, 53.61),
(19, 1, 53.44),
(20, 1, 53.42),
(21, 1, 53.36),
(22, 1, 53.26),
(23, 1, 53.2),
(24, 1, 53.06),
(25, 1, 52.96),
(26, 1, 54.22),
(27, 1, 53.79),
(28, 1, 53.7),
(29, 1, 53.19),
(30, 1, 52.92),
(31, 1, 52.3),
(32, 1, 52.13),
(33, 1, 51.77),
(34, 1, 51.8),
(35, 1, 51.79),
(36, 1, 51.75),
(37, 1, 51.63),
(38, 1, 50.51),
(39, 1, 50.15),
(40, 1, 51.28),
(41, 1, 51.25);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `temp`
--

CREATE TABLE `temp` (
  `id` int(11) NOT NULL,
  `Did` int(11) NOT NULL,
  `temp` float NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `temp`
--

INSERT INTO `temp` (`id`, `Did`, `temp`) VALUES
(1, 1, 22.88),
(2, 1, 22.75),
(3, 1, 22.59),
(4, 1, 22.41),
(5, 1, 22.28),
(6, 1, 22.17),
(7, 1, 22.04),
(8, 1, 21.99),
(9, 1, 21.92),
(10, 1, 21.84),
(11, 1, 21.77),
(12, 1, 21.69),
(13, 1, 21.62),
(14, 1, 21.56),
(15, 1, 21.5),
(16, 1, 21.41),
(17, 1, 21.39),
(18, 1, 21.39),
(19, 1, 21.37),
(20, 1, 21.37),
(21, 1, 21.39),
(22, 1, 21.41),
(23, 1, 21.46),
(24, 1, 21.49),
(25, 1, 21.76),
(26, 1, 22.12),
(27, 1, 22.33),
(28, 1, 22.43),
(29, 1, 22.44),
(30, 1, 22.63),
(31, 1, 22.74),
(32, 1, 23.02),
(33, 1, 23.18),
(34, 1, 23.54),
(35, 1, 23.95),
(36, 1, 24.3),
(37, 1, 24.63),
(38, 1, 24.74),
(39, 1, 25.15),
(40, 1, 25.52);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `weight`
--

CREATE TABLE `weight` (
  `id` int(11) NOT NULL,
  `Did` int(11) NOT NULL,
  `weight` float NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `weight`
--

INSERT INTO `weight` (`id`, `Did`, `weight`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 0),
(4, 1, 0),
(5, 1, 0),
(6, 1, 0),
(7, 1, 0),
(8, 1, 0),
(9, 1, 0),
(10, 1, 0),
(11, 1, 0),
(12, 1, 0),
(13, 1, 0),
(14, 1, 0),
(15, 1, 0),
(16, 1, 0),
(17, 1, 0),
(18, 1, 0),
(19, 1, 0),
(20, 1, 0),
(21, 1, 0),
(22, 1, 0),
(23, 1, 0),
(24, 1, 0),
(25, 1, 0),
(26, 1, 0),
(27, 1, 0),
(28, 1, 0),
(29, 1, 0),
(30, 1, 0),
(31, 1, 0),
(32, 1, 0),
(33, 1, 0),
(34, 1, 0),
(35, 1, 0),
(36, 1, 0),
(37, 1, 0),
(38, 1, 0),
(39, 1, 0);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `airp`
--
ALTER TABLE `airp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Did` (`Did`);

--
-- Indexen voor tabel `airq`
--
ALTER TABLE `airq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Did` (`Did`);

--
-- Indexen voor tabel `Devices`
--
ALTER TABLE `Devices`
  ADD PRIMARY KEY (`Did`);

--
-- Indexen voor tabel `hum`
--
ALTER TABLE `hum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Did` (`Did`);

--
-- Indexen voor tabel `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Did` (`Did`);

--
-- Indexen voor tabel `weight`
--
ALTER TABLE `weight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Did` (`Did`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `airp`
--
ALTER TABLE `airp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT voor een tabel `airq`
--
ALTER TABLE `airq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT voor een tabel `Devices`
--
ALTER TABLE `Devices`
  MODIFY `Did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `hum`
--
ALTER TABLE `hum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT voor een tabel `temp`
--
ALTER TABLE `temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT voor een tabel `weight`
--
ALTER TABLE `weight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `Devices`
--
ALTER TABLE `Devices`
  ADD CONSTRAINT `Devices_ibfk_1` FOREIGN KEY (`Did`) REFERENCES `temp` (`did`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
