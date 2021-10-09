CREATE TABLE [dbo].[Employees] (
    [EmpCode]           VARCHAR (8)  NOT NULL,
    [Name]              VARCHAR (50) NOT NULL,
    [Designation]       VARCHAR (50) NOT NULL,
    [QualificationCode] TINYINT      NULL,
    [Deleted]           BIT          DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([EmpCode] ASC),
    CONSTRAINT [FK_EMPLOYEES_Lib_Qualification] FOREIGN KEY ([QualificationCode]) REFERENCES [dbo].[Lib_Qualification] ([QualificationCode])
);

