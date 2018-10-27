CREATE OR REPLACE TRIGGER main.locationMax
BEFORE INSERT OR UPDATE ON main.pret_courant 
FOR EACH ROW
DECLARE
    count_of    INT;
    max_of      INT;
BEGIN
    
    SELECT COUNT(main.pret_courant.id_pret)
    INTO count_of
    FROM main.pret_courant, main.profile
    WHERE pret_courant.profileId = :new.profileId;

    SELECT location_max
    INTO max_of
    FROM forfait, (SELECT * 
                    FROM main.abonnement 
                    WHERE :new.profileId = main.abonnement.profileId)
    WHERE forfait.nom = forfait_nom;
    
    IF (count_of >= max_of) THEN	
        RAISE_APPLICATION_ERROR( 
            -20002, 
            'You have exceded your location limit' 
            );            
    END IF;
END;