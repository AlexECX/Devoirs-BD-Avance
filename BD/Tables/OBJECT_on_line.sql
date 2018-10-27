
CREATE OR REPLACE TYPE main.profile_obj AS OBJECT
(
    profileId   INT,
    courriel    VARCHAR(30),
    prenom      CHAR(20),
    nom         CHAR(20),
    tel         VARCHAR(15),
    date_naissance  DATE,
    mot_de_passe    VARCHAR(18)
);