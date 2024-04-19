-- Insert de datos por defecto de la tabla compania_productora
INSERT INTO catalogo_programacion.compania_productora (nombre_compania_productora)
VALUES
    ('Warner Bros.'),
    ('Universal Pictures'),
    ('Paramount Pictures'),
    ('Walt Disney Pictures'),
    ('20th Century Studios'),
    ('Sony Pictures Entertainment'),
    ('Lionsgate'),
    ('Metro-Goldwyn-Mayer (MGM)'),
    ('New Line Cinema'),
    ('DreamWorks Pictures'),
    ('Columbia Pictures'),
    ('Focus Features'),
    ('Miramax Films'),
    ('Studio Ghibli'),
    ('A24'),
    ('Legendary Entertainment'),
    ('Fox Searchlight Pictures'),
    ('Participant Media'),
    ('Sony Pictures Classics'),
    ('United Artists');

-- Insert de datos por defecto de la tabla espacio_espcial
INSERT INTO catalogo_programacion.espacio_especial (nombre, descripcion, horario)
VALUES
    ('Adrenalina al máximo', 'Espacio reservado para las películas de acción y suspenso al límite', 'Todos los sábados a las 13:00'),
    ('Ganadoras de Oscar', 'Este espacio está reservado exclusivamente para las películas que han logrado el máximo galardón de la Industria', 'Todos los domingos a las 15:00'),
    ('CINEX Independiente', 'En este espacio se presentan películas innovadoras de cineastas que trabajan fuera del ambiente de Hollywood', 'Todos los jueves a las 20:00');

-- Insert de datos por defecto de la tabla catalogo clasificacion
INSERT INTO catalogo_programacion.clasificacion (nombre_clasificacion)
VALUES ('G'), ('PG'), ('PG-13'), ('R'), ('NC-17'), ('X');

-- Insert de datos por defecto de la tabla genero
INSERT INTO catalogo_programacion.genero (nombre_genero)
VALUES
    ('Drama'),
    ('Comedia'),
    ('Romance'),
    ('Suspense'),
    ('Terror'),
    ('Acción'),
    ('Musical'),
    ('Sci-Fi'),
    ('Fantasía'),
    ('Infantil');

-- Insert de datos por defecto de la tabla pelicula
-- Películas de Drama
INSERT INTO catalogo_programacion.pelicula (id_genero, id_clasificacion, nombre_pelicula, anio_relace, duracion, descripcion_pelicula)
VALUES
    (1, 3, 'El Club de la Pelea', '1999-10-15', '02:19:00', 'Un hombre insomne y un vendedor de jabón forman un club de lucha clandestino.'),
    (1, 3, 'El Renacido', '2015-12-25', '02:36:00', 'Un hombre de la frontera lucha por sobrevivir después de ser atacado por un oso y dejado por muerto.'),
    (1, 3, 'El Discurso del Rey', '2010-12-25', '01:58:00', 'La historia real del rey Jorge VI, quien supera su tartamudez con la ayuda de un terapeuta del habla poco ortodoxo.'),
    (1, 3, 'La Lista de Schindler', '1993-12-15', '03:15:00', 'La historia de Oskar Schindler, quien salvó a más de mil judíos durante el Holocausto nazi.');

-- Películas de Comedia
INSERT INTO catalogo_programacion.pelicula (id_genero, id_clasificacion, nombre_pelicula, anio_relace, duracion, descripcion_pelicula)
VALUES
    (2, 3, 'Loco por Mary', '1998-07-15', '01:59:00', 'Un hombre busca reavivar su amor de la escuela secundaria, Mary, después de muchos años.'),
    (2, 3, 'La Máscara', '1994-07-29', '01:41:00', 'Un empleado de banco tímido se transforma en un superhéroe excéntrico después de encontrar una máscara antigua.'),
    (2, 3, 'Supercool', '2007-08-17', '01:53:00', 'Dos amigos organizan una fiesta de graduación para ser populares, pero las cosas se descontrolan rápidamente.'),
    (2, 3, 'Scary Movie', '2000-07-07', '01:28:00', 'Una parodia de películas de terror populares, donde un grupo de adolescentes intenta descubrir el misterio detrás de una serie de asesinatos.'),
    (2, 3, 'Dumb and Dumber', '1994-12-16', '01:47:00', 'Dos amigos incompetentes se embarcan en un viaje por carretera para devolver un maletín a su legítimo propietario.');

-- Películas de Romance
INSERT INTO catalogo_programacion.pelicula (id_genero, id_clasificacion, nombre_pelicula, anio_relace, duracion, descripcion_pelicula)
VALUES
    (3, 3, 'Orgullo y Prejuicio', '2005-11-23', '02:09:00', 'La historia de amor entre Elizabeth Bennet y el señor Darcy en la Inglaterra del siglo XIX.'),
    (3, 3, 'Titanic', '1997-12-19', '03:14:00', 'Un romance entre un pasajero y una joven aristócrata en el fatídico viaje inaugural del RMS Titanic.'),
    (3, 3, 'Antes del Amanecer', '1995-01-27', '01:41:00', 'Dos extraños se encuentran en un tren en Europa y pasan una noche juntos explorando Viena.'),
    (3, 3, 'El Diario de una Pasión', '2004-06-25', '02:04:00', 'La historia de amor entre un hombre y una mujer de diferentes clases sociales en la década de 1940.'),
    (3, 3, 'Un Paseo para Recordar', '2002-01-25', '01:41:00', 'La historia de amor entre un chico popular y una chica impopular en la escuela secundaria.');

-- Películas de Suspense
INSERT INTO catalogo_programacion.pelicula (id_genero, id_clasificacion, nombre_pelicula, anio_relace, duracion, descripcion_pelicula)
VALUES
    (4, 3, 'El Silencio de los Inocentes', '1991-02-14', '01:58:00', 'Una joven agente del FBI se une a un psicópata encarcelado para atrapar a otro asesino en serie.'),
    (4, 3, 'Sé Lo Que Hicieron el Verano Pasado', '1997-10-17', '01:41:00', 'Un grupo de amigos es acosado por un misterioso asesino un año después de un accidente automovilístico fatal.'),
    (4, 3, 'Psicosis', '1960-09-08', '01:49:00', 'Una secretaria emprende un viaje y se aloja en un motel dirigido por un propietario misterioso y su madre dominante.'),
    (4, 3, 'El Sexto Sentido', '1999-08-06', '01:47:00', 'Un niño que puede ver y comunicarse con los muertos busca la ayuda de un psicólogo atormentado.'),
    (4, 3, 'Seven', '1995-09-22', '02:07:00', 'Dos detectives investigan una serie de asesinatos relacionados con los siete pecados capitales.');

-- Películas de Terror
INSERT INTO catalogo_programacion.pelicula (id_genero, id_clasificacion, nombre_pelicula, anio_relace, duracion, descripcion_pelicula)
VALUES
    (5, 4, 'El Exorcista', '1973-12-26', '02:12:00', 'Una madre busca la ayuda de dos sacerdotes después de que su hija es poseída por una entidad demoníaca.'),
    (5, 4, 'El Resplandor', '1980-06-13', '02:26:00', 'Un hombre acepta un trabajo como cuidador de un hotel durante el invierno y comienza a experimentar sucesos paranormales.'),
    (5, 4, 'Actividad Paranormal', '2007-09-25', '01:26:00', 'Una pareja es acosada por una presencia demoníaca en su hogar y decide documentar sus experiencias.'),
    (5, 4, 'La Noche de Halloween', '1978-10-25', '01:31:00', 'Un asesino enmascarado acecha a los residentes de un pequeño pueblo en Halloween.'),
    (5, 4, 'El Conjuro', '2013-07-19', '01:52:00', 'Una pareja de investigadores paranormales ayuda a una familia a lidiar con la presencia maligna en su hogar.');

-- Películas de Acción
INSERT INTO catalogo_programacion.pelicula (id_genero, id_clasificacion, nombre_pelicula, anio_relace, duracion, descripcion_pelicula)
VALUES
    (6, 3, 'Duro de Matar', '1988-07-15', '02:12:00', 'Un policía de Nueva York lucha contra un grupo de terroristas que toman como rehenes a un rascacielos durante una fiesta navideña.'),
    (6, 3, 'Terminator 2: El Juicio Final', '1991-07-03', '02:32:00', 'Un cyborg enviado desde el futuro intenta proteger a un niño de un modelo avanzado de cyborg enviado para matarlo.'),
    (6, 3, 'Mad Max: Furia en el Camino', '2015-05-15', '02:00:00', 'En un mundo post-apocalíptico, un hombre solitario se une a un grupo de mujeres para escapar de un tirano y sus seguidores.'),
    (6, 3, 'Rápido y Furioso', '2001-06-22', '01:46:00', 'Un policía encubierto se infiltra en una banda de ladrones de autos y se ve obligado a elegir entre su deber y su lealtad.');

-- Películas de Musical
INSERT INTO catalogo_programacion.pelicula (id_genero, id_clasificacion, nombre_pelicula, anio_relace, duracion, descripcion_pelicula)
VALUES
    (7, 3, 'Cantando Bajo la Lluvia', '1952-04-11', '01:43:00', 'Un dúo de actores intenta hacer la transición del cine mudo al sonoro mientras se enamoran.'),
    (7, 3, 'El Mago de Oz', '1939-08-25', '01:42:00', 'Una joven es transportada a un mundo mágico y emprende un viaje para encontrar al Mago de Oz y volver a casa.'),
    (7, 3, 'La La Land', '2016-12-25', '02:08:00', 'Un pianista de jazz y una actriz se enamoran mientras persiguen sus sueños en Los Ángeles.'),
    (7, 3, 'Chicago', '2002-12-27', '01:53:00', 'Dos mujeres luchan por la fama y la libertad mientras intentan escapar de la cárcel en la década de 1920.'),
    (7, 3, 'Mamma Mia!', '2008-07-18', '01:49:00', 'Una joven se prepara para casarse y busca a su padre verdadero entre tres posibles candidatos.');

-- Películas de Sci-Fi
INSERT INTO catalogo_programacion.pelicula (id_genero, id_clasificacion, nombre_pelicula, anio_relace, duracion, descripcion_pelicula)
VALUES
    (8, 3, 'Blade Runner', '1982-06-25', '01:57:00', 'Un ex policía de Los Ángeles se convierte en cazador de androides fugitivos en un futuro distópico.'),
    (8, 3, 'Interestelar', '2014-11-07', '02:49:00', 'Un grupo de astronautas viaja a través de un agujero de gusano en busca de un nuevo hogar para la humanidad.'),
    (8, 3, '2001: Una Odisea del Espacio', '1968-04-02', '02:29:00', 'Un equipo de astronautas investiga un monolito misterioso mientras viaja hacia Júpiter.'),
    (8, 3, 'Matrix', '1999-03-31', '02:16:00', 'Un hacker descubre que el mundo que percibe es una simulación y se une a una rebelión para liberar a la humanidad de las máquinas.'),
    (8, 3, 'Avatar', '2009-12-18', '02:42:00', 'Un ex marine es enviado a una luna alienígena para infiltrarse en una tribu indígena y asegurar valiosos minerales.');

-- Películas de Fantasía
INSERT INTO catalogo_programacion.pelicula (id_genero, id_clasificacion, nombre_pelicula, anio_relace, duracion, descripcion_pelicula)
VALUES
    (9, 3, 'El Señor de los Anillos: La Comunidad del Anillo', '2001-12-19', '02:58:00', 'Un joven hobbit se embarca en una misión para destruir un anillo maligno y salvar la Tierra Media.'),
    (9, 3, 'Harry Potter y la Piedra Filosofal', '2001-11-16', '02:32:00', 'Un joven mago descubre que es el niño que vivió y asiste a la Escuela Hogwarts de Magia y Hechicería.'),
    (9, 3, 'La Historia Interminable', '1984-04-06', '01:42:00', 'Un niño se sumerge en un libro mágico y se embarca en una aventura para salvar el mundo de Fantasía.'),
    (9, 3, 'El Laberinto del Fauno', '2006-10-11', '01:58:00', 'Una niña se adentra en un mundo de fantasía mientras escapa de la España franquista de posguerra.');
   
-- Películas Infantiles
INSERT INTO catalogo_programacion.pelicula (id_genero, id_clasificacion, nombre_pelicula, anio_relace, duracion, descripcion_pelicula)
VALUES
    (10, 3, 'Toy Story', '1995-11-22', '01:21:00', 'Un grupo de juguetes cobra vida y se embarca en una aventura para encontrar a su dueño perdido.'),
    (10, 3, 'Frozen', '2013-11-27', '01:42:00', 'Una joven princesa busca a su hermana que ha sumido al reino en un invierno eterno con sus poderes de hielo.'),
    (10, 3, 'Buscando a Nemo', '2003-05-30', '01:40:00', 'Un pez payaso padre se embarca en un viaje para encontrar a su hijo desaparecido en el océano.'),
    (10, 3, 'El Rey León', '1994-06-15', '01:28:00', 'Un joven león debe enfrentar su destino y reclamar su lugar como rey después de la muerte de su padre.'),
    (10, 3, 'Monsters, Inc.', '2001-11-02', '01:32:00', 'Dos monstruos trabajan en una fábrica de sustos y se encuentran con una niña humana que cambia sus vidas.');

-- Insert de datos por defecto de la tabla programacion
INSERT INTO catalogo_programacion.programacion (id_pelicula, hora, fecha)
VALUES
    -- Miércoles 3 de Marzo de 2003
    (8, '06:00', '2003-03-03'),
    (9, '08:00', '2003-03-03'),
    (10, '10:00', '2003-03-03'),
    (11, '12:30', '2003-03-03'),
    -- Jueves 4 de Marzo de 2003
    (12, '06:00', '2003-03-04'),
    (13, '08:00', '2003-03-04'),
    (14, '10:15', '2003-03-04'), 
    (15, '12:30', '2003-03-04'),
    (16, '14:30', '2003-03-04'),
    -- Viernes 5 de Marzo de 2003
    (17, '06:00', '2003-03-05'),
    (18, '08:00', '2003-03-05'),
    (19, '10:00', '2003-03-05'), 
    (20, '12:30', '2003-03-05'),
    -- Sábado 6 de Marzo de 2003
    (1, '06:00', '2003-03-06'),
    (2, '08:00', '2003-03-06'), 
    (3, '10:00', '2003-03-06'), 
    (4, '12:30', '2003-03-06'), 
    -- Domingo 7 de Marzo de 2003
    (5, '06:00', '2003-03-07'),
    (6, '08:00', '2003-03-07'), 
    (7, '10:15', '2003-03-07'), 
    (8, '12:30', '2003-03-07'); 

-- Insert de datos por defecto de la tabla espacio_espacial_pelicula
-- Espacio especial: Adrenalina al máximo
INSERT INTO catalogo_programacion.espacio_especial_pelicula (id_espacio_especial, id_pelicula, fecha)
VALUES
    (1, 5, '2024-04-19'),
    (1, 15, '2024-04-20'), 
    (1, 20, '2024-04-21');

-- Espacio especial: Ganadoras de Oscar
INSERT INTO catalogo_programacion.espacio_especial_pelicula (id_espacio_especial, id_pelicula, fecha)
VALUES
    (2, 13, '2024-04-19'),
    (2, 14, '2024-04-20'),
    (2, 19, '2024-04-21'); 

-- Espacio especial: CINEX Independiente
INSERT INTO catalogo_programacion.espacio_especial_pelicula (id_espacio_especial, id_pelicula, fecha)
VALUES
    (3, 7, '2024-04-19'),
    (3, 10, '2024-04-20'),
    (3, 11, '2024-04-21'); 

-- Insert de datos por defecto de la tabla pelicula_compania_productora
INSERT INTO catalogo_programacion.pelicula_compania_productora (id_pelicula, id_compania_productora)
VALUES
	(1, 1), 
	(2, 2), 
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 1),
	(9, 8),
	(10, 9),
	(11, 10),
	(12, 11),
	(13, 12),
	(14, 13),
	(15, 14),
	(16, 15),
	(17, 16),
	(18, 17),
	(19, 18),
	(20, 19),
	(21, 1),
	(22, 2),
	(23, 3),
	(24, 4),
	(25, 5),
	(26, 6),
	(27, 7),
	(28, 8),
	(29, 9),
	(30, 20),
	(31, 19),
	(32, 15),
	(33, 14),
	(34, 16),
	(35, 6),
	(36, 4),
	(37, 1),
	(38, 2),
	(39, 3),
	(40, 10),
	(41, 11),
	(42, 12),
	(43, 13),
	(44, 4),
	(45, 5),
	(46, 9),
	(47, 11);

-- Insert de datos por defecto de la tabla profesion
INSERT INTO elenco.profesion (nombre_profesion)
VALUES
    ('director'),
    ('productor'),
    ('guionista'),
    ('compositor'),
    ('editor'),
    ('actor');

-- Insert de datos por defecto de la tabla nacionalidad
INSERT INTO elenco.nacionalidad (nombre_nacionalidad, pais)
VALUES
    ('Afgana', 'Afganistán'),
    ('Albanesa', 'Albania'),
    ('Alemana', 'Alemania'),
    ('Andorrana', 'Andorra'),
    ('Angoleña', 'Angola'),
    ('Antiguana y Barbudana', 'Antigua y Barbuda'),
    ('Argentina', 'Argentina'),
    ('Armenia', 'Armenia'),
    ('Arubeña', 'Aruba'),
    ('Australiana', 'Australia'),
    ('Austríaca', 'Austria'),
    ('Azerbaiyana', 'Azerbaiyán'),
    ('Bahameña', 'Bahamas'),
    ('Bahreiní', 'Baréin'),
    ('Bangladesí', 'Bangladés'),
    ('Barbadense', 'Barbados'),
    ('Belga', 'Bélgica'),
    ('Beliceña', 'Belice'),
    ('Beninesa', 'Benín'),
    ('Bermudeña', 'Bermudas'),
    ('Bielorrusa', 'Bielorrusia'),
    ('Birmana', 'Birmania'),
    ('Boliviana', 'Bolivia'),
    ('Bosnia', 'Bosnia y Herzegovina'),
    ('Botsuana', 'Botsuana'),
    ('Brasileña', 'Brasil'),
    ('Británica', 'Reino Unido'),
    ('Bruneana', 'Brunéi'),
    ('Búlgara', 'Bulgaria'),
    ('Burkinesa', 'Burkina Faso'),
    ('Burundesa', 'Burundi'),
    ('Butanesa', 'Bután'),
    ('Cabo Verdiana', 'Cabo Verde'),
    ('Camboyana', 'Camboya'),
    ('Camerunesa', 'Camerún'),
    ('Canadiense', 'Canadá'),
    ('Centroafricana', 'República Centroafricana'),
    ('Chadiana', 'Chad'),
    ('Checa', 'República Checa'),
    ('Chilena', 'Chile'),
    ('China', 'China'),
    ('Chipriota', 'Chipre'),
    ('Comorense', 'Comoras'),
    ('Congoleña', 'República del Congo'),
    ('Costarricense', 'Costa Rica'),
    ('Croata', 'Croacia'),
    ('Cubana', 'Cuba'),
    ('Danés', 'Dinamarca'),
    ('Dominicana', 'República Dominicana'),
    ('Ecuatoriana', 'Ecuador'),
    ('Egipcia', 'Egipto'),
    ('Emiratí', 'Emiratos Árabes Unidos'),
    ('Eritrea', 'Eritrea'),
    ('Eslovaca', 'Eslovaquia'),
    ('Eslovena', 'Eslovenia'),
    ('Española', 'España'),
    ('Estadounidense', 'Estados Unidos'),
    ('Estonia', 'Estonia'),
    ('Etiopía', 'Etiopía'),
    ('Feroesa', 'Islas Feroe'),
    ('Filipina', 'Filipinas'),
    ('Finlandesa', 'Finlandia'),
    ('Fiyiana', 'Fiyi'),
    ('Francesa', 'Francia'),
    ('Gabonesa', 'Gabón'),
    ('Gambiana', 'Gambia'),
    ('Georgiana', 'Georgia'),
    ('Ghanesa', 'Ghana'),
    ('Gibraltareña', 'Gibraltar'),
    ('Granadina', 'Granada'),
    ('Griega', 'Grecia'),
    ('Groenlandesa', 'Groenlandia'),
    ('Guatemalteca', 'Guatemala'),
    ('Guineana', 'Guinea'),
    ('Guineana Ecuatorial', 'Guinea Ecuatorial'),
    ('Guyanesa', 'Guyana'),
    ('Haitiana', 'Haití'),
    ('Hondureña', 'Honduras'),
    ('Hongkonesa', 'Hong Kong'),
    ('Húngara', 'Hungría'),
    ('India', 'India'),
    ('Indonesa', 'Indonesia'),
    ('Iraní', 'Irán'),
    ('Iraquí', 'Irak'),
    ('Irlandesa', 'Irlanda'),
    ('Islandesa', 'Islandia'),
    ('Israelí', 'Israel'),
    ('Italiana', 'Italia'),
    ('Jamaicana', 'Jamaica'),
    ('Japonesa', 'Japón'),
    ('Jordana', 'Jordania'),
    ('Kazaja', 'Kazajistán'),
    ('Keniata', 'Kenia'),
    ('Kirguisa', 'Kirguistán'),
    ('Kiribatiana', 'Kiribati'),
    ('Kuwaití', 'Kuwait'),
    ('Laosiana', 'Laos'),
    ('Lesotense', 'Lesoto'),
    ('Letona', 'Letonia'),
    ('Libanesa', 'Líbano'),
    ('Liberiana', 'Liberia'),
    ('Libia', 'Libia'),
    ('Liechtensteiniana', 'Liechtenstein'),
    ('Lituana', 'Lituania'),
    ('Luxemburguesa', 'Luxemburgo'),
    ('Macao', 'Macao'),
    ('Macedonia', 'Macedonia del Norte'),
    ('Malasia', 'Malasia'),
    ('Malauí', 'Malaui'),
    ('Maldiva', 'Maldivas'),
    ('Malgache', 'Madagascar'),
    ('Maliense', 'Malí'),
    ('Maltesa', 'Malta'),
    ('Marfileña', 'Costa de Marfil'),
    ('Marroquí', 'Marruecos'),
    ('Mauriciana', 'Mauricio'),
    ('Mauritana', 'Mauritania'),
    ('Mexicana', 'México'),
    ('Micronesia', 'Micronesia'),
    ('Moldava', 'Moldavia'),
    ('Monegasca', 'Mónaco'),
    ('Mongola', 'Mongolia'),
    ('Montenegrina', 'Montenegro'),
    ('Mozambiqueña', 'Mozambique'),
    ('Namibia', 'Namibia'),
    ('Nauruana', 'Nauru'),
    ('Neerlandesa', 'Países Bajos'),
    ('Neozelandesa', 'Nueva Zelanda'),
    ('Nepalí', 'Nepal'),
    ('Nicaragüense', 'Nicaragua'),
    ('Nigeriana', 'Nigeria'),
    ('Nortecoreana', 'Corea del Norte'),
    ('Noruega', 'Noruega'),
    ('Omana', 'Omán'),
    ('Pakistani', 'Pakistán'),
    ('Palaos', 'Palaos'),
    ('Palestina', 'Estado de Palestina'),
    ('Panameña', 'Panamá'),
    ('Papú', 'Papúa Nueva Guinea'),
    ('Paraguaya', 'Paraguay'),
    ('Peruana', 'Perú'),
    ('Polaca', 'Polonia'),
    ('Portuguesa', 'Portugal'),
    ('Qatarí', 'Catar'),
    ('Ruandesa', 'Ruanda'),
    ('Rumana', 'Rumania'),
    ('Rusa', 'Rusia'),
    ('Salomonense', 'Islas Salomón'),
    ('Salvadoreña', 'El Salvador'),
    ('Samoa', 'Samoa'),
    ('Sanmarinense', 'San Marino'),
    ('Santaluciana', 'Santa Lucía'),
    ('Sanvicentina', 'San Vicente y las Granadinas'),
    ('Santomense', 'Santo Tomé y Príncipe'),
    ('Saudí', 'Arabia Saudita'),
    ('Senegalesa', 'Senegal'),
    ('Serbia', 'Serbia'),
    ('Seychellense', 'Seychelles'),
    ('Sierra Leonesa', 'Sierra Leona'),
    ('Singapurense', 'Singapur'),
    ('Siria', 'Siria'),
    ('Somalí', 'Somalia'),
    ('Srilanka', 'Sri Lanka'),
    ('Sudafricana', 'Sudáfrica'),
    ('Sudanesa', 'Sudán'),
    ('Sueca', 'Suecia'),
    ('Suiza', 'Suiza'),
    ('Surinamesa', 'Surinam'),
    ('Esvatini', 'Esvatini'),
    ('Tailandesa', 'Tailandia'),
    ('Tanzana', 'Tanzania'),
    ('Tayika', 'Tayikistán'),
    ('Timorense', 'Timor Oriental'),
    ('Togolesa', 'Togo'),
    ('Tongana', 'Tonga'),
    ('Trinitense', 'Trinidad y Tobago'),
    ('Tunecina', 'Túnez'),
    ('Turca', 'Turquía'),
    ('Turkmenistana', 'Turkmenistán'),
    ('Tuvaluana', 'Tuvalu'),
    ('Ucraniana', 'Ucrania'),
    ('Ugandesa', 'Uganda'),
    ('Uruguaya', 'Uruguay'),
    ('Uzbeka', 'Uzbekistán'),
    ('Vanuatense', 'Vanuatu'),
    ('Vaticana', 'Ciudad del Vaticano'),
    ('Venezolana', 'Venezuela'),
    ('Vietnamita', 'Vietnam'),
    ('Yemení', 'Yemen'),
    ('Yibutiana', 'Yibuti'),
    ('Zambiana', 'Zambia'),
    ('Zimbabuense', 'Zimbabue');

-- Insert de datos por defecto de la tabla artista
-- Directores
INSERT INTO elenco.artista (id_nacionalidad, id_profesion, manager, nombres, apellidos, biografia, fecha_nacimiento)
VALUES
    (1, 1, 'Manager1', 'Christopher', 'Nolan', 'Biografía de Christopher Nolan...', '1970-07-30'),
    (2, 1, 'Manager2', 'Quentin', 'Tarantino', 'Biografía de Quentin Tarantino...', '1963-03-27'),
    (3, 1, 'Manager3', 'Martin', 'Scorsese', 'Biografía de Martin Scorsese...', '1942-11-17');

-- Productores
INSERT INTO elenco.artista (id_nacionalidad, id_profesion, nombres, apellidos, biografia, fecha_nacimiento)
VALUES
    (4, 2, 'Kathleen', 'Kennedy', 'Biografía de Kathleen Kennedy...', '1953-06-05'),
    (5, 2, 'Jerry', 'Bruckheimer', 'Biografía de Jerry Bruckheimer...', '1945-09-21'),
    (6, 2, 'Brian', 'Grazer', 'Biografía de Brian Grazer...', '1951-07-12');

-- Guionistas
INSERT INTO elenco.artista (id_nacionalidad, id_profesion, nombres, apellidos, biografia, fecha_nacimiento)
VALUES
    (7, 3, 'Aaron', 'Sorkin', 'Biografía de Aaron Sorkin...', '1961-06-09'),
    (8, 3, 'Greta', 'Gerwig', 'Biografía de Greta Gerwig...', '1983-08-04'),
    (9, 3, 'Charlie', 'Kaufman', 'Biografía de Charlie Kaufman...', '1958-11-01');

-- Compositores de música original
INSERT INTO elenco.artista (id_nacionalidad, id_profesion, nombres, apellidos, biografia, fecha_nacimiento)
VALUES
    (10, 4, 'Hans', 'Zimmer', 'Biografía de Hans Zimmer...', '1957-09-12'),
    (11, 4, 'Ennio', 'Morricone', 'Biografía de Ennio Morricone...', '1928-11-10'),
    (12, 4, 'John', 'Williams', 'Biografía de John Williams...', '1932-02-08');

-- Editores
INSERT INTO elenco.artista (id_nacionalidad, id_profesion nombres, apellidos, biografia, fecha_nacimiento)
VALUES
    (13, 5, 'Thelma', 'Schoonmaker', 'Biografía de Thelma Schoonmaker...', '1940-01-03'),
    (14, 5, 'Michael', 'Kahn', 'Biografía de Michael Kahn...', '1935-12-08'),
    (15, 5, 'Sally', 'Menke', 'Biografía de Sally Menke...', '1953-12-17');

-- Actores
INSERT INTO elenco.artista (id_nacionalidad, id_profesion, nombres, apellidos, biografia, fecha_nacimiento)
VALUES
    (16, 6, 'Manager16', 'Tom', 'Hanks', 'Biografía de Tom Hanks...', '1956-07-09'),
    (17, 6, 'Manager17', 'Meryl', 'Streep', 'Biografía de Meryl Streep...', '1949-06-22'),
    (18, 6, 'Manager18', 'Leonardo', 'DiCaprio', 'Biografía de Leonardo DiCaprio...', '1974-11-11');
select * from elenco.artista

-- Insert de datos por defecto de la tabla site
-- Insertar sitios para artistas actores
INSERT INTO elenco.sitie (id_artista, fan_site_url, personal_site_url)
VALUES
    (16, 'https://www.tomhanksfans.com', 'https://www.tomhanks.com'),
    (17, 'https://www.merylstreepfans.com', 'https://www.merylstreep.com'),
    (18, 'https://www.leonardodicapriofans.com', 'https://www.leonardodicaprio.com');

-- Insert de datos por defecto de la tabla tipo_cargo
INSERT INTO elenco.tipo_cargo (nombre_tipo_cargo)
VALUES
    ('Director'),
    ('Productor'),
    ('Guionista'),
    ('Compositor'),
    ('Editor'),
    ('Actor');

-- Insert de datos por defecto de la tabla pelicula_artista_cargo
-- Películas de Drama
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- El Club de la Pelea
    (1, 1, 1), -- Director
    (1, 2, 6), -- Actor principal
    -- El Renacido
    (2, 3, 1), -- Director
    (2, 4, 6), -- Actor principal
    -- El Discurso del Rey
    (3, 5, 1), -- Director
    (3, 6, 6), -- Actor principal
    -- La Lista de Schindler
    (4, 7, 1), -- Director
    (4, 8, 6); -- Actor principal

-- Películas de Comedia
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- Loco por Mary
    (5, 9, 1), -- Director
    (5, 10, 6), -- Actor principal
    -- La Máscara
    (6, 11, 1), -- Director
    (6, 12, 6), -- Actor principal
    -- Supercool
    (7, 13, 1), -- Director
    (7, 14, 6), -- Actor principal
    -- Scary Movie
    (8, 15, 1), -- Director
    (8, 16, 6), -- Actor principal
    -- Dumb and Dumber
    (9, 17, 1), -- Director
    (9, 18, 6); -- Actor principal

-- Películas de Romance
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- Orgullo y Prejuicio
    (10, 9, 1), -- Director
    (10, 2, 6), -- Actor principal
    -- Titanic
    (11, 1, 1), -- Director
    (11, 2, 6), -- Actor principal
    -- Antes del Amanecer
    (12, 3, 1), -- Director
    (12, 14, 6), -- Actor principal
    -- El Diario de una Pasión
    (13, 5, 1), -- Director
    (13, 2, 6), -- Actor principal
    -- Un Paseo para Recordar
    (14, 2, 1), -- Director
    (14, 16, 6); -- Actor principal

-- Películas de Suspense
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- El Silencio de los Inocentes
    (15, 2, 1), -- Director
    (15, 18, 6), -- Actor principal
    -- Sé Lo Que Hicieron el Verano Pasado
    (16, 1, 1), -- Director
    (16, 3, 6), -- Actor principal
    -- Psicosis
    (17, 3, 1), -- Director
    (17, 5, 6), -- Actor principal
    -- El Sexto Sentido
    (18, 5, 1), -- Director
    (18, 3, 6), -- Actor principal
    -- Seven
    (19, 7, 1), -- Director
    (19, 3, 6); -- Actor principal

-- Películas de Terror
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- El Exorcista
    (20, 3, 1), -- Director
    (20, 4, 6), -- Actor principal
    -- El Resplandor
    (21, 1, 1), -- Director
    (21, 12, 6), -- Actor principal
    -- Actividad Paranormal
    (22, 3, 1), -- Director
    (22, 4, 6), -- Actor principal
    -- La Noche de Halloween
    (23, 5, 1), -- Director
    (23, 6, 6), -- Actor principal
    -- El Conjuro
    (24, 7, 1), -- Director
    (24, 1, 6); -- Actor principal

-- Películas de Acción
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- Duro de Matar
    (25, 2, 1), -- Director
    (25, 3, 6), -- Actor principal
    -- Terminator 2: El Juicio Final
    (26, 4, 1), -- Director
    (26, 5, 6), -- Actor principal
    -- Mad Max: Furia en el Camino
    (27, 6, 1), -- Director
    (27, 7, 6), -- Actor principal
    -- Rápido y Furioso
    (28, 8, 1), -- Director
    (28, 9, 6); -- Actor principal

-- Películas de Musical
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- Cantando Bajo la Lluvia
    (29, 10, 1), -- Director
    (29, 11, 6), -- Actor principal
    -- El Mago de Oz
    (30, 12, 1), -- Director
    (30, 13, 6), -- Actor principal
    -- La La Land
    (31, 14, 1), -- Director
    (31, 15, 6), -- Actor principal
    -- Chicago
    (32, 16, 1), -- Director
    (32, 17, 6), -- Actor principal
    -- Mamma Mia!
    (33, 18, 1), -- Director
    (33, 16, 6); -- Actor principal

-- Películas de Sci-Fi
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- Blade Runner
    (34, 2, 1), -- Director
    (34, 1, 6), -- Actor principal
    -- Interestelar
    (35, 2, 1), -- Director
    (35, 3, 6), -- Actor principal
    -- 2001: Una Odisea del Espacio
    (36, 2, 1), -- Director
    (36, 5, 6), -- Actor principal
    -- Matrix
    (37, 6, 1), -- Director
    (37, 7, 6), -- Actor principal
    -- Avatar
    (38, 2, 1), -- Director
    (38, 9, 6); -- Actor principal

-- Películas de Fantasía
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- El Señor de los Anillos: La Comunidad del Anillo
    (39, 3, 1), -- Director
    (39, 1, 6), -- Actor principal
    -- Harry Potter y la Piedra Filosofal
    (40, 3, 1), -- Director
    (40, 3, 6), -- Actor principal
    -- La Historia Interminable
    (41, 4, 1), -- Director
    (41, 5, 6), -- Actor principal
    -- El Laberinto del Fauno
    (42, 6, 1), -- Director
    (42, 7, 6); -- Actor principal

-- Películas Infantiles
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- Toy Story
    (43, 3, 1), -- Director
    (43, 9, 6), -- Actor principal
    -- Frozen
    (44, 4, 1), -- Director
    (44, 6, 6), -- Actor principal
    -- Buscando a Nemo
    (45, 2, 1), -- Director
    (45, 3, 6), -- Actor principal
    -- El Rey León
    (46, 4, 1), -- Director
    (46, 5, 6), -- Actor principal
    -- Monsters, Inc.
    (47, 6, 1), -- Director
    (47, 7, 6); -- Actor principal

-- Películas de Drama
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- El Club de la Pelea
    (1, 3, 2), -- Productor
    (1, 4, 3), -- Guionista
    (1, 5, 4), -- Compositor de música original
    (1, 6, 5), -- Editor
    -- El Renacido
    (2, 7, 2), -- Productor
    (2, 8, 3), -- Guionista
    (2, 9, 4), -- Compositor de música original
    (2, 10, 5), -- Editor
    -- El Discurso del Rey
    (3, 11, 2), -- Productor
    (3, 12, 3), -- Guionista
    (3, 13, 4), -- Compositor de música original
    (3, 14, 5), -- Editor
    -- La Lista de Schindler
    (4, 15, 2), -- Productor
    (4, 16, 3), -- Guionista
    (4, 17, 4), -- Compositor de música original
    (4, 18, 5); -- Editor

-- Películas de Comedia
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- Loco por Mary
    (5, 9, 2), -- Productor
    (5, 2, 3), -- Guionista
    (5, 1, 4), -- Compositor de música original
    (5, 2, 5), -- Editor
    -- La Máscara
    (6, 3, 2), -- Productor
    (6, 4, 3), -- Guionista
    (6, 5, 4), -- Compositor de música original
    (6, 2, 5), -- Editor
    -- Supercool
    (7, 7, 2), -- Productor
    (7, 8, 3), -- Guionista
    (7, 9, 4), -- Compositor de música original
    (7, 3, 5), -- Editor
    -- Scary Movie
    (8, 1, 2), -- Productor
    (8, 2, 3), -- Guionista
    (8, 3, 4), -- Compositor de música original
    (8, 4, 5), -- Editor
    -- Dumb and Dumber
    (9, 5, 2), -- Productor
    (9, 6, 3), -- Guionista
    (9, 7, 4), -- Compositor de música original
    (9, 8, 5); -- Editor

-- Películas de Romance
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- Orgullo y Prejuicio
    (10, 9, 2), -- Productor
    (10, 4, 3), -- Guionista
    (10, 1, 4), -- Compositor de música original
    (10, 2, 5), -- Editor
    -- Titanic
    (11, 3, 2), -- Productor
    (11, 4, 3), -- Guionista
    (11, 5, 4), -- Compositor de música original
    (11, 6, 5), -- Editor
    -- Antes del Amanecer
    (12, 7, 2), -- Productor
    (12, 1, 3), -- Guionista
    (12, 2, 4), -- Compositor de música original
    (12, 3, 5), -- Editor
    -- El Diario de una Pasión
    (13, 4, 2), -- Productor
    (13, 5, 3), -- Guionista
    (13, 6, 4), -- Compositor de música original
    (13, 7, 5), -- Editor
    -- Un Paseo para Recordar
    (14, 8, 2), -- Productor
    (14, 9, 3), -- Guionista
    (14, 10, 4), -- Compositor de música original
    (14, 11, 5); -- Editor

-- Películas de Suspense
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- El Silencio de los Inocentes
    (15, 12, 2), -- Productor
    (15, 13, 3), -- Guionista
    (15, 14, 4), -- Compositor de música original
    (15, 15, 5), -- Editor
    -- Sé Lo Que Hicieron el Verano Pasado
    (16, 16, 2), -- Productor
    (16, 17, 3), -- Guionista
    (16, 18, 4), -- Compositor de música original
    (16, 1, 5), -- Editor
    -- Psicosis
    (17, 2, 2), -- Productor
    (17, 1, 3), -- Guionista
    (17, 2, 4), -- Compositor de música original
    (17, 3, 5), -- Editor
    -- El Sexto Sentido
    (18, 4, 2), -- Productor
    (18, 5, 3), -- Guionista
    (18, 6, 4), -- Compositor de música original
    (18, 7, 5), -- Editor
    -- Seven
    (19, 8, 2), -- Productor
    (19, 9, 3), -- Guionista
    (19, 10, 4), -- Compositor de música original
    (19, 1, 5); -- Editor

-- Películas de Terror
INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
VALUES
    -- El Exorcista
    (20, 2, 2), -- Productor
    (20, 3, 3), -- Guionista
    (20, 4, 4), -- Compositor de música original
    (20, 5, 5), -- Editor
    -- El Resplandor
    (21, 6, 2), -- Productor
    (21, 7, 3), -- Guionista
    (21, 8, 4), -- Compositor de música original
    (21, 9, 5), -- Editor
    -- Actividad Paranormal
    (22, 4, 2), -- Productor
    (22, 1, 3), -- Guionista
    (22, 2, 4), -- Compositor de música original
    (22, 3, 5), -- Editor
    -- La Noche de Halloween
    (23, 4, 2), -- Productor
    (23, 5, 3), -- Guionista
    (23, 6, 4), -- Compositor de música original
    (23, 7, 5), -- Editor
    -- El Conjuro
    (24, 1, 2), -- Productor
    (24, 2, 3), -- Guionista
    (24, 3, 4), -- Compositor de música original
    (24, 4, 5); -- Editor

-- Insert de datos por defecto de la tabla personaje
INSERT INTO elenco.personaje (id_artista, id_pelicula, nombre_personaje, personaje_principal)
VALUES
    -- El Club de la Pelea
    (2, 1, 'Tyler Durden', TRUE),
    -- El Renacido
    (4, 2, 'Hugh Glass', TRUE),
    -- El Discurso del Rey
    (6, 3, 'Rey Jorge VI', TRUE),
    -- La Lista de Schindler
    (8, 4, 'Oskar Schindler', TRUE),
    -- Loco por Mary
    (10, 5, 'Ted Stroehmann', TRUE),
    -- La Máscara
    (12, 6, 'Stanley Ipkiss / La Máscara', TRUE),
    -- Supercool
    (14, 7, 'Evan', TRUE),
    -- Scary Movie
    (16, 8, 'Cindy Campbell', TRUE),
    -- Dumb and Dumber
    (18, 9, 'Lloyd Christmas', TRUE),
    -- Orgullo y Prejuicio
    (9, 10, 'Elizabeth Bennet', TRUE),
    -- Titanic
    (1, 11, 'Jack Dawson', TRUE),
    -- Antes del Amanecer
    (14, 12, 'Jesse', TRUE),
    -- El Diario de una Pasión
    (2, 13, 'Noah Calhoun', TRUE),
    -- Un Paseo para Recordar
    (16, 14, 'Landon Carter', TRUE),
    -- El Silencio de los Inocentes
    (18, 15, 'Dr. Hannibal Lecter', TRUE),
    -- Sé Lo Que Hicieron el Verano Pasado
    (3, 16, 'Julie James', TRUE),
    -- Psicosis
    (5, 17, 'Norman Bates', TRUE),
    -- El Sexto Sentido
    (3, 18, 'Cole Sear', TRUE),
    -- Seven
    (3, 19, 'David Mills', TRUE),
    -- El Exorcista
    (4, 20, 'Regan MacNeil', TRUE),
    -- El Resplandor
    (12, 21, 'Jack Torrance', TRUE),
    -- Actividad Paranormal
    (4, 22, 'Katie', TRUE),
    -- La Noche de Halloween
    (6, 23, 'Michael Myers', TRUE),
    -- El Conjuro
    (1, 24, 'Ed Warren', TRUE),
    -- Duro de Matar
    (3, 25, 'John McClane', TRUE),
    -- Terminator 2: El Juicio Final
    (5, 26, 'Terminator (T-800)', TRUE),
    -- Mad Max: Furia en el Camino
    (7, 27, 'Max Rockatansky', TRUE),
    -- Rápido y Furioso
    (8, 28, 'Dominic Toretto', TRUE),
    -- Cantando Bajo la Lluvia
    (10, 29, 'Don Lockwood', TRUE),
    -- El Mago de Oz
    (12, 30, 'Dorothy Gale', TRUE),
    -- La La Land
    (14, 31, 'Mia Dolan', TRUE),
    -- Chicago
    (16, 32, 'Roxie Hart', TRUE),
    -- Mamma Mia!
    (16, 33, 'Sophie Sheridan', TRUE),
    -- Blade Runner
    (1, 34, 'Rick Deckard', TRUE),
    -- Interestelar
    (2, 35, 'Cooper', TRUE),
    -- 2001: Una Odisea del Espacio
    (2, 36, 'Dr. Dave Bowman', TRUE),
    -- Matrix
    (6, 37, 'Neo', TRUE),
    -- Avatar
    (9, 38, 'Jake Sully', TRUE),
    -- El Señor de los Anillos: La Comunidad del Anillo
    (1, 39, 'Frodo Bolsón', TRUE),
    -- Harry Potter y la Piedra Filosofal
    (3, 40, 'Harry Potter', TRUE),
    -- La Historia Interminable
    (4, 41, 'Bastian Balthazar Bux', TRUE),
    -- El Laberinto del Fauno
    (7, 42, 'Ofelia', TRUE),
    -- Toy Story
    (9, 43, 'Woody', TRUE),
    -- Frozen
    (6, 44, 'Elsa', TRUE),
    -- Buscando a Nemo
    (3, 45, 'Marlin', TRUE),
    -- El Rey León
    (5, 46, 'Simba', TRUE),
    -- Monsters, Inc.
    (7, 47, 'Sulley', TRUE);

	
	