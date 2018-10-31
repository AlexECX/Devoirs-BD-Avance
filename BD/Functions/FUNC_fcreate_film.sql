CREATE OR REPLACE 
function main.fcreate_film(
    titre               main.film.titre%TYPE,
    langue_originale    main.film.langue_originale%TYPE,
    annee_sortie        main.film.annee_sortie%TYPE,
    duree               main.film.duree%TYPE,
    resume  	        main.film.resume%TYPE,           
    inventaire          main.film.inventaire%TYPE
--  realisateur_id      main.film.realisateur_id%TYPE
) RETURN main.film%ROWTYPE is

    ligne   main.film%ROWTYPE;
    f_id      INT;

begin
    INSERT INTO main.film(titre, langue_originale, annee_sortie, duree, resume, inventaire) 
    VALUES (titre, langue_originale, annee_sortie, duree, resume, inventaire);

    f_id := main.film_seq.CURRVAL;

    SELECT * INTO ligne 
    FROM main.film
    WHERE main.film.id = f_id; 
    RETURN ligne;
end;
