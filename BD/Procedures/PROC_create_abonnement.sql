CREATE OR REPLACE procedure main.create_abonnement(
  nom main.forfait.nom%TYPE,
  id  main.profile.id%TYPE
)  is

    ligne   main.abonnement%ROWTYPE;

begin
    ligne := main.fcreate_abonnement(nom, id);
end;