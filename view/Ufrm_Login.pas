unit Ufrm_Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Vcl.ExtCtrls, Vcl.Imaging.GIFImg;

type
  Tfrm_Login = class(TForm)
    Label1: TLabel;
    EditSenha: TEdit;
    btnAcessar: TButton;
    btnCancelar: TButton;
    EditUsuario: TEdit;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditUsuarioKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure AcessarLogin;
  public
    { Public declarations }
  end;

var
  frm_Login: Tfrm_Login;

implementation

{$R *.dfm}

uses Ufrm_Principal, U_DMDados, U_Login;

procedure Tfrm_Login.btnAcessarClick(Sender: TObject);
begin
    AcessarLogin;
end;



procedure Tfrm_Login.btnCancelarClick(Sender: TObject);
begin
    Application.Terminate
end;

procedure Tfrm_Login.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Se Tecla pressionada = ESC, irá fechar a tela - ESC (#27)
   if Key = #27 then
    Application.Terminate;
end;

procedure Tfrm_Login.EditSenhaKeyPress(Sender: TObject; var Key: Char);
begin
    //acessar com enter
    If key = #13 then
      AcessarLogin;

end;


procedure Tfrm_Login.EditUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
     Perform(WM_NEXTDLGCTL,0,0);
end;

//metodo para acessar - declarar nos metodos privados
procedure Tfrm_Login.AcessarLogin;
var
  Usuario : TUsuario;

begin
  if (Trim(EditUsuario.Text)= '') then
      begin
        Application.MessageBox('Informe o usuário!','Atenção',MB_OK+MB_ICONWARNING);
        EditUsuario.SetFocus;
        abort;
  end;

  if (Trim(EditSenha.Text)= '') then
      begin
        Application.MessageBox('Insira uma senha!','Atenção',MB_OK+MB_ICONWARNING);
        EditSenha.SetFocus;
        abort;
  end;

  Usuario := TUsuario.Create;
  try
    Usuario.Login := trim(EditUsuario.Text);
    Usuario.Senha := trim(EditSenha.Text);
    if Usuario.Logar then
      begin
      frm_Login.Visible :=false;
      frmPrincipal.Visible := false;
      frmPrincipal.stbStatus.Panels[0].Text := 'Usuário: '+ Usuario.Login;
      frmPrincipal.Show;
    end
    else
      begin
        Application.MessageBox('Usuário ou senha inválidos!','Atenção',MB_OK+MB_ICONWARNING);
        EditSenha.Clear;
        EditSenha.SetFocus;
        abort;
      end;
  finally
    FreeAndNil(Usuario);
  end;
end;



end.
