DROP SEQUENCE main.adresse_seq;
CREATE SEQUENCE main.adresse_seq START WITH 1;

CREATE OR REPLACE TRIGGER main.AUTO_adresse
BEFORE INSERT ON main.adresse 
FOR EACH ROW

BEGIN
  SELECT main.adresse_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;

/
DROP SEQUENCE main.profile_seq;
CREATE SEQUENCE main.profile_seq START WITH 1;

CREATE OR REPLACE TRIGGER main.AUTO_profile
BEFORE INSERT ON main.profile 
FOR EACH ROW

BEGIN
  SELECT main.profile_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;

/
DROP SEQUENCE main.pret_courant_seq;
CREATE SEQUENCE main.pret_courant_seq START WITH 1;

CREATE OR REPLACE TRIGGER main.AUTO_pret_courant
BEFORE INSERT ON main.pret_courant 
FOR EACH ROW

BEGIN
  SELECT main.pret_courant_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;

/
DROP SEQUENCE main.film_seq;
CREATE SEQUENCE main.film_seq START WITH 1;

CREATE OR REPLACE TRIGGER main.AUTO_film
BEFORE INSERT ON main.film 
FOR EACH ROW

BEGIN
  SELECT main.film_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;

/
DROP SEQUENCE main.personnel_film_seq;
CREATE SEQUENCE main.personnel_film_seq START WITH 1;

CREATE OR REPLACE TRIGGER main.AUTO_personnel_film
BEFORE INSERT ON main.personnel_film 
FOR EACH ROW

BEGIN
  SELECT main.personnel_film_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;

/