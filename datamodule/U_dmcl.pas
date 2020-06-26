unit U_dmcl;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient, Data.DBXMySQL,
  Data.SqlExpr, Datasnap.Provider;

type
  TDM_Clientes = class(TDataModule)
    ADOConnection: TADOConnection;
    ADO_TBClientes: TADOTable;
    DTS_Clientes: TDataSource;
    ADO_TBClientesidcliente: TAutoIncField;
    ADO_TBClientesnome: TStringField;
    ADO_TBClientessexo: TStringField;
    ADO_TBClientesrg: TStringField;
    ADO_TBClientescpf: TStringField;
    CDS_Clientes: TClientDataSet;
    SQL_Clientes: TADOQuery;
    SQLConnection1: TSQLConnection;
    SQL_Clientesidcliente: TAutoIncField;
    SQL_Clientesnome: TStringField;
    SQL_Clientessexo: TStringField;
    SQL_Clientesrg: TStringField;
    SQL_Clientescpf: TStringField;
    DSP_Clientes: TDataSetProvider;
    CDS_Clientesidcliente: TAutoIncField;
    CDS_Clientesnome: TStringField;
    CDS_Clientessexo: TStringField;
    CDS_Clientesrg: TStringField;
    CDS_Clientescpf: TStringField;
    DTS_TBClientes: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Clientes: TDM_Clientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM_Clientes.DataModuleCreate(Sender: TObject);
var
endereco: String;
database: String;
usuario: String;
senha: String;

begin
//    endereco:='localhost';
//    database:='mygerenciador';
//    usuario:='root';
//    senha:='123456';
//
//    ADOConnection.ConnectionString := 'Driver={MySQL ODBC 5.2 ANSI Driver};Server='+
//    endereco + ';Database=' + database + ';UID=' + usuario + ';PWD=' + senha + ';';
//
//    ADOConnection.Connected := true;

    ADO_TBClientes.TableName := 'clientes';
    ADO_TBClientes.Active := True;


//    SQL_Clientes.ConnectionString := 'Driver={MySQL ODBC 5.2 ANSI Driver};Server='+
//    endereco + ';Database=' + database + ';UID=' + usuario + ';PWD=' + senha + ';';
//   SQL_Clientes.Connection:=ADOConnection;



end;

end.
