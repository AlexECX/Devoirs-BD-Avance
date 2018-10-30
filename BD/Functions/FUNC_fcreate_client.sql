CREATE OR REPLACE 
function main.fcreate_client(
    profile_id  main.client.id%TYPE,
    numero      main.carte_credit%TYPE,
    type_carte  main.carte_credit%TYPE,
    expiration  main.carte_credit%TYPE,
    CVV         main.carte_credit%TYPE,
) RETURN main.client%ROWTYPE is

    ligne   main.client%ROWTYPE;

begin
    INSERT INTO main.client(id), ligne
    VALUES (profile_id);

    insert into main.carte_credit (numero, type_carte, expiration, CVV)
    values (numero, type_carte, expiration, CVV);
    RETURN ligne;
end;
