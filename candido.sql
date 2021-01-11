-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-01-2021 a las 06:53:52
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `candido`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_alumnosc`
--

CREATE TABLE `tb_alumnosc` (
  `ID` int(11) NOT NULL,
  `NoUsuario` int(11) NOT NULL,
  `NoGrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_alumnosc`
--

INSERT INTO `tb_alumnosc` (`ID`, `NoUsuario`, `NoGrupo`) VALUES
(1, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_curriculares`
--

CREATE TABLE `tb_curriculares` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_curriculares`
--

INSERT INTO `tb_curriculares` (`ID`, `Nombre`) VALUES
(1, 'Ajedrez'),
(2, 'Basquetbol'),
(3, 'Canto'),
(4, 'Danza Moderna Jazz, Sala y Bachata'),
(5, 'E-Sports'),
(6, 'Futbol Soccer'),
(7, 'Guitarra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_grupos`
--

CREATE TABLE `tb_grupos` (
  `ID` int(11) NOT NULL,
  `NoCurricular` int(11) NOT NULL,
  `Profesor` varchar(100) NOT NULL,
  `Cupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_grupos`
--

INSERT INTO `tb_grupos` (`ID`, `NoCurricular`, `Profesor`, `Cupo`) VALUES
(1, 1, 'Candido Rodriguez Guzman', 5),
(2, 2, 'Jesus Eduardo Palos Ramirez', 5),
(3, 3, 'Rodrigo Alberto Perez Aguilar', 5),
(4, 4, 'Kevin Rodriguez Quintero', 5),
(5, 5, 'Alberto Guzman Galicia', 5),
(6, 6, 'Gustavo Perez Lopez', 5),
(7, 7, 'Fernando Amador Rodriguez', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_pcurriculares`
--

CREATE TABLE `tb_pcurriculares` (
  `id` int(11) NOT NULL,
  `NoUsuario` int(11) NOT NULL,
  `periodo` int(11) NOT NULL,
  `curricular` int(11) DEFAULT NULL,
  `especial` int(11) DEFAULT NULL,
  `especificacion` text DEFAULT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_pcurriculares`
--

INSERT INTO `tb_pcurriculares` (`id`, `NoUsuario`, `periodo`, `curricular`, `especial`, `especificacion`, `Estado`) VALUES
(1, 2, 1, 0, 1, 'Secretario provisional', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_permisos`
--

CREATE TABLE `tb_permisos` (
  `ID` int(11) NOT NULL,
  `Tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_permisos`
--

INSERT INTO `tb_permisos` (`ID`, `Tipo`) VALUES
(1, 'Administrador'),
(2, 'Alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipoespecial`
--

CREATE TABLE `tb_tipoespecial` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_tipoespecial`
--

INSERT INTO `tb_tipoespecial` (`ID`, `Nombre`) VALUES
(1, 'Institucional'),
(2, 'Docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuarios`
--

CREATE TABLE `tb_usuarios` (
  `ID` int(11) NOT NULL,
  `User` varchar(20) NOT NULL,
  `Password` varchar(60) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `CreateAt` date DEFAULT NULL,
  `permiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`ID`, `User`, `Password`, `nombre`, `correo`, `CreateAt`, `permiso`) VALUES
(1, '00210000', 'e10adc3949ba59abbe56e057f20f883e', 'Candido Rodriguez Guzman', 'candido.rodriguez18@tectijuana.edu.mx', '2021-01-09', 1),
(2, '17210612', 'e10adc3949ba59abbe56e057f20f883e', 'Carlos Eduardo Ortega Frias', 'carlo.ortega17@tectijuana.edu.mx', '2021-01-09', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_alumnosc`
--
ALTER TABLE `tb_alumnosc`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NoGrupo` (`NoGrupo`),
  ADD KEY `NoUsuario` (`NoUsuario`);

--
-- Indices de la tabla `tb_curriculares`
--
ALTER TABLE `tb_curriculares`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tb_grupos`
--
ALTER TABLE `tb_grupos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NoCurricular` (`NoCurricular`);

--
-- Indices de la tabla `tb_pcurriculares`
--
ALTER TABLE `tb_pcurriculares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `NoUsuario` (`NoUsuario`);

--
-- Indices de la tabla `tb_permisos`
--
ALTER TABLE `tb_permisos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tb_tipoespecial`
--
ALTER TABLE `tb_tipoespecial`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `permiso` (`permiso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_alumnosc`
--
ALTER TABLE `tb_alumnosc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tb_curriculares`
--
ALTER TABLE `tb_curriculares`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tb_grupos`
--
ALTER TABLE `tb_grupos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tb_pcurriculares`
--
ALTER TABLE `tb_pcurriculares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tb_permisos`
--
ALTER TABLE `tb_permisos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_tipoespecial`
--
ALTER TABLE `tb_tipoespecial`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
