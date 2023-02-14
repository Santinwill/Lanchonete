inherited FormCadastroFormaPagamento: TFormCadastroFormaPagamento
  Caption = 'Cadastro Forma de Pagamento'
  ExplicitWidth = 730
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = TabSheetCadastro
    inherited TabSheetConsulta: TTabSheet
      inherited Panel2: TPanel
        inherited ButtonSelecionar: TButton
          Visible = False
        end
      end
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'idformapgmt'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmformapgmt'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idstatusformapgmt'
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
            Visible = True
          end>
      end
    end
    inherited TabSheetCadastro: TTabSheet
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
        Width = 102
        Height = 13
        Caption = 'Forma de Pagamento'
        FocusControl = cxDBTextEdit1
      end
      object Label5: TLabel [2]
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
        DataBinding.DataField = 'idformapgmt'
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
        DataBinding.DataField = 'nmformapgmt'
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
      object ButtonAlterarSituacaoFormpgmt: TButton
        Left = 160
        Top = 110
        Width = 100
        Height = 25
        Caption = 'Alterar Situa'#231#227'o'
        TabOrder = 4
        OnClick = ButtonAlterarSituacaoFormpgmtClick
      end
    end
  end
  inherited FDQuery: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT FORMAPGMT.IDFORMAPGMT,'
      '       FORMAPGMT.NMFORMAPGMT,'
      '       FORMAPGMT.IDSTATUSFORMAPGMT,'
      '       SITUACAO.IDSITUACAO,'
      '       SITUACAO.NMSITUACAO'
      '  FROM FORMAPGMT'
      '  JOIN SITUACAO'
      '    ON FORMAPGMT.IDSTATUSFORMAPGMT = SITUACAO.IDSITUACAO')
    object FDQueryidformapgmt: TLargeintField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'idformapgmt'
      Origin = 'idformapgmt'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuerynmformapgmt: TWideStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'nmformapgmt'
      Origin = 'nmformapgmt'
    end
    object FDQueryidstatusformapgmt: TLargeintField
      FieldName = 'idstatusformapgmt'
      Origin = 'idstatusformapgmt'
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
end
