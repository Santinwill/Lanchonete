inherited FormRelatorioDetalhesPagamento: TFormRelatorioDetalhesPagamento
  Caption = 'Relatorio Detalhes de Pagamento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel [0]
      Left = 296
      Top = 43
      Width = 96
      Height = 13
      Caption = 'C'#243'digo da Comanda'
    end
    inherited ButtonBuscar: TButton
      OnClick = ButtonBuscarClick
    end
    object EditCodigoComanda: TEdit
      Left = 402
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT FORMAPGMT.NMFORMAPGMT,'
      '       FORMAPGMTVALORES.VLPAGO'
      '  FROM FORMAPGMT'
      '  JOIN FORMAPGMTVALORES'
      '    ON FORMAPGMT.IDFORMAPGMT = FORMAPGMTVALORES.IDFORMAPGMT'
      '  WHERE FORMAPGMTVALORES.IDCOMANDA = :IDCOMANDA')
    ParamData = <
      item
        Name = 'IDCOMANDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryRelatorionmformapgmt: TWideStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'nmformapgmt'
      Origin = 'nmformapgmt'
    end
    object FDQueryRelatoriovlpago: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Pago'
      FieldName = 'vlpago'
      Origin = 'vlpago'
      currency = True
      Precision = 10
      Size = 2
    end
  end
end
