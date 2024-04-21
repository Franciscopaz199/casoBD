
-- para validar que no se ingrese un manager si el nuevo artista no es un actor o director
CREATE OR REPLACE FUNCTION validar_manager()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id_profesion IN (SELECT id_profesion FROM elenco.profesion WHERE nombre_profesion IN ('actor', 'director')) THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'El artista solo puede tener un manager si es actor o director';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validar_manager_before_insert
BEFORE INSERT ON elenco.artista
FOR EACH ROW
EXECUTE FUNCTION validar_manager();


-- ara validar que no se agrege un registro en sitie a un artista que no sea actor
CREATE OR REPLACE FUNCTION validar_sitie()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM elenco.artista
        WHERE id_artista = NEW.id_artista
          AND id_profesion = (SELECT id_profesion FROM elenco.profesion WHERE nombre_profesion = 'actor')
    ) THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Solo se pueden crear registros en sitie para artistas cuya profesión sea actor';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validar_sitie_before_insert
BEFORE INSERT ON elenco.sitie
FOR EACH ROW
EXECUTE FUNCTION validar_sitie();


