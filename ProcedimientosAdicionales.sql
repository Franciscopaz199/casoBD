CREATE OR REPLACE FUNCTION obtener_info_director() RETURNS TABLE (
    nombre_pelicula VARCHAR(100),
    nombre_genero VARCHAR(50),
    nombre_clasificacion VARCHAR(50),
    anio_relace DATE,
    duracion TIME,
    descripcion_pelicula VARCHAR,
    nombres_director VARCHAR(100)
) AS $$
DECLARE
    id_director INT;
BEGIN
    -- Almacenar el ID del tipo de cargo de director en la variable id_director
    SELECT id_tipo_cargo INTO id_director FROM elenco.tipo_cargo WHERE nombre_tipo_cargo = 'Director';

    -- Consulta principal utilizando la variable id_director
    RETURN QUERY 
    SELECT 
        cpp.nombre_pelicula, 
        cpg.nombre_genero, 
        cpc.nombre_clasificacion, 
        cpp.anio_relace, 
        cpp.duracion,
        cpp.descripcion_pelicula, 
        ea.nombres AS nombres_director
    FROM 
        catalogo_programacion.pelicula cpp 
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


SELECT * FROM obtener_info_director();



	