inherited FormRelatorioComandaData: TFormRelatorioComandaData
  Caption = 'Relatorio Comandas por Data'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label2: TLabel [0]
      Left = 8
      Top = 48
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label3: TLabel [1]
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
      Date = 44966.376122523150000000
      Time = 44966.376122523150000000
      TabOrder = 1
    end
    object DateTimePickerFinal: TDateTimePicker
      Left = 336
      Top = 40
      Width = 186
      Height = 21
      Date = 44966.376160509260000000
      Time = 44966.376160509260000000
      TabOrder = 2
    end
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      '  SELECT COMANDA.IDCOMANDA,'
      '         GARCOM.NMGARCOM,'
      '         COMANDA.DTCOMANDA '
      '    FROM COMANDA'
      '    JOIN GARCOM'
      '      ON COMANDA.IDGARCOM = GARCOM.IDGARCOM'
      '   WHERE COMANDA.DTCOMANDA'
      ' BETWEEN :DTINICIO'
      '     AND :DTFIM'
      'ORDER BY GARCOM.NMGARCOM')
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
    object FDQueryRelatorioidcomanda: TLargeintField
      DisplayLabel = 'C'#243'digo Comanda'
      FieldName = 'idcomanda'
      Origin = 'idcomanda'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryRelatorionmgarcom: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Gar'#231'om'
      FieldName = 'nmgarcom'
      Origin = 'nmgarcom'
      Size = 50
    end
    object FDQueryRelatoriodtcomanda: TDateField
      DisplayLabel = 'Data Comanda'
      FieldName = 'dtcomanda'
      Origin = 'dtcomanda'
    end
  end
  inherited ppReport1: TppReport
    DataPipelineName = 'ppDBPipeline1'
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        Caption = 'Relat'#243'rio Comandas Por Data'
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
        Caption = 'C'#243'd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 21961
        mmTop = 12700
        mmWidth = 12000
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Data Comanda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 34380
        mmTop = 12436
        mmWidth = 30000
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
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 21961
        mmTop = 265
        mmWidth = 12000
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
        mmLeft = 34393
        mmTop = 265
        mmWidth = 30000
        BandType = 4
        LayerName = Foreground
      end
    end
    inherited ppFooterBand1: TppFooterBand
      inherited ppLine3: TppLine
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
    inherited ppSummaryBand1: TppSummaryBand
      inherited ppLabeltexte: TppLabel
        UserName = 'Label5'
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
        UserName = 'Label6'
        SaveOrder = -1
        LayerName = Foreground
      end
    end
    object ppGroup1: TppGroup [4]
      BreakName = 'nmgarcom'
      DataPipeline = ppDBPipeline1
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
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
          mmLeft = 21432
          mmTop = 1588
          mmWidth = 60061
          BandType = 3
          GroupNo = 0
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
          mmLeft = 2910
          mmTop = 1588
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
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
      FieldAlias = 'nmgarcom'
      FieldName = 'nmgarcom'
      FieldLength = 50
      DisplayWidth = 50
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
  end
end
