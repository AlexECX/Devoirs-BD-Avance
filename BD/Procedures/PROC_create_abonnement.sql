CREATE OR REPLACE procedure main.create_abonnement(
  nom main.forfait.nom%TYPE,
  p_id  main.profile.id%TYPE
) is

begin
    update main.profile
    set main.profile.forfait_nom=nom
    where main.profile.id = p_id;
end;