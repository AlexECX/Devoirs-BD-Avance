CREATE OR REPLACE TRIGGER main.AUTO_profile
BEFORE INSERT ON main.profile 
FOR EACH ROW

BEGIN
  SELECT main.profile_seq.NEXTVAL
  INTO   :new.profileId
  FROM   dual;
END;