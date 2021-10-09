CREATE TABLE [hr].[details] (
    [id]        INT            IDENTITY (1, 1) NOT NULL,
    [fullname]  NVARCHAR (100) NULL,
    [last_name] VARCHAR (50)   NOT NULL,
    [joined_at] DATETIME       NULL,
    [phone]     VARCHAR (20)   NULL,
    [dept]      INT            NOT NULL,
    CONSTRAINT [PK__details__3213E83F731FD5CA] PRIMARY KEY CLUSTERED ([id] ASC)
);

