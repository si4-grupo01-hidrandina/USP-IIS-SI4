USE [BDTFH]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/07/2019 12:33:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[sect_id] [int] NOT NULL,
	[clie_id] [int] IDENTITY(1,1) NOT NULL,
	[clie_nombres] [varchar](50) NOT NULL,
	[clie_direccion] [varchar](80) NOT NULL,
	[clie_tipo] [char](1) NOT NULL,
	[clie_apepat] [varchar](50) NOT NULL,
	[clie_apemat] [varchar](50) NOT NULL,
	[clie_telefono] [int] NULL,
	[clie_email] [varchar](50) NULL,
	[clie_nrodocu] [varchar](11) NOT NULL,
	[tdi_id] [int] NOT NULL,
 CONSTRAINT [XPKCliente] PRIMARY KEY CLUSTERED 
(
	[clie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 11/07/2019 12:33:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepto](
	[conc_id] [int] IDENTITY(1,1) NOT NULL,
	[conc_nombre] [varchar](40) NOT NULL,
	[conc_fijo] [char](1) NULL,
 CONSTRAINT [XPKConcepto] PRIMARY KEY CLUSTERED 
(
	[conc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cronograma]    Script Date: 11/07/2019 12:33:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cronograma](
	[cro_id] [int] IDENTITY(1,1) NOT NULL,
	[cro_feclect] [datetime] NOT NULL,
	[cro_fecvalo] [datetime] NOT NULL,
	[cro_fecvenc] [datetime] NOT NULL,
	[cro_feccier] [datetime] NOT NULL,
 CONSTRAINT [XPKCronograma] PRIMARY KEY CLUSTERED 
(
	[cro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Facturacion]    Script Date: 11/07/2019 12:33:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Facturacion](
	[conc_id] [int] NOT NULL,
	[det_consumo] [decimal](10, 2) NOT NULL,
	[det_importe] [decimal](10, 2) NOT NULL,
	[fact_id] [int] NOT NULL,
	[det_subtotal]  AS ([det_consumo]*[det_importe]),
	[det_igv]  AS ((0.18)),
	[det_total]  AS (([det_consumo]*[det_importe])*(0.18)+[det_consumo]*[det_importe]),
 CONSTRAINT [XPKDetalle_Facturacion] PRIMARY KEY CLUSTERED 
(
	[conc_id] ASC,
	[fact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturacion]    Script Date: 11/07/2019 12:33:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturacion](
	[cro_id] [int] NOT NULL,
	[med_id] [int] NOT NULL,
	[fact_lectura] [decimal](10, 2) NOT NULL,
	[fact_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [XPKFacturacion] PRIMARY KEY CLUSTERED 
(
	[fact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medidor]    Script Date: 11/07/2019 12:33:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medidor](
	[clie_id] [int] NOT NULL,
	[med_id] [int] IDENTITY(1,1) NOT NULL,
	[med_nroserie] [varchar](30) NOT NULL,
	[med_nrohilo] [int] NOT NULL,
	[med_clase] [varchar](50) NOT NULL,
 CONSTRAINT [XPKMedidor] PRIMARY KEY CLUSTERED 
(
	[med_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sector]    Script Date: 11/07/2019 12:33:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sector](
	[zon_id] [int] NOT NULL,
	[sect_id] [int] IDENTITY(1,1) NOT NULL,
	[sect_nombre] [int] NOT NULL,
	[ubi_id] [varchar](6) NOT NULL,
 CONSTRAINT [XPKSector] PRIMARY KEY CLUSTERED 
(
	[sect_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Documento]    Script Date: 11/07/2019 12:33:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Documento](
	[tdi_id] [int] IDENTITY(1,1) NOT NULL,
	[tdi_nombre] [varchar](50) NOT NULL,
	[tdi_abreviatura] [varchar](15) NULL,
 CONSTRAINT [XPKTipo_Documento] PRIMARY KEY CLUSTERED 
(
	[tdi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubigeo]    Script Date: 11/07/2019 12:33:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubigeo](
	[ubi_id] [varchar](6) NOT NULL,
	[ubi_dep] [varchar](50) NOT NULL,
	[ubi_provincia] [varchar](50) NOT NULL,
	[ubi_distrito] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ubigeo] PRIMARY KEY CLUSTERED 
(
	[ubi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zona]    Script Date: 11/07/2019 12:33:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zona](
	[zon_id] [int] IDENTITY(1,1) NOT NULL,
	[zon_nombre] [char](1) NOT NULL,
 CONSTRAINT [XPKZona] PRIMARY KEY CLUSTERED 
(
	[zon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [R_15] FOREIGN KEY([sect_id])
REFERENCES [dbo].[Sector] ([sect_id])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [R_15]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [R_30] FOREIGN KEY([tdi_id])
REFERENCES [dbo].[Tipo_Documento] ([tdi_id])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [R_30]
GO
ALTER TABLE [dbo].[Detalle_Facturacion]  WITH CHECK ADD  CONSTRAINT [R_19] FOREIGN KEY([fact_id])
REFERENCES [dbo].[Facturacion] ([fact_id])
GO
ALTER TABLE [dbo].[Detalle_Facturacion] CHECK CONSTRAINT [R_19]
GO
ALTER TABLE [dbo].[Detalle_Facturacion]  WITH CHECK ADD  CONSTRAINT [R_21] FOREIGN KEY([conc_id])
REFERENCES [dbo].[Concepto] ([conc_id])
GO
ALTER TABLE [dbo].[Detalle_Facturacion] CHECK CONSTRAINT [R_21]
GO
ALTER TABLE [dbo].[Facturacion]  WITH CHECK ADD  CONSTRAINT [R_16] FOREIGN KEY([cro_id])
REFERENCES [dbo].[Cronograma] ([cro_id])
GO
ALTER TABLE [dbo].[Facturacion] CHECK CONSTRAINT [R_16]
GO
ALTER TABLE [dbo].[Facturacion]  WITH CHECK ADD  CONSTRAINT [R_18] FOREIGN KEY([med_id])
REFERENCES [dbo].[Medidor] ([med_id])
GO
ALTER TABLE [dbo].[Facturacion] CHECK CONSTRAINT [R_18]
GO
ALTER TABLE [dbo].[Medidor]  WITH CHECK ADD  CONSTRAINT [R_7] FOREIGN KEY([clie_id])
REFERENCES [dbo].[Cliente] ([clie_id])
GO
ALTER TABLE [dbo].[Medidor] CHECK CONSTRAINT [R_7]
GO
ALTER TABLE [dbo].[Sector]  WITH CHECK ADD  CONSTRAINT [FK_Sector_Ubigeo] FOREIGN KEY([ubi_id])
REFERENCES [dbo].[Ubigeo] ([ubi_id])
GO
ALTER TABLE [dbo].[Sector] CHECK CONSTRAINT [FK_Sector_Ubigeo]
GO
ALTER TABLE [dbo].[Sector]  WITH CHECK ADD  CONSTRAINT [R_14] FOREIGN KEY([zon_id])
REFERENCES [dbo].[Zona] ([zon_id])
GO
ALTER TABLE [dbo].[Sector] CHECK CONSTRAINT [R_14]
GO
