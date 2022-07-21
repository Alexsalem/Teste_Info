program Teste_Info;

uses
  Forms,
  Cadastro in 'Cadastro.pas' {frmCadastro},
  DataModule in 'DataModule.pas' {DM1: TDataModule},
  Menu in 'Menu.pas' {frmMenu},
  Clientes in 'Clientes.pas' {frmClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
