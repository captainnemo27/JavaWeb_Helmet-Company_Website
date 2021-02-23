--------------------------------PHÂN QUYỀN---------------------------------
USE HELMET_COMPANY
---------------------------------Tạo login

CREATE LOGIN Admin WITH PASSWORD = '123'
CREATE LOGIN Emp WITH PASSWORD = '123'
CREATE LOGIN LeaderTeam WITH PASSWORD = '123'
--CREATE LOGIN employeeLogin WITH PASSWORD = '123'


---------------------------------TẠo user

CREATE USER AdminUser FOR LOGIN Admin
CREATE USER EmpUser FOR LOGIN Emp
CREATE USER projectUser FOR LOGIN LeaderTeam
--CREATE USER employeeUser FOR LOGIN employeeLogin


-------------Tạo các role departmentRole, projectRole, employeeRole

CREATE ROLE adminRole
CREATE ROLE projectsRole
CREATE ROLE empRole

-------------------------Gán quyền cho user admin

ALTER ROLE db_owner ADD MEMBER adminUser


-----------------------Gán quyền cho Admin vào role

GRANT SELECT, INSERT, UPDATE ON dbo.ACCOUNT	TO adminRole
GRANT SELECT, INSERT, UPDATE ON dbo.PROJECT	TO adminRole
GRANT SELECT, INSERT, UPDATE ON dbo.STAFF	TO adminRole
GRANT SELECT, INSERT, UPDATE ON dbo.SALARY	TO adminRole
GRANT SELECT, INSERT, UPDATE ON dbo.TASK	TO adminRole
GRANT SELECT, INSERT, UPDATE ON dbo.TEAM	TO adminRole

GRANT EXECUTE ON OBJECT:: SP_addTask TO adminRole
GRANT EXECUTE ON OBJECT:: SP_DeleteTask TO adminRole
GRANT EXECUTE ON OBJECT:: SP_addAccount TO adminRole
GRANT EXECUTE ON OBJECT:: SP_DeleteAccount TO adminRole
GRANT EXECUTE ON OBJECT:: SP_addStaff TO adminRole
GRANT EXECUTE ON OBJECT:: SP_DeleteStaff  TO adminRole
GRANT EXECUTE ON OBJECT:: SP_addProject TO adminRole
GRANT EXECUTE ON OBJECT:: SP_DeleteProject TO adminRole
GRANT EXECUTE ON OBJECT:: SP_DeleteProject TO adminRole
GRANT EXECUTE ON OBJECT:: SP_DeleteTeam TO adminRole
GRANT EXECUTE ON OBJECT:: SP_addSalaryAllYear TO adminRole
GRANT EXECUTE ON OBJECT:: SP_storeStaffOfTeam TO adminRole

GRANT EXECUTE ON OBJECT:: SP_storeSalaryTeam TO adminRole
GRANT EXECUTE ON OBJECT:: SP_checkSalaryMonth TO adminRole
GRANT EXECUTE ON OBJECT:: SP_checkSalaryYearStaff TO adminRole
GRANT EXECUTE ON OBJECT:: SP_checkSalaryYearAdmin TO adminRole
GRANT EXECUTE ON OBJECT:: SP_Login TO adminRole
GRANT EXECUTE ON OBJECT:: SP_InforUser  TO adminRole
GRANT EXECUTE ON OBJECT:: SP_ListTaskRunning TO adminRole
GRANT EXECUTE ON OBJECT:: SP_storeTaskName TO adminRole
GRANT EXECUTE ON OBJECT:: SP_Account_Create TO adminRole
GRANT EXECUTE ON OBJECT:: SP_UpdateStaff TO adminRole

GRANT EXECUTE ON OBJECT:: FN_ConvertToUnsign1 TO adminRole
GRANT EXECUTE ON OBJECT:: FN_storeListProjectRunning TO adminRole
GRANT EXECUTE ON OBJECT:: FN_storeTop5_SalaryOfCompany TO adminRole
GRANT EXECUTE ON OBJECT:: FN_storeSumSalaryTeam TO adminRole

ALTER ROLE adminRole ADD MEMBER adminUser




-----------------------Gán quyền cho projectsRole và thêm projectUser vào role

GRANT SELECT,		  UPDATE ON dbo.ACCOUNT	TO projectsRole
GRANT SELECT, INSERT, UPDATE ON dbo.PROJECT	TO projectsRole
GRANT SELECT, INSERT, UPDATE ON dbo.STAFF	TO projectsRole
GRANT SELECT,INSERT, UPDATE	 ON dbo.SALARY	TO projectsRole
GRANT SELECT, INSERT, UPDATE ON dbo.TASK	TO projectsRole
GRANT SELECT				 ON dbo.TEAM	TO projectsRole

GRANT EXECUTE ON OBJECT:: SP_addTask TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_DeleteTask TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_addStaff TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_DeleteStaff  TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_addProject TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_DeleteProject TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_addSalaryAllYear TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_storeStaffOfTeam TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_storeSalaryTeam TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_checkSalaryMonth TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_checkSalaryYearStaff TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_checkSalaryYearAdmin TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_Login TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_InforUser  TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_ListTaskRunning TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_storeTaskName TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_Account_Create TO projectsRole
GRANT EXECUTE ON OBJECT:: SP_UpdateStaff TO projectsRole
GRANT EXECUTE ON OBJECT:: FN_ConvertToUnsign1 TO projectsRole
GRANT EXECUTE ON OBJECT:: FN_storeListProjectRunning TO projectsRole
GRANT EXECUTE ON OBJECT:: FN_storeTop5_SalaryOfCompany TO projectsRole
GRANT EXECUTE ON OBJECT:: FN_storeSumSalaryTeam TO projectsRole

ALTER ROLE projectRole ADD MEMBER projectUser


-----------------------Gán quyền cho employeesRole và thêm employeeUser vào role

GRANT SELECT,		  UPDATE ON dbo.ACCOUNT	TO empRole
GRANT SELECT				 ON dbo.PROJECT	TO empRole
GRANT SELECT,		 UPDATE ON dbo.STAFF	TO empRole
GRANT SELECT				 ON dbo.SALARY	TO empRole
GRANT SELECT, INSERT, UPDATE ON dbo.TASK	TO empRole
GRANT SELECT				 ON dbo.TEAM	TO empRole

GRANT EXECUTE ON OBJECT:: SP_addTask TO empRole
GRANT EXECUTE ON OBJECT:: SP_DeleteTask TO empRole
GRANT EXECUTE ON OBJECT:: SP_storeStaffOfTeam TO empRole
GRANT EXECUTE ON OBJECT:: SP_storeSalaryTeam TO empRole
GRANT EXECUTE ON OBJECT:: SP_checkSalaryMonth TO empRole
GRANT EXECUTE ON OBJECT:: SP_checkSalaryYearStaff TO empRole
GRANT EXECUTE ON OBJECT:: SP_checkSalaryYearAdmin TO empRole
GRANT EXECUTE ON OBJECT:: SP_Login TO empRole
GRANT EXECUTE ON OBJECT:: SP_InforUser  TO empRole
GRANT EXECUTE ON OBJECT:: SP_ListTaskRunning TO empRole
GRANT EXECUTE ON OBJECT:: SP_storeTaskName TO empRole
GRANT EXECUTE ON OBJECT:: SP_UpdateStaff TO empRole

GRANT EXECUTE ON OBJECT:: FN_ConvertToUnsign1 TO empRole
GRANT EXECUTE ON OBJECT:: FN_storeListProjectRunning TO empRole
GRANT EXECUTE ON OBJECT:: FN_storeTop5_SalaryOfCompany TO empRole
GRANT EXECUTE ON OBJECT:: FN_storeSumSalaryTeam TO empRole

ALTER ROLE employeesRole ADD MEMBER employeeUser
