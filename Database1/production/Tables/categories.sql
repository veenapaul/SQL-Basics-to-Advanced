CREATE TABLE [production].[categories] (
    [category_id]   INT           IDENTITY (1, 1) NOT NULL,
    [category_name] VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([category_id] ASC)
);

