inherited FormControleComanda: TFormControleComanda
  Caption = 'Controle Comanda'
  ExplicitWidth = 730
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 344
    Top = 256
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  inherited PageControl: TPageControl
    inherited TabSheetConsulta: TTabSheet
      inherited Panel1: TPanel
        inherited LabelBuscar: TLabel
          Anchors = [akTop]
        end
        inherited EditBuscar: TEdit
          Left = 86
          Width = 528
          NumbersOnly = True
          ExplicitLeft = 86
          ExplicitWidth = 528
        end
      end
      inherited Panel2: TPanel
        inherited ButtonSelecionar: TButton
          Left = 539
          Visible = False
          ExplicitLeft = 539
        end
      end
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'iditencomanda'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idcomanda'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idproduto'
            Visible = False
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'dtaddcomanda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmproduto'
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlvenda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idsituacaoprodutocomanda'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'idcomanda_1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'idgarcom'
            Visible = False
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'dtcomanda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idstatuscomanda'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'vldesconto'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'idgarcom_1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'nmgarcom'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmstatusprodutocomanda'
            Visible = True
          end>
      end
    end
    inherited TabSheetCadastro: TTabSheet
      ExplicitLeft = 8
      ExplicitTop = 28
      object Label1: TLabel [0]
        Left = 16
        Top = 16
        Width = 71
        Height = 13
        Caption = 'C'#243'd. Comanda'
        FocusControl = cxDBSpinEdit1
      end
      object Label3: TLabel [1]
        Left = 16
        Top = 56
        Width = 97
        Height = 13
        Caption = 'Data Add. Comanda'
        FocusControl = cxDBDateEdit1
      end
      object Label12: TLabel [2]
        Left = 16
        Top = 136
        Width = 36
        Height = 13
        Caption = 'Gar'#231'om'
        FocusControl = cxDBTextEdit1
      end
      object Label13: TLabel [3]
        Left = 16
        Top = 96
        Width = 38
        Height = 13
        Caption = 'Produto'
        FocusControl = cxDBTextEdit2
      end
      object Label14: TLabel [4]
        Left = 16
        Top = 176
        Width = 31
        Height = 13
        Caption = 'Status'
        FocusControl = cxDBTextEdit3
      end
      object cxDBSpinEdit1: TcxDBSpinEdit
        Left = 16
        Top = 32
        DataBinding.DataField = 'idcomanda'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Properties.SpinButtons.Visible = False
        Style.Color = clSkyBlue
        TabOrder = 1
        Width = 121
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 16
        Top = 72
        DataBinding.DataField = 'dtaddcomanda'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Style.Color = clSkyBlue
        TabOrder = 2
        Width = 121
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 16
        Top = 155
        DataBinding.DataField = 'nmgarcom'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Style.Color = clSkyBlue
        TabOrder = 3
        Width = 121
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 16
        Top = 112
        DataBinding.DataField = 'nmproduto'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Style.Color = clSkyBlue
        TabOrder = 4
        Width = 121
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 16
        Top = 192
        DataBinding.DataField = 'nmstatusprodutocomanda'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Style.Color = clSkyBlue
        TabOrder = 5
        Width = 121
      end
      object ButtonInserirProduto: TButton
        Left = 160
        Top = 110
        Width = 110
        Height = 25
        Caption = 'Selecionar Produto'
        TabOrder = 6
        OnClick = ButtonInserirProdutoClick
      end
      object ButtonCancelarProduto: TButton
        Left = 160
        Top = 190
        Width = 110
        Height = 25
        Caption = 'Ativa/Cancel Produto'
        TabOrder = 7
        OnClick = ButtonCancelarProdutoClick
      end
      object ButtonSelecionarComanda: TButton
        Left = 160
        Top = 30
        Width = 110
        Height = 25
        Caption = 'Selecionar Comanda'
        TabOrder = 8
        OnClick = ButtonSelecionarComandaClick
      end
    end
  end
  inherited FDQuery: TFDQuery
    Active = True
    SQL.Strings = (
      '  SELECT ITENCOMANDA.IDITENCOMANDA,'
      '         ITENCOMANDA.IDCOMANDA,'
      '         ITENCOMANDA.IDPRODUTO,'
      '         ITENCOMANDA.DTADDCOMANDA,'
      '         ITENCOMANDA.VLVENDA,'
      '         ITENCOMANDA.IDSITUACAOPRODUTOCOMANDA,'
      '         COMANDA.IDCOMANDA,'
      '         COMANDA.IDGARCOM,'
      '         COMANDA.DTCOMANDA,'
      '  '#9' COMANDA.IDSTATUSCOMANDA,'
      '   '#9' COMANDA.VLDESCONTO,'
      ' '#9' GARCOM.IDGARCOM,'
      #9' GARCOM.NMGARCOM,'
      #9' PRODUTO.NMPRODUTO,'
      #9' STATUSPRODUTOCOMANDA.NMSTATUSPRODUTOCOMANDA'
      '    FROM ITENCOMANDA'
      '    JOIN COMANDA'
      '      ON ITENCOMANDA.IDCOMANDA = COMANDA.IDCOMANDA'
      '    JOIN GARCOM'
      '      ON COMANDA.IDGARCOM = GARCOM.IDGARCOM'
      '    JOIN PRODUTO'
      '      ON ITENCOMANDA.IDPRODUTO = PRODUTO.IDPRODUTO'
      '    JOIN STATUSPRODUTOCOMANDA'
      
        '      ON ITENCOMANDA.IDSITUACAOPRODUTOCOMANDA = STATUSPRODUTOCOM' +
        'ANDA.IDSITUACAOPRODUTOCOMANDA'
      '   WHERE COMANDA.IDSTATUSCOMANDA = 1'
      ''
      '')
    Left = 512
    object FDQueryiditencomanda: TLargeintField
      DisplayLabel = 'C'#243'd. Opera'#231#227'o'
      FieldName = 'iditencomanda'
      Origin = 'iditencomanda'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryidcomanda: TLargeintField
      DisplayLabel = 'C'#243'd. Comanda'
      FieldName = 'idcomanda'
      Origin = 'idcomanda'
    end
    object FDQueryidproduto: TLargeintField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object FDQuerydtaddcomanda: TDateField
      DisplayLabel = 'Data Add. Comanda'
      FieldName = 'dtaddcomanda'
      Origin = 'dtaddcomanda'
    end
    object FDQueryvlvenda: TBCDField
      DisplayLabel = 'Valor Venda'
      FieldName = 'vlvenda'
      Origin = 'vlvenda'
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQueryidsituacaoprodutocomanda: TLargeintField
      FieldName = 'idsituacaoprodutocomanda'
      Origin = 'idsituacaoprodutocomanda'
    end
    object FDQueryidcomanda_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idcomanda_1'
      Origin = 'idcomanda'
    end
    object FDQueryidgarcom: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idgarcom'
      Origin = 'idgarcom'
    end
    object FDQuerydtcomanda: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data Comanda'
      FieldName = 'dtcomanda'
      Origin = 'dtcomanda'
    end
    object FDQueryidstatuscomanda: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idstatuscomanda'
      Origin = 'idstatuscomanda'
    end
    object FDQueryvldesconto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vldesconto'
      Origin = 'vldesconto'
      Precision = 10
      Size = 2
    end
    object FDQueryidgarcom_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idgarcom_1'
      Origin = 'idgarcom'
    end
    object FDQuerynmgarcom: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Gar'#231'om'
      FieldName = 'nmgarcom'
      Origin = 'nmgarcom'
      Size = 50
    end
    object FDQuerynmproduto: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Produto'
      FieldName = 'nmproduto'
      Origin = 'nmproduto'
      Size = 50
    end
    object FDQuerynmstatusprodutocomanda: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Status'
      FieldName = 'nmstatusprodutocomanda'
      Origin = 'nmstatusprodutocomanda'
      Size = 50
    end
  end
  inherited DataSource: TDataSource
    Left = 592
  end
  inherited ppDBPipeline1: TppDBPipeline
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'iditencomanda'
      FieldName = 'iditencomanda'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'idcomanda'
      FieldName = 'idcomanda'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'idproduto'
      FieldName = 'idproduto'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'dtaddcomanda'
      FieldName = 'dtaddcomanda'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'vlvenda'
      FieldName = 'vlvenda'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 11
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'idsituacaoprodutocomanda'
      FieldName = 'idsituacaoprodutocomanda'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'idcomanda_1'
      FieldName = 'idcomanda_1'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'idgarcom'
      FieldName = 'idgarcom'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'dtcomanda'
      FieldName = 'dtcomanda'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'idstatuscomanda'
      FieldName = 'idstatuscomanda'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'vldesconto'
      FieldName = 'vldesconto'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 11
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'idgarcom_1'
      FieldName = 'idgarcom_1'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'nmgarcom'
      FieldName = 'nmgarcom'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'nmproduto'
      FieldName = 'nmproduto'
      FieldLength = 50
      DisplayWidth = 50
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = 'nmstatusprodutocomanda'
      FieldName = 'nmstatusprodutocomanda'
      FieldLength = 50
      DisplayWidth = 50
      Position = 14
    end
  end
  inherited ppReport1: TppReport
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    DataPipelineName = 'ppDBPipeline1'
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        Caption = 'Comanda'
        mmLeft = 128852
        mmWidth = 25400
        LayerName = Foreground
      end
      inherited ppLine1: TppLine
        mmWidth = 284692
        LayerName = Foreground
      end
      inherited ppLine2: TppLine
        mmWidth = 284692
        LayerName = Foreground
      end
    end
    inherited ppFooterBand1: TppFooterBand
      inherited ppSystemVariable1: TppSystemVariable
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLabel2: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppSystemVariable2: TppSystemVariable
        SaveOrder = -1
        mmLeft = 280994
        LayerName = Foreground
      end
      inherited ppLabel3: TppLabel
        SaveOrder = -1
        mmLeft = 277025
        LayerName = Foreground
      end
      inherited ppLabel4: TppLabel
        SaveOrder = -1
        mmLeft = 261944
        LayerName = Foreground
      end
      inherited ppSystemVariable3: TppSystemVariable
        SaveOrder = -1
        mmLeft = 271734
        LayerName = Foreground
      end
      inherited ppLine3: TppLine
        mmWidth = 284692
        LayerName = Foreground
      end
    end
    inherited ppSummaryBand1: TppSummaryBand
      inherited ppLabeltotalregistro: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
    end
  end
end
