CREATE OR REPLACE 
function main.fcreate_profile(
  courriel  main.profile.courriel%TYPE,
  prenom    main.profile.prenom%TYPE,
  nom       main.profile.nom%TYPE,
  tel       main.profile.tel%TYPE,
  date_naissance    main.profile.date_naissance%TYPE,
  mot_de_passe  main.profile.mot_de_passe%TYPE
) RETURN main.profile%ROWTYPE is

    ligne   main.profile%ROWTYPE;
    f_id      INT;

begin
    INSERT INTO main.profile(courriel, prenom, nom, tel, date_naissance, mot_de_passe) 
    VALUES (courriel, prenom, nom, tel, date_naissance, mot_de_passe);

    f_id := main.profile_seq.CURRVAL;

    SELECT * INTO ligne 
    FROM main.profile
    WHERE main.profile.id = f_id; 
    RETURN ligne;
end;
