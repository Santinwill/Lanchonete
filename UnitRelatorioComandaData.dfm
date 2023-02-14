inherited FormRelatorioComandaData: TFormRelatorioComandaData
  Caption = 'Relatorio Comandas por Data'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label2: TLabel [0]
      Left = 8
      Top = 48
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label3: TLabel [1]
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
      Date = 44966.376122523150000000
      Time = 44966.376122523150000000
      TabOrder = 1
    end
    object DateTimePickerFinal: TDateTimePicker
      Left = 336
      Top = 40
      Width = 186
      Height = 21
      Date = 44966.376160509260000000
      Time = 44966.376160509260000000
      TabOrder = 2
    end
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      '  SELECT COMANDA.IDCOMANDA,'
      '         GARCOM.NMGARCOM,'
      '         COMANDA.DTCOMANDA '
      '    FROM COMANDA'
      '    JOIN GARCOM'
      '      ON COMANDA.IDGARCOM = GARCOM.IDGARCOM'
      '   WHERE COMANDA.DTCOMANDA'
      ' BETWEEN :DTINICIO'
      '     AND :DTFIM'
      'ORDER BY COMANDA.IDCOMANDA')
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
    object FDQueryRelatorioidcomanda: TLargeintField
      DisplayLabel = 'C'#243'digo Comanda'
      FieldName = 'idcomanda'
      Origin = 'idcomanda'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryRelatorionmgarcom: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Gar'#231'om'
      FieldName = 'nmgarcom'
      Origin = 'nmgarcom'
      Size = 50
    end
    object FDQueryRelatoriodtcomanda: TDateField
      DisplayLabel = 'Data Comanda'
      FieldName = 'dtcomanda'
      Origin = 'dtcomanda'
    end
  end
end
