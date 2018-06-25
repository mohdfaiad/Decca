unit JobMastr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls,
  StdCtrls, DBCtrls, Wwdotdot, Wwdbcomb, Mask, wwdbedit, wwdbdatetimepicker,
  wwdblook, Grids, Wwdbigrd, Wwdbgrid, wwDialog, Wwfltdlg, wwrcdvw, Wwintl,
  TestPrg, Db, DBTables, Wwquery, Wwdatsrc;

type
  TfmJobMastr = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    dnaJobMaster: TwwDBNavigator;
    dnaJob_MasterFirst: TwwNavButton;
    dnaJob_MasterPrior: TwwNavButton;
    dnaJob_MasterNext: TwwNavButton;
    dnaJob_MasterLast: TwwNavButton;
    mmJobMaster: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    printSetup: TPrinterSetupDialog;
    StatusBar1: TStatusBar;
    sbPrintscreen: TSpeedButton;
    pcJobMaster: TPageControl;
    tsJobFile: TTabSheet;
    tsSubJobFile: TTabSheet;
    tsJobFWO: TTabSheet;
    tsSubContract: TTabSheet;
    gbSubJob: TGroupBox;
    dgrSubJob: TwwDBGrid;
    dcbSub_status: TwwDBComboBox;
    gbJobFWO: TGroupBox;
    dgrJob_FWO: TwwDBGrid;
    dcbFWOStatus: TwwDBComboBox;
    gbSubCon: TGroupBox;
    dgrSubContract: TwwDBGrid;
    paJob_master: TPanel;
    tsJobClaim: TTabSheet;
    gbJobClaim: TGroupBox;
    dgrJob_claim: TwwDBGrid;
    paJob: TPanel;
    gbJob: TGroupBox;
    laJobNo: TLabel;
    laDescription: TLabel;
    laJob_type: TLabel;
    laJobNo2: TLabel;
    dedJob_no_1: TwwDBEdit;
    dedJobNo2: TwwDBEdit;
    dedDescription: TwwDBEdit;
    dedJob_Type: TwwDBEdit;
    gbUser: TGroupBox;
    laCreated_by: TLabel;
    laCreate_date: TLabel;
    dedCreated_by: TwwDBEdit;
    dtCreate_date: TwwDBDateTimePicker;
    drgStatus: TDBRadioGroup;
    paIncharge: TPanel;
    paSUB: TPanel;
    laJobSUB: TLabel;
    dedJobSUB: TwwDBEdit;
    dedDescrSUB: TwwDBEdit;
    paFWO: TPanel;
    laJobFWO: TLabel;
    dedJobFWO: TwwDBEdit;
    dedDescrFWO: TwwDBEdit;
    paContract: TPanel;
    laJobContract: TLabel;
    dedJobContract: TwwDBEdit;
    dedDescrContract: TwwDBEdit;
    paClaim: TPanel;
    laClaimJOB: TLabel;
    dedClaimJOB: TwwDBEdit;
    dedDescrClaim: TwwDBEdit;
    dbcbSubConStatus: TwwDBComboBox;
    gbMastr: TGroupBox;
    laLst_ext_date: TLabel;
    laJob_end_date: TLabel;
    laIncharge_pension: TLabel;
    laTerritory: TLabel;
    laCustomer_no: TLabel;
    laBill_currency: TLabel;
    laCost_currency: TLabel;
    laBill_AC: TLabel;
    laBillProfitCTR1: TLabel;
    laBillProfitCTR2: TLabel;
    dtJob_end_date: TwwDBDateTimePicker;
    dedIncharge_person: TwwDBEdit;
    dtLST_EST_DATE: TwwDBDateTimePicker;
    dedTerritory: TwwDBEdit;
    dedCustomer_no: TwwDBEdit;
    dlcbBILL_CURRENCY: TwwDBLookupCombo;
    dlcbCost_currency: TwwDBLookupCombo;
    dedBillAC: TwwDBEdit;
    dedBillProfitCTR1: TwwDBEdit;
    dedBillProfitCTR2: TwwDBEdit;
    gbComment: TGroupBox;
    dmeComment: TDBMemo;
    dnaJobFile: TwwDBNavigator;
    dnaJobFileInsert: TwwNavButton;
    dnaJobFileDelete: TwwNavButton;
    dnaJobFilePost: TwwNavButton;
    dnaJobFileCancel: TwwNavButton;
    mmReport: TMenuItem;
    mmRepFwoCat: TMenuItem;
    mmRepSubAmt: TMenuItem;
    TestPrg: TTestPrg;
    quSubJobBal: TwwQuery;
    quSubJobBalLINECOUNT: TIntegerField;
    quSubJobBalJOBREGAMT: TBCDField;
    quSubJobBalJOBPREMAMT: TBCDField;
    tsJobCostSumry: TTabSheet;
    gbJobCostSumry: TGroupBox;
    quJobCostSumry: TwwQuery;
    dgrJobCostSumry: TwwDBGrid;
    dsJobCostSumry: TwwDataSource;
    quJobCostSumryJOB_COST_CAT: TStringField;
    quJobCostSumryBUDGETAMT: TBCDField;
    quJobCostSumryJOBREGAMT: TBCDField;
    quJobCostSumryJOBPREMAMT: TBCDField;
    quJobCostSumryJobCostCatDesc: TStringField;
    quJobCostBal: TwwQuery;
    quJobCostBalJOBREGAMT: TBCDField;
    quJobCostBalJOBPREMAMT: TBCDField;
    quJobCostSumrycalAmtVarPct: TFloatField;
    quJobCostSumrycalAmtTotal: TCurrencyField;
    Panel1: TPanel;
    Label1: TLabel;
    dedSumryJobNo: TwwDBEdit;
    dedSumryJobDesc: TwwDBEdit;
    dbcbClaimStatus: TwwDBComboBox;
    procedure mmExitClick(Sender: TObject);
    procedure mmPrintsetupClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dgrSubJobDblClick(Sender: TObject);
    procedure dgrSubContractDblClick(Sender: TObject);
    procedure dedJobNo2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgrJob_claimDblClick(Sender: TObject);
    procedure dedBillProfitCTR1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dedBillProfitCTR2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dedBillACKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmInsertClick(Sender: TObject);
    procedure pmCancelClick(Sender: TObject);
    procedure pmPostClick(Sender: TObject);
    procedure pmDeleteClick(Sender: TObject);
    procedure pmFirstClick(Sender: TObject);
    procedure pmPriorClick(Sender: TObject);
    procedure pmNextClick(Sender: TObject);
    procedure pmLastClick(Sender: TObject);
    procedure dedJob_no_1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gbJobDblClick(Sender: TObject);
    procedure pcJobMasterChange(Sender: TObject);
    procedure mmRepFwoCatClick(Sender: TObject);
    procedure mmRepSubAmtClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgrJob_FWODblClick(Sender: TObject);
    procedure dgrSubJobUpdateFooter(Sender: TObject);
    procedure dgrJobCostSumryUpdateFooter(Sender: TObject);
    procedure quJobCostSumryCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJobMastr: TfmJobMastr;

implementation
  uses jcdatadm,
       JCmain,
       JCSubJob,
       JobFWO,
       JCCstCat,
       contract,
       JobClaim,
       SelecJob,
       JobDetai,
       PtFwoCat,
       PtSubCat;
{$R *.DFM}

procedure TfmJobMastr.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJobMastr.mmPrintsetupClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmJobMastr.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('打印屏幕么?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmJobMastr.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
{  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'dgrSub_job.OnDblClick';
  Funcs[3] := 'dgrJob_FWO.OnDblClick';
  Funcs[4] := 'dgrCostView.OnDblClick';
  Funcs[5] := 'dgrContract.OnDblClick';//dgrContractDblClick
  Funcs[6] := 'dgrJob_claim.OnDblClick';
  //=====================
  fmJCmain.TestProgram( Funcs );}
  TestPrg.TestProgram('JC', wCompanyID, wUserID, wActiveSecurity);
  if not gbSubJob.Enabled then
  begin
    gbSubJob.Enabled := true;
    with dmJCData do
      with quSub_job do
      begin
        quSub_jobJOB_REG_AMT.Visible := False;
        quSub_jobJOB_PREM_AMT.Visible := false;
      end;
  end;
  if not laJobNo.Enabled then
  begin
    laJobNo.Enabled := true;
    with dmJCData do
      with quJob_file do
      begin
        RequestLive := false;
        CachedUpdates := false;
      end;
  end;
  with quSubJobBal do
  begin
    if Active then
      Close;
    if not Prepared then
      Prepare;
  end;
  with quJobCostSumry do
  begin
    if Active then
      Close;
    if not Prepared then
      Prepare;
  end;
  with quJobCostBal do
  begin
    if Active then
      Close;
    if not Prepared then
      Prepare;
  end;
  pcJobMaster.ActivePage := tsJobFile;
end;

procedure TfmJobMastr.dgrSubJobDblClick(Sender: TObject);
begin
  if not dmJCdata.quSelectJob.IsEmpty then
  begin
    try
      Application.CreateForm(TfmJCSubJob,fmJCSubJob);
      fmJCSubJob.ShowModal;
    finally
      fmJCSubJob.Release;
    end;
  end else
    ShowMessage('無所需要的數据');
end;

procedure TfmJobMastr.dgrSubContractDblClick(Sender: TObject);
begin
  if not dmJCdata.quSelectJob.IsEmpty then
  begin
    with dmJCdata do
    try
      Application.CreateForm(TfmContract,fmContract);
      fmContract.ShowModal;
    finally
      fmContract.Release;
    end;
  end else
    ShowMessage('無所需要的數据');
end;

procedure TfmJobMastr.dedJobNo2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  ((key = VK_BACK) and (dedJobNo2.Text ='')) then
    dedJob_no_1.SetFocus;
end;

procedure TfmJobMastr.dgrJob_claimDblClick(Sender: TObject);
begin
  if not dmJCdata.quSelectJob.IsEmpty then
  begin
    with dmJCdata do
    try
      Application.CreateForm(TfmJobClaim, fmJobClaim);
      fmJobClaim.ShowModal;
    finally
      fmJobClaim.Release;
    end;
  end
  else
    ShowMessage('無所需要的數据');
end;

procedure TfmJobMastr.dedBillProfitCTR1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if  ((KEY = VK_BACK) and (Length(trim(dedBillProfitCTR1.Text)) = 0 )) then
    dedBillAC.SetFocus;
  if Length(Trim(dedBillProfitCTR1.text)) = 4 then
    dedBillProfitCTR2.SetFocus;
end;

procedure TfmJobMastr.dedBillProfitCTR2KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if  ((KEY = VK_BACK) and (Length(trim(dedBillProfitCTR2.Text)) = 0 )) then
    dedBillProfitCTR1.SetFocus;
end;

procedure TfmJobMastr.dedBillACKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Length(trim(dedBillAC.Text)) = 8 then
    dedBillProfitCTR1.SetFocus ;
end;

procedure TfmJobMastr.pmInsertClick(Sender: TObject);
begin
  dmJCdata.quJob_file.Insert;
end;

procedure TfmJobMastr.pmCancelClick(Sender: TObject);
begin
  dmJCdata.quJob_file.Cancel;
end;

procedure TfmJobMastr.pmPostClick(Sender: TObject);
var job_no_1,
    job_no_2: String;
begin
  with dmJCdata do
  begin
    job_no_1 := quJob_fileJOB_NO_1.AsString;
    job_no_2 := quSub_jobJOB_NO_2.AsString;
    quJob_file.Post;
  end;
end;

procedure TfmJobMastr.pmDeleteClick(Sender: TObject);
begin
  dmJCdata.quJob_file.Delete;
end;

procedure TfmJobMastr.pmFirstClick(Sender: TObject);
begin
  dmJCdata.quJob_file.First;
end;

procedure TfmJobMastr.pmPriorClick(Sender: TObject);
begin
  dmJCdata.quJob_file.Prior;
end;

procedure TfmJobMastr.pmNextClick(Sender: TObject);
begin
  dmJCdata.quJob_file.Next;
end;

procedure TfmJobMastr.pmLastClick(Sender: TObject);
begin
  dmJCdata.quJob_file.Last;
end;

procedure TfmJobMastr.dedJob_no_1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Length(dedJob_no_1.Text)
    = dmJCdata.quJCcontrolJOB_NO_1_LEN.AsInteger)
     and dedJobNo2.Visible = True) then
    dedJobNo2.SetFocus;
end;

procedure TfmJobMastr.gbJobDblClick(Sender: TObject);
begin
  Application.CreateForm(TfmJobDetai,fmJobDetai);
  try
    fmJobDetai.ShowModal;
  finally
    fmJobDetai.Release;
  end;
end;

procedure TfmJobMastr.pcJobMasterChange(Sender: TObject);
begin
  if pcJobMaster.ActivePage = tsJobFile then
  begin
    dnaJobFileInsert.Enabled := True;
    dnaJobFileDelete.Enabled := True;
  end
  else
  begin
    if ((dmJCdata.quJob_file.State = dsedit) or
       (dmJCdata.quJob_file.State = dsinsert)) then
      dmJCdata.quJob_file.Cancel;
    dnaJobFileInsert.Enabled := False;
    dnaJobFileDelete.Enabled := False;
  end;
  if pcJobMaster.ActivePage = tsJobCostSumry then
  begin
    with quJobCostBal do
      if not Active then
        Open;
    with quJobCostSumry do
      if not Active then
        Open;
  end;
  if pcJobMaster.ActivePage = tsSubContract then
  begin
    with dmJCData do
      with quSubContract do
        if not Active then
          Open;
  end;
  if pcJobMaster.ActivePage = tsJobClaim then
  begin
    with dmJCData do
      with quJobClaim do
        if not Active then
          Open;
  end;
end;

procedure TfmJobMastr.mmRepFwoCatClick(Sender: TObject);
begin
  Application.CreateForm(TfmPtFwoCat,fmPtFwoCat);
  try
    fmPtFwoCat.ShowModal;
  finally
    fmPtFwoCat.Release;
  end;
end;

procedure TfmJobMastr.mmRepSubAmtClick(Sender: TObject);
begin
  Application.CreateForm(TfmPtSubCat,fmPtSubCat);
  try
    fmPtSubCat.ShowModal;
  finally
    fmPtSubCat.Release;
  end;
end;

procedure TfmJobMastr.FormShow(Sender: TObject);
begin
  with dmJCdata do
  begin
    with quJob_file do
    begin
      if not Active then
        Open;
      with quJOB_FWO do
      begin
        if Active then
          Close;
        ParamByName('Job_No_1').Value := quJob_fileJOB_NO_1.Value;
        ParamByName('Job_No_2').Value := quJob_fileJOB_NO_2.Value;
        Open;
      end;
    end;

    dedJob_no_1.MaxLength := gJobNo1Len;

    if gBillACByJob = 'N' then
    begin
      laBill_AC.Enabled := False;
      laBillProfitCTR1.Enabled := False;
      laBillProfitCTR2.Enabled := False;
      dedBillAC.Enabled := False;
      dedBillProfitCTR1.Enabled := False;
      dedBillProfitCTR2.Enabled := False;
      dedBillAC.Ctl3D := False;
      dedBillProfitCTR1.Ctl3D := False;
      dedBillProfitCTR2.Ctl3D := False;
    end;

    if gUseJobNo2 = 'Y' then
      dedJobNo2.MaxLength := gJobNo2Len
    else
    begin
      dedJobNo2.Enabled := False;
      dedJobNo2.Visible := False;
      laJobNo2.Visible := False;
    end;

    with quSub_job do
      if not Active then
        Open;
    with quJobCostCat do
      if not Active then
        Open;
  end;
end;

procedure TfmJobMastr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quSubJobBal do
  begin
    if Active then
      Close;
    if Prepared then
      UnPrepare;
  end;
  with quJobCostSumry do
  begin
    if Active then
      Close;
    if Prepared then
      UnPrepare;
  end;
  with quJobCostBal do
  begin
    if Active then
      Close;
    if Prepared then
      UnPrepare;
  end;
  with dmJCData do
    with quJob_file do
      if Active then
        Close;
end;

procedure TfmJobMastr.dgrJob_FWODblClick(Sender: TObject);
begin
  if not dmJCdata.quSelectJob.IsEmpty then
  begin
    Try
      Application.CreateForm(TfmJobFWO,fmJobFWO);
      fmJobFWO.ShowModal;
    finally
      fmJobFWO.Release;
    end;
  end else
    ShowMessage('無所需要的數据');
end;

procedure TfmJobMastr.dgrSubJobUpdateFooter(Sender: TObject);
begin
  with dmJCData, quSubJobBal do
  begin
    if Active then
      Close;
    Open;
    dgrSubJob.ColumnByName('Sub_Job_no').FooterValue :=
      IntToStr(quSubJobBalLineCount.Value);
    dgrSubJob.ColumnByName('Job_Reg_Amt').FooterValue :=
      FloatToStrF(quSubJobBalJobRegAmt.AsFloat, ffCurrency, 12, 2);
    dgrSubJob.ColumnByName('Job_Prem_Amt').FooterValue :=
       FloatToStrF(quSubJobBalJobPremAmt.AsFloat, ffCurrency, 12, 2);
    Close;
  end;
end;

procedure TfmJobMastr.dgrJobCostSumryUpdateFooter(Sender: TObject);
begin
  with quJobCostBal do
  begin
    dgrJobCostSumry.ColumnByName('JobRegAmt').FooterValue :=
      FloatToStrF(quJobCostBalJobRegAmt.AsFloat, ffCurrency, 12, 2);
    dgrJobCostSumry.ColumnByName('JobPremAmt').FooterValue :=
       FloatToStrF(quJobCostBalJobPremAmt.AsFloat, ffCurrency, 12, 2);
    dgrJobCostSumry.ColumnByName('calAmtTotal').FooterValue :=
       FloatToStrF((quJobCostBalJobRegAmt.AsFloat +
                    quJobCostBalJobPremAmt.AsFloat), ffCurrency, 12, 2);
  end;
end;

procedure TfmJobMastr.quJobCostSumryCalcFields(DataSet: TDataSet);
begin
  quJobCostSumrycalAmtTotal.Value :=
    quJobCostSumryJOBREGAMT.Value + quJobCostSumryJOBPREMAMT.Value;
  if quJobCostSumryBUDGETAMT.Value <> 0 then
    quJobCostSumrycalAmtVarPct.Value :=
      ((quJobCostSumrycalAmtTotal.Value - quJobCostSumryBUDGETAMT.Value)
       / quJobCostSumryBUDGETAMT.Value) * 100;
end;

end.
