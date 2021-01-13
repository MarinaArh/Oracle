--https://docs.oracle.com/en/database/oracle/oracle-database/19/lnpls/plsql-control-statements.html#GUID-B7DD4E62-3ED2-41E9-AAE5-90A78788BB31
/*                                  ���� ��� ���� �������� ����������� - IF � CASE                  */

declare 
  nAge number DEFAULT trunc(dbms_random.value(0, 120));
  age_group varchar2(100);
  
  mark number := trunc(dbms_random.value(2,5));
  markName varchar2(20);
  
  flag boolean;
begin
  DBMS_OUTPUT.PUT_LINE(nAge);
/*                                           IF                                 */  

-- ������� 1. IF-THEN
-- ���� �� �������� �� �������, �� ������ ������ �� ����� ���������
  if nAge < 18 then
   age_group := '�������';
  end if;
 dbms_output.put_line('1 ' || age_group);
 
-- ������� 2. IF-THEN-ELSE
-- ���� ��������� TRUE, �� ��� �� ����� then � ������ ������ (FALSE, NULL) ���� �� else
  if nAge > 90 then
   age_group := '�����������';
  else
   age_group := '���� �� �����������';
  end if;
 dbms_output.put_line('2 ' || age_group);
 
-- ������� 3. IF-THEN-ELSIF
-- ����������� ��� ������� ������� TRUE, ��������� �� ����������� � �� �����������
  if nAge < 18 then
     age_group := '�������';
  elsif nAge between 18 and 44 then
     age_group := '���������';
  elsif nAge between 45 and 59 then
     age_group := '������� �������';
  elsif nAge between 60 and 74 then
     age_group := '������� �������';
  elsif nAge between 75 and 90 then
     age_group := '��������';
  elsif nAge > 90 then
     age_group := '�����������';
  end if;

  DBMS_OUTPUT.PUT_LINE('3 ' || age_group);
  DBMS_OUTPUT.NEW_LINE;
/*                                      CASE                                    */
--One big difference from using IF, is that a CASE statement can result in the "ORA-06592: CASE not found while executing CASE statement" error if all WHEN clauses evaluate to FALSE AND ELSE clause is omit

-- Type 1. Simple CASE statement
-- selector �������������� ������������ � selector_value, ����� ������� ���������� ������������ ���������� ������������
  DBMS_OUTPUT.PUT_LINE(mark);
  CASE mark -- selector
   WHEN 5 --selector_value 
       THEN DBMS_OUTPUT.PUT_LINE('�������');
   WHEN 4 
       THEN DBMS_OUTPUT.PUT_LINE('������');
   WHEN 3 
       THEN DBMS_OUTPUT.PUT_LINE('�����������������');
   WHEN 2 
       THEN DBMS_OUTPUT.PUT_LINE('�������������������');
   ELSE DBMS_OUTPUT.PUT_LINE('��� ����� ������');
  END CASE;

--Type 2. Searched CASE Statement
-- ����� �������� ���������� � �� ���������� � �� ������
  CASE WHEN mark = 5 --condition_1 
       THEN DBMS_OUTPUT.PUT_LINE('�������');
   WHEN mark = 4 
       THEN DBMS_OUTPUT.PUT_LINE('������');
   WHEN mark =3 
       THEN DBMS_OUTPUT.PUT_LINE('�����������������');
   WHEN mark =2 
       THEN DBMS_OUTPUT.PUT_LINE('�������������������');
   ELSE DBMS_OUTPUT.PUT_LINE('��� ����� ������');
  END CASE;

--������� �������� CASE-STATEMENT � CASE-EXPRESSION: ����� �� ����������� ��������� CASE ����������, �� ������ �� �����, � ���������� ���������� NULL
  mark := 1;
  markName := 
  CASE mark -- selector
   WHEN 5 --selector_value 
       THEN '�������'
   WHEN 4 
       THEN '������'
   WHEN 3 
       THEN '�����������������'
   WHEN 2 
       THEN '�������������������'
  END;
  DBMS_OUTPUT.PUT_LINE('markName = '||markName);
  
  DBMS_OUTPUT.NEW_LINE;
/*                                     GUIDELINES                               */

--assign the value of the BOOLEAN expression directly to a BOOLEAN variable
 flag := 4 = 2*2;
 flag := 5 between 1 and 10;
 flag := 5 != 2*2 or 5 between 1 and 10;
 
/*A BOOLEAN expression returns TRUE, FALSE, or NULL. The simplest BOOLEAN expression is a BOOLEAN literal, constant, or variable, but they can also have a more complex form, such as:
NOT boolean_expression
boolean_expression relational_operator boolean_expression
boolean_expression { AND | OR } boolean_expression
BOOLEAN expressions usually appear as conditions in control statements (IF and CASE) and in WHERE clauses of DML statements.*/

--If the purpose of the IF statement is to assign a value to a variable, then use a CASE expression. IF is always a statement, and thus cannot be embedded inside an expression.
--With CASE, I can get all the work done in a single statement.
 DBMS_OUTPUT.PUT_LINE(case when flag then 'TRUE' else 'FALSE' end);

--If you have a long list of ELSIF clauses comparing values, consider switching to CASE.

--A BOOLEAN variable is either TRUE, FALSE, or NULL. Do not write some_variable = TRUE (flag = TRUE), instead write:
 if flag then
   DBMS_OUTPUT.PUT_LINE('I''m good with math');
 end if;

--A BOOLEAN expression that includes a NULL value will evaluate to NULL. Remember that NULL is never true and never false. It is "unknown."
 mark := NULL;
 if not (mark < 1) then
  dbms_output.put_line('we are in THEN-part');
 else
  dbms_output.put_line('we are in ELSE-part');
 end if;
end;