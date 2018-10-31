CREATE OR REPLACE 
function main.fcreate_acteur(
    nom             main.personnel_film.nom%TYPE,
    prenom          main.personnel_film.prenom%TYPE,
    date_naissance  main.personnel_film.date_naissance%TYPE,
    lieu_naissance  main.personnel_film.lieu_naissance%TYPE,
    biographie      main.personnel_film.biographie%TYPE	
) RETURN main.personnel_film%ROWTYPE is

    ligne   main.personnel_film%ROWTYPE;
    f_id      INT;

begin
    INSERT INTO main.personnel_film(nom, prenom, date_naissance, lieu_naissance, biographie) 
    VALUES (nom, prenom, date_naissance, lieu_naissance, biographie);

    f_id := main.personnel_film_seq.CURRVAL;

    INSERT INTO main.acteur(id) VALUES (f_id);

    SELECT * INTO ligne 
    FROM main.personnel_film
    WHERE main.personnel_film.id = f_id; 
    RETURN ligne;
end;
