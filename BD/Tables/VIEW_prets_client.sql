CREATE OR REPLACE VIEW main.prets_client AS
    SELECT client.id as client_id, film.titre, film.annee_sortie, (main.calculate_retard(pret_courant.date_retour)) as retard
    FROM main.client, main.film, main.pret_courant
    WHERE client.id = pret_courant.profile_id AND pret_courant.film_id = film.id;
         