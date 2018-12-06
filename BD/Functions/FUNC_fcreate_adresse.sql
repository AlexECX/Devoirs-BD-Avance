CREATE OR REPLACE 
function main.fcreate_adresse(
    num_civique main.adresse.num_civique%TYPE,
    rue         main.adresse.rue%TYPE,
    ville       main.adresse.ville%TYPE,
    province    main.adresse.province%TYPE,
    code_postal main.adresse.code_postal%TYPE
) RETURN main.adresse%ROWTYPE is

    ligne   main.adresse%ROWTYPE;
    f_id      INT;

begin
    INSERT INTO main.adresse(num_civique, rue, ville, province, code_postal) 
    VALUES (num_civique, rue, ville, province, code_postal);

    f_id := main.adresse_seq.CURRVAL;

    SELECT * INTO ligne 
    FROM main.adresse
    WHERE main.adresse.id = f_id; 
    RETURN ligne;
end;
/