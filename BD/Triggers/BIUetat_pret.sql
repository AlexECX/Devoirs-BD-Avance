CREATE OR REPLACE TRIGGER main.BIUetat_pret
	BEFORE INSERT OR UPDATE OF etat_pret ON main.pret_courant
    FOR EACH ROW
    DECLARE
        count_of    INT;
	BEGIN
		IF(:new.etat_pret = 'prete') THEN
			SELECT COUNT(main.pret_courant.id)
            INTO count_of
            FROM main.pret_courant
            WHERE pret_courant.film_id = :new.film_id AND pret_courant.etat_pret = 'prete';
            IF(count_of > 0) THEN
                RAISE_APPLICATION_ERROR( 
                    -20002, 
                    'Copie is already leased'
                    ); 
            END IF;
		END IF;
	END;