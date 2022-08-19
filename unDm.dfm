object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 670
  Top = 219
  Height = 287
  Width = 225
  object Conexao: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbexpmss.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MSSQL'
      'HostName=LEO-NOTE1\SQLEXPRESS'
      'DataBase=Teste'
      'User_Name=sa'
      'Password=sa123'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'MSSQL TransIsolation=ReadCommited'
      'OS Authentication=False')
    VendorLib = 'oledb'
    Connected = True
    Left = 40
    Top = 72
  end
  object qryPessoa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT P.*,E.* FROM PESSOA P'
      'LEFT JOIN ENDERECO E ON E.ID_PESSOA = P.ID_PESSOA')
    SQLConnection = Conexao
    Left = 96
    Top = 16
    object qryPessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object qryPessoaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      FixedChar = True
      Size = 100
    end
    object qryPessoaRG: TStringField
      FieldName = 'RG'
      Required = True
      FixedChar = True
      Size = 13
    end
    object qryPessoaCPF: TStringField
      FieldName = 'CPF'
      Required = True
      FixedChar = True
      Size = 15
    end
    object qryPessoaMAE: TStringField
      FieldName = 'MAE'
      FixedChar = True
      Size = 100
    end
    object qryPessoaPAI: TStringField
      FieldName = 'PAI'
      FixedChar = True
      Size = 100
    end
    object qryPessoaID_ENDERECO: TIntegerField
      FieldName = 'ID_ENDERECO'
    end
    object qryPessoaCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object qryPessoaENDERECO: TStringField
      FieldName = 'ENDERECO'
      FixedChar = True
      Size = 100
    end
    object qryPessoaNUMERO: TStringField
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 10
    end
    object qryPessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      FixedChar = True
      Size = 100
    end
    object qryPessoaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_PESSOA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'RG'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 13
      end
      item
        Name = 'CPF'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'MAE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PAI'
        Attributes = [faFixed]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ID_ENDERECO'
        DataType = ftInteger
      end
      item
        Name = 'CEP'
        Attributes = [faFixed]
        DataType = ftString
        Size = 9
      end
      item
        Name = 'ENDERECO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NUMERO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CIDADE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'UF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspPessoa'
    StoreDefs = True
    Left = 96
    Top = 136
    object cdsPessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      KeyFields = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPessoaNOME: TStringField
      FieldName = 'NOME'
      KeyFields = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 100
    end
    object cdsPessoaRG: TStringField
      FieldName = 'RG'
      KeyFields = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsPessoaCPF: TStringField
      FieldName = 'CPF'
      KeyFields = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 15
    end
    object cdsPessoaMAE: TStringField
      FieldName = 'MAE'
      KeyFields = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 100
    end
    object cdsPessoaPAI: TStringField
      FieldName = 'PAI'
      KeyFields = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 100
    end
    object cdsPessoaID_ENDERECO: TIntegerField
      FieldName = 'ID_ENDERECO'
    end
    object cdsPessoaCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsPessoaENDERECO: TStringField
      FieldName = 'ENDERECO'
      FixedChar = True
      Size = 100
    end
    object cdsPessoaNUMERO: TStringField
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 10
    end
    object cdsPessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      FixedChar = True
      Size = 100
    end
    object cdsPessoaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
  end
  object dspPessoa: TDataSetProvider
    DataSet = qryPessoa
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 80
  end
end
