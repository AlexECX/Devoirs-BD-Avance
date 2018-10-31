CREATE OR REPLACE VIEW main.info_client AS
    SELECT DISTINCT profile.*,
           adresse.num_civique, adresse.rue, adresse.ville, adresse.province, adresse.code_postal,
           forfait.nom AS forfait_nom, forfait.cout, forfait.location_max, forfait.duree_max
    FROM main.client, main.membre, main.profile, main.adresse, main.forfait
    WHERE client.id = profile.id
         AND client.id = membre.id
         AND membre.adresse_id = adresse.id 
         AND membre.forfait_nom = forfait.nom;