object FormCadastroBase: TFormCadastroBase
  Left = 0
  Top = 0
  Caption = 'Cadastro Base'
  ClientHeight = 479
  ClientWidth = 714
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 714
    Height = 479
    ActivePage = TabSheetConsulta
    Align = alClient
    TabOrder = 0
    object TabSheetConsulta: TTabSheet
      Caption = 'Consulta'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 706
        Height = 81
        Align = alTop
        TabOrder = 0
        DesignSize = (
          706
          81)
        object LabelBuscar: TLabel
          Left = 6
          Top = 11
          Width = 57
          Height = 13
          Caption = 'LabelBuscar'
        end
        object LabelAtivoInativo: TLabel
          Left = 1
          Top = 61
          Width = 704
          Height = 19
          Align = alBottom
          Alignment = taCenter
          Caption = 'LabelAtivoInativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 145
        end
        object EditBuscar: TEdit
          Left = 94
          Top = 8
          Width = 520
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object ButtonBuscar: TButton
          Left = 620
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Buscar'
          Default = True
          TabOrder = 1
          OnClick = ButtonBuscarClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 410
        Width = 706
        Height = 41
        Align = alBottom
        TabOrder = 1
        DesignSize = (
          706
          41)
        object ButtonInserir: TButton
          Left = 6
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Inserir'
          TabOrder = 0
          OnClick = ButtonInserirClick
        end
        object ButtonAlterar: TButton
          Left = 87
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = ButtonAlterarClick
        end
        object ButtonImprimir: TButton
          Left = 168
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Imprimir'
          TabOrder = 2
          Visible = False
        end
        object ButtonSelecionar: TButton
          Left = 540
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Selecionar'
          TabOrder = 3
          OnClick = ButtonSelecionarClick
        end
        object ButtonFechar: TButton
          Left = 620
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = 'Fechar'
          TabOrder = 4
          OnClick = ButtonFecharClick
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 81
        Width = 706
        Height = 329
        Align = alClient
        DataSource = DataSource
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = ButtonSelecionarClick
      end
    end
    object TabSheetCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 410
        Width = 706
        Height = 41
        Align = alBottom
        TabOrder = 0
        DesignSize = (
          706
          41)
        object ButtonSalvar: TButton
          Left = 543
          Top = 7
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Salvar'
          Default = True
          TabOrder = 0
          OnClick = ButtonSalvarClick
        end
        object ButtonCancelar: TButton
          Left = 623
          Top = 7
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = ButtonCancelarClick
        end
      end
    end
  end
  object FDQuery: TFDQuery
    Connection = FormPrincipal.FDConnection
    Left = 344
    Top = 248
  end
  object DataSource: TDataSource
    DataSet = FDQuery
    Left = 408
    Top = 248
  end
end
