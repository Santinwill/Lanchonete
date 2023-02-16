object FormPagamento: TFormPagamento
  Left = 0
  Top = 0
  Caption = 'Fechamento Comanda'
  ClientHeight = 498
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    787
    498)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 73
    Height = 13
    Caption = 'Itens Comanda'
  end
  object Label3: TLabel
    Left = 8
    Top = 312
    Width = 72
    Height = 13
    Caption = 'Total Comanda'
  end
  object Label4: TLabel
    Left = 8
    Top = 360
    Width = 45
    Height = 13
    Caption = 'Desconto'
  end
  object Label6: TLabel
    Left = 416
    Top = 56
    Width = 57
    Height = 13
    Caption = 'Itens Pagos'
  end
  object Label5: TLabel
    Left = 416
    Top = 312
    Width = 79
    Height = 13
    Caption = 'Total Pago Itens'
  end
  object Label7: TLabel
    Left = 152
    Top = 408
    Width = 58
    Height = 13
    Caption = 'Valor Parcial'
  end
  object Label8: TLabel
    Left = 152
    Top = 360
    Width = 64
    Height = 13
    Caption = 'Valor a Pagar'
  end
  object Label9: TLabel
    Left = 560
    Top = 312
    Width = 85
    Height = 13
    Caption = 'Total Pago Parcial'
  end
  object Label10: TLabel
    Left = 560
    Top = 360
    Width = 51
    Height = 13
    Caption = 'Total Pago'
  end
  object Label11: TLabel
    Left = 416
    Top = 360
    Width = 45
    Height = 13
    Caption = 'Desconto'
  end
  object Label12: TLabel
    Left = 563
    Top = 408
    Width = 79
    Height = 13
    Caption = 'Status Comanda'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 71
      Height = 13
      Caption = 'C'#243'd. Comanda'
    end
    object ButtonBuscarComanda: TButton
      Left = 224
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Selecionar'
      Default = True
      TabOrder = 0
      OnClick = ButtonBuscarComandaClick
    end
    object EditCodigoComanda: TEdit
      Left = 97
      Top = 10
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 457
    Width = 787
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      787
      41)
    object ButtonPagarTudo: TButton
      Left = 6
      Top = 8
      Width = 100
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Quitar Comanda'
      TabOrder = 0
      OnClick = ButtonPagarTudoClick
    end
    object ButtonPagarItem: TButton
      Left = 112
      Top = 8
      Width = 100
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Pagar Item'
      TabOrder = 1
      OnClick = ButtonPagarItemClick
    end
    object ButtonCancelarPgmt: TButton
      Left = 687
      Top = 8
      Width = 87
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = ButtonCancelarPgmtClick
    end
    object ButtonFecharComanda: TButton
      Left = 580
      Top = 8
      Width = 100
      Height = 25
      Caption = 'Fechar Comanda'
      TabOrder = 3
      Visible = False
      WordWrap = True
      OnClick = ButtonFecharComandaClick
    end
  end
  object DBGridItensComanda: TDBGrid
    Left = 8
    Top = 75
    Width = 401
    Height = 230
    Anchors = [akLeft, akTop, akBottom]
    DataSource = DataSourceItensComanda
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGridItensComandaCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'nmproduto'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlvenda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmstatusprodutocomanda'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtaddcomanda'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idsituacaoprodutocomanda'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'iditencomanda'
        Visible = True
      end>
  end
  object EditTotalComanda: TEdit
    Left = 8
    Top = 328
    Width = 121
    Height = 21
    Color = clSkyBlue
    ReadOnly = True
    TabOrder = 3
  end
  object EditDesconto: TEdit
    Left = 8
    Top = 376
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 415
    Top = 75
    Width = 364
    Height = 230
    DataSource = DataSourceItensPagos
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object EditTotalPagoItens: TEdit
    Left = 416
    Top = 328
    Width = 121
    Height = 21
    Color = clSkyBlue
    ReadOnly = True
    TabOrder = 6
  end
  object EditValorParcial: TEdit
    Left = 152
    Top = 424
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object ButtonPagarValorParcial: TButton
    Left = 280
    Top = 422
    Width = 113
    Height = 25
    Caption = 'Pagar Valor Parcial'
    TabOrder = 8
    OnClick = ButtonPagarValorParcialClick
  end
  object EditValorPagar: TEdit
    Left = 152
    Top = 376
    Width = 121
    Height = 21
    Color = 5987327
    TabOrder = 9
  end
  object EditTotalPagoParcial: TEdit
    Left = 560
    Top = 328
    Width = 121
    Height = 21
    Color = clSkyBlue
    ReadOnly = True
    TabOrder = 10
  end
  object EditTotalPago: TEdit
    Left = 560
    Top = 376
    Width = 121
    Height = 21
    Color = 4324444
    TabOrder = 11
  end
  object EditDescontoRecebido: TEdit
    Left = 416
    Top = 376
    Width = 121
    Height = 21
    Color = clSkyBlue
    ReadOnly = True
    TabOrder = 12
  end
  object EditStatusComanda: TEdit
    Left = 560
    Top = 424
    Width = 121
    Height = 21
    Color = clSkyBlue
    ReadOnly = True
    TabOrder = 13
  end
  object DataSourceItensComanda: TDataSource
    DataSet = FDQueryItensComanda
    Left = 216
    Top = 128
  end
  object FDQueryItensComanda: TFDQuery
    Active = True
    Connection = FormPrincipal.FDConnection
    SQL.Strings = (
      '  SELECT PRODUTO.NMPRODUTO,'
      '         ITENCOMANDA.VLVENDA,'
      '         STATUSPRODUTOCOMANDA.NMSTATUSPRODUTOCOMANDA,'
      '         ITENCOMANDA.DTADDCOMANDA,'
      '         ITENCOMANDA.IDITENCOMANDA,'
      '         ITENCOMANDA.IDCOMANDA,'
      #9' ITENCOMANDA.IDSITUACAOPRODUTOCOMANDA'
      '    FROM ITENCOMANDA '
      '    JOIN PRODUTO'
      '      ON PRODUTO.IDPRODUTO = ITENCOMANDA.IDPRODUTO'
      '    JOIN STATUSPRODUTOCOMANDA'
      
        '      ON STATUSPRODUTOCOMANDA.IDSITUACAOPRODUTOCOMANDA = ITENCOM' +
        'ANDA.IDSITUACAOPRODUTOCOMANDA'
      '    JOIN COMANDA'
      '      ON COMANDA.IDCOMANDA = ITENCOMANDA.IDCOMANDA '
      '   WHERE ITENCOMANDA.IDCOMANDA = :IDCOMANDA'
      '     AND ITENCOMANDA.IDSITUACAOPRODUTOCOMANDA = 1'
      '     AND COMANDA.IDSTATUSCOMANDA = 1'
      'ORDER BY DTADDCOMANDA')
    Left = 80
    Top = 136
    ParamData = <
      item
        Name = 'IDCOMANDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryItensComandanmproduto: TWideStringField
      DisplayLabel = 'Item'
      DisplayWidth = 33
      FieldName = 'nmproduto'
      Origin = 'nmproduto'
      Size = 50
    end
    object FDQueryItensComandavlvenda: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor'
      DisplayWidth = 12
      FieldName = 'vlvenda'
      Origin = 'vlvenda'
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQueryItensComandadtaddcomanda: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data Adicionado'
      DisplayWidth = 16
      FieldName = 'dtaddcomanda'
      Origin = 'dtaddcomanda'
    end
    object FDQueryItensComandanmstatusprodutocomanda: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'nmstatusprodutocomanda'
      Origin = 'nmstatusprodutocomanda'
      Size = 50
    end
    object FDQueryItensComandaiditencomanda: TLargeintField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'd. Item Comanda'
      FieldName = 'iditencomanda'
      Origin = 'iditencomanda'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object FDQueryItensComandaidcomanda: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idcomanda'
      Origin = 'idcomanda'
      Visible = False
    end
    object FDQueryItensComandaidsituacaoprodutocomanda: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idsituacaoprodutocomanda'
      Origin = 'idsituacaoprodutocomanda'
      Visible = False
    end
  end
  object DataSourceItensPagos: TDataSource
    DataSet = FDQueryItensPagos
    Left = 608
    Top = 200
  end
  object FDQueryItensPagos: TFDQuery
    Active = True
    Connection = FormPrincipal.FDConnection
    SQL.Strings = (
      '  SELECT PRODUTO.NMPRODUTO,'
      '         ITENCOMANDA.VLVENDA,'
      '         STATUSPRODUTOCOMANDA.NMSTATUSPRODUTOCOMANDA'
      '    FROM ITENCOMANDA '
      '    JOIN PRODUTO'
      '      ON PRODUTO.IDPRODUTO = ITENCOMANDA.IDPRODUTO'
      '    JOIN STATUSPRODUTOCOMANDA'
      
        '      ON STATUSPRODUTOCOMANDA.IDSITUACAOPRODUTOCOMANDA = ITENCOM' +
        'ANDA.IDSITUACAOPRODUTOCOMANDA'
      '    JOIN COMANDA'
      '      ON COMANDA.IDCOMANDA = ITENCOMANDA.IDCOMANDA '
      '   WHERE ITENCOMANDA.IDCOMANDA = :IDCOMANDA'
      '     AND ITENCOMANDA.IDSITUACAOPRODUTOCOMANDA = 3')
    Left = 488
    Top = 200
    ParamData = <
      item
        Name = 'IDCOMANDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryItensPagosnmproduto: TWideStringField
      DisplayLabel = 'Item'
      DisplayWidth = 26
      FieldName = 'nmproduto'
      Origin = 'nmproduto'
      Size = 50
    end
    object FDQueryItensPagosvlvenda: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor'
      DisplayWidth = 13
      FieldName = 'vlvenda'
      Origin = 'vlvenda'
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQueryItensPagosnmstatusprodutocomanda: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Situa'#231#227'o'
      DisplayWidth = 60
      FieldName = 'nmstatusprodutocomanda'
      Origin = 'nmstatusprodutocomanda'
      Size = 50
    end
  end
end
