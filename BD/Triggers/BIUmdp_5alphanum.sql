CREATE OR REPLACE TRIGGER main.BIUmdp_5alphanum
	BEFORE INSERT OR UPDATE OF mot_de_passe ON main.profile
    FOR EACH ROW
	BEGIN
		IF NOT (LENGTH(:new.mot_de_passe) >= 5 AND main.is_alphanum(:new.mot_de_passe) = 'TRUE') THEN	
            RAISE_APPLICATION_ERROR( 
                -20002, 
                'Password must be 5 alphanumerical characters' 
                );            
        END IF;
	END;