inherited frmClientes: TfrmClientes
  Caption = 'Clientes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited tlb1: TToolBar
    inherited btnExcluir: TToolButton
      OnClick = btnExcluirClick
    end
  end
  inherited PageControl1: TPageControl
    inherited tsManutencao: TTabSheet
      object Label1: TLabel [0]
        Left = 4
        Top = 0
        Width = 28
        Height = 16
        Caption = 'Nome'
      end
      object Label2: TLabel [1]
        Left = 452
        Top = 0
        Width = 31
        Height = 16
        Caption = 'C,P.F.'
      end
      object Label3: TLabel [2]
        Left = 580
        Top = 0
        Width = 49
        Height = 16
        Caption = 'Identidade'
      end
      object Label4: TLabel [3]
        Left = 4
        Top = 44
        Width = 30
        Height = 16
        Caption = 'E-Mail'
      end
      object Label5: TLabel [4]
        Left = 244
        Top = 44
        Width = 41
        Height = 16
        Caption = 'Telefone'
      end
      object Label6: TLabel [5]
        Left = 371
        Top = 44
        Width = 31
        Height = 16
        Caption = 'C.E.P.'
      end
      object Label7: TLabel [6]
        Left = 4
        Top = 88
        Width = 56
        Height = 16
        Caption = 'Logradouro'
      end
      object Label8: TLabel [7]
        Left = 328
        Top = 88
        Width = 12
        Height = 16
        Caption = 'N'#186
      end
      object Label9: TLabel [8]
        Left = 456
        Top = 88
        Width = 64
        Height = 16
        Caption = 'Complemento'
      end
      object Label10: TLabel [9]
        Left = 4
        Top = 131
        Width = 29
        Height = 16
        Caption = 'Bairro'
      end
      object Label11: TLabel [10]
        Left = 216
        Top = 131
        Width = 34
        Height = 16
        Caption = 'Cidade'
      end
      object Label12: TLabel [11]
        Left = 345
        Top = 130
        Width = 32
        Height = 16
        Caption = 'Estado'
      end
      object Label13: TLabel [12]
        Left = 4
        Top = 176
        Width = 20
        Height = 16
        Caption = 'Pa'#237's'
      end
      inherited qrClientes: TQuickRep
        Functions.DATA = (
          '0'
          '0'
          #39#39)
        Page.Values = (
          100.000000000000000000
          2970.000000000000000000
          100.000000000000000000
          2100.000000000000000000
          100.000000000000000000
          100.000000000000000000
          0.000000000000000000)
        inherited qr_Titulo: TQRBand
          Size.Values = (
            219.604166666666700000
            1899.708333333333000000)
          inherited QRSysData2: TQRSysData
            Size.Values = (
              44.979166666666670000
              1714.500000000000000000
              153.458333333333300000
              179.916666666666700000)
            FontSize = 10
          end
          inherited QRLabel2: TQRLabel
            Size.Values = (
              44.979166666666670000
              1547.812500000000000000
              153.458333333333300000
              166.687500000000000000)
            FontSize = 10
          end
          inherited lbl_Titulo: TQRLabel
            Size.Values = (
              87.312500000000000000
              0.000000000000000000
              0.000000000000000000
              1897.062500000000000000)
            FontSize = 14
          end
        end
        inherited qr_ColumnHeader: TQRBand
          Size.Values = (
            105.833333333333300000
            1899.708333333333000000)
        end
        inherited qr_Detalhe: TQRBand
          Size.Values = (
            105.833333333333300000
            1899.708333333333000000)
        end
        inherited qr_Sumarry: TQRBand
          Size.Values = (
            105.833333333333300000
            1899.708333333333000000)
          inherited QRSysData1: TQRSysData
            Size.Values = (
              44.979166666666670000
              1772.708333333333000000
              31.750000000000000000
              121.708333333333300000)
            FontSize = 10
          end
          inherited QRLabel1: TQRLabel
            Size.Values = (
              44.979166666666670000
              1635.125000000000000000
              31.750000000000000000
              119.062500000000000000)
            FontSize = 10
          end
        end
      end
      object edtNome: TDBEdit
        Left = 4
        Top = 16
        Width = 441
        Height = 24
        CharCase = ecUpperCase
        DataField = 'Nome'
        DataSource = dsManutencao
        TabOrder = 1
        OnKeyPress = DBEdit1KeyPress
      end
      object edtCPF: TDBEdit
        Left = 452
        Top = 16
        Width = 121
        Height = 24
        CharCase = ecUpperCase
        DataField = 'CPF'
        DataSource = dsManutencao
        TabOrder = 2
        OnKeyPress = DBEdit1KeyPress
      end
      object edtIdentidade: TDBEdit
        Left = 580
        Top = 16
        Width = 121
        Height = 24
        CharCase = ecUpperCase
        DataField = 'Identidade'
        DataSource = dsManutencao
        TabOrder = 3
        OnKeyPress = DBEdit1KeyPress
      end
      object edtMail: TDBEdit
        Left = 4
        Top = 60
        Width = 237
        Height = 24
        CharCase = ecLowerCase
        DataField = 'Email'
        DataSource = dsManutencao
        TabOrder = 4
        OnKeyPress = DBEdit1KeyPress
      end
      object edtTelefone: TDBEdit
        Left = 246
        Top = 60
        Width = 121
        Height = 24
        CharCase = ecUpperCase
        DataField = 'Telefone'
        DataSource = dsManutencao
        TabOrder = 5
        OnKeyPress = DBEdit1KeyPress
      end
      object edtCEP: TDBEdit
        Left = 372
        Top = 59
        Width = 121
        Height = 24
        CharCase = ecUpperCase
        DataField = 'CEP'
        DataSource = dsManutencao
        TabOrder = 6
        OnExit = DBEdit6Exit
        OnKeyPress = DBEdit1KeyPress
      end
      object edtLogradouro: TDBEdit
        Left = 4
        Top = 104
        Width = 317
        Height = 24
        CharCase = ecUpperCase
        DataField = 'Logradouro'
        DataSource = dsManutencao
        TabOrder = 7
        OnKeyPress = DBEdit1KeyPress
      end
      object edtNumero: TDBEdit
        Left = 328
        Top = 104
        Width = 121
        Height = 24
        CharCase = ecUpperCase
        DataField = 'Numero'
        DataSource = dsManutencao
        TabOrder = 8
        OnKeyPress = DBEdit1KeyPress
      end
      object edtComplemento: TDBEdit
        Left = 456
        Top = 103
        Width = 121
        Height = 24
        CharCase = ecUpperCase
        DataField = 'Complemento'
        DataSource = dsManutencao
        TabOrder = 9
        OnExit = edtComplementoExit
        OnKeyPress = DBEdit1KeyPress
      end
      object edtBairro: TDBEdit
        Left = 4
        Top = 148
        Width = 205
        Height = 24
        CharCase = ecUpperCase
        DataField = 'Bairro'
        DataSource = dsManutencao
        TabOrder = 10
        OnKeyPress = DBEdit1KeyPress
      end
      object edtCidade: TDBEdit
        Left = 216
        Top = 148
        Width = 121
        Height = 24
        CharCase = ecUpperCase
        DataField = 'Cidade'
        DataSource = dsManutencao
        TabOrder = 11
        OnKeyPress = DBEdit1KeyPress
      end
      object edtEstado: TDBEdit
        Left = 344
        Top = 148
        Width = 121
        Height = 24
        CharCase = ecUpperCase
        DataField = 'Estado'
        DataSource = dsManutencao
        TabOrder = 12
        OnKeyPress = DBEdit1KeyPress
      end
      object edtPais: TDBEdit
        Left = 4
        Top = 192
        Width = 121
        Height = 24
        CharCase = ecUpperCase
        DataField = 'Pais'
        DataSource = dsManutencao
        TabOrder = 13
        OnKeyPress = DBEdit1KeyPress
      end
    end
  end
  inherited dsManutencao: TDataSource
    DataSet = mmTblClientes
    OnStateChange = dsManutencaoStateChange
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 444
    Top = 311
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 780
    Top = 316
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Host = 'smtp.gmail.com'
    Port = 587
    AuthenticationType = atNone
    Password = 'A!ex201178'
    Username = 'alextcidesenv@gmail.com'
    Left = 476
    Top = 311
  end
  object mmTblClientes: TRxMemoryData
    FieldDefs = <>
    Left = 644
    Top = 191
    object mmTblClientesNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mmTblClientesCPF: TStringField
      FieldName = 'CPF'
      EditMask = '999.999.999-99;0; '
      Size = 11
    end
    object mmTblClientesIdentidade: TStringField
      FieldName = 'Identidade'
      Size = 10
    end
    object mmTblClientesEmail: TStringField
      FieldName = 'Email'
      Size = 40
    end
    object mmTblClientesTelefone: TStringField
      FieldName = 'Telefone'
      EditMask = '(99)99999-9999;0; '
      Size = 11
    end
    object mmTblClientesCEP: TStringField
      FieldName = 'CEP'
      EditMask = '99999-999;0; '
      Size = 8
    end
    object mmTblClientesLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 50
    end
    object mmTblClientesNumero: TIntegerField
      FieldName = 'Numero'
    end
    object mmTblClientesComplemento: TStringField
      FieldName = 'Complemento'
      Size = 30
    end
    object mmTblClientesBairro: TStringField
      FieldName = 'Bairro'
    end
    object mmTblClientesCidade: TStringField
      FieldName = 'Cidade'
    end
    object mmTblClientesEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object mmTblClientesPais: TStringField
      FieldName = 'Pais'
    end
  end
  object IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvSSLv2
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 596
    Top = 319
  end
  object IdPOP3Server1: TIdPOP3Server
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 995
    Greeting.NumericCode = 0
    Greeting.Text.Strings = (
      '+OK Welcome to Indy POP3 Server')
    MaxConnectionReply.NumericCode = 0
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    ReplyUnknownCommand.Text.Strings = (
      '-ERR Sorry, Unknown Command')
    Left = 188
    Top = 311
  end
  object IdPOP31: TIdPOP3
    MaxLineAction = maException
    ReadTimeout = 0
    Host = 'pop.gmail.com'
    Port = 995
    Password = 'A!ex201178'
    Username = 'alextcdesenv@gmail.com'
    Left = 244
    Top = 303
  end
end
