unit UnitCadastroCardapio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinsDefaultPainters, cxMemo, cxDBEdit, cxCurrencyEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit;

type
  TFormCadastroCardapio = class(TFormCadastroBase)
    FDQueryidproduto: TLargeintField;
    FDQuerynmproduto: TWideStringField;
    FDQueryvlvenda: TBCDField;
    FDQuerydescricao: TWideMemoField;
    FDQueryidtipo: TLargeintField;
    FDQueryflsituacao: TLargeintField;
    FDQueryidtipo_1: TLargeintField;
    FDQuerynmcategoria: TWideStringField;
    FDQueryflsituacao_1: TLargeintField;
    FDQueryidsituacao: TLargeintField;
    FDQuerynmsituacao: TWideStringField;
    Label1: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label2: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label3: TLabel;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    Label4: TLabel;
    cxDBMemo1: TcxDBMemo;
    cxDBTextEdit2: TcxDBTextEdit;
    Label11: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    ButtonBuscarCategoria: TButton;
    ButtonAlterarSituacaoCardapio: TButton;
    Label5: TLabel;
    procedure ButtonBuscarCategoriaClick(Sender: TObject);
    procedure ButtonInserirClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ButtonAlterarSituacaoCardapioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroCardapio: TFormCadastroCardapio;

implementation

{$R *.dfm}

uses UnitCadastroCategoriaProduto;

procedure TFormCadastroCardapio.ButtonAlterarClick(Sender: TObject);
begin
  inherited;
  ButtonAlterarSituacaoCardapio.Visible := True;
end;

procedure TFormCadastroCardapio.ButtonAlterarSituacaoCardapioClick(
  Sender: TObject);
begin
  if FDQuery.FieldByName('FLSITUACAO').AsInteger = 1 then
  begin
    FDQuery.FieldByName('FLSITUACAO').AsInteger := 0;
    ShowMessage('Alterado para Inativo.');
  end
  else
  begin
    FDQuery.FieldByName('FLSITUACAO').AsInteger := 1;
    ShowMessage('Alterado para Ativo.');
  end;
end;


procedure TFormCadastroCardapio.ButtonBuscarCategoriaClick(Sender: TObject);
var
  form: TFormCadastroCategoriaProduto;
begin
  form := TFormCadastroCategoriaProduto.Create(Self);
  form.Base_FiltrosExtras := ' TIPO.FLSITUACAO = 1';
  form.ButtonSelecionar.Visible := True;
  form.ShowModal;
  if form.ModalResult = mrOk then
  begin
    FDQuery.FieldByName('IDTIPO').AsInteger
    := form.FDQuery.FieldByName('IDTIPO').AsInteger;
  end;
  form.Free;
end;

procedure TFormCadastroCardapio.ButtonInserirClick(Sender: TObject);
begin
  inherited;
  ButtonAlterarSituacaoCardapio.Visible := False;
  FDQuery.FieldByName('FLSITUACAO').AsInteger := 1;
end;

procedure TFormCadastroCardapio.FormCreate(Sender: TObject);
begin
  LabelAtivoInativo.Caption := 'Cardápio';
  LabelBuscar.Caption := 'Nome Produto';
  Base_CampoBusca := 'NMPRODUTO';
  inherited;
end;

end.
