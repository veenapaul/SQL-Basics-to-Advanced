create function fullname(@first_name varchar(50),@last_name varchar(50))
Returns varchar(200)
As
BEGIN
Return (select @last_name+@first_name)
END