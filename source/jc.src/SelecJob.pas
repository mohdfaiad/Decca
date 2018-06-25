unit SelecJob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, Buttons, wwdblook, Wwdbdlg, Menus, TestPrg;

type
  TfmSelecJob = class(TForm)
    paSelect: TPanel;
    grJOBNO: TGroupBox;
    dgrJob_file: TwwDBGrid;
    dcbView: TwwDBComboBox;
    laJob_no_1: TLabel;
    laJobNo2: TLabel;
    laFWONo: TLabel;
    laSubJobNo: TLabel;
    btnOK: TBitBtn;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    ps_PrinterSetup: TPrinterSetupDialog;
    edJobNo1: TEdit;
    edJobNo2: TEdit;
    edSubJobNo: TEdit;
    edFWONo: TEdit;
    mmJobSele: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    mmReport: TMenuItem;
    mmRptJob: TMenuItem;
    mRptFwo: TMenuItem;
    TestPrg: TTestPrg;
    mmJCStatus: TMenuItem;
    mmSubContract: TMenuItem;
    procedure dgrJob_fileDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edJobNo1KeyPress(Sender: TObject; var Key: Char);
    procedure edJobNo2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edJobNo1Change(Sender: TObject);
    procedure mmRptJobClick(Sender: TObject);
    procedure mRptFwoClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure CallReport(wReportName : String );
    procedure mmJCStatusClick(Sender: TObject);
    procedure mmSubContractClick(Sender: TObject);
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
{  TEMReport = function(companyname : String; user : String; password : String;
                       Server1 : String; Server2 : String; RepName : String;
                       SerialNo : Integer) : Boolean;}

var
  fmSelecJob: TfmSelecJob;
  Module : Thandle;
  PFunc : TFarProc;
implementation
   uses JCdatadm,
        JobMastr,
        JCmain,
        SeJobPnt;
{$R *.DFM}
//var wReportName : String ;
procedure TfmSelecJob.dgrJob_fileDblClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfmJobMastr,fmJobMastr);
    fmJobMastr.ShowModal;
  finally
    fmJobMastr.Release;
  end;
end;

procedure TfmSelecJob.CallReport(wReportName : String );
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

procedure TfmSelecJob.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  TestPrg.TestProgram('JC', wCompanyID, wUserID, wActiveSecurity);
    edJobNo1.MaxLength := gJobNo1Len;
  if gUseJobNo2 = 'Y' then
    edJobNo2.MaxLength := gJobNo2Len
  else
  begin
    laJobNo2.Visible := False;
    edJobNo2.Visible := False;
    laSubJobNo.Left := laSubJobNo.Left
                       - laJobNo2.Width
                       - edJobNo2.Width;
    edSubJobNo.Left := edSubJobNo.Left
                     - laJobNo2.Width
                     - edJobNo2.Width;
    laFWONo.Left := laFWONo.Left - laJobNo2.Width - edJobNo2.Width;
    edFWONo.Left := edFWONo.Left - laJobNo2.Width - edJobNo2.Width;
  end;
end;

procedure TfmSelecJob.sbPSClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmSelecJob.btnOKClick(Sender: TObject);
var
  JobNo1,
  JobNo2,
  SubNo,
  FWONo : String;
  i :Integer;

begin
  with dmJCdata  do
  begin
    fwono := '';
    subno := '';
    jobno1 := '';
    jobno2 := '';
    if Trim(edJobNo1.Text) <> '' then
    begin
      JobNo1 := trim(edJobNo1.Text);
      for i := 1 to edJobNo1.MaxLength - length(trim(edJobNo1.Text)) do
        JobNo1 := JobNo1 + '%';
    end;

    if gUseJobNo2 = 'Y' then
      if Trim(edJobNo2.Text) <>'' then
      begin
        jobno2 :=trim(edJobNo2.Text);
        for i := 1 to edJobNo2.MaxLength - Length(Trim(edJobNo2.Text)) do
          JobNo2 := JobNo2 + '%';
      end;

    if Trim(edSubJobNo.Text) <> '' then
    begin
      SubNo := trim(edSubJobNo.Text);
      for i := 1 to edSubJobNo.MaxLength - length(trim(edSubJobNo.Text)) do
        SubNo := SubNo + '%';
    end;

    if Trim(edFWONo.Text) <> '' then
    begin
      FWONo := trim(edFWONo.Text);
      for i := 1 to edFWONo.MaxLength - length(Trim(edFWONo.Text)) do
         FWONo := FWONo + '%';
    end;

    with quSelectJob do
    Begin
      if Active then
        Close;
      ParamByName('iJobno1').AsString := JobNo1;
      ParamByName('iJobno2').AsString := JobNo2;
      ParamByName('iSUBNO').AsString := SubNo;
      ParamByName('iFWONO').AsString := FWONo;
      Open;
    end;
  end;
end;

procedure TfmSelecJob.edJobNo1KeyPress(Sender: TObject; var Key: Char);
begin
{  if ((Length(edJobNo1.Text)
    = dmJCdata.quJCcontrolJOB_NO_1_LEN.AsInteger)
     and edJobNo2.Visible = True) then
    edJobNo2.SetFocus;}
end;

procedure TfmSelecJob.edJobNo2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  ((key = VK_BACK) and (trim(edJobNo2.Text) ='')) then
    edJobNo1.SetFocus;
end;

procedure TfmSelecJob.edJobNo1Change(Sender: TObject);
begin
  if ((Length(edJobNo1.Text)
    = dmJCdata.quJCcontrolJOB_NO_1_LEN.AsInteger)
     and edJobNo2.Visible = True) then
    edJobNo2.SetFocus;
end;

procedure TfmSelecJob.mmRptJobClick(Sender: TObject);
begin
  Application.CreateForm(TfmSeJobPnt,fmSeJobPnt);
  try
    fmSeJobPnt.ShowModal;
  finally
    fmSeJobPnt.Release;
  end;
end;

procedure TfmSelecJob.mRptFwoClick(Sender: TObject);
begin
  CallReport('ProjectFWO');
end;

procedure TfmSelecJob.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSelecJob.mmJCStatusClick(Sender: TObject);
begin
  CallReport('JCStatus');
end;

procedure TfmSelecJob.mmSubContractClick(Sender: TObject);
begin
  CallReport('Contract');
end;

end.
