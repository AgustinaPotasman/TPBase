CREATE DATABASE [WorldConcerts]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WorldConcerts', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WorldConcerts.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WorldConcerts_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WorldConcerts_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WorldConcerts] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorldConcerts].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorldConcerts] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorldConcerts] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorldConcerts] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorldConcerts] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorldConcerts] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorldConcerts] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorldConcerts] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorldConcerts] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorldConcerts] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorldConcerts] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorldConcerts] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorldConcerts] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorldConcerts] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorldConcerts] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorldConcerts] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorldConcerts] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorldConcerts] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorldConcerts] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorldConcerts] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorldConcerts] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorldConcerts] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorldConcerts] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorldConcerts] SET RECOVERY FULL 
GO
ALTER DATABASE [WorldConcerts] SET  MULTI_USER 
GO
ALTER DATABASE [WorldConcerts] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorldConcerts] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorldConcerts] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorldConcerts] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WorldConcerts] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WorldConcerts', N'ON'
GO
ALTER DATABASE [WorldConcerts] SET QUERY_STORE = OFF
GO
USE [WorldConcerts]
GO
/****** Object:  User [alumno]    Script Date: 24/11/2022 11:47:27 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 24/11/2022 11:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[TipoCategoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conciertos]    Script Date: 24/11/2022 11:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conciertos](
	[IdConcierto] [varchar](50) NOT NULL,
	[Nombre] [varchar](70) NOT NULL,
	[CantLikes] [int] NOT NULL,
	[fkUsuario] [int] NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[FechaConcierto] [date] NOT NULL,
	[Imagen] [varchar](50) NOT NULL,
	[Precio] [int] NOT NULL,
	[fkCategoria] [int] NOT NULL,
 CONSTRAINT [PK_Conciertos] PRIMARY KEY CLUSTERED 
(
	[IdConcierto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 24/11/2022 11:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Contrase?a] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (1, N'Acci?n')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (2, N'Arcade')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (3, N'Aventura')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (4, N'Deportes')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (5, N'Simulaci?n')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (6, N'Estrategia')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria]) VALUES (N'10', N'Mortal Kombat X', 2, NULL, N'La historia se desarrolla 25 a?os despu?s de los ?ltimos hechos de Mortal Kombat 9, poniendo ?nfasis en los veteranos de edad, nuevos personajes y los descendientes de ?ltima generaci?n de los combati', CAST(N'2015-04-21' AS Date), N'Mkx.jpg', 15, 1)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria]) VALUES (N'11', N'5D Chess With Multiverse Time Travel', 2, NULL, N'Es la primera variante de ajedrez con dimensiones espaciales, temporales y paralelas. ?Es ajedrez 5D con viaje en el tiempo multiverso! Mueva las piezas hacia atr?s en el tiempo para crear l?neas de t', CAST(N'2020-07-22' AS Date), N'Chess.jpg', 2, 6)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria]) VALUES (N'12', N'ARK: Survival Evolved', 1, NULL, N'Varado en las costas de una isla misteriosa, debes aprender a sobrevivir. Usa tu astucia para matar o domar a las criaturas primigenias que vagan por la tierra y enfr?ntate a otros Conadores para sobr', CAST(N'2017-08-27' AS Date), N'Ark.jpg', 3, 3)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria]) VALUES (N'14', N'Counter-Strike: Global Offensive
', 13, NULL, N'Counter-Strike: Global Offensive (CS:GO) ampl?a el Concierto de acci?n por equipos del que fue pionera la franquicia cuando sali? hace 19 a?os. CS:GO trae nuevos mapas, personajes, armas y modos de Concierto,', CAST(N'2012-08-21' AS Date), N'Csgo.jpg', 6, 1)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria]) VALUES (N'15', N'Microsoft Flight Simulator Game of the Year Edition
', 0, NULL, N'?Gracias por vuestro apoyo, fans recientes y de toda la vida! La edici?n Game of the Year (GOTY) de Microsoft Flight Simulator ofrece 5 nuevas aeronaves, 8 aeropuertos flamantes creados a mano, 6 vuel', CAST(N'2020-04-18' AS Date), N'Avion.jpg', 15, 5)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria]) VALUES (N'17', N'Valorant', 0, NULL, N'Concierto de accion y aventura', CAST(N'2022-11-02' AS Date), N'a.jpg', 20, 1)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria]) VALUES (N'18', N'Counter', 0, NULL, N'Nunca en mi vida lo Conue', CAST(N'2022-10-31' AS Date), N'a.jpg', 20000000, 1)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria]) VALUES (N'19', N'fdfs', 0, NULL, N'fdsfd', CAST(N'2022-11-10' AS Date), N'a.jpg', 0, 1)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria]) VALUES (N'6', N'Call Of Duty: Black Ops 2', 1, NULL, N'Empujando los l?mites de lo que los fan?ticos esperan de la franquicia de entretenimiento que establece r?cords, Call of Duty?: Black Ops II impulsa a los Conadores a un futuro cercano de la Guerra Fr', CAST(N'2012-11-18' AS Date), N'BlackOps2.jpg', 20, 5)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria]) VALUES (N'8', N'God Of War 2018', 12, NULL, N'Han pasado a?os desde que Kratos tom? su venganza contra los Dioses Ol?mpicos. Habiendo sobrevivido la pelea final contra su padre Zeus, Kratos vive ahora con su joven hijo Atreus en el mundo de los D', CAST(N'2018-04-20' AS Date), N'GodOfWar.jpg', 50, 1)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria]) VALUES (N'9', N'Fifa 22', 5, NULL, N'Powered by Football?, EA SPORTS? FIFA 22 acorta las distancias a?n m?s con lo que sucede en la vida real gracias a los avances en la Conabilidad b?sica y a nuevas caracter?sticas innovadoras en todos ', CAST(N'2021-10-01' AS Date), N'Fifa.jpg', 20, 5)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [Contrase?a], [Nombre]) VALUES (5, N'1234', N'LeoK')
INSERT [dbo].[Usuarios] ([IdUsuario], [Contrase?a], [Nombre]) VALUES (6, N'123', N'Alexis')
INSERT [dbo].[Usuarios] ([IdUsuario], [Contrase?a], [Nombre]) VALUES (7, N'pepe', N'Alote')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Conciertos]  WITH CHECK ADD  CONSTRAINT [FK_Conciertos_Categorias] FOREIGN KEY([fkCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Conciertos] CHECK CONSTRAINT [FK_Conciertos_Categorias]
GO
ALTER TABLE [dbo].[Conciertos]  WITH CHECK ADD  CONSTRAINT [FK_Conciertos_Usuarios] FOREIGN KEY([fkUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Conciertos] CHECK CONSTRAINT [FK_Conciertos_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [WorldConcerts] SET  READ_WRITE 
GO
