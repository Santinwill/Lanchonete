unit UnitRelatorioBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls;

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
    procedure ButtonCancelarClick(Sender: TObject);
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

end.
