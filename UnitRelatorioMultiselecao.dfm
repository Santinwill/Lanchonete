inherited FormRelatorioMultiselecao: TFormRelatorioMultiselecao
  Caption = 'Relatorio Multisele'#231#227'o'
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 628
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
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
    object ButtonLimparCampos: TButton
      Left = 529
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 7
      OnClick = ButtonLimparCamposClick
    end
  end
  inherited DBGridRelatorio: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'idcomanda'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmproduto'
        Width = 196
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmgarcom'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtaddcomanda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmcategoria'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idproduto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'idgarcom'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'idtipo'
        Visible = False
      end>
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
      '      ON PRODUTO.IDTIPO = TIPO.IDTIPO'
      '   where 1 = 1')
    object FDQueryRelatorioidcomanda: TLargeintField
      DisplayLabel = 'C'#243'd. Comanda'
      DisplayWidth = 14
      FieldName = 'idcomanda'
      Origin = 'idcomanda'
    end
    object FDQueryRelatorioidproduto: TLargeintField
      AutoGenerateValue = arDefault
      DisplayWidth = 18
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Visible = False
    end
    object FDQueryRelatoriodtaddcomanda: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data'
      DisplayWidth = 14
      FieldName = 'dtaddcomanda'
      Origin = 'dtaddcomanda'
    end
    object FDQueryRelatorionmproduto: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Produto'
      DisplayWidth = 60
      FieldName = 'nmproduto'
      Origin = 'nmproduto'
      Size = 50
    end
    object FDQueryRelatorioidgarcom: TLargeintField
      AutoGenerateValue = arDefault
      DisplayWidth = 18
      FieldName = 'idgarcom'
      Origin = 'idgarcom'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object FDQueryRelatorionmgarcom: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Gar'#231'om'
      DisplayWidth = 60
      FieldName = 'nmgarcom'
      Origin = 'nmgarcom'
      Size = 50
    end
    object FDQueryRelatorioidtipo: TLargeintField
      AutoGenerateValue = arDefault
      DisplayWidth = 18
      FieldName = 'idtipo'
      Origin = 'idtipo'
      Visible = False
    end
    object FDQueryRelatorionmcategoria: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Categoria'
      DisplayWidth = 60
      FieldName = 'nmcategoria'
      Origin = 'nmcategoria'
      Size = 50
    end
  end
  inherited ppReport1: TppReport
    DataPipelineName = 'ppDBPipeline1'
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        Caption = 'Relat'#243'rio Customizado'
        mmLeft = 68792
        mmWidth = 60590
        LayerName = Foreground
      end
      inherited ppLine1: TppLine
        LayerName = Foreground
      end
      inherited ppLine2: TppLine
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Comanda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 1322
        mmTop = 12436
        mmWidth = 18785
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 22488
        mmTop = 12433
        mmWidth = 80000
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Gar'#231'om'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 104512
        mmTop = 12431
        mmWidth = 56000
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 161398
        mmTop = 12431
        mmWidth = 31750
        BandType = 0
        LayerName = Foreground
      end
    end
    inherited ppDetailBand1: TppDetailBand
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'idcomanda'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 1323
        mmTop = 1323
        mmWidth = 18785
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'nmproduto'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 22488
        mmTop = 1323
        mmWidth = 80000
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'nmgarcom'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 104512
        mmTop = 1323
        mmWidth = 56000
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'nmcategoria'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 161398
        mmTop = 1323
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground
      end
    end
    inherited ppFooterBand1: TppFooterBand
      inherited ppSystemVariable1: TppSystemVariable
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLabel2: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppSystemVariable2: TppSystemVariable
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLabel3: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLabel4: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppSystemVariable3: TppSystemVariable
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLine3: TppLine
        LayerName = Foreground
      end
    end
  end
end
