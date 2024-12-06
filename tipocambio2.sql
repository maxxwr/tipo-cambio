-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2024 a las 04:17:46
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tipocambio2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cambio`
--

CREATE TABLE `tipo_cambio` (
  `id` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `compra` double DEFAULT NULL,
  `venta` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_cambio`
--

INSERT INTO `tipo_cambio` (`id`, `fecha`, `compra`, `venta`, `created_at`, `updated_at`) VALUES
(1, '2024-09-04', 3.771, 3.781, '2024-09-04 19:44:22', '2024-09-04 19:44:22'),
(2, '2024-09-05', 3.793, 3.797, '2024-09-05 19:53:50', '2024-09-05 19:53:50'),
(3, '2024-09-07', 3.779, 3.781, '2024-09-08 07:19:00', '2024-09-08 07:19:00'),
(4, '2024-09-08', 3.779, 3.781, '2024-09-08 16:18:31', '2024-09-08 16:18:31'),
(5, '2024-09-28', 3.716, 3.722, '2024-09-29 00:55:29', '2024-09-29 00:55:29'),
(6, '2024-10-02', 3.712, 3.718, '2024-10-02 19:58:47', '2024-10-02 19:58:47'),
(9, '2024-11-11', 3.764, 3.769, '2024-11-12 10:40:58', '2024-11-12 10:40:58'),
(11, '2024-11-12', 3.766, 3.781, '2024-11-12 15:24:11', '2024-11-12 15:24:11'),
(12, '2024-12-05', 3.734, 3.74, '2024-12-06 03:07:21', '2024-12-06 03:07:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `password`) VALUES
(1, 'maxtipo2030@gmail.com', 'max tipo', '$2a$10$m40KZUupyUyMo9XKVTlVXeqK2vRxBuOGXBVOSiQpZcgTyvtw8I/dy'),
(103, 'éruegmail.com', 'pruebanumb1', '$2a$10$RIQLjEpDrbz1BV4803RWSuHdqm8pdzzN/5fIbs0TZ5xQ.2NH5Ylyi'),
(153, 'lulidsdssdogmail.com', 'jdfsfsd', '$2a$10$8Gmpv2MOQxWQInXvq4WAA.Zb0WF8mcZ0pUsgEOyr5MR6wEG1lIvQ.'),
(202, 'prueba-ficticia', 'max winchez', '$2a$10$UOm68ikY1vNu4nTzl/WPQ.2G/2YXDEdWk2VplajFc7afj3hUhJx.2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_seq`
--

CREATE TABLE `user_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_seq`
--

INSERT INTO `user_seq` (`next_val`) VALUES
(301);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tipo_cambio`
--
ALTER TABLE `tipo_cambio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fecha` (`fecha`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tipo_cambio`
--
ALTER TABLE `tipo_cambio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
