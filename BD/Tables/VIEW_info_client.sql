CREATE OR REPLACE VIEW main.info_client AS
    SELECT profile.*,
           adresse.num_civique, adresse.rue, adresse.ville, adresse.province, adresse.code_postal,
           forfait.nom AS forfait_nom, forfait.cout, forfait.location_max, forfait.duree_max,
           carte_credit.numero, carte_credit.type_carte, carte_credit.expiration, carte_credit.CVV
    FROM main.profile INNER JOIN main.membre ON profile.id = membre.id,
         main.adresse INNER JOIN main.membre ON adresse.id = adresse_id,
         main.forfait INNER JOIN main.membre ON forfait.nom = forfait_nom,
         main.carte_credit INNER JOIN main.membre ON carte_credit.client_id = membre.id;