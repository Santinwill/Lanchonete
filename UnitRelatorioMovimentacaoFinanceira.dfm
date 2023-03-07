inherited FormRelatorioMovimentacaoFinanceira: TFormRelatorioMovimentacaoFinanceira
  Caption = 'Relatorio Movimenta'#231#227'o Financeira'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel [0]
      Left = 8
      Top = 48
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel [1]
      Left = 272
      Top = 48
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    inherited ButtonBuscar: TButton
      OnClick = ButtonBuscarClick
    end
    object DateTimePickerInicio: TDateTimePicker
      Left = 72
      Top = 40
      Width = 186
      Height = 21
      Date = 44967.351722824070000000
      Time = 44967.351722824070000000
      TabOrder = 1
    end
    object DateTimePickerFinal: TDateTimePicker
      Left = 336
      Top = 40
      Width = 186
      Height = 21
      Date = 44967.351919317130000000
      Time = 44967.351919317130000000
      TabOrder = 2
    end
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      '   SELECT FORMAPGMT.NMFORMAPGMT,'
      '         SUM(FORMAPGMTVALORES.VLPAGO) AS TOTAL,'
      '         FORMAPGMTVALORES.DATAPAGMT '
      '    FROM FORMAPGMT'
      '    JOIN FORMAPGMTVALORES'
      '      ON FORMAPGMT.IDFORMAPGMT = FORMAPGMTVALORES.IDFORMAPGMT'
      '   WHERE FORMAPGMTVALORES.DATAPAGMT '
      ' BETWEEN :DTINICIO'
      '     AND :DTFIM '
      'GROUP BY FORMAPGMT.NMFORMAPGMT,'
      '         FORMAPGMTVALORES.DATAPAGMT')
    ParamData = <
      item
        Name = 'DTINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DTFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryRelatorionmformapgmt: TWideStringField
      DisplayLabel = 'Forma de Pagamento'
      DisplayWidth = 24
      FieldName = 'nmformapgmt'
      Origin = 'nmformapgmt'
    end
    object FDQueryRelatoriototal: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Total'
      DisplayWidth = 20
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
      currency = True
      Precision = 64
      Size = 0
    end
    object FDQueryRelatoriodatapagmt: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data Pagamento'
      DisplayWidth = 16
      FieldName = 'datapagmt'
      Origin = 'datapagmt'
    end
  end
  inherited ppReport1: TppReport
    DataPipelineName = 'ppDBPipeline1'
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        Caption = 'Relat'#243'rio Movimenta'#231#227'o Financeira Por Per'#237'odo'
        mmLeft = 37306
        mmWidth = 127530
        LayerName = Foreground
      end
      inherited ppLine1: TppLine
        LayerName = Foreground
      end
      inherited ppLine2: TppLine
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Forma de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 1323
        mmTop = 12437
        mmWidth = 44715
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 45773
        mmTop = 12435
        mmWidth = 32544
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 78052
        mmTop = 12435
        mmWidth = 33867
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
        mmTop = 1058
        mmWidth = 44715
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'total'
        DataPipeline = ppDBPipeline1
        DisplayFormat = 'R$#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 45773
        mmTop = 1058
        mmWidth = 32544
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'datapagmt'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 78052
        mmTop = 1058
        mmWidth = 33867
        BandType = 4
        LayerName = Foreground
      end
    end
    inherited ppFooterBand1: TppFooterBand
      inherited ppSystemVariable1: TppSystemVariable [0]
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLabel2: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppSystemVariable2: TppSystemVariable [2]
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLabel3: TppLabel [3]
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLabel4: TppLabel [4]
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppSystemVariable3: TppSystemVariable [5]
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLine3: TppLine [6]
        LayerName = Foreground
      end
    end
    inherited ppSummaryBand1: TppSummaryBand
      inherited ppLabeltexte: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppMemofiltro: TppMemo
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLine4: TppLine
        LayerName = Foreground
      end
      inherited ppLabeltotalregistro: TppLabel
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
      DisplayWidth = 24
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'total'
      FieldName = 'total'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'datapagmt'
      FieldName = 'datapagmt'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 16
      Position = 2
    end
  end
end
