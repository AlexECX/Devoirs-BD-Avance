set serveroutput on;

declare
    line_profile main.profile%ROWTYPE;
    line_film main.film%ROWTYPE;
begin
    line_profile := main.fcreate_profile('alex3@', 'alex', 'cox', 'test_Tel', to_date('03/06/1993', 'dd/mm/yyyy'), 'mdp154444444');
    line_film := main.fcreate_film('titre', 'langue_originale', CURRENT_DATE, 60, 'resume', 2);
    main.create_membre(line_profile.id, NULL, 'Avance');
    main.create_pret(line_profile.id, line_film.id);
end;
/
select * from main.profile;
select * from main.film;
select * from main.pret_courant;

delete from main.pret_courant;
delete from main.profile;
delete from main.film;