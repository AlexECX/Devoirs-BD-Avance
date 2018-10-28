

begin
main.create_profile('alex3@', 'alex', 'cox', 'test_Tel', to_date('03/06/1993', 'dd/mm/yyyy'), 'mdp154444444');
main.create_abonnement('Intermediaire', 1);
end;
/

select * from main.abonnement;
select * from main.profile;

delete from main.abonnement;
delete from main.profile;