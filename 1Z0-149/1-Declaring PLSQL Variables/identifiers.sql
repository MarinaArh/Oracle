--https://docs.oracle.com/en/database/oracle/oracle-database/19/lnpls/plsql-language-fundamentals.html#GUID-321084DE-3BDD-484B-AE85-7A991B67C51A
--Recognize valid and invalid identifiers
--Part 1. Ordinary User-Defined Identifiers 
 /*
   1) Must begins with a letter
   2) Can include letters, digits, and these symbols: Dollar sign ($), Number sign (#), Underscore (_)
   3) Is not a reserved word:
          select * from V$RESERVED_WORDS 
          where reserved = 'Y'
          order by keyword
          
   if version >= 12.2 then limit := '128 bytes';
   else limit := '30 bytes';
   end if;
   
 */
declare 
-- +
 cost integer := 11;
 --Cost integer := 12;
 cost2 integer;
 Order_count number(10) := 100;
 account_number varchar2(20);
 account#group$ varchar2(5);
 case$$ varchar2(10);
 flag#type boolean;
-- -
 -- 1cost integer;
 -- $cost integer;
 -- account/gr integer;
 -- as integer;
  
--Part 2. Quoted User-Defined Identifiers
--A quoted user-defined identifier is enclosed in double quotation marks.
--Ћимит такой же, исключа€ двойные кавычки
--ƒругих правил тут нет
--case-sensitive
-- +
  "1cost" integer;
  "$cost" integer := 21;
  "$Cost" integer := 22;
  "account/gr" integer;
  "As" integer;
  "    " varchar2(100) := 'Very strange identifier';
--If a quoted user-defined identifier, without its enclosing double quotation marks, is a valid ordinary user-defined identifier, 
--then the double quotation marks are optional in references to the identifier, and if you omit them, then the identifier is case-insensitive.
--работает только дл€ идентификатора, объ€вленного в верхнем регистре
--наши идентификаторы объ€вленные без двойных кавычек автоматически преобразуютс€ как идентификатор в верхнем регистре
  "ORDER_TOTAL" number(10,2) := 100.67;
--  order_total number(10,2) := 200.51; здесь логично получаем ошибку PLS-00371: дл€ 'ORDER_TOTAL' разрешаетс€ задать не более одного объ€влени€
begin
  dbms_output.put_line(Cost);
--Ordinary User-Defined Identifiers are case-insensitive
  dbms_output.put_line(order_count);
  dbms_output.put_line(ORDER_COUNT);
  dbms_output.put_line(Order_Count);
  dbms_output.new_line();
/**********************************************/
--помнить о том, что строки только в одинарных кавычках!
  dbms_output.put_line("$cost");
  dbms_output.put_line("$Cost");
  dbms_output.put_line("    ");
  dbms_output.put_line(Order_Total);
end;
/
