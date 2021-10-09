
--------------Inlined Table valye Function(Returns a table)----------------------------------
create function salesorder (@store_id int)
Returns table
As

Return(Select [order_id],[order_status],[staff_id],[shipped_date] from [sales].[orders]
where 
[store_id]=@store_id)