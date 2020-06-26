object DM_Dados: TDM_Dados
  OldCreateOrder = False
  Height = 335
  Width = 405
  object SQLConnection: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver210.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=21.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver210.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=21.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'MaxBlobSize=-1'
      'DriverName=MySQL'
      'HostName=localhost'
      'Database=mygerenciador'
      'User_Name=root'
      'Password=drogaria'
      'ServerCharSet='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'ConnectTimeout=60')
    Connected = True
    Left = 32
    Top = 8
  end
  object CDS_Clientes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'idcliente'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'sexo'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'rg'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 14
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DSP_Clientes'
    StoreDefs = True
    AfterScroll = CDS_ClientesAfterScroll
    Left = 272
    Top = 56
    object CDS_Clientesidcliente: TIntegerField
      DisplayLabel = 'Cod'
      DisplayWidth = 7
      FieldName = 'idcliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDS_Clientesnome: TStringField
      DisplayLabel = 'Nome Cliente'
      DisplayWidth = 59
      FieldName = 'nome'
      Size = 60
    end
    object CDS_Clientessexo: TStringField
      DisplayLabel = 'Sexo'
      DisplayWidth = 16
      FieldName = 'sexo'
      FixedChar = True
      Size = 1
    end
    object CDS_Clientesrg: TStringField
      DisplayLabel = 'RG'
      DisplayWidth = 21
      FieldName = 'rg'
      Size = 12
    end
    object CDS_Clientescpf: TStringField
      FieldName = 'cpf'
      Size = 14
    end
  end
  object DSP_Clientes: TDataSetProvider
    DataSet = SQLDS_Clientes
    Left = 200
    Top = 56
  end
  object SQLDS_Clientes: TSQLDataSet
    CommandText = 
      'SELECT '#13#10'idcliente,'#13#10'nome,'#13#10'sexo,'#13#10'rg,'#13#10'cpf '#13#10'FROM CLIENTES ORDE' +
      'R BY IDCLIENTE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 120
    Top = 56
    object SQLDS_Clientesidcliente: TIntegerField
      FieldName = 'idcliente'
      Required = True
    end
    object SQLDS_Clientesnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object SQLDS_Clientessexo: TStringField
      FieldName = 'sexo'
      FixedChar = True
      Size = 1
    end
    object SQLDS_Clientesrg: TStringField
      FieldName = 'rg'
      Size = 12
    end
    object SQLDS_Clientescpf: TStringField
      FieldName = 'cpf'
      Size = 14
    end
  end
  object DSP_Usuarios: TDataSetProvider
    DataSet = SQL_Usuario
    Left = 184
    Top = 272
  end
  object CDS_Usuarios: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <
      item
        DataType = ftString
        Name = 'senha'
        ParamType = ptInput
      end>
    ProviderName = 'DSP_Usuarios'
    Left = 264
    Top = 272
    object CDS_Usuariosidusuario: TIntegerField
      FieldName = 'idusuario'
      Required = True
    end
    object CDS_Usuariosnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object CDS_Usuariossenha: TStringField
      FieldName = 'senha'
      Required = True
    end
  end
  object DSP_Telefone: TDataSetProvider
    DataSet = SQL_Telefone
    Left = 200
    Top = 112
  end
  object CDS_Telefone: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'idcliente'
        ParamType = ptInput
      end>
    ProviderName = 'DSP_Telefone'
    Left = 272
    Top = 112
    object CDS_Telefoneidtelefone: TIntegerField
      FieldName = 'idtelefone'
      Required = True
    end
    object CDS_Telefoneidcliente: TIntegerField
      FieldName = 'idcliente'
    end
    object CDS_Telefonetipo: TStringField
      FieldName = 'tipo'
    end
    object CDS_Telefonenumero: TStringField
      FieldName = 'numero'
      Size = 11
    end
  end
  object CDS_EndCli: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'idendereco'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'idcliente'
        DataType = ftInteger
      end
      item
        Name = 'tipo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'endereco'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'numero'
        DataType = ftInteger
      end
      item
        Name = 'cidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cep'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'idcliente'
        ParamType = ptInput
      end>
    ProviderName = 'DSP_EndCli'
    StoreDefs = True
    Left = 276
    Top = 168
    object CDS_EndCliIDENDERECO: TIntegerField
      FieldName = 'IDENDERECO'
      Required = True
    end
    object CDS_EndCliIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
    end
    object CDS_EndClitipo: TStringField
      FieldName = 'tipo'
    end
    object CDS_EndCliendereco: TStringField
      FieldName = 'endereco'
      Size = 50
    end
    object CDS_EndClinumero: TIntegerField
      FieldName = 'numero'
    end
    object CDS_EndClicidade: TStringField
      FieldName = 'cidade'
    end
    object CDS_EndClicep: TStringField
      FieldName = 'cep'
      Size = 10
    end
  end
  object DSP_EndCli: TDataSetProvider
    DataSet = SQL_EndCli
    Left = 196
    Top = 168
  end
  object SQL_EndCli: TSQLQuery
    DataSource = frmPrincipal.DS_EndCli
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'idcliente'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      'e.*'
      'FROM'
      'ENDCLi e'
      'inner join clientes c'
      'on (e.idcliente=c.idcliente)'
      'where'
      'e.idcliente = :idcliente')
    SQLConnection = SQLConnection
    Left = 120
    Top = 168
    object SQL_EndCliidendereco: TIntegerField
      FieldName = 'idendereco'
      Required = True
    end
    object SQL_EndCliidcliente: TIntegerField
      FieldName = 'idcliente'
    end
    object SQL_EndClitipo: TStringField
      FieldName = 'tipo'
    end
    object SQL_EndCliendereco: TStringField
      FieldName = 'endereco'
      Size = 50
    end
    object SQL_EndClinumero: TIntegerField
      FieldName = 'numero'
    end
    object SQL_EndClicidade: TStringField
      FieldName = 'cidade'
    end
    object SQL_EndClicep: TStringField
      FieldName = 'cep'
      Size = 10
    end
  end
  object SQL_Telefone: TSQLQuery
    DataSource = frmPrincipal.DS_TelCli
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'idcliente'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      'T.*'
      'FROM'
      'TELCLI T'
      'INNER JOIN CLIENTES C'
      'ON (T.IDCLIENTE=C.IDCLIENTE)'
      'WHERE'
      'T.IDCLIENTE = :IDCLIENTE')
    SQLConnection = SQLConnection
    Left = 120
    Top = 112
    object SQL_Telefoneidtelefone: TIntegerField
      FieldName = 'idtelefone'
      Required = True
    end
    object SQL_Telefoneidcliente: TIntegerField
      FieldName = 'idcliente'
    end
    object SQL_Telefonetipo: TStringField
      FieldName = 'tipo'
    end
    object SQL_Telefonenumero: TStringField
      FieldName = 'numero'
      Size = 11
    end
  end
  object SQL_Usuario: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'senha'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '* '
      'FROM'
      'USUARIOS'
      'WHERE'
      'SENHA = :SENHA')
    SQLConnection = SQLConnection
    Left = 112
    Top = 272
  end
end
