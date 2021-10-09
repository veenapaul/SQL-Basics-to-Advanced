
create view hr.hrdetails
as
select last_name,phone,dept
from hr.details inner join hr.employees on hr.details.fullname=hr.employees.fullname