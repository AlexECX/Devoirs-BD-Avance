CREATE OR REPLACE TRIGGER main.BIUetat_pret
	AFTER UPDATE OF etat_pret ON main.pret_courant
    FOR EACH ROW
	BEGIN
		IF (:new.etat_pret == 'retourne') THEN	
            main.film.inventaire = main.film.inventaire + 1;            
        END IF;
		IF(:new.etat_pret == 'prete') THEN
			main.film.inventaire = main.film.inventaire - 1;
		END IF;
	END;