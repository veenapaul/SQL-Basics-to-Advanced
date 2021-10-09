create function salesorderwithoutip()
Returns table
As

Return(Select [order_id],[order_status],[staff_id],[shipped_date] from [sales].[orders])