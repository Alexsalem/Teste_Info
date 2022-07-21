unit Clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Cadastro, ImgList, DB, ADODB, Grids, DBGrids, QRCtrls, QuickRpt,
  ExtCtrls, ComCtrls, ToolWin, StdCtrls, Mask, DBCtrls, IdBaseComponent,
  IdMessage, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdMessageClient, IdSMTP, xmldom, XMLIntf, msxmldom, XMLDoc, DBClient,
  Provider, DBTables, MemTable, RxMemDS, IdSSLOpenSSL, IdIOHandler,
  IdIOHandlerSocket, IdPOP3, IdTCPServer, IdPOP3Server;

type
  TfrmClientes = class(TfrmCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    IdMessage1: TIdMessage;
    IdHTTP1: TIdHTTP;
    IdSMTP1: TIdSMTP;
    edtNome: TDBEdit;
    edtCPF: TDBEdit;
    edtIdentidade: TDBEdit;
    edtMail: TDBEdit;
    edtTelefone: TDBEdit;
    edtCEP: TDBEdit;
    edtLogradouro: TDBEdit;
    edtNumero: TDBEdit;
    edtComplemento: TDBEdit;
    edtBairro: TDBEdit;
    edtCidade: TDBEdit;
    edtEstado: TDBEdit;
    edtPais: TDBEdit;
    mmTblClientes: TRxMemoryData;
    mmTblClientesNome: TStringField;
    mmTblClientesCPF: TStringField;
    mmTblClientesIdentidade: TStringField;
    mmTblClientesEmail: TStringField;
    mmTblClientesTelefone: TStringField;
    mmTblClientesCEP: TStringField;
    mmTblClientesLogradouro: TStringField;
    mmTblClientesNumero: TIntegerField;
    mmTblClientesComplemento: TStringField;
    mmTblClientesBairro: TStringField;
    mmTblClientesCidade: TStringField;
    mmTblClientesEstado: TStringField;
    mmTblClientesPais: TStringField;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    IdPOP3Server1: TIdPOP3Server;
    IdPOP31: TIdPOP3;
    procedure DBEdit6Exit(Sender: TObject);
    procedure btnSalvar1Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelar1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtComplementoExit(Sender: TObject);
    procedure dsManutencaoStateChange(Sender: TObject);
  private
    procedure EnviarEMail;
    function BuscaCEP(Cep: string): TStringList;
    procedure CriaXml;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;
  logradouro, bairro, cidade, estado:string;
implementation

uses IdURI;

{$R *.dfm}

procedure TfrmClientes.DBEdit6Exit(Sender: TObject);
var lodados: TStringList;
begin
  inherited;
  BuscaCEP(edtCEP.Text);
  edtLogradouro.Text := logradouro;
  if not(edtLogradouro.Text='') then
  begin
    edtBairro.Text := bairro;
    edtCidade.text := cidade;
    edtEstado.Text := estado;
    edtNumero.SetFocus;
  end else begin
    edtLogradouro.SetFocus;
  end;
end;

procedure TfrmClientes.btnSalvar1Click(Sender: TObject);
begin
  inherited;
  mmTblClientes.Post;
  try
    CriaXml;
    EnviarEMail;
  except
    Exit;
  end;
end;

procedure TFrmClientes.EnviarEMail;
var
  // objetos necessários para o funcionamento
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocket;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  CaminhoAnexo: string;
begin
  // instanciação dos objetos
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocket.Create(Self);
  IdSMTP := TIdSMTP.Create(Self);
  IdMessage := TIdMessage.Create(Self);

  try
    // Configuração do SSL
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    // Configuração do SMTP
    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    IdSMTP.AuthenticationType := atLogin;
    IdSMTP.Port := 465;
    IdSMTP.Host := 'smtp.gmail.com';
    IdSMTP.Username := 'usuario';
    IdSMTP.Password := 'senha';

    // Tentativa de conexão e autenticação
    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        MessageDlg('Erro na conexão e/ou autenticação: ' +
                    E.Message, mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
   IdMessage.From.Address := 'alexctidesenv@gmail.com';
   IdMessage.From.Name := 'Alex';
   IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
   IdMessage.Recipients.EMailAddresses := 'alex.salem.santos@gmail.com';

    idMessage.Body.Add('Nome: '+mmTblClientesNome.AsString); {Corpo da sua Mensagem a ser Enviada}
    idMessage.Body.Add('CPF: '+mmTblClientesCPF.AsString);
    idMessage.Body.Add('Identidade: '+mmTblClientesIdentidade.AsString);
    idMessage.Body.Add('E-Mail:  '+mmTblClientesEmail.AsString);
    idMessage.Body.Add('Telefone: '+mmTblClientesTelefone.AsString);
    idMessage.Body.Add('CEP: '+mmTblClientesCEP.AsString);
    idMessage.Body.Add('Logradouro: '+mmTblClientesLogradouro.AsString);
    idMessage.Body.Add('Numero: '+mmTblClientesNumero.AsString);
    idMessage.Body.Add('Complemento: '+mmTblClientesComplemento.AsString);
    idMessage.Body.Add('Bairro: '+mmTblClientesBairro.AsString);
    idMessage.Body.Add('Cidade: '+mmTblClientesCidade.AsString);
    idMessage.Body.Add('Estado: '+mmTblClientesEstado.AsString);
    idMessage.Body.Add('Pais: '+mmTblClientesPais.AsString);
    idMessage.From.Text := 'alextcidesenv@gmail.com'; {Email do seu Usuario(pode ser o seu email ou outro qualquer)}
    idMessage.From.Name := 'alextcidesenv@gmail.com'; {Nome do seu Usuario(pode ser o seu Nome)}
    idMessage.Recipients.EMailAddresses := 'alex.salem.santos@gmail.com'; //Usuario que ira receber sua mensagem
    idMessage.Subject := 'Dados do Cliente'; //Assunto da Messangem
    try
      IdSMTP.Send(IdMessage);
      MessageDlg('Mensagem enviada com sucesso.', mtInformation, [mbOK], 0);
    except
      On E:Exception do
        MessageDlg('Erro ao enviar a mensagem: ' +
                    E.Message, mtWarning, [mbOK], 0);
    end;
  finally
    // liberação dos objetos da memória
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;


end;





procedure TfrmClientes.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key=#13 then
  begin
    SelectNext(Sender as TWinControl,True, True);
    Key := #0;
  end;
end;

function TfrmClientes.BuscaCEP(Cep: string): TStringList;
var
  lodados: TStringList;
begin
  lodados:=TStringList.Create;
  lodados.text:=stringreplace(idhttp1.URL.URLDecode(idhttp1.Get('http://republicavirtual.com.br/web_cep.php?cep='+Cep+'&formato=query_string')),'&',#13#10,[rfreplaceAll]);
  logradouro:=StringReplace(lodados.Values['TIPO_LOGRADOURO']+' '+lodados.Values['LOGRADOURO'],'+',' ',[rfReplaceAll,rfIgnoreCase]);
  bairro:=StringReplace(lodados.Values['BAIRRO'],'+',' ', [rfReplaceAll, rfIgnoreCase]);
  cidade:=StringReplace(lodados.Values['CIDADE'],'+',' ', [rfReplaceAll, rfIgnoreCase]);
  estado:=StringReplace(lodados.Values['UF'],'+',' ', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TfrmClientes.CriaXml;
var  XMLDocument: TXMLDocument;
  NodeTabela, NodeRegistro, NodeEndereco: IXMLNode;
  I: Integer;
begin
  XMLDocument := TXMLDocument.Create(nil);
  XMLDocument.Active := True;
  NodeTabela := XMLDocument.AddChild('Clientes');
  NodeRegistro := NodeTabela.AddChild('Dados');
  NodeRegistro.ChildValues['NOME']:= edtNome.Text;
  NodeRegistro.ChildValues['CPF'] := edtCPF.Text;
  NodeRegistro.ChildValues['IDENTIDADE'] := edtIdentidade.Text;
  NodeRegistro.ChildValues['EMAIL'] := edtMail.Text;
  NodeRegistro.ChildValues['TELEFONE'] := edtTelefone.Text;
  NodeRegistro.ChildValues['CEP'] := edtCEP.Text;
  NodeRegistro.ChildValues['LOGRADOURO'] := edtLogradouro.Text;
  NodeRegistro.ChildValues['NUMERO'] := edtNumero.Text;
  NodeRegistro.ChildValues['COMPLEMENTO'] := edtComplemento.Text;
  NodeRegistro.ChildValues['BAIRRO'] := edtBairro.Text;
  NodeRegistro.ChildValues['CIDADE'] := edtCidade.Text;
  NodeRegistro.ChildValues['ESTADO'] := edtEstado.Text;
  NodeRegistro.ChildValues['PAIS'] := edtPais.Text;

  XMLDocument.SaveToFile('C:\'+edtnome.Text+'.xml');


end;

procedure TfrmClientes.btnIncluirClick(Sender: TObject);
begin
  inherited;
  mmTblClientes.Append;

end;

procedure TfrmClientes.btnCancelar1Click(Sender: TObject);
begin
  inherited;
  mmTblClientes.Cancel;

end;

procedure TfrmClientes.btnEditarClick(Sender: TObject);
begin
  inherited;
  mmTblClientes.Edit;
end;

procedure TfrmClientes.btnExcluirClick(Sender: TObject);
begin
  inherited;
  mmTblClientes.Delete;
  mmTblClientes.Refresh;
end;

procedure TfrmClientes.btnFirstClick(Sender: TObject);
begin
  inherited;
  mmTblClientes.First;
end;

procedure TfrmClientes.btnPreviousClick(Sender: TObject);
begin
  inherited;
  mmTblClientes.Prior;
end;

procedure TfrmClientes.btnNextClick(Sender: TObject);
begin
  inherited;
  mmTblClientes.Next;
end;

procedure TfrmClientes.btnLastClick(Sender: TObject);
begin
  inherited;
  mmTblClientes.Last;
end;

procedure TfrmClientes.FormActivate(Sender: TObject);
begin
  inherited;
  mmTblClientes.Open;
end;

procedure TfrmClientes.edtComplementoExit(Sender: TObject);
begin
  inherited;
 if edtBairro.Text<>'' then
 edtPais.SetFocus;
end;

procedure TfrmClientes.dsManutencaoStateChange(Sender: TObject);
begin
  inherited;
  if dsManutencao.State in [dsInsert,dsEdit] then
    edtNome.SetFocus;
end;
end.
