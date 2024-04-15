CREATE DATABASE CasoDB;

USE CasoDB;

CREATE SCHEMA CasoDB;

CREATE TABLE Genero
(
	IdGenero INT IDENTITY PRIMARY KEY,
	NombreCompleto NVARCHAR(50) NOT NULL
);

CREATE TABLE Clasificacion
(
	IdClasificacion INT IDENTITY PRIMARY KEY,
	NombreClasificacion NVARCHAR(50) NOT NULL
);

CREATE TABLE Pelicula
(
	IdPelicula INT IDENTITY PRIMARY KEY,
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
	IdCompaniaProductora INT IDENTITY PRIMARY KEY,
	NombreCompaniaProductora NVARCHAR(100)
);

CREATE TABLE PeliculaCompaniaProductora
(
	IdPelicula INT NOT NULL,
	IdCompaniaProductora INT NOT NULL,
	CONSTRAINT PK_PeliculaCompaniaProductora PRIMARY KEY (IdPelicula, IdCompaniaProductora),
	CONSTRAINT FK_PeliculaCompaniaProductora_Pelicula FOREIGN KEY (IdPelicula)
		REFERENCES Pelicula (IdPelicula),
	CONSTRAINT FK_PeliculaCompaniaProductora_CompaniaProductora FOREIGN KEY (IdCompaniaProductora)
		REFERENCES CompaniaProductora (IdCompaniaProductora),
);

CREATE TABLE Programacion
(
	IdProgramacion INT IDENTITY PRIMARY KEY,
	IdPelicula INT NOT NULL,
	Hora TIME NOT NULL,
	Fecha DATE NOT NULL,
	CONSTRAINT FK_Programacion_Pelicula FOREIGN KEY (IdPelicula)
		REFERENCES Pelicula (IdPelicula)
);

CREATE TABLE EspacioEspecial
(
	IdEspacioEspecial INT IDENTITY PRIMARY KEY,
	Nombre NVARCHAR(60) NOT NULL,
	Descripcion VARCHAR(300) NOT NULL,
	Horario VARCHAR(100) NOT NULL
);

CREATE TABLE EspacioEspecialPelicula
(
	IdEspacioEspecialPelicula INT IDENTITY PRIMARY KEY,
	IdEspacioEspecial INT NOT NULL,
	IdPelicula INT NOT NULL,
	Fecha DATE NOT NULL,
	CONSTRAINT FK_EspacioEspecialPelicula_EspacioEspecial FOREIGN KEY (IdEspacioEspecial)
		REFERENCES EspacioEspecial (IdEspacioEspecial),
	CONSTRAINT FK_EspacioEspecialPelicula_Pelicula FOREIGN KEY (IdPelicula)
		REFERENCES Pelicula (IdPelicula)
);

CREATE TABLE Pais
(
	IdPais INT IDENTITY PRIMARY KEY,
	NombrePais NVARCHAR(150) UNIQUE NOT NULL,
	Nacionalidad NVARCHAR (100) UNIQUE NOT NULL
);

CREATE TABLE Persona
(
	IdPersona INT IDENTITY PRIMARY KEY,
	IdPais INT NOT NULL,
	IdManager INT,
	Nombres NVARCHAR(50) NOT NULL,
	Apellidos NVARCHAR(50) NOT NULL,
	FanSiteURL NVARCHAR(150),
	PersonalSiteURL NVARCHAR(150),
	Biografia NVARCHAR(500) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	CONSTRAINT FK_Persona_Pais FOREIGN KEY (IdPais)
		REFERENCES Pais (IdPais),
	FOREIGN KEY (IdManager) REFERENCES Persona(IdPersona)
);

CREATE TABLE PeliculaPersona
(
	IdPeliculaPersona INT IDENTITY PRIMARY KEY,
	IdPelicula INT NOT NULL,
	IdPersona INT NOT NULL,
	CONSTRAINT FK_PeliculaPersona_Pelicula FOREIGN KEY (IdPelicula)
		REFERENCES Pelicula (IdPelicula),
	CONSTRAINT FK_PeliculaPersona_Persona FOREIGN KEY (IdPersona)
		REFERENCES Persona (IdPersona)
);

CREATE TABLE ProtagonistaPrincipal
(
	IdPeliculaPersona INT NOT NULL,
	Personaje NVARCHAR(100)
	CONSTRAINT PK_ProtagonistaPrincipal PRIMARY KEY (IdPeliculaPersona),
	CONSTRAINT FK_ProtagonistaPrincipal FOREIGN KEY (IdPeliculaPersona)
		REFERENCES PeliculaPersona (IdPeliculaPersona)
);

CREATE TABLE TipoCargo
(
	IdTipoCargo INT IDENTITY PRIMARY KEY,
	NombreTipoCargo NVARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE PeliculaPersonaTipoCargo
(
	IdPeliculaPersona INT NOT NULL,
	IdTipoCargo INT NOT NULL,
	CONSTRAINT PK_PeliculaPersonaTipoCargo PRIMARY KEY (IdPeliculaPersona, IdTipoCargo),
	CONSTRAINT FK_PeliculaPersonaTipoCargo_PeliculaPersona FOREIGN KEY (IdPeliculaPersona)
		REFERENCES PeliculaPersona (IdPeliculaPersona),
	CONSTRAINT FK_PeliculaPersonaTipoCargo_TipoCargo FOREIGN KEY (IdTipoCargo)
		REFERENCES TipoCargo (IdTipoCargo)
);
