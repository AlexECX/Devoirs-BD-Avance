CREATE OR REPLACE TRIGGER main.AUTO_adresse
BEFORE INSERT ON main.adresse 
FOR EACH ROW

BEGIN
  SELECT main.adresse_seq.NEXTVAL
  INTO   :new.ID_adresse
  FROM   dual;
END;