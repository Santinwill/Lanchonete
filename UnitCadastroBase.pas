unit UnitCadastroBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFormCadastroBase = class(TForm)
    PageControl: TPageControl;
    TabSheetConsulta: TTabSheet;
    TabSheetCadastro: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EditBuscar: TEdit;
    ButtonBuscar: TButton;
    ButtonInserir: TButton;
    ButtonAlterar: TButton;
    ButtonImprimir: TButton;
    ButtonSelecionar: TButton;
    ButtonFechar: TButton;
    FDQuery: TFDQuery;
    DataSource: TDataSource;
    Panel3: TPanel;
    ButtonSalvar: TButton;
    ButtonCancelar: TButton;
    LabelBuscar: TLabel;
    LabelAtivoInativo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonInserirClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ButtonFecharClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonBuscarClick(Sender: TObject);
    procedure ButtonSelecionarClick(Sender: TObject);
    procedure ButtonAlternarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ExibirConsultaCadastro(n: Integer);
    procedure Busca;

  public
    { Public declarations }
    Base_SQL: String;
    Base_CampoBusca: String;
    Base_FiltrosExtras: String;
  end;

var
  FormCadastroBase: TFormCadastroBase;

implementation

{$R *.dfm}

uses UnitPrincipal;

{ TFormCadastroBase }

procedure TFormCadastroBase.Busca;
var
  SQL: string;
begin
  SQL := Base_SQL;

  if EditBuscar.Text <> '' then
  begin
    SQL := SQL + ' WHERE UPPER(%S) LIKE UPPER(%S)';
    SQL := Format(SQL, [Base_CampoBusca,
           QuotedStr('%' + EditBuscar.Text + '%')]);

    if Base_FiltrosExtras <> '' then
      SQL := SQL + ' AND ' + Base_FiltrosExtras;
  end
  else
    if Base_FiltrosExtras <> '' then
      SQL := SQL + ' WHERE ' + Base_FiltrosExtras;

  SQL := SQL + ' ORDER BY ' + BASE_CAMPOBUSCA;
  FDQuery.Close;
  FDQuery.SQL.Text := SQL;
  FDQuery.Open;
end;

procedure TFormCadastroBase.ButtonAlterarClick(Sender: TObject);
begin
  if FDQuery.IsEmpty then
    Exit;

  ExibirConsultaCadastro(1);
  FDQuery.Edit;
end;

procedure TFormCadastroBase.ButtonAlternarClick(Sender: TObject);
begin
  EditBuscar.Text := '';
  Busca;
  EditBuscar.ReadOnly := True;
  ButtonBuscar.Enabled := False;
  FDQuery.Close;
end;

procedure TFormCadastroBase.ButtonBuscarClick(Sender: TObject);
begin
  Busca;
end;

procedure TFormCadastroBase.ButtonCancelarClick(Sender: TObject);
begin
  ExibirConsultaCadastro(0);
  FDQuery.Cancel;
end;

procedure TFormCadastroBase.ButtonFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastroBase.ButtonInserirClick(Sender: TObject);
begin
  ExibirConsultaCadastro(1);
  FDQuery.Append;
end;

procedure TFormCadastroBase.ButtonSalvarClick(Sender: TObject);
begin
  FDQuery.Post;
  ExibirConsultaCadastro(0);
  FDQuery.Refresh;
end;

procedure TFormCadastroBase.ButtonSelecionarClick(Sender: TObject);
begin
  if FDQuery.IsEmpty then
    Exit;

  ModalResult := mrOk;
end;

procedure TFormCadastroBase.ExibirConsultaCadastro(n: Integer);
begin
  if n = 1 then
  begin
    TabSheetConsulta.TabVisible := False;
    TabSheetCadastro.TabVisible := True;
  end
  else
  begin
    TabSheetConsulta.TabVisible := True;
    TabSheetCadastro.TabVisible := False;
  end;
  PageControl.ActivePageIndex := n;
end;

procedure TFormCadastroBase.FormCreate(Sender: TObject);
begin
  Base_SQL := FDQuery.SQL.Text;
  ExibirConsultaCadastro(0);
end;

procedure TFormCadastroBase.FormShow(Sender: TObject);
begin
  Busca;
end;

end.
