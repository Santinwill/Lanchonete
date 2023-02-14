unit UnitCadastroGarcom;

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
  cxSpinEdit;

type
  TFormCadastroGarcom = class(TFormCadastroBase)
    FDQueryidgarcom: TLargeintField;
    FDQuerynmgarcom: TWideStringField;
    FDQueryidstatusgarcom: TLargeintField;
    FDQueryidsituacao: TLargeintField;
    FDQuerynmsituacao: TWideStringField;
    Label1: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label2: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label5: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    ButtonAlterarSituacaoGarcom: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonInserirClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ButtonAlterarSituacaoGarcomClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroGarcom: TFormCadastroGarcom;

implementation

{$R *.dfm}

procedure TFormCadastroGarcom.ButtonAlterarClick(Sender: TObject);
begin
  inherited;
  ButtonAlterarSituacaoGarcom.Visible := True;
end;

procedure TFormCadastroGarcom.ButtonAlterarSituacaoGarcomClick(Sender: TObject);
begin
  if FDQuery.FieldByName('IDSTATUSGARCOM').AsInteger = 1 then
  begin
    FDQuery.FieldByName('IDSTATUSGARCOM').AsInteger := 0;
    ShowMessage('Alterado para Inativo.');
  end
  else
  begin
    FDQuery.FieldByName('IDSTATUSGARCOM').AsInteger := 1;
    ShowMessage('Alterado para Ativo.');
  end;
end;


procedure TFormCadastroGarcom.ButtonInserirClick(Sender: TObject);
begin
  inherited;
  ButtonAlterarSituacaoGarcom.Visible := False;
  FDQuery.FieldByName('IDSTATUSGARCOM').AsInteger := 1;
end;

procedure TFormCadastroGarcom.FormCreate(Sender: TObject);
begin
  LabelAtivoInativo.Caption := 'Gar�ons';
  LabelBuscar.Caption := 'Nome do Gar�om';
  Base_CampoBusca := 'NMGARCOM';
  inherited;
end;

end.