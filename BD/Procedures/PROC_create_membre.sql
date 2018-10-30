CREATE OR REPLACE procedure main.create_membre(
  id  main.membre.id%TYPE,
  adresse_id  main.membre.adresse_id%TYPE,
  nom main.membre.forfait_nom%TYPE
  
) is

begin
    INSERT INTO main.membre(id, adresse_id, forfait_nom) 
    VALUES (id, adresse_id, nom);
end;