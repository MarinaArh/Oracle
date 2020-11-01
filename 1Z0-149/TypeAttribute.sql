--https://docs.oracle.com/en/database/oracle/oracle-database/19/lnpls/plsql-language-fundamentals.html#GUID-2E4B6BBA-08B5-473A-901D-738BD00ABF47
declare
--можно объявлять тип основываясь на типе другой переменной или столбца (%TYPE must be applied to a variable, column, field or attribute)
  firstname varchar2(20) NOT NULL := 'Elis';
--ограничение NOT NULL от переменно копируется
--если не инициализируем будет ошибка PLS-00218: переменной, объявленной как NOT NULL, следует присвоить начальное значение
  lastname firstname%TYPE := 'Pet';
-- правила наследования типа при использовании TYPE
-- Data type and size
-- Constraints (unless the referenced item is a column)
  v_listname employees.last_name%TYPE;
begin
  firstname := ' Elison';
  lastname := 'Cat';
end;
