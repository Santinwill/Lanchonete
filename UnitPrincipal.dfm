object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Lanchonete'
  ClientHeight = 319
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelUsuario: TLabel
    Left = 0
    Top = 0
    Width = 443
    Height = 13
    Align = alTop
    Alignment = taRightJustify
    Caption = 'LabelUsuario'
    ExplicitLeft = 382
    ExplicitWidth = 61
  end
  object MainMenu: TMainMenu
    Left = 184
    Top = 65
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Comandas1: TMenuItem
        Caption = 'Comanda'
        OnClick = Comandas1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Produto1: TMenuItem
        Caption = 'Card'#225'pio'
        OnClick = Produto1Click
      end
      object Garom1: TMenuItem
        Caption = 'Categoria de Produtos'
        OnClick = Garom1Click
      end
      object CategoriadeProdutos1: TMenuItem
        Caption = '-'
      end
      object Garom2: TMenuItem
        Caption = 'Gar'#231'om'
        OnClick = Garom2Click
      end
      object FormasdePagamento1: TMenuItem
        Caption = '-'
      end
      object FormasdePagamento2: TMenuItem
        Caption = 'Formas de Pagamento'
        OnClick = FormasdePagamento2Click
      end
    end
    object ControleComanda1: TMenuItem
      Caption = 'Controle'
      object Comanda1: TMenuItem
        Caption = 'Comanda'
        OnClick = Comanda1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object FechamentoComanda1: TMenuItem
        Caption = 'Fechamento Comanda'
        OnClick = FechamentoComanda1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object ConsumoporData1: TMenuItem
        Caption = 'Comanda por Data'
        OnClick = ConsumoporData1Click
      end
      object MovimentaoFinanceira1: TMenuItem
        Caption = 'Movimenta'#231#227'o Financeira'
        OnClick = MovimentaoFinanceira1Click
      end
      object DetalhesdePagamento1: TMenuItem
        Caption = 'Detalhes de Pagamento'
        OnClick = DetalhesdePagamento1Click
      end
      object ItensCardapio1: TMenuItem
        Caption = 'Itens Cardapio'
        OnClick = ItensCardapio1Click
      end
      object VendasGarom1: TMenuItem
        Caption = 'Vendas Gar'#231'om'
        OnClick = VendasGarom1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object ItensComanda1: TMenuItem
        Caption = 'Itens Comanda'
        OnClick = ItensComanda1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Multiseleo1: TMenuItem
        Caption = 'Multisele'#231#227'o'
        OnClick = Multiseleo1Click
      end
    end
    object Cardpio1: TMenuItem
      Caption = 'Card'#225'pio'
      object Visializar1: TMenuItem
        Caption = 'Visializar'
        OnClick = Visializar1Click
      end
    end
    object CardpioviaCdigo1: TMenuItem
      Caption = 'Card'#225'pio via C'#243'digo'
      OnClick = CardpioviaCdigo1Click
    end
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=LANCHONETE'
      'DriverID=pG'
      'User_Name=postgres'
      'Password=postgres'
      'Server=localhost')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FDConnectionBeforeConnect
    Left = 184
    Top = 120
  end
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\des42\Desktop\ProjetosGit\Lanchonete\psqlodbc_12_01_000' +
      '0-x64\psqlodbc\libpq.dll'
    Left = 184
    Top = 168
  end
end
