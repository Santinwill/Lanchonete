object FormRelatorioBase: TFormRelatorioBase
  Left = 0
  Top = 0
  Caption = 'Relatorio Base'
  ClientHeight = 384
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 612
    Height = 73
    Align = alTop
    TabOrder = 0
    DesignSize = (
      612
      73)
    object ButtonBuscar: TButton
      Left = 529
      Top = 38
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Buscar'
      Default = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 343
    Width = 612
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      612
      41)
    object ButtonImprimir: TButton
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Imprimir'
      TabOrder = 0
    end
    object ButtonCancelar: TButton
      Left = 529
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = ButtonCancelarClick
    end
  end
  object DBGridRelatorio: TDBGrid
    Left = 0
    Top = 73
    Width = 612
    Height = 270
    Align = alClient
    DataSource = DataSourceRelatorio
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSourceRelatorio: TDataSource
    DataSet = FDQueryRelatorio
    Left = 336
    Top = 232
  end
  object FDQueryRelatorio: TFDQuery
    Connection = FormPrincipal.FDConnection
    Left = 240
    Top = 224
  end
end
