
CREATE OR REPLACE TRIGGER main.BIUetat_pret
	AFTER UPDATE OF inventaire ON main.film
    FOR EACH ROW
	BEGIN
		IF NOT (main.is_return == 'retourne') THEN	
            inventaire = inventaire + 1;            
        END IF;
	END;