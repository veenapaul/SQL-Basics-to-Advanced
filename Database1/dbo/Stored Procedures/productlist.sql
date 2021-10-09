
CREATE PROCEDURE productlist (@minprice as decimal=100,@maxprice as decimal)
    AS
    BEGIN
        SELECT 
            product_name, 
            list_price
        FROM 
            production.products

			where (list_price>@minprice ) AND (list_price<@maxprice )
        ORDER BY 
            list_price 
    END;