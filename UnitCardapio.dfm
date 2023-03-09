inherited FormCardapio: TFormCardapio
  Caption = 'Cardapio'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel [0]
      Left = 16
      Top = 11
      Width = 47
      Height = 13
      Caption = 'Categoria'
    end
    object Label2: TLabel [1]
      Left = 316
      Top = 11
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object Label3: TLabel [2]
      Left = 16
      Top = 43
      Width = 65
      Height = 13
      Caption = 'Situa'#231#227'o Cat.'
    end
    object Label4: TLabel [3]
      Left = 316
      Top = 43
      Width = 70
      Height = 13
      Caption = 'Situa'#231#227'o Prod.'
    end
    inherited ButtonBuscar: TButton
      Visible = False
    end
    object EditProduto: TEdit
      Left = 392
      Top = 8
      Width = 130
      Height = 21
      Color = clSkyBlue
      ReadOnly = True
      TabOrder = 1
    end
    object ComboBoxCategoria: TComboBox
      Left = 88
      Top = 8
      Width = 193
      Height = 21
      TabOrder = 2
      OnSelect = ComboBoxCategoriaSelect
    end
    object ComboBoxSituacaoCat: TComboBox
      Left = 88
      Top = 40
      Width = 193
      Height = 21
      TabOrder = 3
      OnSelect = ComboBoxSituacaoCatSelect
    end
    object ComboBoxSituacaoProd: TComboBox
      Left = 392
      Top = 40
      Width = 193
      Height = 21
      TabOrder = 4
      OnSelect = ComboBoxSituacaoProdSelect
    end
    object ButtonBuscarProduto: TButton
      Left = 528
      Top = 6
      Width = 57
      Height = 25
      Caption = 'Buscar'
      TabOrder = 5
      OnClick = ButtonBuscarProdutoClick
    end
  end
  inherited DBGridRelatorio: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'idproduto'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmproduto'
        Width = 248
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlvenda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idtipo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'flsituacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'idtipo_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'nmcategoria'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'flsituacao_1'
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
        Width = 54
        Visible = True
      end>
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      '  SELECT PRODUTO.IDPRODUTO,'
      '         PRODUTO.NMPRODUTO,'
      '         PRODUTO.VLVENDA,'
      '         PRODUTO.DESCRICAO,'
      '         PRODUTO.IDTIPO,'
      '         PRODUTO.FLSITUACAO,'
      '         TIPO.IDTIPO,'
      '         TIPO.NMCATEGORIA,'
      '         TIPO.FLSITUACAO,'
      '         SITUACAO.IDSITUACAO,'
      '         SITUACAO.NMSITUACAO '
      '    FROM PRODUTO'
      '    JOIN TIPO'
      '      ON PRODUTO.IDTIPO = TIPO.IDTIPO'
      '    JOIN SITUACAO'
      '      ON PRODUTO.FLSITUACAO = SITUACAO.IDSITUACAO'
      '   WHERE 1=1')
    object FDQueryRelatorioidproduto: TLargeintField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'idproduto'
      Origin = 'idproduto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryRelatorionmproduto: TWideStringField
      DisplayLabel = 'Produto'
      FieldName = 'nmproduto'
      Origin = 'nmproduto'
      Size = 50
    end
    object FDQueryRelatoriovlvenda: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'vlvenda'
      Origin = 'vlvenda'
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQueryRelatoriodescricao: TWideMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'descricao'
      BlobType = ftWideMemo
    end
    object FDQueryRelatorioidtipo: TLargeintField
      FieldName = 'idtipo'
      Origin = 'idtipo'
    end
    object FDQueryRelatorioflsituacao: TLargeintField
      FieldName = 'flsituacao'
      Origin = 'flsituacao'
    end
    object FDQueryRelatorioidtipo_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idtipo_1'
      Origin = 'idtipo'
    end
    object FDQueryRelatorionmcategoria: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Categoria'
      FieldName = 'nmcategoria'
      Origin = 'nmcategoria'
      Size = 50
    end
    object FDQueryRelatorioflsituacao_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'flsituacao_1'
      Origin = 'flsituacao'
    end
    object FDQueryRelatorioidsituacao: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idsituacao'
      Origin = 'idsituacao'
    end
    object FDQueryRelatorionmsituacao: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'nmsituacao'
      Origin = 'nmsituacao'
      Size = 50
    end
  end
  inherited ppReport1: TppReport
    DataPipelineName = 'ppDBPipeline1'
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        Caption = 'Card'#225'pio'
        mmLeft = 85990
        mmWidth = 24077
        LayerName = Foreground
      end
      inherited ppLine2: TppLine [1]
        Visible = False
        LayerName = Foreground
      end
      inherited ppLine1: TppLine [2]
        Visible = False
        LayerName = Foreground
      end
    end
    inherited ppDetailBand1: TppDetailBand
      mmHeight = 18256
      object ppLabel5: TppLabel
        UserName = 'Label4'
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 15346
        mmTop = 1323
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'idproduto'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 10319
        mmTop = 1323
        mmWidth = 5027
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
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
        mmLeft = 17992
        mmTop = 1323
        mmWidth = 43656
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
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
        mmLeft = 62442
        mmTop = 1323
        mmWidth = 21167
        BandType = 4
        LayerName = Foreground
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'descricao'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 16404
        mmLeft = 85461
        mmTop = 1323
        mmWidth = 88636
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
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
        mmLeft = 175419
        mmTop = 1323
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground
      end
    end
    inherited ppFooterBand1: TppFooterBand
      inherited ppLine3: TppLine
        LayerName = Foreground
      end
      inherited ppLabel2: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppSystemVariable1: TppSystemVariable
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
      inherited ppLabel3: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppSystemVariable2: TppSystemVariable
        SaveOrder = -1
        LayerName = Foreground
      end
    end
    inherited ppSummaryBand1: TppSummaryBand
      inherited ppLabeltexte: TppLabel
        SaveOrder = -1
        Visible = False
        LayerName = Foreground
      end
      inherited ppMemofiltro: TppMemo
        SaveOrder = -1
        Visible = False
        LayerName = Foreground
      end
      inherited ppLine4: TppLine
        Visible = False
        LayerName = Foreground
      end
      inherited ppLabeltotalregistro: TppLabel
        SaveOrder = -1
        Visible = False
        LayerName = Foreground
      end
    end
    object ppGroup1: TppGroup [4]
      BreakName = 'nmcategoria'
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
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'nmcategoria'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4763
          mmLeft = 2115
          mmTop = 1323
          mmWidth = 159809
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
      FieldAlias = 'idproduto'
      FieldName = 'idproduto'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'nmproduto'
      FieldName = 'nmproduto'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'vlvenda'
      FieldName = 'vlvenda'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 11
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'descricao'
      FieldName = 'descricao'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'idtipo'
      FieldName = 'idtipo'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'flsituacao'
      FieldName = 'flsituacao'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'idtipo_1'
      FieldName = 'idtipo_1'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'nmcategoria'
      FieldName = 'nmcategoria'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'flsituacao_1'
      FieldName = 'flsituacao_1'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'idsituacao'
      FieldName = 'idsituacao'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'nmsituacao'
      FieldName = 'nmsituacao'
      FieldLength = 50
      DisplayWidth = 50
      Position = 10
    end
  end
end
