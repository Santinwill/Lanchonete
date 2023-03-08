unit UnitRelatorioVendasGarcom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitRelatorioBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, ppCtrls,
  ppDB, ppDBPipe, ppParameter, ppDesignLayer, ppVar, ppBands, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppMemo;

type
  TFormRelatorioVendasGarcom = class(TFormRelatorioBase)
    Label1: TLabel;
    EditGarcom: TEdit;
    Label2: TLabel;
    DateTimePickerInicial: TDateTimePicker;
    Label3: TLabel;
    DateTimePickerFinal: TDateTimePicker;
    ButtonGarcom: TButton;
    FDQueryRelatorionmgarcom: TWideStringField;
    FDQueryRelatorionmproduto: TWideStringField;
    FDQueryRelatorioquantidade: TLargeintField;
    FDQueryRelatoriodtcomanda: TDateField;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    procedure ButtonGarcomClick(Sender: TObject);
    procedure ButtonBuscarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    idgarcom: Integer;
    { Public declarations }
  end;

var
  FormRelatorioVendasGarcom: TFormRelatorioVendasGarcom;

implementation

{$R *.dfm}

uses UnitCadastroGarcom;

procedure TFormRelatorioVendasGarcom.ButtonBuscarClick(Sender: TObject);
begin
  FDQueryRelatorio.Close;
  FDQueryRelatorio.ParamByName('DTINICIO').AsDate := DateTimePickerInicial.Date;
  FDQueryRelatorio.ParamByName('DTFIM').AsDate := DateTimePickerFinal.Date;
  FDQueryRelatorio.ParamByName('IDGARCOM').AsInteger := idgarcom;
  FDQueryRelatorio.Open;
end;

procedure TFormRelatorioVendasGarcom.ButtonCancelarClick(Sender: TObject);
begin
  inherited;
  FDQueryRelatorio.Free;
end;

procedure TFormRelatorioVendasGarcom.ButtonGarcomClick(Sender: TObject);
var
  form: TFormCadastroGarcom;
begin
  form := TFormCadastroGarcom.Create(Self);
  form.ButtonSelecionar.Visible := True;
  form.ButtonImprimir.Visible := False;
  form.ShowModal;
  if form.ModalResult = mrOk then
  begin
    idgarcom := form.FDQuery.FieldByName('IDGARCOM').AsInteger;
    EditGarcom.Text := form.FDQuery.FieldByName('NMGARCOM').AsString;
  end;
  form.Free;
end;

procedure TFormRelatorioVendasGarcom.ButtonImprimirClick(Sender: TObject);
var
  contador: integer;
begin
  contador := DBGridRelatorio.DataSource.DataSet.RecordCount;
  ppLabeltotalregistro.Caption := 'Total de ' + IntToStr(contador) + ' registros.';
  ppMemofiltro.Lines.Add('Garçom ' + EditGarcom.Text);
  ppMemofiltro.Lines.Add('Data inicial ' + DateToStr(DateTimePickerInicial.Date) +
                         ' data final ' + DateToStr(DateTimePickerFinal.Date));
  inherited;
  ppMemofiltro.Lines.Clear;
end;

end.
