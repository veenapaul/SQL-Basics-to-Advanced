
create function dbo.realprice(@shop_price int)
returns int
as
begin
declare @realprice int
set @realprice=(@shop_price-25)

return @realprice;

end