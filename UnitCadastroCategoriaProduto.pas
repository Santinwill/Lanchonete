unit UnitCadastroCategoriaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinsDefaultPainters, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, ppCtrls, ppDB, ppParameter, ppDesignLayer, ppVar, ppBands,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe;

type
  TFormCadastroCategoriaProduto = class(TFormCadastroBase)
    FDQueryidtipo: TLargeintField;
    FDQuerynmcategoria: TWideStringField;
    FDQuerynmsituacao: TWideStringField;
    FDQueryflsituacao: TLargeintField;
    FDQueryidsituacao: TLargeintField;
    Label1: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label2: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label3: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    ButtonAlterarSituacao: TButton;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure ButtonInserirClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ButtonAlterarSituacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroCategoriaProduto: TFormCadastroCategoriaProduto;

implementation

{$R *.dfm}

procedure TFormCadastroCategoriaProduto.ButtonAlterarClick(Sender: TObject);
begin
  inherited;
  ButtonAlterarSituacao.Visible := True;
end;

procedure TFormCadastroCategoriaProduto.ButtonAlterarSituacaoClick(
  Sender: TObject);
begin
  if FDQuery.FieldByName('FLSITUACAO').AsInteger = 1 then
  begin
    FDQuery.FieldByName('FLSITUACAO').AsInteger := 0;
    ShowMessage('Alterado para Inativo.');
    cxDBTextEdit2.Text := 'Inativo';
  end
  else
  begin
    FDQuery.FieldByName('FLSITUACAO').AsInteger := 1;
    ShowMessage('Alterado para Ativo.');
    cxDBTextEdit2.Text := 'Ativo';
  end;
end;

procedure TFormCadastroCategoriaProduto.ButtonInserirClick(Sender: TObject);
begin
  inherited;
  ButtonAlterarSituacao.Visible := False;
  FDQuery.FieldByName('FLSITUACAO').AsInteger := 1;
end;

procedure TFormCadastroCategoriaProduto.FormCreate(Sender: TObject);
begin
  LabelAtivoInativo.Caption := 'Categorias';
  LabelBuscar.Caption := 'Nome Categoria';
  Base_CampoBusca := 'TIPO.NMCATEGORIA';
  inherited;
end;

end.
