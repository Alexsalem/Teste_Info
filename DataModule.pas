unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, Messages, Dialogs, IniFiles, FileCtrl, Forms;

type
  TDM1 = class(TDataModule)
    Ado_Conn1: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    
    { Public declarations }
  end;

var
  DM1: TDM1;

implementation

{$R *.dfm}



procedure TDM1.DataModuleCreate(Sender: TObject);
var
// vari�vel que ir� conter o arquivo
config : TIniFile;
// vari�vel que ir� armazenar par�metro a ser lido do arquivo
caminho,Servidor, Base, Usuario, Senha: string;
begin
  try

    caminho:= ExtractFilePath(Application.ExeName);

    config := TIniFile.Create(caminho+'Info.INI');

    Servidor := config.readstring('CONEXAO','SERVIDOR','');
    Base     := config.readstring('CONEXAO','BANCO','');
   

    Config.Free;

      ADO_Conn1.Connected:=False;

      ADO_Conn1.ConnectionString:='Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;'+
      ';Initial Catalog='''+Base+''''+
      ';Data Source='''+Servidor+''''+';';

       ADO_Conn1.Connected:=True;
  except
    on e:Exception do
    begin
      ShowMessage('Erro de conex�o com o banco!!'+#13#10+
                  'Entre em contato com o Administrador do sistema e informe a seguinte mensagem:'+#13#10+
                  'Erro no SQL Server!!'
                  );
      Application.Terminate;
    end;

  end;
end;

end.
