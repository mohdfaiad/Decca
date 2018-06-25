unit partstyp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Menus, wwSpeedButton, wwDBNavigator, Buttons,
  ExtCtrls, DBCtrls;

type
  TfmPrtsType = class(TForm)
    patoolsbar: TPanel;
    sbexit: TSpeedButton;
    sbPrinterSetup: TSpeedButton;
    mmPartsType: TMainMenu;
    miFile: TMenuItem;
    miPrintSetUp: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miReport: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    dgrPartsType: TwwDBGrid;
    miPartsTypeRep: TMenuItem;
    dnaPartsType: TDBNavigator;
    procedure sbexitClick(Sender: TObject);
    procedure sbPrinterSetupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miPartsTypeRepClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrtsType: TfmPrtsType;

implementation

uses
  emdatamd, emmain;

{$R *.DFM}

procedure TfmPrtsType.sbexitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPrtsType.sbPrinterSetupClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmPrtsType.FormShow(Sender: TObject);
begin
  with dmEMData.quPartsType do
  begin
    if not Active then Open;
  end;
end;

procedure TfmPrtsType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmEMData.quPartsType do
  begin
    if Active then Close;
  end;
end;

procedure TfmPrtsType.miPartsTypeRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'PARTS_TYPE', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmPrtsType.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'miPartsTypeRep';
  Funcs[3] := 'dnaPartsType.nbInsert';
  Funcs[4] := 'dnaPartsType.nbDelete';
  //=====================
  fmEMMain.TestProgram( Funcs );
end;

end.
