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
end