-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-11-2020 a las 00:56:16
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pastley`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `nombre` varchar(300) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`nombre`, `estado`, `fecha_registro`) VALUES
('LO NUEVO', 1, '2020-10-31 18:21:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `documento` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_producto`
--

CREATE TABLE `detalle_producto` (
  `id` varchar(300) NOT NULL,
  `producto` varchar(300) NOT NULL,
  `dimension` varchar(500) NOT NULL,
  `sabor` varchar(500) NOT NULL,
  `adicionales` varchar(500) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `stock_minimo` int(11) NOT NULL,
  `foto` longblob DEFAULT NULL,
  `precio_venta` bigint(20) NOT NULL,
  `descuento` bigint(20) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` varchar(300) NOT NULL,
  `venta` varchar(300) NOT NULL,
  `producto` varchar(300) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` bigint(20) NOT NULL,
  `descuento` bigint(20) NOT NULL DEFAULT 0,
  `subtotal` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `nit` varchar(500) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `logo` longblob NOT NULL,
  `portada` longblob DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_sucursal`
--

CREATE TABLE `empresa_sucursal` (
  `nit_empresa` varchar(300) NOT NULL,
  `nit_sucursal` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `genero` varchar(300) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `nombre` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`genero`, `estado`, `nombre`) VALUES
('M', 1, 'MASCULINO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `documento` int(11) NOT NULL,
  `tipo_documento` varchar(300) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `apellido` varchar(500) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `foto` longblob DEFAULT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  `genero` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`documento`, `tipo_documento`, `nombre`, `apellido`, `telefono`, `email`, `direccion`, `foto`, `fecha_nacimiento`, `genero`) VALUES
(1010058716, 'CC', 'SERGIO STIVES', 'BARRIOS BUITRAGO', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', 'M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` varchar(300) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `categoria` varchar(300) NOT NULL,
  `stock` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `descripcion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `rol` varchar(300) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `nit` varchar(500) NOT NULL,
  `direccion` varchar(500) NOT NULL,
  `presupuesto` bigint(20) NOT NULL,
  `presupuesto_minimo` bigint(20) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_cliente`
--

CREATE TABLE `sucursal_cliente` (
  `documento_cliente` int(11) NOT NULL,
  `nit_sucursal` varchar(300) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `puntos` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_usuario`
--

CREATE TABLE `sucursal_usuario` (
  `documento_usuario` int(11) NOT NULL,
  `nit_sucursal` varchar(300) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_venta`
--

CREATE TABLE `sucursal_venta` (
  `nit_sucursal` varchar(300) NOT NULL,
  `codigo_venta` varchar(300) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `nombre` varchar(300) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`nombre`, `estado`) VALUES
('CC', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `nombre` varchar(300) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `tipo_cuenta` varchar(500) DEFAULT NULL,
  `numero_cuenta` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`nombre`, `estado`, `tipo_cuenta`, `numero_cuenta`) VALUES
('BANCOLOMBIA', 1, 'AHORRO', '6161-2-2-3-3--31\r\n'),
('EFECTIVO', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `documento` int(11) NOT NULL,
  `rol` varchar(300) NOT NULL,
  `clave` varchar(500) NOT NULL,
  `ultima_clave` varchar(500) DEFAULT NULL,
  `fecha_sesion` datetime NOT NULL,
  `fecha_ultima_sesion` datetime DEFAULT NULL,
  `ip` varchar(500) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `codigo` varchar(300) NOT NULL,
  `usuario` int(11) NOT NULL,
  `total` bigint(20) NOT NULL,
  `costo_envio` bigint(20) NOT NULL,
  `id_pago` varchar(300) NOT NULL,
  `cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`documento`);

--
-- Indices de la tabla `detalle_producto`
--
ALTER TABLE `detalle_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalleproducto_producto_producto_codigo` (`producto`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalleventa_venta_venta_codigo` (`venta`),
  ADD KEY `detalleventa_producto_detalleproducto_id` (`producto`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`nit`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `empresa_sucursal`
--
ALTER TABLE `empresa_sucursal`
  ADD PRIMARY KEY (`nit_empresa`,`nit_sucursal`),
  ADD KEY `empresasucursa_nitsucursal_sucursal_nit` (`nit_sucursal`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`genero`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`documento`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD KEY `persona_genero_genero_genero` (`genero`),
  ADD KEY `persona_tipodocumento_tipodocumento_nombre` (`tipo_documento`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `producto_categoria_categoria_nombre` (`categoria`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rol`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`nit`);

--
-- Indices de la tabla `sucursal_cliente`
--
ALTER TABLE `sucursal_cliente`
  ADD PRIMARY KEY (`documento_cliente`,`nit_sucursal`),
  ADD KEY `sucursalcliente_nitsucursal_sucursal_nit` (`nit_sucursal`);

--
-- Indices de la tabla `sucursal_usuario`
--
ALTER TABLE `sucursal_usuario`
  ADD PRIMARY KEY (`documento_usuario`,`nit_sucursal`),
  ADD KEY `sucursalusuario_nitsucursal_sucursal_nit` (`nit_sucursal`);

--
-- Indices de la tabla `sucursal_venta`
--
ALTER TABLE `sucursal_venta`
  ADD PRIMARY KEY (`nit_sucursal`,`codigo_venta`),
  ADD KEY `sucursualventa_codigoventa_venta_codigo` (`codigo_venta`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`nombre`),
  ADD UNIQUE KEY `numero_cuenta` (`numero_cuenta`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`documento`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `documento_2` (`documento`),
  ADD KEY `usuario_rol_rol_rol` (`rol`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `venta_cliente_cliente_documento` (`cliente`),
  ADD KEY `venta_usuario_usuario_documento` (`usuario`),
  ADD KEY `venta_pago_pago_nombre` (`id_pago`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_documento_persona_documento` FOREIGN KEY (`documento`) REFERENCES `persona` (`documento`);

--
-- Filtros para la tabla `detalle_producto`
--
ALTER TABLE `detalle_producto`
  ADD CONSTRAINT `detalleproducto_producto_producto_codigo` FOREIGN KEY (`producto`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalleventa_producto_detalleproducto_id` FOREIGN KEY (`producto`) REFERENCES `detalle_producto` (`id`),
  ADD CONSTRAINT `detalleventa_venta_venta_codigo` FOREIGN KEY (`venta`) REFERENCES `venta` (`codigo`);

--
-- Filtros para la tabla `empresa_sucursal`
--
ALTER TABLE `empresa_sucursal`
  ADD CONSTRAINT `empresasucursa_nitsucursal_sucursal_nit` FOREIGN KEY (`nit_sucursal`) REFERENCES `empresa` (`nit`),
  ADD CONSTRAINT `empresasucursal_nitempresa_empresa_nit` FOREIGN KEY (`nit_empresa`) REFERENCES `sucursal` (`nit`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_genero_genero_genero` FOREIGN KEY (`genero`) REFERENCES `genero` (`genero`),
  ADD CONSTRAINT `persona_tipodocumento_tipodocumento_nombre` FOREIGN KEY (`tipo_documento`) REFERENCES `tipo_documento` (`nombre`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_categoria_categoria_nombre` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`nombre`);

--
-- Filtros para la tabla `sucursal_cliente`
--
ALTER TABLE `sucursal_cliente`
  ADD CONSTRAINT `sucursalcliente_documentocliente_cliente_documento` FOREIGN KEY (`documento_cliente`) REFERENCES `cliente` (`documento`),
  ADD CONSTRAINT `sucursalcliente_nitsucursal_sucursal_nit` FOREIGN KEY (`nit_sucursal`) REFERENCES `sucursal` (`nit`);

--
-- Filtros para la tabla `sucursal_usuario`
--
ALTER TABLE `sucursal_usuario`
  ADD CONSTRAINT `sucursalusuario_documentousuario_usuario_documento` FOREIGN KEY (`documento_usuario`) REFERENCES `usuario` (`documento`),
  ADD CONSTRAINT `sucursalusuario_nitsucursal_sucursal_nit` FOREIGN KEY (`nit_sucursal`) REFERENCES `sucursal` (`nit`);

--
-- Filtros para la tabla `sucursal_venta`
--
ALTER TABLE `sucursal_venta`
  ADD CONSTRAINT `sucursalventa_nitempresa_empresa_nit` FOREIGN KEY (`nit_sucursal`) REFERENCES `sucursal` (`nit`),
  ADD CONSTRAINT `sucursualventa_codigoventa_venta_codigo` FOREIGN KEY (`codigo_venta`) REFERENCES `venta` (`codigo`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_documento_persona_documento` FOREIGN KEY (`documento`) REFERENCES `persona` (`documento`),
  ADD CONSTRAINT `usuario_rol_rol_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_cliente_cliente_documento` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`documento`),
  ADD CONSTRAINT `venta_pago_pago_nombre` FOREIGN KEY (`id_pago`) REFERENCES `tipo_pago` (`nombre`),
  ADD CONSTRAINT `venta_usuario_usuario_documento` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`documento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
