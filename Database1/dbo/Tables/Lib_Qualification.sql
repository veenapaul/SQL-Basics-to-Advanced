CREATE TABLE [dbo].[Lib_Qualification] (
    [QualificationCode] TINYINT      NOT NULL,
    [Qualification]     VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([QualificationCode] ASC),
    CONSTRAINT [FK_Lib_Qualification_Lib_Qualification] FOREIGN KEY ([QualificationCode]) REFERENCES [dbo].[Lib_Qualification] ([QualificationCode])
);

