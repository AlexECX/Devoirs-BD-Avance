set serveroutput on;

declare
    line_profile main.profile%ROWTYPE;
    line_film main.film%ROWTYPE;
    line_adresse main.adresse%ROWTYPE;
begin
    line_profile := main.fcreate_profile('alex3@', 'alex', 'cox', 'test_Tel', to_date('03/06/1993', 'dd/mm/yyyy'), 'mdp154444444');
    line_film := main.fcreate_film('titre', 'langue_originale', CURRENT_DATE, 60, 'resume', 2);
    line_adresse := main.fcreate_adresse(1111, 'rue', 'ville', 'province', 'gy81o8');
    main.create_membre(line_profile.id, line_adresse.id, 'Avance');
    main.create_pret(line_profile.id, line_film.id);
end;
/
         
SELECT * FROM main.info_membre;         
         
delete from main.pret_courant;
delete from main.profile;
delete from main.film;