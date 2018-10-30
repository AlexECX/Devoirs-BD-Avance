CREATE OR REPLACE VIEW main.info_membre AS
    SELECT profile.*,
           adresse.num_civique, adresse.rue, adresse.ville, adresse.province, adresse.code_postal,
           forfait.nom AS forfait_nom, forfait.cout, forfait.location_max, forfait.duree_max
    FROM main.profile INNER JOIN main.membre ON profile.id = membre.id,
         main.adresse INNER JOIN main.membre ON adresse.id = adresse_id,
         main.forfait INNER JOIN main.membre ON forfait.nom = forfait_nom;
         

    