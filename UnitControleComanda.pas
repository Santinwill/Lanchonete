unit UnitControleComanda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinsDefaultPainters, cxDBEdit, cxDropDownEdit, cxCalendar,
  cxTextEdit, cxMaskEdit, cxSpinEdit;

type
  TFormControleComanda = class(TFormCadastroBase)
    FDQueryiditencomanda: TLargeintField;
    FDQueryidcomanda: TLargeintField;
    FDQueryidproduto: TLargeintField;
    FDQuerydtaddcomanda: TDateField;
    FDQueryvlvenda: TBCDField;
    FDQueryidsituacaoprodutocomanda: TLargeintField;
    FDQueryidcomanda_1: TLargeintField;
    FDQueryidgarcom: TLargeintField;
    FDQuerydtcomanda: TDateField;
    FDQueryidstatuscomanda: TIntegerField;
    FDQueryvldesconto: TBCDField;
    FDQueryidgarcom_1: TLargeintField;
    FDQuerynmgarcom: TWideStringField;
    FDQuerynmproduto: TWideStringField;
    FDQuerynmstatusprodutocomanda: TWideStringField;
    Label1: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label3: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label12: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label13: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label14: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    ButtonInserirProduto: TButton;
    ButtonCancelarProduto: TButton;
    ButtonSelecionarComanda: TButton;
    Label2: TLabel;
    procedure ButtonInserirClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonCancelarProdutoClick(Sender: TObject);
    procedure ButtonSelecionarComandaClick(Sender: TObject);
    procedure ButtonInserirProdutoClick(Sender: TObject);
    procedure ButtonAlternarClick(Sender: TObject);
    procedure ButtonBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormControleComanda: TFormControleComanda;

implementation

{$R *.dfm}

uses UnitCadastroCardapio, UnitCadastroComanda;

procedure TFormControleComanda.ButtonAlterarClick(Sender: TObject);
begin
  ButtonCancelarProduto.Visible := True;
  ButtonInserirProduto.Visible := False;
  ButtonSelecionarComanda.Visible := False;
  inherited;
end;

procedure TFormControleComanda.ButtonAlternarClick(Sender: TObject);
begin
  FDQuery.Close;
  if FDQuery.ParamByName('STATUSCOMANDA').AsInteger = 1 then
  begin
    FDQuery.ParamByName('STATUSCOMANDA').AsInteger := 0;
    LabelAtivoInativo.Caption := 'Comandas Fechadas';
    ButtonAlterar.Visible := False;
  end
  else
  begin
    FDQuery.ParamByName('STATUSCOMANDA').AsInteger := 1;
    LabelAtivoInativo.Caption := 'Comandas Abertas';
    ButtonAlterar.Visible := True;
  end;
  FDQuery.Open;
end;

procedure TFormControleComanda.ButtonBuscarClick(Sender: TObject);
var
  SQL: string;
begin
  SQL := Base_SQL;
  if EditBuscar.Text <> '' then
  begin
    SQL := SQL + ' AND (%S) = (%S)';
    SQL := Format(SQL, [Base_CampoBusca, EditBuscar.Text]);
  end;
  SQL := SQL + ' ORDER BY ' + BASE_CAMPOBUSCA;

  FDQuery.Close;
  FDQuery.SQL.Text := SQL;
  FDQuery.Open;
end;

procedure TFormControleComanda.ButtonCancelarProdutoClick(Sender: TObject);
begin
  if FDQuery.FieldByName('IDSITUACAOPRODUTOCOMANDA').AsInteger = 1 then
  begin
    FDQuery.FieldByName('IDSITUACAOPRODUTOCOMANDA').AsInteger := 0;
    ShowMessage('Alterado para cancelado.');
  end
  else
  begin
    FDQuery.FieldByName('IDSITUACAOPRODUTOCOMANDA').AsInteger := 1;
    ShowMessage('Alterado para Ativo');
  end;

end;

procedure TFormControleComanda.ButtonInserirClick(Sender: TObject);
begin
  ButtonCancelarProduto.Visible := False;
  ButtonInserirProduto.Visible := True;
  ButtonSelecionarComanda.Visible := True;
  inherited;
  FDQuery.FieldByName('IDSITUACAOPRODUTOCOMANDA').AsInteger := 1;
end;

procedure TFormControleComanda.ButtonInserirProdutoClick(Sender: TObject);
var
  form: TFormCadastroCardapio;
begin
  form := TFormCadastroCardapio.Create(Self);
  form.Base_FiltrosExtras := ' PRODUTO.FLSITUACAO = 1 ';
  form.ButtonSelecionar.Visible := True;
  form.ShowModal;
  if form.ModalResult = mrOk then
  begin
    if form.FDQuery.FieldByName('flsituacao').AsInteger = 0 then
    begin
      ShowMessage('Este produto está inativo.');
      exit;
    end;


    FDQuery.FieldByName('IDPRODUTO').AsInteger
    := form.FDQuery.FieldByName('IDPRODUTO').AsInteger;
    FDQuery.FieldByName('VLVENDA').AsFloat
    := form.FDQuery.FieldByName('VLVENDA').AsFloat;
  end;
  form.Free;
end;

procedure TFormControleComanda.ButtonSelecionarComandaClick(Sender: TObject);
var
  form: TFormCadastroComanda;
begin
  form := TFormCadastroComanda.Create(Self);
  form.Base_FiltrosExtras := ' COMANDA.IDSTATUSCOMANDA = 1 ';
  form.ButtonSelecionar.Visible := True;
  form.ShowModal;
  if form.ModalResult = mrOk then
  begin
    FDQuery.FieldByName('IDCOMANDA').AsInteger
    := form.FDQuery.FieldByName('IDCOMANDA').AsInteger;
  end;
  form.Free;
end;

procedure TFormControleComanda.FormCreate(Sender: TObject);
begin
  LabelBuscar.Caption := 'Cód. Comanda';
  LabelAtivoInativo.Caption := 'Comandas Abertas';
  Base_SQL := FDQuery.SQL.Text;
  Base_CampoBusca := 'ITENCOMANDA.IDCOMANDA';
  inherited;
end;
end.
