unit U_Login;

interface

  type
    TUsuario = class
      private
        fLogin : String;
        fSenha : String;
      public
        property Login: String read fLogin write fLogin;
        property Senha: String read fSenha write fSenha;

        function Logar: boolean;
    end;

implementation

uses
  Data.SqlExpr, U_DMDados;

  function TUsuario.Logar: boolean;
    begin
        with TSQLQuery.Create(nil) do

        try
          SQLConnection := DM_Dados.SQLConnection;
          sql.Clear;
          sql.Add('SELECT IDUSUARIO FROM USUARIOS WHERE NOME = :LOGIN AND SENHA = :SENHA');
          Params[0].AsString := fLogin;
          Params[1].AsString := fSenha;
          Open;
          result := Fields[0].AsInteger > 0;
        finally
          Close;
          Free;
        end;
    end;

end.
