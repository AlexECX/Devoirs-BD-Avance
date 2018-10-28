CREATE OR REPLACE FUNCTION main.is_valid
RETURN INT IS
BEGIN
    SELECT COUNT(pret_courant.id)
    FROM pret_courant, profile
    WHERE pret_courant.num_profile = profile.num_profile;
    RETURN COUNT(pret_courant.id);
END;