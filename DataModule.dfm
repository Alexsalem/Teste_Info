object DM1: TDM1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 553
  Top = 305
  Height = 179
  Width = 215
  object Ado_Conn1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=TESTE_INFO;Data Source=DESKTOP-VS1K5EM\' +
      'SQLEXPRESS;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 84
    Top = 60
  end
end
