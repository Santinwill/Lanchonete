inherited FormRelatorioItensComanda: TFormRelatorioItensComanda
  Caption = 'Relat'#243'rio Itens Comanda'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel [0]
      Left = 320
      Top = 43
      Width = 71
      Height = 13
      Caption = 'C'#243'd. Comanda'
    end
    inherited ButtonBuscar: TButton
      OnClick = ButtonBuscarClick
    end
    object EditCodigoComanda: TEdit
      Left = 400
      Top = 40
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
  end
  inherited DBGridRelatorio: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'nmproduto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlvenda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtaddcomanda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmstatusprodutocomanda'
        Visible = True
      end>
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      '  SELECT PRODUTO.NMPRODUTO,'
      '         ITENCOMANDA.VLVENDA,'
      '         ITENCOMANDA.DTADDCOMANDA,'
      '         STATUSPRODUTOCOMANDA.NMSTATUSPRODUTOCOMANDA '
      '    FROM PRODUTO'
      '    JOIN ITENCOMANDA '
      '      ON PRODUTO.IDPRODUTO = ITENCOMANDA.IDPRODUTO'
      '    JOIN STATUSPRODUTOCOMANDA'
      
        '      ON ITENCOMANDA.IDSITUACAOPRODUTOCOMANDA = STATUSPRODUTOCOM' +
        'ANDA.IDSITUACAOPRODUTOCOMANDA '
      '   WHERE ITENCOMANDA.IDCOMANDA = :IDCOMANDA'
      'ORDER BY DTADDCOMANDA')
    ParamData = <
      item
        Name = 'IDCOMANDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryRelatorionmproduto: TWideStringField
      DisplayLabel = 'Produto'
      FieldName = 'nmproduto'
      Origin = 'nmproduto'
      Size = 50
    end
    object FDQueryRelatoriovlvenda: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor'
      FieldName = 'vlvenda'
      Origin = 'vlvenda'
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQueryRelatoriodtaddcomanda: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data add Comanda'
      FieldName = 'dtaddcomanda'
      Origin = 'dtaddcomanda'
    end
    object FDQueryRelatorionmstatusprodutocomanda: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'nmstatusprodutocomanda'
      Origin = 'nmstatusprodutocomanda'
      Size = 50
    end
  end
  inherited ppReport1: TppReport
    DataPipelineName = 'ppDBPipeline1'
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        Caption = 'Itens Por Comanda'
        mmLeft = 74083
        mmWidth = 50271
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
        mmLeft = 1588
        mmTop = 12435
        mmWidth = 50000
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
        mmLeft = 52388
        mmTop = 12437
        mmWidth = 17000
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Situa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 111921
        mmTop = 12435
        mmWidth = 48683
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Dat Add Comanda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 73292
        mmTop = 12437
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
        mmTop = 529
        mmWidth = 50000
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'vlvenda'
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
        mmLeft = 52389
        mmTop = 529
        mmWidth = 17000
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'nmstatusprodutocomanda'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 111921
        mmTop = 529
        mmWidth = 50000
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'dtaddcomanda'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 73292
        mmTop = 529
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
      FieldAlias = 'nmproduto'
      FieldName = 'nmproduto'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'vlvenda'
      FieldName = 'vlvenda'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 11
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'dtaddcomanda'
      FieldName = 'dtaddcomanda'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'nmstatusprodutocomanda'
      FieldName = 'nmstatusprodutocomanda'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
  end
end
