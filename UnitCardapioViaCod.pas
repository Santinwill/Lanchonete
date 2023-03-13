unit UnitCardapioViaCod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ppDesignLayer, ppParameter, ppBands, ppCache, ppPrnabl, ppCtrls, ppStrtch,
  ppMemo, ppVar;

type
  TFormCardapioViaCod = class(TForm)
    PanelTop: TPanel;
    PanelBottom: TPanel;
    DBGrid: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBoxCategoria: TComboBox;
    ComboBoxSitCategoria: TComboBox;
    ComboBoxSitProduto: TComboBox;
    EditProduto: TEdit;
    ButtonBuscar: TButton;
    ButtonImprimir: TButton;
    ButtonCancelar: TButton;
    ppReport: TppReport;
    FDQuery: TFDQuery;
    DataSource: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBPipeline: TppDBPipeline;
    procedure FormCreate(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonBuscarClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: Tobject);
    procedure ComboBoxSelect(Sender: TObject);
  private
    sql_base: string;
    sql: string;
    codProduto: Integer;
    procedure Buscar;
    procedure Categoria;
    procedure ItenGrid;
    procedure Produto;
    procedure Situacao;
    { Private declarations }
  public
    procedure ConfiguraConexao;
    { Public declarations }
  end;

var
  FormCardapioViaCod: TFormCardapioViaCod;

implementation

{$R *.dfm}

uses UnitPrincipal, UnitCadastroCardapio;

{ TFormCardapioViaCod }

procedure TFormCardapioViaCod.ButtonBuscarClick(Sender: TObject);
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

procedure TFormCardapioViaCod.ButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCardapioViaCod.ButtonImprimirClick(Sender: Tobject);
begin
  ppReport.PrintReport;
end;

procedure TFormCardapioViaCod.Categoria;
var
  FDQueryCategoria: TFDQuery;
  DataSourceCategoria: TDataSource;
begin
  FDQueryCategoria := TFDQuery.Create(Self);
  DataSourceCategoria := TDataSource.Create(Self);
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

procedure TFormCardapioViaCod.ComboBoxSelect(Sender: TObject);
begin
  Buscar;
end;

procedure TFormCardapioViaCod.ConfiguraConexao;
begin
  FDQuery.Connection := FormPrincipal.FDConnection;
  DataSource.DataSet := FDQuery;
  DBGrid.DataSource := DataSource;
  FDQuery.SQL.Text :=
  ' SELECT PRODUTO.IDPRODUTO, ' +
  '        PRODUTO.NMPRODUTO,   ' +
  '        PRODUTO.VLVENDA,     ' +
  '        PRODUTO.DESCRICAO,   ' +
  '        PRODUTO.IDTIPO,      ' +
  '        PRODUTO.FLSITUACAO,  ' +
  '        TIPO.IDTIPO,         ' +
  '        TIPO.NMCATEGORIA,    ' +
  '        TIPO.FLSITUACAO,     ' +
  '        SITUACAO.IDSITUACAO, ' +
  '        SITUACAO.NMSITUACAO  ' +
  '   FROM PRODUTO              ' +
  '   JOIN TIPO                 ' +
  '     ON PRODUTO.IDTIPO = TIPO.IDTIPO              ' +
  '   JOIN SITUACAO                                  ' +
  '     ON PRODUTO.FLSITUACAO = SITUACAO.IDSITUACAO  ' +
  '  WHERE 1=1                                      ';
  sql_base := FDQuery.SQL.Text;
  FDQuery.Open;
  ppDBPipeline.DataSource := DataSource;
  ppReport.DataPipeline := ppDBPipeline;
end;

procedure TFormCardapioViaCod.FormCreate(Sender: TObject);
begin
  ConfiguraConexao;
//  FormCardapioViaCod.Position := poDesktopCenter;
  Buscar;
  Categoria;
  Situacao;
  ItenGrid;

  ButtonCancelar.OnClick := ButtonCancelarClick;
  ButtonCancelar.Cancel := True;
  ButtonBuscar.OnClick := ButtonBuscarClick;
  ButtonImprimir.OnClick := ButtonImprimirClick;
  EditProduto.ReadOnly := True;
  EditProduto.Color := clSkyBlue;
  ComboBoxCategoria.OnSelect := ComboBoxSelect;
  ComboBoxSitCategoria.OnSelect := ComboBoxSelect;
  ComboBoxSitProduto.OnSelect := ComboBoxSelect;
end;

procedure TFormCardapioViaCod.ItenGrid;
var
  AColumn: TColumn;
begin
  AColumn := DBGrid.Columns.Add;
  AColumn.FieldName := 'IDPRODUTO';
  AColumn.Title.Caption := 'Cód. Produto';
  AColumn.Width := 64;

  AColumn := DBGrid.Columns.Add;
  AColumn.FieldName := 'NMPRODUTO';
  AColumn.Title.Caption := 'Produto';
  AColumn.Width := 248;

  AColumn := DBGrid.Columns.Add;
  AColumn.FieldName := 'VLVENDA';
  AColumn.Title.Caption := 'Valor';
  AColumn.Width := 70;
  AColumn.Alignment := taLeftJustify;

  AColumn := DBGrid.Columns.Add;
  AColumn.FieldName := 'NMCATEGORIA';
  AColumn.Title.Caption := 'Categoria';
  AColumn.Width := 92;

  AColumn := DBGrid.Columns.Add;
  AColumn.FieldName := 'NMSITUACAO';
  AColumn.Title.Caption := 'Situação';
  AColumn.Width := 54;

end;

procedure TFormCardapioViaCod.Produto;
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

procedure TFormCardapioViaCod.Situacao;
var
  FDQuerySituacao: TFDQuery;
  DataSourceSituacao: TDataSource;
begin
  FDQuerySituacao := TFDQuery.Create(nil);
  DataSourceSituacao := TDataSource.Create(nil);
  try
    FDQuerySituacao.Connection := FormPrincipal.FDConnection;
    DataSourceSituacao.DataSet := FDQuerySituacao;
    FDQuerySituacao.SQL.Text := '  SELECT IDSITUACAO,  ' +
                                 '         NMSITUACAO   ' +
                                 '    FROM SITUACAO     ' +
                                 'ORDER BY IDSITUACAO   ' ;
    FDQuerySituacao.Open;
    DataSourceSituacao.DataSet.First;
    ComboBoxSitProduto.AddItem('', TObject(Self));
    ComboBoxSitCategoria.AddItem('', TObject(Self));
    while not DataSourceSituacao.DataSet.Eof do
    begin
      ComboBoxSitCategoria.AddItem(FDQuerySituacao.FieldByName('NMSITUACAO').AsString,
                                TObject(FDQuerySituacao.FieldByName('IDSITUACAO').AsInteger));
      ComboBoxSitProduto.AddItem(FDQuerySituacao.FieldByName('NMSITUACAO').AsString,
                                TObject(FDQuerySituacao.FieldByName('IDSITUACAO').AsInteger));
      DataSourceSituacao.DataSet.Next;
    end;
    ComboBoxSitCategoria.ItemIndex := 0;
    ComboBoxSitProduto.ItemIndex := 0;
  finally
    DataSourceSituacao.Free;
    FDQuerySituacao.Free;
  end;

end;

procedure TFormCardapioViaCod.Buscar;
begin
  sql := sql_base;
  if ComboBoxCategoria.Text <> '' then
  begin
    sql := sql + ' AND TIPO.NMCATEGORIA LIKE ' + QuotedStr(ComboBoxCategoria.Text);
  end;
  if ComboBoxSitCategoria.Text <> '' then
  begin
    sql := sql + ' AND TIPO.FLSITUACAO = ' + IntToStr(ComboBoxSitCategoria.ItemIndex);
  end;
  if ComboBoxSitProduto.Text <> '' then
  begin
    sql := sql + ' AND PRODUTO.FLSITUACAO = ' + IntToStr(ComboBoxSitProduto.ItemIndex);
  end;
  if EditProduto.Text <> '' then
  begin
    sql := sql + ' AND PRODUTO.IDPRODUTO = ' + IntToStr(codProduto);
  end;
  sql := sql + ' ORDER BY TIPO.NMCATEGORIA ';
  FDQuery.Close;
  FDQuery.SQL.Text := sql;
  FDQuery.Open;
  TFloatField(FDQuery.FieldByName('VLVENDA')).DisplayFormat := 'R$ #,###,##0.00';
end;

end.
