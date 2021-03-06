CREATE OR REPLACE 
procedure main.create_profile(
  courriel  main.profile.courriel%TYPE,
  prenom    main.profile.prenom%TYPE,
  nom       main.profile.nom%TYPE,
  tel       main.profile.tel%TYPE,
  date_naissance    main.profile.date_naissance%TYPE,
  mot_de_passe  main.profile.mot_de_passe%TYPE
) is

    ligne   main.profile%ROWTYPE;

begin
    ligne := main.fcreate_profile(courriel, prenom, nom, tel, date_naissance, mot_de_passe);
end;
/