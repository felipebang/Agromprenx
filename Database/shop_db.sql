-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2022 a las 03:45:35
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shop_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `nombre`, `precio`, `quantity`, `imagen`) VALUES
(212, 26, 39, 'Mango', 2500, 6, '1660264879_istockphoto-168370138-612x612.jpg'),
(213, 26, 38, 'Durasno', 5000, 3, '1660264843_Durasno.webp'),
(214, 26, 41, 'Naranja', 1800, 1, '1660264900_1651213093_img2.jpg'),
(215, 26, 42, 'Papaya', 2000, 1, '1660264920_1651212248_papaya.jpg'),
(216, 30, 38, 'Durasno', 5000, 3, '1660264843_Durasno.webp'),
(217, 30, 39, 'Mango', 2500, 6, '1660264879_istockphoto-168370138-612x612.jpg'),
(218, 30, 40, 'Banana', 1200, 1, '1660264891_1651211962_img4.jpg'),
(219, 30, 41, 'Naranja', 1800, 2, '1660264900_1651213093_img2.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `day`
--

CREATE TABLE `day` (
  `id_day` int(11) NOT NULL,
  `name_day` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `day`
--

INSERT INTO `day` (`id_day`, `name_day`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miercoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'sábado'),
(7, 'Domingo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestionar_valores`
--

CREATE TABLE `gestionar_valores` (
  `id_valor` int(11) NOT NULL,
  `Valor_Domicilio_Minimo` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gestionar_valores`
--

INSERT INTO `gestionar_valores` (`id_valor`, `Valor_Domicilio_Minimo`, `nombre`) VALUES
(11, 30000, 'Domicilio'),
(22, 4000, 'Monto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_pedidos`
--

CREATE TABLE `orden_pedidos` (
  `idPedido` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datetime` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden_pedidos`
--

INSERT INTO `orden_pedidos` (`idPedido`, `user_id`, `datetime`) VALUES
(39, 26, '16/09/2022 12:45 pm'),
(41, 30, '16/09/2022 09:30 pm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `nombre`, `imagen`, `descripcion`, `precio`) VALUES
(38, 'Durasno', '1660264843_Durasno.webp', 'Prunus persica, originalmente Amygdalus persica L. y comúnmente conocido como melocotonero ​, es una especie de árbol del género Prunus de la familia Rosaceae.                                    ', '5000'),
(39, 'Mango', '1660264879_istockphoto-168370138-612x612.jpg', 'El mango es el nombre de las frutas de varias especies de árboles del género Mangifera, especialmente de Mangifera indica, y sus numerosos cultivares            ', '2500'),
(40, 'Banana', '1660264891_1651211962_img4.jpg', 'La banana, ​ conocido también como banano, plátano, ​ guineo maduro, guineo, cambur o gualele, es un fruto comestible            ', '1200'),
(41, 'Naranja', '1660264900_1651213093_img2.jpg', 'La naranja es una fruta cítrica obtenida del naranjo dulce, del naranjo amargo y de naranjos de otras variedades o híbridos, de origen asiático.            ', '1800'),
(42, 'Papaya', '1660264920_1651212248_papaya.jpg', 'Carica papaya es una planta herbácea del género Carica en la familia Caricaceae.             ', '2000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `ciudad` varchar(200) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `ndireccion` varchar(3) NOT NULL,
  `ncasa` varchar(3) NOT NULL,
  `n1casa` varchar(3) NOT NULL,
  `barrio` varchar(200) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `apellido`, `celular`, `email`, `password`, `ciudad`, `direccion`, `ndireccion`, `ncasa`, `n1casa`, `barrio`, `user_type`) VALUES
(26, 'Jefferson', 'Hurtado', '3184025433', 'hurtadopereaj@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Palmira', 'Calle', '85', '15', '88', 'Zamorano', 'user'),
(30, 'Deiver', 'Quinto', '3258964741', 'Quinto@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'Palmira', 'Avenida', '8', '250', '111', 'El sembrador', 'user'),
(32, 'Deiver', 'Quinto', '3007754194', 'deiver.quinto@gmail.com', 'c8e76bf1c6a6b1b5c0dfc01324609225', 'Palmira', 'Carrera', '41b', '34', '01', 'Zamorano', 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `name_product` varchar(50) NOT NULL,
  `price_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `fecha_venta` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_day` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `day`
--
ALTER TABLE `day`
  ADD PRIMARY KEY (`id_day`);

--
-- Indices de la tabla `gestionar_valores`
--
ALTER TABLE `gestionar_valores`
  ADD PRIMARY KEY (`id_valor`);

--
-- Indices de la tabla `orden_pedidos`
--
ALTER TABLE `orden_pedidos`
  ADD PRIMARY KEY (`idPedido`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_day` (`id_day`),
  ADD KEY `name_day` (`id_day`),
  ADD KEY `id_day_2` (`id_day`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT de la tabla `day`
--
ALTER TABLE `day`
  MODIFY `id_day` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `gestionar_valores`
--
ALTER TABLE `gestionar_valores`
  MODIFY `id_valor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `orden_pedidos`
--
ALTER TABLE `orden_pedidos`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_day`) REFERENCES `day` (`id_day`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
