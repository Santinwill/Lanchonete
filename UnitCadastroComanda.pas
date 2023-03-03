unit UnitCadastroComanda;

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
  TFormCadastroComanda = class(TFormCadastroBase)
    FDQueryidcomanda: TLargeintField;
    FDQueryidgarcom: TLargeintField;
    FDQuerydtcomanda: TDateField;
    FDQueryidstatuscomanda: TIntegerField;
    FDQueryvldesconto: TBCDField;
    FDQueryidgarcom_1: TLargeintField;
    FDQuerynmgarcom: TWideStringField;
    FDQueryidstatusgarcom: TLargeintField;
    FDQueryidstatuscomanda_1: TLargeintField;
    FDQuerynmcomanda: TWideStringField;
    Label1: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label3: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label7: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label10: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    ButtonSelecionarGarcom: TButton;
    procedure ButtonInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonSelecionarGarcomClick(Sender: TObject);
    procedure ButtonBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Busca;
  public
    { Public declarations }
  end;

var
  FormCadastroComanda: TFormCadastroComanda;

implementation

{$R *.dfm}

uses UnitCadastroGarcom;


procedure TFormCadastroComanda.Busca;
var
  SQL: string;
begin
  SQL := Base_SQL;
  if EditBuscar.Text <> '' then
  begin
    SQL := SQL + ' WHERE (%S) = (%S)';
    SQL := Format(SQL, [Base_CampoBusca, EditBuscar.Text]);
    if Base_FiltrosExtras <> '' then
      SQL := SQL + ' AND ' + Base_FiltrosExtras;
  end
  else
    if Base_FiltrosExtras <> '' then
      SQL := SQL + ' WHERE ' + Base_FiltrosExtras;

  SQL := SQL + ' ORDER BY ' + BASE_CAMPOBUSCA + ' DESC ';

  FDQuery.Close;
  FDQuery.SQL.Text := SQL;
  FDQuery.Open;
end;

procedure TFormCadastroComanda.ButtonBuscarClick(Sender: TObject);
begin
  Busca;
end;

procedure TFormCadastroComanda.ButtonInserirClick(Sender: TObject);
begin
  inherited;
  FDQuery.FieldByName('DTCOMANDA').AsDateTime := Date;
  FDQuery.FieldByName('IDSTATUSCOMANDA').AsInteger := 1;
  FDQuery.FieldByName('VLDESCONTO').AsFloat := 0;
end;

procedure TFormCadastroComanda.ButtonSelecionarGarcomClick(Sender: TObject);
var
  form: TFormCadastroGarcom;
begin
  form := TFormCadastroGarcom.Create(Self);
  form.Base_FiltrosExtras := ' GARCOM.IDSTATUSGARCOM = 1 ';
  form.ButtonSelecionar.Visible := True;
  form.ShowModal;
  if form.ModalResult = mrOk then
  begin
    FDQuery.FieldByName('IDGARCOM').AsInteger
    := form.FDQuery.FieldByName('IDGARCOM').AsInteger;
    cxDBTextEdit1.Text := Form.FDQuery.FieldByName('NMGARCOM').AsString;
  end;
  form.Free;
end;

procedure TFormCadastroComanda.FormCreate(Sender: TObject);
begin
  LabelAtivoInativo.Caption := 'Comandas';
  LabelBuscar.Caption := 'Cód. Comanda';
  Base_SQL := FDQuery.SQL.Text;
  Base_CampoBusca := 'COMANDA.IDCOMANDA';
  inherited;
end;

procedure TFormCadastroComanda.FormShow(Sender: TObject);
begin
  Busca;
end;

end.
