/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE IF NOT EXISTS `alumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(150) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `telefono` varchar(50) NOT NULL DEFAULT '0',
  `curso_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_alumno_curso` (`curso_id_fk`),
  CONSTRAINT `FK_alumno_curso` FOREIGN KEY (`curso_id_fk`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

INSERT INTO `alumno` (`id`, `nombre_completo`, `rut`, `telefono`, `curso_id_fk`) VALUES
	(1, 'Estudiante Primero Basico', '111-1', '111111', 3),
	(3, 'Estudiante Kinder', '222-2', '123123', 2),
	(4, 'Estudiante Pre-Kinder', '333-3', '321413', 1),
	(6, 'Estudiante Primero Basico 2', '444-4', '1231233', 3),
	(7, 'Estudiante Kinder 2', '555-5', '123123213', 2),
	(8, 'Estudiante Pre-Kinder 2', '666-6', '12313', 1),
	(9, 'Estudiante Primero Basico 3', '777-7', '2345', 3),
	(10, 'Estudiante Kinder 3', '888-8', '12321', 2),
	(11, 'Estudiante Pre-Kinder 3', '999-9', '123123', 1);

CREATE TABLE IF NOT EXISTS `anotacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_id_fk` int(11) DEFAULT NULL,
  `curso_id_fk` int(11) DEFAULT NULL,
  `alumno_id_fk` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_anotacion_tipo_anotacion` (`tipo_id_fk`),
  KEY `FK_anotacion_alumno` (`alumno_id_fk`),
  KEY `FK_anotacion_curso` (`curso_id_fk`),
  CONSTRAINT `FK_anotacion_alumno` FOREIGN KEY (`alumno_id_fk`) REFERENCES `alumno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_anotacion_curso` FOREIGN KEY (`curso_id_fk`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_anotacion_tipo_anotacion` FOREIGN KEY (`tipo_id_fk`) REFERENCES `tipo_anotacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO `anotacion` (`id`, `tipo_id_fk`, `curso_id_fk`, `alumno_id_fk`, `descripcion`, `fecha`) VALUES
	(2, 2, 2, 3, 'se porta bien AAAA', '2022-06-28'),
	(3, 1, 1, 4, 'asfasdfs', '2022-06-07'),
	(4, 1, 1, 4, 'ASDFASDF', '2022-06-07');

CREATE TABLE IF NOT EXISTS `asignatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO `asignatura` (`id`, `nombre`) VALUES
	(1, 'Matematicas'),
	(2, 'Lenguaje'),
	(3, 'Ingles'),
	(4, 'Historia');

CREATE TABLE IF NOT EXISTS `calificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno_id_fk` int(11) DEFAULT NULL,
  `curso_id_fk` int(11) DEFAULT NULL,
  `asignatura_id_fk` int(11) DEFAULT NULL,
  `nombre_nota` varchar(50) DEFAULT NULL,
  `nota` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_calificacion_asignatura` (`asignatura_id_fk`),
  KEY `FK_calificacion_nombre_tarea` (`alumno_id_fk`) USING BTREE,
  KEY `FK_calificacion_curso` (`curso_id_fk`),
  CONSTRAINT `FK_calificacion_alumno` FOREIGN KEY (`alumno_id_fk`) REFERENCES `alumno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_calificacion_asignatura` FOREIGN KEY (`asignatura_id_fk`) REFERENCES `asignatura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_calificacion_curso` FOREIGN KEY (`curso_id_fk`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7552 DEFAULT CHARSET=utf8mb4;

INSERT INTO `calificacion` (`id`, `alumno_id_fk`, `curso_id_fk`, `asignatura_id_fk`, `nombre_nota`, `nota`) VALUES
	(1, 1, 3, 3, 'Nota 1', '6,0'),
	(2, 3, 2, 3, 'Nota 2', '3,6'),
	(3, 4, 1, 3, 'Nota 3', '5,9'),
	(4, 6, 3, 3, 'Nota 1', '5,2'),
	(5, 8, 1, 3, 'Nota 3', '7,0'),
	(6, 9, 3, 3, 'Nota 1', '1,3'),
	(7, 7, 2, 3, 'Nota 2', '4,2'),
	(8, 10, 2, 3, 'Nota 2', '3,4'),
	(9, 11, 1, 3, 'Nota 3', '6,2'),
	(7538, 4, 1, 3, 'AAA', '6,9'),
	(7539, 8, 1, 3, 'AAA', '6,9'),
	(7540, 11, 1, 3, 'AAA', '1,9'),
	(7541, 4, 1, 1, 'Nota 1', '2,3'),
	(7546, 3, 2, 3, 'Nota 123', '5,5'),
	(7547, 7, 2, 3, 'Nota 123', '2,2'),
	(7548, 10, 2, 3, 'Nota 123', '1,8'),
	(7549, 1, 3, 3, 'Nota 123', '5,6'),
	(7550, 6, 3, 3, 'Nota 123', '3,9'),
	(7551, 9, 3, 3, 'Nota 123', '7,0');

CREATE TABLE IF NOT EXISTS `citacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_id_fk` int(11) DEFAULT NULL,
  `alumno_id_fk` int(11) DEFAULT NULL,
  `razon` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_citacion_curso` (`curso_id_fk`),
  KEY `FK_citacion_alumno` (`alumno_id_fk`),
  CONSTRAINT `FK_citacion_alumno` FOREIGN KEY (`alumno_id_fk`) REFERENCES `alumno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_citacion_curso` FOREIGN KEY (`curso_id_fk`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO `citacion` (`id`, `curso_id_fk`, `alumno_id_fk`, `razon`, `descripcion`, `fecha`) VALUES
	(3, 1, 4, 'FDSF', 'ASDFASDFASDF', '2022-07-11'),
	(4, 1, 4, 'Porque es pete', 'XDDDDD', '2022-07-11');

CREATE TABLE IF NOT EXISTS `comunicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO `comunicacion` (`id`, `descripcion`, `fecha`) VALUES
	(1, 'Se comunica que el alumno se retirará más temprano', '2022-04-12');

CREATE TABLE IF NOT EXISTS `curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO `curso` (`id`, `curso`) VALUES
	(1, 'Pre-Kinder'),
	(2, 'Kinder'),
	(3, '1° Básico');

CREATE TABLE IF NOT EXISTS `estado_tarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `estado_tarea` (`id`, `estado`) VALUES
	(1, 'Hecha'),
	(2, 'Pendiente');

CREATE TABLE IF NOT EXISTS `nombre_tarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `curso_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_nombre_tarea_curso` (`curso_id_fk`),
  CONSTRAINT `FK_nombre_tarea_curso` FOREIGN KEY (`curso_id_fk`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO `nombre_tarea` (`id`, `nombre`, `curso_id_fk`) VALUES
	(1, 'Prueba 2', 3);

CREATE TABLE IF NOT EXISTS `profesor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `apellido` varchar(150) DEFAULT NULL,
  `rut` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `asignatura_id_fk` int(11) DEFAULT NULL,
  `isProfesorJefe` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_profesor_asignatura` (`asignatura_id_fk`),
  CONSTRAINT `FK_profesor_asignatura` FOREIGN KEY (`asignatura_id_fk`) REFERENCES `asignatura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO `profesor` (`id`, `nombre`, `apellido`, `rut`, `pass`, `email`, `asignatura_id_fk`, `isProfesorJefe`) VALUES
	(1, 'Profesor', '1', '111', '111', 'asf@gmail.com', 3, b'1'),
	(2, 'ASDFASDF', 'ASDFASD', '222', '222', 'ASDFASDF@GMAIL.COM', 1, b'0'),
	(3, 'HOLA', 'ASFASD', '333', '333', 'AWFASDF@GMAIL.COM', 4, b'0');

CREATE TABLE IF NOT EXISTS `reunion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_id_fk` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_reunion_curso` (`curso_id_fk`),
  CONSTRAINT `FK_reunion_curso` FOREIGN KEY (`curso_id_fk`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO `reunion` (`id`, `curso_id_fk`, `fecha`) VALUES
	(2, 1, '2022-07-13 12:00:00'),
	(3, 1, '2022-07-14 13:00:00'),
	(5, 1, '2022-07-26 23:00:00'),
	(7, 1, '2022-07-26 22:11:00'),
	(8, 1, '2022-07-26 12:12:00');

CREATE TABLE IF NOT EXISTS `tarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `asignatura_id_fk` int(11) DEFAULT NULL,
  `curso_id_fk` int(11) DEFAULT NULL,
  `estado_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tarea_asignatura` (`asignatura_id_fk`),
  KEY `FK_tarea_estado_tarea` (`estado_id_fk`),
  KEY `FK_tarea_curso` (`curso_id_fk`),
  CONSTRAINT `FK_tarea_asignatura` FOREIGN KEY (`asignatura_id_fk`) REFERENCES `asignatura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tarea_curso` FOREIGN KEY (`curso_id_fk`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tarea_estado_tarea` FOREIGN KEY (`estado_id_fk`) REFERENCES `estado_tarea` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO `tarea` (`id`, `titulo`, `descripcion`, `asignatura_id_fk`, `curso_id_fk`, `estado_id_fk`) VALUES
	(1, 'TITULO 1', 'Descripcion 3333', 3, 1, 1),
	(2, 'TITULO 2', 'Descripción 2', 3, 1, 2),
	(9, 'asfasd', 'asdfasdfasdf', 1, 1, 1);

CREATE TABLE IF NOT EXISTS `tipo_anotacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `tipo_anotacion` (`id`, `nombre`) VALUES
	(1, 'Positiva'),
	(2, 'Negativa');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
