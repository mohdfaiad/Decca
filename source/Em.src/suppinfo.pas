unit suppinfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls, Menus, DBCtrls,
  StdCtrls, Mask, wwdbedit;

type
  TfmSuppInfo = class(TForm)
    mmSupplierInfo: TMainMenu;
    miFile: TMenuItem;
    miPrintSetUp: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miReport: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    sbexit: TSpeedButton;
    sbPrinterSetup: TSpeedButton;
    patoolsbar: TPanel;
    wwDBEdit1: TwwDBEdit;
    Label1: TLabel;
    wwDBEdit2: TwwDBEdit;
    Label3: TLabel;
    wwDBEdit3: TwwDBEdit;
    Label2: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    wwDBEdit10: TwwDBEdit;
    wwDBEdit11: TwwDBEdit;
    wwDBEdit12: TwwDBEdit;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    wwDBEdit13: TwwDBEdit;
    wwDBEdit14: TwwDBEdit;
    wwDBEdit15: TwwDBEdit;
    wwDBEdit16: TwwDBEdit;
    wwDBEdit17: TwwDBEdit;
    GroupBox4: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox5: TGroupBox;
    DBMemo2: TDBMemo;
    miSupplierInfoRep: TMenuItem;
    dnaSupplierInfo: TDBNavigator;
    procedure miPrintSetUpClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miSupplierInfoRepClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSuppInfo: TfmSuppInfo;

implementation

uses
  emdatamd, emmain;

{$R *.DFM}

procedure TfmSuppInfo.miPrintSetUpClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmSuppInfo.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSuppInfo.miSupplierInfoRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'SUPPLIER_INFO', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmSuppInfo.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'miSupplierInfoRep';
  Funcs[3] := 'dnaSupplierInfo.nbInsert';
  Funcs[4] := 'danSupplierInfo.nbDelete';
  //=====================
  fmEMMain.TestProgram( Funcs );
end;

end.
