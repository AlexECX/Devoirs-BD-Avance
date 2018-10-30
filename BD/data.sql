--films--
INSERT INTO film VALUES (1, 'Intouchable', 'Francais', to_date('03/06/2010', 'dd/mm/yyyy'), '98', 'Raconte la vie d\'une personne milliardaire handicapée.', 7, 1);
INSERT INTO film VALUES (1, 'REC', 'Espagnol', to_date('03/06/2005', 'dd/mm/yyyy'), '78', 'Invasion de zombie dans un hotel.', 5, 2);
INSERT INTO film VALUES (1, 'Thor', 'Anglais', to_date('03/06/2007', 'dd/mm/yyyy'), '111', 'Histoire d\'un dieu.', 8, 3);
INSERT INTO film VALUES (1, 'Hercule', 'Anglais', to_date('03/06/2009', 'dd/mm/yyyy'), '124', 'Raconte l\histoire de la légende Hercule.', 3, 4);
INSERT INTO film VALUES (1, 'Mission Impossible', 'Anglais', to_date('03/06/1998', 'dd/mm/yyyy'), '77', 'Une mission qui tourne mal.', 1, 5);

--acteurs--
INSERT INTO personnel_film VALUES (6, 'Sy', 'Omar', to_date('03/06/1978', 'dd/mm/yyyy'), 'Cergy', 'Acteur principalement, il réside actuellement en France.');
INSERT INTO personnel_film VALUES (7, 'Clavier', 'Christian', to_date('03/08/1945', 'dd/mm/yyyy'), 'Paris', 'Artiste de 73 ans continue de jouer dans des films.');
INSERT INTO personnel_film VALUES (8, 'Velasco', 'Manuela', to_date('02/06/1988', 'dd/mm/yyyy'), 'Madrid', 'Jeune femme résidant à Madrid.');
INSERT INTO personnel_film VALUES (9, 'Plaza', 'Paco', to_date('23/09/1978', 'dd/mm/yyyy'), 'Barcelone', 'Plus de 50 films à son actif.');
INSERT INTO personnel_film VALUES (10, 'Stewart', 'Christan', to_date('02/05/1982', 'dd/mm/yyyy'), 'Londres', 'Voyage beaucoup.');
INSERT INTO personnel_film VALUES (11, 'Neeson', 'Liam', to_date('29/06/1968', 'dd/mm/yyyy'), 'Manchester', 'Considéré comme la légende du cinéma');
INSERT INTO personnel_film VALUES (12, 'Johnson', 'Dwayne', to_date('03/04/1980', 'dd/mm/yyyy'), 'Miami', 'Ancien catcheur.');
INSERT INTO personnel_film VALUES (13, 'Moretz', 'Chloe', to_date('14/08/1990', 'dd/mm/yyyy'), 'Orlando', 'A fait ses début dans le film kick ass.');
INSERT INTO personnel_film VALUES (14, 'Cruse', 'Tom', to_date('13/07/1971', 'dd/mm/yyyy'), 'Plymouth', 'Chef de secte.');
INSERT INTO personnel_film VALUES (15, 'Pitt', 'Brad', to_date('02/11/1975', 'dd/mm/yyyy'), 'Porstmouth', 'Ancien bandit.');

--réalisateurs--
INSERT INTO personnel_film VALUES (1, 'Nakache', 'Olivier', to_date('03/06/1973', 'dd/mm/yyyy'), 'Suresnes', 'Aussi scénariste et dialoguiste');
INSERT INTO personnel_film VALUES (2, 'chien', 'M', to_date('03/06/1978', 'dd/mm/yyyy'), 'Rox', 'Mordille beaucoup');
INSERT INTO personnel_film VALUES (3, 'chien', 'M', to_date('03/06/1978', 'dd/mm/yyyy'), 'Rox', 'Mordille beaucoup');
INSERT INTO personnel_film VALUES (4, 'chien', 'M', to_date('03/06/1978', 'dd/mm/yyyy'), 'Rox', 'Mordille beaucoup');
INSERT INTO personnel_film VALUES (5, 'chien', 'M', to_date('03/06/1978', 'dd/mm/yyyy'), 'Rox', 'Mordille beaucoup');

--clients--
INSERT INTO profile VALUES (1, 'jean.yves@hotmail.fr', 'jean', 'yves', '0612124545', '1988-04-04 13:43:00', '1245745f');
INSERT INTO profile VALUES (2, 'jeanne.michel@videotron.ca', 'jeanne', 'michel', '0654545454', '1988-04-25 13:43:00', '7845129r');
INSERT INTO profile VALUES (3, 'jeane.bernard@neuf.fr', 'jeane', 'bernard', '0678451232', '1998-04-15 13:43:00', '8956230f');
INSERT INTO profile VALUES (4, 'valentin.bailleul@neuf.fr', 'valentin', 'bailleul', '0679568246', '1978-04-09 13:43:00', '7526481v');
INSERT INTO profile VALUES (5, 'jeanty.final@videotron.ca', 'jeanty', 'final', '0645325698', '1968-04-08 13:43:00', '8956230f');

--employés--
INSERT INTO profile VALUES (6, 'employes1@videotron.ca', 'employe1', 'test1', '1956-04-05 13:43:00', '1234567v');
INSERT INTO profile VALUES (7, 'employes2@videotron.ca', 'employe1', 'test2', '1957-04-05 13:43:00', '7845126f');