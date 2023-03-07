unit UnitRelatorioDetalhesPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitRelatorioBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, ppCtrls, ppDB, ppDBPipe,
  ppParameter, ppDesignLayer, ppVar, ppBands, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppMemo;

type
  TFormRelatorioDetalhesPagamento = class(TFormRelatorioBase)
    EditCodigoComanda: TEdit;
    Label1: TLabel;
    FDQueryRelatorionmformapgmt: TWideStringField;
    FDQueryRelatoriovlpago: TBCDField;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    procedure ButtonBuscarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Buscar;
  public
    { Public declarations }
  end;

var
  FormRelatorioDetalhesPagamento: TFormRelatorioDetalhesPagamento;

implementation

{$R *.dfm}

procedure TFormRelatorioDetalhesPagamento.Buscar;
begin
  FDQueryRelatorio.Close;
  FDQueryRelatorio.ParamByName('IDCOMANDA').AsInteger := StrToInt(EditCodigoComanda.Text);
  FDQueryRelatorio.Open;
  if FDQueryRelatorio.IsEmpty then
  begin
    ShowMessage('Nenhum pagamento para esta comanda.');
    Exit;
  end;
end;

procedure TFormRelatorioDetalhesPagamento.ButtonBuscarClick(Sender: TObject);
begin
  Buscar;
end;

procedure TFormRelatorioDetalhesPagamento.ButtonCancelarClick(Sender: TObject);
begin
  inherited;
  FDQueryRelatorio.Close;
end;

procedure TFormRelatorioDetalhesPagamento.ButtonImprimirClick(Sender: TObject);
var
  contador: integer;
begin
  contador := DBGridRelatorio.DataSource.DataSet.RecordCount;
  ppLabeltotalregistro.Caption := 'Total de ' + IntToStr(contador) + ' registros.';
  ppMemofiltro.Lines.Add('Código da comanda ' + EditCodigoComanda.Text);
  inherited;
  ppMemofiltro.Lines.Clear;
end;

end.
