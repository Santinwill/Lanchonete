inherited FormCadastroGarcom: TFormCadastroGarcom
  Caption = 'Cadastro Gar'#231'om'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited TabSheetConsulta: TTabSheet
      inherited Panel2: TPanel
        inherited ButtonSelecionar: TButton
          Left = 533
          Visible = False
          ExplicitLeft = 533
        end
      end
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'idgarcom'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmgarcom'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idstatusgarcom'
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
            Width = 87
            Visible = True
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
        Width = 62
        Height = 13
        Caption = 'C'#243'd. Gar'#231'om'
        FocusControl = cxDBSpinEdit1
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 56
        Width = 81
        Height = 13
        Caption = 'Nome do Gar'#231'om'
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
        DataBinding.DataField = 'idgarcom'
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
        DataBinding.DataField = 'nmgarcom'
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
      object ButtonAlterarSituacaoGarcom: TButton
        Left = 160
        Top = 110
        Width = 100
        Height = 25
        Caption = 'Alterar Situa'#231#227'o'
        TabOrder = 4
        OnClick = ButtonAlterarSituacaoGarcomClick
      end
    end
  end
  inherited FDQuery: TFDQuery
    Active = True
    SQL.Strings = (
      '  SELECT GARCOM.IDGARCOM,'
      '         GARCOM.NMGARCOM,'
      '         GARCOM.IDSTATUSGARCOM,'
      '         SITUACAO.IDSITUACAO,'
      '         SITUACAO.NMSITUACAO'
      '    FROM GARCOM'
      '    JOIN SITUACAO'
      '      ON GARCOM.IDSTATUSGARCOM = SITUACAO.IDSITUACAO')
    object FDQueryidgarcom: TLargeintField
      DisplayLabel = 'C'#243'd. Gar'#231'om'
      FieldName = 'idgarcom'
      Origin = 'idgarcom'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuerynmgarcom: TWideStringField
      DisplayLabel = 'Nome do Gar'#231'om'
      FieldName = 'nmgarcom'
      Origin = 'nmgarcom'
      Size = 50
    end
    object FDQueryidstatusgarcom: TLargeintField
      FieldName = 'idstatusgarcom'
      Origin = 'idstatusgarcom'
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
