inherited FormRelatorioMovimentacaoFinanceira: TFormRelatorioMovimentacaoFinanceira
  Caption = 'Relatorio Movimenta'#231#227'o Financeira'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel [0]
      Left = 8
      Top = 48
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel [1]
      Left = 272
      Top = 48
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    inherited ButtonBuscar: TButton
      OnClick = ButtonBuscarClick
    end
    object DateTimePickerInicio: TDateTimePicker
      Left = 72
      Top = 40
      Width = 186
      Height = 21
      Date = 44967.351722824070000000
      Time = 44967.351722824070000000
      TabOrder = 1
    end
    object DateTimePickerFinal: TDateTimePicker
      Left = 336
      Top = 40
      Width = 186
      Height = 21
      Date = 44967.351919317130000000
      Time = 44967.351919317130000000
      TabOrder = 2
    end
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      '   SELECT FORMAPGMT.NMFORMAPGMT,'
      '         SUM(FORMAPGMTVALORES.VLPAGO) AS TOTAL,'
      '         FORMAPGMTVALORES.DATAPAGMT '
      '    FROM FORMAPGMT'
      '    JOIN FORMAPGMTVALORES'
      '      ON FORMAPGMT.IDFORMAPGMT = FORMAPGMTVALORES.IDFORMAPGMT'
      '   WHERE FORMAPGMTVALORES.DATAPAGMT '
      ' BETWEEN :DTINICIO'
      '     AND :DTFIM '
      'GROUP BY FORMAPGMT.NMFORMAPGMT,'
      '         FORMAPGMTVALORES.DATAPAGMT')
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
      end>
    object FDQueryRelatorionmformapgmt: TWideStringField
      DisplayLabel = 'Forma de Pagamento'
      DisplayWidth = 24
      FieldName = 'nmformapgmt'
      Origin = 'nmformapgmt'
    end
    object FDQueryRelatoriototal: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Total'
      DisplayWidth = 20
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
      currency = True
      Precision = 64
      Size = 0
    end
    object FDQueryRelatoriodatapagmt: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data Pagamento'
      DisplayWidth = 16
      FieldName = 'datapagmt'
      Origin = 'datapagmt'
    end
  end
end
