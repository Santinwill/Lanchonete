inherited FormRelatorioDetalhesPagamento: TFormRelatorioDetalhesPagamento
  Caption = 'Relatorio Detalhes de Pagamento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel [0]
      Left = 296
      Top = 43
      Width = 96
      Height = 13
      Caption = 'C'#243'digo da Comanda'
    end
    inherited ButtonBuscar: TButton
      Top = 42
      OnClick = ButtonBuscarClick
      ExplicitTop = 42
    end
    object EditCodigoComanda: TEdit
      Left = 402
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT FORMAPGMT.NMFORMAPGMT,'
      '       FORMAPGMTVALORES.VLPAGO'
      '  FROM FORMAPGMT'
      '  JOIN FORMAPGMTVALORES'
      '    ON FORMAPGMT.IDFORMAPGMT = FORMAPGMTVALORES.IDFORMAPGMT'
      '  WHERE FORMAPGMTVALORES.IDCOMANDA = :IDCOMANDA')
    ParamData = <
      item
        Name = 'IDCOMANDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryRelatorionmformapgmt: TWideStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'nmformapgmt'
      Origin = 'nmformapgmt'
    end
    object FDQueryRelatoriovlpago: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Pago'
      FieldName = 'vlpago'
      Origin = 'vlpago'
      currency = True
      Precision = 10
      Size = 2
    end
  end
  inherited ppReport1: TppReport
    DataPipelineName = 'ppDBPipeline1'
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        Caption = 'Detalhes Pagamento Por Comanda'
        mmLeft = 53711
        mmWidth = 92075
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
        Caption = 'Forma Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 1301
        mmTop = 12172
        mmWidth = 55298
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 57416
        mmTop = 12171
        mmWidth = 20000
        BandType = 0
        LayerName = Foreground
      end
    end
    inherited ppDetailBand1: TppDetailBand
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'nmformapgmt'
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
        mmTop = 1323
        mmWidth = 55298
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'vlpago'
        DataPipeline = ppDBPipeline1
        DisplayFormat = 'R$#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 57416
        mmTop = 1323
        mmWidth = 20000
        BandType = 4
        LayerName = Foreground
      end
    end
    inherited ppFooterBand1: TppFooterBand
      inherited ppLine3: TppLine [0]
        LayerName = Foreground
      end
      inherited ppSystemVariable1: TppSystemVariable [1]
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLabel2: TppLabel [2]
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppSystemVariable2: TppSystemVariable [3]
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLabel3: TppLabel [4]
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLabel4: TppLabel [5]
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppSystemVariable3: TppSystemVariable [6]
        SaveOrder = -1
        LayerName = Foreground
      end
    end
  end
  inherited ppDBPipeline1: TppDBPipeline
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'nmformapgmt'
      FieldName = 'nmformapgmt'
      FieldLength = 20
      DisplayWidth = 20
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'vlpago'
      FieldName = 'vlpago'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 11
      Position = 1
    end
  end
end
