CREATE TABLE [hr].[employees] (
    [id]       INT            IDENTITY (1, 1) NOT NULL,
    [fullname] NVARCHAR (100) NOT NULL
);


GO
CREATE CLUSTERED INDEX [IX]
    ON [hr].[employees]([id] ASC, [fullname] DESC);


GO
create trigger hr.tr_employeesedited2
on [Bike Stores].hr.employees
for insert
as
begin
declare @id int
select @id =id from inserted
insert into [Bike Stores].hr.employeeauditnew
values('new employee with id ='+cast(@id as nvarchar(1000))+'is added at'+cast(getdate() as nvarchar(100)));
end
GO
create trigger hr.tr_employeesdelete
on [Bike Stores].hr.employees
for delete
as
begin
declare @id int
select @id =id from deleted
insert into [Bike Stores].hr.employeeauditnew
values('new employee with id ='+cast(@id as nvarchar(1000))+'is deleted at'+cast(getdate() as nvarchar(100)));
end
GO
create trigger hr.tr_employeesupdate
on [Bike Stores].hr.employees
for update
as
begin
select * from inserted
select * from deleted
end
GO
CREATE TRIGGER [hr].AfterUPDATETrigger on [Bike Stores].hr.employees
FOR UPDATE 
AS 
begin
 -- Declare variables to hold old and updated data
      Declare @Id int
      Declare @Oldfullname nvarchar(20), @Newfullname nvarchar(20)
      
      -- Variable to build the audit string
      Declare @AuditString nvarchar(1000)
      
      -- Load the updated records into temporary table
      Select *
      into #TempTable
      from inserted
     
      -- Loop thru the records in temp table
      While(Exists(Select Id from #TempTable))
      Begin
            --Initialize the audit string to empty string
            Set @AuditString = ''
           
            -- Select first row data from temp table
            Select Top 1 @Id = Id, @Newfullname = fullname 
            from #TempTable
           
            -- Select the corresponding row from deleted table
            Select @Oldfullname = fullname
            from deleted where Id = @Id
   
     -- Build the audit string dynamically           
            Set @AuditString = 'Employee with Id = ' + Cast(@Id as nvarchar(50)) + ' changed'
            if(@Oldfullname <> @Newfullname)
                  Set @AuditString = @AuditString + ' NAME from ' + @Oldfullname + ' to ' + @Newfullname
                 
            
            insert into [Bike Stores].hr.employeeauditnew values(@AuditString)
            
            -- Delete the row from temp table, so we can move to the next row
            Delete from #TempTable where Id = @Id
      End
End


