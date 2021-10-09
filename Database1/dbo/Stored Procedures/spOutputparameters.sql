CREATE PROC spOutputparameters
@last_name varchar(50),
@customercount int output
as
Begin
Select @customercount=count(c.last_name)

FROM sales.customers c inner join sales.orders o ON c.customer_id=o.customer_id 
INNER JOIN sales.order_items i ON i.order_id=o.order_id where c.last_name=@last_name
End