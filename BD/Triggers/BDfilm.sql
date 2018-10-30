CREATE OR REPLACE TRIGGER main.BDfilm
	BEFORE DELETE ON main.film
    FOR EACH ROW
	DECLARE
		pret INT;
	BEGIN
		SELECT COUNT(pret_courant.id) 
        INTO pret
		FROM pret_courant
		WHERE pret_courant.film_id = :old.id AND pret_courant.etat_pret = 'prete';
		
		IF (pret > 0) THEN 
        RAISE_APPLICATION_ERROR( 
                    -20002, 
                    'Delete is not possible : one copie is in location' 
                    ); 
        END IF;
END;