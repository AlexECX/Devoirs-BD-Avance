CREATE OR REPLACE 
procedure main.create_acteur(
    nom             main.personnel_film.nom%TYPE,
    prenom          main.personnel_film.prenom%TYPE,
    date_naissance  main.personnel_film.date_naissance%TYPE,
    lieu_naissance  main.personnel_film.lieu_naissance%TYPE,
    biographie      main.personnel_film.biographie%TYPE	
) is

    ligne   main.personnel_film%ROWTYPE;

begin
    ligne := main.fcreate_acteur(nom, prenom, date_naissance, lieu_naissance, biographie);
end;
/