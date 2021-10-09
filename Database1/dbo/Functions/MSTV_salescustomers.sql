-----------------------Multivalued Function---------------

Create function MSTV_salescustomers()
Returns @salescustomer table(id int,firstname varchar(255),phone varchar(25),city varchar(50))
AS
BEGIN
Insert into @salescustomer
select [customer_id],[first_name],[phone],[city] from [sales].[customers]
Return
End