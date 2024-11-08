CREATE DATABASE transporte;

USE transporte;
CREATE TABLE camioneros (
    id_camionero BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    dni VARCHAR(8) UNIQUE NOT NULL,
    tefefono char(11),
    direccion VARCHAR(50),
    salario DECIMAL,
    poblacion VARCHAR(50)
)

CREATE TABLE provincias (
    id_provincia BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    codigo char(10) UNIQUE NOT NULL,
    nombre VARCHAR(50)
)

CREATE TABLE paquetes(
     id_paquete BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
     cod TINYINT UNIQUE NOT NULL,
     descripcion TEXT,
     direccion_destino VARCHAR(100),
     id_camionero BIGINT UNSIGNED NOT NULL,
     id_provincia BIGINT UNSIGNED NOT NULL,
     FOREIGN KEY (id_camionero) REFERENCES camioneros (id_camionero) ON DELETE CASCADE,
     FOREIGN KEY (id_provincia) REFERENCES provincias (id_provincia) ON DELETE CASCADE
)

CREATE TABLE camiones(
    id_camion  BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    matricula char(25) UNIQUE NOT NULL,
    tipo VARCHAR(30),
    modelo VARCHAR(50),
    potencia DECIMAL(5,2)
)

CREATE TABLE conducir (
    id_camionero BIGINT UNSIGNED NOT NULL,
    id_camion BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (id_camionero) REFERENCES camioneros (id_camionero) ON DELETE CASCADE,
    FOREIGN KEY (id_camion) REFERENCES camiones (id_camion) ON DELETE CASCADE

)

-- ALTER TABLE  se me olvido agregar el campo fecha a conducir 
ALTER TABLE conducir ADD fecha DATE;