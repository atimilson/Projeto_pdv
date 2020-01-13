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
    VendorLib = 
      'C:\Users\atimi\Documents\Embarcadero\Studio\Arquivos\libmySQL.dl' +
      'l'
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
    Left = 96
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
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
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
    Left = 176
    Top = 176
  end
  object query_usuario: TFDQuery
    Active = True
    Connection = fd
    SQL.Strings = (
      'select * from usuarios')
    Left = 256
    Top = 104
    object query_usuarioid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object query_usuarionome: TStringField
      DisplayWidth = 20
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 30
    end
    object query_usuariousuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Required = True
      Size = 25
    end
    object query_usuariosenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 25
    end
    object query_usuariocargo: TStringField
      DisplayWidth = 10
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 25
    end
    object query_usuarioid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
      Origin = 'id_funcionario'
      Required = True
      Visible = False
    end
  end
  object DS_Usuario: TDataSource
    DataSet = query_usuario
    Left = 264
    Top = 176
  end
  object tb_usuarios: TFDTable
    IndexFieldNames = 'id'
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.usuarios'
    TableName = 'pdv.usuarios'
    Left = 256
    Top = 32
    object tb_usuariosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tb_usuariosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 30
    end
    object tb_usuariosusuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Required = True
      Size = 25
    end
    object tb_usuariossenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 25
    end
    object tb_usuarioscargo: TStringField
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 25
    end
    object tb_usuariosid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
      Origin = 'id_funcionario'
      Required = True
    end
  end
end
