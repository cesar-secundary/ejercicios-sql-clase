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

CREATE TABLE representantes (
    representante_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    persona_id BIGINT UNSIGNED NOT NULL UNIQUE,
    dni VARCHAR(8),
    sueldo DECIMAL,
    FOREIGN KEY (persona_id) REFERENCES personas (persona_id)
),

