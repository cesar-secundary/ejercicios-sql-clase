```sql
DROP DATABASE biblioteca IF EXIST;
CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE usuarios (
    usuario_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dni char(8) NOT NULL UNIQUE,
    nombre_usuario VARCHAR(100),
    n_carnet SMALLINT NOT NULL UNIQUE,
    telefono char(10),
);

CREATE TABLE autores(
    autor_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    nacionalidad VARCHAR(50)
);

CREATE TABLE editoriales(
    editorial_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_editorial VARCHAR(100),
    dirrecion VARCHAR(100),
);

CREATE TABLE prestageria (
    prestageria_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    ubucacion VARCHAR(70)
)

CREATE TABLE libros(
    libro_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    editorial_id INT UNSIGNED NOT NULL,
    usuario_id BIGINT UNSIGNED NOT NULL,
    prestageria_id BIGINT UNSIGNED NOT NULL,
    titulo VARCHAR(100) DEFAULT "sin titulo",
    isbm TINYINT NOT NULL UNIQUE,
    tema VARCHAR(25),
    fecha_devolucion DATE,
    fecha_retirada DATE,

    FOREIGN KEY(editorial_id) REFERENCES editoriales (editorial_id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id) ON DELETE CASCADE,
    FOREIGN KEY (prestageria_id) REFERENCES prestageria (prestageria_id) ON DELETE CASCADE

);

CREATE TABLE crear (
    autor_id BIGINT UNSIGNED NOT NULL,
    libro_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (autor_id) REFERENCES autores (autor_id) ON DELETE CASCADE,
    FOREIGN KEY (libro_id) REFERENCES libros (libro_id) ON DELETE CASCADE
);

```
