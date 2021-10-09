Create function calculateage(@dob date)
returns int
as
begin
 declare @age int
 SET @Age = DATEDIFF(YEAR, @dob, GETDATE()) 
 return @age;
 end