# SQL-Basics-to-Advanced

Database
Create database

Eg: 

    CREATE DATABASE testDB;

Drop DATABASE


    DROP database_name;
    
Eg: DROP DATABASE testDB;

Back up Database


     BACKUP DATABASE database_name 
     
     TO DISK=’filepath’;
     
Eg: 

     BACKUP DATABASE testDB
     TO DISK = 'D:\backups\testDB.bak';

Differential Back up(only back up part of database that has changed after last back up)
    
    BACKUP DATABASE database _name
    WITH DIFFERENTIAL;
Eg:

   BACKUP DATABASE testDB
   TO DISK = 'D:\backups\testDB.bak'
   WITH DIFFERENTIAL;

Table
----- 

Create table
 
  
      CREATE table_name;


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

Inserting multiple rows 

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


Alter table and add new column

    Alter  table_name
    Add column name
    
Eg: 
  
    ALTER TABLE Customers ADD Email VARCHAR(255);

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
TRUNCATE TABLE vs. DELETE
-------------------------
The TRUNCATE TABLE has the following advantages over the DELETE statement:
1) Use less transaction log
The DELETE statement removes rows one at a time and inserts an entry in the transaction log for each removed row. On the other hand, the TRUNCATE TABLE statement deletes the data by deallocating the data pages used to store the table data and inserts only the page deallocations in the transaction logs.
2) Use fewer locks
When the DELETE statement is executed using a row lock, each row in the table is locked for removal. The TRUNCATE TABLE locks the table and pages, not each row.
3) Identity reset
If the table to be truncated has an identity column, the counter for that column is reset to the seed value when data is deleted by the TRUNCATE TABLE statement but not the DELETE statement.

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

Update multiple columns 
-----------------------
The following statement increases the max local tax rate by 2% and the average local tax rate by 1% for the states that have the max local tax rate 1%.
    
    UPDATE sales.taxes
    SET max_local_tax_rate += 0.02,
    avg_local_tax_rate += 0.01
    WHERE
    max_local_tax_rate = 0.01;



