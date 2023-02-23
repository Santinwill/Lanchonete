unit UnitPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxCurrencyEdit, cxDBEdit;

type
  TFormPagamento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    ButtonBuscarComanda: TButton;
    EditCodigoComanda: TEdit;
    ButtonPagarTudo: TButton;
    ButtonPagarItem: TButton;
    DBGridItensComanda: TDBGrid;
    Label2: TLabel;
    DataSourceItensComanda: TDataSource;
    FDQueryItensComanda: TFDQuery;
    FDQueryItensComandanmproduto: TWideStringField;
    FDQueryItensComandavlvenda: TBCDField;
    FDQueryItensComandadtaddcomanda: TDateField;
    Label3: TLabel;
    EditTotalComanda: TEdit;
    Label4: TLabel;
    EditDesconto: TEdit;
    ButtonCancelarPgmt: TButton;
    FDQueryItensComandanmstatusprodutocomanda: TWideStringField;
    ButtonFecharComanda: TButton;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    DataSourceItensPagos: TDataSource;
    FDQueryItensPagos: TFDQuery;
    FDQueryItensComandaiditencomanda: TLargeintField;
    FDQueryItensComandaidcomanda: TLargeintField;
    FDQueryItensComandaidsituacaoprodutocomanda: TLargeintField;
    Label5: TLabel;
    EditTotalPagoItens: TEdit;
    FDQueryItensPagosnmproduto: TWideStringField;
    FDQueryItensPagosvlvenda: TBCDField;
    FDQueryItensPagosnmstatusprodutocomanda: TWideStringField;
    Label7: TLabel;
    EditValorParcial: TEdit;
    ButtonPagarValorParcial: TButton;
    Label8: TLabel;
    EditValorPagar: TEdit;
    EditTotalPagoParcial: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    EditTotalPago: TEdit;
    Label11: TLabel;
    EditDescontoRecebido: TEdit;
    Label12: TLabel;
    EditStatusComanda: TEdit;
    procedure ButtonBuscarComandaClick(Sender: TObject);
    procedure ButtonCancelarPgmtClick(Sender: TObject);
    procedure ButtonPagarTudoClick(Sender: TObject);
    procedure ButtonFecharComandaClick(Sender: TObject);
    procedure ButtonPagarItemClick(Sender: TObject);
    procedure DBGridItensComandaCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure ButtonPagarValorParcialClick(Sender: TObject);
  private
    function TotalComanda(_Aidcomanda: integer): Double;
    procedure ValorDescontoComanda(_Aidcomanda: integer; _AvalorDesconto: String);
    procedure ValorDescontoComandaEfetivo(_Aidcomanda: integer);
    procedure PagamentoComanda(_Aidcomanda, _Aidpgmt, _Aidformpgmt: integer; _AvalorPago: Double);
    function ValorRestanteAPagar(_Aidcomanda: integer): Double;
    procedure AlteraStatusItemComanda(_Aidcomanda: Integer);
    procedure Buscar;
    procedure AlterStatusItem(_Aiditem: integer);
    procedure Desconto(_Aidcomanda, _AtotalComanda, _Adesconto: String);
    function ValorRestanteAPagarParcial(_Aidcomanda: integer): Double;
    procedure StatusComanda(_Aidcomanda: integer);
  public
    { Public declarations }
    iditem: Integer;
  end;

var
  FormPagamento: TFormPagamento;

implementation

{$R *.dfm}

uses UnitPrincipal, UnitCadastroComanda, UnitCadastroFormaPagamento;

procedure TFormPagamento.AlteraStatusItemComanda(_Aidcomanda: Integer);
var
  FDQueryAlteraStatusItemComanda: TFDQuery;
begin
  FDQueryAlteraStatusItemComanda := TFDQuery.Create(nil);
  FDQueryAlteraStatusItemComanda.Connection := FormPrincipal.FDConnection;
  try
    FDQueryAlteraStatusItemComanda.SQL.Text
    := ' SELECT ITENCOMANDA.IDITENCOMANDA, ' +
       '        ITENCOMANDA.IDCOMANDA, ' +
	     '        ITENCOMANDA.IDSITUACAOPRODUTOCOMANDA ' +
       '   FROM ITENCOMANDA ' +
       '  WHERE ITENCOMANDA.IDCOMANDA = :IDCOMANDA ' +
       '    AND ITENCOMANDA.IDSITUACAOPRODUTOCOMANDA = 1 ';
    FDQueryAlteraStatusItemComanda.ParamByName('IDCOMANDA').AsInteger := _Aidcomanda;
    FDQueryAlteraStatusItemComanda.Open;
    FDQueryAlteraStatusItemComanda.First;
    while not FDQueryAlteraStatusItemComanda.Eof do
    begin
      FDQueryAlteraStatusItemComanda.Edit;
      FDQueryAlteraStatusItemComanda.FieldByName('IDSITUACAOPRODUTOCOMANDA').AsInteger := 3;
      FDQueryAlteraStatusItemComanda.Post;
      FDQueryAlteraStatusItemComanda.Next;
    end;
  finally
    FDQueryAlteraStatusItemComanda.Free;
  end;
end;

procedure TFormPagamento.AlterStatusItem(_Aiditem: integer);
var
  FDQueryAlteraStatusItemComanda: TFDQuery;
begin
  FDQueryAlteraStatusItemComanda := TFDQuery.Create(nil);
  FDQueryAlteraStatusItemComanda.Connection := FormPrincipal.FDConnection;
  try
    FDQueryAlteraStatusItemComanda.SQL.Text
    := ' SELECT ITENCOMANDA.IDITENCOMANDA, ' +
       '        ITENCOMANDA.IDCOMANDA, ' +
	     '        ITENCOMANDA.IDSITUACAOPRODUTOCOMANDA ' +
       '   FROM ITENCOMANDA ' +
       '  WHERE ITENCOMANDA.IDITENCOMANDA = :IDITENCOMANDA ' +
       '    AND ITENCOMANDA.IDSITUACAOPRODUTOCOMANDA = 1 ';
    FDQueryAlteraStatusItemComanda.ParamByName('IDITENCOMANDA').AsInteger := _Aiditem;
    FDQueryAlteraStatusItemComanda.Open;
    FDQueryAlteraStatusItemComanda.Edit;
    FDQueryAlteraStatusItemComanda.FieldByName('IDSITUACAOPRODUTOCOMANDA').AsInteger := 3;
    FDQueryAlteraStatusItemComanda.Post;
  finally
    FDQueryAlteraStatusItemComanda.Free;
  end;
end;

procedure TFormPagamento.Buscar;
begin
  if EditCodigoComanda.Text = '' then
    Exit;
  ButtonPagarTudo.Enabled := True;
  ButtonPagarValorParcial.Enabled := True;
  ButtonPagarItem.Enabled := False;
  FDQueryItensComanda.ParamByName('IDCOMANDA').AsInteger
  := StrToInt(EditCodigoComanda.Text);
  FDQueryItensPagos.ParamByName('IDCOMANDA').AsInteger
  := StrToInt(EditCodigoComanda.Text);
  EditTotalComanda.Text := FloatToStr(TotalComanda
                           (StrToInt(EditCodigoComanda.Text)));
  FDQueryItensPagos.Refresh;
  FDQueryItensComanda.Refresh;
  StatusComanda(StrToInt(EditCodigoComanda.Text));
  ValorDescontoComandaEfetivo(StrToInt(EditCodigoComanda.Text));
  EditTotalPagoItens.Text
  := FloatToStr(ValorRestanteAPagar(StrToInt(EditCodigoComanda.Text)));
  EditTotalPagoParcial.Text
  := FloatToStr(ValorRestanteAPagarParcial(StrToInt(EditCodigoComanda.Text)));
  EditTotalPago.Text
  := FloatToStr(StrToFloat(EditTotalPagoItens.Text)
               + StrToFloat(EditTotalPagoParcial.Text)
               - StrToFloat(EditDescontoRecebido.Text));
  EditValorParcial.Text := '0';
  if FDQueryItensComanda.IsEmpty then
  begin
    EditValorPagar.Text := '0';
  end
  else
  begin
    EditValorPagar.Text
    := FloatToStr(StrToFloat(EditTotalComanda.Text) - StrToFloat(EditTotalPagoParcial.Text));
  end;
  if (StrToFloat(EditValorPagar.Text) = 0) then
  begin
    ButtonFecharComanda.Enabled := True;
  end
  else
    ButtonFecharComanda.Enabled := False;
end;

procedure TFormPagamento.ButtonBuscarComandaClick(Sender: TObject);
begin
  Buscar;
end;

procedure TFormPagamento.ButtonCancelarPgmtClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPagamento.ButtonFecharComandaClick(Sender: TObject);
var
  FDQueryFechar: TFDQuery;
  Status: Integer;
begin
  FDQueryFechar := TFDQuery.Create(nil);
  try
    FDQueryFechar.Connection := FormPrincipal.FDConnection;
    FDQueryFechar.SQL.Text:= 'SELECT COMANDA.IDCOMANDA, ' +
                             '       COMANDA.IDSTATUSCOMANDA ' +
                             '  FROM COMANDA ' +
                             ' WHERE COMANDA.IDCOMANDA = :IDCOMANDA ';
    FDQueryFechar.ParamByName('IDCOMANDA').AsInteger := StrToInt(EditCodigoComanda.Text);
    FDQueryFechar.Open;
    Status := FDQueryFechar.FieldByName('IDSTATUSCOMANDA').AsInteger;
    if Status = 0 then
    begin
      ShowMessage('Comanda já Finalizada!');
      Exit;
    end;
    FDQueryFechar.Edit;
    FDQueryFechar.FieldByName('IDSTATUSCOMANDA').AsInteger := 0;
    FDQueryFechar.Post;
    AlteraStatusItemComanda(StrToInt(EditCodigoComanda.Text));
    Buscar;
    ShowMessage('Comanda ' + EditCodigoComanda.Text + ' fechada com sucesso.');
  finally
    FDQueryFechar.Free;
  end;
end;

procedure TFormPagamento.ButtonPagarItemClick(Sender: TObject);
var
  form: TFormCadastroFormaPagamento;
  idcomanda, formapgmt: integer;
  valor: Double;
begin
  if FDQueryItensComanda.IsEmpty then
    Exit;

  if MessageDlg('Alterar item para pago?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    idcomanda := FDQueryItensComanda.FieldByName('IDCOMANDA').AsInteger;
    valor := FDQueryItensComanda.FieldByName('VLVENDA').AsFloat;
    if valor > StrToFloat(EditValorPagar.Text) then
    begin
      ShowMessage('Operação inválida');
      Exit;
    end;
    formapgmt := 0;
    form := TFormCadastroFormaPagamento.Create(Self);
    form.Base_FiltrosExtras := ' FORMAPGMT.IDSTATUSFORMAPGMT = 1 ';
    form.ButtonSelecionar.Visible := True;
    form.ShowModal;
    if form.ModalResult = mrOk then
    begin
      formapgmt := form.FDQuery.FieldByName('IDFORMAPGMT').AsInteger;
    end;
    if formapgmt > 0 then
    begin
      PagamentoComanda(idcomanda, 0, formapgmt, valor);
      AlterStatusItem(iditem);
    end;
    Buscar;
    form.Free;
  end
  else
    Exit;
end;

procedure TFormPagamento.ButtonPagarTudoClick(Sender: TObject);
var
  form: TFormCadastroFormaPagamento;
  formapgmt: integer;
begin
  if MessageDlg('Quitar Comanda?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if StrToFloat(EditValorPagar.Text) > 0 then
    begin
      Desconto(EditCodigoComanda.Text, EditTotalComanda.Text, EditDesconto.Text);
      EditDesconto.Text := '0';
      formapgmt := 0;
      form := TFormCadastroFormaPagamento.Create(Self);
      form.Base_FiltrosExtras := ' FORMAPGMT.IDSTATUSFORMAPGMT = 1 ';
      form.ButtonSelecionar.Visible := True;
      form.ShowModal;
      if form.ModalResult = mrOk then
      begin
        formapgmt := form.FDQuery.FieldByName('IDFORMAPGMT').AsInteger;
      end;
      if formapgmt > 0 then
      begin
        PagamentoComanda(StrToInt(EditCodigoComanda.Text), 0 ,formapgmt, StrToFloat(EditValorPagar.Text));
        AlteraStatusItemComanda(StrToInt(EditCodigoComanda.Text));
      end;
      Buscar;
      form.Free;
    end
    else
    begin
      ShowMessage('Valor Inválido');
      Exit;
    end;
  end;
end;

procedure TFormPagamento.ButtonPagarValorParcialClick(Sender: TObject);
var
  form: TFormCadastroFormaPagamento;
  formapgmt: integer;
begin
  if MessageDlg('Pagar Parcial?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if (StrToFloat(EditValorParcial.Text) > 0)
    and ((StrToFloat(EditValorParcial.Text)) <= (StrToFloat(EditValorPagar.Text))) then
    begin
      Desconto(EditCodigoComanda.Text, EditTotalComanda.Text, EditDesconto.Text);
      EditDesconto.Text := '0';
      formapgmt := 0;
      form := TFormCadastroFormaPagamento.Create(Self);
      form.Base_FiltrosExtras := ' FORMAPGMT.IDSTATUSFORMAPGMT = 1 ';
      form.ButtonSelecionar.Visible := True;
      form.ShowModal;
      if form.ModalResult = mrOk then
      begin
        formapgmt := form.FDQuery.FieldByName('IDFORMAPGMT').AsInteger;
      end;
      if formapgmt > 0 then
      begin
        PagamentoComanda(StrToInt(EditCodigoComanda.Text), 1 ,formapgmt, StrToFloat(EditValorParcial.Text));
      end;
      Buscar;
      form.Free;
    end
    else
    begin
      ShowMessage('Valor Inválido');
      Exit;
    end;
  end;
end;

procedure TFormPagamento.DBGridItensComandaCellClick(Column: TColumn);
begin
  iditem := DBGridItensComanda.Fields[5].value;
  ButtonPagarItem.Enabled := True;
end;

procedure TFormPagamento.Desconto(_Aidcomanda, _AtotalComanda,
  _Adesconto: String);
var
  valor: Double;
begin
  if FDQueryItensComanda.IsEmpty then
    Exit;

  valor := StrToFloat(_Adesconto);
  if valor = 0 then
    Exit;

  if (valor < 0) or (valor > 1/2) then
  begin
    ShowMessage('Apenas valores maiores que R$0,0 e menores que R$0,6');
    Exit;
  end;
  if StrToFloat(_AtotalComanda) < 10 then
  begin
    ShowMessage('Desconto possivel apenas para comandas com mais de R$10,00');
    Exit;
  end;
  ValorDescontoComanda(StrToInt(_Aidcomanda), _Adesconto);
  EditTotalComanda.Text := FloatToStr(TotalComanda
                         (StrToInt(_Aidcomanda)));
end;

procedure TFormPagamento.FormCreate(Sender: TObject);
begin
  EditDesconto.Text := '0';
end;

procedure TFormPagamento.PagamentoComanda(_Aidcomanda, _Aidpgmt, _Aidformpgmt: integer; _AvalorPago: Double);
var
  FDQueryPagamentoComanda: TFDQuery;
begin
  FDQueryPagamentoComanda := TFDQuery.Create(nil);
  try
    FDQueryPagamentoComanda.Connection := FormPrincipal.FDConnection;
    FDQueryPagamentoComanda.SQL.Text
    := 'SELECT * FROM FORMAPGMTVALORES WHERE IDCOMANDA = :IDCOMANDA';
    FDQueryPagamentoComanda.ParamByName('IDCOMANDA').AsInteger := _Aidcomanda;
    FDQueryPagamentoComanda.Open;
    FDQueryPagamentoComanda.Append;
    FDQueryPagamentoComanda.FieldByName('IDCOMANDA').AsInteger := _Aidcomanda;
    FDQueryPagamentoComanda.FieldByName('IDFORMAPGMT').AsInteger := _Aidformpgmt;
    FDQueryPagamentoComanda.FieldByName('VLPAGO').AsFloat := _AvalorPago;
    FDQueryPagamentoComanda.FieldByName('DATAPAGMT').AsDateTime := Date;
    FDQueryPagamentoComanda.FieldByName('IDPGMT').AsInteger := _Aidpgmt;
    FDQueryPagamentoComanda.Post;
  finally
    FDQueryPagamentoComanda.Free;
  end;
end;

procedure TFormPagamento.StatusComanda(_Aidcomanda: integer);
var
  FDQueryStatus: TFDQuery;
  comparador: Integer;
begin
  FDQueryStatus := TFDQuery.Create(nil);
  try
    FDQueryStatus.Connection := FormPrincipal.FDConnection;
    FDQueryStatus.SQL.Text := 'SELECT STATUSCOMANDA.NMCOMANDA,' +
                              '       COMANDA.IDSTATUSCOMANDA ' +
                              '  FROM STATUSCOMANDA           ' +
                              '  JOIN COMANDA                 ' +
                              '    ON STATUSCOMANDA.IDSTATUSCOMANDA = COMANDA.IDSTATUSCOMANDA '+
                              ' WHERE COMANDA.IDCOMANDA = :IDCOMANDA ';
    FDQueryStatus.ParamByName('IDCOMANDA').AsInteger := _Aidcomanda;
    FDQueryStatus.Open;
    comparador := FDQueryStatus.FieldByName('IDSTATUSCOMANDA').AsInteger;
    EditStatusComanda.Text :=  FDQueryStatus.FieldByName('NMCOMANDA').AsString;
    if comparador = 1 then
      EditStatusComanda.Color := $0041FC5C
    else
      EditStatusComanda.Color := $005B5BFF;
  finally

  end;
end;

function TFormPagamento.TotalComanda(_Aidcomanda: integer): Double;
var
  FDQueryTotalComanda: TFDQuery;
begin
  Result := 0;
  FDQueryTotalComanda := TFDQuery.Create(nil);
  try
    FDQueryTotalComanda.Connection := FormPrincipal.FDConnection;
    FDQueryTotalComanda.SQL.Text
    := 'SELECT SUM(ITENCOMANDA.VLVENDA) '+
    '          - COMANDA.VLDESCONTO AS TOTALLIQUIDO ' +
    '     FROM ITENCOMANDA ' +
    '     JOIN COMANDA ' +
    '      ON ITENCOMANDA.IDCOMANDA = COMANDA.IDCOMANDA ' +
    '   WHERE ITENCOMANDA.IDCOMANDA = :IDCOMANDA ' +
    '     AND ITENCOMANDA.IDSITUACAOPRODUTOCOMANDA = 1 ' +
    'GROUP BY COMANDA.VLDESCONTO';
    FDQueryTotalComanda.ParamByName('IDCOMANDA').AsInteger := _Aidcomanda;
    FDQueryTotalComanda.Open;
    Result := FDQueryTotalComanda.FieldByName('TOTALLIQUIDO').AsFloat;
  finally
    FDQueryTotalComanda.Free;
  end;
end;

procedure TFormPagamento.ValorDescontoComanda(_Aidcomanda: integer;
  _AvalorDesconto: string);
var
  FDQueryDescontoComanda: TFDQuery;
begin
  FDQueryDescontoComanda := TFDQuery.Create(nil);
  try
    FDQueryDescontoComanda.Connection := FormPrincipal.FDConnection;
    FDQueryDescontoComanda.SQL.Text := 'SELECT COMANDA.IDCOMANDA, ' +
                                       '       COMANDA.VLDESCONTO ' +
                                       '  FROM COMANDA ' +
                                       ' WHERE COMANDA.IDCOMANDA = :IDCOMANDA ';
    FDQueryDescontoComanda.ParamByName('IDCOMANDA').AsInteger := _Aidcomanda;
    FDQueryDescontoComanda.Open;
    FDQueryDescontoComanda.Edit;
    FDQueryDescontoComanda.FieldByName('VLDESCONTO').AsFloat := StrToFloat(_AvalorDesconto);
    FDQueryDescontoComanda.Post;
  finally
    FDQueryDescontoComanda.Free;
  end;
  ShowMessage('Valor de Desconto Atualizado com sucesso');

end;

procedure TFormPagamento.ValorDescontoComandaEfetivo(_Aidcomanda: integer);
var
  FDQueryDesconto: TFDQuery;
begin
 // result := 0;
  FDQueryDesconto := TFDQuery.Create(nil);
  try
    FDQueryDesconto.Connection := FormPrincipal.FDConnection;
    FDQueryDesconto.SQL.Text := 'SELECT COMANDA.VLDESCONTO ' +
                                '  FROM COMANDA ' +
                                ' WHERE COMANDA.IDCOMANDA = :IDCOMANDA';
    FDQueryDesconto.ParamByName('IDCOMANDA').AsInteger := _Aidcomanda;
    FDQueryDesconto.Open;
    EditDescontoRecebido.Text := FloatToStr(
                                 FDQueryDesconto.FieldByName('VLDESCONTO').AsFloat);
  finally
    FDQueryDesconto.Free;
  end;
end;

function TFormPagamento.ValorRestanteAPagar(_Aidcomanda: integer): Double;
var
  FDQueryValorRestanteAPagar: TFDQuery;
begin
  Result := 0;
  FDQueryValorRestanteAPagar := TFDQuery.Create(nil);
  try
    FDQueryValorRestanteAPagar.Connection := FormPrincipal.FDConnection;
    FDQueryValorRestanteAPagar.SQL.Text
    := 'SELECT SUM(FORMAPGMTVALORES.VLPAGO) AS TOTALPAGO ' +
       '  FROM FORMAPGMTVALORES' +
       ' WHERE FORMAPGMTVALORES.IDCOMANDA = :IDCOMANDA' +
       '   AND FORMAPGMTVALORES.IDPGMT = 0 ';
    FDQueryValorRestanteAPagar.ParamByName('IDCOMANDA').AsInteger := _Aidcomanda;
    FDQueryValorRestanteAPagar.Open;
    Result := FDQueryValorRestanteAPagar.FieldByName('TOTALPAGO').AsFloat;
  finally
     FDQueryValorRestanteAPagar.Free;
  end;
end;

function TFormPagamento.ValorRestanteAPagarParcial(
  _Aidcomanda: integer): Double;
var
  FDQueryValorRestanteAPagarParcial: TFDQuery;
begin
  Result := 0;
  FDQueryValorRestanteAPagarParcial := TFDQuery.Create(nil);
  try
    FDQueryValorRestanteAPagarParcial.Connection := FormPrincipal.FDConnection;
    FDQueryValorRestanteAPagarParcial.SQL.Text
    := 'SELECT SUM(FORMAPGMTVALORES.VLPAGO) AS TOTALPAGO ' +
       '  FROM FORMAPGMTVALORES' +
       ' WHERE FORMAPGMTVALORES.IDCOMANDA = :IDCOMANDA' +
       '   AND FORMAPGMTVALORES.IDPGMT = 1 ';
    FDQueryValorRestanteAPagarParcial.ParamByName('IDCOMANDA').AsInteger := _Aidcomanda;
    FDQueryValorRestanteAPagarParcial.Open;
    Result := FDQueryValorRestanteAPagarParcial.FieldByName('TOTALPAGO').AsFloat;
  finally
     FDQueryValorRestanteAPagarParcial.Free;
  end;
end;

end.
