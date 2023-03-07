unit UnitRelatorioComandaData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitRelatorioBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.ComCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, ppCtrls, ppDB, ppDBPipe, ppParameter, ppDesignLayer, ppVar,
  ppBands, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  ppStrtch, ppMemo;

type
  TFormRelatorioComandaData = class(TFormRelatorioBase)
    DateTimePickerInicio: TDateTimePicker;
    DateTimePickerFinal: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    FDQueryRelatorioidcomanda: TLargeintField;
    FDQueryRelatorionmgarcom: TWideStringField;
    FDQueryRelatoriodtcomanda: TDateField;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
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

procedure TFormRelatorioComandaData.ButtonImprimirClick(Sender: TObject);
var
  contador: integer;
begin
  contador := DBGridRelatorio.DataSource.DataSet.RecordCount;
  ppLabeltotalregistro.Caption := 'Total de ' + IntToStr(contador) + ' registros.';
  ppMemofiltro.Lines.Add('Data inicial ' + DateToStr(DateTimePickerInicio.Date) +
                         ' data final ' + DateToStr(DateTimePickerFinal.Date));
  inherited;
  ppMemofiltro.Lines.Clear;
end;

end.
