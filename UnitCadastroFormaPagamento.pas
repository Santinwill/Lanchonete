unit UnitCadastroFormaPagamento;

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
  TFormCadastroFormaPagamento = class(TFormCadastroBase)
    FDQueryidformapgmt: TLargeintField;
    FDQuerynmformapgmt: TWideStringField;
    FDQueryidstatusformapgmt: TLargeintField;
    FDQueryidsituacao: TLargeintField;
    FDQuerynmsituacao: TWideStringField;
    Label1: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label2: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label5: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    ButtonAlterarSituacaoFormpgmt: TButton;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure ButtonInserirClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ButtonAlterarSituacaoFormpgmtClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroFormaPagamento: TFormCadastroFormaPagamento;

implementation

{$R *.dfm}

procedure TFormCadastroFormaPagamento.ButtonAlterarClick(Sender: TObject);
begin
  inherited;
  ButtonAlterarSituacaoFormpgmt.Visible := True;
end;

procedure TFormCadastroFormaPagamento.ButtonAlterarSituacaoFormpgmtClick(
  Sender: TObject);
begin
  if FDQuery.FieldByName('IDSTATUSFORMAPGMT').AsInteger = 1 then
  begin
    FDQuery.FieldByName('IDSTATUSFORMAPGMT').AsInteger := 0;
    ShowMessage('Alterado para Inativo.');
    cxDBTextEdit2.Text := 'Inativo';
  end
  else
  begin
    FDQuery.FieldByName('IDSTATUSFORMAPGMT').AsInteger := 1;
    ShowMessage('Alterado para Ativo.');
    cxDBTextEdit2.Text := 'Ativo';
  end;
end;


procedure TFormCadastroFormaPagamento.ButtonInserirClick(Sender: TObject);
begin
  inherited;
  ButtonAlterarSituacaoFormpgmt.Visible := False;
  FDQuery.FieldByName('IDSTATUSFORMAPGMT').AsInteger := 1;
end;

procedure TFormCadastroFormaPagamento.FormCreate(Sender: TObject);
begin
  LabelAtivoInativo.Caption := 'Formas de Pagamento';
  LabelBuscar.Caption := 'Forma de Pgmt';
  Base_CampoBusca := 'NMFORMAPGMT';
  inherited;
end;

end.
