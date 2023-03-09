object FormCardapioViaCod: TFormCardapioViaCod
  Left = 0
  Top = 0
  Caption = 'Cardapio Via Codigo'
  ClientHeight = 511
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 776
    Height = 100
    Align = alTop
    TabOrder = 0
    DesignSize = (
      776
      100)
    object Label1: TLabel
      Left = 48
      Top = 8
      Width = 47
      Height = 13
      Caption = 'Categoria'
    end
    object Label2: TLabel
      Left = 48
      Top = 54
      Width = 91
      Height = 15
      Caption = 'Situa'#231#227'o Categoria'
    end
    object Label3: TLabel
      Left = 416
      Top = 8
      Width = 38
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Produto'
    end
    object Label4: TLabel
      Left = 416
      Top = 54
      Width = 82
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Situa'#231#227'o Produto'
    end
    object ComboBoxCategoria: TComboBox
      Left = 48
      Top = 21
      Width = 300
      Height = 21
      TabOrder = 0
      Text = 'ComboBoxCategoria'
    end
    object ComboBoxSitCategoria: TComboBox
      Left = 48
      Top = 69
      Width = 300
      Height = 21
      TabOrder = 1
      Text = 'ComboBoxSitCategoria'
    end
    object ComboBoxSitProduto: TComboBox
      Left = 416
      Top = 69
      Width = 300
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = 'ComboBoxSitProduto'
    end
    object EditProduto: TEdit
      Left = 416
      Top = 21
      Width = 218
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = 'EditProduto'
    end
    object ButtonBuscar: TButton
      Left = 640
      Top = 19
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Buscar'
      TabOrder = 4
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 470
    Width = 776
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 304
    ExplicitTop = 256
    ExplicitWidth = 185
    DesignSize = (
      776
      41)
    object ButtonImprimir: TButton
      Left = 590
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Imprimir'
      TabOrder = 0
    end
    object ButtonCancelar: TButton
      Left = 680
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 1
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 100
    Width = 776
    Height = 370
    Align = alClient
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ppDBPipeline1: TppDBPipeline
    UserName = 'DBPipeline'
    Left = 384
    Top = 320
  end
  object ppReport: TppReport
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
    Left = 384
    Top = 264
    Version = '15.04'
    mmColumnWidth = 0
  end
end
