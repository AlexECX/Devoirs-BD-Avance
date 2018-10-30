CREATE OR REPLACE procedure main.create_membre(
  nom main.membre.forfait_nom%TYPE,
  id  main.membre.id%TYPE,
  adresse_id  main.membre.adresse_id%TYPE
) is

begin
    INSERT INTO main.membre(id, adresse_id, forfait_nom) 
    VALUES (id, adresse_id, nom);
end;