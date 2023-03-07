inherited FormCadastroCardapio: TFormCadastroCardapio
  Caption = 'Cadastro Card'#225'pio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited TabSheetConsulta: TTabSheet
      inherited Panel1: TPanel
        inherited LabelBuscar: TLabel
          Anchors = [akTop]
        end
      end
      inherited Panel2: TPanel
        inherited ButtonSelecionar: TButton
          Visible = False
        end
      end
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'idproduto'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmproduto'
            Width = 195
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlvenda'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Visible = False
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
            Width = 96
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
            Width = 67
            Visible = True
          end>
      end
    end
    inherited TabSheetCadastro: TTabSheet
      object Label1: TLabel [0]
        Left = 24
        Top = 8
        Width = 64
        Height = 13
        Caption = 'C'#243'd. Produto'
        FocusControl = cxDBSpinEdit1
      end
      object Label2: TLabel [1]
        Left = 24
        Top = 48
        Width = 68
        Height = 13
        Caption = 'Nome Produto'
        FocusControl = cxDBTextEdit1
      end
      object Label3: TLabel [2]
        Left = 24
        Top = 88
        Width = 72
        Height = 13
        Caption = 'Valor de Venda'
        FocusControl = cxDBCurrencyEdit1
      end
      object Label4: TLabel [3]
        Left = 168
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = cxDBMemo1
      end
      object Label11: TLabel [4]
        Left = 24
        Top = 168
        Width = 41
        Height = 13
        Caption = 'Situa'#231#227'o'
        FocusControl = cxDBTextEdit3
      end
      object Label5: TLabel [5]
        Left = 24
        Top = 128
        Width = 77
        Height = 13
        Caption = 'Nome Categoria'
        FocusControl = cxDBCurrencyEdit1
      end
      object cxDBSpinEdit1: TcxDBSpinEdit
        Left = 24
        Top = 24
        DataBinding.DataField = 'idproduto'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Properties.SpinButtons.Visible = False
        Style.Color = clSkyBlue
        TabOrder = 1
        Width = 121
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 24
        Top = 64
        DataBinding.DataField = 'nmproduto'
        DataBinding.DataSource = DataSource
        TabOrder = 2
        Width = 121
      end
      object cxDBCurrencyEdit1: TcxDBCurrencyEdit
        Left = 24
        Top = 104
        DataBinding.DataField = 'vlvenda'
        DataBinding.DataSource = DataSource
        TabOrder = 3
        Width = 121
      end
      object cxDBMemo1: TcxDBMemo
        Left = 168
        Top = 24
        DataBinding.DataField = 'descricao'
        DataBinding.DataSource = DataSource
        TabOrder = 4
        Height = 101
        Width = 524
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 24
        Top = 141
        DataBinding.DataField = 'nmcategoria'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Style.Color = clSkyBlue
        TabOrder = 5
        Width = 121
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 24
        Top = 184
        DataBinding.DataField = 'nmsituacao'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Style.Color = clSkyBlue
        TabOrder = 7
        Width = 121
      end
      object ButtonBuscarCategoria: TButton
        Left = 168
        Top = 142
        Width = 110
        Height = 25
        Caption = 'Buscar'
        TabOrder = 6
        OnClick = ButtonBuscarCategoriaClick
      end
      object ButtonAlterarSituacaoCardapio: TButton
        Left = 168
        Top = 182
        Width = 110
        Height = 25
        Caption = 'Alterar Situa'#231#227'o'
        TabOrder = 8
        OnClick = ButtonAlterarSituacaoCardapioClick
      end
    end
  end
  inherited FDQuery: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT PRODUTO.IDPRODUTO,'
      '       PRODUTO.NMPRODUTO,'
      '       PRODUTO.VLVENDA,'
      '       PRODUTO.DESCRICAO,'
      '       PRODUTO.IDTIPO,'
      '       PRODUTO.FLSITUACAO,'
      '       TIPO.IDTIPO,'
      '       TIPO.NMCATEGORIA,'
      '       TIPO.FLSITUACAO,'
      '       SITUACAO.IDSITUACAO,'
      '       SITUACAO.NMSITUACAO '
      '  FROM PRODUTO'
      '  JOIN TIPO'
      '    ON PRODUTO.IDTIPO = TIPO.IDTIPO'
      '  JOIN SITUACAO'
      '    ON PRODUTO.FLSITUACAO = SITUACAO.IDSITUACAO')
    Left = 584
    Top = 240
    object FDQueryidproduto: TLargeintField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'idproduto'
      Origin = 'idproduto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuerynmproduto: TWideStringField
      DisplayLabel = 'Nome Produto'
      FieldName = 'nmproduto'
      Origin = 'nmproduto'
      Size = 50
    end
    object FDQueryvlvenda: TBCDField
      Alignment = taLeftJustify
      DisplayLabel = 'Valor de Venda'
      FieldName = 'vlvenda'
      Origin = 'vlvenda'
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQuerydescricao: TWideMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'descricao'
      BlobType = ftWideMemo
    end
    object FDQueryidtipo: TLargeintField
      FieldName = 'idtipo'
      Origin = 'idtipo'
    end
    object FDQueryflsituacao: TLargeintField
      FieldName = 'flsituacao'
      Origin = 'flsituacao'
    end
    object FDQueryidtipo_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idtipo_1'
      Origin = 'idtipo'
    end
    object FDQuerynmcategoria: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome Categoria'
      FieldName = 'nmcategoria'
      Origin = 'nmcategoria'
      Size = 50
    end
    object FDQueryflsituacao_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'flsituacao_1'
      Origin = 'flsituacao'
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
  inherited DataSource: TDataSource
    Left = 632
    Top = 288
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
  inherited ppReport1: TppReport
    DataPipelineName = 'ppDBPipeline1'
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        Caption = 'Card'#225'pio'
        mmLeft = 86254
        mmWidth = 24077
        LayerName = Foreground
      end
      inherited ppLine1: TppLine
        LayerName = Foreground
      end
      inherited ppLine2: TppLine
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 12697
        mmTop = 12699
        mmWidth = 80000
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 95778
        mmTop = 12964
        mmWidth = 25000
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 121970
        mmTop = 12699
        mmWidth = 50000
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Situa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 172773
        mmTop = 12700
        mmWidth = 22225
        BandType = 0
        LayerName = Foreground
      end
    end
    inherited ppDetailBand1: TppDetailBand
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'idproduto'
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
        mmTop = 1323
        mmWidth = 10000
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
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
        mmLeft = 12697
        mmTop = 1323
        mmWidth = 80000
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
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
        mmLeft = 95779
        mmTop = 1323
        mmWidth = 25000
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
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
        mmLeft = 121970
        mmTop = 1323
        mmWidth = 50000
        BandType = 4
        LayerName = Foreground
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
        mmLeft = 172770
        mmTop = 1323
        mmWidth = 22225
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
    inherited ppSummaryBand1: TppSummaryBand
      inherited ppLabeltotalregistro: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
    end
  end
end
