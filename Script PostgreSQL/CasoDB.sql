CREATE DATABASE CasoDB;

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
    FOREIGN KEY (IdGenero) REFERENCES Genero (IdGenero),
    FOREIGN KEY (IdClasificacion) REFERENCES Clasificacion (IdClasificacion)
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
    PRIMARY KEY (IdPelicula, IdCompaniaProductora),
    FOREIGN KEY (IdPelicula) REFERENCES Pelicula (IdPelicula),
    FOREIGN KEY (IdCompaniaProductora) REFERENCES CompaniaProductora (IdCompaniaProductora)
);

CREATE TABLE Programacion
(
    IdProgramacion SERIAL PRIMARY KEY,
    IdPelicula INT NOT NULL,
    Hora TIME NOT NULL,
    Fecha DATE NOT NULL,
    FOREIGN KEY (IdPelicula) REFERENCES Pelicula (IdPelicula)
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
    IdEspacioEspecialPelicula SERIAL PRIMARY KEY,
    IdEspacioEspecial INT NOT NULL,
    IdPelicula INT NOT NULL,
    Fecha DATE NOT NULL,
    FOREIGN KEY (IdEspacioEspecial) REFERENCES EspacioEspecial (IdEspacioEspecial),
    FOREIGN KEY (IdPelicula) REFERENCES Pelicula (IdPelicula)
);

CREATE TABLE Pais
(
    IdPais SERIAL PRIMARY KEY,
    NombrePais VARCHAR(150) UNIQUE NOT NULL,
    Nacionalidad VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Persona
(
    IdPersona SERIAL PRIMARY KEY,
    IdPais INT NOT NULL,
    IdManager INT,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    FanSiteURL VARCHAR(150),
    PersonalSiteURL VARCHAR(150),
    Biografia VARCHAR(500) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    FOREIGN KEY (IdPais) REFERENCES Pais (IdPais),
    FOREIGN KEY (IdManager) REFERENCES Persona(IdPersona)
);

CREATE TABLE PeliculaPersona
(
    IdPeliculaPersona SERIAL PRIMARY KEY,
    IdPelicula INT NOT NULL,
    IdPersona INT NOT NULL,
    FOREIGN KEY (IdPelicula) REFERENCES Pelicula (IdPelicula),
    FOREIGN KEY (IdPersona) REFERENCES Persona (IdPersona)
);

CREATE TABLE ProtagonistaPrincipal
(
    IdPeliculaPersona INT NOT NULL,
    Personaje VARCHAR(100),
    PRIMARY KEY (IdPeliculaPersona),
    FOREIGN KEY (IdPeliculaPersona) REFERENCES PeliculaPersona (IdPeliculaPersona)
);

CREATE TABLE TipoCargo
(
    IdTipoCargo SERIAL PRIMARY KEY,
    NombreTipoCargo VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE PeliculaPersonaTipoCargo
(
    IdPeliculaPersona INT NOT NULL,
    IdTipoCargo INT NOT NULL,
    PRIMARY KEY (IdPeliculaPersona, IdTipoCargo),
    FOREIGN KEY (IdPeliculaPersona) REFERENCES PeliculaPersona (IdPeliculaPersona),
    FOREIGN KEY (IdTipoCargo) REFERENCES TipoCargo (IdTipoCargo)
);
