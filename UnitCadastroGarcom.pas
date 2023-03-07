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
  cxSpinEdit, ppCtrls, ppDB, ppParameter, ppDesignLayer, ppVar, ppBands,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe;

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
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure ButtonInserirClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ButtonAlterarSituacaoGarcomClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
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
    cxDBTextEdit2.Text := 'Inativo';
  end
  else
  begin
    FDQuery.FieldByName('IDSTATUSGARCOM').AsInteger := 1;
    ShowMessage('Alterado para Ativo.');
    cxDBTextEdit2.Text := 'Ativo';
  end;
end;


procedure TFormCadastroGarcom.ButtonImprimirClick(Sender: TObject);
var
  contador: integer;
begin
  contador := DBGrid1.DataSource.DataSet.RecordCount;
  ppLabeltotalregistro.Caption := 'Total de ' + IntToStr(contador) + ' registros.';
  inherited;
end;

procedure TFormCadastroGarcom.ButtonInserirClick(Sender: TObject);
begin
  inherited;
  ButtonAlterarSituacaoGarcom.Visible := False;
  FDQuery.FieldByName('IDSTATUSGARCOM').AsInteger := 1;
end;

procedure TFormCadastroGarcom.FormCreate(Sender: TObject);
begin
  LabelAtivoInativo.Caption := 'Garçons';
  LabelBuscar.Caption := 'Nome do Garçom';
  Base_CampoBusca := 'NMGARCOM';
  inherited;
end;

end.
