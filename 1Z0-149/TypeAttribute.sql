--https://docs.oracle.com/en/database/oracle/oracle-database/19/lnpls/plsql-language-fundamentals.html#GUID-2E4B6BBA-08B5-473A-901D-738BD00ABF47
declare
--����� ��������� ��� ����������� �� ���� ������ ���������� ��� ������� (%TYPE must be applied to a variable, column, field or attribute)
  firstname varchar2(20) NOT NULL := 'Elis';
--����������� NOT NULL �� ��������� ����������
--���� �� �������������� ����� ������ PLS-00218: ����������, ����������� ��� NOT NULL, ������� ��������� ��������� ��������
  lastname firstname%TYPE := 'Pet';
-- ������� ������������ ���� ��� ������������� TYPE
-- Data type and size
-- Constraints (unless the referenced item is a column)
  v_listname employees.last_name%TYPE;
begin
  firstname := ' Elison';
  lastname := 'Cat';
end;
