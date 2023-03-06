unit UnitRelatorioItensComanda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitRelatorioBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, ppDB, ppDBPipe, ppParameter, ppDesignLayer,
  ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormRelatorioItensComanda = class(TFormRelatorioBase)
    EditCodigoComanda: TEdit;
    Label1: TLabel;
    FDQueryRelatorionmproduto: TWideStringField;
    FDQueryRelatoriovlvenda: TBCDField;
    FDQueryRelatoriodtaddcomanda: TDateField;
    FDQueryRelatorionmstatusprodutocomanda: TWideStringField;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppLabel8: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    procedure ButtonBuscarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Buscar;
  public
    { Public declarations }
  end;

var
  FormRelatorioItensComanda: TFormRelatorioItensComanda;

implementation

{$R *.dfm}

procedure TFormRelatorioItensComanda.Buscar;
begin
  FDQueryRelatorio.Close;
  FDQueryRelatorio.ParamByName('IDCOMANDA').AsInteger := StrToInt(EditCodigoComanda.Text);
  FDQueryRelatorio.Open;
  if FDQueryRelatorio.IsEmpty then
  begin
    ShowMessage('Comanda Vazia');
    Exit;
  end;
end;

procedure TFormRelatorioItensComanda.ButtonBuscarClick(Sender: TObject);
begin
  Buscar;
end;

procedure TFormRelatorioItensComanda.ButtonCancelarClick(Sender: TObject);
begin
  inherited;
  FDQueryRelatorio.Close;
end;

end.
