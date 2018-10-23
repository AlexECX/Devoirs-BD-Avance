
CREATE OR REPLACE TRIGGER main.BIUprofil_is_adult
    BEFORE INSERT OR UPDATE ON main.profile
    FOR EACH ROW
BEGIN
    IF(CURRENT_DATE - :new.date_naissance < 18*365) THEN 
        RAISE_APPLICATION_ERROR( 
        -20001, 
        'Member must be of age 18+' 
        );
  END IF;
END;