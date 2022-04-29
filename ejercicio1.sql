-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2022 a las 05:00:25
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercicio1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `rut` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `comuna` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`rut`, `nombre`, `comuna`) VALUES
(1, 'Ruperta', 'providencia'),
(2, 'eduard', 'las condes'),
(3, 'kaleht', 'providencia'),
(4, 'Gertrudis', 'arauco'),
(5, 'Cristian', 'primavera'),
(6, 'Letti', 'quillota'),
(7, 'Wally', 'providencia'),
(8, 'willy', 'san fernando'),
(9, 'Isak', 'las condes'),
(10, 'Tatiania', 'mejillones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deptos`
--

CREATE TABLE `deptos` (
  `numdep` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `deptos`
--

INSERT INTO `deptos` (`numdep`, `nombre`, `ciudad`) VALUES
(1, 'ventas', 'sales'),
(2, 'logistica', 'el paso'),
(3, 'soporte comercial', 'toledo'),
(4, 'marketing', 'new york'),
(5, 'contabilidad', 'new york');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `rut` int(10) UNSIGNED NOT NULL,
  `DEPTOS_numdep` int(10) UNSIGNED NOT NULL,
  `GRADOS_grado` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `cargo` varchar(45) COLLATE utf8_bin NOT NULL,
  `rut_jefe` int(11) NOT NULL,
  `sueldo` int(11) NOT NULL,
  `comicion` varchar(11) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`rut`, `DEPTOS_numdep`, `GRADOS_grado`, `nombre`, `cargo`, `rut_jefe`, `sueldo`, `comicion`) VALUES
(1, 5, 1, 'martin', 'vendedor', 8, 20000, '6%'),
(2, 4, 1, 'ward', 'vendedor', 15, 18500, '6%'),
(3, 2, 2, 'turner', 'vendedor', 14, 25000, '6%'),
(4, 3, 2, 'clark', 'supervisor', 4, 23000, '4%'),
(5, 1, 2, 'allen', 'manager', 5, 33000, '0'),
(6, 1, 2, 'scott', 'supervisor', 5, 22500, '4%'),
(7, 1, 1, 'john', 'vendedor', 6, 22000, '6%'),
(8, 5, 3, 'jose', 'manager', 8, 29000, '0'),
(9, 4, 1, 'marlyn', 'vendedor', 15, 19000, '6%'),
(10, 3, 1, 'juliete', 'vendedor', 4, 18000, '6%'),
(11, 5, 1, 'julian', 'vendedor', 8, 22000, '6%'),
(12, 4, 3, 'carlos', 'manager', 12, 30000, '0'),
(13, 2, 3, 'monica', 'manager', 13, 28000, '0'),
(14, 2, 2, 'juan', 'supervisor', 13, 26000, '4%'),
(15, 4, 2, 'camilo', 'supervisor', 12, 22000, '4%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `grado` int(10) UNSIGNED NOT NULL,
  `sueldo_inf` int(10) UNSIGNED NOT NULL,
  `sueldo_sup` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`grado`, `sueldo_inf`, `sueldo_sup`) VALUES
(1, 18000, 22000),
(2, 23000, 27000),
(3, 28000, 33000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `precio` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codigo`, `nombre`, `precio`) VALUES
(1, 'televisor', 35000),
(2, 'proyector', 25000),
(3, 'silla', 10000),
(4, 'lavadora', 30000),
(5, 'mesa', 1500),
(6, 'dvd', 25000),
(7, 'nevera', 40000),
(8, 'sofa', 30000),
(9, 'portatil', 35000),
(10, 'cama', 35000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `num_venta` int(10) UNSIGNED NOT NULL,
  `EMPLEADOS_rut` int(10) UNSIGNED NOT NULL,
  `CLIENTES_rut` int(10) UNSIGNED NOT NULL,
  `monto` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`num_venta`, `EMPLEADOS_rut`, `CLIENTES_rut`, `monto`, `fecha`) VALUES
(1, 1, 1, 3, '2020-04-15'),
(2, 2, 7, 5, '2020-10-16'),
(3, 3, 4, 2, '2020-04-09'),
(4, 3, 9, 2, '2020-10-21'),
(5, 5, 10, 5, '2020-09-16'),
(6, 1, 3, 4, '2020-07-22'),
(7, 1, 7, 6, '2020-01-15'),
(8, 3, 5, 1, '2020-04-03'),
(9, 9, 10, 3, '2020-02-04'),
(10, 1, 4, 8, '2020-06-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_detalle`
--

CREATE TABLE `ventas_detalle` (
  `VENTAS_num_venta` int(10) UNSIGNED NOT NULL,
  `PRODUCTOS_codigo` int(10) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `ventas_detalle`
--

INSERT INTO `ventas_detalle` (`VENTAS_num_venta`, `PRODUCTOS_codigo`, `cantidad`) VALUES
(1, 1, 2),
(2, 3, 4),
(3, 2, 5),
(4, 5, 1),
(3, 6, 6),
(8, 7, 1),
(3, 1, 2),
(10, 6, 1),
(3, 3, 2),
(7, 7, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`rut`);

--
-- Indices de la tabla `deptos`
--
ALTER TABLE `deptos`
  ADD PRIMARY KEY (`numdep`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`rut`),
  ADD KEY `EMPLEADOS_FKIndex1` (`GRADOS_grado`),
  ADD KEY `EMPLEADOS_FKIndex2` (`DEPTOS_numdep`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`grado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`num_venta`),
  ADD KEY `VENTAS_FKIndex1` (`CLIENTES_rut`),
  ADD KEY `VENTAS_FKIndex2` (`EMPLEADOS_rut`);

--
-- Indices de la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  ADD KEY `VENTAS_DETALLE_FKIndex1` (`PRODUCTOS_codigo`),
  ADD KEY `VENTAS_DETALLE_FKIndex2` (`VENTAS_num_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `grado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `num_venta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`GRADOS_grado`) REFERENCES `grados` (`grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`DEPTOS_numdep`) REFERENCES `deptos` (`numdep`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`CLIENTES_rut`) REFERENCES `clientes` (`rut`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`EMPLEADOS_rut`) REFERENCES `empleados` (`rut`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  ADD CONSTRAINT `ventas_detalle_ibfk_1` FOREIGN KEY (`VENTAS_num_venta`) REFERENCES `ventas` (`num_venta`),
  ADD CONSTRAINT `ventas_detalle_ibfk_2` FOREIGN KEY (`PRODUCTOS_codigo`) REFERENCES `productos` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
