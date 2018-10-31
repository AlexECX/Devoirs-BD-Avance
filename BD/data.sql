--films--
main.fcreate_film('Intouchable', 'Francais', to_date('03/06/2010', 'dd/mm/yyyy'), 98, 'Raconte la vie d\'une personne milliardaire handicapée.', 7);
INSERT INTO main.film_pays_production VALUES (1, 'France');
INSERT INTO main.pays_production VALUES ('France');
INSERT INTO main.film_genre VALUES ('histoire', 1);
INSERT INTO main.genre VALUES ('histoire');

main.fcreate_film('REC', 'Espagnol', to_date('03/06/2005', 'dd/mm/yyyy'), 78, 'Invasion de zombie dans un hotel.', 5);
INSERT INTO main.film_pays_production VALUES (2, 'Espagne');
INSERT INTO main.pays_production VALUES ('Espagne');
INSERT INTO main.film_genre VALUES ('horreur', 2);
INSERT INTO main.genre VALUES ('horreur');

main.fcreate_film('Thor', 'Anglais', to_date('03/06/2007', 'dd/mm/yyyy'), 111, 'Histoire d\'un dieu.', 8);
INSERT INTO main.film_pays_production VALUES (3, 'Angleterre');
INSERT INTO main.pays_production VALUES ('Angleterre');
INSERT INTO main.film_genre VALUES ('histoire', 3);
INSERT INTO main.genre VALUES ('histoire');

main.fcreate_film('Hercule', 'Anglais', to_date('03/06/2009', 'dd/mm/yyyy'), 124, 'Raconte l\histoire de la légende Hercule.', 3);
INSERT INTO main.film_pays_production VALUES (4, 'Angleterre');
INSERT INTO main.pays_production VALUES ('Angleterre');
INSERT INTO main.film_genre VALUES ('histoire', 4);
INSERT INTO main.genre VALUES ('histoire');

main.fcreate_film('Mission Impossible', 'Anglais', to_date('03/06/1998', 'dd/mm/yyyy'), 77, 'Une mission qui tourne mal.', 1);
INSERT INTO main.film_pays_production VALUES (5, 'Angleterre');
INSERT INTO main.pays_production VALUES ('Angleterre');
INSERT INTO main.film_genre VALUES ('action', 5);
INSERT INTO main.genre VALUES ('action');


--réalisateurs--
INSERT INTO main.personnel_film VALUES ('Nakache', 'Olivier', to_date('03/06/1973', 'dd/mm/yyyy'), 'Suresnes', 'Aussi scénariste et dialoguiste.');
INSERT INTO main.realisateur VALUES (1);
INSERT INTO main.tournage VALUES (1, 1);

INSERT INTO main.personnel_film VALUES ('Balaguero', 'John', to_date('02/11/1968', 'dd/mm/yyyy'), 'Lerida', 'Réalisateur espagnol.');
INSERT INTO main.realisateur VALUES (2);
INSERT INTO main.tournage VALUES (2, 2);

INSERT INTO main.personnel_film VALUES ('Branagh', 'Kenneth', to_date('10/12/1960', 'dd/mm/yyyy'), 'Belfast', 'Acteur et réalisateur britannique.');
INSERT INTO main.realisateur VALUES (3);
INSERT INTO main.tournage VALUES (3, 3);

INSERT INTO main.personnel_film VALUES ('Clements', 'Ron', to_date('25/04/1953', 'dd/mm/yyyy'), 'lowa', 'Aussi producteur américain.');
INSERT INTO main.realisateur VALUES (4);
INSERT INTO main.tournage VALUES (4, 4);

INSERT INTO main.personnel_film VALUES ('Palma', 'Brian', to_date('11/09/1940', 'dd/mm/yyyy'), 'Newark', 'Scénariste américain.');
INSERT INTO main.realisateur VALUES (5);
INSERT INTO main.tournage VALUES (5, 5);


--acteurs--
INSERT INTO main.personnel_film VALUES ('Sy', 'Omar', to_date('03/06/1978', 'dd/mm/yyyy'), 'Cergy', 'Acteur principalement, il réside actuellement en France.');
INSERT INTO main.acteur VALUES (6);
INSERT INTO main.film_acteur VALUES (6, 1);

INSERT INTO main.personnel_film VALUES ('Clavier', 'Christian', to_date('03/08/1945', 'dd/mm/yyyy'), 'Paris', 'Artiste de 73 ans continue de jouer dans des films.');
INSERT INTO main.acteur VALUES (7);
INSERT INTO main.film_acteur VALUES (7, 1);

INSERT INTO main.personnel_film VALUES ('Velasco', 'Manuela', to_date('02/06/1988', 'dd/mm/yyyy'), 'Madrid', 'Jeune femme résidant à Madrid.');
INSERT INTO main.acteur VALUES (8);
INSERT INTO main.film_acteur VALUES (8, 2);

INSERT INTO main.personnel_film VALUES ('Plaza', 'Paco', to_date('23/09/1978', 'dd/mm/yyyy'), 'Barcelone', 'Plus de 50 films à son actif.');
INSERT INTO main.acteur VALUES (9);
INSERT INTO main.film_acteur VALUES (9, 2);

INSERT INTO main.personnel_film VALUES ('Stewart', 'Christan', to_date('02/05/1982', 'dd/mm/yyyy'), 'Londres', 'Voyage beaucoup.');
INSERT INTO main.acteur VALUES (10);
INSERT INTO main.film_acteur VALUES (10, 3);

INSERT INTO main.personnel_film VALUES ('Neeson', 'Liam', to_date('29/06/1968', 'dd/mm/yyyy'), 'Manchester', 'Considéré comme la légende du cinéma');
INSERT INTO main.acteur VALUES (11);
INSERT INTO main.film_acteur VALUES (11, 3);

INSERT INTO main.personnel_film VALUES ('Johnson', 'Dwayne', to_date('03/04/1980', 'dd/mm/yyyy'), 'Miami', 'Ancien catcheur.');
INSERT INTO main.acteur VALUES (12);
INSERT INTO main.film_acteur VALUES (12, 4);

INSERT INTO main.personnel_film VALUES ('Moretz', 'Chloe', to_date('14/08/1990', 'dd/mm/yyyy'), 'Orlando', 'A fait ses début dans le film kick ass.');
INSERT INTO main.acteur VALUES (13);
INSERT INTO main.film_acteur VALUES (13, 4);

INSERT INTO main.personnel_film VALUES ('Cruse', 'Tom', to_date('13/07/1971', 'dd/mm/yyyy'), 'Plymouth', 'Chef de secte.');
INSERT INTO main.acteur VALUES (14);
INSERT INTO main.film_acteur VALUES (14, 5);

INSERT INTO main.personnel_film VALUES ('Pitt', 'Brad', to_date('02/11/1975', 'dd/mm/yyyy'), 'Porstmouth', 'Ancien bandit.');
INSERT INTO main.acteur VALUES (15);
INSERT INTO main.film_acteur VALUES (15, 5);


--clients--
main.fcreate_profile('jean.yves@hotmail.fr', 'jean', 'yves', '0612124545', '1988-04-04 13:43:00', '1245745f');
main.fcreate_adresse(1111, 'jean', 'bouc', 'haute', '13320');
main.fcreate_client(1, '4567896512034567', 'visa', to_date('10/12/2020', 'dd/mm/yyyy'), '123');
main.create_membre(1, 1, 'Avance');

main.fcreate_profile('jeanne.michel@videotron.ca', 'jeanne', 'michel', '0654545454', '1988-04-25 13:43:00', '7845129r');
main.fcreate_adresse(1234, 'talbot', 'chicoutimi', 'basse', '59146');
main.fcreate_client(2, '4567895632145689', 'visa', to_date('10/11/2020', 'dd/mm/yyyy'), '456');
main.create_membre(2, 2, 'Debutant');

main.fcreate_profile('jeane.bernard@neuf.fr', 'jeane', 'bernard', '0678451232', '1998-04-15 13:43:00', '8956230f');
main.fcreate_adresse(1524, 'universite', 'rognac', 'yes', '13790');
main.fcreate_client(3, '1420563789520126', 'visa', to_date('10/10/2020', 'dd/mm/yyyy'), '789');
main.create_membre(3, 3, 'Avance');

main.fcreate_profile('valentin.bailleul@neuf.fr', 'valentin', 'bailleul', '0679568246', '1978-04-09 13:43:00', '7526481v');
main.fcreate_adresse(1145, 'morin', 'simianne', 'ok', '13190');
main.fcreate_client(4, '7536214895204563', 'visa', to_date('10/09/2020', 'dd/mm/yyyy'), '753');
main.create_membre(4, 4, 'Intermediaire');

main.fcreate_profile('jeanty.final@videotron.ca', 'jeanty', 'final', '0645325698', '1968-04-08 13:43:00', '8956230f');
main.fcreate_adresse(1758, 'philippe', 'bouc', 'oui', '59789');
main.fcreate_client(5, '9510256301452587', 'visa', to_date('10/08/2020', 'dd/mm/yyyy'), '951');
main.create_membre(5, 5, 'Debutant');


--employés--
main.fcreate_profile('employes1@videotron.ca', 'employe1', 'test1', '1956-04-05 13:43:00', '1234567v');
INSERT INTO main.employe VALUES(6, '12345678');
main.fcreate_adresse(4578, 'geogre', 'maximim', 'empl', '45123');
main.create_membre(6, 6, 'Avance');

main.fcreate_profile('employes2@videotron.ca', 'employe1', 'test2', '1957-04-05 13:43:00', '7845126f');
INSERT INTO main.employe VALUES(7, '87654321');
main.fcreate_adresse(4589, 'dube', 'sausset', 'alors', '45789');
main.create_membre(7, 7, 'Avance');

