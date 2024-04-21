
-- tabla para normalizar los tipos de cambios
CREATE TABLE tipo_cambio (
    id_tipo_cambio SERIAL PRIMARY KEY,
    nombre_tipo_cambio VARCHAR(10) UNIQUE
);
-- Insertar los tipos de cambio por defecto
INSERT INTO tipo_cambio (nombre_tipo_cambio) VALUES ('INSERT'), ('UPDATE'), ('DELETE');

------------------------------------------------------------------------------------------------------------------

-- auditoria a la tabla peliculas
CREATE TABLE auditoria_peliculas (
    id_registro SERIAL PRIMARY KEY,
    id_pelicula INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    FOREIGN KEY (id_tipo_cambio) REFERENCES tipo_cambio (id_tipo_cambio)
);

-- trigger asociado a su auditoria
CREATE OR REPLACE FUNCTION auditar_peliculas()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO auditoria_peliculas (id_pelicula, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_pelicula, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'INSERT'), to_jsonb(NEW));
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO auditoria_peliculas (id_pelicula, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_pelicula, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'UPDATE'), to_jsonb(OLD), to_jsonb(NEW));
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO auditoria_peliculas (id_pelicula, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_pelicula, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'DELETE'), to_jsonb(OLD));
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Asociar el disparador a la tabla de películas
CREATE TRIGGER peliculas_trigger AFTER INSERT OR UPDATE OR DELETE
ON catalogo_programacion.pelicula
FOR EACH ROW EXECUTE FUNCTION auditar_peliculas();

------------------------------------------------------------------------------------------------------------------

-- auditoria a la tabla artista
CREATE TABLE auditoria_artista (
    id_registro SERIAL PRIMARY KEY,
    id_artista INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    FOREIGN KEY (id_tipo_cambio) REFERENCES tipo_cambio (id_tipo_cambio)
);

-- trigger asociado a su auditoria
CREATE OR REPLACE FUNCTION auditar_artista()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO auditoria_artista (id_artista, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_artista, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'INSERT'), to_jsonb(NEW));
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO auditoria_artista (id_artista, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_artista, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'UPDATE'), to_jsonb(OLD), to_jsonb(NEW));
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO auditoria_artista (id_artista, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_artista, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'DELETE'), to_jsonb(OLD));
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Asociar el disparador a la tabla de artistas
CREATE TRIGGER artista_trigger AFTER INSERT OR UPDATE OR DELETE
ON elenco.artista
FOR EACH ROW EXECUTE FUNCTION auditar_artista();

------------------------------------------------------------------------------------------------------------------

-- auditoria a la tabla personaje
CREATE TABLE auditoria_personaje (
    id_registro SERIAL PRIMARY KEY,
    id_personaje INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    FOREIGN KEY (id_tipo_cambio) REFERENCES tipo_cambio (id_tipo_cambio)
);

-- trigger asociado a su auditoria
CREATE OR REPLACE FUNCTION auditar_personaje()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO auditoria_personaje (id_personaje, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_personaje, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'INSERT'), to_jsonb(NEW));
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO auditoria_personaje (id_personaje, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_personaje, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'UPDATE'), to_jsonb(OLD), to_jsonb(NEW));
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO auditoria_personaje (id_personaje, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_personaje, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'DELETE'), to_jsonb(OLD));
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Asociar el disparador a la tabla de personajes
CREATE TRIGGER personaje_trigger AFTER INSERT OR UPDATE OR DELETE
ON elenco.personaje
FOR EACH ROW EXECUTE FUNCTION auditar_personaje();

------------------------------------------------------------------------------------------------------------------

-- auditoria a la tabla programacion
CREATE TABLE auditoria_programacion (
    id_registro SERIAL PRIMARY KEY,
    id_programacion INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    FOREIGN KEY (id_tipo_cambio) REFERENCES tipo_cambio (id_tipo_cambio)
);

-- trigger asociado a su auditoria
CREATE OR REPLACE FUNCTION auditar_programacion()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO auditoria_programacion (id_programacion, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_programacion, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'INSERT'), to_jsonb(NEW));
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO auditoria_programacion (id_programacion, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_programacion, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'UPDATE'), to_jsonb(OLD), to_jsonb(NEW));
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO auditoria_programacion (id_programacion, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_programacion, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'DELETE'), to_jsonb(OLD));
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Asociar el disparador a la tabla de programacion
CREATE TRIGGER programacion_trigger AFTER INSERT OR UPDATE OR DELETE
ON catalogo_programacion.programacion
FOR EACH ROW EXECUTE FUNCTION auditar_programacion();

------------------------------------------------------------------------------------------------------------------

-- auditoria a la tabla espacio_especial
CREATE TABLE auditoria_espacio_especial (
    id_registro SERIAL PRIMARY KEY,
    id_espacio_especial INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    FOREIGN KEY (id_tipo_cambio) REFERENCES tipo_cambio (id_tipo_cambio)
);

-- trigger asociado a su auditoria
CREATE OR REPLACE FUNCTION auditar_espacio_especial()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO auditoria_espacio_especial (id_espacio_especial, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_espacio_especial, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'INSERT'), to_jsonb(NEW));
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO auditoria_espacio_especial (id_espacio_especial, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_espacio_especial, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'UPDATE'), to_jsonb(OLD), to_jsonb(NEW));
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO auditoria_espacio_especial (id_espacio_especial, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_espacio_especial, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'DELETE'), to_jsonb(OLD));
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Asociar el disparador a la tabla de espacio_especial
CREATE TRIGGER espacio_especial_trigger AFTER INSERT OR UPDATE OR DELETE
ON catalogo_programacion.espacio_especial
FOR EACH ROW EXECUTE FUNCTION auditar_espacio_especial();

------------------------------------------------------------------------------------------------------------------

-- auditoria a la tabla compania_productora
CREATE TABLE auditoria_compania_productora (
    id_registro SERIAL PRIMARY KEY,
    id_compania_productora INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    FOREIGN KEY (id_tipo_cambio) REFERENCES tipo_cambio (id_tipo_cambio)
);

-- trigger asociado a su auditoria
CREATE OR REPLACE FUNCTION auditar_compania_productora()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO auditoria_compania_productora (id_compania_productora, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_compania_productora, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'INSERT'), to_jsonb(NEW));
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO auditoria_compania_productora (id_compania_productora, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_compania_productora, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'UPDATE'), to_jsonb(OLD), to_jsonb(NEW));
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO auditoria_compania_productora (id_compania_productora, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_compania_productora, (SELECT id_tipo_cambio FROM tipo_cambio WHERE nombre_tipo_cambio = 'DELETE'), to_jsonb(OLD));
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Asociar el disparador a la tabla de compania_productora
CREATE TRIGGER compania_productora_trigger AFTER INSERT OR UPDATE OR DELETE
ON catalogo_programacion.compania_productora
FOR EACH ROW EXECUTE FUNCTION auditar_compania_productora();

