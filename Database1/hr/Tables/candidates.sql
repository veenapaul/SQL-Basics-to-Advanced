CREATE TABLE [hr].[candidates] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [fullname]   VARCHAR (100) NOT NULL,
    [first_name] VARCHAR (50)  NULL,
    [last_name]  VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

