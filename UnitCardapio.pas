unit UnitCardapio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitRelatorioBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, ppDB, ppDBPipe, ppParameter, ppDesignLayer,
  ppStrtch, ppMemo, ppBands, ppVar, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormCardapio = class(TFormRelatorioBase)
    Label1: TLabel;
    Label2: TLabel;
    EditProduto: TEdit;
    ComboBoxCategoria: TComboBox;
    Label3: TLabel;
    ComboBoxSituacaoCat: TComboBox;
    Label4: TLabel;
    ComboBoxSituacaoProd: TComboBox;
    ButtonBuscarProduto: TButton;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    FDQueryRelatorioidproduto: TLargeintField;
    FDQueryRelatorionmproduto: TWideStringField;
    FDQueryRelatoriovlvenda: TBCDField;
    FDQueryRelatoriodescricao: TWideMemoField;
    FDQueryRelatorioidtipo: TLargeintField;
    FDQueryRelatorioflsituacao: TLargeintField;
    FDQueryRelatorioidtipo_1: TLargeintField;
    FDQueryRelatorionmcategoria: TWideStringField;
    FDQueryRelatorioflsituacao_1: TLargeintField;
    FDQueryRelatorioidsituacao: TLargeintField;
    FDQueryRelatorionmsituacao: TWideStringField;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText5: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonBuscarProdutoClick(Sender: TObject);
    procedure ComboBoxCategoriaSelect(Sender: TObject);
    procedure ComboBoxSituacaoCatSelect(Sender: TObject);
    procedure ComboBoxSituacaoProdSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sql: string;
    base_sql: string;
    codProduto: Integer;
    procedure Buscar;
    procedure categoria;
    procedure produto;
    procedure sitCategoria;
  end;

var
  FormCardapio: TFormCardapio;

implementation

{$R *.dfm}

uses UnitPrincipal, UnitCadastroCardapio;

procedure TFormCardapio.Buscar;
begin
  sql := base_sql;
  if ComboBoxCategoria.Text <> '' then
  begin
    sql := sql + ' AND TIPO.NMCATEGORIA LIKE ' + QuotedStr(ComboBoxCategoria.Text);
  end;
  if ComboBoxSituacaoCat.Text <> '' then
  begin
    sql := sql + ' AND TIPO.FLSITUACAO = ' + IntToStr(ComboBoxSituacaoCat.ItemIndex);
  end;
  if ComboBoxSituacaoProd.Text <> '' then
  begin
    sql := sql + ' AND PRODUTO.FLSITUACAO = ' + IntToStr(ComboBoxSituacaoProd.ItemIndex);
  end;
  if EditProduto.Text <> '' then
  begin
    sql := sql + ' AND PRODUTO.IDPRODUTO = ' + IntToStr(codProduto);
  end;
  sql := sql + ' ORDER BY TIPO.NMCATEGORIA ';
  FDQueryRelatorio.Close;
  FDQueryRelatorio.SQL.Text := sql;
  FDQueryRelatorio.Open;
end;

procedure TFormCardapio.ButtonBuscarProdutoClick(Sender: TObject);
begin
  if MessageDlg('Selecionar Produto?', mtConfirmation, [mbYes, mbNo], 0) = mrNo  then
  begin
    EditProduto.Text := '';
    Buscar;
    Exit;
  end;
  produto;
  Buscar;
end;

procedure TFormCardapio.categoria;
var
  FDQueryCategoria: TFDQuery;
  DataSourceCategoria: TDataSource;
begin
  FDQueryCategoria := TFDQuery.Create(nil);
  DataSourceCategoria := TDataSource.Create(nil);
  try
    FDQueryCategoria.Connection := FormPrincipal.FDConnection;
    DataSourceCategoria.DataSet := FDQueryCategoria;
    FDQueryCategoria.SQL.Text := '  SELECT IDTIPO,      ' +
                                 '         NMCATEGORIA, ' +
                                 '         FLSITUACAO   '+
                                 '    FROM TIPO         ' +
                                 'ORDER BY NMCATEGORIA  ' ;
    FDQueryCategoria.Open;
    DataSourceCategoria.DataSet.First;
    ComboBoxCategoria.AddItem('', TObject(Self));
    while not DataSourceCategoria.DataSet.Eof do
    begin
      ComboBoxCategoria.AddItem(FDQueryCategoria.FieldByName('NMCATEGORIA').AsString,
                                TObject(FDQueryCategoria.FieldByName('IDTIPO').AsInteger));
      DataSourceCategoria.DataSet.Next;
    end;
    ComboBoxCategoria.ItemIndex := 0;
  finally
    DataSourceCategoria.Free;
    FDQueryCategoria.Free;
  end;

end;

procedure TFormCardapio.ComboBoxCategoriaSelect(Sender: TObject);
begin
  Buscar;
end;

procedure TFormCardapio.ComboBoxSituacaoCatSelect(Sender: TObject);
begin
  Buscar;
end;

procedure TFormCardapio.ComboBoxSituacaoProdSelect(Sender: TObject);
begin
  Buscar;
end;

procedure TFormCardapio.FormCreate(Sender: TObject);
begin
  base_sql := FDQueryRelatorio.SQL.Text;
end;

procedure TFormCardapio.FormShow(Sender: TObject);
begin
  categoria;
  sitCategoria;
  Buscar;
end;

procedure TFormCardapio.produto;
var
  form: TFormCadastroCardapio;
begin
  form := TFormCadastroCardapio.Create(Self);
  form.ButtonSelecionar.Visible := True;
  form.ButtonImprimir.Visible := False;
  form.ShowModal;
  if form.ModalResult = mrOk then
  begin
    EditProduto.Text := form.FDQuery.FieldByName('NMPRODUTO').AsString;
    codProduto := form.FDQuery.FieldByName('IDPRODUTO').AsInteger;
  end;
  form.Free;
end;

procedure TFormCardapio.sitCategoria;
var
  FDQueryCategoria: TFDQuery;
  DataSourceCategoria: TDataSource;
begin
  FDQueryCategoria := TFDQuery.Create(nil);
  DataSourceCategoria := TDataSource.Create(nil);
  try
    FDQueryCategoria.Connection := FormPrincipal.FDConnection;
    DataSourceCategoria.DataSet := FDQueryCategoria;
    FDQueryCategoria.SQL.Text := '  SELECT IDSITUACAO,  ' +
                                 '         NMSITUACAO   ' +
                                 '    FROM SITUACAO     ' +
                                 'ORDER BY IDSITUACAO   ' ;
    FDQueryCategoria.Open;
    DataSourceCategoria.DataSet.First;
    ComboBoxSituacaoProd.AddItem('', TObject(Self));
    ComboBoxSituacaoCat.AddItem('', TObject(Self));
    while not DataSourceCategoria.DataSet.Eof do
    begin
      ComboBoxSituacaoCat.AddItem(FDQueryCategoria.FieldByName('NMSITUACAO').AsString,
                                TObject(FDQueryCategoria.FieldByName('IDSITUACAO').AsInteger));
      ComboBoxSituacaoProd.AddItem(FDQueryCategoria.FieldByName('NMSITUACAO').AsString,
                                TObject(FDQueryCategoria.FieldByName('IDSITUACAO').AsInteger));
      DataSourceCategoria.DataSet.Next;
    end;
    ComboBoxSituacaoCat.ItemIndex := 0;
    ComboBoxSituacaoProd.ItemIndex := 0;
  finally
    DataSourceCategoria.Free;
    FDQueryCategoria.Free;
  end;

end;

end.
