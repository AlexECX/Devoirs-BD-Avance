
-- Create the table in the specified schema
DROP SEQUENCE main.adresse_seq;
CREATE SEQUENCE main.adresse_seq START WITH 1;
CREATE TABLE main.adresse
(
    ID_adresse  INT NOT NULL PRIMARY KEY,
    num_civique     INT NOT NULL,
    rue         CHAR(30) NOT NULL,
    ville       CHAR(30) NOT NULL,
    province    CHAR(30) NOT NULL,
    code_postal CHAR(6) NOT NULL
);

-- Create the table in the specified schema
DROP SEQUENCE main.profile_seq;
CREATE SEQUENCE main.profile_seq START WITH 1;
CREATE TABLE main.profile
(
    profileId   INT NOT NULL PRIMARY KEY,
    courriel    VARCHAR(30) UNIQUE NOT NULL,
    prenom      CHAR(20) NOT NULL,
    nom         CHAR(20) NOT NULL,
    tel         VARCHAR(15) NOT NULL,
    date_naissance  DATE NOT NULL,
    mot_de_passe    VARCHAR(18) NOT NULL,
    ID_adresse INT REFERENCES main.adresse(ID_adresse)
);


-- Create the table in the specified schema
CREATE TABLE main.forfait
(
    nom     CHAR(20) NOT NULL PRIMARY KEY,
    cout    INT NOT NULL,
    location_max    INT NOT NULL,
    duree_max    INT NOT NULL
);


-- Create the table in the specified schema
CREATE TABLE main.abonnement
(
    forfait_nom CHAR(20) REFERENCES main.forfait(nom),
    profileId INT REFERENCES main.profile(profileId),
    PRIMARY KEY(forfait_nom, profileId)
);


-- Create the table in the specified schema
CREATE TABLE main.carte_credit
(
    credit_numero   CHAR(16) NOT NULL PRIMARY KEY,
    credit_type CHAR(25) NOT NULL,
    credit_expiration   DATE NOT NULL,
    credit_CVV INT NOT NULL,
    CHECK (LENGTH(credit_numero) = 16),
    CHECK (LENGTH(TRIM(TRANSLATE(credit_numero, ' +-.0123456789', ' '))) < 0),
    CHECK (LENGTH(credit_CVV) = 3)
);

-- Create the table in the specified schema
CREATE TABLE main.client
(
    profileId INT NOT NULL REFERENCES main.profile(profileId) PRIMARY KEY,
    credit_numero   CHAR(20) NOT NULL REFERENCES main.carte_credit(credit_numero)
);


-- Create the table in the specified schema
CREATE TABLE main.employe
(
    profileId INT NOT NULL REFERENCES main.profile(profileId) PRIMARY KEY,
    matricule   CHAR(8) UNIQUE NOT NULL,
    CHECK (LENGTH(matricule) = 8 AND LENGTH(TRIM(TRANSLATE(matricule, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+-.0123456789', ' '))) < 0)
);
