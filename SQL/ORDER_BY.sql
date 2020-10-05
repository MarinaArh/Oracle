--если  order by есть в запросе, то это обязательно последнее поле и выполняется оно последним, т.к. сортируем уже после всех действий над множеством
select * 
from EMPLOYEES
order by 1
where manager_id is not null;
--ORA-00933: неверное завершение SQL-предложения
--00933. 00000 -  "SQL command not properly ended"
/

--сортировать можно по имени поля из таблиц, участвующих в запросе (сортировать можно по полям таблицы, не входящим в select list), алиасу или порядковому номеру поля в select list
--по умолчанию порядок сортировки ASC - asceding - по возрастанию, его можно не указывать.
--порядок  сортировки можно изменить на DESC - descending - по убываюнию
--порядок индивидуален для каждого поля - т.е. если указано desc, то применяется только к тому элементу, за которомы стоит DESC
select job_id "JOB NAME", salary, commission_pct
from EMPLOYEES e
order by "JOB NAME" desc, FIRST_NAME, 2, e.department_id;
/

--сортировать можно также по выражению или функции от любых полей таблиц, входящих в запрос 
select * 
from EMPLOYEES
order by salary*(1+nvl(COMMISSION_PCT,0)) desc
/
select * from employees
order by mod(salary,3);
/

-- если сортируем по полю, содержащему null, то в asc порядке по умолчанию nulls last, в desc порядке наоборот - по умолчанию nulls first
-- т.е. null рассматривается как наибольшее значение
select * 
from EMPLOYEES
where manager_id is not null
order by 9 desc nulls last, salary;
/
select * from EMPLOYEES
order by manager_id, commission_pct nulls first; --меняем умолчание
/

--если в запросе используется DISTINCT, то сортировать можно по столбцам только из списка select
select distinct job_id 
from EMPLOYEES
order by salary
--ORA-01791: выражение не выбрано
--01791. 00000 -  "not a SELECTed expression"