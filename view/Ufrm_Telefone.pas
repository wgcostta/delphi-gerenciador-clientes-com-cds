unit Ufrm_Telefone;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB;

type
  Tfrm_Telefone = class(TForm)
    Label1: TLabel;
    EditNumeroTel: TEdit;
    EditTipoTel: TEdit;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    Salvar: TButton;
    Cancelar: TButton;
    DS_Telefone: TDataSource;
    procedure CancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure limpaCampos;
  public
    { Public declarations }
  end;

var
  frm_Telefone: Tfrm_Telefone;

implementation

{$R *.dfm}

uses Ufrm_Principal, U_DMDados, U_Funcoes, Datasnap.DBClient;

procedure Tfrm_Telefone.CancelarClick(Sender: TObject);
begin
  Close;
  frmPrincipal.DS_EndCli.DataSet.cancel;
  frmPrincipal.DS_TelCli.DataSet.cancel;

end;

procedure Tfrm_Telefone.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    begin
      Close;
      frmPrincipal.DS_EndCli.DataSet.cancel;
      frmPrincipal.DS_TelCli.DataSet.cancel;
    end;
end;

procedure Tfrm_Telefone.SalvarClick(Sender: TObject);
begin
  with DM_Dados do //utilizo o with para não precisar informar o DM_Dados no inicio de cada um
   begin

    if DS_Telefone.State in [dsInsert] then
      begin
        CDS_Telefoneidtelefone.AsInteger := GetId('IDTELEFONE','TELCLI');
        CDS_Telefoneidcliente.AsInteger := CDS_Clientesidcliente.AsInteger;
      end;

    CDS_Telefonetipo.AsString := trim(EditTipoTel.Text);
    CDS_Telefonenumero.AsString := trim(EditNumeroTel.Text);




   end;

  //salvar ou incluir
  try
    TClientDataSet(DS_Telefone.DataSet).Post;
    TClientDataSet(DS_Telefone.DataSet).ApplyUpdates(0);

    Application.MessageBox('Registro Inserido com sucesso!','Inclusão',MB_OK+MB_ICONINFORMATION);

    limpaCampos;
    TClientDataSet(DS_Telefone.DataSet).Open;
    close;
  except on E: Exception do
    raise Exception.Create('Erro ao salvar registro:'+E.Message);
  end;
end;




procedure Tfrm_Telefone.limpaCampos;
var
  I: Integer;
begin
  for I := 0 to ComponentCount -1 do
  begin
    if Components[i] is TCustomEdit then
      TCustomEdit(Components[i]).Clear;
  end;
end;


end.
