
--Insertar Genero
CREATE OR REPLACE FUNCTION insertar_genero(
    nombre_genero varchar(50)
) RETURNS VOID AS $$
BEGIN
    INSERT INTO catalogo_programacion.genero (nombre_genero) 
	VALUES (nombre_genero);
END;
$$ LANGUAGE plpgsql;

--Mostrar todos los generos
CREATE OR REPLACE FUNCTION mostrar_genero()
RETURNS TABLE (
    id_genero int,
    nombre_genero varchar(50)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT g.id_genero, g.nombre_genero 
	FROM catalogo_programacion.genero g;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM mostrar_genero();

--Mostrar un genero
CREATE OR REPLACE FUNCTION mostrar_genero_por_id(
    p_id_genero int
) RETURNS TABLE (
    id_genero int,
    nombre_genero varchar(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT g.id_genero, g.nombre_genero
    FROM catalogo_programacion.genero g
    WHERE g.id_genero = p_id_genero;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_genero_por_id(2);

--Eliminar
CREATE OR REPLACE FUNCTION eliminar_genero(
	IN p_id_genero int
) RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM catalogo_programacion.genero 
	WHERE catalogo_programacion.genero.id_genero = p_id_genero;
END;
$$ LANGUAGE plpgsql;


--Actualizar Genero
CREATE OR REPLACE FUNCTION actualizar_genero(
    IN p_id_genero int,
    IN nuevo_nombre_genero varchar(50)
) RETURNS VOID AS $$
BEGIN
    UPDATE catalogo_programacion.genero 
	SET nombre_genero = nuevo_nombre_genero 
	WHERE id_genero = p_id_genero;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------------------------------------------------------------------------

--Insertar clasificacion
CREATE OR REPLACE FUNCTION insertar_clasificacion(
    nombre_clasificacion varchar(50)
) RETURNS VOID AS $$
BEGIN
    INSERT INTO catalogo_programacion.clasificacion (nombre_clasificacion) 
	VALUES (nombre_clasificacion);
END;
$$ LANGUAGE plpgsql;

--Mostrar Clasificación
CREATE OR REPLACE FUNCTION mostrar_clasificacion()
RETURNS TABLE (
    id_clasificacion int,
    nombre_clasificacion varchar(50)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT c.id_clasificacion, c.nombre_clasificacion
	FROM catalogo_programacion.clasificacion c;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM mostrar_clasificacion();

--Mostrar una clasificacion
CREATE OR REPLACE FUNCTION mostrar_clasificacion_por_id(
    p_id_clasificacion int
) RETURNS TABLE (
    id_clasifiacion int,
    nombre_clasificacion varchar(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT c.id_clasificacion, c.nombre_clasificacion
    FROM catalogo_programacion.clasificacion c 
    WHERE c.id_clasificacion = p_id_clasificacion;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_clasificacion_por_id(2);

--ELIMINAR
CREATE OR REPLACE FUNCTION eliminar_clasificacion(
    IN p_id_clasificacion int
) RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM catalogo_programacion.clasificacion 
	WHERE id_clasificacion = p_id_clasificacion;
END;
$$ LANGUAGE plpgsql;

--Actualizar
CREATE OR REPLACE FUNCTION actualizar_clasificacion(
    p_id_clasificacion int,
    nuevo_nombre_clasificacion varchar(50)
) RETURNS VOID AS $$
BEGIN
    UPDATE catalogo_programacion.clasificacion
	SET nombre_clasificacion = nuevo_nombre_clasificacion
	WHERE id_clasificacion = p_id_clasificacion;
END;
$$ LANGUAGE plpgsql;


-------------------------------------------------------------------------------------------------------------------

--Insertar Pelicula
CREATE OR REPLACE FUNCTION insertar_pelicula(
    nombre_pelicula varchar(150),
    id_genero int,
    id_clasificacion int,
    anio_relace date,
    duracion time,
    descripcion_pelicula varchar(300)
) RETURNS VOID AS $$
BEGIN
    INSERT INTO catalogo_programacion.pelicula (nombre_pelicula, id_genero, id_clasificacion, anio_relace, duracion, descripcion_pelicula)
    VALUES (nombre_pelicula, id_genero, id_clasificacion, anio_relace, duracion, descripcion_pelicula);
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM catalogo_programacion.pelicula

--Mostrar pelicula
CREATE OR REPLACE FUNCTION mostrar_pelicula()
RETURNS TABLE (
    id_pelicula int,
	id_genero int,
	id_clasificacion int,
    nombre_pelicula varchar(150),
	anio_relace date,
	duracion time,
	descripcion_pelicula varchar(300)
	
) AS $$
BEGIN
    RETURN QUERY 
	SELECT p.id_pelicula, p.id_genero, p.id_clasificacion, p.nombre_pelicula,
		   p.anio_relace, p.duracion, p.descripcion_pelicula
	FROM catalogo_programacion.pelicula p;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM mostrar_pelicula();

--Mostrar una pelicula
CREATE OR REPLACE FUNCTION mostrar_pelicula_por_id(
    p_id_pelicula int
) RETURNS TABLE (
    id_pelicula int,
	id_genero int,
	id_clasificacion int,
    nombre_pelicula varchar(150),
	anio_relace date,
	duracion time,
	descripcion_pelicula varchar(300)
	
) AS $$
BEGIN
    RETURN QUERY 
	SELECT p.id_pelicula, p.id_genero, p.id_clasificacion, p.nombre_pelicula,
		   p.anio_relace, p.duracion, p.descripcion_pelicula
	FROM catalogo_programacion.pelicula p
	WHERE p.id_pelicula = p_id_pelicula;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_pelicula_por_id(2);

--Eliminar Pelicula
CREATE OR REPLACE FUNCTION eliminar_pelicula(
    p_id_pelicula int
) RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM catalogo_programacion.pelicula
	WHERE id_pelicula = p_id_pelicula;
END;
$$ LANGUAGE plpgsql;

--Actualizar
CREATE OR REPLACE FUNCTION actualizar_pelicula(
    p_id_pelicula int,
    p_nombre_pelicula varchar(150),
    p_id_genero int,
    p_id_clasificacion int,
    p_anio_relace date,
    p_duracion time,
    p_descripcion_pelicula varchar(300)
) RETURNS VOID AS $$
BEGIN
    UPDATE catalogo_programacion.pelicula 
    SET nombre_pelicula = p_nombre_pelicula, 
        id_genero = p_id_genero, 
        id_clasificacion = p_id_clasificacion, 
        anio_relace = p_anio_relace, 
        duracion = p_duracion, 
        descripcion_pelicula = p_descripcion_pelicula 
    WHERE id_pelicula = p_id_pelicula;
END;
$$ LANGUAGE plpgsql;


--------------------------------------------------------------------------------------------------

--Insertar compania productora
CREATE OR REPLACE FUNCTION insertar_compania_productora(
    nombre_compania_productora varchar(100)
) RETURNS VOID AS $$
BEGIN
    INSERT INTO catalogo_programacion.compania_productora (nombre_compania_productora)
    VALUES (nombre_compania_productora);
END;
$$ LANGUAGE plpgsql;

--Mostrar companias productoras
CREATE OR REPLACE FUNCTION mostrar_compania_productora()
RETURNS TABLE (
    id_compania_productora int,
    nombre_compania_productora varchar(100)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT cp.id_compania_productora, cp.nombre_compania_productora
	FROM catalogo_programacion.compania_productora cp;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM mostrar_compania_productora();

--Mostrar una compania 
CREATE OR REPLACE FUNCTION mostrar_compania_por_id(
    p_id_compania_productora int
) RETURNS TABLE (
    id_compania_productora int,
    nombre_compania_productora varchar(100)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT cp.id_compania_productora, cp.nombre_compania_productora
	FROM catalogo_programacion.compania_productora cp;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_compania_por_id(2);

--Eliminar
CREATE OR REPLACE FUNCTION eliminar_compania_productora(
    p_id_compania_productora int
) RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM catalogo_programacion.compania_productora 
	WHERE id_compania_productora = p_id_compania_productora;
END;
$$ LANGUAGE plpgsql;

--Actualizar
CREATE OR REPLACE FUNCTION actualizar_compania_productora(
    p_id_compania_productora int,
    p_nombre_compania_productora varchar(100)
) RETURNS VOID AS $$
BEGIN
    UPDATE catalogo_programacion.compania_productora 
    SET nombre_compania_productora = p_nombre_compania_productora 
    WHERE id_compania_productora = p_id_compania_productora;
END;
$$ LANGUAGE plpgsql;

--------------------------------------------------------------------------------------------------------------

--Insertar
CREATE OR REPLACE FUNCTION insertar_pelicula_compania_productora(
    p_id_pelicula int,
    p_id_compania_productora int
) RETURNS VOID AS $$
BEGIN
    INSERT INTO catalogo_programacion.pelicula_compania_productora (id_pelicula, id_compania_productora)
    VALUES (p_id_pelicula, p_id_compania_productora);
END;
$$ LANGUAGE plpgsql;

--Mostrar
CREATE OR REPLACE FUNCTION mostrar_pelicula_compania_productora() 
RETURNS TABLE (
    id_pelicula int,
    id_compania_productora int
) AS $$
BEGIN
    RETURN QUERY 
    SELECT pcp.id_pelicula, pcp.id_compania_productora
    FROM catalogo_programacion.pelicula_compania_productora pcp;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_pelicula_compania_productora();

--Eliminar
CREATE OR REPLACE FUNCTION eliminar_pelicula_compania_productora(
    p_id_pelicula int,
    p_id_compania_productora int
) RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM catalogo_programacion.pelicula_compania_productora
    WHERE id_pelicula = p_id_pelicula AND id_compania_productora = p_id_compania_productora;
END;
$$ LANGUAGE plpgsql;

--Actualizar
CREATE OR REPLACE FUNCTION actualizar_pelicula_compania_productora(
    p_id_pelicula int,
    p_id_compania_productora int,
    p_nuevo_id_pelicula int,
    p_nuevo_id_compania_productora int
) RETURNS VOID AS $$
BEGIN
    UPDATE catalogo_programacion.pelicula_compania_productora
    SET id_pelicula = p_nuevo_id_pelicula,
		id_compania_productora = p_nuevo_id_compania_productora
    WHERE id_pelicula = p_id_pelicula AND id_compania_productora = p_id_compania_productora;
END;
$$ LANGUAGE plpgsql;

-----------------------------------------------------------------------------------------------------------------

--Insertar Programacion
CREATE OR REPLACE FUNCTION insertar_programacion(
    id_pelicula int,
    hora time,
    fecha date
) RETURNS VOID AS $$
BEGIN
    INSERT INTO catalogo_programacion.programacion (id_pelicula, hora, fecha)
    VALUES (id_pelicula, hora, fecha);
END;
$$ LANGUAGE plpgsql;

--Mostrar programacion
CREATE OR REPLACE FUNCTION mostrar_programacion()
RETURNS TABLE (
    id_programacion int,
    hora time,
	fecha date
) AS $$
BEGIN
    RETURN QUERY 
	SELECT p.id_programacion, p.hora, p.fecha
	FROM catalogo_programacion.programacion p;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_programacion();

--Mostrar una programacion
CREATE OR REPLACE FUNCTION mostrar_programacion_por_id(
    p_id_programacion int
) RETURNS TABLE (
    id_programacion int,
    hora time,
	fecha date
) AS $$
BEGIN
    RETURN QUERY 
	SELECT p.id_programacion, p.hora, p.fecha
	FROM catalogo_programacion.programacion p
	WHERE p.id_programacion = p_id_programacion;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_programacion();

--Eliminar
CREATE OR REPLACE FUNCTION eliminar_programacion(
    id_programacion int
) RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM catalogo_programacion.programacion 
	WHERE id_programacion = id_programacion;
END;
$$ LANGUAGE plpgsql;

--Actualizar
CREATE OR REPLACE FUNCTION actualizar_programacion(
    p_id_programacion int,
    p_id_pelicula int,
    p_hora time,
    p_fecha date
) RETURNS VOID AS $$
BEGIN
    UPDATE catalogo_programacion.programacion 
    SET id_pelicula = p_id_pelicula, 
        hora = p_hora, 
        fecha = p_fecha 
    WHERE id_programacion = p_id_programacion;
END;
$$ LANGUAGE plpgsql;

------------------------------------------------------------------------------------------------

--Insertar Espacio Especial

CREATE OR REPLACE FUNCTION insertar_espacio_especial(
    nombre varchar(60),
    descripcion varchar(300),
    horario varchar(100)
) RETURNS VOID AS $$
BEGIN
    INSERT INTO catalogo_programacion.espacio_especial (nombre, descripcion, horario)
    VALUES (nombre, descripcion, horario);
END;
$$ LANGUAGE plpgsql;

--Mostrar Espacio Especial
CREATE OR REPLACE FUNCTION mostrar_espacio_especial()
RETURNS TABLE (
    id_espacio_especial int,
    nombre varchar(60),
	descripcion varchar(300),
	horario varchar(100)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT e.id_espacio_especial, e.nombre, e.descripcion, e.horario
	FROM catalogo_programacion.espacio_especial e;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_espacio_especial();

--Mostrar por filtros
CREATE OR REPLACE FUNCTION mostrar_espacio_especial_por_id(
    p_id_espacio_especial int
) RETURNS TABLE (
    id_espacio_especial int,
    nombre varchar(60),
	descripcion varchar(300),
	horario varchar(100)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT e.id_espacio_especial, e.nombre, e.descripcion, e.horario
	FROM catalogo_programacion.espacio_especial e
	WHERE e.id_espacio_especial = p_id_espacio_especial;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_espacio_especial_por_id(2);

--Eliminar espacio especial
CREATE OR REPLACE FUNCTION eliminar_espacio_especial(
    id_espacio_especial int
) RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM catalogo_programacion.espacio_especial 
	WHERE id_espacio_especial = id_espacio_especial;
END;
$$ LANGUAGE plpgsql;

--Actualizar
CREATE OR REPLACE FUNCTION actualizar_espacio_especial(
    p_id_espacio_especial varchar,
    p_nombre varchar(60),
    p_descripcion varchar(300),
    p_horario varchar(100)
) RETURNS VOID AS $$
BEGIN
    UPDATE catalogo_programacion.espacio_especial 
    SET nombre = p_nombre, 
        descripcion = p_descripcion, 
        horario = p_horario 
    WHERE id_espacio_especial = p_id_espacio_especial;
END;
$$ LANGUAGE plpgsql;

----------------------------------------------------------------------------------------------------------

--Insertar
CREATE OR REPLACE FUNCTION insertar_espacio_especial_pelicula(
    id_espacio_especial int,
    id_pelicula int,
    fecha date
) RETURNS VOID AS $$
BEGIN
    INSERT INTO catalogo_programacion.espacio_especial_pelicula (id_espacio_especial, id_pelicula, fecha)
    VALUES (id_espacio_especial, id_pelicula, fecha);
END;
$$ LANGUAGE plpgsql;

--Mostrar
CREATE OR REPLACE FUNCTION mostrar_espacio_especial_pelicula()
RETURNS TABLE (
    id_espacio_especial int,
    id_pelicula int,
    fecha date
) AS $$
BEGIN
    RETURN QUERY 
	SELECT ee.id_espacio_especial, ee.pelicula, ee.fecha
	FROM catalogo_programacion.espacio_especial_pelicula ee;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_espacio_especial();

--Eliminar
CREATE OR REPLACE FUNCTION eliminar_espacio_especial_pelicula(
    p_id_espacio_especial int,
    p_id_pelicula int
) RETURNS VOID AS $$
BEGIN
    DELETE FROM catalogo_programacion.espacio_especial_pelicula 
    WHERE id_espacio_especial = p_id_espacio_especial AND id_pelicula = p_id_pelicula;
END;
$$ LANGUAGE plpgsql;

--Actualizar
CREATE OR REPLACE FUNCTION actualizar_fecha_espacio_especial_pelicula(
    p_id_espacio_especial int,
    p_id_pelicula int,
    p_fecha date
) RETURNS VOID AS $$
BEGIN
    UPDATE catalogo_programacion.espacio_especial_pelicula 
    SET fecha = p_fecha 
    WHERE id_espacio_especial = p_id_espacio_especial AND id_pelicula = p_id_pelicula;
END;
$$ LANGUAGE plpgsql;


-------------------------------------------------------------------------------------------------------------------

--Insertar nacionalidad
CREATE OR REPLACE FUNCTION insertar_nacionalidad(
    nombre_nacionalidad varchar(150),
    pais varchar(100)
) RETURNS VOID AS $$
BEGIN
    INSERT INTO elenco.nacionalidad (nombre_nacionalidad, pais)
    VALUES (nombre_nacionalidad, pais);
END;
$$ LANGUAGE plpgsql;

--Mostrar Nacionalidad
CREATE OR REPLACE FUNCTION mostrar_nacionalidad()
RETURNS TABLE (
    id_nacionalidad int,
    nombre_nacionalidad varchar(150),
	pais varchar(100)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT n.id_nacionalidad, n.nombre_nacionalidad, n.pais
	FROM elenco.nacionalidad n;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_nacionalidad();

--Mostrar una nacionalidad
CREATE OR REPLACE FUNCTION mostrar_nacionalidad_por_id(
    p_id_nacionalidad int
) RETURNS TABLE (
    id_nacionalidad int,
    nombre_nacionalidad varchar(150),
	pais varchar(100)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT n.id_nacionalidad, n.nombre_nacionalidad, n.pais
	FROM elenco.nacionalidad n
	WHERE n.id_nacionalidad = p_id_nacionalidad;
END;
$$ LANGUAGE plpgsql;

SELECT  mostrar_nacionalidad_por_id(2);

--Eliminar
CREATE OR REPLACE FUNCTION eliminar_nacionalidad(
    p_id_nacionalidad int
) RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM elenco.nacionalidad 
	WHERE id_nacionalidad = p_id_nacionalidad;
END;
$$ LANGUAGE plpgsql;

--Actualizar
CREATE OR REPLACE FUNCTION actualizar_nacionalidad(
    p_id_nacionalidad int,
    p_nombre_nacionalidad varchar(150),
    p_pais varchar(100)
) RETURNS VOID AS $$
BEGIN
    UPDATE elenco.nacionalidad
    SET nombre_nacionalidad = p_nombre_nacionalidad, 
	pais = p_pais
    WHERE id_nacionalidad = p_id_nacionalidad;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------------------------------------------------------------------------

--Insertar profesion
CREATE OR REPLACE FUNCTION insertar_profesion(
    nombre_profesion varchar(15)
) RETURNS VOID AS $$
BEGIN
    INSERT INTO elenco.profesion (nombre_profesion)
    VALUES (nombre_profesion);
END;
$$ LANGUAGE plpgsql;

--Mostrar Profesion
CREATE OR REPLACE FUNCTION mostrar_profesion()
RETURNS TABLE (
    id_profesion int,
    nombre_profesion varchar(15)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT p.id_profesion, p.nombre_profesion
	FROM elenco.profesion p;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_profesion();

--Mostrar Profesion
CREATE OR REPLACE FUNCTION mostrar_profesion_por_id(
    p_id_profesion int
) RETURNS TABLE (
    id_profesion int,
    nombre_profesion varchar(15)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT p.id_profesion, p.nombre_profesion
	FROM elenco.profesion p
	WHERE p.id_profesion = p_id_profesion;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_profesion_por_id(2); 

--Eliminar
CREATE OR REPLACE FUNCTION eliminar_profesion(
    p_id_profesion int
) RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM elenco.profesion 
	WHERE id_profesion = p_id_profesion;
END;
$$ LANGUAGE plpgsql;

--Actualizar
CREATE OR REPLACE FUNCTION actualizar_profesion(
    p_id_profesion int,
    p_nombre_profesion varchar(15)
) RETURNS VOID AS $$
BEGIN
    UPDATE elenco.profesion
    SET nombre_profesion = p_nombre_profesion
    WHERE id_profesion = p_id_profesion;
END;
$$ LANGUAGE plpgsql;

---------------------------------------------------------------------------------------------------

--Insertar artista
CREATE OR REPLACE FUNCTION insertar_artista(
    id_nacionalidad int,
    id_profesion int,
    manager varchar(50),
    nombres varchar(50),
    apellidos varchar(50),
    biografia varchar(500),
    fecha_nacimiento date
) RETURNS VOID AS $$
BEGIN
    INSERT INTO elenco.artista (id_nacionalidad, id_profesion, manager, nombres, apellidos, biografia, fecha_nacimiento)
    VALUES (id_nacionalidad, id_profesion, manager, nombres, apellidos, biografia, fecha_nacimiento);
END;
$$ LANGUAGE plpgsql;

--Mostrar artista

CREATE OR REPLACE FUNCTION mostrar_artista()
RETURNS TABLE (
    id_artista int,
    id_nacionalidad int,
    id_profesion int,
    manager varchar(50),
    nombres varchar(50),
    apellidos varchar(50),
    biografia varchar(500),
    fecha_nacimiento date
) AS $$
BEGIN
    RETURN QUERY 
	SELECT a.id_artista, a.id_nacionalidad, a.id_profesion, a.manager, a.nombres, a.apellidos,
		   a.biografia, a.fecha_nacimiento
	FROM elenco.artista a;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_profesion();

--Mostrar una nacionalidad
CREATE OR REPLACE FUNCTION mostrar_artista_por_id(
    p_id_artista int
) RETURNS TABLE (
    id_artista int,
    id_nacionalidad int,
    id_profesion int,
    manager varchar(50),
    nombres varchar(50),
    apellidos varchar(50),
    biografia varchar(500),
    fecha_nacimiento date
) AS $$
BEGIN
    RETURN QUERY 
	SELECT a.id_artista, a.id_nacionalidad, a.id_profesion, a.manager, a.nombres, a.apellidos,
		   a.biografia, a.fecha_nacimiento
	FROM elenco.artista a
	WHERE a.id_artista = p_id_artista;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_artista_por_id(2);

--Eliminar
CREATE OR REPLACE FUNCTION eliminar_artista(
    p_id_artista int
) RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM elenco.artista 
	WHERE id_artista = p_id_artista;
END;
$$ LANGUAGE plpgsql;

--Actualizar artista
CREATE OR REPLACE FUNCTION actualizar_artista(
    p_id_artista int,
    p_id_nacionalidad int,
    p_id_profesion int,
    p_manager varchar(50),
    p_nombres varchar(50),
    p_apellidos varchar(50),
    p_biografia varchar(500),
    p_fecha_nacimiento date
) RETURNS VOID AS $$
BEGIN
    UPDATE elenco.artista
    SET id_nacionalidad = p_id_nacionalidad, 
        id_profesion = p_id_profesion, 
        manager = p_manager,
        nombres = p_nombres,
        apellidos = p_apellidos,
        biografia = p_biografia,
        fecha_nacimiento = p_fecha_nacimiento
    WHERE id_artista = p_id_artista;
END;
$$ LANGUAGE plpgsql;

------------------------------------------------------------------------------------------------

--Insertar personaje
CREATE OR REPLACE FUNCTION insertar_personaje(
    id_artista int,
    id_pelicula int,
    nombre_personaje varchar(100),
    personaje_principal boolean DEFAULT FALSE
) RETURNS VOID AS $$
BEGIN
    INSERT INTO elenco.personaje (id_artista, id_pelicula, nombre_personaje, personaje_principal)
    VALUES (id_artista, id_pelicula, nombre_personaje, personaje_principal);
END;
$$ LANGUAGE plpgsql;

--Mostrar Personajes
CREATE OR REPLACE FUNCTION mostrar_personaje()
RETURNS TABLE (
    id_personaje int,
    id_artista int,
	id_pelicula int,
	nombre_personaje varchar(100),
	personaje_principal boolean
	
) AS $$
BEGIN
    RETURN QUERY 
	SELECT p.id_personaje, p.id_artista, p.id_pelicula, p.nombre_personaje, p.personaje_principal
	FROM elenco.personaje p;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_personaje();

--Mostrar un personaje
CREATE OR REPLACE FUNCTION mostrar_personaje_por_id(
    p_id_personaje int
) RETURNS TABLE (
    id_personaje int,
    id_artista int,
	id_pelicula int,
	nombre_personaje varchar(100),
	personaje_principal boolean
	
) AS $$
BEGIN
    RETURN QUERY 
	SELECT p.id_personaje, p.id_artista, p.id_pelicula, p.nombre_personaje, p.personaje_principal
	FROM elenco.personaje p
	WHERE p.id_personaje = p_id_personaje;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_personaje_por_id(2);

--Eliminar personaje
CREATE OR REPLACE FUNCTION eliminar_personaje(
    p_id_personaje int
) RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM elenco.personaje 
	WHERE id_personaje = p_id_personaje;
END;
$$ LANGUAGE plpgsql;

--Actualizar personaje
CREATE OR REPLACE FUNCTION actualizar_personaje(
    p_id_personaje int,
    p_id_artista int,
    p_id_pelicula int,
    p_nombre_personaje varchar(100),
    p_personaje_principal boolean
) RETURNS VOID AS $$
BEGIN
    UPDATE elenco.personaje
    SET id_artista = p_id_artista, 
        id_pelicula = p_id_pelicula, 
        nombre_personaje = p_nombre_personaje,
        personaje_principal = p_personaje_principal
    WHERE id_personaje = p_id_personaje;
END;
$$ LANGUAGE plpgsql;

---------------------------------------------------------------------------------------------------------------

--Insertar
CREATE OR REPLACE FUNCTION insertar_sitie(
    id_artista int,
    fan_site_url varchar(150),
    personal_site_url varchar(150)
) RETURNS VOID AS $$
BEGIN
    INSERT INTO elenco.sitie (id_artista, fan_site_url, personal_site_url)
    VALUES (id_artista, fan_site_url, personal_site_url);
END;
$$ LANGUAGE plpgsql;

--Mostrar
CREATE OR REPLACE FUNCTION mostrar_sitie()
RETURNS TABLE (
    id_artista int,
    fan_site_url varchar(150),
	personal_site_url varchar(150)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT s.id_artista, s.fan_site_url, s.personal_site_url
	FROM elenco.sitie s;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_sitie();

--Mostrar 
CREATE OR REPLACE FUNCTION mostrar_sitie_artista(
    p_id_artista int
) RETURNS TABLE (
    id_artista int,
    fan_site_url varchar(150),
	personal_site_url varchar(150)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT s.id_artista, s.fan_site_url, s.personal_site_url
	FROM elenco.sitie s
	WHERE s.id_artista = p_id_artista;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_sitie_artista(16);

--Eliminar
CREATE OR REPLACE FUNCTION eliminar_sitie(
    p_id_artista int
) RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM elenco.sitie
	WHERE id_artista = p_id_artista;
END;
$$ LANGUAGE plpgsql;

--Actualizar
CREATE OR REPLACE FUNCTION actualizar_sitie(
    p_id_artista int,
    p_fan_site_url varchar(150),
    p_personal_site_url varchar(150)
) RETURNS VOID AS $$
BEGIN
    UPDATE elenco.sitie
    SET fan_site_url = p_fan_site_url, 
	personal_site_url = p_personal_site_url
    WHERE id_artista = p_id_artista;
END;
$$ LANGUAGE plpgsql;

----------------------------------------------------------------------------------------------------------------

--Insertar Tipo Cargo
CREATE OR REPLACE FUNCTION insertar_tipo_cargo(
    nombre_tipo_cargo varchar(50)
) RETURNS VOID AS $$
BEGIN
    INSERT INTO elenco.tipo_cargo (nombre_tipo_cargo)
    VALUES (nombre_tipo_cargo);
END;
$$ LANGUAGE plpgsql;

--Mostrar TipoCargo
CREATE OR REPLACE FUNCTION mostrar_tipo_cargo()
RETURNS TABLE (
    id_tipo_cargo int,
    nombre_tipo_cargo varchar(50)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT tc.id_tipo_cargo, tc.nombre_tipo_cargo
	FROM elenco.tipo_cargo tc;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_tipo_cargo();

--Mostrar un personaje
CREATE OR REPLACE FUNCTION mostrar_cargo_por_id(
    p_id_tipo_cargo int
) RETURNS TABLE (
    id_tipo_cargo int,
    nombre_tipo_cargo varchar(50)
) AS $$
BEGIN
    RETURN QUERY 
	SELECT tc.id_tipo_cargo, tc.nombre_tipo_cargo
	FROM elenco.tipo_cargo tc
	WHERE tc.id_tipo_cargo = p_id_tipo_cargo;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_cargo_por_id(1);

--Eliminar
CREATE OR REPLACE FUNCTION eliminar_tipo_cargo(
    p_id_tipo_cargo int
) RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM elenco.tipo_cargo 
	WHERE id_tipo_cargo = p_id_tipo_cargo;
END;
$$ LANGUAGE plpgsql;

--Actualizar
CREATE OR REPLACE FUNCTION actualizar_cargo(
    p_id_tipo_cargo int,
    p_nombre_tipo_cargo varchar(50)
) RETURNS VOID AS $$
BEGIN
    UPDATE elenco.tipo_cargo
    SET nombre_tipo_cargo = p_nombre_tipo_cargo
    WHERE id_tipo_cargo = p_id_tipo_cargo;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------------------------------------------------------------------

--Insertar 
CREATE OR REPLACE FUNCTION insertar_pelicula_artista_cargo(
    id_pelicula int,
    id_artista int,
    id_tipo_cargo int
) RETURNS VOID AS $$
BEGIN
    INSERT INTO elenco.pelicula_artista_cargo (id_pelicula, id_artista, id_tipo_cargo)
    VALUES (id_pelicula, id_artista, id_tipo_cargo);
END;
$$ LANGUAGE plpgsql;

--Mostrar
CREATE OR REPLACE FUNCTION mostrar_pelicula_artista_cargo()
RETURNS TABLE (
    id_pelicula int,
    id_artista int,
    id_tipo_cargo int
) AS $$
BEGIN
    RETURN QUERY 
	SELECT pac.id_pelicula, pac.id_artista, pac.id_tipo_cargo
	FROM elenco.pelicula_artista_cargo pac;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_pelicula_artista_cargo();

--Mostrar 
CREATE OR REPLACE FUNCTION mostrar_pelicula_artista_cargo_id(
    p_id_artista int
) RETURNS TABLE (
    id_pelicula int,
    id_artista int,
    id_tipo_cargo int
) AS $$
BEGIN
    RETURN QUERY 
	SELECT pac.id_pelicula, pac.id_artista, pac.id_tipo_cargo
	FROM elenco.pelicula_artista_cargo pac
	WHERE pac.id_artista = p_id_artista;
END;
$$ LANGUAGE plpgsql;

SELECT mostrar_pelicula_artista_cargo_id(2);

--Eliminar
CREATE OR REPLACE FUNCTION eliminar_pelicula_artista_cargo(
    p_id_pelicula int,
    p_id_artista int,
    p_id_tipo_cargo int
) RETURNS VOID AS $$
BEGIN
    DELETE FROM elenco.pelicula_artista_cargo 
    WHERE id_pelicula = p_id_pelicula AND id_artista = p_id_artista AND id_tipo_cargo = p_id_tipo_cargo;
END;
$$ LANGUAGE plpgsql;

--Actualizar
CREATE OR REPLACE FUNCTION actualizar_pelicula_artista_cargo(
    p_id_pelicula int,
    p_id_artista int,
    p_id_tipo_cargo int
) RETURNS VOID AS $$
BEGIN
    UPDATE elenco.pelicula_artista_cargo
    SET id_pelicula = p_id_pelicula, 
        id_artista = p_id_artista, 
        id_tipo_cargo = p_id_tipo_cargo
    WHERE id_pelicula = p_id_pelicula 
        AND id_artista = p_id_artista 
        AND id_tipo_cargo = p_id_tipo_cargo;
END;
$$ LANGUAGE plpgsql;
