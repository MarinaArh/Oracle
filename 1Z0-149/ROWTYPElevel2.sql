Create table tst_rowtype
(col1 number,
 col2 number,
 col3 number,
 col4 number GENERATED ALWAYS AS (col2*2+1)); --virtual column
--If the new column is a virtual column, its value is determined by its column expression. (Note that a virtual column's value is calculated only when it is queried.) 
insert into tst_rowtype (col1, col2, col3)
select level, level+1, level*2
from dual
connect by level <= 10;

commit;

select * from tst_rowtype;

alter table tst_rowtype modify (col2 invisible); -- столбец используетс€ дл€ вычислени€ вирт.столбца: он может быть invisible, но не может быть unused
alter table tst_rowtype set unused (col3);

select * from tst_rowtype;

declare
 v_row tst_rowtype%ROWTYPE;
begin
 select * into v_row from tst_rowtype where col1 = 10;
 DBMS_OUTPUT.PUT_LINE(v_row.col1);
-- DBMS_OUTPUT.PUT_LINE(v_row.col2); error PLS-00302: компонента 'V_ROW.COL2' должна быть объ€влена
-- т.к. столбец invisible чтобы сделать видимым ALTER TABLE t MODIFY (c VISIBLE);
-- DBMS_OUTPUT.PUT_LINE(v_row.col3); error PLS-00302: компонента 'COL3' должна быть объ€влена
 DBMS_OUTPUT.PUT_LINE(v_row.col4);
 
 v_row.col1 := v_row.col1**2;
 v_row.col4 := null;
 
-- insert into tst_rowtype values v_row; ORA-54013: ќпераци€ INSERT дл€ виртуальных столбцов запрещена
 insert into tst_rowtype (col1) values (v_row.col1);
 commit;
end;

select * from tst_rowtype;

drop table tst_rowtype;