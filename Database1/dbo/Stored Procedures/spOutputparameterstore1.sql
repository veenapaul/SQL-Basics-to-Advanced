create PROC spOutputparameterstore1
as
Begin
return (select count(quantity) from production.stocks)
end