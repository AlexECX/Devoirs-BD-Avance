CREATE OR REPLACE TRIGGER main.BDclient
	BEFORE DELETE ON main.client
    FOR EACH ROW
	DECLARE
		pret INT;
	BEGIN
		SELECT COUNT(pret_courant.id) 
        INTO pret
		FROM pret_courant
		WHERE pret_courant.profile_id = :old.id AND pret_courant.etat_pret = 'prete';
		
		IF (pret > 0) THEN 
        RAISE_APPLICATION_ERROR( 
                    -20002, 
                    'Delete is not possible : client has 1 or more movies is in location' 
                    ); 
        END IF;
END;