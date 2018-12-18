CREATE OR REPLACE 
procedure main.create_pret(
    profile_id  main.pret_courant.profile_id%TYPE, 
	film_id     main.pret_courant.film_id%TYPE
) is

    ligne   main.pret_courant%ROWTYPE;

begin
    ligne := main.fcreate_pret(profile_id, film_id);
end;
/