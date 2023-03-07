object FormCadastroBase: TFormCadastroBase
  Left = 0
  Top = 0
  Caption = 'Cadastro Base'
  ClientHeight = 479
  ClientWidth = 714
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 714
    Height = 479
    ActivePage = TabSheetConsulta
    Align = alClient
    TabOrder = 0
    object TabSheetConsulta: TTabSheet
      Caption = 'Consulta'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 706
        Height = 81
        Align = alTop
        TabOrder = 0
        DesignSize = (
          706
          81)
        object LabelBuscar: TLabel
          Left = 6
          Top = 11
          Width = 57
          Height = 13
          Caption = 'LabelBuscar'
        end
        object LabelAtivoInativo: TLabel
          Left = 1
          Top = 61
          Width = 704
          Height = 19
          Align = alBottom
          Alignment = taCenter
          Caption = 'LabelAtivoInativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 145
        end
        object EditBuscar: TEdit
          Left = 94
          Top = 8
          Width = 520
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object ButtonBuscar: TButton
          Left = 620
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Buscar'
          Default = True
          TabOrder = 1
          OnClick = ButtonBuscarClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 410
        Width = 706
        Height = 41
        Align = alBottom
        TabOrder = 1
        DesignSize = (
          706
          41)
        object ButtonInserir: TButton
          Left = 6
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Inserir'
          TabOrder = 0
          OnClick = ButtonInserirClick
        end
        object ButtonAlterar: TButton
          Left = 87
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = ButtonAlterarClick
        end
        object ButtonImprimir: TButton
          Left = 168
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Imprimir'
          TabOrder = 2
          OnClick = ButtonImprimirClick
        end
        object ButtonSelecionar: TButton
          Left = 540
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Selecionar'
          TabOrder = 3
          OnClick = ButtonSelecionarClick
        end
        object ButtonFechar: TButton
          Left = 620
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = 'Fechar'
          TabOrder = 4
          OnClick = ButtonFecharClick
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 81
        Width = 706
        Height = 329
        Align = alClient
        DataSource = DataSource
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = ButtonSelecionarClick
      end
    end
    object TabSheetCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 410
        Width = 706
        Height = 41
        Align = alBottom
        TabOrder = 0
        DesignSize = (
          706
          41)
        object ButtonSalvar: TButton
          Left = 543
          Top = 7
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Salvar'
          Default = True
          TabOrder = 0
          OnClick = ButtonSalvarClick
        end
        object ButtonCancelar: TButton
          Left = 623
          Top = 7
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = ButtonCancelarClick
        end
      end
    end
  end
  object FDQuery: TFDQuery
    Connection = FormPrincipal.FDConnection
    Left = 344
    Top = 248
  end
  object DataSource: TDataSource
    DataSet = FDQuery
    Left = 408
    Top = 248
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource
    UserName = 'DBPipeline1'
    Left = 412
    Top = 312
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 344
    Top = 312
    Version = '15.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 20108
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'LabelTitulo'
        Anchors = [atLeft, atTop, atRight]
        Caption = 'T'#237'tulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7673
        mmLeft = 90223
        mmTop = 2910
        mmWidth = 15346
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 11642
        mmWidth = 197644
        BandType = 0
        LayerName = Foreground
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 17994
        mmWidth = 197644
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Color = cl3DLight
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 10319
        mmTop = 1058
        mmWidth = 17992
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Data'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 6614
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 191030
        mmTop = 1058
        mmWidth = 1852
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        UserName = 'Label1'
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3968
        mmLeft = 187061
        mmTop = 1060
        mmWidth = 1587
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Pag'
        Caption = 'Pag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 171980
        mmTop = 1058
        mmWidth = 5027
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 181770
        mmTop = 1058
        mmWidth = 1852
        BandType = 8
        LayerName = Foreground
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 197644
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppLabeltotalregistro: TppLabel
        UserName = 'Label2'
        Caption = 'Label2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1322
        mmTop = 2381
        mmWidth = 9525
        BandType = 7
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
