
CREATE TABLE main.personnel_film
(
    id   INT NOT NULL PRIMARY KEY, -- primary key column
    nom    VARCHAR(20) NOT NULL,
    prenom      VARCHAR(20) NOT NULL,
    date_naissance  	DATE NOT NULL,
    lieu_naissance      CHAR(20) NOT NULL,
    biographie    CHAR(255) NOT NULL	
);


CREATE TABLE main.realisateur(
	id INT NOT NULL PRIMARY KEY
);


-- Create the table in the specified schema
CREATE TABLE main.film
(
    id   INT NOT NULL PRIMARY KEY, -- primary key column
    titre    CHAR(50) UNIQUE NOT NULL,
    langue_originale      CHAR(20) NOT NULL,
    annee_sortie         DATE NOT NULL,
    duree         INT NOT NULL,
    resume  	CHAR(255) NOT NULL,
    inventaire    INT NOT NULL,
    realisateur_id INT UNIQUE REFERENCES main.realisateur(id),
	CHECK(inventaire >= 0)
);


CREATE TABLE main.acteur(
	id INT NOT NULL PRIMARY KEY
);


CREATE TABLE main.film_acteur
(
    acteur_id INT REFERENCES main.acteur(id),
    film_id INT REFERENCES main.film(id),
    PRIMARY KEY(acteur_id, film_id),
	nom_personnage CHAR(20) NOT NULL
);


CREATE TABLE main.scenariste(
	id INT NOT NULL PRIMARY KEY
);


CREATE TABLE main.film_scenariste
(
    scenariste_id INT REFERENCES main.scenariste(id),
    film_id INT UNIQUE REFERENCES main.film(id),
    PRIMARY KEY(scenariste_id, film_id)
);


CREATE TABLE main.pays_production(
	nom CHAR(10) NOT NULL PRIMARY KEY
);


CREATE TABLE main.film_pays_production
(
    film_id INT REFERENCES main.film(id),
    pays_production_nom CHAR(10) REFERENCES main.pays_production(nom),
    PRIMARY KEY(film_id, pays_production_nom)
);


CREATE TABLE main.genre(
	nom CHAR(10) NOT NULL PRIMARY KEY
);


CREATE TABLE main.film_genre
(
    genre_nom CHAR(10) REFERENCES main.genre(nom),
    film_id INT REFERENCES main.film(id),
    PRIMARY KEY(genre_nom, film_id)
);


CREATE TABLE main.pret_courant
(
	id   INT NOT NULL PRIMARY KEY, -- primary key column
    profile_id    INT REFERENCES main.profile(id), 
	film_id    INT REFERENCES main.film(id),
    date_pret      DATE NOT NULL,
    date_retour       DATE NOT NULL,
    etat_pret         VARCHAR(10) NOT NULL
);














