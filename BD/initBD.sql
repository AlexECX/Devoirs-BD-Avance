-- reset
DROP TABLE main.pret_courant;
DROP TABLE main.abonnement;
DROP TABLE main.client;
DROP TABLE main.carte_credit;
DROP TABLE main.employe;
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
-- table objects
@Tables/OBJECT_on_line.sql
-- auto id increments on tables
@Tables/AUTO_increments.sql
-- procedures
@Procedures/PROC_PRINT.sql
@Procedures/PROC_create_profile.sql
@Procedures/PROC_create_abonnement.sql
-- functions
@Functions/FUNC_is_alphanum.sql
-- triggers
@Triggers/BIUprofil_is_adult.sql
@Triggers/BIUmdp_5alphanum.sql

-- initialise les forfaits
@initForfaits.sql

