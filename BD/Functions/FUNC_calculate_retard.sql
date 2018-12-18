CREATE OR REPLACE
function main.calculate_retard(
  pret_date DATE
) return CHAR
is
begin
    if (pret_date < CURRENT_DATE) then
        return ('Retard '||(CURRENT_DATE-pret_date)||' jour(s)');
    else
        return 'Non';
    end if;
  
end;
/