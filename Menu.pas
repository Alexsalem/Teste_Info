unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrmMenu = class(TForm)
    mm1: TMainMenu;
    Cadastro1: TMenuItem;
    Clientes1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Clientes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses Clientes;


{$R *.dfm}

procedure TfrmMenu.Sair1Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja abandonar o sistema?', 'Sair', MB_YESNO + MB_ICONQUESTION) =mrYes then
    Application.Terminate
  else
  begin
    Abort;
  end;
end;

procedure TfrmMenu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Sair1Click(Sender);
end;

procedure TfrmMenu.Clientes1Click(Sender: TObject);
begin
  frmClientes := TfrmClientes.Create(Self);
  frmClientes.ShowModal;
  FreeAndNil(frmClientes);
end;

end.
