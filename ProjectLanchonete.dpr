program ProjectLanchonete;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  UnitCadastroBase in 'UnitCadastroBase.pas' {FormCadastroBase},
  UnitCadastroGarcom in 'UnitCadastroGarcom.pas' {FormCadastroGarcom},
  UnitCadastroFormaPagamento in 'UnitCadastroFormaPagamento.pas' {FormCadastroFormaPagamento},
  UnitCadastroCategoriaProduto in 'UnitCadastroCategoriaProduto.pas' {FormCadastroCategoriaProduto},
  UnitCadastroCardapio in 'UnitCadastroCardapio.pas' {FormCadastroCardapio},
  UnitCadastroComanda in 'UnitCadastroComanda.pas' {FormCadastroComanda},
  UnitControleComanda in 'UnitControleComanda.pas' {FormControleComanda},
  UnitPagamento in 'UnitPagamento.pas' {FormPagamento},
  UnitRelatorioBase in 'UnitRelatorioBase.pas' {FormRelatorioBase},
  UnitRelatorioComandaData in 'UnitRelatorioComandaData.pas' {FormRelatorioComandaData},
  UnitRelatorioMovimentacaoFinanceira in 'UnitRelatorioMovimentacaoFinanceira.pas' {FormRelatorioMovimentacaoFinanceira},
  UnitRelatorioDetalhesPagamento in 'UnitRelatorioDetalhesPagamento.pas' {FormRelatorioDetalhesPagamento},
  UnitRelatorioItens in 'UnitRelatorioItens.pas' {FormRelatorioItens},
  UnitRelatorioVendasGarcom in 'UnitRelatorioVendasGarcom.pas' {FormRelatorioVendasGarcom};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormRelatorioBase, FormRelatorioBase);
  Application.CreateForm(TFormRelatorioComandaData, FormRelatorioComandaData);
  Application.CreateForm(TFormRelatorioMovimentacaoFinanceira, FormRelatorioMovimentacaoFinanceira);
  Application.CreateForm(TFormRelatorioDetalhesPagamento, FormRelatorioDetalhesPagamento);
  Application.CreateForm(TFormRelatorioItens, FormRelatorioItens);
  Application.CreateForm(TFormRelatorioVendasGarcom, FormRelatorioVendasGarcom);
  Application.Run;
end.