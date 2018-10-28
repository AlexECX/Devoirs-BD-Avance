CREATE OR REPLACE 
function main.fcreate_pret(
    profile_id  main.pret_courant.profile_id%TYPE, 
	film_id     main.pret_courant.film_id%TYPE
) RETURN main.pret_courant%ROWTYPE is

    ligne   main.pret_courant%ROWTYPE;
    f_id      INT;
    duree_max   INT;

begin
    select main.forfait.duree_max
    into duree_max
    from main.profile, main.forfait
    where profile.id = profile_id AND profile.forfait_nom = forfait.nom;
    
    INSERT INTO main.pret_courant(profile_id, film_id, date_pret, date_retour, etat_pret) 
    VALUES (profile_id, film_id, CURRENT_DATE, CURRENT_DATE + duree_max, 'prete');

    f_id := main.pret_courant_seq.CURRVAL;

    SELECT *
    INTO ligne
    FROM main.pret_courant 
    WHERE main.pret_courant.id = f_id;
    RETURN ligne;
end;
