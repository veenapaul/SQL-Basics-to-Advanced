---and call it by its name.dont use sp_for names

CREATE PROCEDURE spnamequanemployee
AS
BEGIN
SELECT c.state,sum(i.quantity) AS total
FROM sales.customers c inner join sales.orders o ON c.customer_id=o.customer_id
INNER JOIN sales.order_items i ON i.order_id=o.order_id
GROUP BY ROLLUP(c.state)
END
