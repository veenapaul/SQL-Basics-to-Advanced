Create Procedure spGetNameById2
--@customer_id int

as
Begin
return (Select first_name
FROM sales.customers c inner join sales.orders o ON c.customer_id=o.customer_id 
INNER JOIN sales.order_items i ON i.order_id=o.order_id)
--where c.customer_id=@customer_id)
End
