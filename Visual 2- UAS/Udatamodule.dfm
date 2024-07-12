object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 173
  Width = 215
  object Zconnection: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\User\Downloads\libmysql .dll'
    Left = 32
    Top = 40
  end
  object zKustomer: TZQuery
    Connection = Zconnection
    Active = True
    SQL.Strings = (
      'select * from kustomer')
    Params = <>
    Left = 112
    Top = 16
  end
  object dsKustomer: TDataSource
    DataSet = zKustomer
    Left = 112
    Top = 72
  end
end
