CREATE PROC spcusomerdetails
@last_name varchar(50),
@customer_id int
as
begin
SELECT *
FROM sales.customers c inner join sales.orders o ON c.customer_id=o.customer_id 
INNER JOIN sales.order_items i ON i.order_id=o.order_id
where last_name=@last_name AND c.customer_id=@customer_id
ENd