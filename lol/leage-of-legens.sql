-- 1
CREATE DATABASE lol;
USE lol;

-- paso 2

CREATE TABLE roles (
id_rol BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(25) NOT NULL
);

-- 3 

CREATE TABLE rangos (
id_rango BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
 tipo VARCHAR(50) NOT NULL
);

-- 4

CREATE TABLE habilidades(
id_habilidad BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100),
  tipo VARCHAR(50)
);


-- 5

CREATE TABLE posiciones (
id_posicion BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
 nombre VARCHAR(50) NOT NULL
);

-- 6

CREATE TABLE armaduras(
id_armadura BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100),
 nivel_armadura TINYINT
    
);

-- 7

CREATE TABLE magias(
id_magia BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    tipo VARCHAR(50)
    
);

-- 8 

CREATE TABLE campeones(
    id_campeon BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    vida_base INT NOT NULL,
    vida_nivel INT NOT NULL,
    mana_base DECIMAL DEFAULT 0,
    mana_nivel DECIMAL DEFAULT 0,
    armadura_base VARCHAR(50) DEFAULT "Ninguna",
    velocidad_movimiento DECIMAL NOT NULL,
    resistencia_magica DECIMAL NOT NULL DEFAULT 0,
    rango_ataque DECIMAL(3,2) NOT NULL,
    recuperacion_vida DECIMAL(5,2) NOT NULL,
    recuperacion_mana DECIMAL(5,2) NOT NULL DEFAULT 0,
    daño_ataque  DECIMAL(5,2) NOT NULL,
    daño_nivel DECIMAL(5,2) NOT NULL,
    velocidad_ataque DECIMAL(6,2),
    velocidad_ratio DECIMAL
);

-- Alter Table añadir claves foraneas y campos que faltan para hacer las relaciones
-- 9 

CREATE TABLE campeones_roles(
campeon_rol_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
campeon_id BIGINT UNSIGNED NOT NULL,
 rol_id  BIGINT UNSIGNED NOT NULL
);

-- 10
CREATE TABLE campeones_rango (
id_campeon_rango BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
 id_campeon BIGINT UNSIGNED NOT NULL,
 id_rango BIGINT UNSIGNED NOT NULL
);