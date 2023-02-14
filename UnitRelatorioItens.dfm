inherited FormRelatorioItens: TFormRelatorioItens
  Caption = 'Relatorio Itens'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object LabelIten: TLabel [0]
      Left = 1
      Top = 1
      Width = 610
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'Todos os Itens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 224
      ExplicitTop = 16
      ExplicitWidth = 95
    end
    inherited ButtonBuscar: TButton
      OnClick = ButtonBuscarClick
    end
    object CheckBoxAtivo: TCheckBox
      Left = 224
      Top = 40
      Width = 97
      Height = 17
      Anchors = [akLeft]
      Caption = 'Itens Ativos'
      TabOrder = 1
    end
    object CheckBoxInativos: TCheckBox
      Left = 312
      Top = 40
      Width = 97
      Height = 17
      Anchors = [akLeft]
      Caption = 'Itens Inativos'
      TabOrder = 2
    end
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      '  SELECT PRODUTO.NMPRODUTO, '
      '         PRODUTO.VLVENDA'
      '    FROM PRODUTO '
      '    JOIN TIPO'
      '      ON PRODUTO.IDTIPO = TIPO.IDTIPO ')
    object FDQueryRelatorionmproduto: TWideStringField
      DisplayLabel = 'Item'
      FieldName = 'nmproduto'
      Origin = 'nmproduto'
      Size = 50
    end
    object FDQueryRelatoriovlvenda: TBCDField
      DisplayLabel = 'Valor Venda'
      FieldName = 'vlvenda'
      Origin = 'vlvenda'
      currency = True
      Precision = 10
      Size = 2
    end
  end
end
