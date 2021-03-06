-- https://docs.oracle.com/en/database/oracle/oracle-database/19/lnpls/plsql-control-statements.html#GUID-4CD12F11-2DB8-4B0D-9E04-DF983DCF9358
-- 4 ���� ������
/*
Basic LOOP
FOR LOOP
Cursor FOR LOOP
WHILE LOOP

exit, exit when �����������/�������� ����� �� �����
continue/continue when �����������/�������� ����� �� ������� �������� ����� (� ������� �� ���������)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            */
declare
 i pls_integer;
 j pls_integer;
 n pls_integer;
begin
--1. Basic LOOP
--�� ������� ����������� ������ ��� ��� ������� �������, ���� ������������ exit
 i := 0;
 LOOP
  i := i+1;
  if i > 3 then exit;
  end if;
 END LOOP;

--��� �������� ����� REPEAT UNTIL
 i := 0;
 LOOP
  i := i+1;
  exit when i > 3;
 END LOOP;

--��� ��������� ������ ������������� ������ ����� ��� ��������� ������������� ����
 i := 0;
 <<outer_loop>>
 LOOP
  i := i + 1;
  j := 0;
  <<inner_loop>>
  LOOP
   j := j*2 + i;
   dbms_output.put_line('j='||to_char(j));
   exit when j > 10;
  END LOOP;
  dbms_output.put_line('i='||to_char(i));
  exit when i = 1;
 END LOOP;
 
 --����� �� �������� ����� �� exit when ����� ���� �������� �� ���������� �����, �� ������ ���� � �������� ����� ���� �����
  i := 0;
 <<outer_loop1>>
 LOOP
  i := i + 1;
  j := 0;
  <<inner_loop1>>
  LOOP
   j := j*2 + i;
   dbms_output.put_line('j='||to_char(j));
   exit when j > 10;
   exit outer_loop1 when i = 2;
  END LOOP;
  dbms_output.put_line('i='||to_char(i));  
 END LOOP;
--���������� �� ���������, ��� � ������ ����� � � ����� ����� ���������� �����, � ����� (�.�. ����� end loop) ����� ���� �����, � ����� � �� ���� ������, �� �����, ��� ��� �� ���-�� ������

--2. FOR LOOP
dbms_output.put_line('FOR LOOP');
dbms_output.put_line('--1--');
 FOR inx IN 1..3 LOOP
  dbms_output.put_line('inx='||to_char(inx));
 END LOOP;
 
dbms_output.put_line('--2--');
 FOR inx IN REVERSE 1..3 LOOP
  dbms_output.put_line('inx='||to_char(inx));
 END LOOP;
 
--������ ������ ������ ������� ������� lower_bound, � ����� ������� upper_bound, ���� � REVERSE ����� ���� �� ���������� 
dbms_output.put_line('--3--');
 FOR inx IN REVERSE 3..1 LOOP
  dbms_output.put_line('inx='||to_char(inx));
 END LOOP;
 
--� PL/SQL ��� ������ = 1, ���� ����� ������ ���, �� ���� �����������, ��������, ���������� ��� ������ ����� �� 10 
dbms_output.put_line('--4--');
 FOR inx IN 1..5 LOOP
  dbms_output.put_line('inx='||to_char(inx*2));
 END LOOP;
 
--���������� ����� ����������� ������ ������ PLS-00363: ��������� 'INX' �� �.�. ������������ ��� ������� ���������� 
--The statements in the loop can read the value of the index, but cannot change it. 
--The index of a FOR LOOP statement is implicitly declared as a variable of type PLS_INTEGER that is LOCAL to the loop. 
--��������� ��������� ��� �����, �� �� ����� ���� ������������ �� ��� � ������� ��������� ���������� ������
--������ �� ������ ����� ����� ���� ��������� ���������� � ����� �� ������, �� � ������� ��������� ������
 <<outer_loop2>>
  FOR i IN 1..3 LOOP
    <<inner_loop2>>
    FOR i IN 1..3 LOOP
      IF outer_loop2.i = 3 THEN
        DBMS_OUTPUT.PUT_LINE('outer: ' || TO_CHAR(outer_loop2.i) || ' inner: ' || TO_CHAR(inner_loop2.i));
      END IF;
    END LOOP inner_loop2;
  END LOOP outer_loop2;
--����� ��������� ����� �� ����, �� ����� ���������� � ��� ���������� ����� �����

--������� ����� ����� ���������� ����� �������� �������, ���������� ��� ���������
--exit � continue �������� �����
 n := 5;
 FOR i in n..n*2 LOOP
   continue when i = 7;
   dbms_output.put_line('i='||to_char(i));
 END LOOP;  

--3. WHILE LOOP
--���� ������� ������� ���� �����������
--exit � continue ����������
 WHILE n < 10 LOOP
  dbms_output.put_line('n='||to_char(n));
  n := n+1;
 END LOOP;
 end;