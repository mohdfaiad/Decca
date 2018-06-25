unit Sub_Job;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, Wwdotdot, Wwdbcomb, StdCtrls, Mask, wwdbedit,
  wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls;

type
  TfmSubJob = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaSub_job: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    paSub_job: TPanel;
    gbUse_title: TGroupBox;
    laUser_def_fld05: TLabel;
    laUser_def_fld02: TLabel;
    laUser_def_fld04: TLabel;
    laUser_def_fld01: TLabel;
    laUser_def_fld03: TLabel;
    laUser_def_fld10: TLabel;
    laUser_def_fld07: TLabel;
    laUser_def_fld09: TLabel;
    laUser_def_fld06: TLabel;
    laUser_def_fld08: TLabel;
    dedUser_def_fld01: TwwDBEdit;
    dedUser_def_fld02: TwwDBEdit;
    dedUser_def_fld03: TwwDBEdit;
    dedUser_def_fld04: TwwDBEdit;
    dedUser_def_fld05: TwwDBEdit;
    dedUser_def_fld06: TwwDBEdit;
    dedUser_def_fld07: TwwDBEdit;
    dedUser_def_fld08: TwwDBEdit;
    dedUser_def_fld09: TwwDBEdit;
    dedUser_def_fld10: TwwDBEdit;
    laSUBjob_no_1: TLabel;
    laSUBjob_no_2: TLabel;
    laSubDescription: TLabel;
    laSub_job_status: TLabel;
    laContract_amt: TLabel;
    laJob_reg_qty: TLabel;
    laJob_amt_paid: TLabel;
    laLst_bill_date: TLabel;
    laSUB_JOB_END_DATE: TLabel;
    laJob_bill_amt: TLabel;
    laSUBcreated_by: TLabel;
    laJob_reg_amt: TLabel;
    laCompleted_pct: TLabel;
    laJob_retain_ap: TLabel;
    laJob_retain_ar: TLabel;
    laSub_job_no: TLabel;
    laSUBcreate_date: TLabel;
    laJob_prem_qty: TLabel;
    laJob_prem_amt: TLabel;
    laLst_pmt_date: TLabel;
    dedSUBjob_no_1: TwwDBEdit;
    dedSUBjob_no_2: TwwDBEdit;
    dedSUBdescription: TwwDBEdit;
    dcbSub_job_status: TwwDBComboBox;
    dtSub_job_end_date: TwwDBDateTimePicker;
    dedJob_bill_amt: TwwDBEdit;
    dedSUBcreated_by: TwwDBEdit;
    dedJob_retain_ap: TwwDBEdit;
    dedJob_retain_ar: TwwDBEdit;
    dtLst_bill_date: TwwDBDateTimePicker;
    dedJob_reg_amt: TwwDBEdit;
    dedCompleted_pct: TwwDBEdit;
    dedJob_reg_qty: TwwDBEdit;
    dedJob_amt_paid: TwwDBEdit;
    dedSub_job_no: TwwDBEdit;
    dedContract_amt: TwwDBEdit;
    dtSUBcreat_date: TwwDBDateTimePicker;
    dedJob_prem_amt: TwwDBEdit;
    dedJob_prem_qty: TwwDBEdit;
    dtLst_pmt_date: TwwDBDateTimePicker;
    printSetup: TPrinterSetupDialog;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSubJob: TfmSubJob;

implementation
  uses JCdatadm;
{$R *.DFM}

procedure TfmSubJob.FormCreate(Sender: TObject);
begin
  Caption := Application.Title + ' = ' + Caption;
  with dmJCdata do
  begin
    if quJCcontrolUSE_JOB_NO_2.AsString = 'Y' then
    begin
      dedSUBjob_no_2.Enabled := true;
      laSUBjob_no_2.Enabled := true;
    end else
    begin
      dedSUBjob_no_2.Enabled := false;
      laSUBjob_no_2.Enabled := False;
    end;

//Field length
    dedSub_job_no.MaxLength := quJCcontrolSUB_JOB_NO_LEN.AsInteger;

//Use retainage payable
    if quJCcontrolUSE_RETAIN_AP.AsString = 'Y' then
    begin
      dedJob_retain_ap.Enabled := true ;
      laJob_retain_ap.Enabled := true;
    end   else
    begin
      dedJob_retain_ap.Enabled := false;
      laJob_retain_ap.Enabled := False;
    end;

//Use retainage receivable
    if quJCcontrolUSE_RETAIN_AR.AsString = 'Y' then
    begin
      dedJob_retain_ar.Enabled := true;
      laJob_retain_ar.Enabled := true;
    end  else
    begin
      dedJob_retain_ar.Enabled := False;
      dedJob_retain_ar.Enabled := False;
    end;

//Title set
    laUser_def_fld01.Caption :=quJCcontrolUSER_DEF_TITLE01.AsString;
    laUser_def_fld02.Caption :=quJCcontrolUSER_DEF_TITLE02.AsString;
    laUser_def_fld03.Caption :=quJCcontrolUSER_DEF_TITLE03.AsString;
    laUser_def_fld04.Caption :=quJCcontrolUSER_DEF_TITLE04.AsString;
    laUser_def_fld05.Caption :=quJCcontrolUSER_DEF_TITLE05.AsString;
    laUser_def_fld06.Caption :=quJCcontrolUSER_DEF_TITLE06.AsString;
    laUser_def_fld07.Caption :=quJCcontrolUSER_DEF_TITLE07.AsString;
    laUser_def_fld08.Caption :=quJCcontrolUSER_DEF_TITLE08.AsString;
    laUser_def_fld09.Caption :=quJCcontrolUSER_DEF_TITLE09.AsString;
    laUser_def_fld10.Caption :=quJCcontrolUSER_DEF_TITLE10.AsString;
  end;
end;

procedure TfmSubJob.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSubJob.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmSubJob.sbPrintscreenClick(Sender: TObject);
begin
  print;
end;

end.
