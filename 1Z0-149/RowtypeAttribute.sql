--https://docs.oracle.com/en/database/oracle/oracle-database/19/lnpls/plsql-collections-and-records.html#GUID-EBF66B92-8A94-4E3A-A837-253D5DA79D5F
--Use the %ROWTYPE to declare a record that has the same structure (name, number and types of columns) as the specified table, view or cursor.
declare
--The %ROWTYPE attribute lets you declare a record variable that represents either a full or partial row of a database table or view.
--Declaring a Record Variable that Always Represents Full Row
  v_emp employees%ROWTYPE;
--%ROWTYPE Variable Does Not Inherit Initial Values or Constraints
--тип record; все поля записи инциализированы NULL

--Declaring a Record Variable that Can Represent Partial Row
--Можем всю строку или часть определить через курсор
  CURSOR emp_part_cur IS
    SELECT first_name, last_name, phone_number
    FROM employees;
    
  v_emp_part emp_part_cur%ROWTYPE; -- partial row of employees
  
  CURSOR emp_cur IS
   SELECT * FROM employees;
   
  v_emp_full emp_cur%ROWTYPE; -- includes all columns from EMPLOYEES
  
  CURSOR emp_dep_join IS
    SELECT employee_id, email, employees.manager_id, location_id
    FROM employees, departments
    WHERE employees.department_id = departments.department_id;
  
  v_join_rec emp_dep_join%ROWTYPE;  -- includes columns from two tables
  
begin
  null;
end;
