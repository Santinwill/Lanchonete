unit UnitRelatorioMultiselecao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitRelatorioBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, ppDB, ppDBPipe,
  ppParameter, ppDesignLayer, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport;

type
  TFormRelatorioMultiselecao = class(TFormRelatorioBase)
    Label1: TLabel;
    EditComanda: TEdit;
    EditItem: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBoxGarcom: TComboBox;
    ComboBoxCategoria: TComboBox;
    ButtonSelecionarComanda: TButton;
    ButtonSelecionarItem: TButton;
    FDQueryRelatorioidcomanda: TLargeintField;
    FDQueryRelatorioidproduto: TLargeintField;
    FDQueryRelatoriodtaddcomanda: TDateField;
    FDQueryRelatorionmproduto: TWideStringField;
    FDQueryRelatorioidgarcom: TLargeintField;
    FDQueryRelatorionmgarcom: TWideStringField;
    FDQueryRelatorioidtipo: TLargeintField;
    FDQueryRelatorionmcategoria: TWideStringField;
    ButtonLimparCampos: TButton;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    ppLabel8: TppLabel;
    ppDBText4: TppDBText;
    procedure FormShow(Sender: TObject);
    procedure ButtonSelecionarComandaClick(Sender: TObject);
    procedure ButtonSelecionarItemClick(Sender: TObject);
    procedure ButtonBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonLimparCamposClick(Sender: TObject);
  private
    { Private declarations }
    procedure garcom;
    procedure categoria;
    procedure Buscar;
    procedure limpar;
  public
    base_sql: string;
    { Public declarations }
  end;

var
  FormRelatorioMultiselecao: TFormRelatorioMultiselecao;

implementation

{$R *.dfm}

uses UnitPrincipal, UnitCadastroComanda, UnitCadastroCardapio;

procedure TFormRelatorioMultiselecao.Buscar;
var
  sql: String;
begin
  sql := base_sql;
    if EditComanda.Text <> '' then
    begin
      sql := sql + ' and COMANDA.IDCOMANDA = ' + EditComanda.Text;
    end;
    if EditItem.Text <> '' then
    begin
      sql := sql + ' and PRODUTO.IDPRODUTO = ' + EditItem.Text;
    end;
    if ComboBoxGarcom.Text <> '' then
    begin
      sql := sql + ' and GARCOM.NMGARCOM LIKE (' + QuotedStr('%' + ComboBoxGarcom.Text + '%') + ')';
    end;
    if ComboBoxCategoria.Text <> '' then
    begin
      sql := sql + ' and TIPO.NMCATEGORIA LIKE (' + QuotedStr('%' + ComboBoxCategoria.Text + '%') + ')';
    end;
  FDQueryRelatorio.Close;
  FDQueryRelatorio.SQL.Text := sql;
  FDQueryRelatorio.Open;
end;

procedure TFormRelatorioMultiselecao.ButtonBuscarClick(Sender: TObject);
begin
   Buscar;
end;

procedure TFormRelatorioMultiselecao.ButtonLimparCamposClick(Sender: TObject);
begin
  limpar;
end;

procedure TFormRelatorioMultiselecao.ButtonSelecionarComandaClick(
  Sender: TObject);
var
  form: TFormCadastroComanda;
begin
  form := TFormCadastroComanda.Create(Self);
  form.ButtonSelecionar.Visible := True;
  form.ShowModal;
  if form.ModalResult = mrOk then
  begin
    EditComanda.Text := IntToStr(form.FDQuery.FieldByName('IDCOMANDA').AsInteger);
  end;
  form.Free;
end;

procedure TFormRelatorioMultiselecao.ButtonSelecionarItemClick(Sender: TObject);
var
  form: TFormCadastroCardapio;
begin
  form := TFormCadastroCardapio.Create(Self);
  form.ButtonSelecionar.Visible := True;
  form.ShowModal;
  if form.ModalResult = mrOk then
  begin
    EditItem.Text := IntToStr(form.FDQuery.FieldByName('IDPRODUTO').AsInteger);
  end;
  form.Free;
end;

procedure TFormRelatorioMultiselecao.categoria;
var
  FDQueryCategoria: TFDQuery;
  DataSourceCategoria: TDataSource;
begin
  FDQueryCategoria := TFDQuery.Create(nil);
  DataSourceCategoria := TDataSource.Create(nil);
  try
    FDQueryCategoria.Connection := FormPrincipal.FDConnection;
    DataSourceCategoria.DataSet := FDQueryCategoria;
    FDQueryCategoria.SQL.Text := '  SELECT IDTIPO, ' +
                                 '         NMCATEGORIA ' +
                                 '    FROM TIPO ' +
                                 'ORDER BY NMCATEGORIA ';
    FDQueryCategoria.Open;
    DataSourceCategoria.DataSet.First;
    while not DataSourceCategoria.DataSet.Eof do
    begin
      ComboBoxCategoria.AddItem(
         FDQueryCategoria.FieldByName('NMCATEGORIA').AsString,
         TObject(FDQueryCategoria.FieldByName('IDTIPO').AsInteger));
      DataSourceCategoria.DataSet.Next;
    end;
    ComboBoxCategoria.ItemIndex := 0;
  finally
    FDQueryCategoria.Free;
    DataSourceCategoria.Free;
  end;
end;

procedure TFormRelatorioMultiselecao.FormCreate(Sender: TObject);
begin
  base_sql := FDQueryRelatorio.SQL.Text;
  limpar;
end;

procedure TFormRelatorioMultiselecao.FormShow(Sender: TObject);
begin
  inherited;
  garcom;
  categoria;
end;

procedure TFormRelatorioMultiselecao.garcom;
var
  FDQueryGarcom: TFDQuery;
  DataSourceGarcom: TDataSource;
begin
  FDQueryGarcom := TFDQuery.Create(nil);
  DataSourceGarcom := TDataSource.Create(nil);
  try
    FDQueryGarcom.Connection := FormPrincipal.FDConnection;
    DataSourceGarcom.DataSet := FDQueryGarcom;
    FDQueryGarcom.SQL.Text := '  SELECT IDGARCOM, ' +
                              '         NMGARCOM ' +
                              '    FROM GARCOM ' +
                              'ORDER BY NMGARCOM' ;
    FDQueryGarcom.Open;
    DataSourceGarcom.DataSet.First;
    while not DataSourceGarcom.DataSet.Eof do
    begin
      ComboBoxGarcom.AddItem(FDQueryGarcom.FieldByName('NMGARCOM').AsString,
                             TObject(FDQueryGarcom.FieldByName('IDGARCOM').AsInteger));
      DataSourceGarcom.DataSet.Next;
    end;
    ComboBoxGarcom.ItemIndex := 0;
  finally
    FDQueryGarcom.Free;
    DataSourceGarcom.Free;
  end;
end;

procedure TFormRelatorioMultiselecao.limpar;
begin
  EditComanda.Text := '-1';
  EditItem.Text := '';
  ComboBoxGarcom.ItemIndex := 0;
  ComboBoxCategoria.ItemIndex := 0;
  Buscar;
  EditComanda.Text := '';
end;

end.
