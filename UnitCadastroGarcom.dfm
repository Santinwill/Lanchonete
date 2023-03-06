inherited FormCadastroGarcom: TFormCadastroGarcom
  Caption = 'Cadastro Gar'#231'om'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = TabSheetCadastro
    inherited TabSheetConsulta: TTabSheet
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
            FieldName = 'idgarcom'
            Width = 64
            Visible = True
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
            FieldName = 'idsituacao'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'nmsituacao'
            Width = 87
            Visible = True
          end>
      end
    end
    inherited TabSheetCadastro: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 16
        Width = 62
        Height = 13
        Caption = 'C'#243'd. Gar'#231'om'
        FocusControl = cxDBSpinEdit1
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 56
        Width = 81
        Height = 13
        Caption = 'Nome do Gar'#231'om'
        FocusControl = cxDBTextEdit1
      end
      object Label5: TLabel [2]
        Left = 16
        Top = 96
        Width = 41
        Height = 13
        Caption = 'Situa'#231#227'o'
        FocusControl = cxDBTextEdit2
      end
      object cxDBSpinEdit1: TcxDBSpinEdit
        Left = 16
        Top = 32
        DataBinding.DataField = 'idgarcom'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Properties.SpinButtons.Visible = False
        Style.Color = clSkyBlue
        TabOrder = 1
        Width = 121
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 16
        Top = 72
        DataBinding.DataField = 'nmgarcom'
        DataBinding.DataSource = DataSource
        TabOrder = 2
        Width = 121
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 16
        Top = 112
        DataBinding.DataField = 'nmsituacao'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Style.Color = clSkyBlue
        TabOrder = 3
        Width = 121
      end
      object ButtonAlterarSituacaoGarcom: TButton
        Left = 160
        Top = 110
        Width = 100
        Height = 25
        Caption = 'Alterar Situa'#231#227'o'
        TabOrder = 4
        OnClick = ButtonAlterarSituacaoGarcomClick
      end
    end
  end
  inherited FDQuery: TFDQuery
    Active = True
    SQL.Strings = (
      '  SELECT GARCOM.IDGARCOM,'
      '         GARCOM.NMGARCOM,'
      '         GARCOM.IDSTATUSGARCOM,'
      '         SITUACAO.IDSITUACAO,'
      '         SITUACAO.NMSITUACAO'
      '    FROM GARCOM'
      '    JOIN SITUACAO'
      '      ON GARCOM.IDSTATUSGARCOM = SITUACAO.IDSITUACAO')
    object FDQueryidgarcom: TLargeintField
      DisplayLabel = 'C'#243'd. Gar'#231'om'
      FieldName = 'idgarcom'
      Origin = 'idgarcom'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuerynmgarcom: TWideStringField
      DisplayLabel = 'Nome do Gar'#231'om'
      FieldName = 'nmgarcom'
      Origin = 'nmgarcom'
      Size = 50
    end
    object FDQueryidstatusgarcom: TLargeintField
      FieldName = 'idstatusgarcom'
      Origin = 'idstatusgarcom'
    end
    object FDQueryidsituacao: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idsituacao'
      Origin = 'idsituacao'
    end
    object FDQuerynmsituacao: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'nmsituacao'
      Origin = 'nmsituacao'
      Size = 50
    end
  end
  inherited ppDBPipeline1: TppDBPipeline
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'idgarcom'
      FieldName = 'idgarcom'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'nmgarcom'
      FieldName = 'nmgarcom'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'idstatusgarcom'
      FieldName = 'idstatusgarcom'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'idsituacao'
      FieldName = 'idsituacao'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'nmsituacao'
      FieldName = 'nmsituacao'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
  end
  inherited ppReport1: TppReport
    DataPipelineName = 'ppDBPipeline1'
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        Caption = 'Gar'#231'om'
        mmLeft = 87842
        mmWidth = 20902
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
        Caption = 'C'#243'd.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 1323
        mmTop = 12436
        mmWidth = 13000
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Gar'#231'om'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 15346
        mmTop = 12433
        mmWidth = 70000
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Situa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 87313
        mmTop = 12435
        mmWidth = 50000
        BandType = 0
        LayerName = Foreground
      end
    end
    inherited ppDetailBand1: TppDetailBand
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'idgarcom'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 1323
        mmTop = 529
        mmWidth = 13000
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
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
        mmLeft = 15346
        mmTop = 529
        mmWidth = 70000
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'nmsituacao'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 87842
        mmTop = 529
        mmWidth = 50000
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
