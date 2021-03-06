USE [Yoda]
GO
/****** Object:  Table [dbo].[PROJECT_TYPES]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROJECT_TYPES](
	[PROJECT_TYPE_ID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NULL,
	[DESCRIPTION] [varchar](1000) NULL,
 CONSTRAINT [PK_PROJECT_TYPE] PRIMARY KEY CLUSTERED 
(
	[PROJECT_TYPE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STATUS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STATUS](
	[STATUS_ID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NOT NULL,
	[DESCRIPTION] [varchar](2000) NULL,
 CONSTRAINT [PK_STATUS] PRIMARY KEY CLUSTERED 
(
	[STATUS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STATES]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATES](
	[State_ID] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_STATES] PRIMARY KEY CLUSTERED 
(
	[State_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PTO_GROUP_TYPES]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PTO_GROUP_TYPES](
	[PTO_GROUP_ID] [int] NULL,
	[PTO_RATE] [int] NULL,
	[PTO_TENURE_RATE] [int] NULL,
	[PTO_GROUP_NAME] [varchar](40) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RATES]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RATES](
	[RATE_ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NULL,
	[DESCRIPTION] [varchar](1000) NULL,
	[RATE] [numeric](18, 0) NULL,
 CONSTRAINT [PK_RATES] PRIMARY KEY CLUSTERED 
(
	[RATE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RATE2]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RATE2](
	[RATE_ID] [int] NOT NULL,
	[RATE] [int] NOT NULL,
 CONSTRAINT [PK_RATE2] PRIMARY KEY CLUSTERED 
(
	[RATE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PTO_REQUESTS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PTO_REQUESTS](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[USER_ID] [int] NULL,
	[Request_Date] [datetime] NULL,
	[Approved_Date] [datetime] NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Hours] [int] NULL,
	[Notes] [varchar](1000) NULL,
	[Paid] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PTO_REQUEST_RESPONSE]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PTO_REQUEST_RESPONSE](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[USER_ID] [int] NULL,
	[MANAGER_ID] [int] NULL,
	[PTO_REQUEST_ID] [int] NULL,
	[STATUS] [varchar](12) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPORTS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REPORTS](
	[REPORT_ID] [numeric](18, 0) NOT NULL,
	[DISPLAY_SEQ] [numeric](18, 0) NULL,
	[NAME] [varchar](50) NULL,
	[DESCRIPTION] [varchar](1000) NULL,
	[REPORT_PATH] [varchar](255) NULL,
	[PARAMETER_FLAGS] [varchar](255) NULL,
	[STATUS_ID] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USER_TYPES]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USER_TYPES](
	[USER_TYPE_ID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NULL,
	[DESCRIPTION] [varchar](1000) NULL,
 CONSTRAINT [PK_USER_TYPE] PRIMARY KEY CLUSTERED 
(
	[USER_TYPE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TermHeader]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TermHeader](
	[TermHeaderID] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[TermHeaderValue] [nvarchar](50) NULL,
	[ActiveFlag] [bit] NOT NULL,
 CONSTRAINT [PK_TermHeader] PRIMARY KEY CLUSTERED 
(
	[TermHeaderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Term]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Term](
	[TermID] [uniqueidentifier] NOT NULL,
	[TermHeaderID] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[DisplayLabel] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NULL,
	[ID] [int] NULL,
	[TermHeaderValue] [nvarchar](50) NULL,
	[ActiveFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Term] PRIMARY KEY CLUSTERED 
(
	[TermID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TELEPHONE]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TELEPHONE](
	[TELEPHONE_ID] [int] IDENTITY(1,1) NOT NULL,
	[PREFIX] [int] NULL,
	[COUNTRY_CODE] [int] NULL,
	[CITY_CODE] [int] NULL,
	[NUMBER] [int] NULL,
	[EXTENSION] [int] NULL,
	[UPDATED_DATE] [datetime] NULL,
	[UPDATED_BY] [int] NULL,
 CONSTRAINT [PK_TELEPHONE] PRIMARY KEY CLUSTERED 
(
	[TELEPHONE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TECHNOLOGY]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TECHNOLOGY](
	[TECHNOLOGY_ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](100) NOT NULL,
	[DESC] [varchar](2000) NULL,
 CONSTRAINT [PK_TECHNOLOGY] PRIMARY KEY CLUSTERED 
(
	[TECHNOLOGY_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TASKS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TASKS](
	[TASK_ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](100) NULL,
	[DESCRIPTION] [varchar](1000) NULL,
	[ActiveFlag] [bit] NOT NULL,
 CONSTRAINT [PK_TASKS] PRIMARY KEY CLUSTERED 
(
	[TASK_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PTO]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PTO](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[USER_ID] [int] NULL,
	[Date_Earned] [datetime] NULL,
	[Date_Used] [datetime] NULL,
	[Hours] [int] NULL,
	[Hours_Used] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHASES]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHASES](
	[PHASE_ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NULL,
	[DESCRIPTION] [varchar](1000) NULL,
	[ActiveFlag] [bit] NULL,
 CONSTRAINT [PK_PHASES] PRIMARY KEY CLUSTERED 
(
	[PHASE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAYMENT_TERMS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAYMENT_TERMS](
	[PAYMENT_TERMS_ID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](100) NULL,
	[DESCRIPTION] [varchar](2000) NULL,
	[ActiveFlag] [bit] NOT NULL,
 CONSTRAINT [PK_PAYMENT_TERMS] PRIMARY KEY CLUSTERED 
(
	[PAYMENT_TERMS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holidays](
	[ID] [numeric](18, 0) NULL,
	[HolidayName] [nvarchar](50) NULL,
	[HolidayDate] [date] NULL,
	[HolidayDescription] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GET_TITLE_DATA]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GET_TITLE_DATA] 
			AS

/*************************************************************************************
**************************************************************************************
PROC NAME 	GET_TITLE_DATA 
AUTHOR  	ROBERT BINZLEY   
PURPOSE  	GETS TITLE DATA FROM TITLE LOOKUP TABLE
COMMENTS 	
MOD LOG  	
		11/22/200	Binzley	Created
		 
**************************************************************************************
*************************************************************************************/


SELECT
	TITLE_ID,
	TITLE_NAME
	FROM TITLE
	ORDER BY TITLE_ID
GO
/****** Object:  StoredProcedure [dbo].[GET_EMPLOYEE_TYPES]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_EMPLOYEE_TYPES]
--DROP PROC DBO.GET_EMPLOYEE_TYPES
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.GET_EMPLOYEE_TYPES
AUTHOR  	TJ REILLY   
PURPOSE  	GETS LIST OF ALL EMPLOYEE TYPES
COMMENTS 	
MOD LOG  	11/02/2004 	REILLY 	CREATED    
**************************************************************************************
*************************************************************************************/
SELECT 	EMPLOYEE_TYPE_ID, NAME 
FROM	EMPLOYEE_TYPES
GO
/****** Object:  StoredProcedure [dbo].[GET_INDUSTRIES]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_INDUSTRIES]
--DROP PROC DBO.GET_INDUSTRIES
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	GET_INDUSTRIES
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS ALL INDUSTIRES
COMMENTS 	
MOD LOG  	12/15/2004	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/

SELECT	INDUSTRY_ID, NAME, DESCRIPTION
FROM	INDUSTRY
ORDER BY NAME
GO
/****** Object:  Table [dbo].[BUSINESS_LINES]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BUSINESS_LINES](
	[BUSINESS_LINE_ID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[DESC] [varchar](200) NULL,
 CONSTRAINT [PK_BUSINESS_LINE] PRIMARY KEY CLUSTERED 
(
	[BUSINESS_LINE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BILLING_TERMS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BILLING_TERMS](
	[BILLING_TERMS_ID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NULL,
	[DESCRIPTION] [varchar](2000) NULL,
 CONSTRAINT [PK_BILLING_TERMS] PRIMARY KEY CLUSTERED 
(
	[BILLING_TERMS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ADDRESS_TYPE]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADDRESS_TYPE](
	[ADDRESS_TYPE_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLIENTS](
	[CLIENT_ID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[COMPANY_NAME] [varchar](100) NOT NULL,
	[STATUS_ID] [int] NOT NULL,
	[COMMENT] [text] NULL,
	[COMPANY_WEBSITE] [nvarchar](max) NULL,
	[NAME] [nvarchar](50) NULL,
 CONSTRAINT [PK_CLIENTS] PRIMARY KEY CLUSTERED 
(
	[CLIENT_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHARTER_STATUS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHARTER_STATUS](
	[CHARTER_STATUS_ID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NOT NULL,
	[DESC] [varchar](2000) NULL,
 CONSTRAINT [PK_CHARTER_STATUS] PRIMARY KEY CLUSTERED 
(
	[CHARTER_STATUS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHARTER]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHARTER](
	[CHARTER_ID] [int] IDENTITY(1,1) NOT NULL,
	[CLIENT_ID] [int] NULL,
	[BUSINESS_LINE_ID] [int] NULL,
	[CHARTER_STATUS_ID] [int] NULL,
	[SUB_PROJECT] [varchar](100) NULL,
	[BILLING_CONTACT_NAME] [varchar](200) NULL,
	[EMAIL] [varchar](50) NULL,
	[ADDRESS_ID] [varchar](100) NULL,
	[ADDRESS_ID2] [varchar](50) NULL,
	[TELEPHONE_ID] [varchar](50) NULL,
	[COMPANY_WEBSITE] [varchar](100) NULL,
	[INDUSTRY] [varchar](100) NULL,
	[FIRST_BILLED_DATE] [datetime] NULL,
	[LAST_BILLED_DATE] [datetime] NULL,
	[PO#] [char](50) NULL,
	[PROJECT_MANAGER_ID] [int] NULL,
	[EXPECTED_START_DATE] [datetime] NULL,
	[ESTIMATED_COMPLETION_DATE] [datetime] NULL,
	[ESTIMATED_DURATION] [varchar](50) NULL,
	[ESTIMATED_BUDGET] [varchar](50) NULL,
	[TECHNOLOGY_ID] [varchar](50) NULL,
	[ACCOUNT_MANAGER_ID] [int] NULL,
	[PROJECT_TYPE_ID] [int] NULL,
	[BILLING_TERMS_ID] [int] NULL,
	[PAYMENT_TERMS_ID] [int] NULL,
	[AUTHORIZATION_ID] [int] NULL,
	[DESC] [text] NULL,
	[TOTAL_ESTIMATED_HOURS] [int] NULL,
	[TOTAL_ESTIMATED_COST] [decimal](12, 4) NULL,
	[BILLING_NOTES] [text] NULL,
	[PROJECT_NOTES] [text] NULL,
	[UPDATED_DATE] [datetime] NULL,
	[UPDATED_BY] [int] NULL,
	[BILLING_CONTACT_ID] [int] NULL,
	[SPONSOR_CONTACT_ID] [int] NULL,
	[INDUSTRY_ID] [int] NULL,
	[BILLABLE] [dbo].[BOOLEAN_FLAG] NULL,
	[PROJECT_CODE] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHARTER] PRIMARY KEY CLUSTERED 
(
	[CHARTER_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Add_Holiday]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Add_Holiday]
@Holiday_Date dateTIME = null,
@Holiday_Name Nvarchar(50)
as

INSERT INTO HOLIDAYS (HolidayName, HolidayDate)
SELECT DISTINCT @Holiday_Name, @Holiday_Date
GO
/****** Object:  StoredProcedure [dbo].[ADD_PHASE]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADD_PHASE]
--DROP PROC DBO.ADD_PHASE
(
	@NAME VARCHAR(50), 
	@DESCRIPTION VARCHAR(1000)
)
AS
IF (SELECT COUNT(1) FROM PHASES WHERE NAME = @NAME AND DESCRIPTION = @DESCRIPTION) >0 RETURN -1
INSERT INTO PHASES (NAME, DESCRIPTION) SELECT @NAME, @DESCRIPTION
IF @@ERROR <> 0 RETURN -1
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[DELETE_PTO_REQUEST]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create proc [dbo].[DELETE_PTO_REQUEST]
@ID int
as
delete from PTO_REQUESTS WHERE [ID]=@ID
GO
/****** Object:  StoredProcedure [dbo].[Delete_Holiday]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: Deploy Holidays.sql|0|0|C:\Workspaces\TimeWeasel\Holidays\Deploy Holidays.sql

CREATE proc [dbo].[Delete_Holiday]
@Holiday_ID int = null
as

DELETE
FROM Holidays
WHERE ID = @Holiday_ID
GO
/****** Object:  Table [dbo].[CONTACTS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONTACTS](
	[CONTACT_ID] [int] IDENTITY(1,1) NOT NULL,
	[FIRST] [nvarchar](50) NULL,
	[MIDDLE] [nvarchar](50) NULL,
	[LAST] [nvarchar](50) NULL,
	[ACTIVE_FLAG] [dbo].[BOOLEAN_FLAG] NULL,
	[CLIENT_ID] [int] NULL,
	[EMAIL] [nvarchar](max) NULL,
	[ADDRESS1] [nvarchar](max) NULL,
	[ADDRESS2] [nvarchar](max) NULL,
	[CITY] [nvarchar](50) NULL,
	[STATE_ID] [int] NULL,
	[POSTALCODE] [nvarchar](6) NULL,
	[PHONE] [nvarchar](50) NULL,
	[FAX] [nvarchar](50) NULL,
 CONSTRAINT [PK_CONTACTS] PRIMARY KEY CLUSTERED 
(
	[CONTACT_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[AddPTO]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddPTO]
@USERID int = null,
@HOURS int = 0,
@NOTE varchar(255)
as

insert into PTO (USER_ID, DATE_EARNED, HOURS, HOURS_USED, NOTE)
select distinct @USERID, GetDate(), @HOURS, 0, @NOTE
GO
/****** Object:  StoredProcedure [dbo].[ADD_TASK]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADD_TASK]
--DROP PROC DBO.ADD_TASK
(
	@NAME VARCHAR(50), 
	@DESCRIPTION VARCHAR(1000)
)
AS
IF (SELECT COUNT(1) FROM TASKS WHERE NAME = @NAME AND DESCRIPTION = @DESCRIPTION) >0 RETURN -1
INSERT INTO TASKS (NAME, DESCRIPTION) SELECT @NAME, @DESCRIPTION
IF @@ERROR <> 0 RETURN -1
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[ADD_RATE]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADD_RATE]
--DROP PROC ADD_RATE
(
	@NAME VARCHAR(50), 
	@DESCRIPTION VARCHAR(1000), 
	@RATE decimal(12,2)
)
AS
IF (SELECT COUNT(1) FROM RATES WHERE NAME = @NAME AND RATE = @RATE AND DESCRIPTION = @DESCRIPTION) = 0
BEGIN
	INSERT INTO RATES (NAME, DESCRIPTION, RATE) SELECT @NAME, @DESCRIPTION, @RATE
END
ELSE RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[GET_BUSINESS_LINES]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_BUSINESS_LINES]
--DROP PROC DBO.GET_BUSINESS_LINES
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.SAVE_CHARTER
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS ALL BUSINESS LINES
RETURN		0 	SUCCESS
			-1	ERROR
COMMENTS 	
MOD LOG  	09/13/2004  HERMAN	CREATED
**************************************************************************************
*************************************************************************************/
AS
SELECT	*
FROM	BUSINESS_LINES
GO
/****** Object:  StoredProcedure [dbo].[GET_BILLING_TERMS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_BILLING_TERMS]
--DROP PROC DBO.GET_BILLING_TERMS
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.GET_BILLING_TERMS
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS ALL BILLING TERMS
RETURN		
			
COMMENTS 	
MOD LOG  	09/13/2004  HERMAN	CREATED
**************************************************************************************
*************************************************************************************/
AS
SELECT	*
FROM	BILLING_TERMS
GO
/****** Object:  StoredProcedure [dbo].[GET_PROJECT_TYPES]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_PROJECT_TYPES]
--DROP PROC DBO.GET_PROJECT_TYPES
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.GET_PROJECT_TYPES
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS ALL PROJECT TYPES
RETURN		
			
COMMENTS 	
MOD LOG  	09/13/2004  HERMAN	CREATED
**************************************************************************************
*************************************************************************************/
AS
SELECT	*
FROM	PROJECT_TYPES
GO
/****** Object:  StoredProcedure [dbo].[GET_HOLIDAYS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_HOLIDAYS] AS

SELECT *, '' as DataGridAction FROM HOLIDAYS WHERE HOLIDAYDATE >= GetDate() ORDER BY HOLIDAYDATE
GO
/****** Object:  StoredProcedure [dbo].[GET_PHASES]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_PHASES]
--DROP PROC DBO.GET_PHASES
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.GET_PHASES
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS ALL PHASES ROWS
RETURN		
			
COMMENTS 	
MOD LOG  	09/13/2004  HERMAN	CREATED
                11/18/2004  Snider      Changed sort order
**************************************************************************************
*************************************************************************************/
AS
SELECT	*
FROM	PHASES
ORDER BY NAME
GO
/****** Object:  StoredProcedure [dbo].[GET_PAYMENT_TERMS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_PAYMENT_TERMS]
--DROP PROC DBO.GET_PAYMENT_TERMS
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.GET_PAYMENT_TERMS
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS ALL PAYMENT TERMS
RETURN		
			
COMMENTS 	
MOD LOG  	09/13/2004  HERMAN	CREATED
**************************************************************************************
*************************************************************************************/
AS
SELECT	*
FROM	PAYMENT_TERMS
GO
/****** Object:  StoredProcedure [dbo].[GET_CLIENTS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_CLIENTS] 
--DROP PROC DBO.GET_CLIENTS
(
	@CLIENT_ID INT = NULL
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	GET_USERS
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS A CLIENT OR ALL CLIENTS
COMMENTS 	
MOD LOG  	09/03/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/

IF @CLIENT_ID IS NULL

SELECT	A.CLIENT_ID, A.COMPANY_NAME, A.COMPANY_WEBSITE,  isnull(A.COMMENT,'') COMMENT, B.NAME
FROM	CLIENTS A 
		JOIN STATUS B ON A.STATUS_ID = B.STATUS_ID
WHERE	B.NAME = 'ACTIVE'
ORDER BY A.COMPANY_NAME

ELSE

SELECT	A.CLIENT_ID, A.COMPANY_NAME, A.COMPANY_WEBSITE, isnull(A.COMMENT,'') COMMENT, B.NAME
FROM	CLIENTS A 
		JOIN STATUS B ON A.STATUS_ID = B.STATUS_ID
WHERE 	CLIENT_ID = @CLIENT_ID
		AND B.NAME = 'ACTIVE'
GO
/****** Object:  StoredProcedure [dbo].[GET_CLIENT_LIST]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_CLIENT_LIST]
--DROP PROC DBO.GET_CLIENT_LIST
(
	@CLIENT_ID INT = NULL
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	GET_USERS
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS A CLIENT OR ALL CLIENTS
COMMENTS 	
MOD LOG  	09/03/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
IF @CLIENT_ID IS NULL
SELECT	A.CLIENT_ID, A.COMPANY_NAME, A.COMMENT, B.NAME
FROM	CLIENTS A 
		JOIN STATUS B ON A.STATUS_ID = B.STATUS_ID
WHERE	B.NAME = 'ACTIVE'
ORDER BY A.COMPANY_NAME
ELSE
SELECT	A.CLIENT_ID, A.COMPANY_NAME, A.COMMENT, B.NAME
FROM	CLIENTS A 
		JOIN STATUS B ON A.STATUS_ID = B.STATUS_ID
WHERE 	CLIENT_ID = @CLIENT_ID
		AND B.NAME = 'ACTIVE'
GO
/****** Object:  StoredProcedure [dbo].[GET_CHARTER_STATUS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_CHARTER_STATUS]
--DROP PROC DBO.GET_CHARTER_STATUS
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.SAVE_CHARTER
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS ALL CHARTER STATUS ROWS
RETURN		
			
COMMENTS 	
MOD LOG  	09/13/2004  HERMAN	CREATED
**************************************************************************************
*************************************************************************************/
AS
SELECT	*
FROM	CHARTER_STATUS
GO
/****** Object:  StoredProcedure [dbo].[EarnedPTO]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[EarnedPTO]
@USERID int = null

as

select DISTINCT ID, Date_Earned, Date_Used, Hours, Hours_Used, Note from PTO WHERE User_iD = @USERID
GO
/****** Object:  StoredProcedure [dbo].[GET_USER_TYPES]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_USER_TYPES]
--DROP PROC DBO.GET_USER_TYPES
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.GET_USER_TYPES
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS LIST OF ALL USER TYPES
COMMENTS 	
MOD LOG  	09/01/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
SELECT USER_TYPE_ID, NAME, DESCRIPTION FROM	USER_TYPES
GO
/****** Object:  StoredProcedure [dbo].[GET_USER_ROLES]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_USER_ROLES]
--DROP PROC DBO.GET_USER_ROLES
(
	@USER_ID INT
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.GET_USER_ROLES
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS LIST OF ALL USER TYPES
COMMENTS 	
MOD LOG  	09/01/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
SELECT	USER_TYPE_ID, NAME, DESCRIPTION
FROM	USER_TYPES
GO
/****** Object:  StoredProcedure [dbo].[GET_PTO_HISTORY]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create proc [dbo].[GET_PTO_HISTORY]
@USER_ID int
as
select * from PTO_REQUESTS WHERE USER_ID=@USER_ID
GO
/****** Object:  StoredProcedure [dbo].[Get_Terms]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Get_Terms]  
--DROP PROC DBO.Get_Terms
(
	@TermHeaderValue nvarchar(50)
)
AS

IF @TermHeaderValue IS NULL 
BEGIN
	Select * from Term
END
ELSE
BEGIN
	Select * from Term where TermHeaderValue=@TermHeaderValue

END
GO
/****** Object:  StoredProcedure [dbo].[GET_TECHNOLOGY]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_TECHNOLOGY]
--DROP PROC DBO.GET_TECHNOLOGY
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.GET_TECHNOLOGY
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS ALL TECHNOLOGY ROWS
RETURN		
			
COMMENTS 	
MOD LOG  	09/13/2004  HERMAN	CREATED
**************************************************************************************
*************************************************************************************/
AS
SELECT	*
FROM	TECHNOLOGY
GO
/****** Object:  StoredProcedure [dbo].[GET_TASKS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_TASKS]
--DROP PROC DBO.GET_TASKS
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.GET_TASKS
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS ALL TASKS
RETURN		
			
COMMENTS 	
MOD LOG  	09/13/2004  HERMAN	CREATED
                11/18/2004  Snider      Changed sort order
**************************************************************************************
*************************************************************************************/
AS
SELECT	*
FROM	TASKS
ORDER BY Name
GO
/****** Object:  StoredProcedure [dbo].[GET_STATES]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_STATES]
--DROP PROC DBO.GET_STATES
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	GET_STATES
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS ALL STATES
COMMENTS 	
MOD LOG  	11/29/2004	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/


SELECT	STATE_ID, NAME, ABBREVIATION
FROM	STATES
ORDER BY ABBREVIATION
GO
/****** Object:  StoredProcedure [dbo].[GET_RATES]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_RATES]
/**populates Rates dropdownlist**/
(
	@RATE_ID INT
)
AS
SELECT 	RATE_ID, RATE
FROM		RATES
ORDER BY RATE ASC
GO
/****** Object:  StoredProcedure [dbo].[GET_PTOGROUP_DATA]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create proc [dbo].[GET_PTOGROUP_DATA]
as
Select PTO_GROUP_ID, PTO_GROUP_NAME
From PTO_GROUP_TYPES
GO
/****** Object:  StoredProcedure [dbo].[GET_PTO_REQUESTS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create proc [dbo].[GET_PTO_REQUESTS]
@ID int
as
SELECT * from PTO_REQUESTS WHERE [ID]=@ID
GO
/****** Object:  Table [dbo].[PROJECTS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROJECTS](
	[PROJECT_CODE] [varchar](20) NOT NULL,
	[CHARTER_ID] [numeric](10, 0) NOT NULL,
	[PROJECT_ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](100) NULL,
	[DESCRIPTION] [varchar](1000) NULL,
	[PROJECT_TYPE_ID] [numeric](10, 0) NOT NULL,
	[GLOBAL] [dbo].[BOOLEAN_FLAG] NOT NULL,
	[MILESTONE_STATUS_FLAG] [dbo].[BOOLEAN_FLAG] NULL,
	[ActiveFlag] [bit] NOT NULL,
 CONSTRAINT [PK_PROJECTS] PRIMARY KEY CLUSTERED 
(
	[PROJECT_CODE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_PROJECTS] UNIQUE NONCLUSTERED 
(
	[PROJECT_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SubtractPTO]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SubtractPTO]
@USERID int = null,
@HOURS int = 0,
@NOTE varchar(255)
as

insert into PTO_REQUESTS (USER_ID, REQUEST_DATE, APPROVED_DATE, START_DATE, END_DATE, HOURS, NOTES)
select distinct @USERID, GetDate(), GetDate(), GetDate(), GetDate(), @HOURS, @NOTE
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERS](
	[USER_ID] [int] IDENTITY(1,1) NOT NULL,
	[FIRST] [varchar](50) NOT NULL,
	[MIDDLE] [varchar](1) NULL,
	[LAST] [varchar](50) NULL,
	[USER_TYPE_ID] [numeric](10, 0) NULL,
	[USERNAME] [varchar](10) NOT NULL,
	[PASSWORD] [varchar](10) NOT NULL,
	[TERMINATION_DATE] [datetime] NULL,
	[TITLE_ID] [numeric](10, 0) NULL,
	[EMPLOYEE_TYPE_ID] [numeric](10, 0) NULL,
	[STATUS] [nvarchar](50) NULL,
	[START_DATE] [datetime] NULL,
	[PTO_GROUP_ID] [numeric](10, 0) NULL,
	[PRELOAD_PROJECTS] [int] NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[USER_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_FML] UNIQUE NONCLUSTERED 
(
	[FIRST] ASC,
	[MIDDLE] ASC,
	[LAST] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_PTO_REQUEST_RESPONSE]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create proc [dbo].[UPDATE_PTO_REQUEST_RESPONSE]
@ManagerID int = null,
@RequestID int = null,
@Status int
as
IF @Status = 1
begin
	DELETE 
	FROM PTO_REQUEST_RESPONSE
	WHERE ID = @RequestID and Manager_ID = @ManagerID
	
	declare @Count int
	set @Count = (select count(*) from PTO_REQUEST_RESPONSE where PTO_REQUEST_ID = @RequestID) 
	if @Count = 0
		Update PTO_REQUESTS Set Approved_Date = GetDate() where [ID] = @RequestID
end
ELSE
	UPDATE PTO_REQUEST_RESPONSE
	SET 	STATUS = @Status
	WHERE ID = @RequestID and Manager_ID = @ManagerID
GO
/****** Object:  StoredProcedure [dbo].[SAVE_CLIENT]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SAVE_CLIENT]
--DROP PROC DBO.SAVE_CLIENT
(
	@CLIENT_ID INT = NULL, 
	@COMPANY_NAME VARCHAR(100), 
	@STATUS_ID INT, 
	@COMMENT TEXT = NULL
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	SAVE_CLIENT
AUTHOR  	JOHN HERMAN    
PURPOSE  	UPDATES OR INSERTS A CLIENT ROW INT THE CLIENTS TABLE
RETURN		0 FOR SUCCESS, -1 FOR FAILURE
MOD LOG  	09/03/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/

IF @CLIENT_ID IS NULL
BEGIN
	IF @COMPANY_NAME IS NOT NULL AND @STATUS_ID IS NOT NULL 
	BEGIN
		INSERT INTO CLIENTS (COMPANY_NAME, STATUS_ID, COMMENT) SELECT @COMPANY_NAME, @STATUS_ID, @COMMENT
		IF @@ERROR <> 0 RETURN -1
		RETURN 0
	END
	ELSE
	BEGIN
		RETURN -1
	END
END
ELSE
BEGIN
	UPDATE 	CLIENTS 
	SET		COMPANY_NAME = @COMPANY_NAME, 
			STATUS_ID = @STATUS_ID, 
			COMMENT = @COMMENT
	WHERE	CLIENT_ID = @CLIENT_ID
	IF @@ERROR <> 0 RETURN -1
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[PTO_REQUEST_DEBIT]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE procedure [dbo].[PTO_REQUEST_DEBIT]
(
@PTO_REQUEST_ID int,
@HOURS NUMERIC(10, 2),
@USER_ID int
)
as

declare @PTO_ID int
declare @HOURS_USED NUMERIC(10, 2)
declare @REMAINDER NUMERIC(10, 2)
declare @AVAILABLE NUMERIC(10, 2)
declare @USED NUMERIC(10, 2)
declare @PTO_HOURS_START NUMERIC(10, 2)
declare @PTO_HOURS NUMERIC(10, 2)
SET @PTO_HOURS = (SELECT PTO_REQUESTS.HOURS FROM PTO_REQUESTS WHERE [ID] = @PTO_REQUEST_ID) 
		
SELECT @PTO_REQUEST_ID as PTO_REQUEST_ID, @PTO_HOURS as PTO_REQUEST_HOURS 

while @PTO_HOURS > 0
	begin
		declare c2 cursor for
		--Get the users unused PTO
		select PTO.[ID], Hours, Hours_Used
		from PTO
		where USER_ID = @USER_ID and Hours <> Hours_Used
		order by Date_Earned asc
				
		open c2
		fetch next from c2 into @PTO_ID, @HOURS, @HOURS_USED
		while @@fetch_status = 0 and @PTO_HOURS > 0
			begin
				
				set @AVAILABLE = @HOURS-@HOURS_USED
				set @PTO_HOURS_START = @PTO_HOURS
				set @REMAINDER = @AVAILABLE - @PTO_HOURS
				set @PTO_HOURS=@PTO_HOURS-@AVAILABLE
						

--select @Hours as HOURS, @HOURS_USED as HOURSUSED, @PTO_HOURS_START AS PTO_START, @PTO_HOURS as PTO_END

				if @PTO_HOURS < 0 
					begin
						--This pto entry has unused time still
						set @USED = @AVAILABLE - @REMAINDER + @HOURS_USED
						update pto 
						set hours_used = @USED ,
						date_used = getdate()
						where ID=@PTO_ID
--select @USED as HOURS_USED, @PTO_ID as PTO_ID
					end
				else
					begin
						update pto 
						set hours_used = @HOURS ,
						date_used = getdate()
						where ID=@PTO_ID
--select 'all' as HOURS_USED, @PTO_ID as PTO_ID
					end
				fetch next from c2 into @PTO_ID, @HOURS, @HOURS_USED	
			end
		close c2
		deallocate c2

		--Create a negative record if @PTO_HOURS is not 0
		if @PTO_HOURS > 0 
			begin
				select @PTO_HOURS as HOURSREMAINING

				insert into pto (HOURS, USER_ID, HOURS_USED)
				select (-1 * @PTO_HOURS) as HOURS, @USER_ID, 0
				set @PTO_HOURS = 0
			end

		UPDATE PTO_REQUESTS SET PAID = 1 WHERE [ID] = @PTO_REQUEST_ID
					
	end
GO
/****** Object:  StoredProcedure [dbo].[PTO_AVAILABLE]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create proc [dbo].[PTO_AVAILABLE]
@USER_ID int = null
as
Select Sum(Hours-Hours_Used) 
From PTO
Where USER_ID = @USER_ID
Group by USER_ID
GO
/****** Object:  Table [dbo].[PROJECT_TASKS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROJECT_TASKS](
	[PROJECT_ID] [int] NOT NULL,
	[TASK_ID] [int] NOT NULL,
	[ActiveFlag] [bit] NULL,
 CONSTRAINT [PK_PROJECT_TASKS] PRIMARY KEY CLUSTERED 
(
	[PROJECT_ID] ASC,
	[TASK_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROJECT_PHASES]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROJECT_PHASES](
	[PROJECT_ID] [int] NOT NULL,
	[PHASE_ID] [int] NOT NULL,
	[ActiveFlag] [bit] NOT NULL,
 CONSTRAINT [PK_PROJECT_PHASES] PRIMARY KEY CLUSTERED 
(
	[PROJECT_ID] ASC,
	[PHASE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[PTO_CurrentVacations]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PTO_CurrentVacations] as
declare @WeeksAhead int
declare @WeeksBehind int
set @WeeksAhead = 4
set @WeeksBehind = -1
SELECT     USERS.USERNAME AS UserName, PTO_REQUESTS.Start_Date, PTO_REQUESTS.End_Date, PTO_REQUESTS.Hours
, datediff(ww, getdate(), PTO_REQUESTS.Start_Date) as diff
FROM         PTO_REQUESTS INNER JOIN
                      USERS ON PTO_REQUESTS.USER_ID = USERS.USER_ID
where datediff(ww, getdate(), PTO_REQUESTS.Start_Date) < @WeeksAhead and datediff(ww, getdate(), PTO_REQUESTS.Start_Date) > - @WeeksBehind 
order by PTO_REQUESTS.Start_Date asc
GO
/****** Object:  StoredProcedure [dbo].[PTO_Consume_Single]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[PTO_Consume_Single]
@USERID int = null
as
declare c1 cursor for

--Get the PTO requests that have been approved and taken but not paid.
select [ID], HOURS, USER_ID from PTO_REQUESTS
where PTO_REQUESTS.ID in 
(
SELECT     PTO_REQUESTS.ID
FROM         PTO_REQUESTS left JOIN
                      PTO_REQUEST_RESPONSE ON PTO_REQUESTS.ID = PTO_REQUEST_RESPONSE.PTO_REQUEST_ID
WHERE PTO_REQUESTS.START_DATE <= GETDATE() and PAID is null and PTO_REQUEST_RESPONSE.STATUS is null AND PTO_REQUESTS.USER_ID=@USERID
GROUP BY PTO_REQUESTS.ID
)

--Get the PTO requests that have been approved and taken but not paid.

open c1

declare @PTO_ID int
declare @PTO_REQUEST_ID int
declare @HOURS int
declare @HOURS_USED int
declare @USER_ID int
declare @REMAINDER int
declare @AVAILABLE int
declare @USED int
declare @PTO_HOURS_START int

--For each request, debit the users PTO account the proper hours
fetch next from c1 into @PTO_REQUEST_ID, @HOURS, @USER_ID
while @@fetch_status = 0

	begin
		
		exec PTO_REQUEST_DEBIT @PTO_REQUEST_ID, @HOURS, @USER_ID
		fetch next from c1 into @PTO_REQUEST_ID, @HOURS, @USER_ID 

	end

close c1
deallocate c1
GO
/****** Object:  StoredProcedure [dbo].[PTO_Consume]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE Proc [dbo].[PTO_Consume]
as
declare c1 cursor for

--Get the PTO requests that have been approved and taken but not paid.
select [ID], HOURS, USER_ID from PTO_REQUESTS
where PTO_REQUESTS.ID in 
(
SELECT     PTO_REQUESTS.ID
FROM         PTO_REQUESTS left JOIN
                      PTO_REQUEST_RESPONSE ON PTO_REQUESTS.ID = PTO_REQUEST_RESPONSE.PTO_REQUEST_ID
WHERE PTO_REQUESTS.START_DATE <= GETDATE() and PAID is null and PTO_REQUEST_RESPONSE.STATUS is null
GROUP BY PTO_REQUESTS.ID
)

--Get the PTO requests that have been approved and taken but not paid.

open c1

declare @PTO_ID int
declare @PTO_REQUEST_ID int
declare @HOURS NUMERIC(10, 2)
declare @HOURS_USED NUMERIC(10, 2)
declare @USER_ID int
declare @REMAINDER NUMERIC(10, 2)
declare @AVAILABLE NUMERIC(10, 2)
declare @USED NUMERIC(10, 2)
declare @PTO_HOURS_START NUMERIC(10, 2)

--For each request, debit the users PTO account the proper hours
fetch next from c1 into @PTO_REQUEST_ID, @HOURS, @USER_ID
while @@fetch_status = 0

	begin
		
		exec PTO_REQUEST_DEBIT @PTO_REQUEST_ID, @HOURS, @USER_ID
		fetch next from c1 into @PTO_REQUEST_ID, @HOURS, @USER_ID 

	end

close c1
deallocate c1
GO
/****** Object:  StoredProcedure [dbo].[GET_USER_DATA]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    PROC [dbo].[GET_USER_DATA]
--DROP PROC DBO.GET_USER_DATA
(
	@USER_ID INT = NULL
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	GET_USER_DATA
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS ALL USER INFORMATION FROM USER TABLE
COMMENTS 	
MOD LOG  	
		11/22/200	Binzley	Added Status into select
		11/02/2004	REILLY	UPDATED WITH "EMPLOYEE_TYPE_ID"
		09/01/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
IF @USER_ID IS NULL 
	SELECT 	USER_ID, 
		FIRST, 
		MIDDLE, 
		LAST, 
		USER_TYPE_ID, 
		EMPLOYEE_TYPE_ID, 
		PTO_GROUP_ID,
		USERNAME, 
		PASSWORD, 
		STATUS,
		TERMINATION_DATE,
		START_DATE,
		TITLE_ID , email 
	FROM	USERS
ELSE
	SELECT 	USER_ID, 
		FIRST, 
		MIDDLE, 
		LAST, 
		USER_TYPE_ID, 
		EMPLOYEE_TYPE_ID, 
		USERNAME, 
		PASSWORD , 
		STATUS,
		TERMINATION_DATE,
		START_DATE,
		TITLE_ID,
		PTO_GROUP_ID, email 
	FROM	USERS
	WHERE 	USER_ID = @USER_ID
GO
/****** Object:  StoredProcedure [dbo].[VALIDATE_MANAGER]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[VALIDATE_MANAGER]
@USER_ID INT,
@IsManager INT OUTPUT
AS

DECLARE @IsAManager INT

SET @IsAManager = 0

SET @IsAManager = (SELECT 1 AS ANSWER FROM USERS WHERE USER_ID = @USER_ID AND USER_TYPE_ID <> 2)

SET @IsManager = @IsAManager

SELECT @IsAManager
GO
/****** Object:  StoredProcedure [dbo].[VALIDATE_LOGIN]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[VALIDATE_LOGIN] 
--DROP PROC DBO.VALIDATE_LOGIN 
(
@USERNAME VARCHAR(10),
@PASSWORD VARCHAR(10)
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	VALIDATE_LOGIN
AUTHOR  	JOHN HERMAN    
PURPOSE  	VALIADTES THE USERNAME AND PASSWORD AGAINST THE USERS TABLE
COMMENTS 	NONE
MOD LOG  	08/30/2004 	HERMAN 	CREATED    
RGB		11/22/2004	Added check to status flag to ensure only active users can login
SMS             12/02/2004	Moved active flag to the outer query
**************************************************************************************
*************************************************************************************/
IF (SELECT COUNT(1) FROM USERS WHERE USERNAME = @USERNAME AND PASSWORD=@PASSWORD AND STATUS = 1 ) >0
BEGIN
	SELECT USER_ID 
	FROM USERS 
	WHERE USERNAME = @USERNAME 
	AND PASSWORD=@PASSWORD
END
ELSE
BEGIN
	SELECT -1
END
GO
/****** Object:  StoredProcedure [dbo].[SAVE_CONTACT_DATA]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SAVE_CONTACT_DATA]
--DROP PROC DBO.SAVE_CONTACT_DATA
(
	@CLIENT_ID AS INT, 
	@CONTACT_ID AS INT, 
	@FIRST_NAME AS VARCHAR(100), 
	@MIDDLE_NAME AS VARCHAR(100), 
	@LAST_NAME AS VARCHAR(100), 
	@EMAIL AS VARCHAR(100), 
	@PHONE AS VARCHAR(100), 
	@FAX AS VARCHAR(100), 
	@ADDRESS1 AS VARCHAR(200), 
	@ADDRESS2 AS VARCHAR(50), 
	@CITY AS VARCHAR(50), 
	@STATE_ID AS INT, 
	@ZIP AS VARCHAR(10) 
)
AS 

IF @CONTACT_ID < 1
BEGIN
	--INSERT A NEW CONTACT

	--CHECK IF NAME ALREADY EXISTS
	IF (SELECT COUNT(1) FROM CONTACTS WHERE FIRST = @FIRST_NAME AND LAST = @LAST_NAME) >0	
	BEGIN
		SELECT -1
		RETURN 
	END

	INSERT INTO CONTACTS (FIRST, MIDDLE, LAST, CLIENT_ID, EMAIL, ADDRESS1, ADDRESS2, CITY, STATE_ID, POSTALCODE)
	SELECT @FIRST_NAME, @MIDDLE_NAME, @LAST_NAME, @CLIENT_ID, @EMAIL, @ADDRESS1, @ADDRESS2,@CITY,@STATE_ID,@ZIP 
END
ELSE
BEGIN
	--UPDATE CLIENT INFORMATION
	UPDATE 	CONTACTS
	SET		FIRST = @FIRST_NAME, 
			MIDDLE = @MIDDLE_NAME, 
			LAST = @LAST_NAME, 
			EMAIL = @EMAIL, 
			CLIENT_ID = @CLIENT_ID,
			ADDRESS1 = @ADDRESS1,
			ADDRESS2 = @ADDRESS2,
			CITY = @CITY,
			STATE_ID=@STATE_ID,
			POSTALCODE = @ZIP
	WHERE	CONTACT_ID = @CONTACT_ID
	
END
SELECT contact_id, FIRST + ' ' + LAST as FullName from CONTACTS where First=@FIRST_NAME AND LAST=@LAST_NAME
GO
/****** Object:  Table [dbo].[PROJECT_USERS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROJECT_USERS](
	[PROJECT_ID] [int] NOT NULL,
	[USER_ID] [int] NOT NULL,
	[ActiveFlag] [bit] NOT NULL,
 CONSTRAINT [PK_PROJECT_USERS] PRIMARY KEY CLUSTERED 
(
	[PROJECT_ID] ASC,
	[USER_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROJECT_USER_RATES]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROJECT_USER_RATES](
	[USER_ID] [int] NULL,
	[RATE_ID] [int] NULL,
	[ACTIVE_FLAG] [bit] NULL,
	[PROJECT_ID] [int] NULL,
	[DESCRIPTION] [nvarchar](max) NULL,
	[TASK_ID] [int] NULL,
	[ActiveFrom] [date] NULL,
	[ActiveTo] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetUserInfo]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andrew Holub>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserInfo]
	@Username nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM USERS WHERE UPPER(USERNAME)=(UPPER(@Username))
END
GO
/****** Object:  StoredProcedure [dbo].[GET_USERS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_USERS]
--DROP PROC DBO.GET_USERS
(
	@USER_ID INT
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	GET_USERS
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS ALL USERS THAT ACTIVE USER HAS ACCESS TO
			ADMINS GET ALL
			USERS GET JUST THEMSELVES
COMMENTS 	RETURNS ALL UIDS AND -1. IF -1 IS THE ONLY INT RETURNED THEN THAT MEANS
			THE USER_ID DOES NOT EXIST
MOD LOG  	08/30/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
SELECT DISTINCT USER_ID, FIRST, MIDDLE, LAST, FIRST + ' ' + MIDDLE + ' ' + LAST, USERNAME
FROM
(
SELECT	CASE UT.NAME
			--ADMIN 
			WHEN 'ADMIN' THEN  U2.USER_ID
			WHEN 'PM' THEN U2.USER_ID
			ELSE U1.USER_ID
		END AS UID
FROM	USERS U1
		JOIN USER_TYPES UT ON U1.USER_TYPE_ID = UT.USER_TYPE_ID
		JOIN USERS U2 ON 1=1 
WHERE	U1.USER_ID = @USER_ID
) A
JOIN USERS U3 ON A.UID = U3.USER_ID
ORDER BY USERNAME
GO
/****** Object:  StoredProcedure [dbo].[GET_PTO_REQUEST_RESPONSE]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create proc [dbo].[GET_PTO_REQUEST_RESPONSE]
@USER_ID int
as
SELECT    PTO_REQUEST_RESPONSE.[ID], PTO_REQUEST_RESPONSE.MANAGER_ID, PTO_REQUESTS.Request_Date, PTO_REQUESTS.Approved_Date, PTO_REQUESTS.Start_Date, 
                      PTO_REQUESTS.End_Date, PTO_REQUESTS.Hours, PTO_REQUESTS.Notes, USERS.[FIRST] + ' ' + USERS.[LAST] as person, USERS.USERNAME
FROM         PTO_REQUEST_RESPONSE INNER JOIN
                      USERS ON PTO_REQUEST_RESPONSE.USER_ID = USERS.USER_ID INNER JOIN
                      PTO_REQUESTS ON PTO_REQUEST_RESPONSE.PTO_REQUEST_ID = PTO_REQUESTS.ID
WHERE     (PTO_REQUEST_RESPONSE.MANAGER_ID = @USER_ID )
GO
/****** Object:  StoredProcedure [dbo].[GET_PROJECT_CONTACTS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_PROJECT_CONTACTS]
--DROP PROC GET_PROJECT_CONTACTS
(
	@PROJECT_ID INT
)
AS
SELECT 	DISTINCT P.PROJECT_ID, C.CONTACT_ID, LTRIM(RTRIM(FIRST)) + ' ' + LTRIM(RTRIM(MIDDLE)) + ' ' + LTRIM(RTRIM(LAST)) AS FULL_NAME,  FIRST, MIDDLE, LAST, INACTIVE_FLAG, C.CLIENT_ID, C.EMAIL
FROM 	PROJECTS P 
		JOIN CHARTER CH ON P.CHARTER_ID = CH.CHARTER_ID
		JOIN CONTACTS C ON CH.CLIENT_ID = C.CLIENT_ID
WHERE	C.INACTIVE_FLAG = 0
		AND P.PROJECT_ID = @PROJECT_ID
GO
/****** Object:  Table [dbo].[FORECAST]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FORECAST](
	[FORECAST_ID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[PROJECT_CODE] [varchar](20) NOT NULL,
	[USER_ID] [numeric](10, 0) NOT NULL,
	[HOURS] [decimal](18, 0) NULL,
 CONSTRAINT [PK_FORECAST] PRIMARY KEY CLUSTERED 
(
	[FORECAST_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GET_CONTACTS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_CONTACTS]
--DROP PROC GET_CONTACTS
(
	@CLIENT_ID INT = null
)
AS
begin

if(@CLIENT_ID is null)
begin
SELECT 	c.CONTACT_ID, LTRIM(RTRIM(c.FIRST)) + ' ' + LTRIM(RTRIM(c.MIDDLE)) + ' ' + LTRIM(RTRIM(c.LAST)) AS FULL_NAME,  c.FIRST, c.MIDDLE, c.LAST, c.ACTIVE_FLAG, c.CLIENT_ID, c.EMAIL, cl.COMPANY_NAME,cl.NAME
FROM 	dbo.CONTACTS c
inner join dbo.CLIENTS cl on cl.CLIENT_ID = c.CLIENT_ID
WHERE	c.ACTIVE_FLAG = 1
ORDER BY c.FIRST
end
else
begin
SELECT 	c.CONTACT_ID, LTRIM(RTRIM(c.FIRST)) + ' ' + LTRIM(RTRIM(c.MIDDLE)) + ' ' + LTRIM(RTRIM(c.LAST)) AS FULL_NAME,  c.FIRST, c.MIDDLE, c.LAST, c.ACTIVE_FLAG, c.CLIENT_ID, c.EMAIL, cl.COMPANY_NAME,cl.NAME
FROM 	dbo.CONTACTS c
inner join dbo.CLIENTS cl on cl.CLIENT_ID = c.CLIENT_ID
WHERE	c.ACTIVE_FLAG = 1
		AND c.CLIENT_ID = @CLIENT_ID
ORDER BY c.FIRST
end
end
GO
/****** Object:  StoredProcedure [dbo].[GET_CONTACT_DATA]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_CONTACT_DATA]
--DROP PROC GET_CONTACT_DATA
(
	@CONTACT_ID INT
)
AS
SELECT 	CONTACT_ID, LTRIM(RTRIM(FIRST)) + ' ' + LTRIM(RTRIM(MIDDLE)) + ' ' + LTRIM(RTRIM(LAST)) AS FULL_NAME,  FIRST, MIDDLE, LAST, ACTIVE_FLAG, CLIENT_ID, ISNULL(EMAIL, '') EMAIL, 
		ISNULL(ADDRESS1,'') ADDRESS1, ISNULL(ADDRESS2,'') ADDRESS2, ISNULL(CITY, '') CITY, ISNULL(c.STATE_ID,1) STATE_ID, ISNULL(POSTALCODE,'') POSTALCODE, ISNULL(PHONE,'') PHONE, ISNULL(FAX,'') FAX,
		S.NAME STATE_NAME, S.ABBREVIATION
FROM 	CONTACTS C
	inner join STATES s on C.state_id=s.State_ID
WHERE	CONTACT_ID = @CONTACT_ID
GO
/****** Object:  StoredProcedure [dbo].[Get_Lazy_Managers]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_Lazy_Managers] 
@USERID int,
@PTO_REQUEST_ID int
as
SELECT     USERS.USERNAME AS Manager
FROM         USERS INNER JOIN
                      PTO_REQUEST_RESPONSE ON USERS.USER_ID = PTO_REQUEST_RESPONSE.MANAGER_ID
WHERE     (PTO_REQUEST_RESPONSE.USER_ID = @USERID) AND (PTO_REQUEST_RESPONSE.PTO_REQUEST_ID = @PTO_REQUEST_ID)
GO
/****** Object:  Table [dbo].[ADDRESS]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADDRESS](
	[ADDRESS_ID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[ADDRESS1] [varchar](50) NULL,
	[ADDRESS2] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[COUNTY] [varchar](50) NULL,
	[POSTAL_CODE] [int] NULL,
	[STATE] [varchar](50) NULL,
	[COUNTRY] [varchar](50) NULL,
	[UPDATED_DATE] [datetime] NULL,
	[UPDATED_BY] [int] NULL,
	[STATE_ID] [int] NULL,
	[ZIP] [nvarchar](50) NULL,
	[ADDRESS_TYPE_ID] [int] NULL,
	[PHONE] [nvarchar](50) NULL,
	[FAX] [nvarchar](50) NULL,
 CONSTRAINT [PK_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[ADDRESS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ADD_NEW_USER_GLOBAL_PROJECTS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADD_NEW_USER_GLOBAL_PROJECTS]
(@USER_ID INT)
AS

--PU ROWS
INSERT INTO PROJECT_USERS (PROJECT_ID, USER_ID)
SELECT X.PROJECT_ID, X.USER_ID
FROM
(
--GETS ALL USER GLOBAL PROJECT ROWS
SELECT	DISTINCT U.USER_ID, P.PROJECT_ID
FROM	USERS U
	JOIN PROJECTS P ON 1=1
WHERE	P.GLOBAL= 1
	AND U.USER_ID = @USER_ID
) X
	LEFT JOIN PROJECT_USERS PU ON X.USER_ID = PU.USER_ID AND X.PROJECT_ID = PU.PROJECT_ID
WHERE 	PU.USER_ID IS NULL AND PU.PROJECT_ID IS NULL


--PUR ROWS
INSERT INTO PROJECT_USER_RATES (PROJECT_ID, USER_ID, RATE_ID, ACTIVE_FLAG)
SELECT	X.PROJECT_ID, X.USER_ID, R.RATE_ID, 1
FROM
(
--GETS ALL USER GLOBAL PROJECT ROWS
SELECT	DISTINCT U.USER_ID, P.PROJECT_ID
FROM	USERS U
	JOIN PROJECTS P ON 1=1
WHERE	P.GLOBAL= 1
	AND U.USER_ID = @USER_ID
) X
	LEFT JOIN PROJECT_USER_RATES PUR ON X.USER_ID = PUR.USER_ID AND X.PROJECT_ID = PUR.PROJECT_ID
	JOIN RATES R ON 1=1
WHERE 	PUR.USER_ID IS NULL 
	AND PUR.PROJECT_ID IS NULL
	AND R.RATE = 0
GO
/****** Object:  StoredProcedure [dbo].[ADD_GLOBAL_PROJECT_ROWS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADD_GLOBAL_PROJECT_ROWS]
--DROP PROC DBO.ADD_GLOBAL_PROJECT_ROWS
/*************************************************************************************
**************************************************************************************
PROC NAME 	ADD_GLOBAL_PROJECT_ROWS
AUTHOR  	JOHN HERMAN    
PURPOSE  	ADDS ROWS TO PROJECT_USERS, PROJECT_TASKS, PROJECT_PHASES, AND PROJECT_RATES
RETURN		0 	SUCCESS
		-1	ERROR
COMMENTS 	CALLED WHEN THE GLOBAL BIT IS SET IN THE SAVE CHARTER PROC
MOD LOG  	11/11/2004	HERMAN	CREATED UPDATE CHARTER
**************************************************************************************
*************************************************************************************/
(
	@PROJECT_ID INT
)
AS
BEGIN
--PROJECT USERS
INSERT INTO PROJECT_USERS (PROJECT_ID, USER_ID)
SELECT	DISTINCT @PROJECT_ID, U.USER_ID
FROM	USERS U
		LEFT JOIN
		(SELECT DISTINCT USER_ID FROM PROJECT_USERS WHERE PROJECT_ID = @PROJECT_ID) PU ON U.USER_ID = PU.USER_ID
WHERE	PU.USER_ID IS NULL

--PROJECT TASKS
IF (SELECT COUNT(1) FROM PROJECT_TASKS WHERE PROJECT_ID = @PROJECT_ID) = 0
BEGIN
	DECLARE @TASK_ID INT
	SET @TASK_ID = (SELECT TASK_ID FROM TASKS WHERE NAME = 'GENERAL')
	INSERT INTO PROJECT_TASKS (PROJECT_ID, TASK_ID) SELECT @PROJECT_ID, @TASK_ID
END
--PROJECT PHASES
IF (SELECT COUNT(1) FROM PROJECT_PHASES WHERE PROJECT_ID = @PROJECT_ID) = 0
BEGIN
	DECLARE @PHASE_ID INT
	SET @PHASE_ID = (SELECT PHASE_ID FROM PHASES WHERE NAME = 'GENERAL')
	INSERT INTO PROJECT_PHASES (PROJECT_ID, PHASE_ID) SELECT @PROJECT_ID, @PHASE_ID
END
--PROJECT_USER_RATES
DECLARE @RATE_ID INT
	SET @RATE_ID = (SELECT RATE_ID FROM RATES WHERE RATE = 0)
	INSERT 	INTO PROJECT_USER_RATES (PROJECT_ID, USER_ID, RATE_ID)
	SELECT	DISTINCT @PROJECT_ID, U.USER_ID, @RATE_ID
	FROM	USERS U
			LEFT JOIN
			(SELECT DISTINCT USER_ID FROM PROJECT_USER_RATES WHERE PROJECT_ID = @PROJECT_ID) PUR ON U.USER_ID = PUR.USER_ID
	WHERE	PUR.USER_ID IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[ADD_PROJECT_TASK]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADD_PROJECT_TASK]
--DROP PROC DBO.ADD_PROJECT_TASK
(
	@PROJECT_ID INT, 
	@TASK_ID INT
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	ADD_PROJECT_TASK
AUTHOR  	JOHN HERMAN    
PURPOSE  	ADDS A TASK TO A PROJECT
COMMENTS 	RETURNS 0 FOR SUCCESS
			-1 FOR FAILURE
MOD LOG  	09/21/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
--CHECK IF IT EXISTS
IF
(
	SELECT	COUNT(1)
	FROM	PROJECT_TASKS
	WHERE	PROJECT_ID = @PROJECT_ID
			AND TASK_ID = @TASK_ID
) = 0
AND 
(
	SELECT COUNT(1) FROM TASKS WHERE TASK_ID = @TASK_ID
) > 0
AND 
(
	SELECT COUNT(1) FROM PROJECTS WHERE PROJECT_ID = @PROJECT_ID
) > 0
BEGIN
	INSERT INTO PROJECT_TASKS (PROJECT_ID, TASK_ID) SELECT @PROJECT_ID, @TASK_ID
END
ELSE RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[ADD_PROJECT_PHASE]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADD_PROJECT_PHASE]
--DROP PROC DBO.ADD_PROJECT_PHASE
(
	@PROJECT_ID INT, 
	@PHASE_ID INT
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	ADD_PROJECT_PHASE
AUTHOR  	JOHN HERMAN    
PURPOSE  	ADDS A PHASE TO A PROJECT
COMMENTS 	RETURNS 0 FOR SUCCESS
			-1 FOR FAILURE
MOD LOG  	09/21/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
--CHECK IF IT EXISTS
-- DECLARE @PROJECT_ID INT, @PHASE_ID INT
-- SET @PROJECT_ID = 1
-- SET @PHASE_ID = 6
IF
(
	SELECT	COUNT(1)
	FROM	PROJECT_PHASES
	WHERE	PROJECT_ID = @PROJECT_ID
			AND PHASE_ID = @PHASE_ID
) = 0
AND 
(
	SELECT COUNT(1) FROM PHASES WHERE PHASE_ID = @PHASE_ID
) > 0
AND 
(
	SELECT COUNT(1) FROM PROJECTS WHERE PROJECT_ID = @PROJECT_ID
) > 0
BEGIN
	INSERT INTO PROJECT_PHASES (PROJECT_ID, PHASE_ID) SELECT @PROJECT_ID, @PHASE_ID
	SELECT 0
END
ELSE SELECT -1
GO
/****** Object:  StoredProcedure [dbo].[ADD_PROJECT_USER_RATE]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADD_PROJECT_USER_RATE]
--DROP PROC DBO.ADD_PROJECT_USER_RATE
(
	@PROJECT_ID INT, 
	@USER_ID INT, 
	@RATE_ID INT, 
	@DESCRIPTION VARCHAR(1000),
	@TASK_ID INT
)
AS
IF (
	SELECT 	COUNT(1) 
	FROM 	PROJECT_USER_RATES 
	WHERE 	PROJECT_ID = @PROJECT_ID
			AND USER_ID = @USER_ID
			AND RATE_ID = @RATE_ID
			AND TASK_ID = @TASK_ID
	) > 0 
BEGIN
	--MAKE THIS THE ACTIVE RATE, INACTIVATE ALL OTHERS FOR THIS PROJECT AND USER
	UPDATE 	PROJECT_USER_RATES
	SET 	ACTIVE_FLAG = 0
	WHERE 	PROJECT_ID = @PROJECT_ID
			AND USER_ID = @USER_ID
			AND TASK_ID = @TASK_ID
	UPDATE 	PROJECT_USER_RATES
	SET 	ACTIVE_FLAG = 1
	WHERE 	PROJECT_ID = @PROJECT_ID
			AND USER_ID = @USER_ID
			AND RATE_ID = @RATE_iD
			AND TASK_ID = @TASK_ID
END
ELSE
BEGIN
	--INACTIVATE ALL OTHER PROJECT USER RATES FOR THIS PROJECT/USER
	UPDATE 	PROJECT_USER_RATES
	SET 		ACTIVE_FLAG = 0
	WHERE 	PROJECT_ID = @PROJECT_ID
			AND USER_ID = @USER_ID AND TASK_ID = @TASK_ID 
	--INSERT THE NEW PROJECT_USER_RATE
	INSERT INTO PROJECT_USER_RATES (PROJECT_ID, USER_ID, RATE_ID, ACTIVE_FLAG, DESCRIPTION, TASK_ID)
	SELECT	@PROJECT_ID, @USER_ID, @RATE_ID, 1, @DESCRIPTION,@TASK_ID
END
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_PROJECT_DATA]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_ALL_PROJECT_DATA]
--DROP PROC DBO.GET_ALL_PROJECT_DATA
(
	@USER_ID INT
)
AS
/**************************************************************************************************
***************************************************************************************************
PROC NAME 	GET_ALL_PROJECT_DATA
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS COMPLETE PROJECT INFORMATION RECORDSET FOR ALL PROJECTS THAT THE USER
			IS ASSIGNED TO. IF THE USER IS AN ADMIN OR PROJECT MANAGER THEN IT SHOWS ALL PROJECTS
			AND ALL INFORMATION
RETURN		
MOD LOG  	10/27/2004 	HERMAN 	CREATED    
***************************************************************************************************
**************************************************************************************************/
DECLARE @UTYPE VARCHAR(50)
SET @UTYPE = 
(
	SELECT 	UT.NAME
	FROM	USERS U
			JOIN USER_TYPES UT ON U.USER_TYPE_ID = UT.USER_TYPE_ID
	WHERE	U.USER_ID = @USER_ID
)
IF @UTYPE IN ('ADMIN', 'PM')
	SELECT  P.PROJECT_ID, P.PROJECT_CODE PROJECT_CODE, P.NAME PROJECT_NAME, P.DESCRIPTION PROJECT_DESCRIPTION, 
			U.FIRST USER_FIRST_NAME, U.MIDDLE USER_MIDDLE, U.LAST USER_LAST_NAME, U.USER_ID, U.FIRST + U.MIDDLE + U.LAST FULL_USER_NAME, 
			PP.PHASE_ID, PH.NAME PHASE_NAME, PH.DESCRIPTION PHASE_DESCRIPTION, 
			T2.TASK_ID PROJECT_TASK_ID, T2.NAME PROJECT_TASK_NAME, T2.DESCRIPTION PROJECT_TASK_DESCRIPTION, 
			BC.CONTACT_ID, SC.FIRST + ' ' + BC.LAST BILLING_FULL_NAME,
			SC.CONTACT_ID, SC.FIRST + ' ' + SC.LAST SPONSOR_FULL_NAME
	FROM    PROJECTS P
	        LEFT JOIN PROJECT_USERS PU ON P.PROJECT_ID = PU.PROJECT_ID
	        LEFT JOIN USERS U ON PU.USER_ID = U.USER_ID
	        LEFT JOIN PROJECT_PHASES PP ON P.PROJECT_ID = PP.PROJECT_ID
	        LEFT JOIN PHASES PH ON PP.PHASE_ID = PH.PHASE_ID
	 		LEFT JOIN PROJECT_TASKS PT ON P.PROJECT_ID = PT.PROJECT_ID
	 		LEFT JOIN TASKS T2 ON PT.TASK_ID = T2.TASK_ID
			LEFT JOIN CHARTER C ON P.CHARTER_ID = C.CHARTER_ID
			LEFT JOIN CONTACTS BC ON C.BILLING_CONTACT_ID = BC.CONTACT_ID
			LEFT JOIN CONTACTS SC ON C.SPONSOR_CONTACT_ID = SC.CONTACT_ID


		
ELSE
	SELECT  P.PROJECT_ID,  P.PROJECT_CODE PROJECT_CODE,  P.NAME PROJECT_NAME, P.DESCRIPTION PROJECT_DESCRIPTION, 
			U.FIRST USER_FIRST_NAME, U.MIDDLE USER_MIDDLE, U.LAST USER_LAST_NAME, U.USER_ID, U.FIRST + U.MIDDLE + U.LAST FULL_USER_NAME, 
			PP.PHASE_ID, PH.NAME PHASE_NAME, PH.DESCRIPTION PHASE_DESCRIPTION, 
			T2.TASK_ID PROJECT_TASK_ID, T2.NAME PROJECT_TASK_NAME, T2.DESCRIPTION PROJECT_TASK_DESCRIPTION, 
			BC.CONTACT_ID, SC.FIRST + ' ' + BC.LAST BILLING_FULL_NAME,
			SC.CONTACT_ID, SC.FIRST + ' ' + SC.LAST SPONSOR_FULL_NAME
	FROM    PROJECTS P
	        JOIN PROJECT_USERS PU ON P.PROJECT_ID = PU.PROJECT_ID
	        JOIN USERS U ON PU.USER_ID = U.USER_ID
	        LEFT JOIN PROJECT_PHASES PP ON P.PROJECT_ID = PP.PROJECT_ID
	        LEFT JOIN PHASES PH ON PP.PHASE_ID = PH.PHASE_ID
	 		LEFT JOIN PROJECT_TASKS PT ON P.PROJECT_ID = PT.PROJECT_ID
	 		LEFT JOIN TASKS T2 ON PT.TASK_ID = T2.TASK_ID
			LEFT JOIN CHARTER C ON P.CHARTER_ID = C.CHARTER_ID
			LEFT JOIN CONTACTS BC ON C.BILLING_CONTACT_ID = BC.CONTACT_ID
			LEFT JOIN CONTACTS SC ON C.SPONSOR_CONTACT_ID = SC.CONTACT_ID
	WHERE	PU.USER_ID = @USER_ID
GO
/****** Object:  StoredProcedure [dbo].[GET_ADDRESS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_ADDRESS]  
--DROP PROC DBO.GET_ADDRESS
(
	@ADDRESS_ID INT = NULL, 
	@TYPE VARCHAR(20)
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	GET_ADDRESS
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS AN ADDRESS FOR A CONTACT, CLIENT, OR USER
COMMENTS 	
MOD LOG  	11/29/2004	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/

IF @ADDRESS_ID IS NULL 
BEGIN
	SELECT	A.ADDRESS_ID, ISNULL(A.ADDRESS1,'') ADDRESS1, ISNULL(A.ADDRESS2,'') ADDRESS2, ISNULL(A.CITY,'') CITY, ISNULL(A.COUNTY,'') COUNTY, ISNULL(A.POSTAL_CODE,'') POSTAL_CODE, S.STATE_ID, S.NAME STATE, S.ABBREVIATION , ISNULL(A.ZIP,0) ZIP, ISNULL(A.COUNTRY,'') COUNTRY,
 
			A.UPDATED_DATE, A.UPDATED_BY, A.PHONE, A.FAX
	FROM	ADDRESS A
			JOIN STATES S ON A.STATE_ID = S.STATE_ID
			JOIN ADDRESS_TYPE AD ON A.ADDRESS_TYPE_ID = AD.ADDRESS_TYPE_ID
	WHERE 	AD.TYPE = @TYPE
END
ELSE
BEGIN
	SELECT	A.ADDRESS_ID, ISNULL(A.ADDRESS1,'') ADDRESS1, ISNULL(A.ADDRESS2,'') ADDRESS2, ISNULL(A.CITY,'') CITY, ISNULL(A.COUNTY,'') COUNTY, ISNULL(A.POSTAL_CODE,'') POSTAL_CODE, S.STATE_ID, S.NAME STATE, S.ABBREVIATION , ISNULL(A.ZIP,0) ZIP, ISNULL(A.COUNTRY,'') COUNTRY,
 
			A.UPDATED_DATE, A.UPDATED_BY, A.PHONE, A.FAX
	FROM	ADDRESS A
			JOIN STATES S ON A.STATE_ID = S.STATE_ID
			JOIN ADDRESS_TYPE AD ON A.ADDRESS_TYPE_ID = AD.ADDRESS_TYPE_ID
	WHERE	ADDRESS_ID =@ADDRESS_ID
			AND AD.TYPE = @TYPE

END
GO
/****** Object:  StoredProcedure [dbo].[GET_ACTIVE_PROJECT_DATA]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  PROC [dbo].[GET_ACTIVE_PROJECT_DATA]
--DROP PROC DBO.GET_ACTIVE_PROJECT_DATA
(
	@USER_ID INT
)
AS
/**************************************************************************************************
***************************************************************************************************
PROC NAME 	GET_ACTIVE_PROJECT_DATA
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS COMPLETE PROJECT INFORMATION RECORDSET FOR ACTIVE PROJECTS THAT THE USER
			IS ASSIGNED TO. IF THE USER IS AN ADMIN OR PROJECT MANAGER THEN IT SHOWS ALL ACTIVE PROJECTS
			AND ALL INFORMATION
RETURN		
MOD LOG  	10/27/2004 	HERMAN 	CREATED   
		11/18/2004	RGB- Made joins to project and tasks inner so only return
				projects with tasks and phases
***************************************************************************************************
**************************************************************************************************/
DECLARE @UTYPE VARCHAR(50)
SET @UTYPE = 
(
	SELECT 	UT.NAME
	FROM	USERS U
			JOIN USER_TYPES UT ON U.USER_TYPE_ID = UT.USER_TYPE_ID
	WHERE	U.USER_ID = @USER_ID
)
IF @UTYPE IN ('ADMIN', 'PM')
	SELECT  P.PROJECT_ID, P.PROJECT_CODE PROJECT_CODE, P.NAME PROJECT_NAME, P.DESCRIPTION PROJECT_DESCRIPTION, 
			U.FIRST USER_FIRST_NAME, U.MIDDLE USER_MIDDLE, U.LAST USER_LAST_NAME, U.USER_ID, U.FIRST + U.MIDDLE + U.LAST FULL_USER_NAME, 
			PP.PHASE_ID, PH.NAME PHASE_NAME, PH.DESCRIPTION PHASE_DESCRIPTION, 
			T2.TASK_ID PROJECT_TASK_ID, T2.NAME PROJECT_TASK_NAME, T2.DESCRIPTION PROJECT_TASK_DESCRIPTION
	FROM    PROJECTS P
	        LEFT JOIN PROJECT_USERS PU ON P.PROJECT_ID = PU.PROJECT_ID
	        LEFT JOIN USERS U ON PU.USER_ID = U.USER_ID
	        LEFT JOIN PROJECT_PHASES PP ON P.PROJECT_ID = PP.PROJECT_ID
	       LEFT JOIN PHASES PH ON PP.PHASE_ID = PH.PHASE_ID
	 	LEFT JOIN PROJECT_TASKS PT ON P.PROJECT_ID = PT.PROJECT_ID
	 	LEFT JOIN TASKS T2 ON PT.TASK_ID = T2.TASK_ID
		INNER JOIN CHARTER C ON P.CHARTER_ID = C.CHARTER_ID
	WHERE	C.CHARTER_STATUS_ID = 1 --ACTIVE
		
ELSE
	SELECT  P.PROJECT_ID,  P.PROJECT_CODE PROJECT_CODE,  P.NAME PROJECT_NAME, P.DESCRIPTION PROJECT_DESCRIPTION, 
			U.FIRST USER_FIRST_NAME, U.MIDDLE USER_MIDDLE, U.LAST USER_LAST_NAME, U.USER_ID, U.FIRST + U.MIDDLE + U.LAST FULL_USER_NAME, 
			PP.PHASE_ID, PH.NAME PHASE_NAME, PH.DESCRIPTION PHASE_DESCRIPTION, 
			T2.TASK_ID PROJECT_TASK_ID, T2.NAME PROJECT_TASK_NAME, T2.DESCRIPTION PROJECT_TASK_DESCRIPTION
	FROM    PROJECTS P
	        JOIN PROJECT_USERS PU ON P.PROJECT_ID = PU.PROJECT_ID
	        JOIN USERS U ON PU.USER_ID = U.USER_ID
	        LEFT JOIN PROJECT_PHASES PP ON P.PROJECT_ID = PP.PROJECT_ID
	        LEFT JOIN PHASES PH ON PP.PHASE_ID = PH.PHASE_ID
	 	LEFT JOIN PROJECT_TASKS PT ON P.PROJECT_ID = PT.PROJECT_ID
	 	LEFT  JOIN TASKS T2 ON PT.TASK_ID = T2.TASK_ID
		INNER JOIN CHARTER C ON P.CHARTER_ID = C.CHARTER_ID
	WHERE	PU.USER_ID = @USER_ID
			AND C.CHARTER_STATUS_ID = 1 --ACTIVE
GO
/****** Object:  StoredProcedure [dbo].[GET_PROJECT_TASKS_AVAILABLE]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
Create  PROC [dbo].[GET_PROJECT_TASKS_AVAILABLE]
--DROP PROC [dbo].[GET_PROJECT_TASKS_AVAILABLE]
(
	@PROJECT_ID INT
)
AS
begin
select TASK_ID, TASKS.NAME as NAME from TASKS Where TASK_ID not in
(
SELECT DISTINCT TASKS.TASK_ID 
FROM         PROJECT_TASKS INNER JOIN 
TASKS ON PROJECT_TASKS.TASK_ID = TASKS.TASK_ID 
WHERE PROJECT_TASKS.PROJECT_ID = @PROJECT_ID 
)
ORDER BY TASKS.NAME

end
GO
/****** Object:  StoredProcedure [dbo].[GET_PROJECT_RATES]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[GET_PROJECT_RATES]
(
	@PROJECT_ID INT
)
AS
SELECT     LTRIM(RTRIM(USERS.FIRST)) + ' ' + LTRIM(RTRIM(USERS.MIDDLE)) + ' ' + LTRIM(RTRIM(USERS.LAST)) AS FULL_NAME, PROJECT_USER_RATES.USER_ID, TASKS.NAME, PROJECT_USER_RATES.TASK_ID, PROJECT_USER_RATES.RATE_ID, PROJECT_USER_RATES.PROJECT_ID, PROJECT_USER_RATES.DESCRIPTION, 
                      RATES.RATE, ACTIVE_FLAG, ActiveFrom, ActiveTo
FROM         PROJECT_USER_RATES 
INNER JOIN RATES ON PROJECT_USER_RATES.RATE_ID = RATES.RATE_ID
LEFT JOIN TASKS ON PROJECT_USER_RATES.TASK_ID=TASKS.TASK_ID
INNER JOIN USERS ON USERS.USER_ID = PROJECT_USER_RATES.USER_ID
WHERE PROJECT_USER_RATES.PROJECT_ID = @PROJECT_ID
GO
/****** Object:  StoredProcedure [dbo].[GET_PROJECT_PHASES_AVAILABLE]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create  PROC [dbo].[GET_PROJECT_PHASES_AVAILABLE]
--DROP PROC [dbo].[GET_PROJECT_PHASES_AVAILABLE]
(
	@PROJECT_ID INT
)
AS
begin
select PHASE_ID, PHASES.NAME as NAME from PHASES Where PHASE_ID not in
(
SELECT DISTINCT PHASES.PHASE_ID 
FROM         PROJECT_PHASES INNER JOIN 
PHASES ON PROJECT_PHASES.PHASE_ID = PHASES.PHASE_ID 
WHERE PROJECT_PHASES.PROJECT_ID = @PROJECT_ID 
)
ORDER BY PHASES.NAME

end
GO
/****** Object:  StoredProcedure [dbo].[GET_PROJECT_PHASES]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  PROC [dbo].[GET_PROJECT_PHASES]
--DROP PROC GET_PROJECT_PHASES
(
	@PROJECT_ID INT
)
AS
begin
SELECT DISTINCT PHASES.PHASE_ID, PHASES.NAME as NAME 
FROM         PROJECT_PHASES INNER JOIN 
PHASES ON PROJECT_PHASES.PHASE_ID = PHASES.PHASE_ID 
WHERE PROJECT_PHASES.PROJECT_ID = @PROJECT_ID ORDER BY PHASES.NAME

end
GO
/****** Object:  StoredProcedure [dbo].[GET_PROJECT_DATA]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  PROC [dbo].[GET_PROJECT_DATA]
--DROP PROC DBO.GET_PROJECT_DATA
(
	@USER_ID INT
)
AS
/**************************************************************************************************
***************************************************************************************************
PROC NAME 	GET_PROJECT_DATA
AUTHOR  	JOHN HERMAN    
PURPOSE  	GETS COMPLETE PROJECT INFORMATION RECORDSET FOR PROJECTS THAT THE USER
			IS ASSIGNED TO. IF THE USER IS AN ADMIN OR PROJECT MANAGER THEN IT SHOWS ALL PROJECTS
			AND ALL INFORMATION
RETURN		
MOD LOG  	09/03/2004 	HERMAN 	CREATED
                10/18/2004      Snider  Added order by clause    
***************************************************************************************************
**************************************************************************************************/
DECLARE @UTYPE VARCHAR(50)
SET @UTYPE = 
(
	SELECT 	UT.NAME
	FROM	USERS U
			JOIN USER_TYPES UT ON U.USER_TYPE_ID = UT.USER_TYPE_ID
	WHERE	U.USER_ID = @USER_ID
)
IF @UTYPE IN ('ADMIN', 'PM')
	SELECT  P.PROJECT_ID, 
		P.PROJECT_CODE PROJECT_CODE, 
		P.NAME PROJECT_NAME, 
		P.DESCRIPTION PROJECT_DESCRIPTION, 
		U.FIRST USER_FIRST_NAME, 
		U.MIDDLE USER_MIDDLE, 
		U.LAST USER_LAST_NAME, 
		U.USER_ID, 
		U.FIRST + U.MIDDLE + U.LAST FULL_USER_NAME, 
		PP.PHASE_ID, 
		PH.NAME PHASE_NAME, 
		PH.DESCRIPTION PHASE_DESCRIPTION, 
		T2.TASK_ID PROJECT_TASK_ID, 
		T2.NAME PROJECT_TASK_NAME, 
		T2.DESCRIPTION PROJECT_TASK_DESCRIPTION
	FROM    PROJECTS P
	        LEFT JOIN PROJECT_USERS PU ON P.PROJECT_ID = PU.PROJECT_ID
	        LEFT JOIN USERS U ON PU.USER_ID = U.USER_ID
	        LEFT JOIN PROJECT_PHASES PP ON P.PROJECT_ID = PP.PROJECT_ID
	        LEFT JOIN PHASES PH ON PP.PHASE_ID = PH.PHASE_ID
	 	LEFT JOIN PROJECT_TASKS PT ON P.PROJECT_ID = PT.PROJECT_ID
	 	LEFT JOIN TASKS T2 ON PT.TASK_ID = T2.TASK_ID
		ORDER BY T2.NAME, PH.NAME
              
ELSE
	SELECT  P.PROJECT_ID,  
		P.PROJECT_CODE PROJECT_CODE,  
		P.NAME PROJECT_NAME, 
		P.DESCRIPTION PROJECT_DESCRIPTION, 
		U.FIRST USER_FIRST_NAME, 
		U.MIDDLE USER_MIDDLE, 
		U.LAST USER_LAST_NAME, 
		U.USER_ID, U.FIRST + U.MIDDLE + U.LAST FULL_USER_NAME, 
		PP.PHASE_ID, PH.NAME PHASE_NAME, 
		PH.DESCRIPTION PHASE_DESCRIPTION, 
		T2.TASK_ID PROJECT_TASK_ID, 
		T2.NAME PROJECT_TASK_NAME, 
		T2.DESCRIPTION PROJECT_TASK_DESCRIPTION
	FROM    PROJECTS P
	        JOIN PROJECT_USERS PU ON P.PROJECT_ID = PU.PROJECT_ID
	        JOIN USERS U ON PU.USER_ID = U.USER_ID
	        LEFT JOIN PROJECT_PHASES PP ON P.PROJECT_ID = PP.PROJECT_ID
	        LEFT JOIN PHASES PH ON PP.PHASE_ID = PH.PHASE_ID
 		LEFT JOIN PROJECT_TASKS PT ON P.PROJECT_ID = PT.PROJECT_ID
 		LEFT JOIN TASKS T2 ON PT.TASK_ID = T2.TASK_ID
	WHERE	PU.USER_ID = @USER_ID
	ORDER BY T2.NAME, PH.NAME
GO
/****** Object:  StoredProcedure [dbo].[GET_CHARTER]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_CHARTER]
--DROP PROC DBO.GET_CHARTER
/*************************************************************************************
**************************************************************************************
PROC NAME 	GET_CHARTER
AUTHOR  	JOHN HERMAN    
PURPOSE  	RETURNS A SINGLE OR ALL CHARTERS FROM THE CHARTER TABLE
COMMENTS 	IF CHARTER_ID IS NULL THEN WE RETURN ALL CHARTERS
MOD LOG  	
		09/30/2005	AHOLUB Added BILLABLE to select statements
		11/22/2004	Binzley changed to get data based on Project_ID instead of Charter_ID
		09/02/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
(
	@PROJECT_ID INT = NULL
)
AS
IF @PROJECT_ID IS NULL 
BEGIN
	SELECT	C.CLIENT_ID, C.BUSINESS_LINE_ID, C.CHARTER_STATUS_ID, C.SUB_PROJECT, C.BILLING_CONTACT_NAME, C.ADDRESS_ID, C.ADDRESS_ID2, C.TELEPHONE_ID, C.COMPANY_WEBSITE, C.INDUSTRY, C.FIRST_BILLED_DATE, C.LAST_BILLED_DATE, C.PO#, C.PROJECT_MANAGER_ID, C.EXPECTED_START_DATE, C.ESTIMATED_COMPLETION_DATE, C.ESTIMATED_DURATION, C.ESTIMATED_BUDGET, C.TECHNOLOGY_ID, C.ACCOUNT_MANAGER_ID, C.PROJECT_TYPE_ID, C.BILLING_TERMS_ID, C.PAYMENT_TERMS_ID, C.AUTHORIZATION_ID, C.[DESC], C.TOTAL_ESTIMATED_HOURS, C.TOTAL_ESTIMATED_COST, C.BILLING_NOTES, C.PROJECT_NOTES, C.UPDATED_DATE, C.UPDATED_BY, C.CHARTER_ID, C.PROJECT_CODE, C.INDUSTRY_ID, C.BILLING_CONTACT_ID, C.SPONSOR_CONTACT_ID,
			P.*, I.ID, A.ADDRESS1, A.ADDRESS2, ISNULL(A.CITY,'') + ',' + ISNULL(S.ABBREVIATION,'') + ' '+ ISNULL(A.ZIP, '') AS CITYSTATEZIP, 
			CON.EMAIL, C.BILLABLE
	FROM	CHARTER C
			INNER JOIN PROJECTS P ON C.CHARTER_ID = P.CHARTER_ID
			LEFT JOIN Term I ON C.INDUSTRY_ID = I.ID
			LEFT JOIN CONTACTS CON ON C.CLIENT_ID = CON.CLIENT_ID AND C.BILLING_CONTACT_ID = CON.CONTACT_ID
			LEFT JOIN ADDRESS A ON CON.CONTACT_ID = A.ADDRESS_ID
			LEFT JOIN STATES S ON A.STATE_ID = S.STATE_ID
	WHERE  (I.TermHeaderValue='Industry' OR I.TermHeaderValue is null)
END
ELSE
BEGIN
	SELECT	C.CLIENT_ID, C.BUSINESS_LINE_ID, C.CHARTER_STATUS_ID, C.SUB_PROJECT, C.BILLING_CONTACT_NAME, C.ADDRESS_ID, C.ADDRESS_ID2, C.TELEPHONE_ID, C.COMPANY_WEBSITE, C.INDUSTRY, C.FIRST_BILLED_DATE, C.LAST_BILLED_DATE, C.PO#, C.PROJECT_MANAGER_ID, C.EXPECTED_START_DATE, C.ESTIMATED_COMPLETION_DATE, C.ESTIMATED_DURATION, C.ESTIMATED_BUDGET, C.TECHNOLOGY_ID, C.ACCOUNT_MANAGER_ID, C.PROJECT_TYPE_ID, C.BILLING_TERMS_ID, C.PAYMENT_TERMS_ID, C.AUTHORIZATION_ID, C.[DESC], C.TOTAL_ESTIMATED_HOURS, C.TOTAL_ESTIMATED_COST, C.BILLING_NOTES, C.PROJECT_NOTES, C.UPDATED_DATE, C.UPDATED_BY, C.CHARTER_ID, C.PROJECT_CODE, C.INDUSTRY_ID, C.BILLING_CONTACT_ID, C.SPONSOR_CONTACT_ID,
			P.*, I.ID, A.ADDRESS1, A.ADDRESS2, ISNULL(A.CITY,'') + ',' + ISNULL(S.ABBREVIATION,'') + ' '+ ISNULL(A.ZIP, '') AS CITYSTATEZIP, 
			CON.EMAIL, C.BILLABLE
	FROM	CHARTER C
			INNER JOIN PROJECTS P ON C.CHARTER_ID = P.CHARTER_ID
			LEFT JOIN Term I ON C.INDUSTRY_ID = I.ID
			LEFT JOIN CONTACTS CON ON C.CLIENT_ID = CON.CLIENT_ID AND C.BILLING_CONTACT_ID = CON.CONTACT_ID
			LEFT JOIN ADDRESS A ON CON.CONTACT_ID = A.ADDRESS_ID
			LEFT JOIN STATES S ON A.STATE_ID = S.STATE_ID
	WHERE	P.PROJECT_ID = @PROJECT_ID AND (I.TermHeaderValue='Industry' OR I.TermHeaderValue is null)
END
GO
/****** Object:  StoredProcedure [dbo].[GET_PROJECT_USERS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_PROJECT_USERS]
--drop PROC dbo.GET_PROJECT_USERS
(
	@PROJECT_ID INT
)
AS
SELECT	PROJECT_USER_RATES.USER_ID, LTRIM(RTRIM(USERS.FIRST)) + ' ' + LTRIM(RTRIM(USERS.MIDDLE)) + ' ' + LTRIM(RTRIM(USERS.LAST)) FULL_NAME, TASKS.NAME, PROJECT_USER_RATES.ACTIVE_FLAG, PROJECT_USER_RATES.DESCRIPTION, 
		USERS.USERNAME, PROJECTS.PROJECT_CODE, RATES.RATE
FROM 		PROJECTS 
INNER JOIN PROJECT_USER_RATES ON PROJECTS.PROJECT_ID = PROJECT_USER_RATES.PROJECT_ID 
INNER JOIN RATES ON PROJECT_USER_RATES.RATE_ID = RATES.RATE_ID 
INNER JOIN USERS ON PROJECT_USER_RATES.USER_ID = USERS.USER_ID
LEFT JOIN TASKS ON TASKS.TASK_ID = PROJECT_USER_RATES.TASK_ID
WHERE 	PROJECTS.PROJECT_ID = @PROJECT_ID
GO
/****** Object:  StoredProcedure [dbo].[GET_USER_PROJECT_DATA]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_USER_PROJECT_DATA]
--DROP PROC DBO.GET_USER_PROJECT_DATA
(
	@USER_ID INT
)
AS
/**************************************************************************************************
***************************************************************************************************
PROC NAME 	GET_PROJECT_DATA
AUTHOR  	JOHN HERMAN    
PURPOSE  	RETURNS ALL PROJECTS WITH AT LEAST 1 USER, PHASE, AND TASK THAT ARE ASSIGNED TO THE USER_ID
			PASSED IN. RETURNS ALL 'VALID' PROJECTS IF THE USER_ID IS AN ADMIN
RETURN		
MOD LOG  	09/03/2004 	HERMAN 	CREATED    
***************************************************************************************************
**************************************************************************************************/
DECLARE @UTYPE VARCHAR(50)
SET @UTYPE = 
(
	SELECT 	UT.NAME
	FROM	USERS U
			JOIN USER_TYPES UT ON U.USER_TYPE_ID = UT.USER_TYPE_ID
	WHERE	U.USER_ID = @USER_ID
)
IF @UTYPE IN ('ADMIN', 'PM')
	SELECT  P.PROJECT_ID, P.NAME PROJECT_NAME, P.DESCRIPTION PROJECT_DESCRIPTION, P.GLOBAL,
			U.FIRST USER_FIRST_NAME, U.MIDDLE USER_MIDDLE, U.LAST USER_LAST_NAME, U.USER_ID, U.FIRST + U.MIDDLE + U.LAST FULL_USER_NAME, 
			PP.PHASE_ID, PH.NAME PHASE_NAME, PH.DESCRIPTION PHASE_DESCRIPTION, 
			T2.TASK_ID PROJECT_TASK_ID, T2.NAME PROJECT_TASK_NAME, T2.DESCRIPTION PROJECT_TASK_DESCRIPTION
	FROM    PROJECTS P
	        JOIN PROJECT_USERS PU ON P.PROJECT_ID = PU.PROJECT_ID
	        JOIN USERS U ON PU.USER_ID = U.USER_ID
	        JOIN PROJECT_PHASES PP ON P.PROJECT_ID = PP.PROJECT_ID
	        JOIN PHASES PH ON PP.PHASE_ID = PH.PHASE_ID
	 		JOIN PROJECT_TASKS PT ON P.PROJECT_ID = PT.PROJECT_ID
	 		JOIN TASKS T2 ON PT.TASK_ID = T2.TASK_ID
ELSE
	SELECT  P.PROJECT_ID, P.NAME PROJECT_NAME, P.DESCRIPTION PROJECT_DESCRIPTION, P.GLOBAL,
			U.FIRST USER_FIRST_NAME, U.MIDDLE USER_MIDDLE, U.LAST USER_LAST_NAME, U.USER_ID, U.FIRST + U.MIDDLE + U.LAST FULL_USER_NAME, 
			PP.PHASE_ID, PH.NAME PHASE_NAME, PH.DESCRIPTION PHASE_DESCRIPTION, 
			T2.TASK_ID PROJECT_TASK_ID, T2.NAME PROJECT_TASK_NAME, T2.DESCRIPTION PROJECT_TASK_DESCRIPTION
	FROM    PROJECTS P
	        JOIN PROJECT_USERS PU ON P.PROJECT_ID = PU.PROJECT_ID
	        JOIN USERS U ON PU.USER_ID = U.USER_ID
	        JOIN PROJECT_PHASES PP ON P.PROJECT_ID = PP.PROJECT_ID
	        JOIN PHASES PH ON PP.PHASE_ID = PH.PHASE_ID
	 		JOIN PROJECT_TASKS PT ON P.PROJECT_ID = PT.PROJECT_ID
	 		JOIN TASKS T2 ON PT.TASK_ID = T2.TASK_ID
	WHERE	PU.USER_ID = @USER_ID
GO
/****** Object:  Table [dbo].[TIME]    Script Date: 01/26/2011 11:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIME](
	[USER_ID] [int] NOT NULL,
	[PROJECT_ID] [int] NOT NULL,
	[TASK_ID] [int] NOT NULL,
	[PHASE_ID] [int] NOT NULL,
	[DESCRIPTION] [varchar](2000) NULL,
	[BILLABLE] [int] NOT NULL,
	[HOURS] [decimal](12, 4) NULL,
	[BILL_DATE] [datetime] NOT NULL,
	[RATE] [int] NOT NULL,
 CONSTRAINT [PK_TIME] PRIMARY KEY CLUSTERED 
(
	[USER_ID] ASC,
	[PROJECT_ID] ASC,
	[TASK_ID] ASC,
	[PHASE_ID] ASC,
	[BILLABLE] ASC,
	[BILL_DATE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SAVE_CLIENT_DATA]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SAVE_CLIENT_DATA]
--DROP PROC DBO.SAVE_CLIENT_DATA
(
	@CLIENT_ID AS INT, 
	@COMPANY_NAME AS VARCHAR (100), 
	@COMMENT AS NTEXT, 
	@COMPANY_WEBSITE AS VARCHAR(100), 
	@ADDRESS1 AS VARCHAR(200), 
	@ADDRESS2 AS VARCHAR(50), 
	@CITY AS VARCHAR(50), 
	@STATE_ID AS INT, 
	@ZIP AS VARCHAR(10), 
	@TYPE VARCHAR(20)
)
AS 
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.SAVE_CLIENT_DATA
AUTHOR  	JOHN HERMAN    
PURPOSE  	SAVES OR UPDATES CLIENT AND ADDRESS DATA FOR A NEW OR EXISTING CLIENT
COMMENTS 	FRONT END SHOULD PASS CLIENT_ID = -1 TO CREATE A NEW CLIENT
MOD LOG  	12/02/2004	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
DECLARE @ADDRESS_TYPE_ID INT
SET @ADDRESS_TYPE_ID = (SELECT ADDRESS_TYPE_ID FROM ADDRESS_TYPE WHERE TYPE = @TYPE)
IF @CLIENT_ID = -1
BEGIN
	--INSERT A NEW CLIENT
	INSERT INTO CLIENTS (COMPANY_NAME, STATUS_ID, COMMENT, COMPANY_WEBSITE)
	SELECT @COMPANY_NAME, 1, @COMMENT, @COMPANY_WEBSITE
	--NOW GET THE FRESHLY INSERTED CLIENT_ID
	--SELECT @CLIENT_ID = MAX(CLIENT_ID) FROM CLIENTS 
	SELECT @CLIENT_ID = CLIENT_ID FROM CLIENTS WHERE COMPANY_NAME = @COMPANY_NAME AND COMPANY_WEBSITE = @COMPANY_WEBSITE
	--INSERT  A NEW ADDRESS
	INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS1, ADDRESS2, CITY, STATE_ID, ZIP, ADDRESS_TYPE_ID)
	SELECT @CLIENT_ID, @ADDRESS1, @ADDRESS2, @CITY, @STATE_ID, @ZIP, @ADDRESS_TYPE_ID
END
ELSE
BEGIN
	--UPDATE CLIENT INFORMATION
	UPDATE 	CLIENTS
	SET		COMPANY_NAME = @COMPANY_NAME, 
			COMMENT= @COMMENT, 
			COMPANY_WEBSITE = @COMPANY_WEBSITE
	WHERE	CLIENT_ID = @CLIENT_ID
	IF (SELECT COUNT(1) FROM ADDRESS WHERE ADDRESS_ID = @CLIENT_ID AND ADDRESS_TYPE_ID = @ADDRESS_TYPE_ID) >0
	BEGIN
		--UPDATE ADDRESS FOR CLIENT
		UPDATE	ADDRESS
		SET 	ADDRESS1 = @ADDRESS1, 
				ADDRESS2= @ADDRESS2, 
				CITY= @CITY, 
				STATE_ID= @STATE_ID, 
				ZIP= @ZIP 
		WHERE	ADDRESS_ID = @CLIENT_ID
				AND ADDRESS_TYPE_ID = @ADDRESS_TYPE_ID
	END
	ELSE
	BEGIN
		--INSERT ADDRESS FOR CLIENT
		INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS1, ADDRESS2, CITY, STATE_ID, ZIP, ADDRESS_TYPE_ID)
		SELECT @CLIENT_ID, @ADDRESS1, @ADDRESS2, @CITY, @STATE_ID, @ZIP, @ADDRESS_TYPE_ID
	END
END
SELECT @CLIENT_ID
GO
/****** Object:  StoredProcedure [dbo].[REMOVE_PROJECT_USER]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[REMOVE_PROJECT_USER]
--DROP PROC DBO.REMOVE_PROJECT_USER
(
	@PROJECT_ID INT, 
	@USER_ID INT
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	REMOVE_PROJECT_USER
AUTHOR  	JOHN HERMAN    
PURPOSE  	CREATES A RECORD IN THE PROJECT USERS TABLE
COMMENTS 	
MOD LOG  	09/15/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
-- DECLARE @PROJECT_ID INT, @USER_ID INT
-- SELECT	@PROJECT_ID = 3, @USER_ID = 1
DELETE FROM PROJECT_USERS WHERE PROJECT_ID = @PROJECT_ID AND USER_ID = @USER_ID
IF @@ERROR <> 0 RETURN -1
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[SAVE_CHARTER]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[SAVE_CHARTER]
--DROP PROC DBO.SAVE_CHARTER
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.SAVE_CHARTER
AUTHOR  	JOHN HERMAN    
PURPOSE  	SAVES OR UPDATES CHARTER INFORMATION
RETURN		0 	SUCCESS
			-1	ERROR
COMMENTS 	WE WILL HAVE TO FIGURE OUT WHAT IS ALLOWED TO BE NULL AND WHAT IS NOT
			WE WILL NOT ALLOW THE PROJECT_ID TO CHANGE
MOD LOG  	
		12/21/2004	HERMAN	CHANGED BILLING NAME TO BILLING_CONTACT_ID
							ADDED SPONSOR_CONTACT_ID
							REMOVED ADDRESS1, 2, AND EMAIL AS THESE ARE IN ADDRESS AND CONTACT TABLES
		11/22/2004	Binzley Added MileStone_Status_Flag
		10/25/2004	REILLY		CREATED UPDATE CHARTER
		09/14/2004	HERMAN	FIXED PROJECT_CODE ISSUE
		09/13/2004 	HERMAN	CREATE A PROJECT WHEN SAVING A NEW CHARTER
		09/01/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
(
	@CHARTER_ID INT = NULL, 
	@CLIENT_ID INT = NULL, 
	@PROJECT_CODE VARCHAR(20) , 
	@BUSINESS_LINE_ID INT = NULL, 
	@CHARTER_STATUS_ID INT = NULL, 
	@SUB_PROJECT VARCHAR(100) = NULL, 
	@BILLING_CONTACT_ID INT, 
	@SPONSOR_CONTACT_ID INT, 
-- 	@ADDRESS_ID VARCHAR(100),
-- 	@ADDRESS_ID2 VARCHAR(100),
	@TELEPHONE_ID  VARCHAR(50),
-- 	@EMAIL VARCHAR(50),
	@COMPANY_WEBSITE VARCHAR(100) = NULL, 
	@INDUSTRY_ID INT, 
	@FIRST_BILLED_DATE DATETIME = NULL, 
	@LAST_BILLED_DATE DATETIME = NULL, 
	@PO# VARCHAR(50) = NULL, 
	@PROJECT_MANAGER_ID INT = NULL, 
	@EXPECTED_START_DATE DATETIME = NULL, 
	@ESTIMATED_COMPLETION_DATE DATETIME = NULL, 
	@ESTIMATED_DURATION VARCHAR(50) = NULL, 
	@ESTIMATED_BUDGET VARCHAR(50),
	@TECHNOLOGY_ID VARCHAR(50) = NULL, 
	@ACCOUNT_MANAGER_ID INT = NULL, 
	@PROJECT_TYPE_ID INT = NULL, 
	@BILLING_TERMS_ID INT = NULL, 
	@PAYMENT_TERMS_ID INT = NULL, 
	@AUTHORIZATION_ID INT = NULL, 
	@DESC VARCHAR(1000) = NULL, 
	@TOTAL_ESTIMATED_HOURS INT = NULL, 
	@TOTAL_ESTIMATED_COST MONEY= NULL, 
	@BILLING_NOTES VARCHAR(1000) = NULL, 
	@PROJECT_NOTES VARCHAR(1000) = NULL, 
	@UPDATED_DATE DATETIME= NULL, 
	@UPDATED_BY INT = NULL, 
	@PROJECT_GLOBAL BIT = 0,
	@MILESTONE_STATUS_FLAG INT = 0,
	@BILLABLE BIT = 0
	
)
AS
DECLARE @NEW_CHARTER_ID INT, @NEW_PROJECT_ID INT
IF @CHARTER_ID IS NULL
BEGIN
	--INSERT A NEW CHARTER AND A NEW PROJECT 
	INSERT INTO CHARTER 
	(
		CLIENT_ID, BUSINESS_LINE_ID, CHARTER_STATUS_ID, SUB_PROJECT, BILLING_CONTACT_ID, SPONSOR_CONTACT_ID, TELEPHONE_ID, 
		COMPANY_WEBSITE, INDUSTRY_ID, FIRST_BILLED_DATE, LAST_BILLED_DATE, PO#, PROJECT_MANAGER_ID, EXPECTED_START_DATE, 
		ESTIMATED_COMPLETION_DATE, ESTIMATED_DURATION, ESTIMATED_BUDGET, TECHNOLOGY_ID, ACCOUNT_MANAGER_ID, PROJECT_TYPE_ID, BILLING_TERMS_ID, 
		PAYMENT_TERMS_ID, AUTHORIZATION_ID, [DESC], TOTAL_ESTIMATED_HOURS, TOTAL_ESTIMATED_COST, BILLING_NOTES, PROJECT_NOTES, 
		UPDATED_DATE, UPDATED_BY, BILLABLE
	)
	SELECT 
		@CLIENT_ID, @BUSINESS_LINE_ID, @CHARTER_STATUS_ID, @SUB_PROJECT, @BILLING_CONTACT_ID, @SPONSOR_CONTACT_ID, @TELEPHONE_ID, 
		@COMPANY_WEBSITE, @INDUSTRY_ID, @FIRST_BILLED_DATE, @LAST_BILLED_DATE, @PO#, @PROJECT_MANAGER_ID, @EXPECTED_START_DATE, 
		@ESTIMATED_COMPLETION_DATE, @ESTIMATED_DURATION, @ESTIMATED_BUDGET, @TECHNOLOGY_ID, @ACCOUNT_MANAGER_ID, @PROJECT_TYPE_ID, @BILLING_TERMS_ID, 
		@PAYMENT_TERMS_ID, @AUTHORIZATION_ID, @DESC, @TOTAL_ESTIMATED_HOURS, @TOTAL_ESTIMATED_COST, @BILLING_NOTES, @PROJECT_NOTES, 
		@UPDATED_DATE, @UPDATED_BY, @BILLABLE
	IF @@ERROR <> 0 RETURN -1
	--GET THE CHARTER ROW THAT WAS LAST INSERTED
	--BUGUBG PROJECT NAME AND DESCRIPTION ARE BLANK
	SET @NEW_CHARTER_ID = @@identity
	IF @@ERROR <> 0 RETURN -1
	INSERT INTO PROJECTS (PROJECT_CODE, CHARTER_ID, [NAME], [DESCRIPTION], PROJECT_TYPE_ID, [GLOBAL], MILESTONE_STATUS_FLAG)
	SELECT  @PROJECT_CODE, @NEW_CHARTER_ID, '', '', @PROJECT_TYPE_ID, @PROJECT_GLOBAL, @MILESTONE_STATUS_FLAG

	-- ADD ALL REQUIRED GLOBAL PROJECT ROWS
	IF @PROJECT_GLOBAL = 1
	BEGIN
		SELECT @NEW_PROJECT_ID = PROJECT_ID FROM PROJECTS WHERE PROJECT_CODE = @PROJECT_CODE
	    EXEC DBO.ADD_GLOBAL_PROJECT_ROWS @NEW_PROJECT_ID
	END
	IF @@ERROR <> 0 RETURN -1
	RETURN 0
END
-- WE ARE  ALLOWING CHARTER'S TO BE UPDATED NOW (10/25/2004)
ELSE
BEGIN
	IF (SELECT COUNT(1) FROM CHARTER WHERE CHARTER_ID = @CHARTER_ID) <> 1 RETURN -1
	--UPDATE A CHARTER
	UPDATE 	CHARTER
	SET		CLIENT_ID = @CLIENT_ID,
			BUSINESS_LINE_ID = @BUSINESS_LINE_ID,
			CHARTER_STATUS_ID = @CHARTER_STATUS_ID,
			SUB_PROJECT = @SUB_PROJECT,
			BILLING_CONTACT_ID = @BILLING_CONTACT_ID,
			SPONSOR_CONTACT_ID = @SPONSOR_CONTACT_ID,
			TELEPHONE_ID = @TELEPHONE_ID,
			COMPANY_WEBSITE = @COMPANY_WEBSITE, 
			INDUSTRY_ID = @INDUSTRY_ID,
			FIRST_BILLED_DATE = @FIRST_BILLED_DATE,
			LAST_BILLED_DATE = @LAST_BILLED_DATE,
			PO# = @PO#,
			PROJECT_MANAGER_ID = @PROJECT_MANAGER_ID,
			EXPECTED_START_DATE = @EXPECTED_START_DATE,
			ESTIMATED_COMPLETION_DATE = @ESTIMATED_COMPLETION_DATE,
			ESTIMATED_DURATION = @ESTIMATED_DURATION,
			ESTIMATED_BUDGET = @ESTIMATED_BUDGET,
			TECHNOLOGY_ID = @TECHNOLOGY_ID,
			ACCOUNT_MANAGER_ID = @ACCOUNT_MANAGER_ID,
			PROJECT_TYPE_ID = @PROJECT_TYPE_ID,
			BILLING_TERMS_ID = @BILLING_TERMS_ID,
			PAYMENT_TERMS_ID = @PAYMENT_TERMS_ID, 
			AUTHORIZATION_ID = @AUTHORIZATION_ID,
			[DESC] = @DESC,
			TOTAL_ESTIMATED_HOURS = @TOTAL_ESTIMATED_HOURS, 
			TOTAL_ESTIMATED_COST = @TOTAL_ESTIMATED_COST,
			BILLING_NOTES = @BILLING_NOTES,
			PROJECT_NOTES = @PROJECT_NOTES, 
			UPDATED_DATE = @UPDATED_DATE,
			UPDATED_BY = @UPDATED_BY,
			BILLABLE = @BILLABLE
	WHERE	CHARTER_ID = @CHARTER_ID
	IF @@ERROR <> 0 RETURN -1
	--UPDATE PROJECTS
	UPDATE	PROJECTS
	SET	 PROJECT_CODE = @PROJECT_CODE, CHARTER_ID=@CHARTER_ID, PROJECT_TYPE_ID = @PROJECT_TYPE_ID, [GLOBAL]=@PROJECT_GLOBAL, MILESTONE_STATUS_FLAG = @MILESTONE_STATUS_FLAG
	WHERE 	CHARTER_ID = @CHARTER_ID
	IF @@ERROR <> 0 RETURN -1
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[RECENT_PROJECTS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RECENT_PROJECTS]
	@USERID INT
AS


IF (SELECT ISNULL(PRELOAD_PROJECTS, 1) FROM USERS WHERE USER_ID = @USERID) <> 0
BEGIN
	SELECT	TOP 5 MAX(TIME.BILL_DATE) AS BD, TIME.PROJECT_ID, TIME.USER_ID, PROJECTS.PROJECT_CODE, CHARTER.CHARTER_STATUS_ID, PROJECTS.[GLOBAL]
	FROM    TIME 
			JOIN PROJECTS ON TIME.PROJECT_ID = PROJECTS.PROJECT_ID 
			JOIN CHARTER ON PROJECTS.CHARTER_ID = CHARTER.CHARTER_ID
	GROUP BY TIME.PROJECT_ID, TIME.USER_ID, PROJECTS.PROJECT_CODE, CHARTER.CHARTER_STATUS_ID, PROJECTS.[GLOBAL]
	HAVING	(TIME.USER_ID = @USERID) 
			AND (CHARTER.CHARTER_STATUS_ID = 1 OR PROJECTS.[GLOBAL] = 1)
	ORDER BY BD DESC
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_TIME]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UPDATE_TIME]
--DROP PROC DBO.UPDATE_TIME
(
	@USER_ID INT,
	@PROJECT_ID INT,
	@TASK_ID INT,
	@PHASE_ID INT,
	@DESCRIPTION varchar(500),
	@BILL_DATE datetime,
	@BILLABLE INT,
	@HOURS DECIMAL (12,4), 
	@REPLACE_FLAG INT
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	GET_PMT_BY_USER
AUTHOR  	JOHN HERMAN    
PURPOSE  	EITHER INSERTS OR UPDATES A TIME RECORD
COMMENTS 	IF RECORD EXISTS THEN AN UPDATE WILL BE PERFORMED, OTHERWISE
			IT WILL BE INSERTED. THE ONLY FIELDS THAT CAN BE UPDATED ARE	
			HOURS AND DESCRIPTION.
MOD LOG  	09/21/2004	HERMAN	USE REPLACE FLAG TO REPLACE A TIME, OTHERWISE UPDATE IT
                11/05/2004      SNIDER  When the hours are 0 and the replace flag is set; delete any existing record, and leave.

		08/30/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
DECLARE @RATE DECIMAL(12,2)
SET @RATE = (
	SELECT 	R.RATE 
	FROM 	PROJECT_USER_RATES PUR
			JOIN RATES R ON PUR.RATE_ID = R.RATE_ID
	WHERE 	PUR.USER_ID = @USER_ID 
			AND PUR.PROJECT_ID = @PROJECT_ID 
			AND PUR.ACTIVE_FLAG = 1)
SET @BILL_DATE = 
CAST
(
(STR(DATEPART(MONTH, @BILL_DATE)) + '/' + STR(DATEPART(DAY, @BILL_DATE)) + '/' + STR(DATEPART(YEAR, @BILL_DATE)))
AS DATETIME
)


--When the hours are 0 and the replace flag is set; delete any existing record, and leave.
IF ((@HOURS = 0) AND (@REPLACE_FLAG = 1))
	BEGIN
		DELETE FROM 	TIME 
		 WHERE USER_ID = @USER_ID
			AND PROJECT_ID = @PROJECT_ID
			AND TASK_ID = @TASK_ID
			AND PHASE_ID = @PHASE_ID
			AND BILL_DATE = @BILL_DATE
			AND BILLABLE = @BILLABLE
	END
ELSE
	BEGIN
		IF (
			SELECT 	COUNT(1) 
			FROM 	TIME 
			WHERE 	USER_ID = @USER_ID
					AND PROJECT_ID = @PROJECT_ID
					AND TASK_ID = @TASK_ID
					AND PHASE_ID = @PHASE_ID
					AND BILL_DATE = @BILL_DATE
					AND BILLABLE = @BILLABLE
			) = 0
		BEGIN
			--INSERT
			INSERT INTO TIME (USER_ID, PROJECT_ID, TASK_ID, PHASE_ID, DESCRIPTION, BILLABLE, HOURS, BILL_DATE, RATE)
			VALUES (@USER_ID, @PROJECT_ID, @TASK_ID, @PHASE_ID, @DESCRIPTION, @BILLABLE, @HOURS, @BILL_DATE, @RATE)
		END
		ELSE
		BEGIN
			--UPDATE
			UPDATE 	TIME 
			SET		HOURS = CASE @REPLACE_FLAG
								WHEN 1 THEN @HOURS 
								ELSE HOURS + @HOURS
							END, 
					DESCRIPTION = @DESCRIPTION
			WHERE 	USER_ID = @USER_ID
					AND PROJECT_ID = @PROJECT_ID
					AND TASK_ID = @TASK_ID
					AND PHASE_ID = @PHASE_ID
					AND BILL_DATE = @BILL_DATE
					AND BILLABLE = @BILLABLE
		END
	END
GO
/****** Object:  StoredProcedure [dbo].[SAVE_USER_DATA]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[SAVE_USER_DATA]
--
(
	@USER_ID INT = NULL, 
	@FIRST VARCHAR(50), 
	@MIDDLE VARCHAR(1), 
	@LAST VARCHAR(50), 
	@USER_TYPE_ID INT,
	@EMPLOYEE_TYPE_ID INT,
	@USERNAME VARCHAR(50), 
	@PASSWORD VARCHAR(10),
	@STATUS INT = 1,
	@START_DATE DATETIME = NULL,
	@TERMINATION_DATE DATETIME = NULL,
	@TITLE_ID INT = 0,
	@PTO_Group_ID INT = NULL,
	@Email nvarchar(max)
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	DBO.SAVE_USER_DATA
AUTHOR  	JOHN HERMAN    
PURPOSE  	SAVES OR UPDATES USER INFORMATION
RETURN		0 	SUCCESS
			-1	ERROR
COMMENTS 	
MOD LOG  	
		09/30/2005	HOLUB   -Added PTO_Group_ID parameter to set PTO Group ID
		11/24/2004	Binzley -Added check to password field so could update user
					data without updating password.  This allows admin to change
					user data without knowing password or resseting.
		11/22/2004	Binzley	-Added Status, start/term dates and title as saved field
		11/03/2004	REILLY	UPDATED WITH "EMPLOYEE_TYPE_ID"
		09/01/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
DECLARE @NEWUID INT
IF @USER_ID IS NULL 
BEGIN
	--NEW USER
	
	INSERT INTO 
	USERS (	FIRST, 
		MIDDLE, 
		LAST, 
		USER_TYPE_ID, 
		EMPLOYEE_TYPE_ID, 
		USERNAME, 
		PASSWORD, 
		STATUS,
		START_DATE,
		TERMINATION_DATE,
		TITLE_ID,
		PTO_Group_ID,
		Email )
	VALUES 	(@FIRST, 
		@MIDDLE, 
		@LAST, 
		@USER_TYPE_ID, 
		@EMPLOYEE_TYPE_ID, 
		@USERNAME, 
		@PASSWORD, 
		@STATUS,
		@START_DATE,
		@TERMINATION_DATE,
		@TITLE_ID,
		@PTO_Group_ID,
		@Email)
	
	IF @@ERROR <> 0 RETURN -1

	SELECT @NEWUID = USER_ID FROM USERS WHERE USERNAME = @USERNAME
	IF @@ERROR <> 0 RETURN -1

	EXEC ADD_NEW_USER_GLOBAL_PROJECTS @NEWUID

	--NOW INSERT A ROW INTO THE PROJECT_USERS TABLE FOR EACH GLOBAL PROJECT
	INSERT INTO PROJECT_USERS (PROJECT_ID, USER_ID) SELECT PROJECT_ID, @USER_ID FROM PROJECTS WHERE GLOBAL = 1
	IF @@ERROR <> 0 RETURN -1
	RETURN 0
END
ELSE
BEGIN
	IF (SELECT COUNT(1) FROM USERS WHERE USER_ID = @USER_ID) <> 1 
		RETURN -1
	
	--UPDATE A USER
	--If Password blank update everything else
	IF LEN(@PASSWORD) > 0
	BEGIN
		UPDATE 	USERS
		SET	FIRST = @FIRST, 
			LAST = @LAST, 
			MIDDLE = @MIDDLE, 
			USER_TYPE_ID = @USER_TYPE_ID, 
			EMPLOYEE_TYPE_ID = @EMPLOYEE_TYPE_ID,
			USERNAME = @USERNAME, 
			PASSWORD = @PASSWORD,
			STATUS = @STATUS,
			START_DATE = @START_DATE,
			TERMINATION_DATE = @TERMINATION_DATE,
			TITLE_ID = @TITLE_ID,
			PTO_Group_ID = @PTO_Group_ID,
			Email=@Email 
		WHERE	USER_ID = @USER_ID
	END
	ELSE
	BEGIN
		UPDATE 	USERS
		SET	FIRST = @FIRST, 
			LAST = @LAST, 
			MIDDLE = @MIDDLE, 
			USER_TYPE_ID = @USER_TYPE_ID, 
			EMPLOYEE_TYPE_ID = @EMPLOYEE_TYPE_ID,
			USERNAME = @USERNAME, 
			STATUS = @STATUS,
			START_DATE = @START_DATE,
			TERMINATION_DATE = @TERMINATION_DATE,
			TITLE_ID = @TITLE_ID,
			PTO_Group_ID = @PTO_Group_ID,
			Email = @Email 
		WHERE	USER_ID = @USER_ID
	END
	IF @@ERROR <> 0 RETURN -1
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[PTO_Exceptions]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PTO_Exceptions] as 
SELECT     distinct USERS.USERNAME, SUM([TIME].HOURS) AS PTOHoursReported, SUM(PTO_REQUESTS.Hours) AS RequestedPTOHours,
(SUM([TIME].HOURS)-SUM(PTO_REQUESTS.Hours)) as Variance
FROM         [TIME] inner JOIN
                      USERS ON [TIME].USER_ID = USERS.USER_ID LEFT JOIN
                      PTO_REQUESTS ON [TIME].USER_ID = PTO_REQUESTS.USER_ID
WHERE     ([TIME].PROJECT_ID = 10931)
GROUP BY USERS.USERNAME
HAVING      (SUM(PTO_REQUESTS.Hours) is NULL) OR
( SUM([TIME].HOURS) < SUM(PTO_REQUESTS.Hours) )
order by variance
GO
/****** Object:  StoredProcedure [dbo].[PTO_PROCESS_SINGLE]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[PTO_PROCESS_SINGLE] 
@Process_Date datetime,
@UserID int
as

declare @GROUP_ID int
declare @Hours int

--group 1 no tenure
set @GROUP_ID = 1

select @hours =(cast( (CAST(pto_rate * 8  as numeric(10, 2) )  / 24) as numeric(10, 2) ) )   from PTO_GROUP_TYPES where PTO_GROUP_ID = @GROUP_ID

insert into pto (USER_ID, Date_Earned, Date_Used, Hours, hours_Used)
select DISTINCT USER_ID, @Process_Date, null, @Hours, 0 FROM TIME
where user_id in (
SELECT     USER_ID
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)<3 AND User_ID=@USERID  AND @Process_Date>=START_DATE)

-- get count
SELECT     count(USER_ID) as Group1
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)<3 AND User_ID=@USERID  AND @Process_Date>=START_DATE

--group 1 tenure
set @GROUP_ID = 1
select @hours =(cast( (CAST(pto_rate * 8  as numeric(10, 2) )  / 24) as numeric(10, 2) ) )   from PTO_GROUP_TYPES where PTO_GROUP_ID = @GROUP_ID

insert into pto (USER_ID, Date_Earned, Date_Used, Hours, hours_Used)
select DISTINCT USER_ID, @Process_Date, null, @Hours, 0 FROM TIME
where user_id in (
SELECT     USER_ID
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)>=3 AND User_ID=@USERID  AND @Process_Date>=START_DATE)

-- get count
SELECT     count(USER_ID) as Group1_Tenure
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND (DATEDIFF(yyyy, Start_Date, @Process_Date))>=3 AND User_ID=@USERID  AND @Process_Date>=START_DATE

--group 2 no tenure
set @GROUP_ID = 2
select @hours =(cast( (CAST(pto_rate * 8  as numeric(10, 2) )  / 24) as numeric(10, 2) ) )   from PTO_GROUP_TYPES where PTO_GROUP_ID = @GROUP_ID

insert into pto (USER_ID, Date_Earned, Date_Used, Hours, hours_Used)
select DISTINCT USER_ID, @Process_Date, null, @Hours, 0 FROM TIME
where user_id in (
SELECT     USER_ID
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)<3  AND User_ID=@USERID  AND @Process_Date>=START_DATE)
-- get count
SELECT     count(USER_ID) as Group2
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)<3  AND User_ID=@USERID  AND @Process_Date>=START_DATE

--group 2 tenure
set @GROUP_ID = 2
select @hours =(cast( (CAST(pto_rate * 8  as numeric(10, 2) )  / 24) as numeric(10, 2) ) )   from PTO_GROUP_TYPES where PTO_GROUP_ID = @GROUP_ID

insert into pto (USER_ID, Date_Earned, Date_Used, Hours, hours_Used)
select DISTINCT USER_ID, @Process_Date, null, @Hours, 0 FROM TIME
where user_id in (
SELECT     USER_ID
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)>=3 AND User_ID=@USERID  AND @Process_Date >= START_DATE) 
-- get count
SELECT     count(USER_ID) as Group2_Tenure
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND (DATEDIFF(yyyy, Start_Date, @Process_Date)>=3 AND User_ID=@USERID  AND @Process_Date >= START_DATE)
--group 3 no tenure
set @GROUP_ID = 3
select @hours =(cast( (CAST(pto_rate * 8  as numeric(10, 2) )  / 24) as numeric(10, 2) ) )   from PTO_GROUP_TYPES where PTO_GROUP_ID = @GROUP_ID

insert into pto (USER_ID, Date_Earned, Date_Used, Hours, hours_Used)
select DISTINCT USER_ID, @Process_Date, null, @Hours, 0 FROM TIME
where user_id in (
SELECT     USER_ID
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)<3 AND User_ID=@USERID  AND @Process_Date >= START_DATE)
-- get count
SELECT     count(USER_ID) as Group3
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)<3 AND User_ID=@USERID  AND @Process_Date >= START_DATE

--group 3 tenure
set @GROUP_ID = 3
select @hours =(cast( (CAST(pto_rate * 8  as numeric(10, 2) )  / 24) as numeric(10, 2) ) )   from PTO_GROUP_TYPES where PTO_GROUP_ID = @GROUP_ID

insert into pto (USER_ID, Date_Earned, Date_Used, Hours, hours_Used)
select DISTINCT USER_ID, @Process_Date, null, @Hours, 0 FROM TIME
where user_id in (
SELECT     USER_ID
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)>=3 AND User_ID=@USERID  AND @Process_Date >=START_DATE)
-- get count
SELECT     count(USER_ID) as Group3_Tenure
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND (DATEDIFF(yyyy, Start_Date, @Process_Date)>=3 AND User_ID=@USERID  AND @Process_Date >=START_DATE)
GO
/****** Object:  StoredProcedure [dbo].[PTO_PROCESS]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
Create Proc [dbo].[PTO_PROCESS]
@Process_Date datetime
as

declare @GROUP_ID int
declare @Hours int

--group 1 no tenure
set @GROUP_ID = 1

select @hours = (pto_rate * 8 / 24)   from PTO_GROUP_TYPES where PTO_GROUP_ID = @GROUP_ID

insert into pto (USER_ID, Date_Earned, Date_Used, Hours, hours_Used)
select DISTINCT USER_ID, @Process_Date, null, @Hours, 0 FROM TIME
where user_id in (
SELECT     USER_ID
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)<3)

-- get count
SELECT     count(USER_ID) as Group1
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)<3

--group 1 tenure
set @GROUP_ID = 1
select @hours = (pto_tenure_rate * 8 / 24)   from PTO_GROUP_TYPES where PTO_GROUP_ID = @GROUP_ID

insert into pto (USER_ID, Date_Earned, Date_Used, Hours, hours_Used)
select DISTINCT USER_ID, @Process_Date, null, @Hours, 0 FROM TIME
where user_id in (
SELECT     USER_ID
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)>=3)

-- get count
SELECT     count(USER_ID) as Group1_Tenure
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND (DATEDIFF(yyyy, Start_Date, @Process_Date))>=3

--group 2 no tenure
set @GROUP_ID = 2
select @hours = (pto_rate * 8 / 24)   from PTO_GROUP_TYPES where PTO_GROUP_ID = @GROUP_ID

insert into pto (USER_ID, Date_Earned, Date_Used, Hours, hours_Used)
select DISTINCT USER_ID, @Process_Date, null, @Hours, 0 FROM TIME
where user_id in (
SELECT     USER_ID
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)<3)
-- get count
SELECT     count(USER_ID) as Group2
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)<3

--group 2 tenure
set @GROUP_ID = 2
select @hours = (pto_tenure_rate * 8 / 24)   from PTO_GROUP_TYPES where PTO_GROUP_ID = @GROUP_ID

insert into pto (USER_ID, Date_Earned, Date_Used, Hours, hours_Used)
select DISTINCT USER_ID, @Process_Date, null, @Hours, 0 FROM TIME
where user_id in (
SELECT     USER_ID
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)>=3)
-- get count
SELECT     count(USER_ID) as Group2_Tenure
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND (DATEDIFF(yyyy, Start_Date, @Process_Date))>=3

--group 3 no tenure
set @GROUP_ID = 3
select @hours = (pto_rate * 8 / 24)   from PTO_GROUP_TYPES where PTO_GROUP_ID = @GROUP_ID

insert into pto (USER_ID, Date_Earned, Date_Used, Hours, hours_Used)
select DISTINCT USER_ID, @Process_Date, null, @Hours, 0 FROM TIME
where user_id in (
SELECT     USER_ID
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)<3)
-- get count
SELECT     count(USER_ID) as Group3
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)<3

--group 3 tenure
set @GROUP_ID = 3
select @hours = (pto_tenure_rate * 8 / 24)   from PTO_GROUP_TYPES where PTO_GROUP_ID = @GROUP_ID

insert into pto (USER_ID, Date_Earned, Date_Used, Hours, hours_Used)
select DISTINCT USER_ID, @Process_Date, null, @Hours, 0 FROM TIME
where user_id in (
SELECT     USER_ID
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND DATEDIFF(yyyy, Start_Date, @Process_Date)>=3)
-- get count
SELECT     count(USER_ID) as Group3_Tenure
FROM         users
WHERE     ((TERMINATION_DATE = CONVERT(datetime, '1900-01-01 00:00:00', 102) OR
                      TERMINATION_DATE IS NULL)) AND (EMPLOYEE_TYPE_ID = 1) AND (STATUS = 1) AND (PTO_GROUP_ID = @GROUP_ID)
		      AND (DATEDIFF(yyyy, Start_Date, @Process_Date))>=3
GO
/****** Object:  StoredProcedure [dbo].[GET_TIME]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_TIME]
--DROP PROC DBO.GET_TIME
(
	@USER_ID INT = NULL,
	@START_DATE DATETIME, 
	@STOP_DATE DATETIME
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	GET_TIME
AUTHOR  	JOHN HERMAN    
PURPOSE  	RETURNS TIME RECORDS
COMMENTS 	IF USER_ID IS NULL THEN RETURN TIME FOR ALL USERS
			SAME WITH PROJECT_ID, PHASE_ID, AND TASK_ID
MOD LOG  	08/30/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
SELECT	*
FROM	TIME
WHERE	USER_ID = @USER_ID
		AND BILL_DATE BETWEEN @START_DATE AND @STOP_DATE
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserTime]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andrew Holub>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUserTime]
	@UserId int,
	@ProjectId int,
	@TaskId int,
	@PhaseId int,
	@Billable bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TIME 
	WHERE 
		USER_ID=@UserId and
		PROJECT_ID = @ProjectId and
		TASK_ID = @TaskId and
		PHASE_ID = @PhaseId and 
		BILLABLE= @Billable
	
END
GO
/****** Object:  StoredProcedure [dbo].[ADD_PTO_REQUEST]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create proc [dbo].[ADD_PTO_REQUEST]
@USER_ID int,
@StartDate datetime,
@EndDate datetime,
@Notes varchar(1000),
@Hours int
as

insert into PTO_REQUESTS (USER_ID, Request_Date,
	Start_Date, End_Date, 
	Hours, Notes)
select DISTINCT @USER_ID, GetDate(), @StartDate, @EndDate, @Hours, @Notes

Declare @NewID int
select @NewID = MAX([ID]) FROM PTO_REQUESTS WHERE USER_ID = @USER_ID

insert into PTO_REQUEST_RESPONSE (USER_ID, MANAGER_ID, STATUS, PTO_REQUEST_ID)
SELECT DISTINCT @USER_ID, CHARTER.PROJECT_MANAGER_ID, 0, @NewID
FROM CHARTER WHERE  CHARTER.PROJECT_MANAGER_ID  IN (
SELECT DISTINCT CHARTER.PROJECT_MANAGER_ID AS ManagerID
FROM         PROJECTS INNER JOIN
                      PROJECT_USERS ON PROJECTS.PROJECT_ID = PROJECT_USERS.PROJECT_ID INNER JOIN
                      CHARTER ON PROJECTS.CHARTER_ID = CHARTER.CHARTER_ID INNER JOIN
                      CLIENTS ON CHARTER.CLIENT_ID = CLIENTS.CLIENT_ID INNER JOIN
                      [TIME] ON PROJECT_USERS.PROJECT_ID = [TIME].PROJECT_ID AND PROJECT_USERS.USER_ID = [TIME].USER_ID
WHERE     (PROJECT_USERS.USER_ID = @USER_ID)
GROUP BY CHARTER.PROJECT_MANAGER_ID
) or CHARTER.PROJECT_MANAGER_ID = 5073 --ron laneve
GO
/****** Object:  StoredProcedure [dbo].[ADD_PROJECT_USER]    Script Date: 01/26/2011 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADD_PROJECT_USER]
--DROP PROC DBO.ADD_PROJECT_USER
(
	@PROJECT_ID INT, 
	@USER_ID INT, 
	@RATE_ID INT, 
	@RATE_DESCRIPTION VARCHAR(1000),
	@TASK_ID INT
)
AS
/*************************************************************************************
**************************************************************************************
PROC NAME 	ADD_PROJECT_USER
AUTHOR  	JOHN HERMAN    
PURPOSE  	CREATES A RECORD IN THE PROJECT USERS TABLE
COMMENTS 	
MOD LOG  	09/15/2004 	HERMAN 	CREATED    
**************************************************************************************
*************************************************************************************/
-- DECLARE @PROJECT_ID INT, @USER_ID INT
-- SELECT	@PROJECT_ID = 3, @USER_ID = 1
BEGIN TRAN T1
IF (SELECT COUNT (1) FROM PROJECT_USERS WHERE PROJECT_ID = @PROJECT_ID AND USER_ID = @USER_ID) = 0
INSERT INTO PROJECT_USERS (PROJECT_ID, USER_ID) SELECT @PROJECT_ID, @USER_ID
IF @@ERROR <> 0 GOTO ERR
EXEC DBO.ADD_PROJECT_USER_RATE @PROJECT_ID, @USER_ID, @RATE_ID, @RATE_DESCRIPTION, @TASK_ID
IF @@ERROR <> 0 GOTO ERR
COMMIT TRAN T1
RETURN 0
ERR:
ROLLBACK TRAN T1
RETURN -1
GO
/****** Object:  Default [DF_CONTACTS_ACTIVE_FLAG]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[CONTACTS] ADD  CONSTRAINT [DF_CONTACTS_ACTIVE_FLAG]  DEFAULT ((1)) FOR [ACTIVE_FLAG]
GO
/****** Object:  Default [DF_PAYMENT_TERMS_ActiveFlag]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PAYMENT_TERMS] ADD  CONSTRAINT [DF_PAYMENT_TERMS_ActiveFlag]  DEFAULT ((1)) FOR [ActiveFlag]
GO
/****** Object:  Default [DF_PHASES_ActiveFlag]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PHASES] ADD  CONSTRAINT [DF_PHASES_ActiveFlag]  DEFAULT ((1)) FOR [ActiveFlag]
GO
/****** Object:  Default [DF_PROJECT_PHASES_ActiveFlag]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECT_PHASES] ADD  CONSTRAINT [DF_PROJECT_PHASES_ActiveFlag]  DEFAULT ((1)) FOR [ActiveFlag]
GO
/****** Object:  Default [DF_PROJECT_TASKS_ActiveFlag]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECT_TASKS] ADD  CONSTRAINT [DF_PROJECT_TASKS_ActiveFlag]  DEFAULT ((1)) FOR [ActiveFlag]
GO
/****** Object:  Default [DF__PROJECT_U__ACTIV__416EA7D8]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECT_USER_RATES] ADD  CONSTRAINT [DF__PROJECT_U__ACTIV__416EA7D8]  DEFAULT ((1)) FOR [ACTIVE_FLAG]
GO
/****** Object:  Default [DF_PROJECT_USERS_ActiveFlag]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECT_USERS] ADD  CONSTRAINT [DF_PROJECT_USERS_ActiveFlag]  DEFAULT ((1)) FOR [ActiveFlag]
GO
/****** Object:  Default [DF_PROJECTS_ActiveFlag]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECTS] ADD  CONSTRAINT [DF_PROJECTS_ActiveFlag]  DEFAULT ((1)) FOR [ActiveFlag]
GO
/****** Object:  Default [DF_TASKS_ActiveFlag]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[TASKS] ADD  CONSTRAINT [DF_TASKS_ActiveFlag]  DEFAULT ((1)) FOR [ActiveFlag]
GO
/****** Object:  Default [DF_Term_TermID]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[Term] ADD  CONSTRAINT [DF_Term_TermID]  DEFAULT (newid()) FOR [TermID]
GO
/****** Object:  Default [DF_Term_ActiveFlag]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[Term] ADD  CONSTRAINT [DF_Term_ActiveFlag]  DEFAULT ((1)) FOR [ActiveFlag]
GO
/****** Object:  Default [DF_TermHeader_TermHeaderID]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[TermHeader] ADD  CONSTRAINT [DF_TermHeader_TermHeaderID]  DEFAULT (newid()) FOR [TermHeaderID]
GO
/****** Object:  Default [DF_TermHeader_ActiveFlag]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[TermHeader] ADD  CONSTRAINT [DF_TermHeader_ActiveFlag]  DEFAULT ((1)) FOR [ActiveFlag]
GO
/****** Object:  ForeignKey [FK_ADDRESS_USERS]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[ADDRESS]  WITH NOCHECK ADD  CONSTRAINT [FK_ADDRESS_USERS] FOREIGN KEY([UPDATED_BY])
REFERENCES [dbo].[USERS] ([USER_ID])
GO
ALTER TABLE [dbo].[ADDRESS] CHECK CONSTRAINT [FK_ADDRESS_USERS]
GO
/****** Object:  ForeignKey [FK_FORECAST_PROJECTS]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[FORECAST]  WITH NOCHECK ADD  CONSTRAINT [FK_FORECAST_PROJECTS] FOREIGN KEY([PROJECT_CODE])
REFERENCES [dbo].[PROJECTS] ([PROJECT_CODE])
GO
ALTER TABLE [dbo].[FORECAST] CHECK CONSTRAINT [FK_FORECAST_PROJECTS]
GO
/****** Object:  ForeignKey [FK_PROJECT_PHASES_PHASES]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECT_PHASES]  WITH NOCHECK ADD  CONSTRAINT [FK_PROJECT_PHASES_PHASES] FOREIGN KEY([PHASE_ID])
REFERENCES [dbo].[PHASES] ([PHASE_ID])
GO
ALTER TABLE [dbo].[PROJECT_PHASES] CHECK CONSTRAINT [FK_PROJECT_PHASES_PHASES]
GO
/****** Object:  ForeignKey [FK_PROJECT_PHASES_PROJECTS]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECT_PHASES]  WITH NOCHECK ADD  CONSTRAINT [FK_PROJECT_PHASES_PROJECTS] FOREIGN KEY([PROJECT_ID])
REFERENCES [dbo].[PROJECTS] ([PROJECT_ID])
GO
ALTER TABLE [dbo].[PROJECT_PHASES] CHECK CONSTRAINT [FK_PROJECT_PHASES_PROJECTS]
GO
/****** Object:  ForeignKey [FK_PROJECT_TASKS_PROJECTS]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECT_TASKS]  WITH NOCHECK ADD  CONSTRAINT [FK_PROJECT_TASKS_PROJECTS] FOREIGN KEY([PROJECT_ID])
REFERENCES [dbo].[PROJECTS] ([PROJECT_ID])
GO
ALTER TABLE [dbo].[PROJECT_TASKS] CHECK CONSTRAINT [FK_PROJECT_TASKS_PROJECTS]
GO
/****** Object:  ForeignKey [FK_PROJECT_TASKS_TASKS]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECT_TASKS]  WITH CHECK ADD  CONSTRAINT [FK_PROJECT_TASKS_TASKS] FOREIGN KEY([TASK_ID])
REFERENCES [dbo].[TASKS] ([TASK_ID])
GO
ALTER TABLE [dbo].[PROJECT_TASKS] CHECK CONSTRAINT [FK_PROJECT_TASKS_TASKS]
GO
/****** Object:  ForeignKey [FK_PROJECT_USER_RATES_PROJECTS]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECT_USER_RATES]  WITH CHECK ADD  CONSTRAINT [FK_PROJECT_USER_RATES_PROJECTS] FOREIGN KEY([PROJECT_ID])
REFERENCES [dbo].[PROJECTS] ([PROJECT_ID])
GO
ALTER TABLE [dbo].[PROJECT_USER_RATES] CHECK CONSTRAINT [FK_PROJECT_USER_RATES_PROJECTS]
GO
/****** Object:  ForeignKey [FK_PROJECT_USER_RATES_RATES]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECT_USER_RATES]  WITH CHECK ADD  CONSTRAINT [FK_PROJECT_USER_RATES_RATES] FOREIGN KEY([RATE_ID])
REFERENCES [dbo].[RATES] ([RATE_ID])
GO
ALTER TABLE [dbo].[PROJECT_USER_RATES] CHECK CONSTRAINT [FK_PROJECT_USER_RATES_RATES]
GO
/****** Object:  ForeignKey [FK_PROJECT_USER_RATES_USERS]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECT_USER_RATES]  WITH CHECK ADD  CONSTRAINT [FK_PROJECT_USER_RATES_USERS] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[USERS] ([USER_ID])
GO
ALTER TABLE [dbo].[PROJECT_USER_RATES] CHECK CONSTRAINT [FK_PROJECT_USER_RATES_USERS]
GO
/****** Object:  ForeignKey [FK_PROJECT_USERS_PROJECTS]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECT_USERS]  WITH NOCHECK ADD  CONSTRAINT [FK_PROJECT_USERS_PROJECTS] FOREIGN KEY([PROJECT_ID])
REFERENCES [dbo].[PROJECTS] ([PROJECT_ID])
GO
ALTER TABLE [dbo].[PROJECT_USERS] CHECK CONSTRAINT [FK_PROJECT_USERS_PROJECTS]
GO
/****** Object:  ForeignKey [FK_PROJECT_USERS_USERS1]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[PROJECT_USERS]  WITH CHECK ADD  CONSTRAINT [FK_PROJECT_USERS_USERS1] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[USERS] ([USER_ID])
GO
ALTER TABLE [dbo].[PROJECT_USERS] CHECK CONSTRAINT [FK_PROJECT_USERS_USERS1]
GO
/****** Object:  ForeignKey [FK_TIME_PROJECT_PHASES]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[TIME]  WITH CHECK ADD  CONSTRAINT [FK_TIME_PROJECT_PHASES] FOREIGN KEY([PROJECT_ID], [PHASE_ID])
REFERENCES [dbo].[PROJECT_PHASES] ([PROJECT_ID], [PHASE_ID])
GO
ALTER TABLE [dbo].[TIME] CHECK CONSTRAINT [FK_TIME_PROJECT_PHASES]
GO
/****** Object:  ForeignKey [FK_TIME_PROJECT_TASKS]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[TIME]  WITH CHECK ADD  CONSTRAINT [FK_TIME_PROJECT_TASKS] FOREIGN KEY([PROJECT_ID], [TASK_ID])
REFERENCES [dbo].[PROJECT_TASKS] ([PROJECT_ID], [TASK_ID])
GO
ALTER TABLE [dbo].[TIME] CHECK CONSTRAINT [FK_TIME_PROJECT_TASKS]
GO
/****** Object:  ForeignKey [FK_TIME_PROJECT_USERS]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[TIME]  WITH CHECK ADD  CONSTRAINT [FK_TIME_PROJECT_USERS] FOREIGN KEY([PROJECT_ID], [USER_ID])
REFERENCES [dbo].[PROJECT_USERS] ([PROJECT_ID], [USER_ID])
GO
ALTER TABLE [dbo].[TIME] CHECK CONSTRAINT [FK_TIME_PROJECT_USERS]
GO
/****** Object:  ForeignKey [FK_USERS_USER_TYPE]    Script Date: 01/26/2011 11:43:37 ******/
ALTER TABLE [dbo].[USERS]  WITH NOCHECK ADD  CONSTRAINT [FK_USERS_USER_TYPE] FOREIGN KEY([USER_TYPE_ID])
REFERENCES [dbo].[USER_TYPES] ([USER_TYPE_ID])
GO
ALTER TABLE [dbo].[USERS] CHECK CONSTRAINT [FK_USERS_USER_TYPE]
GO
