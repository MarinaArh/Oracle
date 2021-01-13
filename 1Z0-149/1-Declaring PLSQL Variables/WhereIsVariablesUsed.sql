declare
--declare section
  n number := 100;
  surname EMPLOYEES.LAST_NAME%TYPE;
begin
--executable section
--expressions
 n := n+1;
 DBMS_OUTPUT.put_line(n);
--SELECT INTO, WHERE ...
 select last_name into surname from EMPLOYEES where EMPLOYEE_ID = n;
 DBMS_OUTPUT.put_line(surname);
 
 --return section of subprograms, parametrs of subprogram
end;