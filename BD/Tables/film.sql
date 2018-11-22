
CREATE TABLE main.personnel_film
(
    id   INT NOT NULL PRIMARY KEY, -- primary key column
    nom    VARCHAR(20) NOT NULL,
    prenom      VARCHAR(20) NOT NULL,
    date_naissance  	DATE,
    lieu_naissance      CHAR(20),
    biographie    CHAR(255)	
);


-- Create the table in the specified schema
CREATE TABLE main.film
(
    id   INT NOT NULL PRIMARY KEY, -- primary key column
    titre    CHAR(50) NOT NULL,
    langue_originale      CHAR(20) NOT NULL,
    annee_sortie         DATE NOT NULL,
    duree         INT NOT NULL,
    resume  	CHAR(255) NOT NULL
);

CREATE TABLE main.film_copie
(
    id   INT NOT NULL PRIMARY KEY,
    film_id INT NOT NULL REFERENCES main.film(id)
);


CREATE TABLE main.realisateur(
	id INT NOT NULL REFERENCES main.personnel_film(id),
    PRIMARY KEY(id)
);


CREATE TABLE main.tournage
(
    film_id INT NOT NULL REFERENCES main.film(id),
    PRIMARY KEY(film_id),
    realisateur_id INT NOT NULL REFERENCES main.realisateur(id)

);


CREATE TABLE main.acteur(
	id INT NOT NULL REFERENCES main.personnel_film(id),
    PRIMARY KEY(id)
);


CREATE TABLE main.film_acteur
(
    acteur_id INT NOT NULL REFERENCES main.acteur(id),
    film_id INT NOT NULL REFERENCES main.tournage(film_id),
    PRIMARY KEY(acteur_id, film_id),
	nom_personnage CHAR(20) NOT NULL
);


CREATE TABLE main.scenariste(
	id INT NOT NULL REFERENCES main.personnel_film(id),
    PRIMARY KEY(id)
);



CREATE TABLE main.film_scenariste
(
    scenariste_id INT NOT NULL REFERENCES main.scenariste(id),
    film_id INT NOT NULL REFERENCES main.tournage(film_id),
    PRIMARY KEY(scenariste_id, film_id)
);


CREATE TABLE main.pays_production(
	nom CHAR(10) NOT NULL PRIMARY KEY
);


CREATE TABLE main.film_pays_production
(
    pays_production_nom CHAR(10) NOT NULL REFERENCES main.pays_production(nom),
    film_id INT NOT NULL REFERENCES main.film(id),
    PRIMARY KEY(film_id, pays_production_nom)
);


CREATE TABLE main.genre(
	nom CHAR(10) NOT NULL PRIMARY KEY
);


CREATE TABLE main.film_genre
(
    genre_nom CHAR(10) NOT NULL REFERENCES main.genre(nom),
    film_id INT NOT NULL REFERENCES main.film(id),
    PRIMARY KEY(genre_nom, film_id)
);


CREATE TABLE main.pret_courant
(
	id   INT NOT NULL PRIMARY KEY, -- primary key column
    profile_id    INT NOT NULL REFERENCES main.profile(id), 
	film_id    INT NOT NULL UNIQUE REFERENCES main.film_copie(id),
    date_pret      DATE NOT NULL,
    date_retour       DATE NOT NULL,
    etat_pret         VARCHAR(10) NOT NULL
);














