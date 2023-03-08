object FormLogin: TFormLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 192
  ClientWidth = 224
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 29
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object Label2: TLabel
    Left = 32
    Top = 77
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object EditLogin: TEdit
    Left = 32
    Top = 48
    Width = 156
    Height = 21
    TabOrder = 0
  end
  object EditSenha: TEdit
    Left = 32
    Top = 96
    Width = 156
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object ButtonEntrar: TButton
    Left = 32
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Entrar'
    Default = True
    TabOrder = 2
    OnClick = ButtonEntrarClick
  end
  object ButtonCancelar: TButton
    Left = 113
    Top = 136
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = ButtonCancelarClick
  end
  object FDQuerylogin: TFDQuery
    Active = True
    Connection = FormPrincipal.FDConnection
    SQL.Strings = (
      'SELECT *'
      '  FROM USUARIO'
      ' WHERE LOGIN = :LOGIN'
      '   AND SENHA = :SENHA')
    Left = 104
    Top = 16
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
