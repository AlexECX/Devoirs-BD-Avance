CREATE OR REPLACE procedure main.create_abonnement(
  nom main.forfait.nom%TYPE,
  id  main.profile.profileId%TYPE
)  is

    ligne   main.abonnement%ROWTYPE;

begin
    ligne := main.fcreate_abonnement(nom, id);
end;