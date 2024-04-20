-- Realizar los siguientes Sp(Como funciones de PostgreSQL) teniendo en cuenta su descripcion

-- Sp para mostrar la cartelera de peliculas
CREATE OR REPLACE FUNCTION obtener_cartelera() RETURNS TABLE (
    fecha_programacion DATE,
    hora_programacion TIME,
    nombre_pelicula VARCHAR(100),
    nombre_genero VARCHAR(50),
    nombre_clasificacion VARCHAR(50),
    anio_relace DATE,
    duracion TIME,
    descripcion_pelicula VARCHAR,(300)
    nombres_director VARCHAR(100)
) AS $$
DECLARE
    id_director INT;
BEGIN
    SELECT id_tipo_cargo INTO id_director FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Director';

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
        catalogo_programacion.pelicula cpp 
    JOIN
        catalogo_programacion.programacion cp ON cpp.id_pelicula = cp.id_pelicula
    LEFT JOIN  
        catalogo_programacion.genero cpg ON cpp.id_genero = cpg.id_genero
    LEFT JOIN 
        catalogo_programacion.clasificacion cpc ON cpp.id_clasificacion = cpc.id_clasificacion
    LEFT JOIN 
        elenco.pelicula_artista_cargo epac ON cpp.id_pelicula = epac.id_pelicula
    LEFT JOIN 
        elenco.artista ea ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director;
END;
$$ LANGUAGE plpgsql;


-- Sp para mostrar la cartelera, pero para una fecha determinada
CREATE OR REPLACE FUNCTION obtener_cartelera_fecha(fecha_programacion DATE) RETURNS TABLE (
    fecha_programacion DATE,
    hora_programacion TIME,
    nombre_pelicula VARCHAR(100),
    nombre_genero VARCHAR(50),
    nombre_clasificacion VARCHAR(50),
    anio_relace DATE,
    duracion TIME,
    descripcion_pelicula VARCHAR(300),
    nombres_director VARCHAR(100)
) AS $$
DECLARE
    id_director INT;
BEGIN
    SELECT id_tipo_cargo INTO id_director FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Director';

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
        catalogo_programacion.pelicula cpp 
    JOIN
        catalogo_programacion.programacion cp ON cpp.id_pelicula = cp.id_pelicula
    LEFT JOIN  
        catalogo_programacion.genero cpg ON cpp.id_genero = cpg.id_genero
    LEFT JOIN 
        catalogo_programacion.clasificacion cpc ON cpp.id_clasificacion = cpc.id_clasificacion
    LEFT JOIN 
        elenco.pelicula_artista_cargo epac ON cpp.id_pelicula = epac.id_pelicula
    LEFT JOIN 
        elenco.artista ea ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director AND cp.fecha = fecha_programacion;
END;
$$ LANGUAGE plpgsql;
	
-- Sp para mostrar la cartelera por genero por un determinado mes
CREATE OR REPLACE FUNCTION obtener_cartelera_mes(fecha_programacion DATE, nombre_genero VARCHAR(50)) RETURNS TABLE (
    fecha_programacion DATE,
    hora_programacion TIME,
    nombre_pelicula VARCHAR(100),
    nombre_genero VARCHAR(50),
    nombre_clasificacion VARCHAR(50),
    anio_relace DATE,
    duracion TIME,
    descripcion_pelicula VARCHAR(300),
    nombres_director VARCHAR(100)
) AS $$
DECLARE
    id_director INT;
BEGIN
    SELECT id_tipo_cargo INTO id_director FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Director';

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
        catalogo_programacion.pelicula cpp 
    JOIN
        catalogo_programacion.programacion cp ON cpp.id_pelicula = cp.id_pelicula
    LEFT JOIN  
        catalogo_programacion.genero cpg ON cpp.id_genero = cpg.id_genero
    LEFT JOIN 
        catalogo_programacion.clasificacion cpc ON cpp.id_clasificacion = cpc.id_clasificacion
    LEFT JOIN 
        elenco.pelicula_artista_cargo epac ON cpp.id_pelicula = epac.id_pelicula
    LEFT JOIN 
        elenco.artista ea ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director AND cp.fecha >= fecha_programacion AND cp.fecha < fecha_programacion + INTERVAL '1 month' AND cpg.nombre_genero = nombre_genero;
END;
$$ LANGUAGE plpgsql;

-- Sp para mostrar la cartelera por clasificación por un determinado mes
CREATE OR REPLACE FUNCTION obtener_cartelera_mes_clasificacion(fecha_programacion DATE, nombre_clasificacion VARCHAR(50)) RETURNS TABLE (
    fecha_programacion DATE,
    hora_programacion TIME,
    nombre_pelicula VARCHAR(100),
    nombre_genero VARCHAR(50),
    nombre_clasificacion VARCHAR(50),
    anio_relace DATE,
    duracion TIME,
    descripcion_pelicula VARCHAR(300),
    nombres_director VARCHAR(100)
) AS $$
DECLARE
    id_director INT;
BEGIN
    SELECT id_tipo_cargo INTO id_director FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Director';

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
        catalogo_programacion.pelicula cpp 
    JOIN
        catalogo_programacion.programacion cp ON cpp.id_pelicula = cp.id_pelicula
    LEFT JOIN  
        catalogo_programacion.genero cpg ON cpp.id_genero = cpg.id_genero
    LEFT JOIN 
        catalogo_programacion.clasificacion cpc ON cpp.id_clasificacion = cpc.id_clasificacion
    LEFT JOIN 
        elenco.pelicula_artista_cargo epac ON cpp.id_pelicula = epac.id_pelicula
    LEFT JOIN 
        elenco.artista ea ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director AND cp.fecha >= fecha_programacion AND cp.fecha < fecha_programacion + INTERVAL '1 month' AND cpc.nombre_clasificacion = nombre_clasificacion;
END;
$$ LANGUAGE plpgsql;

-- Sp para mostrar la cartelera por director
CREATE OR REPLACE FUNCTION obtener_cartelera_director(nombres_director VARCHAR(100)) RETURNS TABLE (
    fecha_programacion DATE,
    hora_programacion TIME,
    nombre_pelicula VARCHAR(100),
    nombre_genero VARCHAR(50),
    nombre_clasificacion VARCHAR(50),
    anio_relace DATE,
    duracion TIME,
    descripcion_pelicula VARCHAR(300),
    nombres_director VARCHAR(100)
) AS $$
DECLARE
    id_director INT;
BEGIN
    SELECT id_tipo_cargo INTO id_director FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Director';

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
        catalogo_programacion.pelicula cpp 
    JOIN
        catalogo_programacion.programacion cp ON cpp.id_pelicula = cp.id_pelicula
    LEFT JOIN  
        catalogo_programacion.genero cpg ON cpp.id_genero = cpg.id_genero
    LEFT JOIN 
        catalogo_programacion.clasificacion cpc ON cpp.id_clasificacion = cpc.id_clasificacion
    LEFT JOIN 
        elenco.pelicula_artista_cargo epac ON cpp.id_pelicula = epac.id_pelicula
    LEFT JOIN 
        elenco.artista ea ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director AND ea.nombres = nombres_director;
END;
$$ LANGUAGE plpgsql;

-- Sp para mostrar la cartelera de espacios especiales
CREATE OR REPLACE FUNCTION obtener_cartelera_espacios_especiales() RETURNS TABLE (
    fecha_espacio_especial_pelicula DATE,
    nombre_pelicula VARCHAR(100),
    nombres_director VARCHAR(100),
    descripcion_pelicula VARCHAR(300),
    nombre_espacio_especial VARCHAR(100)
) AS $$
DECLARE
    id_director INT;
BEGIN
    SELECT id_tipo_cargo INTO id_director FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Director';

    RETURN QUERY 
    SELECT 
        cpep.fecha AS fecha_espacio_especial_pelicula,
        cpp.nombre_pelicula, 
        ea.nombres AS nombres_director,
        cpp.descripcion_pelicula, 
        cpee.nombre_espacio_especial
    FROM 
        catalogo_programacion.espacio_especial cpee
    JOIN
        catalogo_programacion.espacio_especial_pelicula cpep ON cpee.id_espacio_especial = cpep.id_espacio_especial
    JOIN
        catalogo_programacion.pelicula cpp ON cpep.id_pelicula = cpp.id_pelicula
    LEFT JOIN 
        elenco.pelicula_artista_cargo epac ON cpp.id_pelicula = epac.id_pelicula
    LEFT JOIN 
        elenco.artista ea ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director;
END;
$$ LANGUAGE plpgsql;

-- Sp para mostrar la cartelera de espacios especiales por fecha
CREATE OR REPLACE FUNCTION obtener_cartelera_espacios_especiales_fecha(fecha_espacio_especial DATE) RETURNS TABLE (
    fecha_espacio_especial_pelicula DATE,
    nombre_pelicula VARCHAR(100),
    nombres_director VARCHAR(100),
    descripcion_pelicula VARCHAR(300),
    nombre_espacio_especial VARCHAR(100)
) AS $$
DECLARE
    id_director INT;
BEGIN
    SELECT id_tipo_cargo INTO id_director FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Director';

    RETURN QUERY 
    SELECT 
        cpep.fecha AS fecha_espacio_especial_pelicula,
        cpp.nombre_pelicula, 
        ea.nombres AS nombres_director,
        cpp.descripcion_pelicula, 
        cpee.nombre_espacio_especial
    FROM 
        catalogo_programacion.espacio_especial cpee
    JOIN
        catalogo_programacion.espacio_especial_pelicula cpep ON cpee.id_espacio_especial = cpep.id_espacio_especial
    JOIN
        catalogo_programacion.pelicula cpp ON cpep.id_pelicula = cpp.id_pelicula
    LEFT JOIN 
        elenco.pelicula_artista_cargo epac ON cpp.id_pelicula = epac.id_pelicula
    LEFT JOIN 
        elenco.artista ea ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director AND cpep.fecha = fecha_espacio_especial;
END;
$$ LANGUAGE plpgsql;

-- Sp para mostrar la cartelera de espacios especiales por el espacio y mes
CREATE OR REPLACE FUNCTION obtener_cartelera_espacios_especiales_espacio_mes(fecha_mes DATE, nombre_espacio_especial_mostrar VARCHAR(100)) RETURNS TABLE (
    fecha_espacio_especial_pelicula DATE,
    nombre_pelicula VARCHAR(100),
    nombres_director VARCHAR(100),
    descripcion_pelicula VARCHAR(300),
    nombre_espacio_especial VARCHAR(100)
) AS $$
DECLARE
    id_director INT;
BEGIN
    SELECT id_tipo_cargo INTO id_director FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Director';

    RETURN QUERY 
    SELECT 
        cpep.fecha AS fecha_espacio_especial_pelicula,
        cpp.nombre_pelicula, 
        ea.nombres AS nombres_director,
        cpp.descripcion_pelicula, 
        cpee.nombre_espacio_especial
    FROM 
        catalogo_programacion.espacio_especial cpee
    JOIN
        catalogo_programacion.espacio_especial_pelicula cpep ON cpee.id_espacio_especial = cpep.id_espacio_especial
    JOIN
        catalogo_programacion.pelicula cpp ON cpep.id_pelicula = cpp.id_pelicula
    LEFT JOIN 
        elenco.pelicula_artista_cargo epac ON cpp.id_pelicula = epac.id_pelicula
    LEFT JOIN 
        elenco.artista ea ON epac.id_artista = ea.id_artista
    WHERE 
        epac.id_tipo_cargo = id_director AND cpep.fecha >= fecha_mes AND cpep.fecha < fecha_mes + INTERVAL '1 month' AND cpee.nombre_espacio_especial = nombre_espacio_especial_mostrar;
END;
$$ LANGUAGE plpgsql;

-- Sp para mostrar la ficha bibliográfica de un artista
CREATE OR REPLACE FUNCTION obtener_ficha_bibliografica_artista(id_artista_mostrar INT) RETURNS TABLE (
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    nombre_nacionalidad VARCHAR(150),
    pais VARCHAR(100),
    nombre_profesion VARCHAR(15),
    manager VARCHAR(50),
    biografia VARCHAR(500),
    fan_site_url VARCHAR(150),
    personal_site_url VARCHAR(150),
    fecha_nacimiento DATE,
    director_en VARCHAR(100),
    guionista_en VARCHAR(100),
) AS $$
DECLARE
    id_director INT;
    id_guionista INT;
BEGIN
    SELECT id_tipo_cargo INTO id_director FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Director';
    SELECT id_tipo_cargo INTO id_guionista FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Guionista';

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
        elenco.artista ea
    JOIN
        elenco.nacionalidad en ON ea.id_nacionalidad = en.id_nacionalidad
    JOIN
        elenco.profesion ep ON ea.id_profesion = ep.id_profesion
    LEFT JOIN 
        elenco.sitie es ON ea.id_artista = es.id_artista
    JOIN 
        elenco.pelicula_artista_cargo epac ON ea.id_artista = epac.id_artista
    RIGHT JOIN 
        catalogo_programacion.pelicula cpp ON epac.id_pelicula = cpp.id_pelicula
    WHERE 
        ea.id_artista = id_artista_mostrar AND (epac.id_tipo_cargo = id_director OR epac.id_tipo_cargo = id_guionista);
END;
$$ LANGUAGE plpgsql;

-- Sp para mostrar los artistas de una determinada nacionalidad
CREATE OR REPLACE FUNCTION obtener_artistas_nacionalidad(nombre_nacionalidad_artista VARCHAR(150)) RETURNS TABLE (
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    nombre_nacionalidad VARCHAR(150),
    pais VARCHAR(100),
    nombre_profesion VARCHAR(15),
    manager VARCHAR(50),
    biografia VARCHAR(500),
    fan_site_url VARCHAR(150),
    personal_site_url VARCHAR(150),
    fecha_nacimiento DATE
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
        elenco.artista ea
    JOIN
        elenco.nacionalidad en ON ea.id_nacionalidad = en.id_nacionalidad
    JOIN
        elenco.profesion ep ON ea.id_profesion = ep.id_profesion
    LEFT JOIN 
        elenco.sitie es ON ea.id_artista = es.id_artista
    WHERE 
        en.nombre_nacionalidad = nombre_nacionalidad_artista;
END;

-- Sp que muestre la lista de las películas que ha sido actor el artista
CREATE OR REPLACE FUNCTION obtener_peliculas_artista(id_artista_mostrar INT) RETURNS TABLE (
    nombre_pelicula VARCHAR(100),
    nombre_genero VARCHAR(50),
    nombre_clasificacion VARCHAR(50),
    anio_relace DATE,
    duracion TIME,
    descripcion_pelicula VARCHAR(300),
    nombre_personaje VARCHAR(100),
    personaje_principal BOOLEAN
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
        elenco.personaje ep
    JOIN
        catalogo_programacion.pelicula cpp ON ep.id_pelicula = cpp.id_pelicula
    LEFT JOIN 
        catalogo_programacion.genero cpg ON cpp.id_genero = cpg.id_genero
    LEFT JOIN 
        catalogo_programacion.clasificacion cpc ON cpp.id_clasificacion = cpc.id_clasificacion
    WHERE 
        ep.id_artista = id_artista_mostrar;
END;


-- Sp para mostrar la ficha de la película
CREATE OR REPLACE FUNCTION obtener_ficha_pelicula(id_pelicula_mostrar INT) RETURNS TABLE (
    nombre_pelicula VARCHAR(100),
    nombre_genero VARCHAR(50),
    nombre_clasificacion VARCHAR(50),
    anio_relace DATE,
    duracion TIME,
    descripcion_pelicula VARCHAR(300),
    nombres_directores TEXT,
    nombres_guionistas TEXT
) AS $$
DECLARE
    id_director INT;
    id_guionista INT;
BEGIN
    SELECT id_tipo_cargo INTO id_director FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Director';
    SELECT id_tipo_cargo INTO id_guionista FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Guionista';

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
		catalogo_programacion.pelicula cpp
	LEFT JOIN 
		catalogo_programacion.genero cpg ON cpp.id_genero = cpg.id_genero
	LEFT JOIN 
		catalogo_programacion.clasificacion cpc ON cpp.id_clasificacion = cpc.id_clasificacion
	WHERE 
		cpp.id_pelicula = id_pelicula_mostrar;
END;
$$ LANGUAGE plpgsql;

-- Sp para listar las películas por genero
CREATE OR REPLACE FUNCTION obtener_peliculas_genero(nombre_genero_moatrar VARCHAR(50)) RETURNS TABLE (
    nombre_pelicula VARCHAR(100),
    nombre_genero VARCHAR(50),
    nombre_clasificacion VARCHAR(50),
    anio_relace DATE,
    duracion TIME,
    descripcion_pelicula VARCHAR(300),
    nombres_directores TEXT,
    nombres_guionistas TEXT
) AS $$
DECLARE
    id_director INT;
    id_guionista INT;
BEGIN
    SELECT id_tipo_cargo INTO id_director FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Director';
    SELECT id_tipo_cargo INTO id_guionista FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Guionista';

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
        catalogo_programacion.pelicula cpp
    LEFT JOIN 
        catalogo_programacion.genero cpg ON cpp.id_genero = cpg.id_genero
    LEFT JOIN 
        catalogo_programacion.clasificacion cpc ON cpp.id_clasificacion = cpc.id_clasificacion
    WHERE 
        cpg.nombre_genero = nombre_genero_moatrar;
END;
$$ LANGUAGE plpgsql;

-- Sp para listar las películas por clasificación
CREATE OR REPLACE FUNCTION obtener_peliculas_clasificacion(nombre_clasificacion_mostrar VARCHAR(50)) RETURNS TABLE (
    nombre_pelicula VARCHAR(100),
    nombre_genero VARCHAR(50),
    nombre_clasificacion VARCHAR(50),
    anio_relace DATE,
    duracion TIME,
    descripcion_pelicula VARCHAR(300),
    nombres_directores TEXT,
    nombres_guionistas TEXT
) AS $$
DECLARE
    id_director INT;
    id_guionista INT;
BEGIN
    SELECT id_tipo_cargo INTO id_director FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Director';
    SELECT id_tipo_cargo INTO id_guionista FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Guionista';

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
        catalogo_programacion.pelicula cpp
    LEFT JOIN 
        catalogo_programacion.genero cpg ON cpp.id_genero = cpg.id_genero
    LEFT JOIN 
        catalogo_programacion.clasificacion cpc ON cpp.id_clasificacion = cpc.id_clasificacion
    WHERE 
        cpc.nombre_clasificacion = nombre_clasificacion_mostrar;
END;
$$ LANGUAGE plpgsql;

-- Sp para mostrar la cantidad de películas por genero
CREATE OR REPLACE FUNCTION obtener_cantidad_peliculas_genero() RETURNS TABLE (
    nombre_genero VARCHAR(50),
    cantidad_peliculas INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        cpg.nombre_genero,
        COUNT(cpp.id_pelicula) AS cantidad_peliculas
    FROM 
        catalogo_programacion.pelicula cpp
    JOIN 
        catalogo_programacion.genero cpg ON cpp.id_genero = cpg.id_genero
    GROUP BY 
        cpg.nombre_genero;
END;
$$ LANGUAGE plpgsql;

-- Sp para mostrar la cantidad de películas por clasificación
CREATE OR REPLACE FUNCTION obtener_cantidad_peliculas_clasificacion() RETURNS TABLE (
    nombre_clasificacion VARCHAR(50),
    cantidad_peliculas INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        cpc.nombre_clasificacion,
        COUNT(cpp.id_pelicula) AS cantidad_peliculas
    FROM 
        catalogo_programacion.pelicula cpp
    JOIN 
        catalogo_programacion.clasificacion cpc ON cpp.id_clasificacion = cpc.id_clasificacion
    GROUP BY 
        cpc.nombre_clasificacion;
END;
$$ LANGUAGE plpgsql;

-- Sp para mostrar la cantidad de películas por artista
CREATE OR REPLACE FUNCTION obtener_cantidad_peliculas_artista() RETURNS TABLE (
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    cantidad_peliculas INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        ea.nombres,
        ea.apellidos,
        COUNT(epac.id_pelicula) AS cantidad_peliculas
    FROM 
        elenco.pelicula_artista_cargo epac
    RIGHT JOIN 
        elenco.artista ea ON epac.id_artista = ea.id_artista
    GROUP BY 
        ea.nombres, ea.apellidos;
END;
$$ LANGUAGE plpgsql;

-- Sp para mostrar la cantidad de películas por espacio especial
CREATE OR REPLACE FUNCTION obtener_cantidad_peliculas_espacio_especial() RETURNS TABLE (
    nombre_espacio_especial VARCHAR(100),
    cantidad_peliculas INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        cpee.nombre_espacio_especial,
        COUNT(cpep.id_pelicula) AS cantidad_peliculas
    FROM 
        catalogo_programacion.espacio_especial cpee
    JOIN 
        catalogo_programacion.espacio_especial_pelicula cpep ON cpee.id_espacio_especial = cpep.id_espacio_especial
    GROUP BY 
        cpee.nombre_espacio_especial;
END;
$$ LANGUAGE plpgsql;

-- Sp para mostrar la cantidad de películas por casa productora
CREATE OR REPLACE FUNCTION obtener_cantidad_peliculas_casa_productora() RETURNS TABLE (
    nombre_compania_productora VARCHAR(100),
    cantidad_peliculas INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        ccp.nombre_compania_productora,
        COUNT(cpp.id_pelicula) AS cantidad_peliculas
    FROM 
        catalogo_programacion.pelicula cpp
    LEFT JOIN 
        catalogo_programacion.pelicula_compania_productora cppcp ON cpp.id_pelicula = cppcp.id_pelicula
    LEFT JOIN catalogo_programacion.compania_productora ccp ON cppcp.id_compania_productora = ccp.id_compania_productora
    GROUP BY 
        ccp.nombre_compania_productora;
END;
$$ LANGUAGE plpgsql;

-- Sp para mostrar los datos de las películas en un rango de duración
CREATE OR REPLACE FUNCTION obtener_peliculas_rango_duracion(duracion_min TIME, duracion_max TIME) RETURNS TABLE (
    nombre_pelicula VARCHAR(100),
    nombre_genero VARCHAR(50),
    nombre_clasificacion VARCHAR(50),
    anio_relace DATE,
    duracion TIME,
    descripcion_pelicula VARCHAR(300)
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
        catalogo_programacion.pelicula cpp
    LEFT JOIN 
        catalogo_programacion.genero cpg ON cpp.id_genero = cpg.id_genero
    LEFT JOIN 
        catalogo_programacion.clasificacion cpc ON cpp.id_clasificacion = cpc.id_clasificacion
    WHERE 
        cpp.duracion >= duracion_min AND cpp.duracion <= duracion_max;
END;
$$ LANGUAGE plpgsql;

-- Sp para obtener la clasificación con más películas, moda, bimodal y hasta 3 modas
CREATE OR REPLACE FUNCTION obtener_clasificacion_moda(cantidad_modas INT) RETURNS TABLE (
    nombre_clasificacion VARCHAR(50),
    cantidad_peliculas INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        cpc.nombre_clasificacion,
        COUNT(cpp.id_pelicula) AS cantidad_peliculas
    FROM 
        catalogo_programacion.pelicula cpp
    JOIN 
        catalogo_programacion.clasificacion cpc ON cpp.id_clasificacion = cpc.id_clasificacion
    GROUP BY 
        cpc.nombre_clasificacion
    ORDER BY 
        COUNT(cpp.id_pelicula) DESC
    LIMIT cantidad_modas;
END;
$$ LANGUAGE plpgsql;

--Sp para mostrar los datos de un artista calculando la edad (crear una función) nombre del artista, fecha de nacimiento, edad.
CREATE OR REPLACE FUNCTION obtener_datos_artista(id_artista_mostrar INT) RETURNS TABLE (
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    fecha_nacimiento DATE,
    edad INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        nombres,
        apellidos,
        fecha_nacimiento,
        EXTRACT(YEAR FROM AGE(NOW(), fecha_nacimiento)) AS edad
    FROM 
        elenco.artista
    WHERE 
        id_artista = id_artista_mostrar;
END;
$$ LANGUAGE plpgsql;


