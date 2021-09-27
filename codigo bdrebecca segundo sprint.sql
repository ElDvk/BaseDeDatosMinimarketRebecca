-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-09-2021 a las 18:02:45
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdrebecca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_cat` int(11) NOT NULL,
  `codigoCat` varchar(6) NOT NULL,
  `nombreCat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_cat`, `codigoCat`, `nombreCat`) VALUES
(1, 'ABARRO', 'Abarrotes'),
(2, 'ENLATA', 'Enlatados'),
(3, 'LACTEO', 'Lacteos'),
(4, 'BEBIDA', 'Bebidas'),
(5, 'BEB_AL', 'Bebidas alcoholicas'),
(6, 'CUIPER', 'Ciudado personal'),
(7, 'CONDUL', 'Confiteria dulceria'),
(8, 'HARPAN', 'Harinas y Pan'),
(9, 'FRUVER', 'Frutas y Verduras'),
(10, 'SNACKS', 'Snacks'),
(11, 'ALIPRO', 'Alimentos Procesados'),
(12, 'FIPASA', 'Fideos, pastas y salsas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `codigo_cli` int(11) NOT NULL,
  `nombreCli` varchar(25) NOT NULL,
  `apellidoPCli` varchar(25) NOT NULL,
  `apellidoMCli` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`codigo_cli`, `nombreCli`, `apellidoPCli`, `apellidoMCli`) VALUES
(1, 'Carlos', 'Romero', 'Tapia'),
(2, 'Hugo', 'Cercado', 'Espinoza'),
(3, 'Hillary', 'Soto', 'Zelada'),
(4, 'Jhonatan', 'Choque', 'Luna'),
(5, 'Gianfranco', 'Estrella', 'Espinoza'),
(6, 'Haydee', 'Pachas', 'Javier'),
(7, 'Hiber', 'Pachas', 'Javier'),
(9, 'Renato', 'Hernández', 'Figueroa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante`
--

CREATE TABLE `comprobante` (
  `codigo_com` int(11) NOT NULL,
  `codigo_tipocom` varchar(6) NOT NULL,
  `fechaCom` date NOT NULL,
  `codigo_cli` int(11) NOT NULL,
  `precioTotal` double(5,2) DEFAULT NULL,
  `serieCom` varchar(4) DEFAULT NULL,
  `numeracionCom` varchar(4) DEFAULT NULL,
  `subTotal` decimal(5,2) NOT NULL,
  `igv` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comprobante`
--

INSERT INTO `comprobante` (`codigo_com`, `codigo_tipocom`, `fechaCom`, `codigo_cli`, `precioTotal`, `serieCom`, `numeracionCom`, `subTotal`, `igv`) VALUES
(1, 'BOLETA', '2021-08-29', 1, 5.89, 'BB01', '001', '0.00', '0.00'),
(2, 'BOLETA', '2021-08-29', 2, 4.80, 'BB01', '002', '0.00', '0.00'),
(3, 'BOLETA', '2021-08-29', 3, 5.50, 'BB01', '003', '0.00', '0.00'),
(4, 'BOLETA', '2021-09-02', 4, 2.30, 'BB01', '004', '0.00', '0.00'),
(5, 'FACTUR', '2021-09-02', 5, 3.50, 'FF01', '001', '0.00', '0.00'),
(6, 'FACTUR', '2021-09-02', 6, 7.99, 'FF01', '002', '0.00', '0.00'),
(14, 'BOLETA', '2021-09-30', 7, 23.10, 'BB01', '005', '0.00', '0.00'),
(15, 'BOLETA', '2021-09-23', 7, 41.30, 'BB01', '006', '0.00', '0.00'),
(16, 'FACTUR', '2021-09-30', 7, 0.00, 'FF01', '003', '0.00', '0.00'),
(17, 'BOLETA', '2021-09-25', 7, 0.00, 'BB01', '007', '0.00', '0.00'),
(18, 'BOLETA', '2021-09-30', 7, 193.10, 'BB01', '008', '0.00', '35.00'),
(19, 'BOLETA', '2021-09-22', 7, 21.90, 'BB01', '009', '0.00', '3.94'),
(20, 'FACTUR', '2021-09-29', 7, 31.50, 'FF01', '004', '26.69', '5.67'),
(21, 'BOLETA', '2021-09-26', 9, 41.80, 'BB01', '010', '35.42', '6.38'),
(23, 'BOLETA', '2021-09-26', 3, 27.90, 'BB01', '011', '23.64', '4.26'),
(24, 'BOLETA', '2021-09-25', 6, 6.70, 'BB01', '012', '5.68', '1.02'),
(25, 'FACTUR', '2021-09-26', 5, 60.48, 'FF01', '005', '51.25', '9.23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecomp`
--

CREATE TABLE `detallecomp` (
  `id_producto` int(11) NOT NULL,
  `codigo_com` int(11) NOT NULL,
  `cantidadPro` int(11) DEFAULT NULL,
  `subtotal` double(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallecomp`
--

INSERT INTO `detallecomp` (`id_producto`, `codigo_com`, `cantidadPro`, `subtotal`) VALUES
(1, 1, 1, 5.89),
(2, 2, 1, 4.80),
(3, 3, 1, 5.50),
(4, 4, 1, 2.30),
(4, 15, 2, 2.30),
(5, 5, 1, 3.50),
(6, 6, 1, 7.99),
(7, 24, 1, 4.30),
(9, 15, 1, 20.90),
(9, 18, 4, 20.90),
(9, 20, 1, 20.90),
(9, 21, 2, 20.90),
(9, 25, 1, 20.90),
(10, 15, 1, 15.80),
(11, 14, 1, 1.20),
(11, 20, 1, 1.20),
(11, 23, 5, 1.20),
(11, 24, 2, 1.20),
(12, 14, 1, 21.90),
(12, 18, 5, 21.90),
(12, 19, 1, 21.90),
(12, 23, 1, 21.90),
(13, 20, 1, 9.40),
(14, 25, 2, 19.79);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `cod_inventario` varchar(10) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventariodetalle`
--

CREATE TABLE `inventariodetalle` (
  `codigo_invdet` int(11) NOT NULL,
  `fechaMov` date NOT NULL,
  `codigo_mov` varchar(10) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `codigo_mov` varchar(10) NOT NULL,
  `nombreMov` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `codigoPro` varchar(6) NOT NULL,
  `nombrePro` varchar(70) NOT NULL,
  `precioPro` double(5,2) NOT NULL,
  `id_cat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `codigoPro`, `nombrePro`, `precioPro`, `id_cat`) VALUES
(1, 'FLO001', 'Trozos de atún Florida', 5.89, 2),
(2, 'CAM001', 'Trozos de atún Campomar', 4.80, 2),
(3, 'PRI001', 'Trozos de atún Primor', 5.50, 2),
(4, 'CIE001', 'Agua sin gas 2.5L Cielo', 2.30, 4),
(5, 'SMA001', 'Agua sin gas 2.5L San Mateo', 3.50, 4),
(6, 'BAL001', 'Piña en rodajas 567g Bali', 7.90, 2),
(7, 'INK001', 'Gaseosa 1L Inca Kola', 4.30, 4),
(8, 'PEP001', 'Gaseosa 1L Pepsi', 3.80, 4),
(9, 'CUS001', 'Cerveza Pack 6un 310ml Cusqueña', 20.90, 5),
(10, 'LAI001', 'Leche sin lactosa pack 6 un 400g Laive', 15.80, 3),
(11, 'PIC001', 'Galletas Pícaras', 1.20, 7),
(12, 'CRI001', 'Cerveza Pack 6un 310ml Cristal', 21.90, 5),
(13, 'DAN001', 'Yogurt frutado 900g Danlac', 9.40, 3),
(14, 'LAI002', 'Leche Evaporada Pack 6 un Laive', 19.79, 3),
(15, 'DOR001', 'Dippas Doritos 320g Doritos', 11.50, 10),
(16, 'LAY001', 'Papas al hilo 155g Lays', 5.20, 10),
(17, 'LAY002', 'Papas fritas Ondas Picantes Lays', 5.50, 10),
(18, 'COL001', 'Pasta dental Herbal 90g Colgate', 2.70, 6),
(19, 'COL002', 'Pasta dental Triple Acción 100ml Colgate', 10.50, 6),
(20, 'NES001', 'Wafer Sublime sabor chocolate Pack 6un Nestlé', 5.50, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocomprobante`
--

CREATE TABLE `tipocomprobante` (
  `codigo_tipocom` varchar(6) NOT NULL,
  `nombreCom` varchar(30) NOT NULL,
  `valorComp` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipocomprobante`
--

INSERT INTO `tipocomprobante` (`codigo_tipocom`, `nombreCom`, `valorComp`) VALUES
('BOLETA', 'Boleta de venta', 'BB01'),
('FACTUR', 'Factura de venta', 'FF01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo_cli`);

--
-- Indices de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD PRIMARY KEY (`codigo_com`),
  ADD KEY `fk_clientecomp` (`codigo_cli`),
  ADD KEY `fk_tipocomcomp` (`codigo_tipocom`);

--
-- Indices de la tabla `detallecomp`
--
ALTER TABLE `detallecomp`
  ADD PRIMARY KEY (`id_producto`,`codigo_com`),
  ADD KEY `fk_compdetallecomp` (`codigo_com`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`cod_inventario`),
  ADD KEY `fk_productoinventario` (`id_producto`);

--
-- Indices de la tabla `inventariodetalle`
--
ALTER TABLE `inventariodetalle`
  ADD PRIMARY KEY (`codigo_invdet`),
  ADD KEY `fk_movimientoinvdet` (`codigo_mov`),
  ADD KEY `fk_productoinvdet` (`id_producto`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`codigo_mov`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_categoriaproducto` (`id_cat`);

--
-- Indices de la tabla `tipocomprobante`
--
ALTER TABLE `tipocomprobante`
  ADD PRIMARY KEY (`codigo_tipocom`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codigo_cli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  MODIFY `codigo_com` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `inventariodetalle`
--
ALTER TABLE `inventariodetalle`
  MODIFY `codigo_invdet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD CONSTRAINT `fk_clientecomp` FOREIGN KEY (`codigo_cli`) REFERENCES `cliente` (`codigo_cli`),
  ADD CONSTRAINT `fk_tipocomcomp` FOREIGN KEY (`codigo_tipocom`) REFERENCES `tipocomprobante` (`codigo_tipocom`);

--
-- Filtros para la tabla `detallecomp`
--
ALTER TABLE `detallecomp`
  ADD CONSTRAINT `fk_compdetallecomp` FOREIGN KEY (`codigo_com`) REFERENCES `comprobante` (`codigo_com`),
  ADD CONSTRAINT `fk_productodetallecomp` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_productoinventario` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `inventariodetalle`
--
ALTER TABLE `inventariodetalle`
  ADD CONSTRAINT `fk_movimientoinvdet` FOREIGN KEY (`codigo_mov`) REFERENCES `movimiento` (`codigo_mov`),
  ADD CONSTRAINT `fk_productoinvdet` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_categoriaproducto` FOREIGN KEY (`id_cat`) REFERENCES `categoria` (`id_cat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
