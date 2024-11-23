CREATE DATABASE futbol;

DROP DATABASE IF EXISTS futbol;
USE futbol;

CREATE TABLE federaciones(
    federacion_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL UNIQUE, -- clave compuesta
    fecha_creacion DATE
);

CREATE TABLE clubes(
    club_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre UNIQUE NOT NULL,
    ano_fundacion YEAR NOT NULL,
    n_socios BIGINT UNSIGNED  NOT NULL
);

CREATE TABLE temporadas(
    temporada_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    codigo char(10) NOT NULL UNIQUE,
    descripcion TEXT,
    ano YEAR
);

CREATE TABLE competiciones(
    competicion_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    codigo char(10) NOT NULL UNIQUE,
    nombre VARCHAR(50),
    descripcion TEXT
);

CREATE TABLE participar(
    competicion_id BIGINT UNSIGNED NOT NULL,
    temporada_id INT UNSIGNED NOT NULL,
    club_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (competicion_id,temporada_id,club_id),
    posicion SMALLINT,
    FOREIGN KEY (competicion_id) REFERENCES competiciones (competicion_id) ON DELETE CASCADE,
    FOREIGN KEY (temporada_id) REFERENCES temporadas (temporada_id) ON DELETE CASCADE,
    FOREIGN KEY (club_id) REFERENCES clubes (club_id) ON DELETE CASCADE
);


CREATE TABLE personas (
    persona_id  BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    federacion_id BIGINT UNSIGNED NOT NULL,
    club_id BIGINT UNSIGNED NOT NULL,
    representante_id BIGINT UNSIGNED NOT NULL,
    dni VARCHAR(8) NOT NULL UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    telefono char(10) NOT NULL, 
    FOREIGN KEY (federacion_id) REFERENCES federaciones (federacion_id) ON DELETE CASCADE,
    FOREIGN KEY (club_id) REFERENCES clubes (club_id) ON DELETE CASCADE,
    FOREIGN KEY (representante_id) REFERENCES representantes (representante_id) ON DELETE CASCADE
);

CREATE TABLE entrenadores (
    entrenador_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    persona_id BIGINT UNSIGNED NOT NULL,
    fecha_inicio DATE NOT NULL,
    FOREIGN KEY (persona_id) REFERENCES personas (persona_id) ON DELETE CASCADE
);

CREATE TABLE juagadores (
    jugador_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    persona_id BIGINT UNSIGNED NOT NULL,
    peso DECIMAL(4,2) NOT NULL,
    altura DECIMAL(3,2) NOT NULL,
    FOREIGN KEY (persona_id) REFERENCES personas (persona_id) ON DELETE CASCADE
),

CREATE TABLE especialidades (
    especialidad_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT,
);

CREATE TABLE grados(
    jugador_id BIGINT UNSIGNED NOT NULL,
    especialidad_id  BIGINT UNSIGNED NOT NULL,
    grado INT UNSIGNED,
    FOREIGN KEY (jugador_id) REFERENCES juagadores (jugador_id) ON DELETE CASCADE,
    FOREIGN KEY (especialidad_id) REFERENCES especialidades (especialidad_id) ON DELETE CASCADE
);



CREATE TABLE representantes (
    representante_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    persona_id BIGINT UNSIGNED NOT NULL UNIQUE,
    dni VARCHAR(8),
    sueldo DECIMAL,
    FOREIGN KEY (persona_id) REFERENCES personas (persona_id) ON DELETE CASCADE
);


-- es 1 es valor no nulo  NOT NULL
-- es 0 valor puede ser nulo
-- Herencia poner valor not nullº   