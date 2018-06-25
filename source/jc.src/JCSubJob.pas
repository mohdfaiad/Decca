unit JCSubJob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, Wwdotdot, Wwdbcomb, StdCtrls, Mask, wwdbedit,
  wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, DBCtrls, Menus,db, TestPrg, DBTables, Wwquery;

type
  TfmJCSubJob = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaSub_job: TwwDBNavigator;
    dnaSubNoFirst: TwwNavButton;
    dnaSubNoPrior: TwwNavButton;
    dnaSubNoNext: TwwNavButton;
    dnaSubNoLast: TwwNavButton;
    dnaSubNoInsert: TwwNavButton;
    dnaSubNoPost: TwwNavButton;
    dnaSubNoCancel: TwwNavButton;
    dnaSubNoDelete: TwwNavButton;
    printSetup: TPrinterSetupDialog;
    pcSubJob: TPageControl;
    tsSubJobFile: TTabSheet;
    tsJobCostCat: TTabSheet;
    gbJobCost: TGroupBox;
    tsSubContract: TTabSheet;
    gbSubCon: TGroupBox;
    dgrSubContract: TwwDBGrid;
    tsJobClaim: TTabSheet;
    gbJobClaim: TGroupBox;
    dgrJobClaim: TwwDBGrid;
    sbCost: TStatusBar;
    sbContract: TStatusBar;
    sbClaim: TStatusBar;
    paCost: TPanel;
    laJobSUB: TLabel;
    dedJobSUB: TwwDBEdit;
    dedDescrSUB: TwwDBEdit;
    paContract: TPanel;
    laJobContract: TLabel;
    dedJobContract: TwwDBEdit;
    dedDescrContract: TwwDBEdit;
    paClaim: TPanel;
    laClaimJOB: TLabel;
    dedClaimJOB: TwwDBEdit;
    dedDescrClaim: TwwDBEdit;
    laSubCost: TLabel;
    dedSubDescrCost: TwwDBEdit;
    dedSUBCost: TwwDBEdit;
    laSubContract: TLabel;
    dedSubDescrContract: TwwDBEdit;
    dedSubContract: TwwDBEdit;
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
    dbcbSubConStatus: TwwDBComboBox;
    TestPrg: TTestPrg;
    tsUserDefFields: TTabSheet;
    gbUse_title: TGroupBox;
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
    quJobCostCatBal: TwwQuery;
    quJobCostCatBalLINECOUNT: TIntegerField;
    quJobCostCatBalBUDGETAMT: TBCDField;
    quJobCostCatBalJOBREGAMT: TBCDField;
    quJobCostCatBalJOBPREMAMT: TBCDField;
    quJobCostCatBalDRAFTBUDGETAMT: TBCDField;
    dgrJobCostCat: TwwDBGrid;
    gbComment: TGroupBox;
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    gbPayment: TGroupBox;
    laLst_bill_date: TLabel;
    laLst_pmt_date: TLabel;
    laBillAMT: TLabel;
    laDate: TLabel;
    Label3: TLabel;
    dtLst_bill_date: TwwDBDateTimePicker;
    dtLst_pmt_date: TwwDBDateTimePicker;
    dedJob_bill_amt: TwwDBEdit;
    dedJob_amt_paid: TwwDBEdit;
    dedJobRetainAP: TwwDBEdit;
    dedJobRetainAR: TwwDBEdit;
    laContract_amt: TLabel;
    laCompleted_pct: TLabel;
    laSubJobNo: TLabel;
    laQuot_No: TLabel;
    Label2: TLabel;
    laSiteLocation: TLabel;
    laFinalContractAmt: TLabel;
    laJobNo: TLabel;
    dedSUBJobNo1: TwwDBEdit;
    dedSUBdescription: TwwDBEdit;
    dedCompleted_pct: TwwDBEdit;
    dedSubJobNo: TwwDBEdit;
    dedContract_amt: TwwDBEdit;
    dedJobDescri: TwwDBEdit;
    dtSub_job_end_date: TwwDBDateTimePicker;
    dedSiteLocation: TwwDBEdit;
    dbrgType: TDBRadioGroup;
    dedFinalContAmt: TwwDBEdit;
    drgStatus: TDBRadioGroup;
    gbUser: TGroupBox;
    laSUBcreated_by: TLabel;
    laSUBcreate_date: TLabel;
    dedSUBcreated_by: TwwDBEdit;
    dtSUBcreat_date: TwwDBDateTimePicker;
    dedQuot_No: TwwDBEdit;
    dbcbClaimStatus: TwwDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure dgrJob_FWODblClick(Sender: TObject);
    procedure dgrSubContractDblClick(Sender: TObject);
    procedure pcSubJobChange(Sender: TObject);
    procedure dgrJobClaimDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dgrJobCostCatUpdateFooter(Sender: TObject);
    procedure dgrJobCostCatDblClick(Sender: TObject);
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
{  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'dnaSub_job.nbDelete';      //  刪除工程
  Funcs[3] := 'dnaSub_job.nbInsert';      //  添加工程
  Funcs[4] := 'dgrJOB_COST_CAT.OnDblClick';
  Funcs[5] := 'dgrContract.OnDblClick';
  Funcs[6] := 'dgrJob_claim.OnDblClick';
  //=====================
//  fmJCmain.TestProgram( Funcs );}
  TestPrg.TestProgram('JC', wCompanyID, wUserID, wActiveSecurity);
  if not gbJobCost.Enabled then
  begin
    gbJobCost.Enabled := true;
    with dmJCData do
      with quJobCostCat do
      begin
        if Active then Close;
        quJobCostCatDRAFT_BUDGET_AMT.Visible := false;
        quJobCostCatBUDGET_AMT.Visible := false;
        quJobCostCatJOB_REG_AMT.Visible := false;
        quJobCostCatJOB_PREM_AMT.Visible := false;
        quJobCostCatcalAmtTotal.Visible := false;
        quJobCostCatcalAmtVarPct.Visible := false;
        Open;
      end;
  end;
  if not laJobNo.Enabled then
  begin
    laJobNo.Enabled := true;
    with dmJCData do
      with quSub_job do
      begin
        RequestLive := false;
        CachedUpdates := false;
      end;
  end;
  with quJobCostCatBal do
  begin
    if Active then
      Close;
    if not Prepared then
      Prepare;
  end;
  pcSubJob.ActivePage := tsSubJobFile;
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

procedure TfmJCSubJob.dgrSubContractDblClick(Sender: TObject);
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

procedure TfmJCSubJob.pcSubJobChange(Sender: TObject);
begin
  if pcSubJob.ActivePage <> tsSubJobFile then
  begin
    if ((dmJCdata.quSub_job.State = dsedit)
      or (dmJCdata.quSub_job.State = dsinsert)) then
      dmJCdata.quSub_job.Cancel;
    dnaSubNoInsert.Enabled := False;
    dnaSubNoDelete.Enabled := False;
  end
  else
  begin
    dnaSubNoInsert.Enabled := True;
    dnaSubNoDelete.Enabled := True;
  end;
end;

procedure TfmJCSubJob.dgrJobClaimDblClick(Sender: TObject);
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
    with quJobCostCat do
      if Active then
        Close;
    with quSubContract do
      if Active then
        Close;
  end;
  with quJobCostCatBal do
  begin
    if Active then
      Close;
    if Prepared then
      Unprepare;
  end;
end;

procedure TfmJCSubJob.FormShow(Sender: TObject);
begin
  dedSubJobNo.MaxLength := gSubJobLen;
  if gUseRetainAP = 'Y' then
    dedJobRetainAP.Enabled := true
  else
    dedJobRetainAP.Enabled := false;

  if gUseRetainAR = 'Y' then
    dedJobRetainAR.Enabled := true
  else
    dedJobRetainAR.Enabled := False;

  if gUseFields < 10 then
  begin
    dedUser_Def_fld10.Visible := False;
    dteUserDefFld10.Visible := False;
  end;
  if gUseFields < 9 then
  begin
    dedUser_Def_fld09.Visible := False;
    dteUserDefFld09.Visible := False;
  end;
  if gUseFields < 8 then
  begin
    dedUser_Def_fld08.Visible := False;
    dteUserDefFld08.Visible := False;
  end;
  if gUseFields < 7 then
  begin
    dedUser_Def_fld07.Visible := False;
    dteUserDefFld07.Visible := False;
  end;
  if gUseFields < 6 then
  begin
    dedUser_Def_fld06.Visible := False;
    dteUserDefFld06.Visible := False;
  end;
  if gUseFields < 5 then
  begin
    dedUser_Def_fld05.Visible := False;
    dteUserDefFld05.Visible := False;
  end;
  if gUseFields < 4 then
  begin
    dedUser_Def_fld04.Visible := False;
    dteUserDefFld04.Visible := False;
  end;
  if gUseFields < 3 then
  begin
    dedUser_Def_fld03.Visible := False;
    dteUserDefFld03.Visible := False;
  end;
  if gUseFields < 2 then
  begin
    dedUser_Def_fld02.Visible := False;
    dteUserDefFld02.Visible := False;
  end;
  if gUseFields < 1 then
  begin
    dedUser_Def_fld01.Visible := False;
    dteUserDefFld01.Visible := False;
    tsUserDefFields.TabVisible := False;
  end;

{
  case gUseFields of
    1 : begin
          Height := 451;
        end;
    2 : begin
          Height := 451;
        end;
      3 : begin
            Height := 486;
          end;
      4 : begin
            Height := 486;
          end;
      5 : begin
            Height := 521;
          end;
      6 : begin
            Height := 521;
          end;
      7 : begin
            Height := 555;
          end;
      8 : begin
            Height := 555;
          end;
      9 : begin
            Height := 588;
          end;
      10 : Height := 588;
    else
      begin
        Height := 383;
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
}

  with dmJCdata do
  begin
    with quSubContract do
      if Not Active then
        Open;
    with quJobCostCat do
      if Not Active then
        Open;
    with quJobCostCat do
      if not Active then
        Open;
    with quSubContract do
      if not Active then
        Open;
    with quJobCostCatBal do
    begin
      if Active then
        Close;
      ParamByName('Job_No_1').Value := quSub_jobJOB_NO_1.AsString;
      ParamByName('Job_No_2').value := quSub_jobJOB_NO_2.AsString;
      ParamByName('Sub_Job_No').Value := quSub_jobSUB_JOB_NO.AsString;
      Open;
    end;
  end;
end;

procedure TfmJCSubJob.dgrJobCostCatUpdateFooter(Sender: TObject);
begin
  with quJobCostCatBal do
  begin
    dgrJobCostCat.ColumnByName('Job_Cost_Cat').FooterValue :=
      IntToStr(quJobCostCatBalLineCount.Value);
    dgrJobCostCat.ColumnByName('Draft_Budget_Amt').FooterValue :=
       FloatToStrF(quJobCostCatBalDraftBudgetAmt.AsFloat, ffCurrency, 12, 2);
    dgrJobCostCat.ColumnByName('Budget_Amt').FooterValue :=
       FloatToStrF(quJobCostCatBalBudgetAmt.AsFloat, ffCurrency, 12, 2);
    dgrJobCostCat.ColumnByName('Job_Reg_Amt').FooterValue :=
       FloatToStrF(quJobCostCatBalJobRegAmt.AsFloat, ffCurrency, 12, 2);
    dgrJobCostCat.ColumnByName('Job_Prem_Amt').FooterValue :=
       FloatToStrF(quJobCostCatBalJobPremAmt.AsFloat, ffCurrency, 12, 2);
    dgrJobCostCat.ColumnByName('calAmtTotal').FooterValue :=
       FloatToStrF((quJobCostCatBalJobRegAmt.AsFloat +
                    quJobCostCatBalJobPremAmt.AsFloat), ffCurrency, 12, 2);
  end;
end;

procedure TfmJCSubJob.dgrJobCostCatDblClick(Sender: TObject);
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

end.
