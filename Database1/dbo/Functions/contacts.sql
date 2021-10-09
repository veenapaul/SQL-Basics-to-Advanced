create function contacts()
Returns @ID_table table(id int,firstname varchar(255),phone varchar(25))
AS
BEGIN 

           insert into @ID_table
select [customer_id],[first_name],[phone]
from [sales].[customers];

            INSERT INTO @ID_table
    SELECT [staff_id],first_name, phone
      'staff'
    FROM
        sales.staffs;
    RETURN;
END;
