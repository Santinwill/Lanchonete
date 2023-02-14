inherited FormCadastroComanda: TFormCadastroComanda
  Caption = 'Cadastro Comanda'
  ExplicitWidth = 730
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited TabSheetConsulta: TTabSheet
      inherited Panel1: TPanel
        inherited EditBuscar: TEdit
          Left = 107
          Width = 507
          NumbersOnly = True
          ExplicitLeft = 107
          ExplicitWidth = 507
        end
      end
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
            FieldName = 'idcomanda'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idgarcom'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'dtcomanda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idstatuscomanda'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'vldesconto'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'idgarcom_1'
            Visible = False
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
            FieldName = 'idstatuscomanda_1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'nmcomanda'
            Visible = True
          end>
      end
    end
    inherited TabSheetCadastro: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 16
        Width = 71
        Height = 13
        Caption = 'C'#243'd. Comanda'
        FocusControl = cxDBSpinEdit1
      end
      object Label3: TLabel [1]
        Left = 16
        Top = 56
        Width = 69
        Height = 13
        Caption = 'Data Abertura'
        FocusControl = cxDBDateEdit1
      end
      object Label7: TLabel [2]
        Left = 16
        Top = 96
        Width = 36
        Height = 13
        Caption = 'Gar'#231'om'
        FocusControl = cxDBTextEdit1
      end
      object Label10: TLabel [3]
        Left = 16
        Top = 136
        Width = 79
        Height = 13
        Caption = 'Status Comanda'
        FocusControl = cxDBTextEdit2
      end
      object cxDBSpinEdit1: TcxDBSpinEdit
        Left = 16
        Top = 32
        DataBinding.DataField = 'idcomanda'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Properties.SpinButtons.Visible = False
        Style.Color = clSkyBlue
        TabOrder = 1
        Width = 121
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 16
        Top = 72
        DataBinding.DataField = 'dtcomanda'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Style.Color = clSkyBlue
        TabOrder = 2
        Width = 121
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 16
        Top = 112
        DataBinding.DataField = 'nmgarcom'
        DataBinding.DataSource = DataSource
        TabOrder = 3
        Width = 121
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 16
        Top = 152
        DataBinding.DataField = 'nmcomanda'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Style.Color = clSkyBlue
        TabOrder = 4
        Width = 121
      end
      object ButtonSelecionarGarcom: TButton
        Left = 160
        Top = 110
        Width = 110
        Height = 25
        Caption = 'Selecionar Gar'#231'om'
        TabOrder = 5
        OnClick = ButtonSelecionarGarcomClick
      end
    end
  end
  inherited FDQuery: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT COMANDA.IDCOMANDA,'
      '       COMANDA.IDGARCOM,'
      '       COMANDA.DTCOMANDA,'
      '       COMANDA.IDSTATUSCOMANDA,'
      '       COMANDA.VLDESCONTO,'
      '       GARCOM.IDGARCOM,'
      '       GARCOM.NMGARCOM,'
      '       GARCOM.IDSTATUSGARCOM,'
      '       STATUSCOMANDA.IDSTATUSCOMANDA,'
      '       STATUSCOMANDA.NMCOMANDA'
      '  FROM COMANDA'
      '  JOIN GARCOM'
      '    ON COMANDA.IDGARCOM = GARCOM.IDGARCOM'
      '  JOIN STATUSCOMANDA'
      '    ON COMANDA.IDSTATUSCOMANDA = STATUSCOMANDA.IDSTATUSCOMANDA')
    Left = 360
    Top = 320
    object FDQueryidcomanda: TLargeintField
      DisplayLabel = 'C'#243'd. Comanda'
      FieldName = 'idcomanda'
      Origin = 'idcomanda'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryidgarcom: TLargeintField
      FieldName = 'idgarcom'
      Origin = 'idgarcom'
    end
    object FDQuerydtcomanda: TDateField
      DisplayLabel = 'Data Abertura'
      FieldName = 'dtcomanda'
      Origin = 'dtcomanda'
    end
    object FDQueryidstatuscomanda: TIntegerField
      FieldName = 'idstatuscomanda'
      Origin = 'idstatuscomanda'
    end
    object FDQueryvldesconto: TBCDField
      FieldName = 'vldesconto'
      Origin = 'vldesconto'
      Precision = 10
      Size = 2
    end
    object FDQueryidgarcom_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idgarcom_1'
      Origin = 'idgarcom'
    end
    object FDQuerynmgarcom: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Gar'#231'om'
      FieldName = 'nmgarcom'
      Origin = 'nmgarcom'
      Size = 50
    end
    object FDQueryidstatusgarcom: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idstatusgarcom'
      Origin = 'idstatusgarcom'
    end
    object FDQueryidstatuscomanda_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idstatuscomanda_1'
      Origin = 'idstatuscomanda'
    end
    object FDQuerynmcomanda: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Status Comanda'
      FieldName = 'nmcomanda'
      Origin = 'nmcomanda'
      Size = 7
    end
  end
  inherited DataSource: TDataSource
    Left = 432
    Top = 312
  end
end
