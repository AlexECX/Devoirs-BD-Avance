-- reset
DROP TABLE main.pret_courant;
DROP TABLE main.carte_credit;
DROP TABLE main.client;
DROP TABLE main.employe;
drop table main.membre;
DROP TABLE main.profile;
DROP TABLE main.adresse;
DROP TABLE main.forfait;
--
DROP TABLE main.film_pays_production;
DROP TABLE main.pays_production;
DROP TABLE main.film_genre;
DROP TABLE main.genre;
DROP TABLE main.film_acteur;
DROP TABLE main.acteur;
DROP TABLE main.film_scenariste;
DROP TABLE main.scenariste;
DROP TABLE main.film;
DROP TABLE main.realisateur;
DROP TABLE main.personnel_film;

-- tables
@Tables/profile.sql
@Tables/film.sql
@Tables/VIEW_info_membre.sql
@Tables/VIEW_info_client.sql
-- table objects

-- auto id increments on tables
@Tables/AUTO_increments.sql
-- procedures
@Procedures/PROC_create_profile.sql
@Procedures/PROC_create_client.sql
@Procedures/PROC_create_membre.sql
@Procedures/PROC_create_pret.sql
@Procedures/PROC_create_film.sql
@Procedures/PROC_create_adresse.sql
-- functions
@Functions/FUNC_is_alphanum.sql
@Functions/FUNC_fcreate_profile.sql
@Functions/FUNC_fcreate_client.sql
@Functions/FUNC_fcreate_pret.sql
@Functions/FUNC_fcreate_film.sql
@Functions/FUNC_fcreate_adresse.sql
-- triggers
@Triggers/BIUprofil_is_adult.sql
@Triggers/BIUmdp_5alphanum.sql
@Triggers/BIUlocationMax.sql
@Triggers/BIUetat_pret.sql
@Triggers/BDfilm.sql

-- initialise les forfaits
@initForfaits.sql

