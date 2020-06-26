object DM_Clientes: TDM_Clientes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 329
  Width = 658
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Driver={MySQL ODBC 5.2 ANSI Driver};Server=localhost;database=my' +
      'gerenciador;UID=root;PWD=123456;'
    LoginPrompt = False
    Left = 32
    Top = 22
  end
  object ADO_TBClientes: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'clientes'
    Left = 128
    Top = 24
    object ADO_TBClientesidcliente: TAutoIncField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'idcliente'
      ReadOnly = True
    end
    object ADO_TBClientesnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object ADO_TBClientessexo: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'sexo'
      FixedChar = True
      Size = 1
    end
    object ADO_TBClientesrg: TStringField
      DisplayLabel = 'RG'
      FieldName = 'rg'
      Size = 9
    end
    object ADO_TBClientescpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'cpf'
      Size = 11
    end
  end
  object DTS_Clientes: TDataSource
    DataSet = CDS_Clientes
    Left = 344
    Top = 96
  end
  object CDS_Clientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Clientes'
    Left = 272
    Top = 97
    object CDS_Clientesidcliente: TAutoIncField
      FieldName = 'idcliente'
      ReadOnly = True
    end
    object CDS_Clientesnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object CDS_Clientessexo: TStringField
      FieldName = 'sexo'
      FixedChar = True
      Size = 1
    end
    object CDS_Clientesrg: TStringField
      FieldName = 'rg'
      Size = 9
    end
    object CDS_Clientescpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
  end
  object SQL_Clientes: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from clientes')
    Left = 120
    Top = 96
    object SQL_Clientesidcliente: TAutoIncField
      FieldName = 'idcliente'
      ReadOnly = True
    end
    object SQL_Clientesnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object SQL_Clientessexo: TStringField
      FieldName = 'sexo'
      FixedChar = True
      Size = 1
    end
    object SQL_Clientesrg: TStringField
      FieldName = 'rg'
      Size = 9
    end
    object SQL_Clientescpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
  end
  object SQLConnection1: TSQLConnection
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
      'HostName=localhost'
      'Database=mygerenciador'
      'User_Name=root'
      'Password=123456'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    Left = 40
    Top = 248
  end
  object DSP_Clientes: TDataSetProvider
    DataSet = SQL_Clientes
    Left = 200
    Top = 96
  end
  object DTS_TBClientes: TDataSource
    DataSet = ADO_TBClientes
    Left = 208
    Top = 24
  end
end
