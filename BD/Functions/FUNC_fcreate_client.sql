CREATE OR REPLACE 
function main.fcreate_client(
    profile_id  main.client.id%TYPE,
    numero      main.carte_credit.numero%TYPE,
    type_carte  main.carte_credit.type_carte%TYPE,
    expiration  main.carte_credit.expiration%TYPE,
    CVV         main.carte_credit.CVV%TYPE
) RETURN main.client%ROWTYPE is

    ligne   main.client%ROWTYPE;

begin
    INSERT INTO main.client(id)
    VALUES (profile_id);

    SELECT *
    INTO ligne
    FROM main.client
    WHERE main.client.id = profile_id;


    insert into main.carte_credit (numero, type_carte, expiration, CVV, client_id)
    values (numero, type_carte, expiration, CVV, profile_id);
    RETURN ligne;
end;
