CREATE OR REPLACE 
procedure main.create_adresse(
    num_civique main.adresse.num_civique%TYPE,
    rue         main.adresse.rue%TYPE,
    ville       main.adresse.ville%TYPE,
    province    main.adresse.province%TYPE,
    code_postal main.adresse.code_postal%TYPE
) is

    ligne   main.adresse%ROWTYPE;

begin
    ligne := main.fcreate_adresse(num_civique, rue, ville, province, code_postal);
end;