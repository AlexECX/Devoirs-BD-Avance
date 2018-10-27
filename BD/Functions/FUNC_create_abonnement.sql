CREATE OR REPLACE function main.fcreate_abonnement(
  nom main.forfait.nom%TYPE,
  id  main.profile.profileId%TYPE
) RETURN main.abonnement%ROWTYPE is

    ligne   main.abonnement%ROWTYPE;

begin
    INSERT INTO main.abonnement (forfait_nom, profileId) 
    VALUES (nom, id);

    SELECT * INTO ligne 
    FROM main.abonnement
    WHERE profileId = id; 
    RETURN ligne;
end;