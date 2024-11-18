CREATE TABLE federaciones(
    federacion_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL UNIQUE, -- clave compuesta
    fecha_creacion DATE
),

CREATE TABLE clubes(
    club_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre UNIQUE NOT NULL,
    año_fundacion YEAR NOT NULL,
    n_socios BIGINT UNSIGNED 
),

CREATE TABLE temporadas(
    temporada_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    codigo char(10) NOT NULL UNIQUE,
    descripcion TEXT,
    año YEAR
),

CREATE TABLE competiciones(
    competicion_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    codigo char(10) NOT NULL UNIQUE,
    nombre VARCHAR(50),
    descripcion TEXT
),

CREATE TABLE participar(
    participar_id  BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    temporada_id  BIGINT UNSIGNED NOT NULL,
    competicion_id  BIGINT UNSIGNED NOT NULL,
    posicion VARCHAR(50),
    FOREIGN KEY (temporada_id) REFERENCES temporadas (temporada_id) ON DELETE CASCADE,
    FOREIGN KEY  competicion_id REFERENCES competiciones (competicion_id) ON DELETE CASCADE
),



CREATE TABLE personas (
    persona_id  BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    federacion_id BIGINT UNSIGNED NOT NULL,
    club_id BIGINT UNSIGNED NOT NULL,

    dni VARCHAR(8) NOT NULL UNIQUE,
    nombre VARCHAR(25),
    apellidos VARCHAR(50),
    telefono char(10), -- cambiar
    FOREIGN KEY (federacion_id) REFERENCES federaciones (federacion_id) ON DELETE CASCADE,
    FOREIGN KEY (club_id) REFERENCES clubes (club_id) ON DELETE CASCADE

),

CREATE TABLE juagadores (
    persona_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    peso DECIMAL(4,2),
    altura DECIMAL(3,2),
    FOREIGN KEY (persona_id) REFERENCES personas (persona_id) ON DELETE CASCADE
),

CREATE TABLE especialidades (
    especialidad_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
),

CREATE TABLE grado(
    persona_id BIGINT UNSIGNED NOT NULL,
    especialidad_id  BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (persona_id) REFERENCES personas (persona_id) ON DELETE CASCADE,
    FOREIGN KEY (especialidad_id) REFERENCES especialidades (especialidad_id) ON DELETE CASCADE
)

CREATE TABLE entrenador (
    persona_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fecha_inicio DATE,
    FOREIGN KEY (persona_id) REFERENCES personas (persona_id) ON DELETE CASCADE
),

CREATE TABLE representantes (
    representante_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    persona_id BIGINT UNSIGNED NOT NULL UNIQUE,
    dni VARCHAR(8),
    sueldo DECIMAL,
    FOREIGN KEY (persona_id) REFERENCES personas (persona_id)
),


