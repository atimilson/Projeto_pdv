object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 364
  Width = 680
  object fd: TFDConnection
    Params.Strings = (
      'Database=pdv'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Users\Ninja\Desktop\Arquivos\libmySQL.dll'
    Left = 568
    Top = 32
  end
  object tb_Cargos: TFDTable
    IndexFieldNames = 'id'
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.cargos'
    TableName = 'pdv.cargos'
    Left = 104
    Top = 32
    object tb_Cargosid: TFDAutoIncField
      DisplayWidth = 2
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tb_Cargoscargo: TStringField
      DisplayWidth = 5
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 10
    end
  end
  object query_Cargos: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from cargos')
    Left = 104
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = query_Cargos
    Left = 32
    Top = 176
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 424
    Top = 40
  end
  object tb_func: TFDTable
    IndexFieldNames = 'id'
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.funcionarios'
    TableName = 'pdv.funcionarios'
    Left = 176
    Top = 32
    object tb_funcid: TIntegerField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'id'
      LookupDataSet = query_func
      LookupKeyFields = 'id'
      LookupResultField = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      MinValue = 1
      Required = True
    end
    object tb_funcnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object tb_funccpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Required = True
    end
    object tb_functelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 15
    end
    object tb_funcendereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 30
    end
    object tb_funccargo: TStringField
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 25
    end
    object tb_funcdata_cadastro: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
  end
  object query_func: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from funcionarios where 1=1')
    Left = 176
    Top = 104
  end
  object ds_func: TDataSource
    DataSet = query_func
    Left = 112
    Top = 176
  end
end
