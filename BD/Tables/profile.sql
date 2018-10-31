
-- Create the table in the specified schema
CREATE TABLE main.adresse
(
    id  INT NOT NULL PRIMARY KEY,
    num_civique     INT NOT NULL,
    rue         CHAR(30) NOT NULL,
    ville       CHAR(30) NOT NULL,
    province    CHAR(30) NOT NULL,
    code_postal CHAR(6) NOT NULL,
    CHECK (LENGTH(code_postal) = 6)
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
CREATE TABLE main.profile
(
    id   INT NOT NULL PRIMARY KEY,
    courriel    VARCHAR(30) UNIQUE NOT NULL,
    prenom      CHAR(20) NOT NULL,
    nom         CHAR(20) NOT NULL,
    tel         VARCHAR(15) NOT NULL,
    date_naissance  DATE NOT NULL,
    mot_de_passe    VARCHAR(18) NOT NULL,
    CHECK (LENGTH(TRIM(TRANSLATE(tel, '0123456789', ' '))) < 0)

);


CREATE TABLE main.membre
(
    id INT NOT NULL PRIMARY KEY,
    FOREIGN KEY (id) REFERENCES main.profile(id) 
        ON DELETE CASCADE,
    adresse_id INT NOT NULL REFERENCES main.adresse(id),
    forfait_nom CHAR(20) NOT NULL REFERENCES main.forfait(nom)
);


-- Create the table in the specified schema
CREATE TABLE main.client
(
    id INT NOT NULL PRIMARY KEY,
    FOREIGN KEY (id) REFERENCES main.profile(id) 
        ON DELETE CASCADE
);

-- Create the table in the specified schema
CREATE TABLE main.carte_credit
(
    numero   CHAR(16) NOT NULL PRIMARY KEY,
    type_carte CHAR(25) NOT NULL,
    expiration   DATE NOT NULL,
    CVV INT NOT NULL,
    client_id   INT REFERENCES main.client(id)
        ON DELETE CASCADE,
    CHECK (LENGTH(numero) = 16),
    CHECK (LENGTH(TRIM(TRANSLATE(numero, '0123456789', ' '))) < 0),
    CHECK (CVV > 0 AND CVV < 999)
);


-- Create the table in the specified schema
CREATE TABLE main.employe
(
    id INT NOT NULL PRIMARY KEY,
    FOREIGN KEY (id) REFERENCES main.profile(id) 
        ON DELETE CASCADE,
    matricule   CHAR(8) UNIQUE NOT NULL,
    CHECK (LENGTH(matricule) = 8 AND LENGTH(TRIM(TRANSLATE(matricule, '0123456789', ' '))) < 0)
);
