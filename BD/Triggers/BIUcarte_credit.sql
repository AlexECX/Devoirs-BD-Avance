CREATE OR REPLACE TRIGGER main.BIUcarte_credit
    BEFORE INSERT OR UPDATE ON main.carte_credit
    FOR EACH ROW
BEGIN
    IF(:new.expiration - CURRENT_DATE <= 0) THEN 
        RAISE_APPLICATION_ERROR( 
        -20001, 
        'Card is expired' 
        );
  END IF;
END;
/