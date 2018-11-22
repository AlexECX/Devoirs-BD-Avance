CREATE OR REPLACE 
function main.fcreate_film(
    titre               main.film.titre%TYPE,
    langue_originale    main.film.langue_originale%TYPE,
    annee_sortie        main.film.annee_sortie%TYPE,
    duree               main.film.duree%TYPE,
    resume  	        main.film.resume%TYPE        
) RETURN main.film%ROWTYPE is

    ligne   main.film%ROWTYPE;
    f_id      INT;

begin
    INSERT INTO main.film(titre, langue_originale, annee_sortie, duree, resume) 
    VALUES (titre, langue_originale, annee_sortie, duree, resume);

    f_id := main.film_seq.CURRVAL;

    SELECT * INTO ligne 
    FROM main.film
    WHERE main.film.id = f_id; 
    RETURN ligne;
end;
