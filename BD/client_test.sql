declare
    line main.profile%ROWTYPE;
begin
    line := main.fcreate_profile('alex3@', 'alex', 'cox', 'test_Tel', to_date('03/06/1993', 'dd/mm/yyyy'), 'mdp154444444');
    insert into main.client(id) values (line.id);
end;
/
select * from main.profile;
select * from main.client;

delete from main.profile;
delete from main.client;
delete from main.profile;