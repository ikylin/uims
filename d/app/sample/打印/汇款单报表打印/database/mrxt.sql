IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'mrxt')
	DROP DATABASE [mrxt]
GO

CREATE DATABASE [mrxt]  ON (NAME = N'mrxt_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\Data\mrxt_Data.MDF' , SIZE = 7, FILEGROWTH = 10%) LOG ON (NAME = N'mrxt_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\Data\mrxt_Log.LDF' , SIZE = 1, FILEGROWTH = 10%)
 COLLATE Chinese_PRC_CI_AS
GO

exec sp_dboption N'mrxt', N'autoclose', N'false'
GO

exec sp_dboption N'mrxt', N'bulkcopy', N'false'
GO

exec sp_dboption N'mrxt', N'trunc. log', N'true'
GO

exec sp_dboption N'mrxt', N'torn page detection', N'true'
GO

exec sp_dboption N'mrxt', N'read only', N'false'
GO

exec sp_dboption N'mrxt', N'dbo use', N'false'
GO

exec sp_dboption N'mrxt', N'single', N'false'
GO

exec sp_dboption N'mrxt', N'autoshrink', N'true'
GO

exec sp_dboption N'mrxt', N'ANSI null default', N'false'
GO

exec sp_dboption N'mrxt', N'recursive triggers', N'false'
GO

exec sp_dboption N'mrxt', N'ANSI nulls', N'false'
GO

exec sp_dboption N'mrxt', N'concat null yields null', N'false'
GO

exec sp_dboption N'mrxt', N'cursor close on commit', N'false'
GO

exec sp_dboption N'mrxt', N'default to local cursor', N'false'
GO

exec sp_dboption N'mrxt', N'quoted identifier', N'false'
GO

exec sp_dboption N'mrxt', N'ANSI warnings', N'false'
GO

exec sp_dboption N'mrxt', N'auto create statistics', N'true'
GO

exec sp_dboption N'mrxt', N'auto update statistics', N'true'
GO

use [mrxt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_sj_cps]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[sj] DROP CONSTRAINT FK_sj_cps
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_zd_sf]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[zd] DROP CONSTRAINT FK_zd_sf
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[a2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[a2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[selecttable]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[selecttable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TABLE1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TABLE1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bj1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bj1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[cj]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[cj]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[cp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[cp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[cps]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[cps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[hkd]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[hkd]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[hw]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[hw]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[hwmc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[hwmc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[image]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[image]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[jisuan]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[jisuan]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[jlz]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[jlz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[js]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[js]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[js1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[js1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rq]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rq]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rs]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rs]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ry]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ry]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ryxt]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ryxt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sf]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sj]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sj]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sjbh]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sjbh]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sjgl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sjgl]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[songkun]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[songkun]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sxsz]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sxsz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[txm]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[txm]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ww]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ww]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[xs1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[xs1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[xyk]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[xyk]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[zd]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[zd]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[zpry]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[zpry]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[学生表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[学生表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[库存表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[库存表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[操作员信息表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[操作员信息表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[教师表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[教师表]
GO

CREATE TABLE [dbo].[TABLE1] (
	[xm] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[jc] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[mm] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[rkgl] [int] NOT NULL ,
	[ckgl] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[bj1] (
	[bh] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[mc] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[js] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[rs] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[cj] (
	[bh] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[xm] [char] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[yw] [int] NULL ,
	[sx] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[cp] (
	[产品名称] [char] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[编号] [char] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[单位] [char] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[库存] [int] NULL ,
	[单价] [money] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[cps] (
	[cbsbh] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[cbsmc] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[cbsdh] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[hkd] (
	[skr] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[skrdz] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[hkr] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[hkrdz] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[hkje] [money] NOT NULL ,
	[hpbh] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[shhj] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[qkdd] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[hw] (
	[货物编号] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[货物名称] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[数量] [int] NULL ,
	[合计金额] [money] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[hwmc] (
	[bh] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[mc] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[jg] [money] NULL ,
	[gys] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[image] (
	[name] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[image] [image] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[jisuan] (
	[品名] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[单价] [money] NOT NULL ,
	[数量] [int] NULL ,
	[合计] [money] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jlz] (
	[操作员姓名] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[操作内容] [varchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[操作时间] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[js] (
	[教师编号] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[教师名称] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[职称] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[科室] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[工资] [money] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[js1] (
	[bh] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[xm] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[nl] [int] NOT NULL ,
	[ks] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rq] (
	[日期] [datetime] NULL ,
	[厂家] [char] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[货物名称] [char] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[合计价格] [money] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rs] (
	[编号] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[姓名] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[职称] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[工资] [int] NOT NULL ,
	[性别] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[年龄] [int] NOT NULL ,
	[科室] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[电话] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ry] (
	[mc] [char] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[xb] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[nl] [int] NOT NULL ,
	[mm] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ryxt] (
	[bm] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[mc] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[xb] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[nl] [int] NOT NULL ,
	[zp] [image] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[sf] (
	[Sf] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sj] (
	[bh] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[mc] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[dj] [money] NOT NULL ,
	[sl] [int] NULL ,
	[hjjg] AS ([dj] * [sl]) ,
	[cbsbh] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sjbh] (
	[bh] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[mc] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[zz] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[jj] [money] NULL ,
	[sj] [money] NULL ,
	[shj] [datetime] NULL ,
	[txm] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[cps] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sjgl] (
	[条形码] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[书籍名称] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[书籍价格] [money] NOT NULL ,
	[出版社] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[数量] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[songkun] (
	[aa] [image] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[sxsz] (
	[name] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[topp] [int] NOT NULL ,
	[leftt] [int] NOT NULL ,
	[height] [int] NOT NULL ,
	[width] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tp] (
	[mc] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[tp] [image] NOT NULL ,
	[zz] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[txm] (
	[hwbh] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[txm] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[jg] [money] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ww] (
	[sadf] [image] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[xs1] (
	[bh] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[xm] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[xb] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[yw] [int] NOT NULL ,
	[sx] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[xyk] (
	[编号] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[使用者] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[金额] [money] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[zd] (
	[zdbh] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[zdmc] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[szsf] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[lxr] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[lxdh] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[yzbm] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[zpry] (
	[bm] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[mc] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[xb] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[nl] [int] NULL ,
	[zp] [image] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[学生表] (
	[学生编号] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[学生姓名] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[语文成绩] [int] NULL ,
	[数学成绩] [int] NULL ,
	[班主任] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[库存表] (
	[商品编号] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[商品名称] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[库存数量] [int] NULL ,
	[库存金额] [money] NULL ,
	[盘点] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[操作员信息表] (
	[操作员编号] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[操作员姓名] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[操作员密码] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[操作员级别] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[时间] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[教师表] (
	[教师编号] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[教师姓名] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[科室] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[年龄] [int] NULL ,
	[工资] [int] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TABLE1] WITH NOCHECK ADD 
	CONSTRAINT [DF_TABLE1_rkgl] DEFAULT (0) FOR [rkgl],
	CONSTRAINT [DF_TABLE1_ckgl] DEFAULT (0) FOR [ckgl]
GO

ALTER TABLE [dbo].[cj] WITH NOCHECK ADD 
	CONSTRAINT [PK_cj] PRIMARY KEY  CLUSTERED 
	(
		[bh]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[cps] WITH NOCHECK ADD 
	CONSTRAINT [PK_cps] PRIMARY KEY  CLUSTERED 
	(
		[cbsbh]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[jlz] WITH NOCHECK ADD 
	CONSTRAINT [DF_jlz_操作时间] DEFAULT (getdate()) FOR [操作时间]
GO

ALTER TABLE [dbo].[rs] WITH NOCHECK ADD 
	CONSTRAINT [PK_rs] PRIMARY KEY  CLUSTERED 
	(
		[编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sf] WITH NOCHECK ADD 
	CONSTRAINT [PK_sf] PRIMARY KEY  CLUSTERED 
	(
		[Sf]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sj] WITH NOCHECK ADD 
	CONSTRAINT [PK_sj] PRIMARY KEY  CLUSTERED 
	(
		[bh]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[xyk] WITH NOCHECK ADD 
	CONSTRAINT [PK_xyk] PRIMARY KEY  CLUSTERED 
	(
		[编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[教师表] WITH NOCHECK ADD 
	CONSTRAINT [aaaa] PRIMARY KEY  CLUSTERED 
	(
		[教师编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sj] ADD 
	CONSTRAINT [FK_sj_cps] FOREIGN KEY 
	(
		[cbsbh]
	) REFERENCES [dbo].[cps] (
		[cbsbh]
	)
GO

ALTER TABLE [dbo].[zd] ADD 
	CONSTRAINT [FK_zd_sf] FOREIGN KEY 
	(
		[szsf]
	) REFERENCES [dbo].[sf] (
		[Sf]
	)
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create Procedure a2
  @aa varchar(20), 
  @bb int output
as

select @bb = Sum(年龄) From  rs where 性别 = @aa

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create Procedure selecttable as select * from cj

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

