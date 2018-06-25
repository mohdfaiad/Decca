unit SubJob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, Wwdotdot, Wwdbcomb, StdCtrls, Mask, wwdbedit,
  wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, DBCtrls, Menus;

type
  TfmJCSubJob = class(TForm)
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
    printSetup: TPrinterSetupDialog;
    pcJobMaster: TPageControl;
    tsSub_job_file: TTabSheet;
    tsJob_cost_cat: TTabSheet;
    gbJobCost: TGroupBox;
    dgrJOB_COST_CAT: TwwDBGrid;
    tsSUBCONTRACT: TTabSheet;
    gbSubCon: TGroupBox;
    dgrContract: TwwDBGrid;
    paSubJob: TPanel;
    gbUse_title: TGroupBox;
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
    tsClaim: TTabSheet;
    gbJobClaim: TGroupBox;
    dgrJob_claim: TwwDBGrid;
    sbCost: TStatusBar;
    sbContract: TStatusBar;
    sbClaim: TStatusBar;
    dteUserDefFld01: TDBText;
    dteUserDefFld02: TDBText;
    dteUserDefFld03: TDBText;
    dteUserDefFld04: TDBText;
    dteUserDefFld05: TDBText;
    dteUserDefFld06: TDBText;
    dteUserDefFld07: TDBText;
    dteUserDefFld08: TDBText;
    dteUserDefFld09: TDBText;
    dteUserDefFld10: TDBText;
    paCost: TPanel;
    laJobSUB: TLabel;
    laDescrSUB: TLabel;
    dedJobSUB: TwwDBEdit;
    dedDescrSUB: TwwDBEdit;
    paContract: TPanel;
    laJobContract: TLabel;
    laDescrContract: TLabel;
    dedJobContract: TwwDBEdit;
    dedDescrContract: TwwDBEdit;
    paClaim: TPanel;
    laClaimJOB: TLabel;
    laClaimDescr: TLabel;
    dedClaimJOB: TwwDBEdit;
    dedDescrClaim: TwwDBEdit;
    laSubDescrCost: TLabel;
    laSubCost: TLabel;
    dedSubDescrCost: TwwDBEdit;
    dedSUBCost: TwwDBEdit;
    laSubDescrContract: TLabel;
    laSubContract: TLabel;
    dedSubDescrContract: TwwDBEdit;
    dedSubContract: TwwDBEdit;
    laSubDescrClaim: TLabel;
    laSubClaim: TLabel;
    dedSubDescrClaim: TwwDBEdit;
    dedSubClaim: TwwDBEdit;
    mmSubJob: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    dcbContStatus: TwwDBComboBox;
    paBase: TPanel;
    laSUBjobNo1: TLabel;
    laSUBJobNo2: TLabel;
    laSubDescription: TLabel;
    laContract_amt: TLabel;
    laCompleted_pct: TLabel;
    laSubJobNo: TLabel;
    laQuot_No: TLabel;
    Label2: TLabel;
    dedSUBJobNo1: TwwDBEdit;
    dedSUBJobNo2: TwwDBEdit;
    dedSUBdescription: TwwDBEdit;
    dedCompleted_pct: TwwDBEdit;
    dedSubJobNo: TwwDBEdit;
    dedContract_amt: TwwDBEdit;
    dedJobDescri: TwwDBEdit;
    dtSub_job_end_date: TwwDBDateTimePicker;
    dedQuot_No: TwwDBEdit;
    paUser: TPanel;
    gbDate: TGroupBox;
    laLst_bill_date: TLabel;
    laLst_pmt_date: TLabel;
    laDate: TLabel;
    laBillAMT: TLabel;
    laJobRetainAP: TLabel;
    laJobRetainAR: TLabel;
    dtLst_bill_date: TwwDBDateTimePicker;
    dtLst_pmt_date: TwwDBDateTimePicker;
    dedJob_bill_amt: TwwDBEdit;
    dedJob_amt_paid: TwwDBEdit;
    dedJobRetainAP: TwwDBEdit;
    dedJobRetainAR: TwwDBEdit;
    gbAMT: TGroupBox;
    laJob_reg_amt: TLabel;
    laJob_prem_amt: TLabel;
    Label1: TLabel;
    dedJob_prem_amt: TwwDBEdit;
    dedJob_reg_amt: TwwDBEdit;
    dedTotalAmt: TwwDBEdit;
    Panel1: TPanel;
    gbUser: TGroupBox;
    laSUBcreated_by: TLabel;
    laSUBcreate_date: TLabel;
    dedSUBcreated_by: TwwDBEdit;
    dtSUBcreat_date: TwwDBDateTimePicker;
    drgStatus: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure dgrJob_FWODblClick(Sender: TObject);
    procedure dgrJOB_COST_CATDblClick(Sender: TObject);
    procedure dgrContractDblClick(Sender: TObject);
    procedure pcJobMasterChange(Sender: TObject);
    procedure dgrJob_claimDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJCSubJob: TfmJCSubJob;

implementation
  uses JCdatadm,JCmain, JobFWO, JCCstCat, contract, JobClaim;
{$R *.DFM}

procedure TfmJCSubJob.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'dnaSub_job.nbDelete';      //  刪除工程
  Funcs[3] := 'dnaSub_job.nbInsert';      //  添加工程
  Funcs[4] := 'dgrJOB_COST_CAT.OnDblClick';
  Funcs[5] := 'dgrContract.OnDblClick';
  Funcs[6] := 'dgrJob_claim.OnDblClick';
  //=====================
  fmJCmain.TestProgram( Funcs );
  with dmJCdata do
  begin
    if quJCcontrolUSE_JOB_NO_2.AsString = 'Y' then
    begin
      dedSUBJobNo2.Visible := true;
      laSUBJobNo2.Visible := true;
    end else
    begin
      dedSUBjobNo2.Visible := false;
      laSUBJobNo2.Visible := False;
    end;

//Field length
    dedSubJobNo.MaxLength := quJCcontrolSUB_JOB_NO_LEN.AsInteger;

//Use retainage payable
    if quJCcontrolUSE_RETAIN_AP.AsString = 'Y' then
    begin
      dedJobRetainAP.Visible := true ;
      laJobRetainAP.Visible := true;
    end   else
    begin
      dedJobRetainAP.Visible := false;
      laJobRetainAP.Visible := False;
    end;

//Use retainage receivable
    if quJCcontrolUSE_RETAIN_AR.AsString = 'Y' then
    begin
      dedJobRetainAR.Visible := true;
      laJobRetainAR.Visible := true;
    end  else
    begin
      dedJobRetainAR.Visible := False;
      laJobRetainAR.Visible := False;
    end;

    case  quJCcontrolUSE_FIELDS.AsInteger of
      1 : begin
            Height := 403;
            dteUserDefFld02.Visible := False;
            dedUser_def_fld02.Enabled := False;
            dedUser_def_fld02.Visible := False;
            dedUser_def_fld03.Enabled := False;
            dedUser_def_fld04.Enabled := False;
            dedUser_def_fld05.Enabled := False;
            dedUser_def_fld06.Enabled := False;
            dedUser_def_fld07.Enabled := False;
            dedUser_def_fld08.Enabled := False;
            dedUser_def_fld09.Enabled := False;
            dedUser_def_fld10.Enabled := False;
          end;
      2 : begin
            Height := 403;
            dedUser_def_fld03.Enabled := False;
            dedUser_def_fld04.Enabled := False;
            dedUser_def_fld05.Enabled := False;
            dedUser_def_fld06.Enabled := False;
            dedUser_def_fld07.Enabled := False;
            dedUser_def_fld08.Enabled := False;
            dedUser_def_fld09.Enabled := False;
            dedUser_def_fld10.Enabled := False;
          end;
      3 : begin
            Height := 438;
            dteUserDefFld04.Visible := False;
            dedUser_def_fld04.Enabled := False;
            dedUser_def_fld04.Visible := False;
            dedUser_def_fld05.Enabled := False;
            dedUser_def_fld06.Enabled := False;
            dedUser_def_fld07.Enabled := False;
            dedUser_def_fld08.Enabled := False;
            dedUser_def_fld09.Enabled := False;
            dedUser_def_fld10.Enabled := False;

          end;
      4 : begin
            Height := 438;
            dedUser_def_fld05.Enabled := False;
            dedUser_def_fld06.Enabled := False;
            dedUser_def_fld07.Enabled := False;
            dedUser_def_fld08.Enabled := False;
            dedUser_def_fld09.Enabled := False;
            dedUser_def_fld10.Enabled := False;
          end;
      5 : begin
            Height := 473;
            dteUserDefFld06.Visible := False;
            dedUser_def_fld06.Visible := False;
            dedUser_def_fld06.Enabled := False;
            dedUser_def_fld07.Enabled := False;
            dedUser_def_fld08.Enabled := False;
            dedUser_def_fld09.Enabled := False;
            dedUser_def_fld10.Enabled := False;
          end;
      6 : begin
            Height := 473;
            dedUser_def_fld07.Enabled := False;
            dedUser_def_fld08.Enabled := False;
            dedUser_def_fld09.Enabled := False;
            dedUser_def_fld10.Enabled := False;
          end;
      7 : begin
            Height := 507;
            dteUserDefFld08.Visible := False;
            dedUser_def_fld08.Visible := False;
            dedUser_def_fld08.Enabled := False;
            dedUser_def_fld09.Enabled := False;
            dedUser_def_fld10.Enabled := False;
          end;
      8 : begin
            Height := 507;
            dedUser_def_fld09.Enabled := False;
            dedUser_def_fld10.Enabled := False;
          end;
      9 : begin
            Height := 540;
            dteUserDefFld10.Visible := False;
            dedUser_def_fld10.Visible := False;
            dedUser_def_fld10.Enabled := False;
          end;
      10 : Height := 540;
    else
      begin
        Height := 358;
        dedUser_def_fld01.Enabled := False;
        dedUser_def_fld02.Enabled := False;
        dedUser_def_fld03.Enabled := False;
        dedUser_def_fld04.Enabled := False;
        dedUser_def_fld05.Enabled := False;
        dedUser_def_fld06.Enabled := False;
        dedUser_def_fld07.Enabled := False;
        dedUser_def_fld08.Enabled := False;
        dedUser_def_fld09.Enabled := False;
        dedUser_def_fld10.Enabled := False;
      end;
    end;

//OPEN DATABASE
    with quSubContract do
      if Not Active then
        Open;
    with quJob_Claim do
      if Not Active then
        Open;
    with quJOB_COST_CAT do
      if Not Active then
        Open ;
  end;
end;

procedure TfmJCSubJob.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJCSubJob.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmJCSubJob.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('打印屏幕么?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmJCSubJob.dgrJob_FWODblClick(Sender: TObject);
begin
  Application.CreateForm(TfmJobFWO, fmJobFWO);
  try
    fmJobFWO.ShowModal;
  finally
    fmJobFWO.Release;
  end;
end;

procedure TfmJCSubJob.dgrJOB_COST_CATDblClick(Sender: TObject);
begin
  if not dmJCdata.quSub_job.IsEmpty then
  begin
    try
      Application.CreateForm(TfmJCCstCat,fmJCCstCat);
      fmJCCstCat.ShowModal;
    finally
      fmJCCstCat.Release;
    end;
  end else
    ShowMessage('無所需要的數据');
end;

procedure TfmJCSubJob.dgrContractDblClick(Sender: TObject);
begin
  if not dmJCdata.quSub_job.IsEmpty then
  begin
    try
      Application.CreateForm(TfmContract,fmContract);
      fmContract.ShowModal;
    finally
      fmContract.Release;
    end;
  end else
    ShowMessage('無所需要的數据');
end;

procedure TfmJCSubJob.pcJobMasterChange(Sender: TObject);
begin
  if pcJobMaster.ActivePage <> tsSub_job_file then
    dnaSub_job.Enabled := False
  else
    dnaSub_job.Enabled := True;
end;

procedure TfmJCSubJob.dgrJob_claimDblClick(Sender: TObject);
begin
  if not dmJCdata.quSub_job.IsEmpty then
  begin
    try
      Application.CreateForm(TfmJobClaim, fmJobClaim);
      fmJobClaim.ShowModal;
    finally
      fmJobClaim.Release;
    end;
  end else
    ShowMessage('無所需要的數据');
end;

procedure TfmJCSubJob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCdata do
  begin
    with quSubContract do
      if Active then
        Close;
    with quJob_Claim do
      if Active then
        Close;
    with quJOB_COST_CAT do
      if Active then
        Close ;
  end;
end;

end.
