-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Jún 01. 10:56
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `utazasiiroda`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `id` int(11) NOT NULL,
  `felhasznalonev` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jelszo` varchar(255) NOT NULL,
  `telefonszam` varchar(20) DEFAULT NULL,
  `regisztracio_ideje` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`id`, `felhasznalonev`, `email`, `jelszo`, `telefonszam`, `regisztracio_ideje`) VALUES
(1, 'janos123', 'janos@email.hu', '$2y$10$abc123', '+36201234567', '2026-06-01 08:52:36'),
(2, 'eva89', 'eva@email.hu', '$2y$10$def456', '+36301234567', '2026-06-01 08:52:36'),
(3, 'peter77', 'peter@email.hu', '$2y$10$ghi789', '+36701234567', '2026-06-01 08:52:36'),
(4, 'anna22', 'anna@email.hu', '$2y$10$jkl012', '+36205556666', '2026-06-01 08:52:36'),
(5, 'tamas01', 'tamas@email.hu', '$2y$10$mno345', '+36305557777', '2026-06-01 08:52:36');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ingatlanok`
--

CREATE TABLE `ingatlanok` (
  `id` int(11) NOT NULL,
  `tulajdonos_id` int(11) NOT NULL,
  `cim` varchar(255) NOT NULL,
  `varos` varchar(100) NOT NULL,
  `kerulet` varchar(50) DEFAULT NULL,
  `ar` int(11) NOT NULL,
  `alapterulet` int(11) NOT NULL,
  `szobak_szama` decimal(3,1) DEFAULT NULL,
  `leiras` text DEFAULT NULL,
  `tipus` enum('lakás','ház','telek','iroda') NOT NULL,
  `kep_url` varchar(255) DEFAULT NULL,
  `letrehozva` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `ingatlanok`
--

INSERT INTO `ingatlanok` (`id`, `tulajdonos_id`, `cim`, `varos`, `kerulet`, `ar`, `alapterulet`, `szobak_szama`, `leiras`, `tipus`, `kep_url`, `letrehozva`) VALUES
(1, 1, 'Fő utca 12.', 'Budapest', 'XI.', 65000000, 78, 3.5, 'Felújított lakás kiváló közlekedéssel.', 'lakás', 'https://example.com/lakas1.jpg', '2026-06-01 08:52:36'),
(2, 2, 'Petőfi utca 8.', 'Debrecen', NULL, 48000000, 120, 4.0, 'Családi ház nagy kerttel.', 'ház', 'https://example.com/haz1.jpg', '2026-06-01 08:52:36'),
(3, 3, 'Kossuth tér 3.', 'Szeged', NULL, 32000000, 65, 2.0, 'Belvárosi lakás közel az egyetemhez.', 'lakás', 'https://example.com/lakas2.jpg', '2026-06-01 08:52:36'),
(4, 4, 'Ipari park 15.', 'Győr', NULL, 89000000, 250, 8.0, 'Modern irodaépület parkolóval.', 'iroda', 'https://example.com/iroda1.jpg', '2026-06-01 08:52:36'),
(5, 5, 'Domboldal utca 1.', 'Pécs', NULL, 18000000, 850, 0.0, 'Építési telek panorámás kilátással.', 'telek', 'https://example.com/telek1.jpg', '2026-06-01 08:52:36');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `felhasznalonev` (`felhasznalonev`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A tábla indexei `ingatlanok`
--
ALTER TABLE `ingatlanok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ingatlan_tulajdonos` (`tulajdonos_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `ingatlanok`
--
ALTER TABLE `ingatlanok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `ingatlanok`
--
ALTER TABLE `ingatlanok`
  ADD CONSTRAINT `fk_ingatlan_tulajdonos` FOREIGN KEY (`tulajdonos_id`) REFERENCES `felhasznalok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
