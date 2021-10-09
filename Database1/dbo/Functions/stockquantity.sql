create function stockquantity()
Returns int
As
BEGIN
Return (Select sum(quantity) from [production].[stocks])
END
