unit UnitCardapioViaCod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormCardapioViaCod = class(TForm)
    PanelTop: TPanel;
    PanelBottom: TPanel;
    DBGrid: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBoxCategoria: TComboBox;
    ComboBoxSitCategoria: TComboBox;
    ComboBoxSitProduto: TComboBox;
    EditProduto: TEdit;
    ButtonBuscar: TButton;
    ButtonImprimir: TButton;
    ButtonCancelar: TButton;
    ppDBPipeline1: TppDBPipeline;
    ppReport: TppReport;
    procedure FormCreate(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
  private
    sql_base: string;
    sql: string;
    procedure FDQueryBase;
    procedure Buscar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCardapioViaCod: TFormCardapioViaCod;

implementation

{$R *.dfm}

uses UnitPrincipal;

{ TFormCardapioViaCod }

procedure TFormCardapioViaCod.ButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCardapioViaCod.FDQueryBase;
var
  FDQueryBase: TFDQuery;
  DataSourceBase: TDataSource;
begin
  FDQueryBase := TFDQuery.Create(Self);
  DataSourceBase := TDataSource.Create(Self);
  try
    FDQueryBase.Connection := FormPrincipal.FDConnection;
    DataSourceBase.DataSet := FDQueryBase;
    DBGrid.DataSource := DataSourceBase;
    FDQueryBase.SQL.Text := sql;
    FDQueryBase.Open;
  finally
//     FDQueryBase.Free;
//     DataSourceBase.Free;
  end;
end;

procedure TFormCardapioViaCod.FormCreate(Sender: TObject);
begin
  Buscar;
  FDQueryBase;
  ButtonCancelar.OnClick := ButtonCancelarClick;
end;

procedure TFormCardapioViaCod.Buscar;
begin
  sql_base := ' SELECT PRODUTO.IDPRODUTO, ' +
              '        PRODUTO.NMPRODUTO,   ' +
              '        PRODUTO.VLVENDA,     ' +
              '        PRODUTO.DESCRICAO,   ' +
              '        PRODUTO.IDTIPO,      ' +
              '        PRODUTO.FLSITUACAO,  ' +
              '        TIPO.IDTIPO,         ' +
              '        TIPO.NMCATEGORIA,    ' +
              '        TIPO.FLSITUACAO,     ' +
              '        SITUACAO.IDSITUACAO, ' +
              '        SITUACAO.NMSITUACAO  ' +
              '   FROM PRODUTO              ' +
              '   JOIN TIPO                 ' +
              '     ON PRODUTO.IDTIPO = TIPO.IDTIPO              ' +
              '   JOIN SITUACAO                                  ' +
              '     ON PRODUTO.FLSITUACAO = SITUACAO.IDSITUACAO  ' +
              '  WHERE 1=1                                      ';
  sql := sql_base;
end;

end.
