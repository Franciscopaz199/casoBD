CREATE DATABASE caso_fp;

CREATE SCHEMA catalogo_programacion;
CREATE SCHEMA elenco;

CREATE TABLE catalogo_programacion.genero
(
    id_genero SERIAL PRIMARY KEY,
    nombre_genero varchar(50) NOT NULL
);

CREATE TABLE catalogo_programacion.clasificacion
(
    id_clasificacion SERIAL PRIMARY KEY,
    nombre_clasificacion varchar(50) NOT NULL
);

CREATE TABLE catalogo_programacion.pelicula
(
    id_pelicula SERIAL PRIMARY KEY,
    id_genero int NOT NULL,
    id_clasificacion int NOT NULL,
    nombre_pelicula varchar(150) UNIQUE NOT NULL,
    anio_relace date NOT NULL,
    duracion time NOT NULL,
    descripcion_pelicula varchar,
    CONSTRAINT fk_pelicula_genero FOREIGN KEY (id_genero)
        REFERENCES catalogo_programacion.genero (id_genero),
    CONSTRAINT fk_pelicula_clasificacion FOREIGN KEY (id_clasificacion)
        REFERENCES catalogo_programacion.clasificacion (id_clasificacion)
);

CREATE TABLE catalogo_programacion.compania_productora
(
    id_compania_productora SERIAL PRIMARY KEY,
    nombre_compania_productora varchar(100)
);

CREATE TABLE catalogo_programacion.pelicula_compania_productora
(
    id_pelicula int NOT NULL,
    id_compania_productora int NOT NULL,
    CONSTRAINT pk_pelicula_compania_productora PRIMARY KEY (id_pelicula, id_compania_productora),
    CONSTRAINT fk_pelicula_compania_productora_pelicula FOREIGN KEY (id_pelicula)
        REFERENCES catalogo_programacion.pelicula (id_pelicula),
    CONSTRAINT fk_pelicula_compania_productora_compania_productora FOREIGN KEY (id_compania_productora)
        REFERENCES catalogo_programacion.compania_productora (id_compania_productora)
);

CREATE TABLE catalogo_programacion.programacion
(
    id_programacion SERIAL PRIMARY KEY,
    id_pelicula int NOT NULL,
    hora time NOT NULL,
    fecha date NOT NULL,
    CONSTRAINT fk_programacion_pelicula FOREIGN KEY (id_pelicula)
        REFERENCES catalogo_programacion.pelicula (id_pelicula)
);

CREATE TABLE catalogo_programacion.espacio_especial
(
    id_espacio_especial SERIAL PRIMARY KEY,
    nombre varchar(60) NOT NULL,
    descripcion varchar(300) NOT NULL,
    horario varchar(100) NOT NULL
);

CREATE TABLE catalogo_programacion.espacio_especial_pelicula
(
    id_espacio_especial int NOT NULL,
    id_pelicula int NOT NULL,
    fecha date NOT NULL,
    CONSTRAINT pk_espacio_especial_pelicula PRIMARY KEY (id_espacio_especial, id_pelicula),
    CONSTRAINT fk_espacio_especial_pelicula_espacio_especial FOREIGN KEY (id_espacio_especial)
        REFERENCES catalogo_programacion.espacio_especial (id_espacio_especial),
    CONSTRAINT fk_espacio_especial_pelicula_pelicula FOREIGN KEY (id_pelicula)
        REFERENCES catalogo_programacion.pelicula (id_pelicula)
);

CREATE TABLE elenco.nacionalidad
(
    id_nacionalidad SERIAL PRIMARY KEY,
    nombre_nacionalidad varchar(150) UNIQUE NOT NULL,
    pais varchar (100) UNIQUE NOT NULL
);

CREATE TABLE elenco.profesion
(
    id_profesion SERIAL PRIMARY KEY,
    nombre_profesion varchar(15) UNIQUE NOT NULL
);

CREATE TABLE elenco.artista
(
    id_artista SERIAL PRIMARY KEY,
    id_nacionalidad int NOT NULL,
    id_profesion int NOT NULL,
    manager varchar(50),
    nombres varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
    biografia varchar(500) NOT NULL,
    fecha_nacimiento date NOT NULL,
    CONSTRAINT fk_artista_nacionalidad FOREIGN KEY (id_nacionalidad)
        REFERENCES elenco.nacionalidad (id_nacionalidad),
    CONSTRAINT fk_artista_profesion FOREIGN KEY (id_profesion)
        REFERENCES elenco.profesion (id_profesion)
);

CREATE TABLE elenco.personaje
(
    id_personaje SERIAL PRIMARY KEY,
    id_artista int NOT NULL,
    id_pelicula int NOT NULL,
    CONSTRAINT fk_personaje_artista FOREIGN KEY (id_artista)
        REFERENCES elenco.artista (id_artista),
    CONSTRAINT fk_personaje_pelicula FOREIGN KEY (id_pelicula)
        REFERENCES catalogo_programacion.pelicula (id_pelicula)
);

CREATE TABLE elenco.sitie
(
    id_artista int NOT NULL,
    fan_site_url varchar(150) NOT NULL,
    personal_site_url varchar(150) NOT NULL,
    CONSTRAINT pk_sitie PRIMARY KEY (id_artista),
    CONSTRAINT fk_sitie_artista FOREIGN KEY (id_artista)
        REFERENCES elenco.artista (id_artista)
);

CREATE TABLE elenco.tipo_cargo
(
    id_tipo_cargo SERIAL PRIMARY KEY,
    nombre_tipo_cargo varchar(50) UNIQUE NOT NULL
);

CREATE TABLE elenco.pelicula_artista_cargo
(
    id_pelicula int NOT NULL,
    id_artista int NOT NULL,
    id_tipo_cargo int NOT NULL,
    CONSTRAINT pk_pelicula_artista_cargo PRIMARY KEY (id_pelicula, id_artista, id_tipo_cargo),
    CONSTRAINT fk_pelicula_artista_cargo_pelicula FOREIGN KEY (id_pelicula)
        REFERENCES catalogo_programacion.pelicula (id_pelicula),
    CONSTRAINT fk_pelicula_artista_cargo_artista FOREIGN KEY (id_artista)
        REFERENCES elenco.artista (id_artista),
    CONSTRAINT fk_pelicula_artista_cargo_tipo_cargo FOREIGN KEY (id_tipo_cargo)
        REFERENCES elenco.tipo_cargo (id_tipo_cargo)
);