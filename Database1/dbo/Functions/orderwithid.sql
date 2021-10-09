create function orderwithid(@order_id int)
returns table
as
return
(select order_id,item_id,product_id,quantity,list_price
from sales.order_items
where order_id=@order_id)