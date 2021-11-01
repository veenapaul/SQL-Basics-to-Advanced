# SQL-Basics-to-Advanced

Database
--------

**Create database**

    CREATE DATABASE database_name
    
Eg: CREATE DATABASE testDB;

**Drop DATABASE**


    DROP DATABASE database_name;
    
Eg: DROP DATABASE testDB;

**Back up Database**


     BACKUP DATABASE database_name 
     
     TO DISK=’filepath’;
     
Eg: 

     BACKUP DATABASE testDB
     TO DISK = 'D:\backups\testDB.bak';

**Differential Back up**

It only back up part of database that has changed after last back up
    
    BACKUP DATABASE database _name
    WITH DIFFERENTIAL;
Eg:

   BACKUP DATABASE testDB
   TO DISK = 'D:\backups\testDB.bak'
   WITH DIFFERENTIAL;

Table
----- 

**Create table**
 
  
      CREATE TABLE table_name;


Creating table and inserting values

      CREATE TABLE Company (
         Id CHAR(10) PRIMARY KEY
	,Countrty CHAR(15) NOT NULL
	,Region CHAR(15) NOT NULL
	,PIN INT NOT NULL
	);

      INSERT INTO dbo.Company
        VALUES (
	'123'
	,'india'
	,'kerala'
	,'683572'
	);

**Inserting multiple rows**

The following statement inserts multiple rows to the sales.promotions table:

     INSERT INTO sales.promotions (
    promotion_name,
    discount,
    start_date,
    expired_date
    )
    VALUES
    (
        '2019 Summer Promotion',
        0.15,
        '20190601',
        '20190901'
    ),
    (
        '2019 Fall Promotion',
        0.20,
        '20191001',
        '20191101'
    ),
    (
        '2019 Winter Promotion',
        0.25,
        '20191201',
        '20200101'
    );


**Alter table and add new column**

    ALTER TABLE table_name
    Add column name
    
Eg: 
  
    ALTER TABLE Customers 
    ADD Email VARCHAR(255);
    
 **Drop Table**
 
   Drop TABLE table_name
   
Eg:   
   
   DROP TABLE Customers;

SQL Server Identity
-------------------

To create an identity column for a table, you use the IDENTITY property as follows:

    IDENTITY[(seed,increment)]
    
In this syntax:
•	The seed is the value of the first row loaded into the table.
•	The increment is the incremental value added to the identity value of the previous row.
The default value of seed and increment is 1 i.e., (1,1). It means that the first row, which was loaded into the table, will have the value of one, the second row will have the value of 2 and so on.
Suppose, you want the value of the identity column of the first row is 10 and incremental value is 10, you use the following syntax:
IDENTITY (10,10)

TRUNCATE TABLE statement AND DELETE 
-----------------------------------
Delete
It can be used in 2 ways
Sometimes, you want to delete all rows from a table. In this case, you typically use the DELETE statement without a WHERE clause.
The following example creates a new table named customer_groups and inserts some rows into the table:

       CREATE TABLE sales.customer_groups (
       group_id INT PRIMARY KEY IDENTITY,
       group_name VARCHAR (50) NOT NULL
       );

      INSERT INTO sales.customer_groups (group_name)
      VALUES
      ('Intercompany'),
      ('Third Party'),
      ('One time');
      
To delete all rows from the customer_groups table, you use the DELETE statement as follows:

      DELETE FROM sales.customer_groups;
      
      or 
      
To delete a specific row  from the customer_groups table  

      DELETE FROM sales.customer_groups where groip name='Third Party';
      
Besides the DELETE FROM statement, you can use the TRUNCATE TABLE statement to delete all rows from a table.

The following illustrates the syntax of the TRUNCATE TABLE statement:

    TRUNCATE TABLE [database_name.][schema_name.]table_name;
      
In this syntax, first, you specify the name of the table from which you want to delete all rows. Second, the database name is the name of the database in which the table was created. The database name is optional. If you skip it, the statement will delete the table in the currently connected database.
The following statements first insert some rows into the customer_groups table and then delete all rows from it using the TRUNCATE TABLE statement:

    INSERT INTO sales.customer_groups (group_name)
     VALUES
    ('Intercompany'),
    ('Third Party'),
    ('One time');   

    TRUNCATE TABLE sales.customer_groups;
    
The TRUNCATE TABLE is similar to the DELETE statement without a WHERE clause. However, the TRUNCATE statement executes faster and uses a fewer system and transaction log resources.

| **DELETE COMMAND** |  **TRUNCATE COMMAND** |
| --- | --- |
| Delete command is useful to delete all or specific rows from a table specified using a Where clause | The truncate command removes all rows of a table. We cannot use a Where clause in this. |
| It is a DML command | It is a DDL command.  |
| SQL Delete command places lock on each row requires to delete from a table.| SQL Truncate command places a table and page lock to remove all records.  |
| Delete command logs entry for each deleted row in the transaction log..| The truncate command does not log entries for each deleted row in the transaction log.  |
| Delete command is slower than the Truncate command.| It is faster than the delete command.  |                                                                  
| It removes rows one at a time.| It removes all rows in a table by deallocating the pages that are used to store the table data  | 
| It retains the identity and does not reset it to the seed value.| Truncate command reset the identity to its seed value. | 
| It retains the identity and does not reset it to the seed value.| Truncate command reset the identity to its seed value. | 
| It requires more transaction log space than the truncate command.| It requires less transaction log space than the delete command. | 
| You require delete permission on a table to use this| You require Alter table permissions to truncate a table.| 
| You can use the Delete statement with the indexed views.| You cannot use the truncate command with the indexed views.| 
| Delete command retains the object statistics and allocated space.|Truncate deallocates all data pages of a table. Therefore, it removes all statistics and allocated space as well.| 
 | Delete command can activate a trigger as well. Delete works on individual rows and delete the data. Therefore, it activates a trigger.|The truncate command cannot activate a trigger. The trigger is activated if any row modification takes place. In this command, SQL Server deallocates all pages, so it does not activate a trigger.
 | Delete command removes the rows matched with the where clause. It also does not remove the columns, indexes, constraints, schema|The truncate command only removes all rows of a table. It does not remove the columns, indexes, constraints, and schema.| 
 
SQL Server DROP TABLE
---------------------

Sometimes, you want to remove a table that is no longer in use. To do this, you use the following DROP TABLE statement:
        
     DROP TABLE [IF EXISTS]  [database_name.][schema_name.]table_name;
     
In this syntax:
•	First, specify the name of the table to be removed.

•	Second, specify the name of the database in which the table was created and the name of the schema to which the table belongs. The database name is optional. If you skip it, the DROP TABLE statement will drop the table in the currently connected database.

•	Third, use IF EXISTS clause to remove the table only if it exists. The IF EXISTS clause has been supported since SQL Server 2016 13.x. If you remove a table that does not exist, you will get an error. The IF EXISTS clause conditionally removes the table if it already exists.

When SQL Server drops a table, it also deletes all data, triggers, constraints, permissions of that table. Moreover, SQL Server does not explicitly drop the views and stored procedures that reference the dropped table. Therefore, to explicitly drop these dependent objects, you must use the DROP VIEW and DROP PROCEDURE statement.

SQL Server allows you to remove multiple tables at once using a single DROP TABLE statement as follows:

     DROP TABLE [database_name.][schema_name.]table_name_1,
             
    [schema_name.]table_name_2, …
    [schema_name.]table_name_n;
    Drop Table
    DROP table_name;

Eg: 
    DROP TABLE Shippers;
    
SQL Server DROP TABLE examples

Let’s see some examples of using the SQL Server DROP TABLE statement.
A) Drop a table that does not exist

The following statement removes a table named revenues in the sales schema:

    DROP TABLE IF EXISTS sales.revenues;
    
In this example, the revenues table does not exist. Because it uses the IF EXISTS clause, the statement executes successfully with no table deleted.

B) Drop a single table example
The following statement creates a new table named delivery in the sales schema:

    CREATE TABLE sales.delivery (
    delivery_id INT PRIMARY KEY,
    delivery_note VARCHAR (255) NOT NULL,
    delivery_date DATE NOT NULL
    );
    
To remove the delivery table, you use the following statement:

    DROP TABLE sales.delivery;
    
C) Drop a table with a foreign key constraint example
The following statement creates two new tables named supplier_groups and suppliers in the procurement schema:

    CREATE SCHEMA procurement;
    GO

   CREATE TABLE procurement.supplier_groups (
    group_id INT IDENTITY PRIMARY KEY,
    group_name VARCHAR (50) NOT NULL
    );

    CREATE TABLE procurement.suppliers (
    supplier_id INT IDENTITY PRIMARY KEY,
    supplier_name VARCHAR (50) NOT NULL,
    group_id INT NOT NULL,
    FOREIGN KEY (group_id) REFERENCES procurement.supplier_groups (group_id)
    );
    
Let’s try to drop the supplier_groups table:

    DROP TABLE procurement.supplier_groups;
    
SQL Server issued the following error:

Could not drop object 'procurement.supplier_groups' because it is referenced by a FOREIGN KEY constraint.

SQL Server does not allow you to delete a table that is referenced by a foreign constraint. To delete this table, you must drop the referencing foreign key constraint or referencing table first. In this case, you have to drop the foreign key constraint in the  suppliers table or the  suppliers table first before removing the supplier_groups table.

     DROP TABLE procurement.supplier_groups;
     DROP TABLE procurement.suppliers;
     
If you use a single DROP TABLE statement to remove both tables, the referencing table must be listed first as shown in the query below:

     DROP TABLE procurement.suppliers, procurement.supplier_groups;


UPDATE table
------------

To modify existing data in a table, you use the following UPDATE statement:

     UPDATE table_name
     SET c1 = v1, c2 = v2, ... cn = vn
     [WHERE condition]
     
     
In this syntax:

•	First, specify the name of the table from which the data is to be updated.

•	Second, specify a list of column c1, c2, …, cn and values v1, v2, … vn to be updated.

•	Third, specify the conditions in the WHERE clause for selecting the rows that are updated. The WHERE clause is optional. If you skip the WHERE clause, all rows in the table are updated.

 Udate a single column in all rows
 ---------------------------------

The following statement updates a single column for all rows in the taxes table:

      UPDATE sales.taxes
      SET updated_at = GETDATE();
      
In this example, the statement changed the values in the updated_at column to the system date time returned by the GETDATE() function.

Another eg:

      UPDATE Customers
      SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
      WHERE CustomerID = 1;

Update multiple columns 
-----------------------
The following statement increases the max local tax rate by 2% and the average local tax rate by 1% for the states that have the max local tax rate 1%.
    
    UPDATE sales.taxes
    SET max_local_tax_rate += 0.02,
    avg_local_tax_rate += 0.01
    WHERE
    max_local_tax_rate = 0.01;
    
    
**PRIMARY KEY AND FOREIGN KEY**

Primary keys and foreign keys are two types of constraints that can be used to enforce data integrity in SQL Server tables.

A table typically has a column or combination of columns that contain values that uniquely identify each row in the table. This column, or columns, is called the primary key (PK) of the table and enforces the entity integrity of the table. Because primary key constraints guarantee unique data, they are frequently defined on an identity column.

•A table can contain only one primary key constraint.

•A primary key cannot exceed 16 columns and a total key length of 900 bytes.

•If clustered or nonclustered is not specified for a primary key constraint, clustered is used if there no clustered index on the table.

•All columns defined within a primary key constraint must be defined as not null. If nullability is not specified, all columns participating in a primary key constraint have their nullability set to not null.

Create Primary Key

    CREATE TABLE Persons (
    ID int NOT NULL
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
    CONSTRAINT PK_Person PRIMARY KEY (ID)
    );        

   ALTER TABLE Persons
   Add Constraint Pk_Persons PRIMARY KEY(ID);


   ALTER TABLE Persons
   DROP CONSTRAINT Pk_persons;
 
 OR for multiple columns

    CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
   );

    
To alter primary key
--------------------
For altering one primary key

   ALTER TABLE Persons
   ADD PRIMARY KEY (ID);
   
For altering multiple primary key
---------------------------------

  ALTER TABLE Persons
  ADD CONSTRAINT PK_Person PRIMARY KEY (ID, Last Name);

To drop Primary key
-------------------

  ALTER TABLE Persons
  DROP CONSTRAINT PK_Person;

To drop multiple PRIMARY KEY
----------------------------

  ALTER TABLE Persons
  DROP CONSTRAINT PK_Person PRIMARY KEY(ID, Last Name);
  
Foreign Key
-----------
A foreign key (FK) is a column or combination of columns that is used to establish and enforce a link between the data in two tables to control the data that can be stored in the foreign key table. In a foreign key reference, a link is created between two tables when the column or columns that hold the primary key value for one table are referenced by the column or columns in another table. This column becomes a foreign key in the second table.
Unlike primary key constraints, creating a foreign key constraint does not automatically create a corresponding index. However, manually creating an index on a foreign key is often useful for the following reasons:

•Foreign key columns are frequently used in join criteria when the data from related tables is combined in queries by matching the column or columns in the foreign key constraint of one table with the primary or unique key column or columns in the other table. An index enables the Database Engine to quickly find related data in the foreign key table. However, creating this index is not required. Data from two related tables can be combined even if no primary key or foreign key constraints are defined between the tables, but a foreign key relationship between two tables indicates that the two tables have been optimized to be combined in a query that uses the keys as its criteria.

•Changes to primary key constraints are checked with foreign key constraints in related tables.

To Create Foriegn Key
--------------------

    CREATE TABLE Orders (
    OrderID int NOT NULL , 
    OrderNumber int NOT NULL,
    CONSTRAINT PK_Orders PRIMARY KEY (OrderID)
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
    );

    ALTER TABLE Orders
    ADD CONSTRAINT Fk_PersonID
    FOREIGN KEY (PersonID) REFERENCES Persons(ID);

    ALTER Table Orders
    DROP CONSTRAINT Fk_orders;

                         OR for multiple coloumns
			 
    CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
    );


UNIQUE KEY CONSTRAINT
--------------------

A table can have, only one primary key. If you want to enforce uniqueness on 2 or more columns, then we use unique key constraint.

1. A table can have only one primary key, but more than one unique key
2. Primary key does not allow nulls, where as unique key allows one null

       alter table production.categories
       add constraint category_name UNIQUE(category_name);

To drop the constraint
----------------------

1. Right click the constraint and delete.

Or

2. Using a query

       alter table production.categories
    
       DROP CONSTRAINT[category_name]


Check constraint
----------------

    CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18)
    );

    CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
    );
    

SQL Server Rename Table
-----------------------

SQL Server does not have any statement that directly renames a table. However, it does provide you with a stored procedure named sp_rename that allows you to change the name of a table.
The following shows the syntax of using the sp_rename stored procedure for changing the name of a table:

  EXEC sp_rename 'old_table_name', 'new_table_name'
  
Note that both the old and new name of the table whose name is changed must be enclosed in single quotations.
Let’s see the following example.

First, create a new table named sales.contr for storing sales contract’s data:

    CREATE TABLE sales.contr (
    contract_no INT IDENTITY PRIMARY KEY,
    start_date DATE NOT NULL,
    expired_date DATE,
    customer_id INT,
    amount DECIMAL (10, 2)
    ); 
    
Second, use the sp_rename stored procedure to rename the sales.contr table to contracts in the sales schema:

    EXEC sp_rename 'sales.contr', 'contracts';
    
SQL Server returns the following message:
Caution: Changing any part of an object name could break scripts and stored procedures.
However, it renamed the table successfully.

SQL Server rename table using SSMS
----------------------------------
Another way to rename a table is to use the function provided by SQL Server Management Studio.
The following example illustrates how to rename the product_history table to product_archive.

<![image](https://user-images.githubusercontent.com/58709774/136784761-9b8bbcbc-e1f0-4b8f-b9ab-4d31e4af4371.png)>

First, right-click on the table name and choose Rename menu item:
  
Second, type the new name of the table e.g., product_archive and press Enter:
 
Primary Key and Foreign key
--------------------------


Create Schema
-------------

A schema is a collection of database objects including tables, views, triggers, stored procedures, indexes, etc. A schema is associated with a username which is known as the schema owner, who is the owner of the logically related database objects.

A schema always belongs to one database. On the other hand, a database may have one or multiple schemas. For example, in our BikeStores sample database, we have two schemas: sales and production. 

An object within a schema is qualified using the schema_name.object_name format like sales.orders. Two tables in two schemas can share the same name so you may have hr.employees and sales.employees.

Built-in schemas in SQL Server
-----------------------------

SQL Server provides us with some pre-defined schemas which have the same names as the built-in database users and roles, for example: dbo, guest, sys, and INFORMATION_SCHEMA.

The default schema for a newly created database is dbo, which is owned by the dbo user account. By default, when you create a new user with the CREATE USER command, the user will take dbo as its default schema.

SQL Server CREATE SCHEMA statement overview

The CREATE SCHEMA statement allows you to create a new schema in the current database.
The following illustrates the simplified version of the CREATE SCHEMA statement:
CREATE SCHEMA schema_name
    [AUTHORIZATION owner_name]
In this syntax,
•	First, specify the name of the schema that you want to create in the CREATE SCHEMA clause.
•	Second, specify the owner of the schema after the AUTHORIZATION keyword.
SQL Server CREATE SCHEMA statement example
The following example shows how to use the CREATE SCHEMA statement to create the customer_services schema:
CREATE SCHEMA customer_services;
GO
Once you execute the statement, you can find the newly created schema under the Security > Schemas of the database name.
If you want to list all schemas in the current database, you can query schemas from the sys.schemas as shown in the following query:
SELECT 
    s.name AS schema_name, 
    u.name AS schema_owner
FROM 
    sys.schemas s
INNER JOIN sys.sysusers u ON u.uid = s.principal_id
ORDER BY 
    s.name;

After having the customer_services schema, you can create objects for the schema. For example, the following statement creates a new table named jobs in the customer_services schema:

CREATE TABLE customer_services.jobs(
    job_id INT PRIMARY KEY IDENTITY,
    customer_id INT NOT NULL,
    description VARCHAR(200),
    created_at DATETIME2 NOT NULL
);

SQL Server ALTER SCHEMA
The ALTER SCHEMA statement allows you to transfer a securable from a schema to another within the same database.
Note that a securable is a resource to which the Database Engine authorization system controls access. For instance, a table is a securable.
The following shows the syntax of the ALTER SCHEMA statement:
ALTER SCHEMA target_schema_name   
    TRANSFER [ entity_type :: ] securable_name;
In this syntax:
•	target_schema_name is the name of a schema in the current database, into which you want to move the object. Note that it cannot be SYS or INFORMATION_SCHEMA.
•	The entity_type can be Object, Type or XML Schema Collection. It defaults to Object. The entity_type represents the class of the entity for which the owner is being changed.
•	object_name is the name of the securable that you want to move into the target_schema_name.
If you move a stored procedure, function, view, or trigger, SQL Server will not change the schema name of these securables. Therefore, it is recommended that you drop and re-create these objects in the new schema instead of using the ALTER SCHEMA statement for moving.
If you move an object e.g., table or synonym, SQL Server will not update the references for these objects automatically. You must manually modify the references to reflect the new schema name. For example, if you move a table that is referenced in a stored procedure, you must modify the stored procedure to reflect the new schema name.
SQL Server ALTER SCHEMA example
First, create a new table named offices in the dbo schema:
CREATE TABLE dbo.offices
(
    office_id      INT
    PRIMARY KEY IDENTITY, 
    office_name    NVARCHAR(40) NOT NULL, 
    office_address NVARCHAR(255) NOT NULL, 
    phone          VARCHAR(20),
);
Next, insert some rows into the dob.offices table:
INSERT INTO 
    dbo.offices(office_name, office_address)
VALUES
    ('Silicon Valley','400 North 1st Street, San Jose, CA 95130'),
    ('Sacramento','1070 River Dr., Sacramento, CA 95820');
Then, create a stored procedure that finds office by office id:
CREATE PROC usp_get_office_by_id(
    @id INT
) AS
BEGIN
    SELECT 
        * 
    FROM 
        dbo.offices
    WHERE 
        office_id = @id;
END;
After that, transfer this dbo.offices table to the sales schema:
ALTER SCHEMA sales TRANSFER OBJECT::dbo.offices;  
If you execute the usp_get_office_by_id stored procedure, SQL Server will issue an error:
Msg 208, Level 16, State 1, Procedure usp_get_office_by_id, Line 5 [Batch Start Line 30]
Invalid object name 'dbo.offices'.
Finally, manually modify the stored procedure to reflect the new schema:
ALTER PROC usp_get_office_by_id(
    @id INT
) AS
BEGIN
    SELECT 
        * 
    FROM 
        sales.offices
    WHERE 
        office_id = @id;
END;

SQL Server DROP SCHEMA
The DROP SCHEMA statement allows you to delete a schema from a database. The following shows the syntax of the DROP SCHEMA statement:
DROP SCHEMA [IF EXISTS] schema_name;
In this syntax:
•	First, specify the name of the schema that you want to drop. If the schema contains any objects, the statement will fail. Therefore, you must delete all objects in the schema before removing the schema.
•	Second, use the IF EXISTS option to conditionally remove the schema only if the schema exists. Attempting to drop a nonexisting schema without the IF EXISTS option will result in an error.
SQL Server DROP SCHEMA statement example
First, create a new schema named logistics:
CREATE SCHEMA logistics;
GO
Next, create a new table named deliveries inside the logistics schema:
CREATE TABLE logistics.deliveries
(
    order_id        INT
    PRIMARY KEY, 
    delivery_date   DATE NOT NULL, 
    delivery_status TINYINT NOT NULL
);
Then, drop the schema logistics:
DROP SCHEMA logistics;
SQL Server issued the following error because the schema is not empty.
Msg 3729, Level 16, State 1, Line 1
Cannot drop schema 'logistics' because it is being referenced by object 'deliveries'.
After that, drop the table logistics.deliveries:
DROP TABLE logistics.deliveries;
Finally, issue the DROP SCHEMA again to drop the logistics schema:
DROP SCHEMA IF EXISTS logistics;
Now, you will find that the logistics schema has been deleted from the database.

JOIN IN SQL
Here are the different types of the JOINs in SQL:
(INNER) JOIN
Select all records from Table A and Table B, where the join condition is met.
 
LEFT (OUTER) JOIN
Select all records from Table A, along with records from Table B for which the join condition is met (if at all).
 
RIGHT (OUTER) JOIN
•	Select all records from Table B, along with records from Table A for which the join condition is met (if at all).
FULL (OUTER) JOIN
•	Select all records from Table A and Table B, regardless of whether the join condition is met or not.
CROSS JOIN 

•	The CROSS JOIN joined every row from the first table (T1) with every row from the second table (T2). In other words, the cross join returns a Cartesian product of rows from both tables. 
SELF JOIN 
A self join allows you to join a table to itself. It is useful for querying hierarchical data or comparing rows within the same table. A self join uses the inner join or left join clause. Because the query that uses self join references the same table, the table alias is used to assign different names to the same table within the query.
Note that referencing the same table more than one in a query without using table aliases will result in an error.
SELECT A.customer_id,B.customer_id,A.city as city
FROM sales.customers A INNER JOIN sales.customers B
ON A.city=B.city
ORDER BY city;

•	          
Note:
When joining tables with a common field name, e.g.

SELECT *
FROM countries
  INNER JOIN economies
    ON countries.code = economies.code


You can use USING as a shortcut:

SELECT *
FROM countries
  INNER JOIN economies
    USING(code)



UNION
TWO tables should have same number of columns and datatypes should be same 
Select values from two tables without duplicates
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
 
UNION ALL
Select values from two tables with duplicates
SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;

SQL Server INTERSECT
The SQL Server INTERSECT combines result sets of two or more queries and returns distinct rows that are output by both queries.
The following illustrates the syntax of the SQL Server INTERSECT:
query_1
INTERSECT
query_2
Similar to the UNION operator, the queries in the syntax above must conform to the following rules:
•	Both queries must have the same number and order of columns.
•	The data type of the corresponding columns must be the same or compatible.
 
The following picture illustrates the INTERSECT operation:
In this illustration, we had two result sets T1 and T2:
•	T1 result set includes 1, 2, and 3.
•	T2 result set includes 2, 3, and 4.
The intersection of T1 and T2 result sets returns the distinct rows which are 2 and 3.
SQL Server INTERSECT example
Consider the following query:
SELECT
    city
FROM
    sales.customers
INTERSECT
SELECT
    city
FROM
    sales.stores
ORDER BY
    city;
 
The first query finds all cities of the customers and the second query finds the cities of the stores. The whole query, which uses INTERSECT, returns the common cities of customers and stores, which are the cities output by both input queries.
Notice that we added the ORDER BY clause to the last query to sort the result set.
n_name(s) FROM table2;

SQL Server EXCEPT
The SQL Server EXCEPT compares the result sets of two queries and returns the distinct rows from the first query that are not output by the second query. In other words, the EXCEPT subtracts the result set of a query from another.
The following shows the syntax of the SQL Server EXCEPT:
query_1
EXCEPT
query_2
The following are the rules for combining the result sets of two queries in the above syntax:
•	The number and order of columns must be the same in both queries.
•	The data types of the corresponding columns must be the same or compatible.
The following picture shows the EXCEPT operation of the two result sets T1 and T2:
 
In this illustration:
•	T1 result set includes 1, 2, and 3.
•	T2 result set includes 2, 3, and 4.
The except of  the T1 and T2 returns 1 which is the distinct row from the T1 result set that does not appear in the T2 result set.
SQL Server EXCEPT example
See the following products and order_items tables from the sample database:
 
A) Simple EXCEPT example
The following example uses the EXCEPT operator to find the products that have no sales:
SELECT
    product_id
FROM
    production.products
EXCEPT
SELECT
    product_id
FROM
    sales.order_items;
 
In this example, the first query returns all the products. The second query returns the products that have sales. Therefore, the result set includes only the products that have no sales.
Get the names of cities in cities which are not noted as capital cities in countries as a single field result.
Note that there are some countries in the world that are not included in the countries table, which will result in some cities not being labeled as capital cities when in fact they are.
SELECT name
    FROM cities
		EXCEPT
SELECT capital
  FROM countries
ORDER BY name;

B) EXCEPT with ORDER BY example
To sort the result set created by the EXCEPT operator, you add the ORDER BY clause in the last query. For example, the following example finds the products that had no sales and sorts the products by their id in ascending order:
SELECT
    product_id
FROM
    production.products
EXCEPT
SELECT
    product_id
FROM
    sales.order_items
ORDER BY 
	product_id;
 
SUBQUERY
A query which sits inside another query with WHERE

SELECT DISTINCT Countryname
FROM languages
WHERE Countrycode IN
  (SELECT Countrycode
   FROM countries
   WHERE region = 'Middle East')
ORDER BY Countryname;


A query which sits inside another query with FROM
SELECT local_name, subquery.lang_num
  FROM countries,
  	(SELECT code, COUNT(*) AS lang_num
  	 FROM languages
  	 GROUP BY code) AS subquery
  WHERE countries.code = subquery.code
ORDER BY lang_num DESC;

Sometimes problems solved with semi-joins can also be solved using an inner join.
SELECT languages.Countryname AS language
FROM languages
INNER JOIN countries
ON languages.Countrycode = countries.Countrycode
WHERE region = 'Middle East'
ORDER BY language;
Anti JOIN

Another powerful join in SQL is the anti-join. It is particularly useful in identifying which records are causing an incorrect number of records to appear in join queries.
SELECT code, name
  FROM countries
  WHERE continent = 'Oceania'
  	
  	AND code NOT IN
  	
  	(SELECT code
  	 FROM currencies);
FUNCTIONS FOR FILTERING DATA IN SQL


WHERE CLAUSE OPERATORS

Equals :  =
SELECT Id,colour 
FROM dbo.saree
GROUP BY Id,colour 
HAVING colour='blue';

SELECT COUNT(Units_in_stock)AS Total
FROM dbo.saree WHERE
dbo.Company.Id=dbo.saree.Brand

not equals  :<>
SELECT Id
,Type
,colour
,price
,Units_in_Stock
FROM dbo.saree
WHERE Id <>'123'
greater than : >
SELECT Id
FROM dbo.saree
where Units_in_stock >30;
less than : <
greater than or equal to : >=
less than or equal to : <=
Between : 
for looking in a range of values
SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    list_price BETWEEN 1899.00 AND 1999.99
ORDER BY
    list_price DESC;
IS NULL 
           A null is very different than having a price that is zero. A null means that there is actually  no data in this column. If you want to look at something where you know the price is 0 or it is an empty string, then you need to type that in as your condition. If you want to look for something where there is just no information for that column, that's where you would want to simply use IS NULL.



SELECT Job.jobDescription
	,Job.JobStatusId
	,SP.Name
FROM Job
INNER JOIN ServiceProviderJobStatus SP
	ON Job.JobStatusId = SP.Id
WHERE SP.Id = '1' or SP.Id = '2'and Job.JobDescription IS NOT NULL;
	

IN
Looking for specific values. With IN, you don't have to think about the order in which you're placing your different conditions. Another use is when using subqueries 
 SELECT Id
,TYPE
,price
,colour
,Units_in_stock
FROM dbo.saree
WHERE Units_in_Stock IN (50,6);
OR
SELECT colour
,Type
,price
,Id 
FROM dbo.saree 
WHERE colour ='white'OR colour='green';
AND
SELECT
    *
FROM
    production.products
WHERE
    (brand_id = 1 OR brand_id = 2)
AND list_price > 1000
ORDER BY
    brand_id;
NOT 
 eg:WHERE NOT City=’London’ AND NOT city=’Seattle’
SELECT *
FROM dbo.saree
WHERE NOT colour ='red';

Special condition :

Select the customerid, order_date, and item from the items_ordered table for all items unless they are 'Snow Shoes' or if they are 'Ear Muffs'. Display the rows as long as they are not either of these two items.?

SELECT customerid, order_date, item
FROM items_ordered
WHERE (item <> 'Snow shoes') AND (item <> 'Ear muffs');
Note: Yes, that is correct, you do want to use an AND here. If you were to use an OR here, then either side of the OR will be true, and EVERY row will be displayed. For example, when it encounters 'Ear muffs', it will evaluate to True since 'Ear muffs' are not equal to 'Snow shoes'.

Note :see the brackets 
WILD CARDS
 -% means string follows

Eg : last_name LIKE 'z%' : finds the customers whose last name starts with  letter z
last_name LIKE '%er' : returns the customers whose last name ends with string 'er'
last_name LIKE 't%s' : retrieves the customers whose last name starts with the letter 't' and ends with the letter 's'
last_name LIKE '_u%' : returns the customers where the second character is the letter u.
last_name LIKE '[YZ]%' : finds the customers where the first character in the last name is the letter in the range A through C

eg:  select Id from [dbo].[Company] WHERE Id LIKE'A%'


•	A wildcard is a special character used to match parts of a value i.e searching for a pattern made up of literal text.
•	The beginning of a phrase, ending of a phrase, and you're able to pull data for that based on your search conditions. 
•	One of the things you'll use though with this is the LIKE operator. LIKE is actually technically a predicate, not an operator.
•	A thing to know with a LIKE is that it can be used for string variables and non-text data types. So these wildcards cannot be used for numerical data.



GROUPING DATA IN SQL
ORDER BY
•	To sort data with SQL, we use the ORDER BY clause. 
•	Sorting data in a particular way can be really helpful when viewing data, otherwise, our data could be returned in a manner which makes it a bit more difficult to interpret
•	it can take multiple column names. You can order by one column or can order by all the columns.seperate by columns and mention the order by number of column or name eg:ORDER BY(2,3) or ORDER BY(date,city)
•	coloumn not necessary to be in SELECT
•	you can sort it either in ascending, A S C, or descending order, D E S C. this is only applied to the column name it directly proceeds. 
•	If you're using order by descending and have unit price, it's not going to do it for all of the columns after the descending. You have to specify each individual columns for ascending and descending
•	The last rule is that ORDER BY must always be the last clause in the select statement.

SELECT first_name
,last_name
FROM sales.customers
ORDER BY state;

GROUP BY
The GROUP BY clause allows you to arrange the rows of a query in groups. The groups are determined by the columns that you specify in the GROUP BY clause.
The following illustrates the GROUP BY clause syntax:
SELECT
    select_list
FROM
    table_name
GROUP BY
    column_name1,
    column_name2 ,...;

•	List of columns in select and group by must be same.
•	Or We should put all in SELECT in GROUP BY except aggregates
•	GROUP BY should always there if there is an aggregate function. The GROUP BY clause arranges rows into groups and an aggregate function returns the summary (count, min, max, average, sum, etc.,) for each group.
•	But we can’t group by aggregate function.
•	If you want to refer to any column or expression that is not listed in the GROUP BY clause, you must use that column as the input of an aggregate function. Otherwise, you will get an error because there is no guarantee that the column or expression will return a single value per group.
Eg: SELECT
    customer_id,
    YEAR (order_date) order_year,
    COUNT (order_id) order_placed
FROM
    sales.orders
WHERE
    customer_id IN (1, 2)
GROUP BY
    customer_id,
    YEAR (order_date)
ORDER BY
    customer_id; 


HAVING

The HAVING clause is often used with the GROUP BY clause to filter groups based on a specified list of conditions. The following illustrates the HAVING clause syntax:

SELECT
    select_list
FROM
    table_name
GROUP BY
    group_list
HAVING
    conditions;

•	HAVING should always have an aggregate function as condition.
•	Because SQL Server processes the HAVING clause after the GROUP BY clause, you cannot refer to the aggregate function specified in the select list by using the column alias. The following query will fail:

SELECT
    column_name1,
    column_name2,
    aggregate_function (column_name3) column_alias
FROM
    table_name
GROUP BY
    column_name1,
    column_name2
HAVING
    column_alias > value;

Correct :
SELECT
    column_name1,
    column_name2,
    aggregate_function (column_name3) alias
FROM
    table_name
GROUP BY
    column_name1,
    column_name2
HAVING
    aggregate_function (column_name3) > value;


NOTE : WHERE filters before the data is grouped and then HAVING filters 
after the data is grouped. Rows will be eliminated by the WHERE clause and 
those will be included in the GROUP BY clause. This is just important to 
know when you should use WHERE versus HAVING.
The GROUP BY does not sort the data in any fashion. It only groups it together
.For sorting we should use ORDER BY.


MATH OPERATORS IN SQL

•	The idea that things in parentheses are handled first, 
•	then powers  
•	multiplication, division, addition, and subtraction. 
•	"Please excuse my dear Aunt Sally"






The SQL ANY and ALL Operators
•	The ANY and ALL operators are used with a WHERE or HAVING clause.
•	The ANY operator returns true if any of the subquery values meet the condition.
•	The ALL operator returns true if all of the subquery values meet the condition.
ANY 
Syntax : 
SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
(SELECT column_name FROM table_name WHERE condition);
ALL 
Syntax :
SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
(SELECT column_name FROM table_name WHERE condition);

Eg:
SELECT *
FROM [dbo][saree]
WHERE Id = ANY

(SELECT Id FROM [dbo].[saree] WHERE colour='blue');





