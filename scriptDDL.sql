CREATE DATABASE CasoDB;

USE CasoDB;

CREATE SCHEMA CasoDB;

CREATE TABLE Genero
(
	IdGenero INT IDENTITY PRIMARY KEY,
	NombreGenero NVARCHAR(50) NOT NULL
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
	IdEspacioEspecial INT NOT NULL,
	IdPelicula INT NOT NULL,
	Fecha DATE NOT NULL,
	CONSTRAINT PK_EspacioEspecialPelicula PRIMARY KEY (IdEspacioEspecial,IdPelicula),
	CONSTRAINT FK_EspacioEspecialPelicula_EspacioEspecial FOREIGN KEY (IdEspacioEspecial)
		REFERENCES EspacioEspecial (IdEspacioEspecial),
	CONSTRAINT FK_EspacioEspecialPelicula_Pelicula FOREIGN KEY (IdPelicula)
		REFERENCES Pelicula (IdPelicula)
);

CREATE TABLE Nacionalidad
(
	IdNacionalidad INT IDENTITY PRIMARY KEY,
	NombreNacionalidad NVARCHAR(150) UNIQUE NOT NULL,
	Pais NVARCHAR (100) UNIQUE NOT NULL
);

CREATE TABLE Profesion
(
	IdProfesion INT IDENTITY PRIMARY KEY,
	NombreProfesion NVARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE Artista
(
	IdArtista INT IDENTITY PRIMARY KEY,
	IdNacionalidad INT NOT NULL,
	IdProfesion INT NOT NULL,
	Manager NVARCHAR(50),
	Nombres NVARCHAR(50) NOT NULL,
	Apellidos NVARCHAR(50) NOT NULL,
	Biografia NVARCHAR(500) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	CONSTRAINT FK_Artista_Nacionalidad FOREIGN KEY (IdNacionalidad)
		REFERENCES Nacionalidad (IdNacionalidad),
	CONSTRAINT FK_Artista_Profesion FOREIGN KEY (IdProfesion)
		REFERENCES Profesion (IdProfesion)
);

CREATE TABLE Personaje
(
	IdPersonaje INT IDENTITY PRIMARY KEY,
	IdArtista INT NOT NULL,
	IdPelicula INT NOT NULL
	CONSTRAINT FK_Personaje_Artista FOREIGN KEY (IdArtista)
		REFERENCES Artista (IdArtista),
	CONSTRAINT FK_Personaje_Pelicula FOREIGN KEY (IdPelicula)
		REFERENCES Pelicula (IdPelicula)
);

CREATE TABLE Sitie
(
	IdArtista INT NOT NULL,
	FanSiteURL NVARCHAR(150) NOT NULL,
	PersonalSiteURL NVARCHAR(150) NOT NULL,
	CONSTRAINT PK_Sitie PRIMARY KEY (IdArtista),
	CONSTRAINT FK_Sitie_Artista FOREIGN KEY (IdArtista)
		REFERENCES Artista (IdArtista)
);

CREATE TABLE TipoCargo
(
	IdTipoCargo INT IDENTITY PRIMARY KEY,
	NombreTipoCargo NVARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE PeliculaArtistaCargo
(
	IdPelicula INT NOT NULL,
	IdArtista INT NOT NULL,
	IdTipoCargo INT NOT NULL,
	CONSTRAINT PK_PeliculaArtistaCargo PRIMARY KEY (IdPelicula, IdArtista, IdTipoCargo),
	CONSTRAINT FK_PeliculaArtistaCargo_Pelicula FOREIGN KEY (IdPelicula)
		REFERENCES Pelicula (IdPelicula),
	CONSTRAINT FK_PeliculaArtistaCargo_Artista FOREIGN KEY (IdArtista)
		REFERENCES Artista (IdArtista),
	CONSTRAINT FK_PeliculaArtistaCargo_TipoCargo FOREIGN KEY (IdTipoCargo)
		REFERENCES TipoCargo (IdTipoCargo)
);
