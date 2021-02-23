

-- XÂY DỰNG WEB QUẢN LÝ NHÂN VIÊN
--CÔNG TY NÓN BẢO HIỂM

--ĐẶNG NGỌC SƠN			18133046
--ĐÀO VĂN THẮNG			18133050
--ĐÀO MINH THY			18133055
--TRẦN MINH TÚ TRUNG	18133060

create database HELMET_COMPANY
USE HELMET_COMPANY
go
----------------FUNCTION AUTO ID UP
CREATE FUNCTION AUTO_IDSTAFF()
RETURNS int
AS
BEGIN
	DECLARE @ID int
	IF (SELECT COUNT(Id) FROM STAFF) = 0
		SET @ID = 0
	ELSE
		SELECT @ID = MAX(Id)+1 FROM STAFF
			
	RETURN @ID
END
go
CREATE FUNCTION AUTO_IDTEAM()
RETURNS int
AS
BEGIN
	DECLARE @ID int
	IF (SELECT COUNT(Id) FROM TEAM) = 0
		SET @ID = 0
	ELSE
		SELECT @ID = MAX(Id)+1 FROM TEAM
			
	RETURN @ID
END
go
CREATE FUNCTION AUTO_IDTASK() 
RETURNS int
AS
BEGIN
	DECLARE @ID int
	IF (SELECT COUNT(Id) FROM TASK) = 0
		SET @ID = 0
	ELSE
		SELECT @ID = MAX(Id)+1 FROM TASK
			
	RETURN @ID
END
go
CREATE FUNCTION AUTO_IDPROJECT() 
RETURNS int
AS
BEGIN
	DECLARE @ID int
	IF (SELECT COUNT(Id) FROM PROJECT) = 0
		SET @ID = 0
	ELSE
		SELECT @ID = MAX(Id)+1 FROM PROJECT
			
	RETURN @ID
END
go
CREATE TABLE ACCOUNT
(
	UserName NVARCHAR(100) PRIMARY KEY,	
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'Staff',
	PassWord NVARCHAR(100) NOT NULL DEFAULT 0,
	Type NVARCHAR(10) NOT NULL  DEFAULT N'Emp',
	status INT NOT NULL DEFAULT 1
)
go
CREATE TABLE TEAM
(
	Id INT NOT NULL primary key constraint IdUpTEAM Default dbo.AUTO_IDTEAM(),
	Name NVARCHAR(100) NOT NULL UNIQUE,
	Address NVARCHAR(100) NOT NULL,
	Phone NVARCHAR(10) NOT NULL,
	Email NVARCHAR(50) NOT NULL,
	IdAmin INT NOT NULL , --- set khoas ngoai sau
	status INT NOT NULL DEFAULT 1
)
go
CREATE TABLE STAFF
(
	Id INT NOT NULL PRIMARY KEY constraint IdUpStaff Default dbo.AUTO_IDSTAFF(),
	Name NVARCHAR(100) NOT NULL,
	DateOfBirth DATE NOT NULL ,
	Address NVARCHAR(100) NOT NULL,
	Sex NVARCHAR(10) NOT NULL DEFAULT N'Orther',
	Phone NVARCHAR(10) NOT NULL UNIQUE,
	Email NVARCHAR(50) NOT NULL UNIQUE,
	WorkTime FLOAT  DEFAULT 0,
	IdTeam INT NOT NULL REFERENCES dbo.TEAM(Id) ,
	UserName NVARCHAR(100) NOT NULL REFERENCES dbo.ACCOUNT(UserName) UNIQUE,
	AboutStaff NVARCHAR(500),
	UserImage NVARCHAR(500),
	LinkFacebook NVARCHAR(200),
	status INT NOT NULL DEFAULT 1,
	CONSTRAINT CHK_DateOfBirth Check( DateOfBirth < Getdate()),
)
go
CREATE TABLE PROJECT
(
	Id INT NOT NULL PRIMARY KEY constraint IdUpPROJECT Default dbo.AUTO_IDPROJECT(),
	Name NVARCHAR(100) NOT NULL,
	Content NVARCHAR(1000) NOT NULL,
	StatusProject int NOT null default 1,
	TimeFrom DATETIME NOT NULL,
	TimeEnd DATETIME NOT NULL,
	IdTeam INT NOT NULL REFERENCES dbo.TEAM(Id),
	status INT NOT NULL DEFAULT 1,
)
go

CREATE TABLE TASK 
(
	Id INT NOT NULL PRIMARY KEY constraint IdUpTASK Default dbo.AUTO_IDTASK(),
	Name NVARCHAR(100) NOT NULL,
	Content NVARCHAR(1000) NOT NULL,
	StatusTask int NOT NULL DEFAULT 1,
	TimeFrom DATETIME NOT NULL,
	TimeEnd DATETIME NOT NULL,
	IdStaff int Not Null,
	IdProject INT Default 1 REFERENCES dbo.PROJECT(Id),
	status INT NOT NULL DEFAULT 1,
	
)
go
CREATE TABLE SALARY
(
	Month INT NOT NULL, 
	SYear Int NOT NULL,
	Salary real NOT NULL DEFAULT,
	Bonus real NOT NULL DEFAULT 0,
	IdStaff INT NOT NULL REFERENCES dbo.STAFF(Id),
)

go


-- add Database

go
--------------------------------------------------------------------------
--------------------------------------------------------------------------
INSERT dbo.ACCOUNT (UserName,DisplayName,PassWord,Type) VAlUES (N'thangdao',N'Dao Van Thang',HASHBYTES ('MD5', N'123'),N'Admin')
INSERT dbo.ACCOUNT (UserName,DisplayName,PassWord,Type) VAlUES (N'minhnguyet',N'Le Thi Minh Nguyet',HASHBYTES ('MD5', N'123'),N'Admin')
INSERT dbo.ACCOUNT (UserName,DisplayName,PassWord,Type) VAlUES (N'minhthy',N'Dao Minh Thy',HASHBYTES ('MD5', N'123'),N'Emp')
INSERT dbo.ACCOUNT (UserName,DisplayName,PassWord,Type) VAlUES (N'ngocson',N'Dang Ngoc Son',HASHBYTES ('MD5', N'123'),N'Emp')
INSERT dbo.ACCOUNT (UserName,DisplayName,PassWord,Type) VAlUES (N'tutrung',N'Tran Minh Tu Trung',HASHBYTES ('MD5', N'123'),N'Emp')
INSERT dbo.ACCOUNT (UserName,DisplayName,PassWord,Type) VAlUES (N'thanhdat',N'Phan Thanh Dat',HASHBYTES ('MD5', N'123'),N'Emp')
INSERT dbo.ACCOUNT (UserName,DisplayName,PassWord,Type) VAlUES (N'anhtrieu',N'Nguyen Anh Trieu',HASHBYTES ('MD5', N'123'),N'Emp')
INSERT dbo.ACCOUNT (UserName,DisplayName,PassWord,Type) VAlUES (N'huynhvy',N'Huynh Thi Thuy Vy',HASHBYTES ('MD5', N'123'),N'Emp')
INSERT dbo.ACCOUNT (UserName,DisplayName,PassWord,Type) VAlUES (N'trungtin',N'Nguyen Trung Tin',HASHBYTES ('MD5', N'123'),N'Emp')
INSERT dbo.ACCOUNT (UserName,DisplayName,PassWord,Type) VAlUES (N'ngocson1',N'Dang Ngoc Son',HASHBYTES ('MD5', N'123'),N'Emp')

go

INSERT dbo.TEAM (Id,Name,Address,Phone,Email,IdAmin) Values (2,N'Da Nang',N'1 District, Da Nang city',N'0123456789',N'TrungLeodanang@gmail.com',2)
INSERT dbo.TEAM (Id,Name,Address,Phone,Email,IdAmin) Values (3,N'Ho Chi Minh 1',N'1 District, Ho Chi Minh city',N'0213456789',N'TrungLeoHCM1@gmail.com',3)
INSERT dbo.TEAM (Id,Name,Address,Phone,Email,IdAmin) Values (4,N'Can Tho',N'2 District, Can Tho city',N'0132456789',N'TrungLeocantho@gmail.com',4)
INSERT dbo.TEAM (Id,Name,Address,Phone,Email,IdAmin) Values (5,N'Ha Noi',N'Ho Tay District, Ha Noi capital',N'0124356789',N'TrungLeoHN@gmail.com',5)
INSERT dbo.TEAM (Id,Name,Address,Phone,Email,IdAmin) Values (6,N'Ho Chi Minh 2',N'Thu Duc city, Ho Chi Minh city',N'0123465789',N'TrungLeoHCM2@gmail.com',6)
INSERT dbo.TEAM (Id,Name,Address,Phone,Email,IdAmin) Values (1,N'Admin',N'1, Vo Van Ngan Street,Thu Duc District, Ho Chi Minh city',N'0123456789',N'TrungLeoCEOS@gmail.com',6)
INSERT dbo.TEAM (Id,Name,Address,Phone,Email,IdAmin) Values (7,N'Sell',N'1, Vo Van Ngan Street,Thu Duc District, Ho Chi Minh city',N'0999555888',N'TrungLeoSell@gmail.com',7)
INSERT dbo.TEAM (Id,Name,Address,Phone,Email,IdAmin) Values (8,N'Product',N'1, Vo Van Ngan Street,Thu Duc District, Ho Chi Minh city',N'0999555888',N'TrungLeoProduct@gmail.com',8)
INSERT dbo.TEAM (Id,Name,Address,Phone,Email,IdAmin) Values (9,N'Creative',N'1, Vo Van Ngan Street,Thu Duc District, Ho Chi Minh city',N'0999555888',N'TrungLeoCreative@gmail.com',9)

go

INSERT INTO dbo.STAFF(Id,Name,DateOfBirth,Address,Sex,Phone,Email,IdTeam,UserName) VALUES (1,N'Dao Van Thang','2000-01-27',N'Thu Duc District,Ho Chi Minh city',N'male',N'0394927609',N'thangdao2018@gmail.com',1,N'thangdao')
INSERT INTO dbo.STAFF(Id,Name,DateOfBirth,Address,Sex,Phone,Email,IdTeam,UserName) VALUES (2,N'Le Thi Minh Nguyet','2000-01-27',N'Thu Duc District,Ho Chi Minh city',N'male',N'0394927601',N'thangdao2001@gmail.com',2,N'minhnguyet')
INSERT INTO dbo.STAFF(Id,Name,DateOfBirth,Address,Sex,Phone,Email,IdTeam,UserName) VALUES (3,N'Dao Minh Thy','2000-01-27',N'Thu Duc District,Ho Chi Minh city',N'male',N'0394927602',N'thangdao2002@gmail.com',3,N'minhthy')
INSERT INTO dbo.STAFF(Id,Name,DateOfBirth,Address,Sex,Phone,Email,IdTeam,UserName) VALUES (4,N'Trần Minh Tú Trung','2000-01-27',N'Thu Duc District,Ho Chi Minh city',N'male',N'0394927603',N'thangdao2003@gmail.com',4,N'tutrung')
INSERT INTO dbo.STAFF(Id,Name,DateOfBirth,Address,Sex,Phone,Email,IdTeam,UserName) VALUES (5,N'Phan Thành Đạt','2000-01-27',N'Thu Duc District,Ho Chi Minh city',N'male',N'0394927604',N'thangdao2004@gmail.com',5,N'thanhdat')
INSERT INTO dbo.STAFF(Id,Name,DateOfBirth,Address,Sex,Phone,Email,IdTeam,UserName) VALUES (6,N'Đặng Ngọc Sơn','2000-01-27',N'Thu Duc District,Ho Chi Minh city',N'male',N'0394927605',N'thangdao2005@gmail.com',6,N'ngocson')
INSERT INTO dbo.STAFF(Id,Name,DateOfBirth,Address,Sex,Phone,Email,IdTeam,UserName) VALUES (7,N'Nguyễn Anh Triều','2000-01-27',N'Thu Duc District,Ho Chi Minh city',N'male',N'0394927606',N'thangdao2006@gmail.com',7,N'anhtrieu')
INSERT INTO dbo.STAFF(Id,Name,DateOfBirth,Address,Sex,Phone,Email,IdTeam,UserName) VALUES (8,N'Huỳnh Thị Thúy Vy','2000-01-27',N'Thu Duc District,Ho Chi Minh city',N'male',N'0394927607',N'thangdao2007@gmail.com',8,N'huynhvy')
INSERT INTO dbo.STAFF(Id,Name,DateOfBirth,Address,Sex,Phone,Email,IdTeam,UserName) VALUES (9,N'Nguyễn Trung Tín','2000-01-27',N'Thu Duc District,Ho Chi Minh city',N'male',N'0394927608',N'thangdao2008@gmail.com',9,N'trungtin')

go

INSERT INTO dbo.PROJECT(Id,Name,Content,StatusProject,TimeFrom,TimeEnd,IdTeam) VALUES (1,N'Chạy Web sale',N'Liên hệ đội kỹ thuật',1,'2020-11-6','2020-12-29',1)
INSERT INTO dbo.PROJECT(Id,Name,Content,StatusProject,TimeFrom,TimeEnd,IdTeam) VALUES (2,N'Sản phẩm Mới tháng 12',N'Sự kiện ra mắt nón bảo hiểm mới',1,'2021-1-6','2021-2-22',8)
INSERT INTO dbo.PROJECT(Id,Name,Content,StatusProject,TimeFrom,TimeEnd,IdTeam) VALUES (3,N'Liên hệ mở chi nhánh',N'Mở chi nhánh thứ 2 ở HaNoi',1,'2020-12-6','2021-2-02',5)
INSERT INTO dbo.PROJECT(Id,Name,Content,StatusProject,TimeFrom,TimeEnd,IdTeam) VALUES (4,N'Mở rộng và decor lại HCM 2',N'HCM2 liên hệ team Creative',1,'2020-9-15','2020-11-20',6)
INSERT INTO dbo.PROJECT(Id,Name,Content,StatusProject,TimeFrom,TimeEnd,IdTeam) VALUES (5,N'Đào tạo nhân viên',N'Team Creative lên kế hoạch',1,'2020-12-16','2021-1-20',9)
INSERT INTO dbo.PROJECT(Id,Name,Content,StatusProject,TimeFrom,TimeEnd,IdTeam) VALUES (6,N'Cần Thơ Nhập fullface Raw',N'Team Can thơ bắt đầu sell FullFace raw',1,'2021-1-10','2021-01-15',4)
INSERT INTO dbo.PROJECT(Id,Name,Content,StatusProject,TimeFrom,TimeEnd,IdTeam) VALUES (7,N'Event với CLB Racing House VT',N'Tổ chức giao lưu với CLB ',1,'2020-12-12','2020-12-31',9)

go

INSERT INTO dbo.Task(Id,Name,Content,StatusTask,TimeFrom,TimeEnd,IdProject,IdStaff) VALUES (1,N'Task 1',N'Project 1',1,'2020-11-6','2020-11-10',1,3)
INSERT INTO dbo.Task(Id,Name,Content,StatusTask,TimeFrom,TimeEnd,IdProject,IdStaff) VALUES (2,N'Task 2',N'Project 2',1,'2021-1-10','2021-2-10',2,1)
INSERT INTO dbo.Task(Id,Name,Content,StatusTask,TimeFrom,TimeEnd,IdProject,IdStaff) VALUES (3,N'Task 3',N'Project 3',1,'2021-1-6','2021-2-1',3,1)
INSERT INTO dbo.Task(Id,Name,Content,StatusTask,TimeFrom,TimeEnd,IdProject,IdStaff) VALUES (4,N'Task 4',N'Project 2',1,'2021-01-10','2021-02-10',2,5)
INSERT INTO dbo.Task(Id,Name,Content,StatusTask,TimeFrom,TimeEnd,IdProject,IdStaff) VALUES (5,N'Task 5',N'Project 4',1,'2020-9-16','2020-10-5',4,6)
INSERT INTO dbo.Task(Id,Name,Content,StatusTask,TimeFrom,TimeEnd,IdProject,IdStaff) VALUES (6,N'Task 6',N'Project 4',1,'2020-9-20','2020-11-5',4,7)
INSERT INTO dbo.Task(Id,Name,Content,StatusTask,TimeFrom,TimeEnd,IdProject,IdStaff) VALUES (7,N'Task 7',N'Project 3',1,'2021-2-6','2021-2-18',3,8)
INSERT INTO dbo.Task(Id,Name,Content,StatusTask,TimeFrom,TimeEnd,IdProject,IdStaff) VALUES (8,N'Task 8',N'Project 7',1,'2020-12-12','2020-12-30',7,9)

go
go
---TẠO LƯƠNG CẢ NĂM 2020  
EXEC SP_addSalaryAllYear 2020
-- CONSTRAINT
ALTER TABLE STAFF ADD CONSTRAINT FK_IdTeam FOREIGN KEY (IdTeam) REFERENCES Team(Id)
ALTER TABLE TASKLIST ADD CONSTRAINT FK_IdTaskList FOREIGN KEY (Id) REFERENCES Task(Id)
ALTER TABLE TEAM ADD PRIMARY KEY(Id,IdAdmin)
Alter Table PROJECT ADD CONSTRAINT CHK_DatePROJECT Check( TimeEnd > TimeFrom)
Alter Table TASK ADD CONSTRAINT CHK_DateTASK Check( TimeEnd > TimeFrom)
ALTer Table TASK add CONSTRAINT FK_IdStaff  FOREIGN KEY (IdStaff) REFERENCES Staff(Id)
ALter table SALARY add constraint PK_MonthYear Unique (Month,SYear,IdStaff) 

--------------------------------------------------------------------------
--------------------------------------------------------------------------
go


--------------------------- stored listTaskName
---------------------------------------------------------------------------
ALTER PROC SP_storeTaskName(@CHAR nvarchar(50),@IdProject int,@IdStaff  int)
AS
begin TRANSACTION
	if(@IdProject = 0 and @IdStaff = 0 and @CHAR != N'')
	begin
		SELECT TASK.Id,TASK.Name,TASK.Content,TASK.TimeFrom,TASK.TimeEnd,TASK.StatusTask,TASK.status,STAFF.Name as N'nameStaff', PROJECT.Name AS N'nameProject'
		FROM TASK, STAFF,PROJECT
		WHERE CHARINDEX(@CHAR , TASK.Name)>0 AND TASK.IdStaff= STAFF.Id and TASK.IdProject = PROJECT.Id and TASK.status=1
		Group By TASK.Id,TASK.Name,TASK.Content,TASK.TimeFrom,TASK.TimeEnd,TASK.StatusTask,TASK.status,STAFF.Name , PROJECT.Name
	end
	else if(@IdProject = 0 and @IdStaff != 0 and @CHAR != N'')
	begin

		SELECT TASK.Id,TASK.Name,TASK.Content,TASK.TimeFrom,TASK.TimeEnd,TASK.StatusTask,TASK.status,STAFF.Name as N'nameStaff', PROJECT.Name AS N'nameProject'
		FROM TASK, STAFF,PROJECT
		WHERE CHARINDEX(@CHAR , TASK.Name)>0 AND TASK.IdStaff= @IdStaff and TASK.IdProject = PROJECT.Id AND TASK.IdStaff= STAFF.Id and TASK.status=1
		Group By TASK.Id,TASK.Name,TASK.Content,TASK.TimeFrom,TASK.TimeEnd,TASK.StatusTask,TASK.status,STAFF.Name , PROJECT.Name
	end

	else if(@IdStaff = 0 and @IdProject!= 0 and @CHAR != N'')
	begin

		SELECT TASK.Id,TASK.Name,TASK.Content,TASK.TimeFrom,TASK.TimeEnd,TASK.StatusTask,TASK.status,STAFF.Name as N'nameStaff', PROJECT.Name AS N'nameProject'
		FROM TASK, STAFF,PROJECT
		WHERE CHARINDEX(@CHAR , TASK.Name)>0 AND TASK.IdStaff= STAFF.Id and TASK.IdProject = @IdProject and TASK.IdProject = PROJECT.Id and TASK.status=1
		Group By TASK.Id,TASK.Name,TASK.Content,TASK.TimeFrom,TASK.TimeEnd,TASK.StatusTask,TASK.status,STAFF.Name , PROJECT.Name
	end

	else if(@IdProject = 0 and @IdStaff != 0 and @CHAR = N'')
	begin

		SELECT TASK.Id,TASK.Name,TASK.Content,TASK.TimeFrom,TASK.TimeEnd,TASK.StatusTask,TASK.status,STAFF.Name as N'nameStaff', PROJECT.Name AS N'nameProject'
		FROM TASK, STAFF,PROJECT
		WHERE TASK.IdStaff= @IdStaff and TASK.IdProject = PROJECT.Id AND TASK.IdStaff= STAFF.Id and TASK.status=1
		Group By TASK.Id,TASK.Name,TASK.Content,TASK.TimeFrom,TASK.TimeEnd,TASK.StatusTask,TASK.status,STAFF.Name , PROJECT.Name
	end

	else if (@IdStaff = 0 and @IdProject != 0 and @CHAR = N'')
	begin

		SELECT TASK.Id,TASK.Name,TASK.Content,TASK.TimeFrom,TASK.TimeEnd,TASK.StatusTask,TASK.status,STAFF.Name as N'nameStaff', PROJECT.Name AS N'nameProject'
		FROM TASK, STAFF,PROJECT
		WHERE TASK.IdStaff= STAFF.Id and TASK.IdProject = @IdProject and TASK.IdProject = PROJECT.Id and TASK.status=1
		Group By TASK.Id,TASK.Name,TASK.Content,TASK.TimeFrom,TASK.TimeEnd,TASK.StatusTask,TASK.status,STAFF.Name , PROJECT.Name
	end

	else --if(@CHAR = null and @IdProject != 0 and @IdStaff != 0 )
	begin
		SELECT TASK.Id,TASK.Name,TASK.Content,TASK.TimeFrom,TASK.TimeEnd,TASK.StatusTask,TASK.status,STAFF.Name as N'nameStaff', PROJECT.Name AS N'nameProject'
		FROM TASK, STAFF,PROJECT
		WHERE TASK.IdStaff= @IdStaff and TASK.IdProject = @IdProject AND TASK.IdStaff= STAFF.Id and TASK.IdProject = PROJECT.Id and TASK.status=1
		Group By TASK.Id,TASK.Name,TASK.Content,TASK.TimeFrom,TASK.TimeEnd,TASK.StatusTask,TASK.status,STAFF.Name , PROJECT.Name
	end
	
COMMIT TRANSACTION
exec SP_storeTaskName N'',2,0
go


------------------------- CHECK LOGIN FOR WEB
---------------------------------------------------------------------------


ALTER proc dbo.SP_Login(@username Nvarchar(50) , @password Nvarchar(20))
as
begin

		select *
		from ACCOUNT
		where UserName = @username and PassWord = HASHBYTES('MD5', @password)

	
end
EXEC dbo.SP_Login @username='ngocson1', @password = '123';
go



----------------------------store Update Password
---------------------------------------------------------------------------




ALTER PROC dbo.SP_storeUpdateInfoAccount(@userName Nvarchar(20), @passWord_new Nvarchar(20), @passWord_old Nvarchar(20))
as
begin
	declare @passWord Nvarchar(20)
	declare @changeLoginPassword nvarchar(max)

	select @passWord = PassWord
	from ACCOUNT
	where UserName = @userName

	if (@passWord = HASHBYTES('MD5', @passWord_old))
	begin
		update ACCOUNT
		set
			PassWord = HASHBYTES('MD5', @passWord_new)
		where
			UserName = @userName

	end
	else
		raiserror(N'Wrong password !!!', 16, 1)
end
ALter Login tutrung  with password = '456' OLD_PASSWORD = '123'


EXEC SP_storeUpdateInfoAccount @userName = N'thangdao', @passWord_new =N'123', @passWord_old =N'456'
EXEC dbo.SP_InforUser thangdao
go


--------------------------------- stored information of user
---------------------------------------------------------------------------


CREATE PROC SP_InforUser
@username NVARCHAR(100)
AS
BEGIN
	SELECT * FROM dbo.STAFF WHERE UserName = @username
END

EXEC dbo.SP_InforUser @username='thangdao';

go

ALTER PROC SP_storeInfoTeam(@idTeam int)
as
begin
	SELECT TEAM.Id , TEAM.Address,TEAM.Email,TEAM.Name,TEAM.Phone,TEAM.Phone,TEAM.IdAmin,STAFF.Name as N'Admin' 
	FROM dbo.TEAM INNER JOIN STAFF ON STAFF.Id = TEAM.IdAmin
	where TEAM.Id= @idTeam
end

EXEC SP_storeInfoTeam 3

----------------------------------- store List Team info
---------------------------------------------------------------------------
ALTER PROC SP_updateTeam(@id int,@Name NVARCHAR(100),@Address NVARCHAR(100),@Phone NVARCHAR(10),@Email NVARCHAR(100),@IdAdmin INT)
AS
BEGIN
		
		
		UPDATE TEAM SET Name = @Name, Address = @Address, Phone=@Phone, Email = @Email , IdAmin = @IdAdmin where Id = @id
			
		
END

go
ALTER PROC SP_ListInfoTeam

AS
BEGIN
	SELECT * FROM dbo.TEAM 
	WHERE status = 1
	Group By Id,Name,Address,Phone,Email,IdAmin,status

end

EXEC SP_ListInfoTeam;

go 

---------------------------------- Store List Task running
---------------------------------------------------------------------------

ALTER PROC SP_ListTaskRunning
as
BEGIN
	SELECT * FROM TASK Where TimeEnd > GETDATE()AND status = 1
	GROUP by Id,Name,Content,StatusTask,TimeFrom,TimeEnd,IdStaff,IdProject,status
END
EXEC SP_ListTaskRunning
go
Select DISTINCT STAFF.Id, Count(STAFF.Id)  From STAFF LEFT OUTER JOIN TASK  ON TASK.IdStaff = STAFF.Id or TASK.IdStaff = NULL GROUP BY STAFF.Id
------------------------------- store Staff Of Team
---------------------------------------------------------------------------
CREATE TABLE NumTask(
		NumTask Int Not Null,
		IdStaff 
)

ALTER PROC [dbo].[SP_storeStaffOfTeam](@IdTeam int)
AS
BEGIN	
				

		If(@IdTeam != 0)

			Select DISTINCT STAFF.Id ,STAFF.Name,STAFF.Phone, STAFF.Address,
					STAFF.Sex,STAFF.IdTeam, Count(STAFF.Id) As N'NumTask' ,ACCOUNT.Type
			from  STAFF LEFT OUTER JOIN TASK 
								ON TASK.IdStaff = STAFF.Id or TASK.IdStaff = NULL 
						INNER JOIN TEAM on STAFF.IdTeam = @IdTeam 
											and  TEAM.Id =STAFF.IdTeam
						INNER JOIN ACCOUNT on STAFF.UserName =ACCOUNT.UserName
			--)
			Group By STAFF.Id,STAFF.Name,STAFF.Phone,
					STAFF.Name,STAFF.Address,STAFF.Sex,STAFF.IdTeam,ACCOUNT.Type
END
go
exec SP_storeStaffOfTeam 5

--------------------------------- store List task
---------------------------------------------------------------------------


ALTER PROC SP_storeListTask
as
BEGIN
	SELECT * FROM TASK where status =1
END
EXEC SP_storeListTask



go


------------------------------ add Task
---------------------------------------------------------------------------


ALTER PROC SP_addTask (@Name NVARCHAR(100),
					@Content NVARCHAR(500),@IdProject int,
					@IdStaff int,@timeFrom DateTime,
					@timeEnd DateTime)
as
begin
	
	Declare @TimeEndPro DateTime
	Declare @TimeFromPro DateTime
	Declare @StatusProject int
	Declare @CheckStaff int
	Declare @CheckProject int
	-- check Project của Task
	Select @TimeEndPro = TimeEnd,
			@TimeFromPro =TimeFrom , 
			@StatusProject = StatusProject,
			@checkProject =status
			FROM PROJECT WHERE Id = @IdProject
	
	-- check Staff của TASK
	Select @CheckStaff = status
	from STAFF
	Where @IdStaff= STAFF.Id

	IF(@timeFrom<@timeEnd and @timeFrom >= @TimeFromPro 
					and @timeEnd <= @TimeEndPro 
					and @checkProject =1 and @CheckStaff =1)
	begin
		Insert TASK(Name,Content,IdProject,
					IdStaff,TimeFrom,
					TimeEnd,status) 
		Values(@Name,@Content,@IdProject,
				@IdStaff,@timeFrom,@timeEnd,
				@checkProject)
	end
	else
		raiserror(N'Wrong Task !!!',12,1)
end
go


------------------------------------- Delete Task
---------------------------------------------------------------------------


ALTER PROC SP_DeleteTask(@Id int)
as
set nocount on
Begin
	Begin try
	begin transaction
			Update TASK set status = 0 where Task.Id=@Id

	commit
	end try
	begin catch

		IF (XACT_STATE()) = -1  
        BEGIN   
            ROLLBACK TRANSACTION;  
        END;
		
	end catch
End
go
EXEC SP_DeleteTask 9

----------------------------------- add Account
---------------------------------------------------------------------------


ALTER PROC SP_addAccount(@DisplayName NVARCHAR(50),@UserName NVARCHAR(50),@Password NVARCHAR(25),@Type NVARCHAR(15))
as
begin
	INSERT INTO ACCOUNT(UserName,DisplayName,PassWord,Type) VALUES (@UserName,@DisplayName,HASHBYTES ('MD5', @Password),@Type)
end
go
EXEC SP_addAccount N'Dao Van Thang',N'thangdao1',N'123',N'Emp'

----------------------------------- Delete Account
---------------------------------------------------------------------------



ALTER PROC SP_DeleteAccount(@UserName NVARCHAR(50), @status int)
AS
BEGIN
	Declare @type_old NVARCHAR(15),@CK_Staff int
	SELECT @CK_Staff = COUNT(Id) FROM STAFF WHERE STAFF.UserName = @UserName AND status =1
	if(@status = 0 AND @CK_Staff =0)
		Update ACCOUNT set status = 0 where @UserName =UserName
	Select Type From ACCOUNT where @UserName =UserName

END
go


--------------------------------- Add Staff--------------------------------
---------------------------------------------------------------------------


ALTER PROC SP_addStaff(@Name NVARCHAR(100),@DateOfBirth Date,
							@Address NVARCHAR(100),
							@Sex NVARCHAR(10),
							@Phone NVARCHAR(10),
							@Email NVARCHAR(50),
							@UserName NVARCHAR(50),
							@Password Nvarchar(28),
							@IdTeam int,@Type NVARCHAR(15))
AS
BEGIN TRANSACTION
		DECLARE @StatusTeam int, 
				@StatusAccount int,
				@UserNameAdd NVARCHAR(100)
				
			SELECT @StatusTeam = status FROM TEAM WHERE TEAM.Id = @IdTeam AND status =1
			SELECT @StatusAccount = status FROM ACCOUNT WHERE ACCOUNT.UserName = @UserName
			
		
			BEGIN TRY
				SELECT @UserNameAdd = REPLACE(@UserName, ' ', '')
				EXEC SP_addAccount @Name,@UserName,@Password,@Type
				SELECT @StatusAccount =1
			END TRY
			BEGIN Catch
			END catch
		If(@StatusAccount = 0)
			BEGIN
				
				UPDATE ACCOUNT SET status =1 ,PassWord =@Password, Type = @Type where UserName = @UserName
				SELECT @StatusAccount =1
			END
		IF(@StatusTeam=1 and @StatusAccount =1)
			BEGIN TRY
				INSERT INTO dbo.STAFF(Name,DateOfBirth,Address,Sex,Phone,Email,IdTeam,UserName) 
				VALUES (@Name,@DateOfBirth, @Address,@Sex,@Phone,@Email,@IdTeam,@UserName)
			END TRY
			BEGIN catch
				raiserror(N'User Name is not Valid !!!', 16, 1)
			END Catch

COMMIT TRANSACTION
GO
EXEC SP_addStaff N'thangdao','2000-01-27',N'Vo Van Ngan, Thu Duc, HCM', N'male', N'0394444447',N'thangdao2701007@gmail.com',N'daothang4',N'123',5,N'Emp'
------------------------------------ Delete Staff--------------------------
---------------------------------------------------------------------------

ALTER PROC SP_DeleteStaff(@Id INT,@status INT)
AS
BEGIN
		DECLARE @CK_TeamAdmin INT, @CK_Task INT
		SELECT @CK_TeamAdmin = COUNT(*) FROM TEAM WHERE IdAmin=@Id AND status =1
		SELECT @CK_Task = COUNT(*) FROM TASK WHERE IdStaff = @Id AND status =1
		IF(@CK_Task = 0 AND @CK_TeamAdmin=0)
		BEGIN 
			UPDATE STAFF SET status = 0 WHERE Id = @Id
		END
END
GO

------------------------------------------- Add Project--------------------
---------------------------------------------------------------------------



ALTER PROC SP_addProject(@Name NVARCHAR(100),@Content NVARCHAR(500),@IdTeam int,@timeFrom DateTime,@timeEnd DateTime)
AS
BEGIN
		DECLARE @StatusTeam int
		SELECT @StatusTeam = status FROM TEAM WHERE TEAM.Id = @IdTeam AND status=1
		IF(@StatusTeam !=0 )
		BEGIN 
			INSERT INTO dbo.PROJECT(Name,Content,IdTeam,TimeFrom,TimeEnd) VALUES (@Name,@Content,@IdTeam,@timeFrom,@timeEnd)
		END
END
GO


------------------------------------ Delete Project
---------------------------------------------------------------------------


ALTER PROC SP_DeleteProject (@Id int,@Status int)
AS
BEGIN
		DECLARE @CK_TASK INT
		SELECT @CK_TASK = COUNT(*) FROM TASK WHERE TASK.IdProject = @Id AND status =1
		
		IF(@CK_TASK = 0)
				UPDATE PROJECT SET status = 0 WHERE Id =@Id
END
GO


---------------------------------------------- Add Team
---------------------------------------------------------------------------




ALTER PROC SP_addTeam(@Name NVARCHAR(100),@Address NVARCHAR(100),@Phone NVARCHAR(10),@Email NVARCHAR(100),@IdAdmin INT)
AS
BEGIN
		DECLARE @CK_IdAdmin INT 
		SELECT @CK_IdAdmin = COUNT(Id) FROM STAFF WHERE Id = @IdAdmin AND status =1
		IF(@CK_IdAdmin<>0)
		BEGIN
				INSERT INTO TEAM (Name,Address,Phone,Email,IdAmin) VALUES (@Name,@Address,@Phone,@Email,@IdAdmin)
		END
END
EXEC SP_addTeam N'aaaaaaaaaaaa',N'aaaaaaaa',N'0123456789',N'aaaaa',12

-- Delete Team

SELECT COUNT(Id) FROM STAFF WHERE STAFF.IdTeam = 10 AND status =1

ALTER PROC SP_DeleteTeam(@Id int, @status int)
AS
BEGIN
		DECLARE @CK_IdStaff int
		SELECT @CK_IdStaff = COUNT(Id) FROM STAFF WHERE STAFF.IdTeam = @Id AND status =1
		IF(@CK_IdStaff = 0)
		BEGIN
				UPDATE TEAM SET  status = 0 WHERE Id =@Id
		END
		ELSE
			raiserror(N'Team have some Staff Working, please check the Team have no Staff Before Delete  !!!', 16, 1)
END

SP_DeleteTeam 1,1
-------------------------------- Add Salary for all Staff Year
---------------------------------------------------------------------------
go
CREATE PROC SP_storeMysalary(@username NVARCHAR(50))
as
begin
				Select  Month ,SYear, STAFF.Name ,Salary as 'FixedSalary' ,Bonus,TEAM.Name AS 'Team'
                From STAFF,SALARY,TEAM 
                WHERE STAFF.Id = SALARY.IdStaff AND STAFF.IdTeam = TEAM.Id AND Month = MONTH(GETDATE()) and SYear = YEAR(GETDATE()) and STAFF.UserName = @username
end
go

ALTER PROC SP_addSalaryAllYear(@year int)
AS
		
BEGIN
		DECLARE @CK_Salary int, @Month int,@Salary Real,@Id int,@Type NVARCHAR(20)
		
		DECLARE cursor_addSalaryAllYear CURSOR FOR
				SELECT STAFF.Id,Type
				FROM STAFF,ACCOUNT
				where STAFF.UserName=ACCOUNT.UserName AND STAFF.status =1
		OPEN cursor_addSalaryAllYear

			FETCH NEXT FROM cursor_addSalaryAllYear INTO @Id,@Type
			
			WHILE @@FETCH_STATUS = 0
			BEGIN
				IF(@Type = N'Admin')
					SELECT	@Salary = 9700
				ELSE IF (@Type = N'LeaderTeam')
					SELECT	@Salary = 8500
				ELSE IF(@Type = N'Emp')
					SELECT @Salary = 7500
				SELECT @Month = 1
				While @Month <= 13
				BEGIN
					SELECT @CK_Salary = COUNT(IdStaff) FROM SALARY,STAFF WHERE STAFF.Id =IdStaff and SALARY.IdStaff =@Id and STAFF.status = 1 and Month =@Month and SYear =@year
					IF(@CK_Salary =0 and @month !=13)
					BEGIN
						INSERT INTO SALARY (Month, SYear,IdStaff,Salary,Bonus) VALUES (@Month,@year,@Id,@Salary,0)
					END
					IF(@CK_Salary =0 and @month =13)
					BEGIN
						INSERT INTO SALARY (Month, SYear,IdStaff,Salary,Bonus) VALUES (@Month,@year,@Id,0,0)
					END
					SELECT @Month = @month +1
				END
				
				FETCH NEXT FROM cursor_addSalaryAllYear INTO  @Id,@Type
			END
		CLOSE cursor_addSalaryAllYear
		DEALLOCATE cursor_addSalaryAllYear

END
EXEC SP_addSalaryAllYear 2021
GO
select * FROM SALARY
EXEC SP_addSalaryAllYear 2020
select * FROM SALARY

------------------------------------ Account Create
---------------------------------------------------------------------------

Create proc SP_Account_Create(@username nvarchar(20),@password nvarchar(max),@namerole nvarchar(50)) as
BEGIN
	DECLARE @createUser nvarchar(max)
	DECLARE @createLogin nvarchar(max)
	DECLARE @addLeaderRole nvarchar(max)
	DECLARE @addEmpRole nvarchar(max)
	DECLARE @addAdminRole nvarchar(max)
	DECLARE @error int 

	SET @error=0
	SET @createLogin='create login '+ @username + ' with password = ' + Char(39) + @password + Char(39)
	SET @createUser='create user '+ @username + ' for login '+ @username
	SET @addLeaderRole='Sp_addRoleMember' + Char(39) +'projectsRole' + Char(39) + ',' + Char(39) + @username + Char(39)  
	SET @addAdminRole='Sp_addRoleMember' + Char(39) +'db_owner' + Char(39) + ',' + Char(39) + @username + Char(39)
	SET @addEmpRole='Sp_addRoleMember' + Char(39) +'empRole' + Char(39) + ',' + Char(39) + @username + Char(39)
	BEGIN TRY
			BEGIN TRANSACTION 
		
			EXEC (@createLogin)
			EXEC (@createUser)

			IF(@namerole = N'Admin')	
			EXEC (@addAdminRole)

			IF(@namerole = N'LeaderTeam')	
			EXEC (@addLeaderRole)

			IF(@namerole = N'Emp')	
			EXEC (@addEmpRole)

			COMMIT
	END TRY
	BEGIN CATCH 
	 
        IF (XACT_STATE()) = -1  
        BEGIN   
            ROLLBACK TRANSACTION;  
        END;
    END CATCH
END


----------------- lay ds lương theo tháng của từng team -- @choose =1 là down, =0 là Up
---------------------------------------------------------------------------


ALTER PROC SP_storeSalaryTeam(@IdTeam int,@month int,@year int,@choose int)
as
BEGIN 
	IF(@IdTeam = 0  and @month <>0 and @choose=1)
	Begin
		SELECT Month ,SYear, STAFF.Name ,Salary as 'FixedSalary' ,Bonus,TEAM.Name AS 'Team'
		From STAFF,SALARY,TEAM 
		WHERE STAFF.Id = SALARY.IdStaff AND STAFF.IdTeam = TEAM.Id AND Month = @month and SYear = @year and STAFF.status =1
		Group by Month,SYear,STAFF.Name,Salary,Bonus,TEAM.Name
		ORDER BY FixedSalary ASC
	end
	else IF(@IdTeam <> 0  and @month = 0 and @choose=1)
	Begin
		SELECT Month ,SYear , STAFF.Name ,Salary as 'FixedSalary' ,Bonus,TEAM.Name AS 'Team'
		From STAFF,SALARY,TEAM 
		WHERE STAFF.Id = SALARY.IdStaff AND STAFF.IdTeam = TEAM.Id AND STAFF.IdTeam =@IdTeam and SYear = @year and STAFF.status =1
		Group by Month,SYear,STAFF.Name,Salary,Bonus,TEAM.Name
		ORDER BY FixedSalary ASC
	end
	else IF(@IdTeam = 0  and @month = 0 and @choose=1)
	Begin
		SELECT Month ,SYear,  STAFF.Name ,Salary as 'FixedSalary' ,Bonus,TEAM.Name AS 'Team'
		From STAFF,SALARY,TEAM 
		WHERE STAFF.Id = SALARY.IdStaff AND STAFF.IdTeam = TEAM.Id  and SYear = @year and STAFF.status =1
		Group by Month,SYear,STAFF.Name,Salary,Bonus,TEAM.Name
		ORDER BY FixedSalary ASC
	end
	else IF(@IdTeam = 0  and @month = 0 and @choose=0)
	Begin
		SELECT Month ,SYear,  STAFF.Name ,Salary as 'FixedSalary' ,Bonus,TEAM.Name AS 'Team'
		From STAFF,SALARY,TEAM 
		WHERE STAFF.Id = SALARY.IdStaff AND STAFF.IdTeam = TEAM.Id  and SYear = @year and STAFF.status =1
		Group by Month,SYear,STAFF.Name,Salary,Bonus,TEAM.Name
		ORDER BY FixedSalary DESC
	end
	else IF(@IdTeam <> 0  and @month <> 0 and @choose=1)
	begin
		SELECT Month ,SYear , STAFF.Name ,Salary as 'FixedSalary' ,Bonus,TEAM.Name AS 'Team'
		From STAFF,SALARY,TEAM 
		WHERE STAFF.Id = SALARY.IdStaff AND STAFF.IdTeam = TEAM.Id AND STAFF.IdTeam =@IdTeam AND Month = @month and SYear = @year and STAFF.status =1
		Group by Month,SYear,STAFF.Name,Salary,Bonus,TEAM.Name
		ORDER BY FixedSalary ASC
	end
	else IF(@IdTeam = 0  and @month <>0 and @choose=0)
	Begin
		SELECT Month ,SYear, STAFF.Name ,Salary as 'FixedSalary' ,Bonus,TEAM.Name AS 'Team'
		From STAFF,SALARY,TEAM 
		WHERE STAFF.Id = SALARY.IdStaff AND STAFF.IdTeam = TEAM.Id AND Month = @month and SYear = @year and STAFF.status =1
		Group by Month,SYear,STAFF.Name,Salary,Bonus,TEAM.Name
		ORDER BY FixedSalary DESC
	end
	else IF(@IdTeam <> 0  and @month = 0 and @choose = 0)
	Begin
		SELECT Month ,SYear , STAFF.Name ,Salary as 'FixedSalary' ,Bonus,TEAM.Name AS 'Team'
		From STAFF,SALARY,TEAM 
		WHERE STAFF.Id = SALARY.IdStaff AND STAFF.IdTeam = TEAM.Id AND STAFF.IdTeam =@IdTeam and SYear = @year and STAFF.status =1
		ORDER BY FixedSalary DESC
	end
	
	else IF(@IdTeam <> 0  and @month <> 0 and @choose = 0)
	begin
		SELECT Month ,SYear, STAFF.Name ,Salary as 'FixedSalary' ,Bonus,TEAM.Name AS 'Team'
		From STAFF,SALARY,TEAM 
		WHERE STAFF.Id = SALARY.IdStaff AND STAFF.IdTeam = TEAM.Id AND STAFF.IdTeam =@IdTeam AND Month = @month and SYear = @year and STAFF.status =1
		Group by Month,SYear,STAFF.Name,Salary,Bonus,TEAM.Name
		ORDER BY FixedSalary DESC
	end
END
exec SP_storeSalaryTeam 0,12,2020,0
go


------------------------------- Tính lương theo tháng của từng nhân viên 
---------------------------------------------------------------------------



ALTER PROC SP_checkSalaryMonth( @month int, @year int)
AS
SET NOCOUNT ON
BEGIN
	
	DECLARE @count int
	DECLARE @IdStaff int, @salary real ,@bonus real

	---lay danh sach Salary dua vao con tro cursor_date
	DECLARE cursor_SALARY_MONTH CURSOR FOR
		SELECT Month , SYear,IdStaff, Salary ,Bonus
		FROM SALARY,STAFF
		where Month = @month and SYear = @year AND IdStaff=Id AND STAFF.status=1

	OPEN cursor_SALARY_MONTH

	FETCH NEXT FROM cursor_SALARY_MONTH INTO @month,@year,@IdStaff,@salary,@bonus 

	WHILE @@FETCH_STATUS = 0
	BEGIN
	
		Select @count = Count(*)  
		from TASK,STAFF
		where TASK.IdStaff = STAFF.Id and  STAFF.Id = @IdStaff 
									and MONTH(TimeEnd) >= @month 
									and MONTH(TimeFrom) <= @month 
									and TASK.status = 1 
									and YEAR(TimeEnd) >= @year
									and YEAR(TimeFrom) <= @year

		IF(@count > 0)
		Begin
			update SALARY set Bonus = Salary*0.01*@count WHERE IdStaff=@IdStaff 
							AND Month= @month AND SYear = @year
		end
		else if (@count = 0)
			update SALARY set Bonus = Salary*(-0.005) WHERE IdStaff=@IdStaff 
							AND Month= @month AND SYear = @year

		FETCH NEXT FROM cursor_SALARY_MONTH INTO  @month,@year,@IdStaff,@salary,@bonus 
	END

	CLOSE cursor_SALARY_MONTH
	DEALLOCATE cursor_SALARY_MONTH
END


go
EXEC SP_checkSalaryMonth 1,2020

------------------------------ Tính lương thưởng tháng 13 của nhân viên
---------------------------------------------------------------------------


ALTER PROC SP_checkSalaryYearStaff( @year int)
as
Begin
		
		DECLARE @SumSalary real,@SumBonus real,
				@CountKPIProject int , @IdStaff int,
				@salary real,@bonus real
		
		DECLARE cursor_SALARY_Year CURSOR FOR
				SELECT SYear,IdStaff, Salary ,Bonus
				FROM SALARY,STAFF
				where SYear = @year and Month = 13 AND IdStaff=Id AND STAFF.status=1
		OPEN cursor_SALARY_Year

			FETCH NEXT FROM cursor_SALARY_Year INTO @year,@IdStaff,@salary,@bonus 
			WHILE @@FETCH_STATUS = 0
			BEGIN
					Select @CountKPIProject = Count(TASK.Id)
					from TASK inner join PROJECT on PROJECT.Id = TASK.IdProject 
					and YEAR(PROJECT.TimeEnd) = @year
					where TASK.IdStaff = @IdStaff
						and PROJECT.StatusProject = 1
				
				Select @SumSalary= Sum(Salary)  , @SumBonus= Sum(Bonus)  From Salary 
				Where IdStaff = @IdStaff And SYear = @year AND Month<>13
				
				IF(@CountKPIProject >= 5)
				Begin
					update SALARY set Salary = @CountKPIProject*0.2*@SumBonus 
					where IdStaff=@IdStaff AND Month= 13 And SYear = @year
				end
				else if (@CountKPIProject >= 10)
					update SALARY set Salary = @CountKPIProject*0.5*@SumBonus 
					where IdStaff=@IdStaff AND Month= 13 And SYear = @year
				else if (@CountKPIProject <5 )
					update SALARY set Salary = 0 
					where IdStaff=@IdStaff AND Month= 13 And SYear = @year
				FETCH NEXT FROM cursor_SALARY_Year INTO  @year,@IdStaff,@salary,@bonus 
			END
		CLOSE cursor_SALARY_Year
		DEALLOCATE cursor_SALARY_Year
end

	EXEC SP_checkSalaryYearStaff 2020
go


----------------------------- tính lương thưởng tháng 13 của Admin
---------------------------------------------------------------------------


ALTER PROC SP_checkSalaryYearAdmin( @year int)
as
Begin
		declare @count int,@IdStaff int,@salary real,@bonus real
		
		DECLARE cursor_SALARY_YearAdmin CURSOR FOR
				SELECT SYear,IdStaff, Salary ,Bonus
				FROM SALARY,TEAM
				where SYear = @year and Month = 13 AND IdStaff = TEAM.IdAmin
		OPEN cursor_SALARY_YearAdmin

			FETCH NEXT FROM cursor_SALARY_YearAdmin INTO @year,@IdStaff,@salary,@bonus 
			WHILE @@FETCH_STATUS = 0
			BEGIN
						Select @count = Count(PROJECT.Id)  
						from PROJECT,TEAM
						where PROJECT.IdTeam = TEAM.Id and  TEAM.IdAmin = @IdStaff 
								and YEAR(TimeEnd) = @year AND StatusProject = 1
		
				IF(@count > 0)
				Begin
					update SALARY set Bonus = @count*2000 where IdStaff=@IdStaff AND Month= 13 And SYear = @year
				end
				else if (@count =0)
					update SALARY set Bonus = 0 where IdStaff=@IdStaff AND Month= 13 And SYear = @year

				FETCH NEXT FROM cursor_SALARY_YearAdmin INTO  @year,@IdStaff,@salary,@bonus 
			END
		CLOSE cursor_SALARY_YearAdmin
		DEALLOCATE cursor_SALARY_YearAdmin
		
end



------------------------------------- Update STAFF
---------------------------------------------------------------------------


go
ALTER PROC SP_UpdateStaff(@Name NVARCHAR(100),@DateOfBirth Date,@Address NVARCHAR(100),@Sex NVARCHAR(10),
							@Phone NVARCHAR(10),@Email NVARCHAR(50),@IdTeam int ,@UserName NVARCHAR(50) )
AS
BEGIN 
		IF(YEAR(@DateOfBirth)<(YEAR(GETDATE())-18))
		UPDATE STAFF SET Name=@Name, DateOfBirth = @DateOfBirth,Address =@Address, Sex = @sex,
								Phone = @Phone,Email =@Email,IdTeam = @IdTeam
								where UserName = @UserName
		
END

go
----------------------------------- stored procedure Salary in this month
---------------------------------------------------------------------------
ALTER FUNCTION FN_storeListSalary()
RETURNS TABLE
AS RETURN (
				Select  Month ,SYear, STAFF.Name ,Salary as 'FixedSalary' ,Bonus,TEAM.Name AS 'Team'
                From STAFF,SALARY,TEAM 
                WHERE STAFF.Id = SALARY.IdStaff AND STAFF.IdTeam = TEAM.Id AND Month = MONTH(GETDATE()) and SYear = YEAR(GETDATE())
)
SELECT* from FN_storeListSalary()
go


------------------------ lấy ra 5 người nhân viên làm việc top  của từng team
---------------------------------------------------------------------------

go
ALTER FUNCTION FN_storeTop5_StaffOfTeam(@IdTeam INT)
RETURNS TABLE
AS RETURN 
(
		SELECT top 5 COUNT(TASK.Id) AS N'NumTask' , STAFF.Id,STAFF.Name
		FROM TASK INNER JOIN STAFF ON STAFF.Id = TASK.IdStaff
					INNER JOIN TEAM ON STAFF.IdTeam = TEAM.Id AND TEAM.Id = @IdTeam
					where TASK.status =1
		GROUP BY STAFF.Id,STAFF.Name
		ORDER BY COUNT(TASK.Id) DESC
) 
go


------------------------ chọn ra 5 người có lương cao nhất công ty 
---------------------------------------------------------------------------

CREATE FUNCTION FN_storeTop5_SalaryOfCompany(@Year int)
RETURNS TABLE
AS RETURN 
(
		SELECT TOP 5 SUM(SALARY.Salary + SALARY.Bonus) AS N'SumSalary', 
					STAFF.Id,STAFF.Name,TEAM.Name AS N'Team'
		FROM SALARY INNER JOIN STAFF ON STAFF.Id = IdStaff 
					INNER JOIN TEAM ON STAFF.IdTeam = TEAM.Id
		WHERE SALARY.SYear = @Year 
		GROUP BY STAFF.Id,STAFF.Name,TEAM.Name
		ORDER BY SUM(SALARY.Salary+ SALARY.Bonus) DESC
) 
go


---------------------------- tính tổng lương của top 5 team cao nhất
--------------------------------------------------------------------

ALTER FUNCTION FN_storeSumSalaryTeam()
RETURNS TABLE
AS RETURN 
(		
		SELECT TOP 5 SUM(SALARY.Salary + SALARY.Bonus) AS N'SumSalary',
				TEAM.Id, TEAM.Name, STAFF.Name as N'Name Admin'
		FROM STAFF INNER JOIN SALARY ON IdStaff = STAFF.Id 
					INNER JOIN TEAM ON TEAM.Id = IdStaff AND TEAM.IdAmin = STAFF.Id
		GROUP BY TEAM.Id, TEAM.Name,STAFF.Name
		ORDER BY SUM(SALARY.Salary + SALARY.Bonus) DESC

) 

go


--------------------------------- store List Project Running
---------------------------------------------------------------------------

ALTER FUNCTION FN_storeListProjectRunning ()
RETURNS TABLE
AS RETURN (
		SELECT * FROM PROJECT Where TimeEnd > GETDATE() AND status = 1
		GROUP BY Id, Name,Content,StatusProject,TimeFrom,TimeEnd,IdTeam,status
)
SELECT * FROM FN_storeListProjectTeam(1)

go 

-------------------------------- store Project follow IDTeam
---------------------------------------------------------------------------

CREATE FUNCTION FN_storeListProjectTeam(@IdTeam INT)

RETURNS TABLE
AS RETURN 
(SELECT * FROM PROJECT Where IdTeam = @IdTeam AND status = 1 And StatusProject =1
) 

go


------------------------------ function set chữ có dấu vè ko dấu
---------------------------------------------------------------------------


CREATE FUNCTION [dbo].[FN_ConvertToUnsign1] ( @strInput NVARCHAR(4000) ) RETURNS NVARCHAR(4000) 
AS 
BEGIN 
	IF @strInput IS NULL 
		RETURN @strInput 
	IF @strInput = '' 
		RETURN @strInput 
	DECLARE @RT NVARCHAR(4000) 
	DECLARE @SIGN_CHARS NCHAR(136) 
	DECLARE @UNSIGN_CHARS NCHAR (136) 
	SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) 
	SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' 
	DECLARE @COUNTER INT
	DECLARE @COUNTER1 int 
	SET @COUNTER = 1 
	WHILE (@COUNTER <=LEN(@strInput)) 
	BEGIN 
		SET @COUNTER1 = 1 
		WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) 
		BEGIN IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) ) 
		BEGIN IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1) 
		ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) 
		BREAK END SET @COUNTER1 = @COUNTER1 +1 END SET @COUNTER = @COUNTER +1 END SET @strInput = replace(@strInput,' ','-') 
		RETURN @strInput 
END
go
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
---------------------- Trigger Update Table

ALTER TRIGGER TG_UpDateStaff
ON dbo.STAFF FOR UPDATE,insert
AS
BEGIN
	DECLARE @id int,
			@userName NVARCHAR(50),
			@name NVARCHAR(50),
			@status INT,
			@address NVARCHAR(100),
			@email NVARCHAR(50),
			@phone NVARCHAR(10),
			@idTeam INT,
			@dateOfBirth DATE,
			@sex NVARCHAR(10),
			@aboutStaff NVARCHAR(500)
	
	--
		SELECT @id = Id, @userName = UserName, @status=status , @email= Email ,@phone =Phone,@idTeam =IdTeam FROM Inserted
	--
	DECLARE @CK_TASK int
	DECLARE @CK_TEAM int

			Select @CK_TASK = Count(*)
			From TASK
			Where TASK.IdStaff = @id
		
			Select @CK_TEAM = Count(*)
			From TEAM
			Where @idTeam = TEAM.IdAmin
	-- check Task and TEAM admin

			IF(@status = 0)
			BEGIN
				If (@CK_TASK != 0 or @CK_TEAM != 0)
					Update STAFF set status=1 where Id=@id
			END

			

	-- check Id_Team
			DECLARE @CK_IdTeam int 
			SELECT @CK_IdTeam = status
			FROM TEAM where TEAM.Id = @idTeam

			IF (@CK_IdTeam = 0 or @CK_IdTeam= NULL)
			BEGIN
				Update STAFF set status=0 where Id=@id
			END

	--- check email, phone
	IF(@email = N'' or len(@phone)<>10  or @idTeam is null )
	BEGIN 
		Update STAFF set Email = N'CELLO'+ convert(nvarchar(10), Id) +N'@gmail.com' , 
				Phone = '012345678'+ convert(nvarchar(10), @id)+ convert(nvarchar(10), 
				Id)
		where UserName=@userName
	END
	DECLARE @Year int
	SELECT @Year = YEAR(GETDATE())
	EXEC SP_addSalaryAllYear @Year
END
--------------



go 

ALTER TRIGGER TG_UpdateBonusSalary
ON dbo.TASK FOR INSERT,update
AS
BEGIN

	Declare @IdStaff int,
	@IdStask int,
	@salary int,
	@month int,
	@year int,
	@timeEnd DateTime,
	@timeFrom DateTime,
	@CK_Month DateTime,
	@status int,
	@count int

	Select @IdStaff= IdStaff, @CK_Month = TimeFrom , @timeEnd=TimeEnd ,@timeFrom = timeFrom ,@status=status From inserted 
	
	
	while @CK_Month >= @timeFrom and @CK_Month <= 12
	begin transaction
		Select @count = Count(*) From TASK where IdStaff=@IdStaff and YEAR(@timeEnd)=YEAR(TimeEnd) 
												and MONTH(@timeEnd)=MONTH(TimeEnd) 
												and status = 1
												and StatusTask = 1
		SELECT @month = Month(@CK_Month);
		SELECT @year = YEAR(@CK_Month);

		If(@count > 0 and @month != 12 )
			begin
				update SALARY set Bonus = Salary*0.1*@count where IdStaff=@IdStaff AND Month= @month AND SYear =@year
			end
		else if(@count = 0 and @month != 12)
			begin
				update SALARY set Bonus = Salary*(-0.005) where IdStaff=@IdStaff AND Month= @month AND SYear =@year
			end
		EXEC SP_checkSalaryYearStaff @year
		EXEC SP_checkSalaryYearAdmin @year
	commit transaction
END
go

ALTER TRIGGER TG_UpdateBonusSalary_Deleted
ON dbo.TASK FOR update
AS
BEGIN
	
	Declare @IdStaff int,
	@IdStask int,
	@salary int,
	@month int,
	@year int,
	@timeEnd DateTime,
	@status int,
	@count int

	Select @IdStaff= IdStaff , @timeEnd=TimeEnd ,@status=status From deleted 

	Select @count = Count(*) From TASK where IdStaff=@IdStaff and YEAR(@timeEnd)=YEAR(TimeEnd) 
												and MONTH(@timeEnd)=MONTH(TimeEnd) 
												and status = 1
												and StatusTask = 1
	SELECT @month = MONTH(@timeEnd);
	SELECT @year = YEAR(@timeEnd);

	If(@count > 0 and @month != 12 )
		begin
			update SALARY set Bonus = Salary*0.01*@count where IdStaff=@IdStaff AND Month= @month AND SYear =@year
		end
	else if(@count = 0 and @month != 12)
		begin
			update SALARY set Bonus = Salary*(-0.005) where IdStaff=@IdStaff AND Month= @month AND SYear =@year
		end

END
go

-- khi set Project bị xóa thì các Task cũng bị xóa theo
ALTER Trigger TG_UpdateStatusProject
On dbo.PROJECT FOR UPDATE
as
BEGIN
	DECLARE @IdProject int,
	@IdTask int,
	@StatusPro int,
	@Status int,
	@StatusTask int,
	@year int
	SELECT @IdProject = Id ,@Status = status,@StatusPro =StatusProject, @year = YEAR(TimeEnd) FROM inserted
	IF(@Status = 0)
	BEGIN	
			UPDATE TASK SET status = 0 where IdProject =@IdProject
	END
	IF(@StatusPro = 0)
	BEGIN	
			UPDATE PROJECT SET StatusProject =0 where Id = @IdProject
	END
		EXEC SP_checkSalaryYearStaff @year
		EXEC SP_checkSalaryYearAdmin @year
	
END
go

ALTER TRIGGER TG_UpdateTimeProjectStaff_Task
ON dbo.TASK FOR UPDATE
AS
BEGIN
	DECLARE @IdTask int,
	@TimeFromTask DateTime,
	@TimeEndTask DateTime,
	@IdProject int,
	@CK_StatusPro int,
	@CK_DonePro int,
	@TimeFromPro DateTime,
	@TimeEndPro DateTime,
	@IdStaff int,
	@CK_StatusTask int,
	@CK_Status int
	SELECT @IdTask = Id , 
			@TimeFromTask= TimeFrom,
			@TimeEndTask = TimeEnd,
			@IdStaff = IdStaff,
			@IdProject =IdProject,
			@CK_StatusTask = status
			FROM inserted
	SELECT @TimeFromPro = TimeFrom ,@TimeEndPro = TimeEnd,@CK_StatusPro = StatusProject
	FROM PROJECT
	WHERE Id=@IdProject
	SELECT @CK_Status = status FROM STAFF WHERE Id =@IdStaff
	IF(@TimeFromTask < @TimeFromPro)
	begin
			UPDATE TASK SET TimeFrom =@TimeFromPro where Id= @IdTask
	end
	IF(@TimeFromTask > @TimeEndPro)
	begin
			UPDATE TASK SET TimeFrom =@TimeFromPro where Id= @IdTask
	end
	IF(@TimeEndTask > @TimeEndPro)
			UPDATE TASK SET TimeEnd =@TimeEndPro where Id= @IdTask
	IF(@TimeEndTask < @TimeFromPro)
			UPDATE TASK SET TimeEnd =@TimeEndPro where Id= @IdTask
	IF(@CK_Status != 1 or @CK_StatusPro != 1 )
	BEGIN
			UPDATE TASK SET status = 0 where Id= @IdTask
	END
	IF(@CK_StatusTask=0)
			UPDATE TASK SET StatusTask = 0 where Id= @IdTask
END
go
CREATE TRIGGER TG_InsertTask
ON dbo.TASK FOR INSERT
AS
BEGIN
		DECLARE @IdTask int,
		@IdProject int,
		@TimeEndPro DateTime,
		@CK_StatusPro int
		SELECT @IdTask = Id, 
			@IdProject =IdProject 
			FROM inserted
		SELECT @TimeEndPro = TimeEnd, @CK_StatusPro = StatusProject
		FROM PROJECT
		WHERE Id=@IdProject
		If(@TimeEndPro < GETDATE())
			UPDATE TASK SET StatusTask =0 , status = 0  where Id= @IdTask

END

go

----------------------------------------------------------------------------------------------------------


GO

--------------------------------------VIEW------------------------------------
------------------------------------------------------------------------------
GO 
CREATE VIEW View_AdminTeam
AS
	select STAFF.Id,STAFF.Name,DateOfBirth,STAFF.Address,Sex,STAFF.Phone,STAFF.Email,STAFF.UserName 
	from STAFF,TEAM 
	where   STAFF.Id = IdAmin 
GO

select * FROM View_AdminTeam
GO
CREATE VIEW View_TeamInfo
AS
(
		SELECT * FROM TEAM
)
	select * FROM	View_TeamInfo
CREATE VIEW View_ProjectTeam
AS
(
	SELECT PROJECT.Name,PROJECT.StatusProject,PROJECT.TimeFrom,PROJECT.TimeEnd,TEAM.Name AS N'TEAM'
	FROM PROJECT INNER JOIN TEAM ON IdTeam = TEAM.Id
)
select * FROM View_ProjectTeam

CREATE VIEW View_TaskTeam
As(
	SELECT TASK.Id,TASK.Name,TASK.TimeFrom,TASK.TimeEnd , TEAM.Name AS N'TEAM'
	FROM TASK INNER JOIN STAFF ON TASK.IdStaff=STAFF.Id INNER JOIN TEAM ON STAFF.IdTeam =TEAM.Id
)
SELECT * FROM View_TaskTeam
CREATE VIEW View_Account
AS(
	SELECT * FROM ACCOUNT
)
SELECT * FROM View_Account
CREATE VIEW View_TypeStaff
AS(
	SELECT STAFF.Id,STAFF.Name, ACCOUNT.Type,TEAM.Name AS N'TEAM'
	FROM STAFF INNER JOIN ACCOUNT ON STAFF.UserName = ACCOUNT.UserName,TEAM
	WHERE TEAM.Id =STAFF.IdTeam
)
SELECT * FROM View_TypeStaff
GO