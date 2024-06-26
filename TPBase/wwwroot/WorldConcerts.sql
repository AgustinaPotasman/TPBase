USE [master]
GO
/****** Object:  Database [WorldConcerts]    Script Date: 30/11/2023 15:01:49 ******/
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
/****** Object:  User [alumno]    Script Date: 30/11/2023 15:01:49 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 30/11/2023 15:01:49 ******/
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
/****** Object:  Table [dbo].[Conciertos]    Script Date: 30/11/2023 15:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conciertos](
	[IdConcierto] [varchar](50) NOT NULL,
	[Nombre] [varchar](70) NOT NULL,
	[fkUsuario] [int] NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[FechaConcierto] [date] NOT NULL,
	[Imagen] [text] NOT NULL,
	[Precio] [int] NOT NULL,
	[fkCategoria] [int] NOT NULL,
	[CantLikes] [int] NULL,
 CONSTRAINT [PK_Conciertos] PRIMARY KEY CLUSTERED 
(
	[IdConcierto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/*
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialCompras](
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [IdUsuario] INT NOT NULL,
    [IdConcierto] VARCHAR(50) NOT NULL,
    [FechaCompra] DATETIME NOT NULL,
);
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 30/11/2023 15:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[Numero] [int] IDENTITY(1,1) NOT NULL,
	[Titular] [varchar](50) NOT NULL,
	[CodigoSeg] [int] NOT NULL,
 CONSTRAINT [PK_Tarjeta] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 30/11/2023 15:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (1, N'Pop')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (2, N'Rock')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (3, N'Rap')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (4, N'Trap')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (5, N'Tango')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (6, N'Reggaeton')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria], [CantLikes]) VALUES (N'10', N'Taylor Swift', NULL, N'The Eras Tour', CAST(N'2024-04-21' AS Date), N'https://media.admagazine.com/photos/6421c251b63d56abbb4a6336/16:9/w_5999,h_3374,c_limit/GettyImages-1474485122.jpg', 15, 1, 22)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria], [CantLikes]) VALUES (N'11', N'Bad Bunny', NULL, N'La ultima llamada', CAST(N'2024-07-22' AS Date), N'https://www.billboard.com/wp-content/uploads/2023/10/bad-bunny-press-2023-billboard-1548.jpg?w=942&h=623&crop=1', 32, 6, 4)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria], [CantLikes]) VALUES (N'12', N'Rauw Alejandro', NULL, N'Algo Magico', CAST(N'2024-08-27' AS Date), N'https://media.gq.com.mx/photos/63a310423105d93f46dc2bf6/4:3/w_2664,h_1998,c_limit/Rauw%20Alejandro%20durante%20Grammys.jpg', 21, 3, 35)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria], [CantLikes]) VALUES (N'15', N'Duki', NULL, N'Rockstar', CAST(N'2024-04-18' AS Date), N'https://resizer.glanacion.com/resizer/v2/duki-lidero-2021-en-spotify-con-sus-discos-desde-ASE4W7XBHRHH7FQKKD3JPL3EOY.jpg?auth=a2f34c05b2deb04457cf41a45fa50933ef1beb569bfd76689e099d6b1bb31175&width=880&height=586&quality=70&smart=true', 15, 5, 6)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria], [CantLikes]) VALUES (N'17', N'Cardi B', NULL, N'Please me', CAST(N'2024-11-02' AS Date), N'https://www.lavanguardia.com/files/og_thumbnail/uploads/2020/11/05/5fb28ed9629a5.jpeg', 20, 1, 8)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria], [CantLikes]) VALUES (N'18', N'Emilia M', NULL, N'Conejo malo', CAST(N'2024-10-31' AS Date), N'https://boxer-motors.com/wp-content/uploads/2023/04/emilia-mernes-portada.jpg', 200, 1, 22)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria], [CantLikes]) VALUES (N'19', N'Tini', NULL, N'La triple T', CAST(N'2024-11-10' AS Date), N'https://upload.wikimedia.org/wikipedia/commons/1/12/Tini_%282021%29_02.png', 22, 1, 33)
INSERT [dbo].[Conciertos] ([IdConcierto], [Nombre], [fkUsuario], [Descripcion], [FechaConcierto], [Imagen], [Precio], [fkCategoria], [CantLikes]) VALUES (N'8', N'Lali', NULL, N'Almas Gemelas', CAST(N'2024-04-20' AS Date), N'https://viapais.com.ar/resizer/T5Vq435KbsxQNdkcXlv5OJG320E=/980x640/smart/filters:quality(75):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/grupoclarin/ITIGEWMACNEYJANINMO7RN2OGQ.jpg', 50, 1, 12)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [Contraseña], [Nombre]) VALUES (1, N'11', N'll')
INSERT [dbo].[Usuarios] ([IdUsuario], [Contraseña], [Nombre]) VALUES (2, N'12', N'hola')
INSERT [dbo].[Usuarios] ([IdUsuario], [Contraseña], [Nombre]) VALUES (3, N'queteimporta', N'cami123')
INSERT [dbo].[Usuarios] ([IdUsuario], [Contraseña], [Nombre]) VALUES (4, N'agus', N'agus')
INSERT [dbo].[Usuarios] ([IdUsuario], [Contraseña], [Nombre]) VALUES (5, N'1212', N'1212')
INSERT [dbo].[Usuarios] ([IdUsuario], [Contraseña], [Nombre]) VALUES (6, N'111', N'111')
INSERT [dbo].[Usuarios] ([IdUsuario], [Contraseña], [Nombre]) VALUES (7, N'1', N'holaa')
INSERT [dbo].[Usuarios] ([IdUsuario], [Contraseña], [Nombre]) VALUES (8, N'2', N'2')
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
/****** Object:  StoredProcedure [dbo].[sp_ActualizarLikesconcierto]    Script Date: 30/11/2023 15:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarLikesconcierto]
    @IdConcierto VARCHAR(50),
    @CantLikes INT
AS
BEGIN
    UPDATE Conciertos
    SET CantLikes = CantLikes + @CantLikes
    WHERE IdConcierto = @IdConcierto;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarUsuario]    Script Date: 30/11/2023 15:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarUsuario]
    @Contraseña VARCHAR(50),
    @Nombre VARCHAR(50)
AS
BEGIN
    INSERT INTO Usuarios (Contraseña, Nombre)
    VALUES (@Contraseña, @Nombre);
END


GO
USE [master]
GO
ALTER DATABASE [WorldConcerts] SET  READ_WRITE 
GO
