CREATE OR REPLACE 
procedure main.create_client(
    profile_id  main.client.id%TYPE,
    numero      main.carte_credit.numero%TYPE,
    type_carte  main.carte_credit.type_carte%TYPE,
    expiration  main.carte_credit.expiration%TYPE,
    CVV         main.carte_credit.CVV%TYPE
) is

    ligne   main.client%ROWTYPE;

begin
    ligne := main.fcreate_client(profile_id, numero, type_carte, expiration, CVV);
end;
/