unit EQPType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, DBCtrls;

type
  TfmEQPType = class(TForm)
    sbexit: TSpeedButton;
    sbPrinterSetup: TSpeedButton;
    mmEQPType: TMainMenu;
    miFile: TMenuItem;
    miPrintSetUp: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miReport: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    dgrEQPType: TwwDBGrid;
    patoolsbar: TPanel;
    N2: TMenuItem;
    dnaEPQType: TDBNavigator;
    procedure miPrintSetUpClick(Sender: TObject);
    procedure sbexitClick(Sender: TObject);
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
  fmEQPType: TfmEQPType;

implementation

uses
  emdatamd, emmain;

{$R *.DFM}

procedure TfmEQPType.miPrintSetUpClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmEQPType.sbexitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEQPType.FormShow(Sender: TObject);
begin
  with dmEMData.quEQPType do
  begin
    if not Active then Open;
  end;
end;

procedure TfmEQPType.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmEMData.quEQPType do
  begin
    if Active then Close;
  end;
end;

procedure TfmEQPType.N2Click(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'EQP_TYPE', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmEQPType.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'miEQPTypeRep';
  Funcs[3] := 'dnaEQPType.nbInsert';
  Funcs[4] := 'dnaEQPType.nbDelete';
  //=====================
  fmEMMain.TestProgram( Funcs );
end;

end.
