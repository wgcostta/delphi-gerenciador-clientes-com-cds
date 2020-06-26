unit U_Funcoes;

interface

  uses U_DMDados, Data.DB, Data.SqlExpr;


  function GetId(Campo, Tabela : String) : Integer;
  function GetCPFCadastrado(Cpf : string) : Boolean;

implementation


//Função para capturar o ultimo id
function GetId(Campo, Tabela : String) : Integer;
begin
  with TSQLQuery.Create(nil) do
  try
    SQLConnection := DM_Dados.SQLConnection;
    SQL.Add('SELECT '+Campo+' FROM '+Tabela+' ORDER BY '+Campo+' DESC LIMIT 1');
    Open;
    Result := Fields[0].AsInteger + 1;
  finally
    Close;
    Free;
  end;
end;

//Função para validar se já possui clientes casdatrado com este cpf
function GetCPFCadastrado(Cpf : string) : Boolean;
begin
  Result := false;
  with TSQLQuery.Create(nil) do
  try
    SQLConnection := DM_Dados.SQLConnection;
    SQL.Add('SELECT IDCLIENTE FROM CLIENTES WHERE CPF = :CPF');
    Params[0].AsString := Cpf;
    Open;
    if not IsEmpty then
      Result := true;
  finally
    Close;
    Free;
  end;

end;


end.
