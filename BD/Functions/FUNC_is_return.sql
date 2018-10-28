CREATE OR REPLACE FUNCTION main.is_return
RETURN INT IS
BEGIN
    SELECT pret_courant.etat_pret
    FROM pret_courant, film
    WHERE pret_courant.id = film.id;
    RETURN pret_courant.etat_pret;
END;