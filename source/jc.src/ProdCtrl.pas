unit ProdCtrl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, wwSpeedButton, wwDBNavigator, Buttons, Menus,
  ExtCtrls, wwdblook, StdCtrls, Db, DBTables, Wwtable, Mask, wwdbedit,
  Wwdotdot, Wwquery, Wwdatsrc, wwDialog, wwidlg, TestPrg;

type
  TfmProdCtrl = class(TForm)
    paTools: TPanel;
    mmJob_cost_file: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    wwDBNavigator1: TwwDBNavigator;
    wwNavButton1: TwwNavButton;
    wwNavButton2: TwwNavButton;
    wwNavButton3: TwwNavButton;
    wwNavButton4: TwwNavButton;
    dbdJobNo1: TwwDBComboDlg;
    taJobFile: TwwTable;
    taJobFileJOB_NO_1: TStringField;
    taJobFileJOB_NO_2: TStringField;
    taJobFileDESCRIPTION: TStringField;
    taJobFileJOB_STATUS: TStringField;
    taJobFileJOB_TYPE: TStringField;
    Label1: TLabel;
    dlcProdCat: TwwDBLookupCombo;
    Label2: TLabel;
    btnOK: TBitBtn;
    quProdCatFile: TwwQuery;
    quProdCatFileDESCRIPTION: TStringField;
    quJobFwo: TwwQuery;
    quJobFwoFWO_NO: TStringField;
    quJobFwoSTATUS: TStringField;
    quJobFwoSUB_JOB_NO: TStringField;
    quJobFwoDESCRIPTION: TStringField;
    quJobFwoFWO_LENGTH: TBCDField;
    quJobFwoFWO_WIDTH: TBCDField;
    quJobFwoFWO_HEIGHT: TBCDField;
    quJobFwoFWO_QTY: TBCDField;
    quJobFwoFWO_UNIT: TStringField;
    dsJobFwo: TwwDataSource;
    sdgJobNo: TwwSearchDialog;
    GroupBox1: TGroupBox;
    dgrJob_cost_file: TwwDBGrid;
    quJobFwoJOB_NO_1: TStringField;
    quProdCatFilePRODUCTION_CAT: TStringField;
    mmReport: TMenuItem;
    mmProdDone: TMenuItem;
    mmEveryPrd: TMenuItem;
    mmProdStatus: TMenuItem;
    TestPrg: TTestPrg;
    quJobFwoJOB_NO_2: TStringField;
    quJobFwoJobNo: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbdJobNo1CustomDlg(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure dgrJob_cost_fileDblClick(Sender: TObject);
    procedure mmProdDoneClick(Sender: TObject);
    procedure mmEveryPrdClick(Sender: TObject);
    procedure mmProdStatusClick(Sender: TObject);
    procedure CallReport(wReportName : String );
    procedure quJobFwoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  TJCReport = function(const ReportName,
                             CompanyID,
                             wUserID,
                             wPassword : String) : Boolean;
var
  fmProdCtrl: TfmProdCtrl;
  Module : Thandle;
  PFunc : TFarProc;

implementation

uses ProdStat, JcMain;

{$R *.DFM}

procedure TfmProdCtrl.FormCreate(Sender: TObject);
begin
  Caption := wCompanyName + ' == ' + Caption;
  //TestPrg.TestProgram('JC', wCompanyID, wUserID, wActiveSecurity);
  with taJobFile do
    if not Active then
     Open;
  with quJobFwo do
    if not Active then
      Open;
  with quProdCatFile do
    if not Active then
      Open;
end;

procedure TfmProdCtrl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with taJobFile do
    if  Active then
     Close;
  with quJobFwo do
    if Active then
      Close;
  with quProdCatFile do
    if Active then
      Close;
end;

procedure TfmProdCtrl.CallReport(wReportName : String );
begin
  Module := LoadLibrary('dll\JCReport.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'JCReports');
    TJCReport(PFunc)(wReportName, wCompanyID, wUserID, wPassword);
  end
  else
    ShowMessage('不能調用程序 JCReport.dll');
  FreeLibrary(Module);
end;

procedure TfmProdCtrl.dbdJobNo1CustomDlg(Sender: TObject);
begin
  if sdgJobNo.Execute then
  begin
    dbdJobNo1.Text := taJobFileJOB_NO_1.AsString;
  end;
end;

procedure TfmProdCtrl.btnOKClick(Sender: TObject);
begin
  with quJobFwo do
  begin
    if Active then
      Close;
    if Length(dbdJobNo1.Text) >= 8 then
      ParamByName('Job_no_1').Asstring := dbdJobNo1.Text
    else
      ParamByName('Job_no_1').Asstring := dbdJobNo1.Text + '%';
    Open;
  end;
end;

procedure TfmProdCtrl.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmProdCtrl.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmProdCtrl.dgrJob_cost_fileDblClick(Sender: TObject);
begin
  if Trim(dlcProdCat.Text) = '' then
  begin
    ShowMessage('請選生產部門!');
    dlcProdCat.SetFocus;
    Abort;
  end;
  Application.CreateForm(TfmProdStat, fmProdStat);
  try
    fmProdStat.ShowModal;
  finally
    fmProdStat.Free;
  end;
end;

procedure TfmProdCtrl.mmProdDoneClick(Sender: TObject);
begin
  CallReport('ProdDone');
end;

procedure TfmProdCtrl.mmEveryPrdClick(Sender: TObject);
begin
  CallReport('DailyRec');
end;

procedure TfmProdCtrl.mmProdStatusClick(Sender: TObject);
begin
  CallReport('StatuPrd');
end;

procedure TfmProdCtrl.quJobFwoCalcFields(DataSet: TDataSet);
begin
  quJobFwoJobNo.Value := trim(quJobFwoJOB_NO_1.Value);
  if trim(quJobFwoJOB_NO_2.Value) <> '' then
    quJobFwoJobNo.Value := quJobFwoJobNo.value
                         + '-' + trim(quJobFwoJOB_NO_2.value);
end;

end.
