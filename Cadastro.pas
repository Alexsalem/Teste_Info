unit Cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ADODB, Provider, DB, DBClient, ImgList, ToolWin,
  ComCtrls, Grids, DBGrids, ComObj, ExtCtrls, Mask, DBCtrls, QuickRpt,
  QRCtrls;

type
  TfrmCadastro = class(TForm)
    dsManutencao: TDataSource;
    tlb1: TToolBar;
    il1: TImageList;
    btn2: TToolButton;
    btn1: TToolButton;
    btn3: TToolButton;
    btn4: TToolButton;
    btn5: TToolButton;
    PageControl1: TPageControl;
    tsManutencao: TTabSheet;
    tsListagem: TTabSheet;
    dbgrd1: TDBGrid;
    btnIncluir: TToolButton;
    btnEditar: TToolButton;
    btnCancelar: TToolButton;
    btnExcluir: TToolButton;
    btnSalvar: TToolButton;
    btnPrint: TToolButton;
    btnExit: TToolButton;
    qrClientes: TQuickRep;
    qr_Titulo: TQRBand;
    qr_ColumnHeader: TQRBand;
    qr_Detalhe: TQRBand;
    qr_Sumarry: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    lbl_Titulo: TQRLabel;
    btnFirst: TToolButton;
    btnPrevious: TToolButton;
    btnNext: TToolButton;
    btnLast: TToolButton;
    procedure btn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelar1Click(Sender: TObject);
    procedure btnSalvar1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);

  private
    procedure HabilitaDesaBilita(bHabilita: Boolean);
   
    { Private declarations }
  public
    InstrucaoInicial: string;
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

uses Menu, DataModule;

{$R *.dfm}

procedure TfrmCadastro.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastro.btnExitClick(Sender: TObject);
begin

 Close;
end;

procedure TfrmCadastro.btnSalvar1Click(Sender: TObject);
begin
 
  HabilitaDesaBilita(True);

end;

procedure TfrmCadastro.FormActivate(Sender: TObject);
begin
 
  HabilitaDesaBilita(True);


end;

procedure TfrmCadastro.btnCancelar1Click(Sender: TObject);
begin

  HabilitaDesaBilita(True);
end;

procedure TfrmCadastro.HabilitaDesaBilita(bHabilita:Boolean);
begin
  btnIncluir.Enabled := bHabilita;
  btnEditar.Enabled := bHabilita;
  btnCancelar.Enabled := not bHabilita;
  btnExcluir.Enabled :=bHabilita;
  btnSalvar.Enabled := not bHabilita;
  btnPrint.Enabled := bHabilita;
  btnFirst.Enabled :=  bHabilita;
  btnPrevious.Enabled := bHabilita;
  btnNext.Enabled  := bHabilita;
  btnLast.Enabled := bHabilita;
end;




procedure TfrmCadastro.btnIncluirClick(Sender: TObject);
begin
  HabilitaDesaBilita(False);
end;

procedure TfrmCadastro.btnEditarClick(Sender: TObject);
begin
  HabilitaDesaBilita(False);
end;

end.
