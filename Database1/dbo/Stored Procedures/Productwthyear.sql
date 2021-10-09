create procedure Productwthyear(
@model_year smallint,
@productcount int output)
AS
BEGIN
select product_id,product_name,list_price
from production.products where model_year=@model_year;
Select @productcount=@@ROWCOUNT;
END;
