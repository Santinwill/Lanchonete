unit UnitRelatorioBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, ppBands, ppCache, ppClass, ppDesignLayer,
  ppParameter, ppComm, ppRelatv, ppProd, ppReport, ppDB, ppDBPipe, ppVar,
  ppCtrls, ppPrnabl;

type
  TFormRelatorioBase = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridRelatorio: TDBGrid;
    DataSourceRelatorio: TDataSource;
    FDQueryRelatorio: TFDQuery;
    ButtonBuscar: TButton;
    ButtonImprimir: TButton;
    ButtonCancelar: TButton;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBPipeline1: TppDBPipeline;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel2: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLine3: TppLine;
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorioBase: TFormRelatorioBase;

implementation

{$R *.dfm}

uses UnitPrincipal;

procedure TFormRelatorioBase.ButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormRelatorioBase.ButtonImprimirClick(Sender: TObject);
begin
  ppReport1.PrintReport;
end;

end.
