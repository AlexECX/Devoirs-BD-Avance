CREATE OR REPLACE FUNCTION main.is_return
RETURN INT IS
BEGIN
    SELECT pret_courant.etat_pret
    FROM pret_courant, film
    WHERE pret_courant.num_code = film.num_code;
    RETURN pret_courant.etat_pret;
END;