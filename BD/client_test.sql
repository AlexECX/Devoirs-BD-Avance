declare
    line main.profile%ROWTYPE;
    line_film main.film%ROWTYPE;
    line_adresse main.adresse%ROWTYPE;
begin
    line := main.fcreate_profile('alex3@', 'alex', 'cox', '4185425075', to_date('03/06/1993', 'dd/mm/yyyy'), 'mdp154444444');
    main.create_client(line.id, '1111222233334444', 'Master Card', CURRENT_DATE, 156);
    line_adresse := main.fcreate_adresse(1111, 'rue', 'ville', 'province', 'gy81o8');

    main.create_membre(line.id, line_adresse.id, 'Avance');

    line_film := main.fcreate_film('titre', 'langue_originale', CURRENT_DATE, 60, 'resume', 2);
    main.create_pret(line.id, line_film.id);



end;
/
