unit JobFWO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,db,
  Menus, ExtDlgs, ExtCtrls, DBCtrls, wwdbdatetimepicker, StdCtrls,
  wwSpeedButton, wwDBNavigator, Buttons, wwdblook, Mask, wwdbedit, Grids,
  Wwdbigrd, Wwdbgrid, DBTables, Wwquery, Wwdatsrc, Wwdotdot, Wwdbdlg,
  TestPrg, ComCtrls;

type
  TfmJobFWO = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaJobFWO: TwwDBNavigator;
    dnaJobFWOFirst: TwwNavButton;
    dnaJobFWOPrior: TwwNavButton;
    dnaJobFWONext: TwwNavButton;
    dnaJobFWOLast: TwwNavButton;
    dnaJobFWOInsert: TwwNavButton;
    dnaJobFWODelete: TwwNavButton;
    dnaJobFWOPost: TwwNavButton;
    dnaJobFWOCancel: TwwNavButton;
    printSetup: TPrinterSetupDialog;
    op_Photo: TOpenPictureDialog;
    mmJobFWO: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    quJobFWO: TwwQuery;
    quJobFWOFWO_NO: TStringField;
    quJobFWODESCRIPTION: TStringField;
    quJobFWOSTATUS: TStringField;
    quJobFWOSUB_JOB_NO: TStringField;
    quJobFWOFWO_CAT: TStringField;
    quJobFWOCREATE_DATE: TDateTimeField;
    quJobFWOFWO_LENGTH: TBCDField;
    quJobFWOFWO_WIDTH: TBCDField;
    quJobFWOFWO_HEIGHT: TBCDField;
    quJobFWOFWO_UNIT: TStringField;
    quJobFWOCREATED_BY: TStringField;
    quJobFWOCOMMENT: TMemoField;
    quJobFWOCHECKED_BY: TStringField;
    quJobFWOCHECK_DATE: TDateTimeField;
    quJobFWOQUOT_NO: TStringField;
    quJobFWOUPDATE_SJ_BUDGET: TStringField;
    quJobFWOPRODUCT_CODE: TStringField;
    quJobFWOPHOTO: TBlobField;
    quJobFWOcalSubDescription: TStringField;
    quJobFWOFWO_QTY: TBCDField;
    quJobFWOJOB_NO_1: TStringField;
    quJobFWOJOB_NO_2: TStringField;
    quSubJob: TwwQuery;
    quSubJobSUB_JOB_NO: TStringField;
    quSubJobDESCRIPTION: TStringField;
    quJob_FWO_Detail: TwwQuery;
    dsJobFWO: TwwDataSource;
    dsJob_FWO_Detail: TwwDataSource;
    quJob_FWO_DetailJOB_NO_1: TStringField;
    quJob_FWO_DetailJOB_NO_2: TStringField;
    quJob_FWO_DetailFWO_NO: TStringField;
    quJob_FWO_DetailLINE_NO: TIntegerField;
    quJob_FWO_DetailFWO_LENGTH: TBCDField;
    quJob_FWO_DetailFWO_WIDTH: TBCDField;
    quJob_FWO_DetailFWO_HEIGHT: TBCDField;
    quJob_FWO_DetailFWO_UNIT: TStringField;
    puFWODetail: TPopupMenu;
    puFWODetailDelete: TMenuItem;
    puFWODetailCancel: TMenuItem;
    puFWODetailPost: TMenuItem;
    N1: TMenuItem;
    N4: TMenuItem;
    quJob_FWO_DetailFWO_QTY: TBCDField;
    dsSel1SubJob: TwwDataSource;
    quSel1SubJob: TwwQuery;
    quSel1SubJobSUB_JOB_NO: TStringField;
    quSel1SubJobDESCRIPTION: TStringField;
    quJob_FWO_DetailQUOT_LINE_NO: TStringField;
    Label8: TLabel;
    quQuotLine: TwwQuery;
    dsQuotLine: TwwDataSource;
    quQuotLineQUOT_NO: TStringField;
    quQuotLineQUOT_LINE_NO: TStringField;
    quQuotLineQUOT_QTY: TBCDField;
    quQuotLineQLENGTH: TBCDField;
    quQuotLineQWIDTH: TBCDField;
    quQuotLineQHIGH: TBCDField;
    quQuotLineDESCRIPTION: TStringField;
    quQuotLineUNIT: TStringField;
    usJob_FWO_Detail: TUpdateSQL;
    quQuotFile: TwwQuery;
    dsQuotFile: TwwDataSource;
    quQuotFileQUOT_NO: TStringField;
    quQuotFileDESCRIPTION: TStringField;
    quJob_FWO_DetailPRODUCT_CODE: TStringField;
    TestPrg: TTestPrg;
    pcJobFwo: TPageControl;
    tsJobFWO: TTabSheet;
    tsFWOCostCat: TTabSheet;
    paJobFWO: TPanel;
    paJob_FWO: TPanel;
    paBase: TPanel;
    laJobNo: TLabel;
    laFWO_NO: TLabel;
    laFWOsub_job_no: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    laFWO_Cat: TLabel;
    laQuotNo: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dedFWOjob_no_1: TwwDBEdit;
    dedFWOdescription: TwwDBEdit;
    dedJobDescri: TwwDBEdit;
    drgFWOStatus: TDBRadioGroup;
    gbUser: TGroupBox;
    laFWOcreated_by: TLabel;
    laFWOcreate_date: TLabel;
    dedFWOcreated_by: TwwDBEdit;
    wwDBEdit1: TwwDBEdit;
    dbluFWONo: TwwDBLookupCombo;
    dbluSubJobNo: TwwDBLookupCombo;
    dtpOrderDate: TwwDBDateTimePicker;
    dedOrderedBy: TwwDBEdit;
    dtpCompletionDate: TwwDBDateTimePicker;
    dlcbFWO_Cat: TwwDBLookupCombo;
    edSubJobDesc: TEdit;
    dedUnit: TwwDBEdit;
    dblucbQuotNo: TwwDBLookupComboDlg;
    dedQty: TwwDBEdit;
    Panel2: TPanel;
    paBotton: TPanel;
    btnZoom: TBitBtn;
    btnClear: TBitBtn;
    dimPhoto: TDBImage;
    GroupBox1: TGroupBox;
    dmeFWOcomment: TDBMemo;
    gbUnit: TGroupBox;
    dbluQuotLine: TwwDBLookupCombo;
    dgrJobFWODetail: TwwDBGrid;
    gbFWOCostCat: TGroupBox;
    dgrFWOCostCat: TwwDBGrid;
    sbRenameFWO: TSpeedButton;
    quFWOBal: TwwQuery;
    quFWOBalBUDGETAMT: TBCDField;
    quFWOBalJOBREGAMT: TBCDField;
    quFWOBalJOBPREMAMT: TBCDField;
    quFWOBalLINECOUNT: TIntegerField;
    Panel1: TPanel;
    laJobNo1: TLabel;
    laFWONo1: TLabel;
    dedJobNo1: TwwDBEdit;
    dedFWODesc: TwwDBEdit;
    dedJobDesc: TwwDBEdit;
    dedFWONo: TwwDBEdit;
    Label6: TLabel;
    dedFWOQty: TwwDBEdit;
    dedQtyUnit: TwwDBEdit;
    ckInSingle: TCheckBox;
    procedure btnZoomOutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure mmPrintsetupClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure dimPhotoDblClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure dedFWOsub_job_noExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbluSubJobNoChange(Sender: TObject);
    procedure quJob_FWO_DetailAfterPost(DataSet: TDataSet);
    procedure quJob_FWO_DetailPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure quJob_FWO_DetailUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure puFWODetailPostClick(Sender: TObject);
    procedure puFWODetailDeleteClick(Sender: TObject);
    procedure puFWODetailCancelClick(Sender: TObject);
    procedure puFWODetailPopup(Sender: TObject);
    procedure quJob_FWO_DetailAfterInsert(DataSet: TDataSet);
    procedure dbluFWONoChange(Sender: TObject);
    procedure dbluQuotLineExit(Sender: TObject);
    procedure dgrJobFWODetailEnter(Sender: TObject);
    procedure dgrJobFWODetailExit(Sender: TObject);
    procedure dblucbQuotNoExit(Sender: TObject);
    procedure pcJobFwoChange(Sender: TObject);
    procedure sbRenameFWOClick(Sender: TObject);
    procedure dgrFWOCostCatUpdateFooter(Sender: TObject);
    procedure dgrFWOCostCatDblClick(Sender: TObject);
    procedure dedFWONoChange(Sender: TObject);
    procedure ckInSingleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJobFWO: TfmJobFWO;

implementation
  uses JCdatadm,
       JCmain,
       Photo,
       FWODtDM,
       PtJobFwo,
       MoveFWO, fwocstdt;
{$R *.DFM}

procedure TfmJobFWO.btnZoomOutClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfmPhoto,fmPhoto);
    fmPhoto.ShowModal ;
  finally
    fmPhoto.Release;
  end;
end;

procedure TfmJobFWO.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
//  Funcs[1] := 'All';
  //=====================
//  fmJCmain.TestProgram( Funcs );
  TestPrg.TestProgram('JC', wCompanyID, wUserID, wActiveSecurity);
  if not gbFWOCostCat.Enabled then
  begin
    gbFWOCostCat.Enabled := true;
    with dmJCData do
      with quFWOCostCat do
      begin
        quFWOCostCatBUDGET_AMT.Visible := false;
        quFWOCostCatJOB_REG_AMT.Visible := false;
        quFWOCostCatJOB_PREM_AMT.Visible := false;
        quFWOCostCatcalBudgetAmt.Visible := False;
        quFWOCostCatcalRegAmt.Visible := False;
        quFWOCostCatcalPremAmt.Visible := False;
        quFWOCostCatcalAmtTotal.Visible := false;
        quFWOCostCatcalAmtVarPct.Visible := false;
      end;
  end;
  if not laJobNo.Enabled then
  begin
    laJobNo.Enabled := true;
{
    with dmJCData do
      with quJob_FWO do
      begin
        RequestLive := false;
        CachedUpdates := false;
      end;
}
  end;

  with dmJCData do
  begin
    with quFWOCostCat do
    begin
      if Active then Close;
      if not Prepared then Prepare;
    end;
  end;
  with quJobFWO do
    if not Active then
      Open;
  with quSubJob do
    if not Active then
      Open;
  with quJob_FWO_Detail do
  begin
    if Active then
      Close;
    Prepare;
    if not Active then
    begin
      ParamByName('Job_No_1').Value := quJOBFWOJOB_NO_1.Value;
      ParamByName('Job_No_2').Value := quJOBFWOJOB_NO_2.Value;
      ParamByName('FWO_No').Value := trim(dbluFWONo.Text);
      Open;
    end;
  end;
  with quSel1SubJob do
  begin
    if Active then
      Close;
    Prepare;
  end;
  with quQuotLine do
  begin
    if Active then
      Close;
    Prepare;
  end;
  with quQuotFile do
  begin
    if not Active then
      Open;
  end;
  with quFWOBal do
  begin
    if Active then
      Close;
    if not Prepared then
      Prepare;
  end;
  pcJobFwo.ActivePage := tsJobFWO;
end;

procedure TfmJobFWO.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJobFWO.mmPrintsetupClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmJobFWO.sbPrintscreenClick(Sender: TObject);
begin
  print;
end;

procedure TfmJobFWO.dimPhotoDblClick(Sender: TObject);
begin
  with dmJCdata do
  begin
    if ((quJOB_FWO.State <> dsedit)
      or (quJOB_FWO.State <> dsinsert)) then
    begin
      if Not quJOB_FWO.IsEmpty then
      begin
        quJOB_FWO.Edit;
        if op_Photo.Execute then
          dimPhoto.Picture.Create.LoadFromFile(
           op_Photo.FileName);
      end;
    end
  end;
end;

procedure TfmJobFWO.btnClearClick(Sender: TObject);
begin
  if NOT dmJCdata.quJOB_FWO.IsEmpty then
  begin
    if MessageDlg('是否清除圖片?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with dmJCdata.quJOB_FWO do
      begin
        if ((state <> dsedit) or (state <> dsinsert)) then
          Edit;
        dmJCdata.quJOB_FWOPHOTO.Clear;
      end;
    end;
  end;
end;

procedure TfmJobFWO.dedFWOsub_job_noExit(Sender: TObject);
begin
  with dmJCdata do
  begin
    with quSelFWOSubDescr do
    begin
      if Active then
        Close;
      Open;
    end;
  end;
end;

procedure TfmJobFWO.FormShow(Sender: TObject);
begin
  dbluFWONo.MaxLength := gFWOLen;
  dbluSubJobNo.MaxLength := gSubJobLen;
  with dmJCdata do
  begin
    with quJOB_FWO do
    begin
      if not RequestLive then
      begin
        if Active then
          Close;
        dnaJobFWOInsert.Visible := False;
        dnaJobFWODelete.Visible := False;
        dnaJobFWOPost.Visible := False;
        dnaJobFWOCancel.Visible := False;
        with dmJCFWO do
        begin
          ParamByName('Job_No_1').Value := quSeleSub_FWOOJOB_NO_1.Value;
          ParamByName('Job_No_2').Value := quSeleSub_FWOOJOB_NO_2.Value;
          Open;
          Locate('Job_No_1;Job_No_2;FWO_No',
                 VarArrayOf([quSeleSub_FWOOJOB_NO_1.AsString,
                             quSeleSub_FWOOJOB_NO_2.AsString,
                             quSeleSub_FWOOFWO_NO.AsString]), []);
        end;
      end;
{
      with quFWOCostCat do
      begin
        if Active then
          Close;
        ParamByName('Job_No_1').Value := quJOB_FWOJOB_NO_1.Value;
        ParamByName('Job_No_2').Value := quJOB_FWOJOB_NO_2.Value;
        ParamByName('FWO_No').Value := quJOB_FWOFWO_NO.Value;
        Open;
      end;
}
    end;
    with qufwo_cat do
      if Not Active then
        Open;
    with quSelFWOSubDescr do
      if Not Active then
        Open;
  end;
end;

procedure TfmJobFWO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCdata do
  begin
    with quFWOCostCat do
    begin
      if Active then Close;
      if Prepared then Unprepare;
    end;
  end;
  with quJOBFWO do
    if Active then
      Close;
  with quSubJob do
    if Active then
      Close;
  with quJob_FWO_Detail do
  begin
    if Active then
      Close;
    if Prepared then
      Unprepare;
  end;
  with quQuotLine do
  begin
    if Active then
      Close;
    if Prepared then
      Unprepare;
  end;
  with quSel1SubJob do
  begin
    if Active then
      Close;
    if Prepared then
      Unprepare;
  end;
  with quQuotFile do
  begin
    if Active then
      Close;
  end;
  with quFWOBal do
  begin
    if Active then
      Close;
    if Prepared then
      Unprepare;
  end;
  gInSingle := False;
  gCalcQty := 1;
end;

procedure TfmJobFWO.dbluSubJobNoChange(Sender: TObject);
begin
  with dmJCdata do
  begin
    with quSel1SubJob do
    begin
      if Active then
        Close;
      ParamByName('Job_No_1').Value := quJob_fileJOB_NO_1.AsString;
      ParamByName('Job_No_2').Value := quJob_fileJOB_NO_2.AsString;
      ParamByName('Sub_Job_No').Value := trim(dbluSubJobNo.Text);
      Open;
      First;
      edSubJobDesc.Text := '';
      if RecordCount > 0 then
        edSubJobDesc.Text := quSel1SubJobDESCRIPTION.AsString;
      if Active then
        Close;
    end;
  end;
end;

procedure TfmJobFWO.quJob_FWO_DetailAfterPost(DataSet: TDataSet);
begin
  with quJob_FWO_Detail do
    try
      ApplyUpdates;
      CommitUpdates;
    except
      ShowMessage('未能更新記錄');
    end;
end;

procedure TfmJobFWO.quJob_FWO_DetailPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if (pos('changed the record', E.Message) <> 0) then
  begin
    ShowMessage('記錄已修正,未能更新記錄');
    Action := daAbort;
    DataSet.Close;
    DataSet.Open;
  end
  else
  begin
    if (pos('UNIQUE KEY', e.Message) <> 0) then
    begin
      ShowMessage('記錄重复');
      Action := daAbort;
      DataSet.Close;
      DataSet.Open;
    end
    else
    if Length(e.Message) > 0 then
    begin
      ShowMessage(e.Message);
      Action := daAbort;
    end;
  end;
end;

procedure TfmJobFWO.quJob_FWO_DetailUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  if (pos('changed the record', E.Message) <> 0) then
  begin
    ShowMessage('記錄已修正,未能更新記錄');
    UpdateAction := uaAbort;
    DataSet.Close;
    DataSet.Open;
  end
  else
  begin
    if (pos('UNIQUE KEY', e.Message) <> 0) then
    begin
      ShowMessage('記錄重复');
      UpdateAction := uaAbort;
      DataSet.Close;
      DataSet.Open;
    end
    else
    if Length(e.Message) > 0 then
    begin
      ShowMessage(e.Message);
      UpdateAction := uaAbort;
    end;
  end;
end;

procedure TfmJobFWO.puFWODetailPostClick(Sender: TObject);
begin
  with quJob_FWO_Detail do
   Post;
end;

procedure TfmJobFWO.puFWODetailDeleteClick(Sender: TObject);
begin
  with quJob_FWO_Detail do
    Delete;
end;

procedure TfmJobFWO.puFWODetailCancelClick(Sender: TObject);
begin
  with quJob_FWO_Detail do
    Cancel;
end;

procedure TfmJobFWO.puFWODetailPopup(Sender: TObject);
begin
  with quJob_FWO_Detail do
  begin
    if ((state = dsedit) or (state = dsinsert)) then
    begin
      puFWODetailDelete.Enabled := False;
      puFWODetailPost.Enabled := True;
      puFWODetailCancel.Enabled := True;
    end
    else
    begin
      puFWODetailPost.Enabled := false;
      puFWODetailCancel.Enabled := false;
      if not quJob_FWO_Detail.IsEmpty then
        puFWODetailDelete.Enabled := true
      else
        puFWODetailDelete.Enabled := false;
    end;
  end;
end;

procedure TfmJobFWO.quJob_FWO_DetailAfterInsert(DataSet: TDataSet);
begin
  with dmJCdata, quJob_file do
  begin
    quJob_FWO_DetailJOB_NO_1.Value := quJob_fileJOB_NO_1.Value;
    quJob_FWO_DetailJOB_NO_2.Value := quJob_fileJOB_NO_2.Value;
    quJob_FWO_DetailFWO_NO.Value := trim(dbluFWONo.Text);
  end;
end;

procedure TfmJobFWO.dbluFWONoChange(Sender: TObject);
begin
  with quJob_FWO_Detail do
  begin
    if Active then
      Close;
    ParamByName('Job_No_1').Value := quJobFWOJOB_NO_1.Value;
    ParamByName('Job_No_2').Value := quJobFWOJOB_NO_2.Value;
    ParamByName('FWO_No').Value := trim(dbluFWONo.Text);
    Open;
  end;
  with quQuotLine do
  begin
    if Active then
      Close;
    ParamByName('Quot_No').Value := trim(dblucbQuotNo.Text);
    Open;
  end;
end;

procedure TfmJobFWO.dbluQuotLineExit(Sender: TObject);
begin
  if quQuotLine.Active then
    with quJob_FWO_Detail do
    begin
      if (state = dsInsert) or
         (state = dsEdit) then
      begin
        quJob_FWO_DetailFWO_LENGTH.Value := quQuotLineQLENGTH.Value;
        quJob_FWO_DetailFWO_WIDTH.Value := quQuotLineQWIDTH.Value;
        quJob_FWO_DetailFWO_HEIGHT.Value := quQuotLineQHIGH.Value;
        quJob_FWO_DetailFWO_UNIT.Value := quQuotLineUNIT.Value;
        quJob_FWO_DetailFWO_QTY.Value := quQuotLineQUOT_QTY.Value;
      end;
    end;
end;

procedure TfmJobFWO.dgrJobFWODetailEnter(Sender: TObject);
begin
  with quQuotLine do
  begin
    if Active then
      Close;
    ParamByName('Quot_No').Value := trim(dblucbQuotNo.Text);
    Open;
  end;
end;

procedure TfmJobFWO.dgrJobFWODetailExit(Sender: TObject);
begin
  with quQuotLine do
  begin
    if Active then
      Close;
  end;
end;

procedure TfmJobFWO.dblucbQuotNoExit(Sender: TObject);
begin
  with quQuotLine do
  begin
    if Active then
      Close;
    ParamByName('Quot_No').Value := trim(dblucbQuotNo.Text);
    Open;
  end;
end;

procedure TfmJobFWO.pcJobFwoChange(Sender: TObject);
begin
  if pcJobFwo.ActivePage <> tsJobFWO then
  begin
    dnaJobFWOInsert.Enabled := False;
    dnaJobFWODelete.Enabled := False;
    dnaJobFWOPost.Enabled := False;
    dnaJobFWOCancel.Enabled := False;
    with dmJCData do
    begin
      with quJOB_FWO do
        with quFWOBal do
          if not Active then
          begin
            ParamByName('Job_No_1').Value := quJOB_FWOJOB_NO_1.Value;
            ParamByName('Job_No_2').Value := quJOB_FWOJOB_NO_2.Value;
            ParamByName('FWO_No').Value := quJOB_FWOFWO_NO.Value;
            Open;
          end;
      with quFWOCostCat do
        if not Active then Open;
    end;
  end
  else
  begin
    dnaJobFWOInsert.Enabled := True;
    dnaJobFWODelete.Enabled := True;
    dnaJobFWOPost.Enabled := True;
    dnaJobFWOCancel.Enabled := True;
  end;
end;

procedure TfmJobFWO.sbRenameFWOClick(Sender: TObject);
begin
  Try
    Application.CreateForm(TfmMoveFWO,fmMoveFWO);
    fmMoveFWO.ShowModal;
  finally
    fmMoveFWO.Release;
  end;
end;

procedure TfmJobFWO.dgrFWOCostCatUpdateFooter(Sender: TObject);
begin
 with quFWOBal do
 begin
   dgrFWOCostCat.ColumnByName('Job_Cost_Cat').FooterValue :=
     IntToStr(quFWOBalLineCount.Value);
   dgrFWOCostCat.ColumnByName('calBudgetAmt').FooterValue :=
      FloatToStrF((quFWOBALBudgetAmt.AsFloat / gCalcQty), ffCurrency, 12, 2);
   dgrFWOCostCat.ColumnByName('calRegAmt').FooterValue :=
      FloatToStrF((quFWOBALJobRegAmt.AsFloat / gCalcQty), ffCurrency, 12, 2);
   dgrFWOCostCat.ColumnByName('calPremAmt').FooterValue :=
      FloatToStrF((quFWOBALJobPremAmt.AsFloat / gCalcQty), ffCurrency, 12, 2);
   dgrFWOCostCat.ColumnByName('calAmtTotal').FooterValue :=
      FloatToStrF(((quFWOBALJobRegAmt.AsFloat + quFWOBALJobPremAmt.AsFloat) / gCalcQty),
                  ffCurrency, 12, 2);
 end;
end;

procedure TfmJobFWO.dgrFWOCostCatDblClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfmFWOCstDt,fmFWOCstDt);
    fmFWOCstDt.ShowModal;
  finally
    fmFWOCstDt.Release;
  end;
end;

procedure TfmJobFWO.dedFWONoChange(Sender: TObject);
begin
  with dmJCData do
    with quJob_FWO do
    begin
      gCalcQty := 1;
      if gInSingle then
        gCalcQty := quJOB_FWOFWO_QTY.Value;
      with quFWOBal do
      begin
        if Active then Close;
        ParamByName('Job_No_1').Value := quJOB_FWOJOB_NO_1.Value;
        ParamByName('Job_No_2').Value := quJOB_FWOJOB_NO_2.Value;
        ParamByName('FWO_No').Value := quJOB_FWOFWO_NO.Value;
        Open;
      end;
      with quFWOCostCat do
      begin
        if Active then Close;
        ParamByName('Job_No_1').Value := quJOB_FWOJOB_NO_1.Value;
        ParamByName('Job_No_2').Value := quJOB_FWOJOB_NO_2.Value;
        ParamByName('FWO_No').Value := quJOB_FWOFWO_NO.Value;
        Open;
      end;
    end;
end;

procedure TfmJobFWO.ckInSingleClick(Sender: TObject);
begin
  if ckInSingle.Checked then
  begin
    gInSingle := True;
    gCalcQty := dmJCData.quJob_FWOFWO_QTY.Value;
  end
  else
  begin
    gInSingle := False;
    gCalcQty := 1;
  end;
  with dmJCData do
    with quFWOCostCat do
    begin
      if Active then Close;
      Open;
    end;
end;

end.
