object DataModule2: TDataModule2
  OnCreate = DataModuleCreate
  Height = 600
  Width = 800
  PixelsPerInch = 120
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog=TESTESISTEMA;Data Source=l' +
      'ocalhost\SQLEXPRESS;Initial File Name="";Server SPN="";Authentic' +
      'ation="";Access Token=""'
    Provider = 'MSOLEDBSQL.1'
    Left = 650
    Top = 91
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 630
    Top = 190
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 620
    Top = 300
    object ClientDataSet1nome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object ClientDataSet1endereco: TStringField
      FieldName = 'endereco'
      Size = 60
    end
    object ClientDataSet1bairro: TStringField
      FieldName = 'bairro'
    end
    object ClientDataSet1cep: TStringField
      FieldName = 'cep'
      Size = 8
    end
    object ClientDataSet1complemento: TStringField
      FieldName = 'complemento'
      Size = 30
    end
    object ClientDataSet1cidade: TStringField
      FieldName = 'cidade'
      Size = 30
    end
    object ClientDataSet1uf: TStringField
      FieldName = 'uf'
      Size = 2
    end
  end
end
