inherited FormRelatorioItens: TFormRelatorioItens
  Caption = 'Relatorio Itens'
  OnCreate = FormCreate
  ExplicitWidth = 628
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object LabelIten: TLabel [0]
      Left = 1
      Top = 1
      Width = 610
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'Todos os Itens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 95
    end
    inherited ButtonBuscar: TButton
      OnClick = ButtonBuscarClick
    end
    object CheckBoxAtivo: TCheckBox
      Left = 224
      Top = 40
      Width = 97
      Height = 17
      Anchors = [akLeft]
      Caption = 'Itens Ativos'
      TabOrder = 1
    end
    object CheckBoxInativos: TCheckBox
      Left = 312
      Top = 40
      Width = 97
      Height = 17
      Anchors = [akLeft]
      Caption = 'Itens Inativos'
      TabOrder = 2
    end
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      '  SELECT PRODUTO.NMPRODUTO, '
      '         PRODUTO.VLVENDA'
      '    FROM PRODUTO '
      '    JOIN TIPO'
      '      ON PRODUTO.IDTIPO = TIPO.IDTIPO ')
    object FDQueryRelatorionmproduto: TWideStringField
      DisplayLabel = 'Item'
      FieldName = 'nmproduto'
      Origin = 'nmproduto'
      Size = 50
    end
    object FDQueryRelatoriovlvenda: TBCDField
      DisplayLabel = 'Valor Venda'
      FieldName = 'vlvenda'
      Origin = 'vlvenda'
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
        mmLeft = 1324
        mmTop = 12700
        mmWidth = 63236
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
        mmLeft = 64294
        mmTop = 12700
        mmWidth = 32544
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
        mmHeight = 6615
        mmLeft = 1323
        mmTop = 1323
        mmWidth = 63236
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
        mmLeft = 64294
        mmTop = 1323
        mmWidth = 32544
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
  end
end
