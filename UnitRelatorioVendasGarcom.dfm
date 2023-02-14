inherited FormRelatorioVendasGarcom: TFormRelatorioVendasGarcom
  Caption = 'Relatorio Vendas Garcom'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    ExplicitLeft = -8
    ExplicitTop = 24
    object Label1: TLabel [0]
      Left = 8
      Top = 11
      Width = 36
      Height = 13
      Caption = 'Gar'#231'om'
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 43
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label3: TLabel [2]
      Left = 272
      Top = 43
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    inherited ButtonBuscar: TButton
      OnClick = ButtonBuscarClick
    end
    object EditGarcom: TEdit
      Left = 72
      Top = 8
      Width = 186
      Height = 21
      Color = clSkyBlue
      ReadOnly = True
      TabOrder = 1
    end
    object DateTimePickerInicial: TDateTimePicker
      Left = 72
      Top = 40
      Width = 186
      Height = 21
      Date = 44967.448804791670000000
      Time = 44967.448804791670000000
      TabOrder = 2
    end
    object DateTimePickerFinal: TDateTimePicker
      Left = 336
      Top = 40
      Width = 186
      Height = 21
      Date = 44967.449450254630000000
      Time = 44967.449450254630000000
      TabOrder = 3
    end
    object ButtonGarcom: TButton
      Left = 264
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 4
      OnClick = ButtonGarcomClick
    end
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      '  SELECT GARCOM.NMGARCOM,'
      '         PRODUTO.NMPRODUTO,'
      '         COUNT(ITENCOMANDA.IDPRODUTO) AS QUANTIDADE,'
      '         COMANDA.DTCOMANDA'
      '    FROM GARCOM'
      '    JOIN COMANDA'
      '      ON GARCOM.IDGARCOM = COMANDA.IDGARCOM'
      '    JOIN ITENCOMANDA'
      '      ON COMANDA.IDCOMANDA = ITENCOMANDA.IDCOMANDA'
      '    JOIN PRODUTO'
      '      ON ITENCOMANDA.IDPRODUTO = PRODUTO.IDPRODUTO '
      '   WHERE COMANDA.DTCOMANDA  '
      ' BETWEEN :DTINICIO'
      '     AND :DTFIM '
      '     AND GARCOM.IDGARCOM  = :IDGARCOM'
      '     AND ITENCOMANDA.IDSITUACAOPRODUTOCOMANDA <> 0'
      'GROUP BY PRODUTO.NMPRODUTO,'
      '         GARCOM.NMGARCOM,'
      '         COMANDA.DTCOMANDA'
      'ORDER BY COMANDA.DTCOMANDA')
    ParamData = <
      item
        Name = 'DTINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DTFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDGARCOM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryRelatorionmgarcom: TWideStringField
      DisplayLabel = 'Gar'#231'om'
      DisplayWidth = 30
      FieldName = 'nmgarcom'
      Origin = 'nmgarcom'
      Size = 50
    end
    object FDQueryRelatorionmproduto: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Item'
      DisplayWidth = 40
      FieldName = 'nmproduto'
      Origin = 'nmproduto'
      Size = 50
    end
    object FDQueryRelatorioquantidade: TLargeintField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'quantidade'
      Origin = 'quantidade'
      ReadOnly = True
    end
    object FDQueryRelatoriodtcomanda: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data'
      DisplayWidth = 15
      FieldName = 'dtcomanda'
      Origin = 'dtcomanda'
    end
  end
end
