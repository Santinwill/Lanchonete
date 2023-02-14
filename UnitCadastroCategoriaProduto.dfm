inherited FormCadastroCategoriaProduto: TFormCadastroCategoriaProduto
  Caption = 'Cadastro de Categoria de Produto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited TabSheetConsulta: TTabSheet
      inherited Panel2: TPanel
        inherited ButtonImprimir: TButton
          Visible = False
        end
        inherited ButtonSelecionar: TButton
          Visible = False
        end
      end
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'idtipo'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmcategoria'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmsituacao'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'flsituacao'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'idsituacao'
            Visible = False
          end>
      end
    end
    inherited TabSheetCadastro: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel [0]
        Left = 16
        Top = 16
        Width = 23
        Height = 13
        Caption = 'C'#243'd.'
        FocusControl = cxDBSpinEdit1
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 56
        Width = 92
        Height = 13
        Caption = 'Nome da Categoria'
        FocusControl = cxDBTextEdit1
      end
      object Label3: TLabel [2]
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
        DataBinding.DataField = 'idtipo'
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
        DataBinding.DataField = 'nmcategoria'
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
      object ButtonAlterarSituacao: TButton
        Left = 160
        Top = 110
        Width = 100
        Height = 25
        Caption = 'Alterar Situa'#231#227'o'
        TabOrder = 4
        OnClick = ButtonAlterarSituacaoClick
      end
    end
  end
  inherited FDQuery: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT TIPO.IDTIPO,'
      '       TIPO.NMCATEGORIA,'
      '       TIPO.FLSITUACAO,'
      '       SITUACAO.IDSITUACAO,'
      '       SITUACAO.NMSITUACAO'
      '  FROM TIPO'
      '  JOIN SITUACAO'
      '    ON TIPO.FLSITUACAO = SITUACAO.IDSITUACAO'
      '       ')
    object FDQueryidtipo: TLargeintField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'idtipo'
      Origin = 'idtipo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuerynmcategoria: TWideStringField
      DisplayLabel = 'Nome da Categoria'
      FieldName = 'nmcategoria'
      Origin = 'nmcategoria'
      Size = 50
    end
    object FDQuerynmsituacao: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'nmsituacao'
      Origin = 'nmsituacao'
      Size = 50
    end
    object FDQueryflsituacao: TLargeintField
      FieldName = 'flsituacao'
      Origin = 'flsituacao'
    end
    object FDQueryidsituacao: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idsituacao'
      Origin = 'idsituacao'
    end
  end
end
