inherited FormCadastroComanda: TFormCadastroComanda
  Caption = 'Cadastro Comanda'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = TabSheetCadastro
    inherited TabSheetConsulta: TTabSheet
      inherited Panel1: TPanel
        inherited EditBuscar: TEdit
          Left = 107
          Width = 507
          NumbersOnly = True
          ExplicitLeft = 107
          ExplicitWidth = 507
        end
      end
      inherited Panel2: TPanel
        inherited ButtonSelecionar: TButton
          Left = 533
          Visible = False
          ExplicitLeft = 533
        end
      end
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'idcomanda'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idgarcom'
            Visible = False
          end
          item
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idstatusgarcom'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'idstatuscomanda_1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'nmcomanda'
            Visible = True
          end>
      end
    end
    inherited TabSheetCadastro: TTabSheet
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
        Width = 69
        Height = 13
        Caption = 'Data Abertura'
        FocusControl = cxDBDateEdit1
      end
      object Label7: TLabel [2]
        Left = 16
        Top = 96
        Width = 36
        Height = 13
        Caption = 'Gar'#231'om'
        FocusControl = cxDBTextEdit1
      end
      object Label10: TLabel [3]
        Left = 16
        Top = 136
        Width = 79
        Height = 13
        Caption = 'Status Comanda'
        FocusControl = cxDBTextEdit2
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
        DataBinding.DataField = 'dtcomanda'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Style.Color = clSkyBlue
        TabOrder = 2
        Width = 121
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 16
        Top = 112
        DataBinding.DataField = 'nmgarcom'
        DataBinding.DataSource = DataSource
        TabOrder = 3
        Width = 121
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 16
        Top = 152
        DataBinding.DataField = 'nmcomanda'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Style.Color = clSkyBlue
        TabOrder = 4
        Width = 121
      end
      object ButtonSelecionarGarcom: TButton
        Left = 160
        Top = 110
        Width = 110
        Height = 25
        Caption = 'Selecionar Gar'#231'om'
        TabOrder = 5
        OnClick = ButtonSelecionarGarcomClick
      end
    end
  end
  inherited FDQuery: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT COMANDA.IDCOMANDA,'
      '       COMANDA.IDGARCOM,'
      '       COMANDA.DTCOMANDA,'
      '       COMANDA.IDSTATUSCOMANDA,'
      '       COMANDA.VLDESCONTO,'
      '       GARCOM.IDGARCOM,'
      '       GARCOM.NMGARCOM,'
      '       GARCOM.IDSTATUSGARCOM,'
      '       STATUSCOMANDA.IDSTATUSCOMANDA,'
      '       STATUSCOMANDA.NMCOMANDA'
      '  FROM COMANDA'
      '  JOIN GARCOM'
      '    ON COMANDA.IDGARCOM = GARCOM.IDGARCOM'
      '  JOIN STATUSCOMANDA'
      '    ON COMANDA.IDSTATUSCOMANDA = STATUSCOMANDA.IDSTATUSCOMANDA')
    Left = 360
    Top = 320
    object FDQueryidcomanda: TLargeintField
      DisplayLabel = 'C'#243'd. Comanda'
      FieldName = 'idcomanda'
      Origin = 'idcomanda'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryidgarcom: TLargeintField
      FieldName = 'idgarcom'
      Origin = 'idgarcom'
    end
    object FDQuerydtcomanda: TDateField
      DisplayLabel = 'Data Abertura'
      FieldName = 'dtcomanda'
      Origin = 'dtcomanda'
    end
    object FDQueryidstatuscomanda: TIntegerField
      FieldName = 'idstatuscomanda'
      Origin = 'idstatuscomanda'
    end
    object FDQueryvldesconto: TBCDField
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
    object FDQueryidstatusgarcom: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idstatusgarcom'
      Origin = 'idstatusgarcom'
    end
    object FDQueryidstatuscomanda_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idstatuscomanda_1'
      Origin = 'idstatuscomanda'
    end
    object FDQuerynmcomanda: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Status Comanda'
      FieldName = 'nmcomanda'
      Origin = 'nmcomanda'
      Size = 7
    end
  end
  inherited DataSource: TDataSource
    Left = 432
    Top = 312
  end
  inherited ppDBPipeline1: TppDBPipeline
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'idcomanda'
      FieldName = 'idcomanda'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'idgarcom'
      FieldName = 'idgarcom'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'dtcomanda'
      FieldName = 'dtcomanda'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'idstatuscomanda'
      FieldName = 'idstatuscomanda'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'vldesconto'
      FieldName = 'vldesconto'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 11
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'idgarcom_1'
      FieldName = 'idgarcom_1'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'nmgarcom'
      FieldName = 'nmgarcom'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'idstatusgarcom'
      FieldName = 'idstatusgarcom'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'idstatuscomanda_1'
      FieldName = 'idstatuscomanda_1'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'nmcomanda'
      FieldName = 'nmcomanda'
      FieldLength = 7
      DisplayWidth = 7
      Position = 9
    end
  end
  inherited ppReport1: TppReport
    DataPipelineName = 'ppDBPipeline1'
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        Caption = 'Comanda'
        mmLeft = 85461
        mmWidth = 25400
        LayerName = Foreground
      end
      inherited ppLine1: TppLine
        LayerName = Foreground
      end
      inherited ppLine2: TppLine
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Comanda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 1322
        mmTop = 12436
        mmWidth = 21696
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 24340
        mmTop = 12435
        mmWidth = 32808
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Gar'#231'om'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 58208
        mmTop = 12435
        mmWidth = 40000
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Status Comanda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 99745
        mmTop = 12434
        mmWidth = 32000
        BandType = 0
        LayerName = Foreground
      end
    end
    inherited ppDetailBand1: TppDetailBand
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'idcomanda'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 1323
        mmTop = 794
        mmWidth = 21696
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'dtcomanda'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 24342
        mmTop = 794
        mmWidth = 32808
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'nmgarcom'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 58208
        mmTop = 795
        mmWidth = 40000
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'nmcomanda'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 99747
        mmTop = 794
        mmWidth = 32000
        BandType = 4
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
        LayerName = Foreground
      end
      inherited ppLabel3: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLabel4: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppSystemVariable3: TppSystemVariable
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLine3: TppLine
        LayerName = Foreground
      end
    end
  end
end
