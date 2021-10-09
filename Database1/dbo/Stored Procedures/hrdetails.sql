Create proc hrdetails (@id int ,@date datetime output)
AS
BEGIN
select id,fullname from [hr].[details] where id=@id ;


select @date =[joined_at] from [hr].[details]
END