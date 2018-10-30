CREATE OR REPLACE TRIGGER main.BIUetat_pret
	BEFORE INSERT OR UPDATE OF etat_pret ON main.pret_courant
    FOR EACH ROW
	BEGIN
		IF (:new.etat_pret = 'retourne') THEN	
            UPDATE main.film 
            SET inventaire = inventaire + 1
            WHERE film.id = :new.film_id;      
        END IF;
		IF(:new.etat_pret = 'prete') THEN
			UPDATE main.film 
            SET inventaire = inventaire - 1
            WHERE film.id = :new.film_id;      
		END IF;
        EXCEPTION
            WHEN OTHERS THEN 
                RAISE_APPLICATION_ERROR( 
                    -20002, 
                    'Check violation' || SQLERRM
                    ); 
	END;