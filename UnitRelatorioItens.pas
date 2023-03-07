unit UnitRelatorioItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitRelatorioBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.Menus,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, ppCtrls, ppDB, ppDBPipe, ppParameter, ppDesignLayer, ppVar,
  ppBands, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  ppStrtch, ppMemo;

type
  TFormRelatorioItens = class(TFormRelatorioBase)
    CheckBoxAtivo: TCheckBox;
    CheckBoxInativos: TCheckBox;
    FDQueryRelatorionmproduto: TWideStringField;
    FDQueryRelatoriovlvenda: TBCDField;
    LabelIten: TLabel;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    procedure ButtonBuscarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Buscar;
  public
    { Public declarations }
    base: string;
  end;

var
  FormRelatorioItens: TFormRelatorioItens;

implementation

{$R *.dfm}

procedure TFormRelatorioItens.Buscar;
var
  sql: string;
begin
  sql := base;
  if CheckBoxAtivo.Checked then
  begin
    sql := sql + '    WHERE TIPO.FLSITUACAO = 1 ' +
                 '      AND PRODUTO.FLSITUACAO = 1 ';
    LabelIten.Caption := 'Itens Ativos';
    ppLabel1.Caption := 'Itens Ativos Cardápio';
  end;
  if CheckBoxInativos.Checked then
  begin
    sql := sql + '    WHERE TIPO.FLSITUACAO = 0 ' +
                 '       OR PRODUTO.FLSITUACAO = 0 ';
    LabelIten.Caption := 'Itens Inativos';
    ppLabel1.Caption := 'Itens Inativos Cardápio';
  end;
  if (CheckBoxAtivo.Checked) and (CheckBoxInativos.Checked) then
  begin
    sql := base;
    LabelIten.Caption := 'Itens Ativos e Inativos';
    ppLabel1.Caption := 'Itens Ativos e Inativos Cardápio';
  end;
  sql := sql + ' ORDER BY NMPRODUTO ';
  FDQueryRelatorio.Close;
  FDQueryRelatorio.SQL.Text := sql;
  FDQueryRelatorio.Open;
end;

procedure TFormRelatorioItens.ButtonBuscarClick(Sender: TObject);
begin
  Buscar;
end;

procedure TFormRelatorioItens.ButtonCancelarClick(Sender: TObject);
begin
  inherited;
  FDQueryRelatorio.Free;
end;

procedure TFormRelatorioItens.ButtonImprimirClick(Sender: TObject);
var
  contador: integer;
begin
  contador := DBGridRelatorio.DataSource.DataSet.RecordCount;
  ppLabeltotalregistro.Caption := 'Total de ' + IntToStr(contador) + ' registros.';
  ppMemofiltro.Lines.Add(LabelIten.Caption);
  inherited;
  ppMemofiltro.Lines.Clear;
end;

procedure TFormRelatorioItens.FormCreate(Sender: TObject);
begin
  inherited;
  base := FDQueryRelatorio.SQL.Text;
  CheckBoxAtivo.Checked := True;
  Buscar;
end;

end.
