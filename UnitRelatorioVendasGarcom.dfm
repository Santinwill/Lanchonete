inherited FormRelatorioVendasGarcom: TFormRelatorioVendasGarcom
  Caption = 'Relatorio Vendas Garcom'
  ExplicitWidth = 628
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel [0]
      Left = 8
      Top = 11
      Width = 36
      Height = 13
      Caption = 'Gar'#231'om'
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 43
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label3: TLabel [2]
      Left = 272
      Top = 43
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    inherited ButtonBuscar: TButton
      OnClick = ButtonBuscarClick
    end
    object EditGarcom: TEdit
      Left = 72
      Top = 8
      Width = 186
      Height = 21
      Color = clSkyBlue
      ReadOnly = True
      TabOrder = 1
    end
    object DateTimePickerInicial: TDateTimePicker
      Left = 72
      Top = 40
      Width = 186
      Height = 21
      Date = 44967.448804791670000000
      Time = 44967.448804791670000000
      TabOrder = 2
    end
    object DateTimePickerFinal: TDateTimePicker
      Left = 336
      Top = 40
      Width = 186
      Height = 21
      Date = 44967.449450254630000000
      Time = 44967.449450254630000000
      TabOrder = 3
    end
    object ButtonGarcom: TButton
      Left = 264
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 4
      OnClick = ButtonGarcomClick
    end
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      '  SELECT GARCOM.NMGARCOM,'
      '         PRODUTO.NMPRODUTO,'
      '         COUNT(ITENCOMANDA.IDPRODUTO) AS QUANTIDADE,'
      '         COMANDA.DTCOMANDA'
      '    FROM GARCOM'
      '    JOIN COMANDA'
      '      ON GARCOM.IDGARCOM = COMANDA.IDGARCOM'
      '    JOIN ITENCOMANDA'
      '      ON COMANDA.IDCOMANDA = ITENCOMANDA.IDCOMANDA'
      '    JOIN PRODUTO'
      '      ON ITENCOMANDA.IDPRODUTO = PRODUTO.IDPRODUTO '
      '   WHERE COMANDA.DTCOMANDA  '
      ' BETWEEN :DTINICIO'
      '     AND :DTFIM '
      '     AND GARCOM.IDGARCOM  = :IDGARCOM'
      '     AND ITENCOMANDA.IDSITUACAOPRODUTOCOMANDA <> 0'
      'GROUP BY PRODUTO.NMPRODUTO,'
      '         GARCOM.NMGARCOM,'
      '         COMANDA.DTCOMANDA'
      'ORDER BY COMANDA.DTCOMANDA')
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
      end
      item
        Name = 'IDGARCOM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryRelatorionmgarcom: TWideStringField
      DisplayLabel = 'Gar'#231'om'
      DisplayWidth = 30
      FieldName = 'nmgarcom'
      Origin = 'nmgarcom'
      Size = 50
    end
    object FDQueryRelatorionmproduto: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Item'
      DisplayWidth = 40
      FieldName = 'nmproduto'
      Origin = 'nmproduto'
      Size = 50
    end
    object FDQueryRelatorioquantidade: TLargeintField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'quantidade'
      Origin = 'quantidade'
      ReadOnly = True
    end
    object FDQueryRelatoriodtcomanda: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data'
      DisplayWidth = 15
      FieldName = 'dtcomanda'
      Origin = 'dtcomanda'
    end
  end
  inherited ppReport1: TppReport
    DataPipelineName = 'ppDBPipeline1'
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        Caption = 'Relat'#243'rio Vendas Por Gar'#231'om'
        mmLeft = 60325
        mmWidth = 78317
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
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 1323
        mmTop = 12700
        mmWidth = 60000
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 62443
        mmTop = 12698
        mmWidth = 22000
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
        mmLeft = 85991
        mmTop = 12700
        mmWidth = 35000
        BandType = 0
        LayerName = Foreground
      end
    end
    inherited ppDetailBand1: TppDetailBand
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'nmproduto'
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
        mmWidth = 60000
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'quantidade'
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
        mmLeft = 62444
        mmTop = 1058
        mmWidth = 22000
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
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
        mmLeft = 85991
        mmTop = 1058
        mmWidth = 35000
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
  inherited ppDBPipeline1: TppDBPipeline
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'nmgarcom'
      FieldName = 'nmgarcom'
      FieldLength = 50
      DisplayWidth = 30
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'nmproduto'
      FieldName = 'nmproduto'
      FieldLength = 50
      DisplayWidth = 40
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'quantidade'
      FieldName = 'quantidade'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'dtcomanda'
      FieldName = 'dtcomanda'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 15
      Position = 3
    end
  end
end
