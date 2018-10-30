CREATE OR REPLACE 
procedure main.create_client(
    profile_id  main.client.id%TYPE,
    numero      main.carte_credit%TYPE,
    type_carte  main.carte_credit%TYPE,
    expiration  main.carte_credit%TYPE,
    CVV         main.carte_credit%TYPE,
) is

    ligne   main.client%ROWTYPE;

begin
    ligne := main.fcreate_client(numero, type_carte, expiration, CVV);
end;