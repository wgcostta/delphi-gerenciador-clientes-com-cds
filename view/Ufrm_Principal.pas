unit Ufrm_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  frxClass, frxDBSet, Datasnap.DBClient, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider,frxUtils, Vcl.Buttons;

  procedure CarregaRelatorio (const pReport: TfrxReport);

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    stbStatus: TStatusBar;
    Timer1: TTimer;
    PageControl1: TPageControl;
    tbsListagem: TTabSheet;
    tbsManutencao: TTabSheet;
    tbsSistema: TTabSheet;
    DBClientes: TDBGrid;
    btnIncluir: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnImpRelatorio: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    Label5: TLabel;
    Label6: TLabel;
    EditSenhaAtual: TEdit;
    EditSenhaNova: TEdit;
    btnAlterarSenha: TButton;
    DBG_Endereco: TDBGrid;
    Label7: TLabel;
    Label8: TLabel;
    DBG_Telefone: TDBGrid;
    btnIncluirEndereco: TButton;
    btnExcluirEndereco: TButton;
    btnIncluirTelefone: TButton;
    btnExcluirTelefone: TButton;
    DS_Clientes: TDataSource;
    EditNome: TEdit;
    RgSexo: TRadioGroup;
    DS_EndCli: TDataSource;
    DS_TelCli: TDataSource;
    btnLogout: TSpeedButton;
    DS_Usuarios: TDataSource;
    EditCpf: TMaskEdit;
    EditRG: TMaskEdit;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnImpRelatorioClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirEnderecoClick(Sender: TObject);
    procedure btnExcluirEnderecoClick(Sender: TObject);
    procedure btnIncluirTelefoneClick(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarSenhaClick(Sender: TObject);
  private
    { Private declarations }
    tipoAlt : Integer;
    procedure limpaCampos;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses U_DMDados, U_Funcoes, math, Ufrm_Endereco, U_DMRelatorios, Ufrm_Telefone,
  U_Login, Ufrm_Login;







//----------------------------------@ Bot�o Alterar Senha @---------------------
procedure TfrmPrincipal.btnAlterarSenhaClick(Sender: TObject);
begin

  if EditSenhaAtual.Text = '' then
  begin
    Application.MessageBox('Informe a senha do usu�rio que deseja Alterar!','Aten��o',0+48);
    EditSenhaAtual.SetFocus;
    Abort;
  end;

  if EditSenhaNova.Text = '' then
  begin
    Application.MessageBox('Informe a senha nova!','Aten��o',0+48);
    EditSenhaNova.SetFocus;
    Abort;
  end;

    with DM_Dados do
    begin
      CDS_Usuarios.Close;
      CDS_Usuarios.ParamByName('SENHA').AsString := EditSenhaAtual.Text;
      CDS_Usuarios.Open;
    end;

    if not DM_Dados.CDS_Usuarios.IsEmpty then
    begin
      try
          DM_Dados.CDS_Usuarios.Edit;
          DM_Dados.CDS_Usuariossenha.AsString := trim(EditSenhaNova.Text);
          TClientDataSet(DS_Usuarios.DataSet).Post;
          TClientDataSet(DS_Usuarios.DataSet).ApplyUpdates(0);

          Application.MessageBox('Senha Alterada com sucesso!','Aten��o',MB_OK+MB_ICONINFORMATION);

          EditSenhaAtual.Clear;
          EditSenhaNova.Clear;
      except on E: Exception do
          raise Exception.Create('Erro ao Alterar'+E.Message);
      end;
    end
    else
    begin
      Application.MessageBox('Senha atual inv�lida!','Aten��o',MB_OK+MB_ICONWARNING);
      EditSenhaAtual.Clear;
      EditSenhaAtual.SetFocus;
      Abort;
    end;
end;



//----------------------------------@ Bot�o CANCELAR ou VOLTAR @----------------
procedure TfrmPrincipal.btnCancelarClick(Sender: TObject);
begin
  tbsListagem.Show;
  tbsManutencao.TabVisible :=false;
  limpaCampos;
  if PageControl1.ActivePage = tbsManutencao then
      PageControl1.ActivePage := tbsListagem;

  DS_Clientes.DataSet.Cancel;
  DS_EndCli.DataSet.cancel;
  DS_TelCli.DataSet.cancel;


end;



//----------------------------------@ Bot�o EDITAR @----------------------------
procedure TfrmPrincipal.btnEditarClick(Sender: TObject);
begin
    tipoAlt :=1;
    //tbsManutencao.Show;
    if PageControl1.ActivePage = tbsListagem then
    begin
      PageControl1.ActivePage := tbsManutencao;
      tbsManutencao.TabVisible :=true;
    end;

    DS_Clientes.DataSet.Edit;

    EditNome.Text := DM_Dados.CDS_Clientesnome.AsString;
    RgSexo.ItemIndex := ifthen(DM_Dados.CDS_Clientessexo.AsString='M',0,1); //ifthen fun��o booleana, precisa colocar no uses math
    EditRG.Text := DM_Dados.CDS_Clientesrg.AsString;
    EditCPF.Text := DM_Dados.CDS_Clientescpf.AsString;


    btnIncluirEndereco.Enabled := true;
    btnExcluirEndereco.Enabled := true;
    btnIncluirTelefone.Enabled := true;
    btnExcluirTelefone.Enabled := true;
end;



//----------------------------------@ Bot�o EXCLUIR @---------------------------
procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja excluir este Cliente?','Aten��o!',MB_YESNO+MB_ICONQUESTION) = mrYes then
      begin
        try
          DS_Clientes.DataSet.Delete;
          TClientDataSet(DS_Clientes.DataSet).ApplyUpdates(0);
          Application.MessageBox('Cadastro excluido com sucesso!','',MB_OK);
          TClientDataSet(DS_Clientes.DataSet).Open;
        except on E: Exception do
          raise Exception.Create('Erro ao Excluir registro: '+E.Message);
        end;
      end;
end;



//----------------------------------@ Bot�o Excluir Endere�o @------------------
procedure TfrmPrincipal.btnExcluirEnderecoClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja excluir este Endere�o?','Aten��o!',MB_YESNO+MB_ICONQUESTION) = mrYes then
      begin
        try
          DS_EndCli.DataSet.Delete;
          TClientDataSet(DS_EndCli.DataSet).ApplyUpdates(0);
          Application.MessageBox('Endere�o excluido com sucesso!','',MB_OK);
          TClientDataSet(DS_EndCli.DataSet).Open;
        except on E: Exception do
          raise Exception.Create('Erro ao Excluir registro: '+E.Message);
        end;
      end;
end;



//----------------------------------@ Imprimir Relat�rio @----------------------
procedure TfrmPrincipal.btnImpRelatorioClick(Sender: TObject);

begin
  DM_Relatorio.frxR_Clientes.ShowReport();
end;



//----------------------------------@ Bot�o Incluir @---------------------------
procedure TfrmPrincipal.btnIncluirClick(Sender: TObject);
begin
    tbsManutencao.TabVisible := true;
    tipoAlt :=0;
    if PageControl1.ActivePage = tbsListagem then
        PageControl1.ActivePage := tbsManutencao;

    if not TClientDataSet(DS_Clientes.DataSet).Active then
        TClientDataSet(DS_Clientes.DataSet).Open;

//    RgSexo.Buttons[0].Checked :=false;
//    RgSexo.Buttons[1].Checked :=false;
    DS_Clientes.DataSet.Append;

    btnIncluirEndereco.Enabled := false;
    btnExcluirEndereco.Enabled := false;
    btnIncluirTelefone.Enabled := false;
    btnExcluirTelefone.Enabled := false;
end;



//----------------------------------@ Bot�o Incluir Endere�o @------------------
procedure TfrmPrincipal.btnIncluirEnderecoClick(Sender: TObject);
begin
  DS_EndCli.DataSet.append;
  Application.CreateForm(Tfrm_Endereco,frm_Endereco);
  try
    frm_Endereco.ShowModal;
  finally
    frm_Endereco.free;
  end;

end;



//----------------------------------@ Bot�o Incluir Telefone @------------------
procedure TfrmPrincipal.btnIncluirTelefoneClick(Sender: TObject);
begin
  DS_TelCli.DataSet.append;
  Application.CreateForm(Tfrm_Telefone,frm_Telefone);
  try
    frm_Telefone.ShowModal;
  finally
    frm_Telefone.free;
  end;
end;



//----------------------------------@ Bot�o Logout @----------------------------
procedure TfrmPrincipal.btnLogoutClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja sair do Sistema?','Aviso',36)=6) then
  begin
    frmPrincipal.Visible := false;
//    frmPrincipal.EditSenhaAtual.clear;
    frm_Login.EditSenha.Clear;
    frm_Login.EditUsuario.Clear;
    frm_Login.Visible := True;
    frm_Login.Show;
    frm_Login.EditUsuario.SetFocus;
  end
    else
  begin
    abort;
  end;
end;



//----------------------------------@ Bot�o SALVAR @----------------------------
procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
begin
   //TRIM tira os espa�os do campo
   if Trim(EditNome.Text) = '' then
   begin
      Application.MessageBox('Preencha o campo nome!','Aten��o',MB_OK+MB_ICONWARNING);
      EditNome.SetFocus;
      Abort;
   end;

   {if GetCPFCadastrado(Trim(EditCPF.Text)) then
   begin
      Application.MessageBox('J� existe um cliente cadastrado com este CPF!','Aten��o',MB_OK+MB_ICONWARNING);
      EditCPF.SetFocus;
      Abort;
   end;}

   //Passando informa��es dos campos para o CDS
   with DM_Dados do //utilizo o with para n�o precisar informar o DM_Dados no inicio de cada um
   begin

    if DS_Clientes.State in [dsInsert] then
      CDS_Clientesidcliente.AsInteger := GetId('IDCLIENTE','CLIENTES');

    CDS_Clientesnome.AsString := trim(EditNome.Text);
    case RgSexo.ItemIndex of
      0: CDS_Clientessexo.AsString := 'M';
      1: CDS_Clientessexo.AsString := 'F';
    end;
    CDS_Clientesrg.AsString := trim(EditRG.Text);
    CDS_Clientescpf.AsString := trim(EditCPF.Text);
   end;

  //salvar ou incluir
  try
    TClientDataSet(DS_Clientes.DataSet).Post;
    TClientDataSet(DS_Clientes.DataSet).ApplyUpdates(0);

    case tipoAlt of
      0 : Application.MessageBox('Registro Inserido com sucesso!','Inclus�o',MB_OK+MB_ICONINFORMATION);
      1 : Application.MessageBox('Registro Atualizado!','Edi��o',MB_OK+MB_ICONINFORMATION);
    end;
//    if PageControl1.ActivePage = tbsManutencao then
//      PageControl1.ActivePage := tbsListagem;
//
//    //limpar campos
//    limpaCampos;

    //----------------------@ Habilitar Inclus�o de Endere�o e Telefone @-------
    btnIncluirEndereco.Enabled := true;
    btnExcluirEndereco.Enabled := true;
    btnIncluirTelefone.Enabled := true;
    btnExcluirTelefone.Enabled := true;

    TClientDataSet(DS_Clientes.DataSet).Open;
  except on E: Exception do
    raise Exception.Create('Erro ao salvar registro:'+E.Message);
  end;
end;



//----------------------------------@  FormClose @------------------------------
procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      //
     if Application.MessageBox('Deseja finalizar a aplica��o?','Aten��o!',MB_YESNO+ MB_ICONQUESTION)= mrYes then
     Application.Terminate
     else
        Abort;
end;



procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

end;



//----------------------------------@ FormShow @-------------------------
procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
      //tbsListagem.Show;
      if (PageControl1.ActivePage=tbsManutencao) or (PageControl1.ActivePage= tbsSistema) then
          begin
            PageControl1.ActivePage := tbsListagem;
            tbsManutencao.TabVisible :=false;
          end;

      TClientDataSet(DS_Clientes.DataSet).Open;

//      stbStatus.Panels[0].Text := 'Usu�rio: '+ DM_Dados.CDS_Usuariosnome.AsString;
//      frm_Login.EditSenha.Text := DM_Dados.CDS_Usuariossenha.AsString;
end;



//----------------------------------@ Timer Barra @-----------------------------
procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
      stbStatus.Panels[2].Text :=  datetostr(date) + ' - ' + timetostr(Time);
end;



//----------------------------------@ Limpar Campos @ --------------------------
procedure TfrmPrincipal.limpaCampos;
var
  I: Integer;
begin
  for I := 0 to ComponentCount -1 do
  begin
    if Components[i] is TCustomEdit then
      TCustomEdit(Components[i]).Clear;
  end;
  if PageControl1.ActivePage = tbsManutencao then
  begin
    PageControl1.ActivePage := tbsListagem;
  end;
end;


procedure CarregaRelatorio (const pReport: TfrxReport);
begin

end;

end.
