inherited FormCardapio: TFormCardapio
  Caption = 'Cardapio'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel [0]
      Left = 16
      Top = 11
      Width = 47
      Height = 13
      Caption = 'Categoria'
    end
    object Label2: TLabel [1]
      Left = 300
      Top = 11
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object Label3: TLabel [2]
      Left = 16
      Top = 43
      Width = 65
      Height = 13
      Caption = 'Situa'#231#227'o Cat.'
    end
    object Label4: TLabel [3]
      Left = 300
      Top = 43
      Width = 70
      Height = 13
      Caption = 'Situa'#231#227'o Prod.'
    end
    inherited ButtonBuscar: TButton
      OnClick = ButtonBuscarClick
    end
    object EditProduto: TEdit
      Left = 376
      Top = 8
      Width = 81
      Height = 21
      TabOrder = 1
    end
    object ComboBoxCategoria: TComboBox
      Left = 88
      Top = 8
      Width = 193
      Height = 21
      TabOrder = 2
    end
    object ComboBoxSituacaoCat: TComboBox
      Left = 88
      Top = 40
      Width = 193
      Height = 21
      TabOrder = 3
    end
    object ComboBoxSituacaoProd: TComboBox
      Left = 376
      Top = 40
      Width = 145
      Height = 21
      TabOrder = 4
    end
    object ButtonBuscarProduto: TButton
      Left = 464
      Top = 6
      Width = 57
      Height = 25
      Caption = 'Buscar'
      TabOrder = 5
      OnClick = ButtonBuscarProdutoClick
    end
  end
  inherited FDQueryRelatorio: TFDQuery
    Active = True
    SQL.Strings = (
      '  SELECT PRODUTO.IDPRODUTO,'
      '         PRODUTO.NMPRODUTO,'
      '         PRODUTO.VLVENDA,'
      '         PRODUTO.DESCRICAO,'
      '         PRODUTO.IDTIPO,'
      '         PRODUTO.FLSITUACAO,'
      '         TIPO.IDTIPO,'
      '         TIPO.NMCATEGORIA,'
      '         TIPO.FLSITUACAO,'
      '         SITUACAO.IDSITUACAO,'
      '         SITUACAO.NMSITUACAO '
      '    FROM PRODUTO'
      '    JOIN TIPO'
      '      ON PRODUTO.IDTIPO = TIPO.IDTIPO'
      '    JOIN SITUACAO'
      '      ON PRODUTO.FLSITUACAO = SITUACAO.IDSITUACAO'
      '   WHERE 1=1')
  end
  inherited ppReport1: TppReport
    DataPipelineName = 'ppDBPipeline1'
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLine1: TppLine
        LayerName = Foreground
      end
      inherited ppLine2: TppLine
        LayerName = Foreground
      end
    end
    inherited ppFooterBand1: TppFooterBand
      inherited ppLine3: TppLine
        LayerName = Foreground
      end
      inherited ppLabel2: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppSystemVariable1: TppSystemVariable
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
      inherited ppLabel3: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppSystemVariable2: TppSystemVariable
        SaveOrder = -1
        LayerName = Foreground
      end
    end
    inherited ppSummaryBand1: TppSummaryBand
      inherited ppLabeltexte: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppMemofiltro: TppMemo
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppLine4: TppLine
        LayerName = Foreground
      end
      inherited ppLabeltotalregistro: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
    end
  end
end
