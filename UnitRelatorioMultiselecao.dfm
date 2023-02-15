inherited FormRelatorioMultiselecao: TFormRelatorioMultiselecao
  Caption = 'Relatorio Multisele'#231#227'o'
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 628
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    ExplicitTop = -8
    object Label1: TLabel [0]
      Left = 16
      Top = 16
      Width = 71
      Height = 13
      Caption = 'C'#243'd. Comanda'
    end
    object Label2: TLabel [1]
      Left = 16
      Top = 48
      Width = 48
      Height = 13
      Caption = 'C'#243'd. Item'
    end
    object Label3: TLabel [2]
      Left = 312
      Top = 16
      Width = 36
      Height = 13
      Caption = 'Gar'#231'om'
    end
    object Label4: TLabel [3]
      Left = 312
      Top = 48
      Width = 47
      Height = 13
      Caption = 'Categoria'
    end
    inherited ButtonBuscar: TButton
      OnClick = ButtonBuscarClick
    end
    object EditComanda: TEdit
      Left = 88
      Top = 8
      Width = 121
      Height = 21
      Color = clSkyBlue
      ReadOnly = True
      TabOrder = 1
    end
    object EditItem: TEdit
      Left = 88
      Top = 40
      Width = 121
      Height = 21
      Color = clSkyBlue
      ReadOnly = True
      TabOrder = 2
    end
    object ComboBoxGarcom: TComboBox
      Left = 368
      Top = 8
      Width = 145
      Height = 21
      TabOrder = 3
      Text = 'ComboBoxGarcom'
      Items.Strings = (
        '')
    end
    object ComboBoxCategoria: TComboBox
      Left = 368
      Top = 40
      Width = 145
      Height = 21
      TabOrder = 4
      Text = 'ComboBoxCategoria'
      Items.Strings = (
        '')
    end
    object ButtonSelecionarComanda: TButton
      Left = 216
      Top = 6
      Width = 75
      Height = 26
      Caption = 'Selecionar'
      TabOrder = 5
      OnClick = ButtonSelecionarComandaClick
    end
    object ButtonSelecionarItem: TButton
      Left = 216
      Top = 38
      Width = 75
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 6
      OnClick = ButtonSelecionarItemClick
    end
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT COMANDA.IDCOMANDA,'
      '         ITENCOMANDA.IDPRODUTO,'
      '         ITENCOMANDA.DTADDCOMANDA,'
      '         PRODUTO.NMPRODUTO,'
      '         GARCOM.IDGARCOM,'
      '         GARCOM.NMGARCOM,'
      '         TIPO.IDTIPO,'
      '         TIPO.NMCATEGORIA'
      '    FROM GARCOM'
      '    JOIN COMANDA'
      '      ON GARCOM.IDGARCOM = COMANDA.IDGARCOM '
      '    JOIN ITENCOMANDA'
      '      ON COMANDA.IDCOMANDA = ITENCOMANDA.IDCOMANDA '
      '    JOIN PRODUTO'
      '      ON ITENCOMANDA.IDPRODUTO = PRODUTO.IDPRODUTO'
      '    JOIN TIPO'
      '      ON PRODUTO.IDTIPO = TIPO.IDTIPO')
  end
end
