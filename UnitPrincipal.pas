unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef;

type
  TFormPrincipal = class(TForm)
    MainMenu: TMainMenu;
    Cadastro1: TMenuItem;
    ControleComanda1: TMenuItem;
    Relatrios1: TMenuItem;
    Comandas1: TMenuItem;
    N1: TMenuItem;
    Produto1: TMenuItem;
    Garom1: TMenuItem;
    FDConnection: TFDConnection;
    FDPhysPgDriverLink: TFDPhysPgDriverLink;
    Comanda1: TMenuItem;
    CategoriadeProdutos1: TMenuItem;
    Garom2: TMenuItem;
    FormasdePagamento1: TMenuItem;
    FormasdePagamento2: TMenuItem;
    N2: TMenuItem;
    FechamentoComanda1: TMenuItem;
    ConsumoporData1: TMenuItem;
    MovimentaoFinanceira1: TMenuItem;
    DetalhesdePagamento1: TMenuItem;
    ItensCardapio1: TMenuItem;
    VendasGarom1: TMenuItem;
    N3: TMenuItem;
    Multiseleo1: TMenuItem;
    procedure Garom2Click(Sender: TObject);
    procedure FormasdePagamento2Click(Sender: TObject);
    procedure Garom1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Comandas1Click(Sender: TObject);
    procedure Comanda1Click(Sender: TObject);
    procedure FechamentoComanda1Click(Sender: TObject);
    procedure ConsumoporData1Click(Sender: TObject);
    procedure MovimentaoFinanceira1Click(Sender: TObject);
    procedure DetalhesdePagamento1Click(Sender: TObject);
    procedure ItensCardapio1Click(Sender: TObject);
    procedure VendasGarom1Click(Sender: TObject);
    procedure Multiseleo1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FDConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses UnitCadastroGarcom, UnitCadastroFormaPagamento,
  UnitCadastroCategoriaProduto, UnitCadastroCardapio, UnitCadastroComanda,
  UnitControleComanda, UnitPagamento, UnitRelatorioComandaData,
  UnitRelatorioMovimentacaoFinanceira, UnitRelatorioDetalhesPagamento,
  UnitRelatorioItens, UnitRelatorioVendasGarcom, UnitRelatorioMultiselecao;

procedure TFormPrincipal.Comanda1Click(Sender: TObject);
var
  form: TFormControleComanda;
begin
  form := TFormControleComanda.Create(Self);
  form.ShowModal;
  form.Free;
end;

procedure TFormPrincipal.Comandas1Click(Sender: TObject);
var
  form: TFormCadastroComanda;
begin
  form := TFormCadastroComanda.Create(Self);
  form.ShowModal;
  form.Free;
end;

procedure TFormPrincipal.ConsumoporData1Click(Sender: TObject);
var
  form: TFormRelatorioComandaData;
begin
  form := TFormRelatorioComandaData.Create(Self);
  form.ShowModal;
  form.Free;
end;

procedure TFormPrincipal.DetalhesdePagamento1Click(Sender: TObject);
var
  form: TFormRelatorioDetalhesPagamento;
begin
  form := TFormRelatorioDetalhesPagamento.Create(Self);
  form.ShowModal;
  form.Free;
end;

procedure TFormPrincipal.FDConnectionBeforeConnect(Sender: TObject);
begin
//  FDConnection.Params.LoadFromFile('.\ConfigConnection.txt');
end;

procedure TFormPrincipal.FechamentoComanda1Click(Sender: TObject);
var
  form: TFormPagamento;
begin
  form := TFormPagamento.Create(Self);
  form.ShowModal;
  form.Free;
end;

procedure TFormPrincipal.FormasdePagamento2Click(Sender: TObject);
var
  form: TFormCadastroFormaPagamento;
begin
  form := TFormCadastroFormaPagamento.Create(Self);
  form.ShowModal;
  form.Free;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
//  FDConnection.Connected := False;
//  FDConnection.Connected := True;
end;

procedure TFormPrincipal.Garom1Click(Sender: TObject);
var
  form: TFormCadastroCategoriaProduto;
begin
  form := TFormCadastroCategoriaProduto.Create(Self);
  form.ShowModal;
  form.Free;
end;

procedure TFormPrincipal.Garom2Click(Sender: TObject);
var
  form: TFormCadastroGarcom;
begin
  form := TFormCadastroGarcom.Create(Self);
  form.ShowModal;
  form.Free;
end;

procedure TFormPrincipal.ItensCardapio1Click(Sender: TObject);
var
  form: TFormRelatorioItens;
begin
  form := TFormRelatorioItens.Create(Self);
  form.ShowModal;
  form.Free;
end;

procedure TFormPrincipal.MovimentaoFinanceira1Click(Sender: TObject);
var
  form: TFormRelatorioMovimentacaoFinanceira;
begin
  form := TFormRelatorioMovimentacaoFinanceira.Create(Self);
  form.ShowModal;
  form.Free;
end;

procedure TFormPrincipal.Multiseleo1Click(Sender: TObject);
var
  form: TFormRelatorioMultiselecao;
begin
  form := TFormRelatorioMultiselecao.Create(Self);
  form.ShowModal;
  form.Free;
end;

procedure TFormPrincipal.Produto1Click(Sender: TObject);
var
  form: TFormCadastroCardapio;
begin
  form := TFormCadastroCardapio.Create(Self);
  form.ShowModal;
  form.Free;
end;

procedure TFormPrincipal.VendasGarom1Click(Sender: TObject);
var
  form: TFormRelatorioVendasGarcom;
begin
  form := TFormRelatorioVendasGarcom.Create(Self);
  form.ShowModal;
  form.Free;
end;

end.
