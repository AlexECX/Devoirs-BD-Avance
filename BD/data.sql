-- forfaits
insert into main.forfait (nom, cout, location_max, duree_max)
values ('Debutant', 10, 1, 7);

insert into main.forfait (nom, cout, location_max, duree_max)
values ('Intermediaire', 20, 5, 14);

insert into main.forfait (nom, cout, location_max, duree_max)
values ('Avance', 30, 10, 9999);

-- genres
INSERT INTO main.genre VALUES ('horreur');
INSERT INTO main.genre VALUES ('action');
INSERT INTO main.genre VALUES ('histoire');

-- pays
INSERT INTO main.pays_production VALUES ('France');
INSERT INTO main.pays_production VALUES ('Angleterre');
INSERT INTO main.pays_production VALUES ('Espagne');

-- film 1
declare
    ligne_film  main.film%ROWTYPE;
    ligne_acteur  main.personnel_film%ROWTYPE;
    ligne_realisteur  main.personnel_film%ROWTYPE;
begin
    ligne_film := main.fcreate_film('Intouchable', 'Francais', to_date('03/06/2010', 'dd/mm/yyyy'), 60, 'Raconte la vie dune personne milliardaire handicapée.');
    INSERT INTO main.film_pays_production VALUES ('France', ligne_film.id);
    INSERT INTO main.film_genre VALUES ('histoire', ligne_film.id);
    
    --réalisateur--
    ligne_realisteur := main.fcreate_realisateur('Nakache', 'Olivier', to_date('03/06/1973', 'dd/mm/yyyy'), 'Suresnes', 'Aussi scénariste et dialoguiste');

    INSERT INTO main.tournage(film_id, realisateur_id)
    VALUES (ligne_film.id, ligne_realisteur.id);

    --acteurs--
    ligne_acteur := main.fcreate_acteur('Sy', 'Omar', to_date('03/06/1978', 'dd/mm/yyyy'), 'Cergy', 'Acteur principalement, il réside actuellement en France.');
    
    INSERT INTO main.film_acteur(acteur_id, film_id, nom_personnage)
    VALUES (ligne_acteur.id, ligne_film.id, 'Bob le bricoleur');

    ligne_acteur := main.fcreate_acteur('Clavier', 'Christian', to_date('03/08/1945', 'dd/mm/yyyy'), 'Paris', 'Artiste de 73 ans continue de jouer dans des films.');
    
    INSERT INTO main.film_acteur(acteur_id, film_id, nom_personnage)
    VALUES (ligne_acteur.id, ligne_film.id, 'Larry');

    --copies--
    insert into main.film_copie (film_id)
    values (ligne_film.id);
    insert into main.film_copie (film_id)
    values (ligne_film.id);
    insert into main.film_copie (film_id)
    values (ligne_film.id);

end;
/

-- film2
declare
    ligne_film  main.film%ROWTYPE;
    ligne_acteur  main.personnel_film%ROWTYPE;
    ligne_realisteur  main.personnel_film%ROWTYPE;
begin
    ligne_film := main.fcreate_film('REC', 'Espagnol', to_date('03/06/2005', 'dd/mm/yyyy'), 78, 'Invasion de zombie dans un hotel.');
    INSERT INTO main.film_pays_production VALUES ('France', ligne_film.id);
    INSERT INTO main.film_genre VALUES ('histoire', ligne_film.id);
    
    --réalisateur--
    ligne_realisteur := main.fcreate_realisateur('Balaguero', 'John', to_date('02/11/1968', 'dd/mm/yyyy'), 'Lerida', 'Réalisateur espagnol.');

    INSERT INTO main.tournage(film_id, realisateur_id)
    VALUES (ligne_film.id, ligne_realisteur.id);

    --acteurs--
    ligne_acteur := main.fcreate_acteur('Velasco', 'Manuela', to_date('02/06/1988', 'dd/mm/yyyy'), 'Madrid', 'Jeune femme résidant à Madrid.');
    
    INSERT INTO main.film_acteur(acteur_id, film_id, nom_personnage)
    VALUES (ligne_acteur.id, ligne_film.id, 'Bob le bricoleur');

    ligne_acteur := main.fcreate_acteur('Plaza', 'Paco', to_date('23/09/1978', 'dd/mm/yyyy'), 'Barcelone', 'Plus de 50 films à son actif.');
    
    INSERT INTO main.film_acteur(acteur_id, film_id, nom_personnage)
    VALUES (ligne_acteur.id, ligne_film.id, 'Larry');

    --copies--
    insert into main.film_copie (film_id)
    values (ligne_film.id);
    insert into main.film_copie (film_id)
    values (ligne_film.id);
    insert into main.film_copie (film_id)
    values (ligne_film.id);

end;
/


-- film3
declare
    ligne_film  main.film%ROWTYPE;
    ligne_acteur  main.personnel_film%ROWTYPE;
    ligne_realisteur  main.personnel_film%ROWTYPE;
begin
    ligne_film := main.fcreate_film('Thor', 'Anglais', to_date('03/06/2007', 'dd/mm/yyyy'), 111, 'Histoire dun dieu.');
    INSERT INTO main.film_pays_production VALUES ('France', ligne_film.id);
    INSERT INTO main.film_genre VALUES ('histoire', ligne_film.id);
    
    --réalisateur--
    ligne_realisteur := main.fcreate_realisateur('Branagh', 'Kenneth', to_date('10/12/1960', 'dd/mm/yyyy'), 'Belfast', 'Acteur et réalisateur britannique.');

    INSERT INTO main.tournage(film_id, realisateur_id)
    VALUES (ligne_film.id, ligne_realisteur.id);

    --acteurs--
    ligne_acteur := main.fcreate_acteur('Stewart', 'Christan', to_date('02/05/1982', 'dd/mm/yyyy'), 'Londres', 'Voyage beaucoup.');
    
    INSERT INTO main.film_acteur(acteur_id, film_id, nom_personnage)
    VALUES (ligne_acteur.id, ligne_film.id, 'Bob le bricoleur');

    ligne_acteur := main.fcreate_acteur('Neeson', 'Liam', to_date('29/06/1968', 'dd/mm/yyyy'), 'Manchester', 'Considéré comme la légende du cinéma');
    
    INSERT INTO main.film_acteur(acteur_id, film_id, nom_personnage)
    VALUES (ligne_acteur.id, ligne_film.id, 'Larry');

    --copies--
    insert into main.film_copie (film_id)
    values (ligne_film.id);
    insert into main.film_copie (film_id)
    values (ligne_film.id);
    insert into main.film_copie (film_id)
    values (ligne_film.id);

end;
/

-- film4
declare
    ligne_film  main.film%ROWTYPE;
    ligne_acteur  main.personnel_film%ROWTYPE;
    ligne_realisteur  main.personnel_film%ROWTYPE;
begin
    ligne_film := main.fcreate_film('Hercule', 'Anglais', to_date('03/06/2009', 'dd/mm/yyyy'), 124, 'Raconte l\histoire de la légende Hercule.');
    INSERT INTO main.film_pays_production VALUES ('France', ligne_film.id);
    INSERT INTO main.film_genre VALUES ('histoire', ligne_film.id);
    
    --réalisateur--
    ligne_realisteur := main.fcreate_realisateur('Clements', 'Ron', to_date('25/04/1953', 'dd/mm/yyyy'), 'lowa', 'Aussi producteur américain.');

    INSERT INTO main.tournage(film_id, realisateur_id)
    VALUES (ligne_film.id, ligne_realisteur.id);

    --acteurs--
    ligne_acteur := main.fcreate_acteur('Johnson', 'Dwayne', to_date('03/04/1980', 'dd/mm/yyyy'), 'Miami', 'Ancien catcheur.');
    
    INSERT INTO main.film_acteur(acteur_id, film_id, nom_personnage)
    VALUES (ligne_acteur.id, ligne_film.id, 'Bob le bricoleur');

    ligne_acteur := main.fcreate_acteur('Moretz', 'Chloe', to_date('14/08/1990', 'dd/mm/yyyy'), 'Orlando', 'A fait ses début dans le film kick ass.');
    
    INSERT INTO main.film_acteur(acteur_id, film_id, nom_personnage)
    VALUES (ligne_acteur.id, ligne_film.id, 'Larry');

    --copies--
    insert into main.film_copie (film_id)
    values (ligne_film.id);
    insert into main.film_copie (film_id)
    values (ligne_film.id);
    insert into main.film_copie (film_id)
    values (ligne_film.id);

end;
/

-- film5
declare
    ligne_film  main.film%ROWTYPE;
    ligne_acteur  main.personnel_film%ROWTYPE;
    ligne_realisteur  main.personnel_film%ROWTYPE;
begin
    ligne_film := main.fcreate_film('Mission Impossible', 'Anglais', to_date('03/06/1998', 'dd/mm/yyyy'), 77, 'Une mission qui tourne mal.');
    INSERT INTO main.film_pays_production VALUES ('France', ligne_film.id);
    INSERT INTO main.film_genre VALUES ('histoire', ligne_film.id);
    
    --réalisateur--
    ligne_realisteur := main.fcreate_realisateur('Palma', 'Brian', to_date('11/09/1940', 'dd/mm/yyyy'), 'Newark', 'Scénariste américain.');

    INSERT INTO main.tournage(film_id, realisateur_id)
    VALUES (ligne_film.id, ligne_realisteur.id);

    --acteurs--
    ligne_acteur := main.fcreate_acteur('Cruse', 'Tom', to_date('13/07/1971', 'dd/mm/yyyy'), 'Plymouth', 'Chef de secte.');
    
    INSERT INTO main.film_acteur(acteur_id, film_id, nom_personnage)
    VALUES (ligne_acteur.id, ligne_film.id, 'Bob le bricoleur');

    ligne_acteur := main.fcreate_acteur('Pitt', 'Brad', to_date('02/11/1975', 'dd/mm/yyyy'), 'Porstmouth', 'Ancien bandit.');
    
    INSERT INTO main.film_acteur(acteur_id, film_id, nom_personnage)
    VALUES (ligne_acteur.id, ligne_film.id, 'Larry');

    --copies--
    insert into main.film_copie (film_id)
    values (ligne_film.id);
    insert into main.film_copie (film_id)
    values (ligne_film.id);
    insert into main.film_copie (film_id)
    values (ligne_film.id);

end;
/


--clients--
declare
    ligne_profile main.profile%ROWTYPE;
    ligne_adresse main.adresse%ROWTYPE;
begin
    ligne_profile := main.fcreate_profile('jean.yves@hotmail.fr', 'jean', 'yves', '0612124545', to_date('03/04/1980', 'dd/mm/yyyy'), '1245745f');
    ligne_adresse := main.fcreate_adresse(1111, 'rue', 'ville', 'province', 'gy81o8');
    main.create_client(ligne_profile.id, '4567896512034567', 'visa', to_date('10/12/2020', 'dd/mm/yyyy'), '123');
    main.create_membre(ligne_profile.id, ligne_adresse.id, 'Avance');
end;
/

declare
    ligne_profile main.profile%ROWTYPE;
    ligne_adresse main.adresse%ROWTYPE;
begin
    ligne_profile := main.fcreate_profile('jeanne.michel@videotron.ca', 'jeanne', 'michel', '0654545454', to_date('03/04/1980', 'dd/mm/yyyy'), '7845129r');
    ligne_adresse := main.fcreate_adresse(1234, 'talbot', 'chicoutimi', 'basse', '59146');
    main.create_client(ligne_profile.id, '4567895632145689', 'visa', to_date('10/11/2020', 'dd/mm/yyyy'), '456');
    main.create_membre(ligne_profile.id, ligne_adresse.id, 'Debutant');
end;
/

declare
    ligne_profile main.profile%ROWTYPE;
    ligne_adresse main.adresse%ROWTYPE;
begin
    ligne_profile := main.fcreate_profile('jeane.bernard@neuf.fr', 'jeane', 'bernard', '0678451232', to_date('03/04/1980', 'dd/mm/yyyy'), '8956230f');
    ligne_adresse := main.fcreate_adresse(1524, 'universite', 'rognac', 'yes', '13790');
    main.create_client(ligne_profile.id, '1420563789520126', 'visa', to_date('10/10/2020', 'dd/mm/yyyy'), '789');
    main.create_membre(ligne_profile.id, ligne_adresse.id, 'Intermediaire');
end;
/

declare
    ligne_profile main.profile%ROWTYPE;
    ligne_adresse main.adresse%ROWTYPE;
begin
    ligne_profile := main.fcreate_profile('valentin.bailleul@neuf.fr', 'valentin', 'bailleul', '0679568246', to_date('03/04/1980', 'dd/mm/yyyy'), '7526481v');
    ligne_adresse := main.fcreate_adresse(1145, 'morin', 'simianne', 'ok', '13190');
    main.create_client(ligne_profile.id, '7536214895204563', 'visa', to_date('10/09/2020', 'dd/mm/yyyy'), '753');
    main.create_membre(ligne_profile.id, ligne_adresse.id, 'Intermediaire');
end;
/

declare
    ligne_profile main.profile%ROWTYPE;
    ligne_adresse main.adresse%ROWTYPE;
begin
    ligne_profile := main.fcreate_profile('jeanty.final@videotron.ca', 'jeanty', 'final', '0645325698', to_date('03/04/1980', 'dd/mm/yyyy'), '8956230f');
    ligne_adresse := main.fcreate_adresse(1758, 'philippe', 'bouc', 'oui', '59789');
    main.create_client(ligne_profile.id, '9510256301452587', 'visa', to_date('10/08/2020', 'dd/mm/yyyy'), '951');
    main.create_membre(ligne_profile.id, ligne_adresse.id, 'Intermediaire');
end;
/


--employés--
declare
    ligne_profile main.profile%ROWTYPE;
    ligne_adresse main.adresse%ROWTYPE;
begin
    ligne_profile := main.fcreate_profile('employes1@videotron.ca', 'employe1', 'test1', '0645325698', to_date('03/04/1980', 'dd/mm/yyyy'), '1234567v');
    ligne_adresse := main.fcreate_adresse(4578, 'geogre', 'maximim', 'empl', '45123');
    INSERT INTO main.employe VALUES(ligne_profile.id, '12345678');
    main.create_membre(ligne_profile.id, ligne_adresse.id, 'Avance');
end;
/

declare
    ligne_profile main.profile%ROWTYPE;
    ligne_adresse main.adresse%ROWTYPE;
begin
    ligne_profile := main.fcreate_profile('employes2@videotron.ca', 'employe1', 'test2', '0645325698', to_date('03/04/1980', 'dd/mm/yyyy'), '7845126f');
    ligne_adresse := main.fcreate_adresse(4589, 'dube', 'sausset', 'alors', '45789');
    INSERT INTO main.employe VALUES(ligne_profile.id, '87654321');
    main.create_membre(ligne_profile.id, ligne_adresse.id, 'Avance');
end;
/
