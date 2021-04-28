-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-01-2020 a las 22:08:54
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_proyecto2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

DROP TABLE IF EXISTS `alquiler`;
CREATE TABLE IF NOT EXISTS `alquiler` (
  `Id` int(4) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `id_persona` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

DROP TABLE IF EXISTS `carrito`;
CREATE TABLE IF NOT EXISTS `carrito` (
  `Id_carrito` int(2) NOT NULL AUTO_INCREMENT,
  `id_persona` int(2) NOT NULL,
  `id_pelicula` int(2) NOT NULL,
  PRIMARY KEY (`Id_carrito`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`Id_carrito`, `id_persona`, `id_pelicula`) VALUES
(3, 2, 1),
(10, 2, 7),
(11, 2, 17),
(16, 1, 17),
(17, 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `Id` int(2) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`Id`, `tipo`) VALUES
(1, 'Accion'),
(2, 'Animacion'),
(3, 'Drama'),
(4, 'Terror'),
(5, 'Ficcion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_alquiler`
--

DROP TABLE IF EXISTS `detalle_alquiler`;
CREATE TABLE IF NOT EXISTS `detalle_alquiler` (
  `Id` int(4) NOT NULL,
  `id_alquiler` int(4) NOT NULL,
  `id_pelicula` int(4) NOT NULL,
  `precio` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
CREATE TABLE IF NOT EXISTS `pelicula` (
  `Id` int(4) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `sinopsis` varchar(500) NOT NULL,
  `video` varchar(50) NOT NULL,
  `stock` int(4) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `id_categoria` int(2) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`Id`, `titulo`, `sinopsis`, `video`, `stock`, `precio`, `id_categoria`) VALUES
(1, 'End Game', 'Los Vengadores restantes deben encontrar una manera de recuperar a sus aliados para un enfrentamiento epico con Thanos, el malvado que diezmo el planeta y el universo.', 'https://www.youtube.com/embed/1XrrTJpA3yM', 10, '20', 5),
(2, 'Broly', 'Un dia fatidico, un Saiyajin aparece ante Goku y Vegeta a quienes nunca antes habian visto: Broly. Con el regreso de Freezer del infierno, una batalla feroz espera a estos tres Saiyajin que han seguido destinos completamente diferentes.', 'https://www.youtube.com/embed/dl3w10VVQj8', 10, '20', 2),
(3, 'Infinity War', 'Los Vengadores deben evitar que Thanos, un senor de la guerra intergalactico, ponga sus manos en todas las piedras del infinito. Sin embargo, Thanos esta dispuesto a hacer todo lo posible para llevar a cabo su loco plan.', 'https://www.youtube.com/embed/3xk11d9hjp0', 10, '20', 5),
(4, 'El Padrino', 'Una adaptacion ganadora del Premio de la Academia, de la novela de Mario Puzo acerca de la familia Corleone.', 'https://www.youtube.com/embed/gCVj1LeYnsc', 10, '20', 3),
(5, 'Buscando a Nemo', 'Nemo, un pequeno pececillo, muy querido y protegido por su padre, se pierde fuera de la gran barrera del arrecife australiano, despues de ser capturado por este arrecife, Nemo terminara en una pecera en Sidney. Su padre, un pez payaso, parte en su busqueda y se embarca en una peligrosa aventura con Dory, un pez con muy poca memoria. Al mismo tiempo, Nemo y sus nuevos amigos ya traman un plan para escapar de la pecera.', 'https://www.youtube.com/embed/ic53iM_WZWs', 10, '20', 2),
(6, 'Hasta', 'La historia de Desmond T. Doss, quien, debido a que se lo prohibia su fe, combatio en la Segunda Guerra Mundial sin portar un arma. No disparo ni una bala, pero salvo a 75 personas de la muerte en la batalla de la isla de Okinawa. Gracias a su coraje, paso de ser el objeto de las burlas de sus companeros a reconocersele su enorme valia con la entrega de la Medalla de Honor del Congreso, otorgada por primera vez a un objetor de conciencia.', 'https://www.youtube.com/embed/HpW6qzO4LHI', 10, '20', 3),
(7, 'El Rey Leon', 'Tras la muerte de su padre, Simba vuelve a enfrentar a su malvado tio, Scar, y reclamar el trono de rey.', 'https://www.youtube.com/embed/mb79ctR-E-c', 10, '20', 2),
(8, 'UP', 'Carl Fredricksen es un vendedor de globos de 78 anos de edad dispuesto a cumplir su sueno: atar miles de globos a su casa y volar a Sudamerica. Sin embargo, descubre demasiado tarde a un joven e inesperado polizon. Lo que en principio sera recelo, acabara por tornarse simpatia hacia el muchacho mientras juntos pasan fascinantes aventuras en exoticos lugares.', 'https://www.youtube.com/embed/GxcMeZDPAFQ', 10, '20', 2),
(9, 'IT', 'Varios ninos de una pequena ciudad del estado de Maine se alian para combatir a una entidad diabolica que adopta la forma de un payaso y desde hace mucho tiempo emerge cada 27 anos para saciarse de sangre infantil.', 'https://www.youtube.com/embed/_oBZ_zTz0Nw', 10, '20', 4),
(10, 'Bob Esponja', 'Bob Esponja y Patrick viajan a ciudad Shell para recuperar la corona de Neptuno y salvar la vida del Sr. Krabs.', 'https://www.youtube.com/embed/cYG-hisvKvQ', 10, '20', 2),
(11, 'Frozen 2', 'Elsa tiene un poder extraordinario: es capaz de crear hielo y nieve. Sin embargo, a pesar de lo feliz que la hacen los habitantes de Arendelle, siente que no encaja alla. Despues de oir una voz misteriosa, Elsa, acompanada por Anna, Kristoff, Olaf y Sven, viaja a los bosques embrujados y los mares oscuros que se extienden mas alla de los limites de su reino para descubrir quien es en realidad y por que posee un poder tan asombroso.', 'https://www.youtube.com/embed/I-oJ5QjrX9M', 10, '20', 2),
(12, 'Superman', 'Clark Kent usa sus superpoderes, para arruinar el complot de Lex Luthor, quien intenta destruir la Costa Oeste.', 'https://www.youtube.com/embed/O_k85P-whTw', 10, '10', 5),
(13, 'Spiderman', 'Un timido estudiante se vuelve en un luchador contra el crimen, desde que la picadura de una arana mutante le da poderes extraordinarios', 'https://www.youtube.com/embed/RcU2F0gFWoY', 10, '20', 5),
(14, 'Toy Story 4', 'Woody siempre ha tenido claro cual es su labor en el mundo y cual es su prioridad: cuidar a su dueno, ya sea Andy o Bonnie. Sin embargo, Woody descubrira lo grande que puede ser el mundo para un juguete cuando Forky se convierta en su nuevo companero de habitacion. Los juguetes se embarcaran en una aventura de la que no se olvidaran jamas.', 'https://www.youtube.com/embed/f33yJZ5uOpU', 10, '20', 2),
(15, 'Wall-E', 'Un robot deja la Tierra para iniciar una gran busqueda a traves de la galaxia.', 'https://www.youtube.com/embed/D8kwXBZIOUE', 10, '20', 2),
(16, 'King Kong', 'Un grupo de exploradores, liderado por un extrovertido director de cine, visitan Skull Island para investigar todo lo relacionado con las leyendas del gorila gigante llamado King Kong. Ahi encuentran una jungla llena de criaturas prehistoricas.', 'https://www.youtube.com/embed/vq1Q-KiwdZ8', 10, '20', 1),
(17, 'Titanic', 'Una joven de la alta sociedad abandona a su arrogante pretendiente por un artista humilde en el trasatlantico que se hundio durante su viaje inaugural.', 'https://www.youtube.com/embed/FiRVcExwBVA', 10, '20', 3),
(18, 'Joker', 'Arthur Fleck adora hacer reir a la gente, pero su carrera como comediante es un fracaso. El repudio social, la marginacion y una serie de tragicos acontecimientos lo conducen por el sendero de la locura y, finalmente, cae en el mundo del crimen.', 'https://www.youtube.com/embed/EIyZqNbZQI8', 10, '20', 3),
(19, 'Intocable', 'Una extrana amistad se desarrolla entre un millonario que quedo paralitico en un accidente y un joven de los suburbios.', 'https://www.youtube.com/embed/drQRl0-nZw4', 10, '20', 3),
(20, 'Monstruos', 'Max, un nino desobediente, es enviado a la cama sin cenar y se zambulle en un mundo imaginario creado por el, que esta poblado de feroces criaturas que le obedecen ciegamente.', 'https://www.youtube.com/embed/c_DOyIQktTE', 10, '20', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `Id` int(4) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Id`, `Nombre`, `Apellido`, `email`, `pass`) VALUES
(1, 'Bryan', 'Taday', 'ste@hotmail.com', 'bryant'),
(2, 'Cristian', 'Bermeo', 'cris@hotmail.com', 'bermeo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
CREATE TABLE IF NOT EXISTS `tarjeta` (
  `id_tarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `numero_tarjeta` varchar(50) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `fecha_caducidad` date NOT NULL,
  `fk_tarjeta_persona` int(11) NOT NULL,
  PRIMARY KEY (`id_tarjeta`),
  KEY `fk_tarjeta_persona` (`fk_tarjeta_persona`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
