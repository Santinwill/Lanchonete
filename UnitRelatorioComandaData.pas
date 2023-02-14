unit UnitRelatorioComandaData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitRelatorioBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.ComCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TFormRelatorioComandaData = class(TFormRelatorioBase)
    DateTimePickerInicio: TDateTimePicker;
    DateTimePickerFinal: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    FDQueryRelatorioidcomanda: TLargeintField;
    FDQueryRelatorionmgarcom: TWideStringField;
    FDQueryRelatoriodtcomanda: TDateField;
    procedure ButtonBuscarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Buscar;
  public
    { Public declarations }
  end;

var
  FormRelatorioComandaData: TFormRelatorioComandaData;

implementation

{$R *.dfm}

procedure TFormRelatorioComandaData.Buscar;
begin
  FDQueryRelatorio.Close;
  FDQueryRelatorio.ParamByName('DTINICIO').AsDate := DateTimePickerInicio.Date;
  FDQueryRelatorio.ParamByName('DTFIM').AsDate := DateTimePickerFinal.Date;
  FDQueryRelatorio.Open;
end;

procedure TFormRelatorioComandaData.ButtonBuscarClick(Sender: TObject);
begin
  Buscar;
end;

procedure TFormRelatorioComandaData.ButtonCancelarClick(Sender: TObject);
begin
  inherited;
  FDQueryRelatorio.Close;
end;

end.
