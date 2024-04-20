-- Sp para mostrar la cartelera de peliculas
CREATE OR REPLACE FUNCTION obtener_cartelera() 
RETURNS TABLE (
    fecha_programacion date,
    hora_programacion time,
    nombre_pelicula varchar(100),
    nombre_genero varchar(50),
    nombre_clasificacion varchar(50),
    anio_relace date,
    duracion time,
    descripcion_pelicula varchar(300),
    nombres_director varchar(100)
) AS $$
DECLARE
    id_director int;
BEGIN
    SELECT id_tipo_cargo INTO id_director 
	FROM elenco.tipo_cargo 
	WHERE nombre_tipo_cargo = 'Director';

    RETURN QUERY 
    SELECT 
        cp.fecha AS fecha_programacion,
        cp.hora AS hora_programacion,
        cpp.nombre_pelicula, 
        cpg.nombre_genero, 
        cpc.nombre_clasificacion, 
        cpp.anio_relace, 
        cpp.duracion,
        cpp.descripcion_pelicula, 
        ea.nombres AS nombres_director
    FROM 
        catalogo_programacion.pelicula cpp JOIN catalogo_programacion.programacion cp 
			ON cpp.id_pelicula = cp.id_pelicula
    		LEFT JOIN catalogo_programacion.genero cpg 
			ON cpp.id_genero = cpg.id_genero
    		LEFT JOIN catalogo_programacion.clasificacion cpc 
			ON cpp.id_clasificacion = cpc.id_clasificacion
   			LEFT JOIN elenco.pelicula_artista_cargo epac 
			ON cpp.id_pelicula = epac.id_pelicula
    		LEFT JOIN elenco.artista ea 
			ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_cartelera(); 

-- Sp para mostrar la cartelera, pero para una fecha determinada
CREATE OR REPLACE FUNCTION obtener_cartelera_fecha(p_fecha_programacion date) 
RETURNS TABLE (
    fecha_programacion date,
    hora_programacion time,
    nombre_pelicula varchar(100),
    nombre_genero varchar(50),
    nombre_clasificacion varchar(50),
    anio_relace date,
    duracion time,
    descripcion_pelicula varchar(300),
    nombres_director varchar(100)
) AS $$
DECLARE
    id_director int;
BEGIN
    SELECT id_tipo_cargo INTO id_director 
	FROM elenco.tipo_cargo 
	WHERE nombre_tipo_cargo = 'Director';

    RETURN QUERY 
    SELECT 
        cp.fecha AS fecha_programacion,
        cp.hora AS hora_programacion,
        cpp.nombre_pelicula, 
        cpg.nombre_genero, 
        cpc.nombre_clasificacion, 
        cpp.anio_relace, 
        cpp.duracion,
        cpp.descripcion_pelicula, 
        ea.nombres AS nombres_director
    FROM 
        catalogo_programacion.pelicula cpp JOIN catalogo_programacion.programacion cp 
			ON cpp.id_pelicula = cp.id_pelicula
			LEFT JOIN catalogo_programacion.genero cpg 
			ON cpp.id_genero = cpg.id_genero
			LEFT JOIN catalogo_programacion.clasificacion cpc 
			ON cpp.id_clasificacion = cpc.id_clasificacion
			LEFT JOIN elenco.pelicula_artista_cargo epac 
			ON cpp.id_pelicula = epac.id_pelicula
			LEFT JOIN elenco.artista ea 
			ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director AND cp.fecha = p_fecha_programacion;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_cartelera_fecha('2003-03-03');
	
-- Sp para mostrar la cartelera por genero por un determinado mes
CREATE OR REPLACE FUNCTION obtener_cartelera_mes(p_fecha_programacion date, p_nombre_genero varchar(50)) 
RETURNS TABLE (
    fecha_programacion date,
    hora_programacion time,
    nombre_pelicula varchar(100),
    nombre_genero varchar(50),
    nombre_clasificacion varchar(50),
    anio_relace date,
    duracion time,
    descripcion_pelicula varchar(300),
    nombres_director varchar(100)
) AS $$
DECLARE
    id_director int;
BEGIN
    SELECT id_tipo_cargo INTO id_director 
	FROM elenco.tipo_cargo 
	WHERE nombre_tipo_cargo = 'Director';

    RETURN QUERY 
    SELECT 
        cp.fecha AS fecha_programacion,
        cp.hora AS hora_programacion,
        cpp.nombre_pelicula, 
        cpg.nombre_genero, 
        cpc.nombre_clasificacion, 
        cpp.anio_relace, 
        cpp.duracion,
        cpp.descripcion_pelicula, 
        ea.nombres AS nombres_director
    FROM 
        catalogo_programacion.pelicula cpp JOIN catalogo_programacion.programacion cp
			ON cpp.id_pelicula = cp.id_pelicula
			LEFT JOIN catalogo_programacion.genero cpg
			ON cpp.id_genero = cpg.id_genero
			LEFT JOIN catalogo_programacion.clasificacion cpc 
			ON cpp.id_clasificacion = cpc.id_clasificacion
			LEFT JOIN elenco.pelicula_artista_cargo epac 
			ON cpp.id_pelicula = epac.id_pelicula
			LEFT JOIN elenco.artista ea 
			ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director AND cp.fecha >= p_fecha_programacion 
		AND cp.fecha < p_fecha_programacion + INTERVAL '1 month'
		AND cpg.nombre_genero = p_nombre_genero;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_cartelera_mes('2003-03-03','Comedia');

-- Sp para mostrar la cartelera por clasificación por un determinado mes
CREATE OR REPLACE FUNCTION obtener_cartelera_mes_clasificacion(p_fecha_programacion date, p_nombre_clasificacion varchar(50)) 
RETURNS TABLE (
    fecha_programacion date,
    hora_programacion time,
    nombre_pelicula varchar(100),
    nombre_genero varchar(50),
    nombre_clasificacion varchar(50),
    anio_relace date,
    duracion time,
    descripcion_pelicula varchar(300),
    nombres_director varchar(100)
) AS $$
DECLARE
    id_director int;
BEGIN
    SELECT id_tipo_cargo INTO id_director 
	FROM elenco.tipo_cargo 
	WHERE nombre_tipo_cargo = 'Director';

    RETURN QUERY 
    SELECT 
        cp.fecha AS fecha_programacion,
        cp.hora AS hora_programacion,
        cpp.nombre_pelicula, 
        cpg.nombre_genero, 
        cpc.nombre_clasificacion, 
        cpp.anio_relace, 
        cpp.duracion,
        cpp.descripcion_pelicula, 
        ea.nombres AS nombres_director
    FROM 
        catalogo_programacion.pelicula cpp JOIN catalogo_programacion.programacion cp
			ON cpp.id_pelicula = cp.id_pelicula
			LEFT JOIN catalogo_programacion.genero cpg 
			ON cpp.id_genero = cpg.id_genero
			LEFT JOIN catalogo_programacion.clasificacion cpc 
			ON cpp.id_clasificacion = cpc.id_clasificacion
			LEFT JOIN elenco.pelicula_artista_cargo epac 
			ON cpp.id_pelicula = epac.id_pelicula
			LEFT JOIN elenco.artista ea
			ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director AND cp.fecha >= p_fecha_programacion 
		AND cp.fecha < p_fecha_programacion + INTERVAL '1 month' 
		AND cpc.nombre_clasificacion = p_nombre_clasificacion;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_cartelera_mes_clasificacion('2003-03-03','PG-13');

-- Sp para mostrar la cartelera por director
CREATE OR REPLACE FUNCTION obtener_cartelera_director(p_nombres_director varchar(100)) 
RETURNS TABLE (
    fecha_programacion date,
    hora_programacion time,
    nombre_pelicula varchar(100),
    nombre_genero varchar(50),
    nombre_clasificacion varchar(50),
    anio_relace date,
    duracion time,
    descripcion_pelicula varchar(300),
    nombres_director varchar(100)
) AS $$
DECLARE
    id_director int;
BEGIN
    SELECT id_tipo_cargo INTO id_director 
	FROM elenco.tipo_cargo
	WHERE nombre_tipo_cargo = 'Director';

    RETURN QUERY 
    SELECT 
        cp.fecha AS fecha_programacion,
        cp.hora AS hora_programacion,
        cpp.nombre_pelicula, 
        cpg.nombre_genero, 
        cpc.nombre_clasificacion, 
        cpp.anio_relace, 
        cpp.duracion,
        cpp.descripcion_pelicula, 
        ea.nombres AS nombres_director
    FROM 
        catalogo_programacion.pelicula cpp JOIN catalogo_programacion.programacion cp 
			ON cpp.id_pelicula = cp.id_pelicula
			LEFT JOIN catalogo_programacion.genero cpg 
			ON cpp.id_genero = cpg.id_genero
			LEFT JOIN catalogo_programacion.clasificacion cpc 
			ON cpp.id_clasificacion = cpc.id_clasificacion
			LEFT JOIN elenco.pelicula_artista_cargo epac 
			ON cpp.id_pelicula = epac.id_pelicula
			LEFT JOIN elenco.artista ea 
			ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director AND ea.nombres = p_nombres_director;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_cartelera_director('Christopher');

-- Sp para mostrar la cartelera de espacios especiales
CREATE OR REPLACE FUNCTION obtener_cartelera_espacios_especiales() 
RETURNS TABLE (
    fecha_espacio_especial_pelicula date,
    nombre_pelicula varchar(100),
    nombres_director varchar(100),
    descripcion_pelicula varchar(300),
    nombre_espacio_especial varchar(100)
) AS $$
DECLARE
    id_director int;
BEGIN
    SELECT id_tipo_cargo INTO id_director 
	FROM elenco.tipo_cargo 
	WHERE nombre_tipo_cargo = 'Director';

    RETURN QUERY 
    SELECT 
        cpep.fecha AS fecha_espacio_especial_pelicula,
        cpp.nombre_pelicula, 
        ea.nombres AS nombres_director,
        cpp.descripcion_pelicula, 
        cpee.nombre
    FROM 
        catalogo_programacion.espacio_especial cpee JOIN catalogo_programacion.espacio_especial_pelicula cpep 
			ON cpee.id_espacio_especial = cpep.id_espacio_especial
			JOIN catalogo_programacion.pelicula cpp 
			ON cpep.id_pelicula = cpp.id_pelicula
    		LEFT JOIN elenco.pelicula_artista_cargo epac 
			ON cpp.id_pelicula = epac.id_pelicula
    		LEFT JOIN elenco.artista ea 
			ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_cartelera_espacios_especiales();

-- Sp para mostrar la cartelera de espacios especiales por fecha
CREATE OR REPLACE FUNCTION obtener_cartelera_espacios_especiales_fecha(fecha_espacio_especial date)
RETURNS TABLE (
    fecha_espacio_especial_pelicula date,
    nombre_pelicula varchar(100),
    nombres_director varchar(100),
    descripcion_pelicula varchar(300),
    nombre_espacio_especial varchar(100)
) AS $$
DECLARE
    id_director int;
BEGIN
    SELECT id_tipo_cargo INTO id_director 
	FROM elenco.tipo_cargo 
	WHERE nombre_tipo_cargo = 'Director';

    RETURN QUERY 
    SELECT 
        cpep.fecha AS fecha_espacio_especial_pelicula,
        cpp.nombre_pelicula, 
        ea.nombres AS nombres_director,
        cpp.descripcion_pelicula, 
        cpee.nombre
    FROM 
        catalogo_programacion.espacio_especial cpee JOIN catalogo_programacion.espacio_especial_pelicula cpep 
			ON cpee.id_espacio_especial = cpep.id_espacio_especial
			JOIN catalogo_programacion.pelicula cpp 
			ON cpep.id_pelicula = cpp.id_pelicula 
			LEFT JOIN elenco.pelicula_artista_cargo epac 
			ON cpp.id_pelicula = epac.id_pelicula
			LEFT JOIN elenco.artista ea ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director AND cpep.fecha = fecha_espacio_especial;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_cartelera_espacios_especiales_fecha('2024-04-19');

-- Sp para mostrar la cartelera de espacios especiales por el espacio y mes
CREATE OR REPLACE FUNCTION obtener_cartelera_espacios_especiales_espacio_mes(fecha_mes date, nombre_espacio_especial_mostrar varchar(100)) 
RETURNS TABLE (
    fecha_espacio_especial_pelicula date,
    nombre_pelicula varchar(100),
    nombres_director varchar(100),
    descripcion_pelicula varchar(300),
    nombre_espacio_especial varchar(100)
) AS $$
DECLARE
    id_director int;
BEGIN
    SELECT id_tipo_cargo INTO id_director 
	FROM elenco.tipo_cargo 
	WHERE nombre_tipo_cargo = 'Director';

    RETURN QUERY 
    SELECT 
        cpep.fecha AS fecha_espacio_especial_pelicula,
        cpp.nombre_pelicula, 
        ea.nombres AS nombres_director,
        cpp.descripcion_pelicula, 
        cpee.nombre
    FROM 
        catalogo_programacion.espacio_especial cpee JOIN catalogo_programacion.espacio_especial_pelicula cpep
			ON cpee.id_espacio_especial = cpep.id_espacio_especial
			JOIN catalogo_programacion.pelicula cpp 
			ON cpep.id_pelicula = cpp.id_pelicula
			LEFT JOIN elenco.pelicula_artista_cargo epac 
			ON cpp.id_pelicula = epac.id_pelicula
			LEFT JOIN elenco.artista ea 
			ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director AND cpep.fecha >= fecha_mes 
		AND cpep.fecha < fecha_mes + INTERVAL '1 month' 
		AND cpee.nombre = nombre_espacio_especial_mostrar;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_cartelera_espacios_especiales_espacio_mes('2024-04-19','Adrenalina al máximo');

-- Sp para mostrar la ficha bibliográfica de un artista
CREATE OR REPLACE FUNCTION obtener_ficha_bibliografica_artista(id_artista_mostrar int) 
RETURNS TABLE (
    nombres varchar(50),
    apellidos varchar(50),
    nombre_nacionalidad varchar(150),
    pais varchar(100),
    nombre_profesion varchar(15),
    manager varchar(50),
    biografia varchar(500),
    fan_site_url varchar(150),
    personal_site_url varchar(150),
    fecha_nacimiento date,
    director_en varchar(100),
    guionista_en varchar(100)
) AS $$
DECLARE
    id_director int;
    id_guionista int;
BEGIN
    SELECT id_tipo_cargo INTO id_director 
	FROM elenco.tipo_cargo 
	WHERE nombre_tipo_cargo = 'Director';
	
    SELECT id_tipo_cargo INTO id_guionista 
	FROM elenco.tipo_cargo 
	WHERE nombre_tipo_cargo = 'Guionista';

    RETURN QUERY 
    SELECT 
        ea.nombres,
        ea.apellidos,
        en.nombre_nacionalidad,
        en.pais,
        ep.nombre_profesion,
        ea.manager,
        ea.biografia,
        es.fan_site_url,
        es.personal_site_url,
        ea.fecha_nacimiento,
        cpp.nombre_pelicula AS director_en,
        cpp.nombre_pelicula AS guionista_en
    FROM 
        elenco.artista ea JOIN elenco.nacionalidad en ON ea.id_nacionalidad = en.id_nacionalidad
			JOIN elenco.profesion ep 
			ON ea.id_profesion = ep.id_profesion
			LEFT JOIN elenco.sitie es 
			ON ea.id_artista = es.id_artista
			JOIN elenco.pelicula_artista_cargo epac 
			ON ea.id_artista = epac.id_artista
			RIGHT JOIN catalogo_programacion.pelicula cpp 
			ON epac.id_pelicula = cpp.id_pelicula
    WHERE 
        ea.id_artista = id_artista_mostrar AND (epac.id_tipo_cargo = id_director OR epac.id_tipo_cargo = id_guionista);
END;
$$ LANGUAGE plpgsql;

SELECT obtener_ficha_bibliografica_artista(1);

-- Sp para mostrar los artistas de una determinada nacionalidad
CREATE OR REPLACE FUNCTION obtener_artistas_nacionalidad(nombre_nacionalidad_artista varchar(150)) 
RETURNS TABLE (
    nombres varchar(50),
    apellidos varchar(50),
    nombre_nacionalidad varchar(150),
    pais varchar(100),
    nombre_profesion varchar(15),
    manager varchar(50),
    biografia varchar(500),
    fan_site_url varchar(150),
    personal_site_url varchar(150),
    fecha_nacimiento date
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        ea.nombres,
        ea.apellidos,
        en.nombre_nacionalidad,
        en.pais,
        ep.nombre_profesion,
        ea.manager,
        ea.biografia,
        es.fan_site_url,
        es.personal_site_url,
        ea.fecha_nacimiento
    FROM 
        elenco.artista ea JOIN elenco.nacionalidad en 
			ON ea.id_nacionalidad = en.id_nacionalidad
			JOIN elenco.profesion ep 
			ON ea.id_profesion = ep.id_profesion
			LEFT JOIN elenco.sitie es 
			ON ea.id_artista = es.id_artista
    WHERE 
        en.nombre_nacionalidad = nombre_nacionalidad_artista;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_artistas_nacionalidad('Albanesa');

-- Sp que muestre la lista de las películas que ha sido actor el artista
CREATE OR REPLACE FUNCTION obtener_peliculas_artista(id_artista_mostrar int) 
RETURNS TABLE (
    nombre_pelicula varchar(100),
    nombre_genero varchar(50),
    nombre_clasificacion varchar(50),
    anio_relace date,
    duracion time,
    descripcion_pelicula varchar(300),
    nombre_personaje varchar(100),
    personaje_principal boolean
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        cpp.nombre_pelicula,
        cpg.nombre_genero,
        cpc.nombre_clasificacion,
        cpp.anio_relace,
        cpp.duracion,
        cpp.descripcion_pelicula,
        ep.nombre_personaje,
        ep.personaje_principal
    FROM 
        elenco.personaje ep JOIN catalogo_programacion.pelicula cpp 
			ON ep.id_pelicula = cpp.id_pelicula
			LEFT JOIN catalogo_programacion.genero cpg
			ON cpp.id_genero = cpg.id_genero
			LEFT JOIN catalogo_programacion.clasificacion cpc 
			ON cpp.id_clasificacion = cpc.id_clasificacion
    WHERE 
        ep.id_artista = id_artista_mostrar;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_peliculas_artista(2);

-- Sp para mostrar la ficha de la película
CREATE OR REPLACE FUNCTION obtener_ficha_pelicula(id_pelicula_mostrar int) 
RETURNS TABLE (
    nombre_pelicula varchar(100),
    nombre_genero varchar(50),
    nombre_clasificacion varchar(50),
    anio_relace date,
    duracion time,
    descripcion_pelicula varchar(300),
    nombres_directores text,
    nombres_guionistas text
) AS $$
DECLARE
    id_director int;
    id_guionista int;
BEGIN
    SELECT id_tipo_cargo INTO id_director 
	FROM elenco.tipo_cargo 
	WHERE nombre_tipo_cargo = 'Director';
	
    SELECT id_tipo_cargo INTO id_guionista 
	FROM elenco.tipo_cargo
	WHERE nombre_tipo_cargo = 'Guionista';

    RETURN QUERY 
    SELECT 
		cpp.nombre_pelicula,
		cpg.nombre_genero,
		cpc.nombre_clasificacion,
		cpp.anio_relace,
		cpp.duracion,
		cpp.descripcion_pelicula,
		(
			SELECT STRING_AGG(CONCAT(ea_director.nombres, ' ', ea_director.apellidos), ', ')
			FROM elenco.artista ea_director 
			INNER JOIN elenco.pelicula_artista_cargo epac_director ON ea_director.id_artista = epac_director.id_artista 
			WHERE epac_director.id_pelicula = cpp.id_pelicula AND epac_director.id_tipo_cargo = id_director
		) AS nombres_directores,
		(
			SELECT STRING_AGG(CONCAT(ea_guionista.nombres, ' ', ea_guionista.apellidos), ', ')  
			FROM elenco.artista ea_guionista 
			INNER JOIN elenco.pelicula_artista_cargo epac_guionista ON ea_guionista.id_artista = epac_guionista.id_artista 
			WHERE epac_guionista.id_pelicula = cpp.id_pelicula AND epac_guionista.id_tipo_cargo = id_guionista
		) AS nombres_guionistas
	FROM 
		catalogo_programacion.pelicula cpp LEFT JOIN catalogo_programacion.genero cpg 
			ON cpp.id_genero = cpg.id_genero
			LEFT JOIN catalogo_programacion.clasificacion cpc ON cpp.id_clasificacion = cpc.id_clasificacion
	WHERE 
		cpp.id_pelicula = id_pelicula_mostrar;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_ficha_pelicula(6);

-- Sp para listar las películas por genero
CREATE OR REPLACE FUNCTION obtener_peliculas_genero(nombre_genero_moatrar varchar(50))
RETURNS TABLE (
    nombre_pelicula varchar(100),
    nombre_genero varchar(50),
    nombre_clasificacion varchar(50),
    anio_relace date,
    duracion time,
    descripcion_pelicula varchar(300),
    nombres_directores text,
    nombres_guionistas text
) AS $$
DECLARE
    id_director int;
    id_guionista int;
BEGIN
    SELECT id_tipo_cargo INTO id_director 
	FROM elenco.tipo_cargo 
	WHERE nombre_tipo_cargo = 'Director';
	
    SELECT id_tipo_cargo INTO id_guionista 
	FROM elenco.tipo_cargo
	WHERE nombre_tipo_cargo = 'Guionista';

    RETURN QUERY 
    SELECT 
        cpp.nombre_pelicula,
        cpg.nombre_genero,
        cpc.nombre_clasificacion,
        cpp.anio_relace,
        cpp.duracion,
        cpp.descripcion_pelicula,
        (
            SELECT STRING_AGG(CONCAT(ea_director.nombres, ' ', ea_director.apellidos), ', ')
            FROM elenco.artista ea_director 
            INNER JOIN elenco.pelicula_artista_cargo epac_director ON ea_director.id_artista = epac_director.id_artista 
            WHERE epac_director.id_pelicula = cpp.id_pelicula AND epac_director.id_tipo_cargo = id_director
        ) AS nombres_directores,
        (
            SELECT STRING_AGG(CONCAT(ea_guionista.nombres, ' ', ea_guionista.apellidos), ', ')  
            FROM elenco.artista ea_guionista 
            INNER JOIN elenco.pelicula_artista_cargo epac_guionista ON ea_guionista.id_artista = epac_guionista.id_artista 
            WHERE epac_guionista.id_pelicula = cpp.id_pelicula AND epac_guionista.id_tipo_cargo = id_guionista
        ) AS nombres_guionistas
    FROM 
        catalogo_programacion.pelicula cpp LEFT JOIN catalogo_programacion.genero cpg 
			ON cpp.id_genero = cpg.id_genero
			LEFT JOIN catalogo_programacion.clasificacion cpc 
			ON cpp.id_clasificacion = cpc.id_clasificacion
    WHERE 
        cpg.nombre_genero = nombre_genero_moatrar;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_peliculas_genero('Comedia');

-- Sp para listar las películas por clasificación
CREATE OR REPLACE FUNCTION obtener_peliculas_clasificacion(nombre_clasificacion_mostrar varchar(50)) 
RETURNS TABLE (
    nombre_pelicula varchar(100),
    nombre_genero varchar(50),
    nombre_clasificacion varchar(50),
    anio_relace date,
    duracion time,
    descripcion_pelicula varchar(300),
    nombres_directores text,
    nombres_guionistas text
) AS $$
DECLARE
    id_director int;
    id_guionista int;
BEGIN
    SELECT id_tipo_cargo INTO id_director
	FROM elenco.tipo_cargo 
	WHERE nombre_tipo_cargo = 'Director';
	
    SELECT id_tipo_cargo INTO id_guionista 
	FROM elenco.tipo_cargo
	WHERE nombre_tipo_cargo = 'Guionista';

    RETURN QUERY 
    SELECT 
        cpp.nombre_pelicula,
        cpg.nombre_genero,
        cpc.nombre_clasificacion,
        cpp.anio_relace,
        cpp.duracion,
        cpp.descripcion_pelicula,
        (
            SELECT STRING_AGG(CONCAT(ea_director.nombres, ' ', ea_director.apellidos), ', ')
            FROM elenco.artista ea_director 
            INNER JOIN elenco.pelicula_artista_cargo epac_director ON ea_director.id_artista = epac_director.id_artista 
            WHERE epac_director.id_pelicula = cpp.id_pelicula AND epac_director.id_tipo_cargo = 1
        ) AS nombres_directores,
        (
            SELECT STRING_AGG(CONCAT(ea_guionista.nombres, ' ', ea_guionista.apellidos), ', ')  
            FROM elenco.artista ea_guionista 
            INNER JOIN elenco.pelicula_artista_cargo epac_guionista ON ea_guionista.id_artista = epac_guionista.id_artista 
            WHERE epac_guionista.id_pelicula = cpp.id_pelicula AND epac_guionista.id_tipo_cargo = 1
        ) AS nombres_guionistas
    FROM 
        catalogo_programacion.pelicula cpp LEFT JOIN catalogo_programacion.genero cpg 
			ON cpp.id_genero = cpg.id_genero
			LEFT JOIN catalogo_programacion.clasificacion cpc 
			ON cpp.id_clasificacion = cpc.id_clasificacion
    WHERE 
        cpc.nombre_clasificacion = nombre_clasificacion_mostrar;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_peliculas_clasificacion('R');

-- Sp para mostrar la cantidad de películas por genero
CREATE OR REPLACE FUNCTION obtener_cantidad_peliculas_gener() 
RETURNS TABLE (
    nombre_genero varchar(50),
    cantidad_peliculas bigint
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        cpg.nombre_genero,
        COUNT(cpp.id_pelicula) AS cantidad_peliculas
    FROM 
        catalogo_programacion.pelicula cpp JOIN catalogo_programacion.genero cpg 
		ON cpp.id_genero = cpg.id_genero
    GROUP BY 
        cpg.nombre_genero;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_cantidad_peliculas_gener();

-- Sp para mostrar la cantidad de películas por clasificación
CREATE OR REPLACE FUNCTION obtener_cantidad_peliculas_clasificacion() 
RETURNS TABLE (
    nombre_clasificacion varchar(50),
    cantidad_peliculas bigint
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        cpc.nombre_clasificacion,
        COUNT(cpp.id_pelicula) AS cantidad_peliculas
    FROM 
        catalogo_programacion.pelicula cpp JOIN catalogo_programacion.clasificacion cpc 
		ON cpp.id_clasificacion = cpc.id_clasificacion
    GROUP BY 
        cpc.nombre_clasificacion;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_cantidad_peliculas_clasificacion();

-- Sp para mostrar la cantidad de películas por artista
CREATE OR REPLACE FUNCTION obtener_cantidad_peliculas_artista() 
RETURNS TABLE (
    nombres varchar(50),
    apellidos varchar(50),
    cantidad_peliculas bigint
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        ea.nombres,
        ea.apellidos,
        COUNT(epac.id_pelicula) AS cantidad_peliculas
    FROM 
        elenco.pelicula_artista_cargo epac RIGHT JOIN elenco.artista ea 
		ON epac.id_artista = ea.id_artista
    GROUP BY 
        ea.nombres, ea.apellidos;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_cantidad_peliculas_artista(); 

-- Sp para mostrar la cantidad de películas por espacio especial
CREATE OR REPLACE FUNCTION obtener_cantidad_peliculas_espacio_especia() 
RETURNS TABLE (
    nombre_espacio_especial varchar(100),
    cantidad_peliculas bigint
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        cpee.nombre,
        COUNT(cpep.id_pelicula) AS cantidad_peliculas
    FROM 
        catalogo_programacion.espacio_especial cpee JOIN catalogo_programacion.espacio_especial_pelicula cpep 
		ON cpee.id_espacio_especial = cpep.id_espacio_especial
    GROUP BY 
        cpee.nombre;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_cantidad_peliculas_espacio_especia() ;

-- Sp para mostrar la cantidad de películas por casa productora
CREATE OR REPLACE FUNCTION obtener_cantidad_peliculas_casa_productor() 
RETURNS TABLE (
    nombre_compania_productora varchar(100),
    cantidad_peliculas bigint
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        ccp.nombre_compania_productora,
        COUNT(cpp.id_pelicula) AS cantidad_peliculas
    FROM 
        catalogo_programacion.pelicula cpp LEFT JOIN catalogo_programacion.pelicula_compania_productora cppcp
			ON cpp.id_pelicula = cppcp.id_pelicula 
			LEFT JOIN catalogo_programacion.compania_productora ccp 
			ON cppcp.id_compania_productora = ccp.id_compania_productora
    GROUP BY 
        ccp.nombre_compania_productora;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_cantidad_peliculas_casa_productor();

-- Sp para mostrar los datos de las películas en un rango de duración
CREATE OR REPLACE FUNCTION obtener_peliculas_rango_duracion(duracion_min time, duracion_max time) 
RETURNS TABLE (
    nombre_pelicula varchar(100),
    nombre_genero varchar(50),
    nombre_clasificacion varchar(50),
    anio_relace date,
    duracion time,
    descripcion_pelicula varchar(300)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        cpp.nombre_pelicula,
        cpg.nombre_genero,
        cpc.nombre_clasificacion,
        cpp.anio_relace,
        cpp.duracion,
        cpp.descripcion_pelicula
    FROM 
        catalogo_programacion.pelicula cpp LEFT JOIN catalogo_programacion.genero cpg 
			ON cpp.id_genero = cpg.id_genero
			LEFT JOIN catalogo_programacion.clasificacion cpc
			ON cpp.id_clasificacion = cpc.id_clasificacion
    WHERE 
        cpp.duracion >= duracion_min AND cpp.duracion <= duracion_max;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_peliculas_rango_duracion('02:19:00','03:15:00');

-- Sp para obtener la clasificación con más películas, moda, bimodal y hasta 3 modas
CREATE OR REPLACE FUNCTION obtener_clasificacion_moda(cantidad_modas int) 
RETURNS TABLE (
    nombre_clasificacion varchar(50),
    cantidad_peliculas bigint
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        cpc.nombre_clasificacion,
        COUNT(cpp.id_pelicula) AS cantidad_peliculas
    FROM 
        catalogo_programacion.pelicula cpp JOIN catalogo_programacion.clasificacion cpc 
			ON cpp.id_clasificacion = cpc.id_clasificacion
    GROUP BY 
        cpc.nombre_clasificacion
    ORDER BY 
        COUNT(cpp.id_pelicula) DESC
    LIMIT cantidad_modas;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_clasificacion_moda(2);

--Sp para mostrar los datos de un artista calculando la edad (crear una función) nombre del artista, fecha de nacimiento, edad.
CREATE OR REPLACE FUNCTION obtener_datos_artista(p_id_artista int) 
RETURNS TABLE (
    p_nombres varchar(50),
    p_apellidos varchar(50),
    p_fecha_nacimiento date,
    p_edad numeric
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        ea.nombres,
        ea.apellidos,
        ea.fecha_nacimiento,
        EXTRACT(YEAR FROM AGE(NOW(), ea.fecha_nacimiento)) AS edad
    FROM 
        elenco.artista ea
    WHERE 
        ea.id_artista = p_id_artista;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_datos_artista(2);