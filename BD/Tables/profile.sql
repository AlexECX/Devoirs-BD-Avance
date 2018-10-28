
-- Create the table in the specified schema
CREATE TABLE main.adresse
(
    id  INT NOT NULL PRIMARY KEY,
    num_civique     INT NOT NULL,
    rue         CHAR(30) NOT NULL,
    ville       CHAR(30) NOT NULL,
    province    CHAR(30) NOT NULL,
    code_postal CHAR(6) NOT NULL
);

-- Create the table in the specified schema
CREATE TABLE main.profile
(
    id   INT NOT NULL PRIMARY KEY,
    courriel    VARCHAR(30) UNIQUE NOT NULL,
    prenom      CHAR(20) NOT NULL,
    nom         CHAR(20) NOT NULL,
    tel         VARCHAR(15) NOT NULL,
    date_naissance  DATE NOT NULL,
    mot_de_passe    VARCHAR(18) NOT NULL,
    adresse_id INT REFERENCES main.adresse(id)
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
    profile_id INT REFERENCES main.profile(id),
    PRIMARY KEY(forfait_nom, profile_id)
);


-- Create the table in the specified schema
CREATE TABLE main.carte_credit
(
    numero   CHAR(16) NOT NULL PRIMARY KEY,
    type_carte CHAR(25) NOT NULL,
    expiration   DATE NOT NULL,
    CVV INT NOT NULL,
    CHECK (LENGTH(numero) = 16),
    CHECK (LENGTH(TRIM(TRANSLATE(numero, ' +-.0123456789', ' '))) < 0),
    CHECK (LENGTH(CVV) = 3)
);

-- Create the table in the specified schema
CREATE TABLE main.client
(
    id INT NOT NULL REFERENCES main.profile(id) PRIMARY KEY,
    carte_credit_numero   CHAR(20) NOT NULL REFERENCES main.carte_credit(numero)
);


-- Create the table in the specified schema
CREATE TABLE main.employe
(
    id INT NOT NULL REFERENCES main.profile(id) PRIMARY KEY,
    matricule   CHAR(8) UNIQUE NOT NULL,
    CHECK (LENGTH(matricule) = 8 AND LENGTH(TRIM(TRANSLATE(matricule, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+-.0123456789', ' '))) < 0)
);
