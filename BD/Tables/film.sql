
CREATE TABLE main.personnel_film
(
    noSequence   INT NOT NULL PRIMARY KEY, -- primary key column
    nom    VARCHAR(20) NOT NULL,
    prenom      VARCHAR(20) NOT NULL,
    date_naissance  	DATE NOT NULL,
    lieu_naissance      CHAR(20) NOT NULL,
    biographie    CHAR(255) NOT NULL	
);


CREATE TABLE main.realisateur(
	noSequence INT NOT NULL PRIMARY KEY
);


-- Create the table in the specified schema
CREATE TABLE main.film
(
    num_code   INT NOT NULL PRIMARY KEY, -- primary key column
    titre    CHAR(50) UNIQUE NOT NULL,
    langue_originale      CHAR(20) NOT NULL,
    annee_sortie         DATE NOT NULL,
    duree         INT NOT NULL,
    resume  	CHAR(255) NOT NULL,
    inventaire    INT NOT NULL,
    realisateur_noSequence INT UNIQUE NOT NULL REFERENCES main.realisateur(noSequence),
	CHECK(inventaire >= 0)
);


CREATE TABLE main.acteur(
	noSequence INT NOT NULL PRIMARY KEY
);


CREATE TABLE main.film_acteur
(
    noSequence INT REFERENCES main.acteur(noSequence),
    num_code INT REFERENCES main.film(num_code),
    PRIMARY KEY(noSequence, num_code),
	nom_personnage CHAR(20) NOT NULL
);


CREATE TABLE main.scenariste(
	noSequence INT NOT NULL PRIMARY KEY
);


CREATE TABLE main.film_scenariste
(
    noSequence INT REFERENCES main.scenariste(noSequence),
    num_code INT UNIQUE REFERENCES main.film(num_code),
    PRIMARY KEY(noSequence, num_code)
);


CREATE TABLE main.pays_production(
	nom CHAR(10) NOT NULL PRIMARY KEY
);


CREATE TABLE main.film_pays_production
(
    num_code INT REFERENCES main.film(num_code),
    pays_production_nom CHAR(10) REFERENCES main.pays_production(nom),
    PRIMARY KEY(num_code, pays_production_nom)
);


CREATE TABLE main.genre(
	nom CHAR(10) NOT NULL PRIMARY KEY
);


CREATE TABLE main.film_genre
(
    genre_nom CHAR(10) REFERENCES main.genre(nom),
    num_code INT REFERENCES main.film(num_code),
    PRIMARY KEY(genre_nom, num_code)
);


CREATE TABLE main.pret_courant
(
	id_pret   INT NOT NULL PRIMARY KEY, -- primary key column
    profileId    INT REFERENCES main.profile(profileId), 
	num_code    INT REFERENCES main.film(num_code),
    date_pret      DATE NOT NULL,
    date_retour       DATE NOT NULL,
    etat_pret         VARCHAR(10) NOT NULL
);














