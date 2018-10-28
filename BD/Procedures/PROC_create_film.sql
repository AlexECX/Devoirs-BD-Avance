CREATE OR REPLACE 
procedure main.create_film(
    titre               main.film.titre%TYPE,
    langue_originale    main.film.langue_originale%TYPE,
    annee_sortie        main.film.annee_sortie%TYPE,
    duree               main.film.duree%TYPE,
    resume  	        main.film.resume%TYPE,           
    inventaire          main.film.inventaire%TYPE
) is

    ligne   main.film%ROWTYPE;

begin
    ligne := main.fcreate_film(titre, langue_originale, annee_sortie, duree, resume, inventaire);
end;