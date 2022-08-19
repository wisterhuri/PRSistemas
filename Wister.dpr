program Wister;

uses
  Forms,
  unPrincipal in 'unPrincipal.pas' {FrmPrincipal},
  unDm in 'unDm.pas' {Dm: TDataModule},
  unCadastro in 'unCadastro.pas' {frmCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Cadastro';
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
