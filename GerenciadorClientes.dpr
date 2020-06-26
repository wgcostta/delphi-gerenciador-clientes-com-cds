program GerenciadorClientes;

uses
  Vcl.Forms,
  Ufrm_Principal in 'view\Ufrm_Principal.pas' {frmPrincipal},
  U_DMDados in 'datamodule\U_DMDados.pas' {DM_Dados: TDataModule},
  Ufrm_Login in 'view\Ufrm_Login.pas' {frm_Login},
  U_Funcoes in 'classes\U_Funcoes.pas',
  Ufrm_Endereco in 'view\Ufrm_Endereco.pas' {frm_Endereco},
  Ufrm_Telefone in 'view\Ufrm_Telefone.pas' {frm_Telefone},
  U_DMRelatorios in 'datamodule\U_DMRelatorios.pas' {DM_Relatorio: TDataModule},
  U_Login in 'classes\U_Login.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Login, frm_Login);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM_Dados, DM_Dados);
  Application.CreateForm(TDM_Relatorio, DM_Relatorio);
  Application.Run;
end.
