--����  order by ���� � �������, �� ��� ����������� ��������� ���� � ����������� ��� ���������, �.�. ��������� ��� ����� ���� �������� ��� ����������
select * 
from EMPLOYEES
order by 1
where manager_id is not null;
--ORA-00933: �������� ���������� SQL-�����������
--00933. 00000 -  "SQL command not properly ended"
/

--����������� ����� �� ����� ���� �� ������, ����������� � ������� (����������� ����� �� ����� �������, �� �������� � select list), ������ ��� ����������� ������ ���� � select list
--�� ��������� ������� ���������� ASC - asceding - �� �����������, ��� ����� �� ���������.
--�������  ���������� ����� �������� �� DESC - descending - �� ���������
--������� ������������ ��� ������� ���� - �.�. ���� ������� desc, �� ����������� ������ � ���� ��������, �� �������� ����� DESC
select job_id "JOB NAME", salary, commission_pct
from EMPLOYEES e
order by "JOB NAME" desc, FIRST_NAME, 2, e.department_id;
/

--����������� ����� ����� �� ��������� ��� ������� �� ����� ����� ������, �������� � ������ 
select * 
from EMPLOYEES
order by salary*(1+nvl(COMMISSION_PCT,0)) desc
/
select * from employees
order by mod(salary,3);
/

-- ���� ��������� �� ����, ����������� null, �� � asc ������� �� ��������� nulls last, � desc ������� �������� - �� ��������� nulls first
-- �.�. null ��������������� ��� ���������� ��������
select * 
from EMPLOYEES
where manager_id is not null
order by 9 desc nulls last, salary;
/
select * from EMPLOYEES
order by manager_id, commission_pct nulls first; --������ ���������
/

--���� � ������� ������������ DISTINCT, �� ����������� ����� �� �������� ������ �� ������ select
select distinct job_id 
from EMPLOYEES
order by salary
--ORA-01791: ��������� �� �������
--01791. 00000 -  "not a SELECTed expression"