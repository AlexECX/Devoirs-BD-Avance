create or replace 
procedure main.test_profile
is

    ligne   main.profile%rowtype;

begin
    ligne := main.create_profile('alex3@', 'alex', 'cox', 'test_Tel', to_date('03/06/1993', 'dd/mm/yyyy'), 'mdp154444444');
end test_profile;
/

begin
main.test_profile();
main.create_abonnement('Intermediaire', 1);
end;
/

select * from main.abonnement;
select * from main.profile;

delete from main.abonnement;
delete from main.profile;
drop procedure main.test_profile;

