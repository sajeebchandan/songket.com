using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OOSDDemo
{
    public class Documentation
    {
        /*
         Site.master==Main Master Site 
         SiteAuth.master==For Registration and login
         Profile.Master==For Profile, Users, Edit Profile
         */










        /*DATABASE TABLE DEFINATION SCRIPTS
         CREATE TABLE [dbo].[Users] (
   [ID]               INT             IDENTITY (1, 1) NOT NULL,
   [name]             VARCHAR (50)    NOT NULL,
   [username]         VARCHAR (50)    NOT NULL,
   [email]            VARCHAR (50)    NOT NULL,
   [gender]           VARCHAR (6)     NOT NULL,
   [country]          VARCHAR (50)    NOT NULL,
   [dob]              VARCHAR (50)    NOT NULL,
   [pass]             VARCHAR (MAX)   NOT NULL,
   [photo]            VARBINARY (MAX) NOT NULL,
   [securityquestion] VARCHAR (100)   NOT NULL,
   [securityanswer]   VARCHAR (MAX)   NOT NULL,
   CONSTRAINT [PK_Register] PRIMARY KEY CLUSTERED ([username] ASC),
   CONSTRAINT [UNQ_name] UNIQUE NONCLUSTERED ([name] ASC)
);

CREATE TABLE [dbo].[QuestionTable] (
    [Q_ID]     INT           IDENTITY (1, 1) NOT NULL,
    [Username] VARCHAR (50)  NOT NULL,
    [Name]     VARCHAR (50)  NOT NULL,
    [question] VARCHAR (MAX) NOT NULL,
    [q_date]   DATE          NOT NULL,
    PRIMARY KEY CLUSTERED ([Q_ID] ASC),
    FOREIGN KEY ([Username]) REFERENCES [dbo].[Users] ([username]),
    FOREIGN KEY ([Name]) REFERENCES [dbo].[Users] ([name]) ON UPDATE CASCADE
);

CREATE TABLE [dbo].[AnswerTable] (
    [A_ID]     INT           IDENTITY (1, 1) NOT NULL,
    [Username] VARCHAR (50)  NOT NULL,
    [Name]     VARCHAR (50)  NOT NULL,
    [answer]   VARCHAR (MAX) NOT NULL,
    [a_date]   DATE          NOT NULL,
    [Q_Id]     INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([A_ID] ASC),
    FOREIGN KEY ([Q_Id]) REFERENCES [dbo].[QuestionTable] ([Q_ID]),
    FOREIGN KEY ([Username]) REFERENCES [dbo].[Users] ([username]),
    FOREIGN KEY ([Name]) REFERENCES [dbo].[Users] ([name]) ON UPDATE CASCADE
);


        CREATE TABLE [dbo].[BlogTable] (
    [B_ID]       INT             IDENTITY (1, 1) NOT NULL,
    [Username]   VARCHAR (50)    NULL,
    [Name]       NVARCHAR (50)   NULL,
    [B_Category] NVARCHAR (200)  NULL,
    [B_Title]    NVARCHAR (MAX)  NULL,
    [B_Post]     NVARCHAR (MAX)  NULL,
    [B_Image]    VARBINARY (MAX) NULL,
    [B_File]     NVARCHAR (200)  NULL,
    [B_FileName] NVARCHAR (500)  NULL,
    [B_Date]     NVARCHAR (50)   NULL,
    PRIMARY KEY CLUSTERED ([B_ID] ASC),
    FOREIGN KEY ([Username]) REFERENCES [dbo].[Users] ([username]) ON UPDATE CASCADE,
    FOREIGN KEY ([Name]) REFERENCES [dbo].[Users] ([name])
);

CREATE TABLE [dbo].[BlogComment] (
    [C_ID]     INT            IDENTITY (1, 1) NOT NULL,
    [Username] VARCHAR (50)   NULL,
    [Name]     NVARCHAR (50)  NULL,
    [comment]  NVARCHAR (MAX) NULL,
    [c_date]   NVARCHAR (50)  NULL,
    [B_Id]     INT            NULL,
    PRIMARY KEY CLUSTERED ([C_ID] ASC),
    FOREIGN KEY ([B_Id]) REFERENCES [dbo].[BlogTable] ([B_ID]),
    FOREIGN KEY ([Username]) REFERENCES [dbo].[Users] ([username]) ON UPDATE CASCADE,
    FOREIGN KEY ([Name]) REFERENCES [dbo].[Users] ([name]) ON UPDATE CASCADE
);

CREATE TABLE [dbo].[BlogCommentReply] (
    [R_ID]     INT            IDENTITY (1, 1) NOT NULL,
    [Username] VARCHAR (50)   NULL,
    [Name]     NVARCHAR (50)  NULL,
    [reply]    NVARCHAR (MAX) NULL,
    [r_date]   NVARCHAR (50)  NULL,
    [C_Id]     INT            NULL,
    PRIMARY KEY CLUSTERED ([R_ID] ASC),
    FOREIGN KEY ([C_Id]) REFERENCES [dbo].[BlogComment] ([C_ID]),
    FOREIGN KEY ([Username]) REFERENCES [dbo].[Users] ([username]) ON UPDATE CASCADE,
    FOREIGN KEY ([Name]) REFERENCES [dbo].[Users] ([name]) ON UPDATE CASCADE
);




         */
    }
}