unit servtype;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, wwSpeedButton, wwDBNavigator, Buttons,
  ExtCtrls, Menus, DBCtrls;

type
  TfmServType = class(TForm)
    mmServType: TMainMenu;
    miFile: TMenuItem;
    miPrintSetUp: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miReport: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    patoolsbar: TPanel;
    sbexit: TSpeedButton;
    sbPrinterSetup: TSpeedButton;
    dgrServType: TwwDBGrid;
    N2: TMenuItem;
    dnaServType: TDBNavigator;
    procedure miPrintSetUpClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmServType: TfmServType;

implementation

uses
  emdatamd, emmain;

{$R *.DFM}

procedure TfmServType.miPrintSetUpClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmServType.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmServType.FormShow(Sender: TObject);
begin
  with dmEMData.quServType do
  begin
    if not Active then Open;
  end;
end;

procedure TfmServType.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmEMData.quServType do
  begin
    if Active then Close;
  end;
end;

procedure TfmServType.N2Click(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'SERVICE_TYPE', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmServType.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'miServTypeRep';
  Funcs[3] := 'dnaServType.nbInsert';
  Funcs[4] := 'dnaServType.nbDelete';
  //=====================
  fmEMMain.TestProgram( Funcs );
end;

end.
