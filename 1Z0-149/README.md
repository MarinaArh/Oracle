https://docs.oracle.com/en/database/oracle/oracle-database/19/lnpls/index.html

https://education.oracle.com/oracle-database-19c-program-with-pl-sql/pexam_1Z0-149

 **1. Declaring PL/SQL Variables**
 * [Recognize valid and invalid identifiers](https://github.com/MarinaArh/Oracle_cheat_sheets/blob/master/1Z0-149/identifiers.sql)
 * [List the uses of variables](https://github.com/MarinaArh/Oracle_cheat_sheets/blob/master/1Z0-149/WhereIsVariablesUsed.sql), [declare and initialize variables](), use bind variables
 * List and describe various data types using the [%TYPE](https://github.com/MarinaArh/Oracle_cheat_sheets/blob/master/1Z0-149/TypeAttribute.sql) and [%ROWTYPE](https://github.com/MarinaArh/Oracle_cheat_sheets/blob/master/1Z0-149/RowtypeAttribute.sql) attributes

 **2. Writing Executable Statements**
 * Identify lexical units in a PL/SQL block
 * Use built-in SQL functions in PL/SQL and sequences in PL/SQL expressions
 * Describe when implicit conversions take place and when explicit conversions have to be dealt with
 * Write nested blocks and qualify variables with labels
 * Write readable code with appropriate indentation

 **2. Writing SQL in PL/SQL**
* Create PL/SQL executable blocks using DML and transaction control statements
* Make use of the INTO clause to hold the values returned by a SQL statement

 **3. Writing Control Structures**
* Identify the uses and types of control structures (IF, CASE statements and expressions)
* Construct and identify loop statements
* Use EXIT and CONTINUE statements inside loops

 **4. Working with Composite Data Types**
* Create user-defined PL/SQL records
* Create a record with the %ROWTYPE attribute
* Create an INDEX BY table and INDEX BY table of records
* Describe the differences among records, collections, and collections of records
* Initialize collections and records

 **5. Using Explicit Cursors**
* Distinguish between implicit and explicit cursors and use SQL cursor attributes
* Declare and control explicit cursors, use simple loops and cursor FOR loops to fetch data
* Declare and use cursors with parameters
* Lock rows with the FOR UPDATE clause and reference the current row with the WHERE CURRENT OF clause

 **6. Handling Exceptions**
* Define PL/SQL exceptions
* Recognize unhandled exceptions
* Handle different types of exceptions (internally defined exceptions, predefined exceptions and user-defined exceptions)
* Propagate exceptions

 **7. Using PL/SQL Subprograms**
* Differentiate between anonymous blocks and subprograms
* Create a simple procedure and invoke it from an anonymous block
* Identify benefits of subprograms

 **8. Creating Procedures and Using Parameters**
* Create a procedure with parameterrs
* Use named notation
* Work with procedures (create, invoke and remove procedures)
* Handle exceptions in procedures and display a procedure's information

 **9. Creating Functions**
* Differentiate between a procedure and a function
* Describe the uses of functions
* Work with functions (create, invoke and remove functions)

 **10. Creating Packages**
* Identify the benefits and the components of packages
* Work with packages (create package specification and body, invoke package subprograms, remove a package and display package information)
* Overload package subprograms and use forward declarations

 **11. Working with Packages**
* Use package types and variables
* Use packaged constants and functions in SQL
* Use ACCESSIBLE BY to restrict access to package subprograms

 **12. Using Dynamic SQL**
* Describe the execution flow of SQL statements
* Use Native Dynamic SQL (NDS)
* Bind PL/SQL types in SQL statements

 **13. Design Considerations for PL/SQL Code**
* Create standard constants and exceptions
* Write and call local subprograms
* Control the run-time privileges of a subprogram
* Perform autonomous transactions
* Use NOCOPY hint, PARALLEL ENABLE hint and DETERMINISTIC clause
* Use bulk binding and the RETURNING clause with DML

 **14. Creating Compound, DDL, and Event Database Triggers**
* Create triggers on DDL statements
* Create triggers on system events
* Describe different types of triggers and their uses

 **15. Using the PL/SQL Compiler**
* Describe the PL/SQL compiler and features
* Use the PL/SQL compiler initialization parameters
* Use the PL/SQL compile time warnings

 **16. Managing PL/SQL Code**
* Describe and use conditional compilation
* Code-based access control: granting roles to program units
* Whitelist code access with the ACCESSIBLE BY clause
* Mark code as deprecated

 **17. Managing Dependencies**
* Track and manage procedural dependencies
