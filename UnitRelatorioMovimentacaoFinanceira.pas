unit UnitRelatorioMovimentacaoFinanceira;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitRelatorioBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFormRelatorioMovimentacaoFinanceira = class(TFormRelatorioBase)
    DateTimePickerInicio: TDateTimePicker;
    DateTimePickerFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    FDQueryRelatorionmformapgmt: TWideStringField;
    FDQueryRelatoriototal: TFMTBCDField;
    FDQueryRelatoriodatapagmt: TDateField;
    procedure ButtonBuscarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Buscar;
  public
    { Public declarations }
  end;

var
  FormRelatorioMovimentacaoFinanceira: TFormRelatorioMovimentacaoFinanceira;

implementation

{$R *.dfm}

procedure TFormRelatorioMovimentacaoFinanceira.Buscar;
begin
  FDQueryRelatorio.Close;
  FDQueryRelatorio.ParamByName('DTINICIO').AsDate := DateTimePickerInicio.Date;
  FDQueryRelatorio.ParamByName('DTFIM').AsDate := DateTimePickerFinal.Date;
  FDQueryRelatorio.Open;
end;

procedure TFormRelatorioMovimentacaoFinanceira.ButtonBuscarClick(
  Sender: TObject);
begin
  Buscar;
end;

procedure TFormRelatorioMovimentacaoFinanceira.ButtonCancelarClick(
  Sender: TObject);
begin
  inherited;
  FDQueryRelatorio.Close;
end;

end.
