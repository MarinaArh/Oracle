--declare and initialize variables
--https://docs.oracle.com/en/database/oracle/oracle-database/19/lnpls/plsql-language-fundamentals.html#GUID-65F9E0D0-03CD-4C40-829A-7392ACE8F932
declare
  flag number(1); -- initial value is NULL by default
  amt number := 100;
  radius number DEFAULT 10;
--��� ��������� �������� �����������
  pi CONSTANT real := 3.14;
--���� ����� NOT NULL �� ���������������� �����������
--PLS-00218: ����������, ����������� ��� NOT NULL, ������� ��������� ��������� ��������
  firstname varchar2(20) not null := 'Elis' ;
  sq number := pi * radius**2;
begin

  dbms_output.put_line(flag);
  dbms_output.put_line(amt);
  dbms_output.put_line(radius);
  dbms_output.put_line(pi);
  dbms_output.put_line(firstname);
  dbms_output.put_line(sq);

--�������� ��������� ������ ������
--PLS-00363: ��������� 'PI' �� �.�. ������������ ��� ������� ����������
--  pi := 100;

--��� ���������� �������� ��� NOT NULL  ��� ������� ������ ���������� ������� ������
--ORA-06502: PL/SQL:  ������ ����� ��� ��������
--  firstname := '';
end;