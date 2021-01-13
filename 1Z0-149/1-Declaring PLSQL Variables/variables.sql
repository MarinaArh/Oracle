--declare and initialize variables
--https://docs.oracle.com/en/database/oracle/oracle-database/19/lnpls/plsql-language-fundamentals.html#GUID-65F9E0D0-03CD-4C40-829A-7392ACE8F932
declare
  flag number(1); -- initial value is NULL by default
  amt number := 100;
  radius number DEFAULT 10;
--для константы значение обязательно
  pi CONSTANT real := 3.14;
--если пишем NOT NULL то инициализировать обязательно
--PLS-00218: переменной, объявленной как NOT NULL, следует присвоить начальное значение
  firstname varchar2(20) not null := 'Elis' ;
  sq number := pi * radius**2;
begin

  dbms_output.put_line(flag);
  dbms_output.put_line(amt);
  dbms_output.put_line(radius);
  dbms_output.put_line(pi);
  dbms_output.put_line(firstname);
  dbms_output.put_line(sq);

--значение константы менять нельзя
--PLS-00363: выражение 'PI' не м.б. использовано как адресат назначения
--  pi := 100;

--эту переменную объявили как NOT NULL  при попытке такого присвоения получим ошибку
--ORA-06502: PL/SQL:  ошибка числа или значения
--  firstname := '';
end;