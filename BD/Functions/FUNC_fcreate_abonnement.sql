CREATE OR REPLACE function main.fcreate_abonnement(
  nom main.forfait.nom%TYPE,
  id  main.profile.id%TYPE
) RETURN main.abonnement%ROWTYPE is

    ligne   main.abonnement%ROWTYPE;

begin
    INSERT INTO main.abonnement (forfait_nom, profile_id) 
    VALUES (nom, id);

    SELECT * INTO ligne 
    FROM main.abonnement
    WHERE id = id; 
    RETURN ligne;
end;