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
    Left = 32
    Top = 96
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
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.funcionarios'
    TableName = 'pdv.funcionarios'
    Left = 176
    Top = 32
  end
  object query_func: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from funcionarios where 1=1')
    Left = 112
    Top = 96
    object query_funcid: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 7
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object query_funcnome: TStringField
      DisplayLabel = 'NOME'
      DisplayWidth = 20
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object query_funccpf: TStringField
      DisplayWidth = 15
      FieldName = 'cpf'
      Origin = 'cpf'
      Required = True
    end
    object query_functelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 15
    end
    object query_funcendereco: TIntegerField
      FieldName = 'endereco'
      Origin = 'endereco'
      Required = True
    end
    object query_funccargo: TStringField
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 25
    end
    object query_funcdata_cadastro: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
  end
  object ds_func: TDataSource
    DataSet = query_func
    Left = 112
    Top = 176
  end
end
