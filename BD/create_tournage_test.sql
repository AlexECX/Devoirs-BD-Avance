declare
    ligne_film  main.film%ROWTYPE;
    ligne_acteur  main.personnel_film%ROWTYPE;
    ligne_realisteur  main.personnel_film%ROWTYPE;
begin
    ligne_film := main.fcreate_film('Intouchable', 'Francais', to_date('03/06/2010', 'dd/mm/yyyy'), 60, 'Raconte la vie dune personne milliardaire handicapée.', 1);
    ligne_realisteur := main.fcreate_realisateur('Nakache', 'Olivier', to_date('03/06/1973', 'dd/mm/yyyy'), 'Suresnes', 'Aussi scénariste et dialoguiste');

    INSERT INTO main.tournage(film_id, realisateur_id)
    VALUES (ligne_film.id, ligne_realisteur.id);

    ligne_acteur := main.fcreate_acteur('Sy', 'Omar', to_date('03/06/1978', 'dd/mm/yyyy'), 'Cergy', 'Acteur principalement, il réside actuellement en France.');
    
    INSERT INTO main.film_acteur(acteur_id, film_id, nom_personnage)
    VALUES (ligne_acteur.id, ligne_film.id, 'Bob le bricoleur');

    ligne_acteur := main.fcreate_acteur('Clavier', 'Christian', to_date('03/08/1945', 'dd/mm/yyyy'), 'Paris', 'Artiste de 73 ans continue de jouer dans des films.');
    
    INSERT INTO main.film_acteur(acteur_id, film_id, nom_personnage)
    VALUES (ligne_acteur.id, ligne_film.id, 'Larry');

end;
/

select * from main.film;
select * from main.personnel_film;
select * from main.film_acteur;
select * from main.tournage;

delete from main.film_acteur;
delete from main.tournage;
delete from main.acteur;
delete from main.realisateur;
delete from main.personnel_film;