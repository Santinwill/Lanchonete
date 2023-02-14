unit UnitRelatorioItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitRelatorioBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.Menus,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TFormRelatorioItens = class(TFormRelatorioBase)
    CheckBoxAtivo: TCheckBox;
    CheckBoxInativos: TCheckBox;
    FDQueryRelatorionmproduto: TWideStringField;
    FDQueryRelatoriovlvenda: TBCDField;
    LabelIten: TLabel;
    procedure ButtonBuscarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  end;
  if CheckBoxInativos.Checked then
  begin
    sql := sql + '    WHERE TIPO.FLSITUACAO = 0 ' +
                 '       OR PRODUTO.FLSITUACAO = 0 ';
    LabelIten.Caption := 'Itens Inativos';
  end;
  if (CheckBoxAtivo.Checked) and (CheckBoxInativos.Checked) then
  begin
    sql := base;
    LabelIten.Caption := 'Todos os Itens';
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

procedure TFormRelatorioItens.FormCreate(Sender: TObject);
begin
  inherited;
  base := FDQueryRelatorio.SQL.Text;
end;

end.