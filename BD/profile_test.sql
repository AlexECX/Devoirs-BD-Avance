begin
main.create_profile('alex3@', 'alex', 'cox', 'test_Tel', CURRENT_DATE, 'mdp154444444');
end;



-- INSERT INTO main.profile(profileId, courriel, prenom, nom, tel, date_naissance, mot_de_passe) VALUES (2, 'alex@', 'alex', 'cox', 'test_Tel', to_date('2000/06/03', 'yyyy/mm/dd'), 'mdp154444444');
-- INSERT INTO main.profile(profileId, courriel, prenom, nom, tel, date_naissance, mot_de_passe) VALUES (2, 'alex1@', 'alex', 'cox', 'test_Tel', to_date('2000/06/03', 'yyyy/mm/dd'), 'mdp154444444');
-- INSERT INTO main.profile(profileId, courriel, prenom, nom, tel, date_naissance, mot_de_passe) VALUES (2, 'alex3@', 'alex', 'cox', 'test_Tel', to_date('2000/06/03', 'yyyy/mm/dd'), 'mdp154444444');

-- SELECT * FROM main.profile;
-- DELETE FROM main.profile;