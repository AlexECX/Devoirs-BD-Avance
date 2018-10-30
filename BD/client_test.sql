declare
    line main.profile%ROWTYPE;
begin
    line := main.fcreate_profile('alex3@', 'alex', 'cox', 'test_Tel', to_date('03/06/1993', 'dd/mm/yyyy'), 'mdp154444444');
    main.create_client(line.id, '1111222233334444', 'Master Card', CURRENT_DATE, 156);

end;
/

select * from main.client;
select * from main.carte_credit;

delete from main.profile;