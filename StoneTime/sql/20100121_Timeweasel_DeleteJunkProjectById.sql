
-- clear database of junk project
declare @id int = 20
declare @charterid int
set @charterid = (select Charter_ID from PROJECTS where PROJECT_ID = @id)
delete from CHARTER where CHARTER_ID not in (select CHARTER_ID from PROJECTS)
delete from PROJECT_TASKS where PROJECT_ID = @id 
delete from PROJECT_PHASES where PROJECT_ID = @id 
delete from PROJECT_USERS where PROJECT_ID = @id
delete from PROJECTS where PROJECT_ID=@id
go
select * from PROJECTS
