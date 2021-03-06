unit U_DMDados;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient;

type
  TDM_Dados = class(TDataModule)
    SQLConnection: TSQLConnection;
    CDS_Clientes: TClientDataSet;
    DSP_Clientes: TDataSetProvider;
    SQLDS_Clientes: TSQLDataSet;
    CDS_Clientesidcliente: TIntegerField;
    CDS_Clientesnome: TStringField;
    CDS_Clientessexo: TStringField;
    CDS_Clientesrg: TStringField;
    DSP_Usuarios: TDataSetProvider;
    CDS_Usuarios: TClientDataSet;
    DSP_Telefone: TDataSetProvider;
    CDS_Telefone: TClientDataSet;
    CDS_EndCli: TClientDataSet;
    CDS_EndCliIDENDERECO: TIntegerField;
    CDS_EndCliIDCLIENTE: TIntegerField;
    CDS_EndClitipo: TStringField;
    CDS_EndCliendereco: TStringField;
    DSP_EndCli: TDataSetProvider;
    SQL_EndCli: TSQLQuery;
    SQL_Telefone: TSQLQuery;
    SQL_Telefoneidtelefone: TIntegerField;
    SQL_Telefoneidcliente: TIntegerField;
    SQL_Telefonetipo: TStringField;
    CDS_Telefoneidtelefone: TIntegerField;
    CDS_Telefoneidcliente: TIntegerField;
    CDS_Telefonetipo: TStringField;
    CDS_Usuariosidusuario: TIntegerField;
    CDS_Usuariosnome: TStringField;
    CDS_Usuariossenha: TStringField;
    SQL_Usuario: TSQLQuery;
    SQLDS_Clientesidcliente: TIntegerField;
    SQLDS_Clientesnome: TStringField;
    SQLDS_Clientessexo: TStringField;
    SQLDS_Clientesrg: TStringField;
    CDS_Clientescpf: TStringField;
    SQLDS_Clientescpf: TStringField;
    SQL_EndCliidendereco: TIntegerField;
    SQL_EndCliidcliente: TIntegerField;
    SQL_EndClitipo: TStringField;
    SQL_EndCliendereco: TStringField;
    SQL_Telefonenumero: TStringField;
    CDS_Telefonenumero: TStringField;
    SQL_EndClinumero: TIntegerField;
    SQL_EndClicidade: TStringField;
    SQL_EndClicep: TStringField;
    CDS_EndClinumero: TIntegerField;
    CDS_EndClicidade: TStringField;
    CDS_EndClicep: TStringField;
    procedure CDS_ClientesAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  DM_Dados: TDM_Dados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}


uses Ufrm_Principal, Ufrm_Login, IniFiles, Vcl.Forms, Vcl.Dialogs;

{$R *.dfm}

procedure TDM_Dados.CDS_ClientesAfterScroll(DataSet: TDataSet);
begin
  CDS_EndCli.Close;
  CDS_EndCli.ParamByName('idcliente').AsInteger := CDS_Clientesidcliente.AsInteger;
  CDS_EndCli.Open;

  CDS_Telefone.Close;
  CDS_Telefone.ParamByName('idcliente').AsInteger := CDS_Clientesidcliente.AsInteger;
  CDS_Telefone.Open;

end;

end.
