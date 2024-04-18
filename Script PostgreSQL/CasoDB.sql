CREATE DATABASE CasoDB;

CREATE SCHEMA CasoDB;

CREATE TABLE Genero
(
    IdGenero SERIAL PRIMARY KEY,
    NombreCompleto VARCHAR(50) NOT NULL
);

CREATE TABLE Clasificacion
(
    IdClasificacion SERIAL PRIMARY KEY,
    NombreClasificacion VARCHAR(50) NOT NULL
);

CREATE TABLE Pelicula
(
    IdPelicula SERIAL PRIMARY KEY,
    IdGenero INT NOT NULL,
    IdClasificacion INT NOT NULL,
    NombrePelicula VARCHAR(150) UNIQUE NOT NULL,
    AnioRelace DATE NOT NULL,
    Duracion TIME NOT NULL,
    DescripcionPelicula VARCHAR,
    CONSTRAINT FK_Pelicula_Genero FOREIGN KEY (IdGenero)
        REFERENCES Genero (IdGenero),
    CONSTRAINT FK_Pelicula_Clasificacion FOREIGN KEY (IdClasificacion)
        REFERENCES Clasificacion (IdClasificacion)
);

CREATE TABLE CompaniaProductora
(
    IdCompaniaProductora SERIAL PRIMARY KEY,
    NombreCompaniaProductora VARCHAR(100)
);

CREATE TABLE PeliculaCompaniaProductora
(
    IdPelicula INT NOT NULL,
    IdCompaniaProductora INT NOT NULL,
    CONSTRAINT PK_PeliculaCompaniaProductora PRIMARY KEY (IdPelicula, IdCompaniaProductora),
    CONSTRAINT FK_PeliculaCompaniaProductora_Pelicula FOREIGN KEY (IdPelicula)
        REFERENCES Pelicula (IdPelicula),
    CONSTRAINT FK_PeliculaCompaniaProductora_CompaniaProductora FOREIGN KEY (IdCompaniaProductora)
        REFERENCES CompaniaProductora (IdCompaniaProductora)
);

CREATE TABLE Programacion
(
    IdProgramacion SERIAL PRIMARY KEY,
    IdPelicula INT NOT NULL,
    Hora TIME NOT NULL,
    Fecha DATE NOT NULL,
    CONSTRAINT FK_Programacion_Pelicula FOREIGN KEY (IdPelicula)
        REFERENCES Pelicula (IdPelicula)
);

CREATE TABLE EspacioEspecial
(
    IdEspacioEspecial SERIAL PRIMARY KEY,
    Nombre VARCHAR(60) NOT NULL,
    Descripcion VARCHAR(300) NOT NULL,
    Horario VARCHAR(100) NOT NULL
);

CREATE TABLE EspacioEspecialPelicula
(
    IdEspacioEspecial INT NOT NULL,
    IdPelicula INT NOT NULL,
    Fecha DATE NOT NULL,
    CONSTRAINT PK_EspacioEspecialPelicula PRIMARY KEY (IdEspacioEspecial, IdPelicula),
    CONSTRAINT FK_EspacioEspecialPelicula_EspacioEspecial FOREIGN KEY (IdEspacioEspecial)
        REFERENCES EspacioEspecial (IdEspacioEspecial),
    CONSTRAINT FK_EspacioEspecialPelicula_Pelicula FOREIGN KEY (IdPelicula)
        REFERENCES Pelicula (IdPelicula)
);

CREATE TABLE Nacionalidad
(
    IdNacionalidad SERIAL PRIMARY KEY,
    NombreNacionalidad VARCHAR(150) UNIQUE NOT NULL,
    Pais VARCHAR (100) UNIQUE NOT NULL
);

CREATE TABLE Profesion
(
    IdProfesion SERIAL PRIMARY KEY,
    NombreProfesion VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE Persona
(
    IdPersona SERIAL PRIMARY KEY,
    IdNacionalidad INT NOT NULL,
    IdProfesion INT NOT NULL,
    Manager VARCHAR(50),
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Biografia VARCHAR(500) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    CONSTRAINT FK_Persona_Nacionalidad FOREIGN KEY (IdNacionalidad)
        REFERENCES Nacionalidad (IdNacionalidad),
    CONSTRAINT FK_Persona_Profesion FOREIGN KEY (IdProfesion)
        REFERENCES Profesion (IdProfesion)
);

CREATE TABLE Personaje
(
    IdPersonaje SERIAL PRIMARY KEY,
    IdPersona INT NOT NULL,
    IdPelicula INT NOT NULL,
    CONSTRAINT FK_Personaje_Persona FOREIGN KEY (IdPersona)
        REFERENCES Persona (IdPersona),
    CONSTRAINT FK_Personaje_Pelicula FOREIGN KEY (IdPelicula)
        REFERENCES Pelicula (IdPelicula)
);

CREATE TABLE Sitie
(
    IdPersona INT NOT NULL,
    FanSiteURL VARCHAR(150) NOT NULL,
    PersonalSiteURL VARCHAR(150) NOT NULL,
    CONSTRAINT PK_Sitie PRIMARY KEY (IdPersona),
    CONSTRAINT FK_Sitie_Persona FOREIGN KEY (IdPersona)
        REFERENCES Persona (IdPersona)
);

CREATE TABLE TipoCargo
(
    IdTipoCargo SERIAL PRIMARY KEY,
    NombreTipoCargo VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE PeliculaPersonaCargo
(
    IdPelicula INT NOT NULL,
    IdPersona INT NOT NULL,
    IdTipoCargo INT NOT NULL,
    CONSTRAINT PK_PeliculaPersonaCargo PRIMARY KEY (IdPelicula, IdPersona, IdTipoCargo),
    CONSTRAINT FK_PeliculaPersonaCargo_Pelicula FOREIGN KEY (IdPelicula)
        REFERENCES Pelicula (IdPelicula),
    CONSTRAINT FK_PeliculaPersonaCargo_Persona FOREIGN KEY (IdPersona)
        REFERENCES Persona (IdPersona),
    CONSTRAINT FK_PeliculaPersonaCargo_TipoCargo FOREIGN KEY (IdTipoCargo)
        REFERENCES TipoCargo (IdTipoCargo)
);
