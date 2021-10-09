create PROC spOutputparameterstore
(@store_id int,
@totalquantity int output)
as
Begin
--SELECT @store_id=[store_id] from [production].[stocks]
Select @totalquantity=count(quantity) FROM Production.stocks where @store_id=[store_id]



End