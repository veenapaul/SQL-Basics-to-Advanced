create function dbo.realpric(@list_price int)
returns int
as
begin
declare @realpric int
set @realpric=(@list_price-25)
return @realpric;
end