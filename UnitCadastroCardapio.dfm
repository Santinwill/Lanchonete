inherited FormCadastroCardapio: TFormCadastroCardapio
  Caption = 'Cadastro Card'#225'pio'
  ExplicitWidth = 730
  ExplicitHeight = 518
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
        Top = 144
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
end
