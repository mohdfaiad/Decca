unit Subjobct;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls,
  Grids, DBGrids, Db, DBTables, Mask, DBCtrls, CTCostDM, Wwdbigrd, Wwdbgrid,
  Wwquery, Wwdatsrc, wwdblook, Wwdbdlg;

type
  TfmSJCost = class(TForm)
    mmQuot: TMainMenu;
    mmPrintSetup: TMenuItem;
    mmExit: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    ps_PrintSetup: TPrinterSetupDialog;
    plInfo: TPanel;
    Label1: TLabel;
    mmReport: TMenuItem;
    plTools: TPanel;
    sbCalculator: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    sbExit: TSpeedButton;
    naSJCost: TDBNavigator;
    mmFile: TMenuItem;
    Label3: TLabel;
    deJobDesc: TDBEdit;
    edSubJobDesc: TEdit;
    quFindSubJobDesc: TQuery;
    edJobNo: TEdit;
    edSubJobNo: TEdit;
    mmCostRep: TMenuItem;
    edLineNo: TEdit;
    laLineNo: TLabel;
    edDimension: TEdit;
    edQty: TEdit;
    edUnit: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    dgrSubJobCost: TwwDBGrid;
    laViewAmt: TLabel;
    quSumBalance: TwwQuery;
    quSubJobCost: TwwQuery;
    quSubJobCostSECTION_NO: TStringField;
    quSubJobCostCOST_CAT: TStringField;
    quSubJobCostDESCRIPTION: TStringField;
    quSubJobCostQTY_UNIT: TStringField;
    quSubJobCostBUDGET_QTY: TBCDField;
    quSubJobCostACTUAL_QTY: TBCDField;
    quSubJobCostSTD_QTY: TBCDField;
    quSubJobCostBUDGET_AMT: TBCDField;
    quSubJobCostACTUAL_AMT: TBCDField;
    quSubJobCostSTD_AMOUNT: TBCDField;
    quSubJobCostQUOT_ITEM_NO: TStringField;
    quSubJobCostLINE_NO: TIntegerField;
    quSubJobCostJOB_NO: TStringField;
    dsSubJobCost: TwwDataSource;
    quSumBalanceLINECOUNT: TIntegerField;
    quSumBalanceBUDGETBAL: TBCDField;
    quSumBalanceACTUALBAL: TBCDField;
    quSumBalanceSTDBAL: TBCDField;
    quSubJobCostCATEGORY: TStringField;
    quItemNo: TwwQuery;
    dsItemNo: TwwDataSource;
    quItemNoQUOT_SECT: TStringField;
    quItemNoLIBRARY_CAT: TStringField;
    quItemNoDESCRIPTION: TStringField;
    quItemNoQUOT_UNIT: TStringField;
    dbCBLKCostCat: TwwDBLookupComboDlg;
    quItemNoQUOT_CAT: TStringField;
    mmCostCatSum: TMenuItem;
    usSubJobCost: TUpdateSQL;
    pmSubJobRec: TPopupMenu;
    pmPreRec: TMenuItem;
    pmNextRec: TMenuItem;
    mmPatCCRep: TMenuItem;
    quSubJobCostITEM_SUMRY_CAT: TStringField;
    dbluItemSumryCat: TwwDBLookupComboDlg;
    quItemSumryCat: TwwQuery;
    quItemNoITEM_SUMRY_CAT: TStringField;
    procedure FileOpen(Sender: TObject);
    procedure FileSaveAs(Sender: TObject);
    procedure FilePrint(Sender: TObject);
    procedure FilePrintSetup(Sender: TObject);
    procedure FileExit(Sender: TObject);
    procedure sbPrintSetupClick(Sender: TObject);
    procedure sbCalculatorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dgrSubJobCostColExit(Sender: TObject);
    procedure mmCostRepClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dgrSubJobCostUpdateFooter(Sender: TObject);
    procedure quSubJobCostAfterInsert(DataSet: TDataSet);
    procedure quSubJobCostAfterPost(DataSet: TDataSet);
    procedure quSubJobCostUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure quSubJobCostPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbCBLKCostCatCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure mmCostCatSumClick(Sender: TObject);
    procedure pmPreRecClick(Sender: TObject);
    procedure pmNextRecClick(Sender: TObject);
    procedure quSubJobCostBeforeDelete(DataSet: TDataSet);
    procedure mmPatCCRepClick(Sender: TObject);

  end;

var
  fmSJCost: TfmSJCost;

implementation

uses  repselct, ctmain, SumRpSlt, CCRepDlg;


{$R *.DFM}

procedure TfmSJCost.FileOpen(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    { Add code to open OpenDialog.FileName }
  end;
end;

procedure TfmSJCost.FileSaveAs(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    { Add code to save current file under SaveDialog.FileName }
  end;
end;

procedure TfmSJCost.FilePrint(Sender: TObject);
begin
  if PrintDialog.Execute then
  begin
    { Add code to print current file }
  end;
end;

procedure TfmSJCost.FilePrintSetup(Sender: TObject);
begin
  ps_PrintSetup.Execute;
end;

procedure TfmSJCost.FileExit(Sender: TObject);
begin
  Close;
  Release;
end;





procedure TfmSJCost.sbPrintSetupClick(Sender: TObject);
begin
  ps_PrintSetup.Execute;
end;





procedure TfmSJCost.sbCalculatorClick(Sender: TObject);
var
  wStr : array [0..5] of char;
begin
  strpcopy(wStr, 'calc');
  if WinExec(wStr, SW_SHOW) < 32 then
    ShowMessage('未能夠打開計算器');
end;




procedure TfmSJCost.FormShow(Sender: TObject);
var
  wJobNo : string[7];
  wLineNo : integer;
begin
  with dmCost do
  begin
    with quSubjob do
    begin
      wJobNo := FieldByName('Job_No').Value;
      wLineNo := Fieldbyname('Line_No').asInteger;
      with quSumBalance do
      begin
        if Active then
          Close;
        ParamByName('Job_No').Value := wJobNo;
        ParamByName('Line_No').Value := wLineNo;
        Open;
      end;
      edJobNo.Text := wJobNo;
      edSubJobNo.Text := quSubJobSUB_JOB_NO.AsString;
      edSubJobDesc.Text := quSubJobDESCRIPTION.AsString;
      edDimension.Text := quSubJobJLENGTH.AsString
                        + '長 x '
                        + quSubJobJWIDTH.AsString
                        + '闊 x '
                        + quSubJobJHEIGHT.AsString
                        + '高(mm)';
      edQty.Text := quSubJobQTY.AsString;
      edUnit.Text := quSubJobUNIT.AsString;
      edLineNo.Text := IntToStr(wLineNo);
      with quSubJobCost do
      begin
        if Active then
           Close;
        ParamByName('Job_No').Value := quSubJobJOB_NO.Value;
        ParamByName('Line_No').Value := quSubJobLINE_NO.Value;
        Open;
      end;
    end;
    if not laViewAmt.Enabled then
    begin
      qusubjobCostBUDGET_AMT.visible := False;
      qusubjobCostACTUAL_AMT.visible := False;
      quSubJobCostSTD_AMOUNT.visible := False;
    end;
    with quSubJob do
    begin
      if Bof then
        pmPreRec.Enabled := False
      else
        pmPreRec.Enabled := True;
      if Eof then
        pmNextRec.Enabled := False
      else
        pmNextRec.Enabled := True;
    end;
  end;
end;

procedure TfmSJCost.dgrSubJobCostColExit(Sender: TObject);
begin
  if (quSubJobCost.State = dsEdit) or
     (quSubJobCost.State = dsInsert) then
  begin
    with dgrSubJobCost.SelectedField do
    begin
      if (FieldName = 'JOB_NO') or
         (FieldName = 'SUB_JOB_NO') or
         (FieldName = 'COST_CAT') then
       Text := UpperCase(Text);
    end;
  end;
end;

procedure TfmSJCost.mmCostRepClick(Sender: TObject);
begin
  Application.CreateForm(TfmRepSel, fmRepSel);
  try
    fmRepSel.showmodal;
  finally
    fmRepSel.release;
  end;
end;

procedure TfmSJCost.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'mmCostRep';
  Funcs[3] := 'mmCostCatSum';
  Funcs[4] := 'naSJCost.nbInsert';
  Funcs[5] := 'naSJCost.nbDelete';
  Funcs[6] := 'laViewAmt';
  Funcs[7] := 'mmPatCCRep';
  //=====================
  fmCTMain.TestProgram( Funcs );
  with quSumBalance do
  begin
    if Active then
      Close;
    if not Prepared then
      Prepare;
  end;
  if dmCost.quSubJobSTATUS.AsString = 'C' then
  begin
    dgrSubJobCost.ReadOnly := True;
    naSJCost.VisibleButtons := naSJCost.VisibleButtons -
                               [nbDelete] -
                               [nbInsert] -
                               [nbPost] -
                               [nbCancel];
  end
  else
  begin
    dgrSubJobCost.ReadOnly := False;
    naSJCost.VisibleButtons := naSJCost.VisibleButtons +
                               [nbDelete] +
                               [nbInsert] +
                               [nbPost] +
                               [nbCancel];
  end;
  quItemNo.Active := True;
end;

procedure TfmSJCost.dgrSubJobCostUpdateFooter(Sender: TObject);
begin
  dgrSubJobCost.ColumnByName('Section_No').FooterValue :=
    IntToStr(quSumBalanceLineCount.asInteger);
  dgrSubJobCost.ColumnByName('Budget_Amt').FooterValue :=
    FloatToStrF(quSumBalanceBudgetBal.asFloat, ffCurrency, 10, 2);
  dgrSubJobCost.ColumnByName('Actual_Amt').FooterValue :=
    FloatToStrF(quSumBalanceActualBal.asFloat, ffCurrency, 10, 2);
  dgrSubJobCost.ColumnByName('Std_amount').FooterValue :=
    FloatToStrF(quSumBalanceStdBal.asFloat, ffCurrency, 10, 2);
end;

procedure TfmSJCost.quSubJobCostAfterInsert(DataSet: TDataSet);
begin
  with  qusubjobcost do
  begin
    fieldbyname('Job_No').value := trim(fmSJCost.edjobno.text);
    fieldbyname('Line_No').value := StrToInt(trim(fmSJCost.edLineNo.text));
  end;
end;

procedure TfmSJCost.quSubJobCostAfterPost(DataSet: TDataSet);
begin
  with quSubJobCost do
  begin
    try
      ApplyUpdates;
      CommitUpdates;
//      Close;
//      Open;
    except
      ShowMessage('未能夠更新記錄');
    end;
  end;
  with quSumBalance do
  begin
    if Active then
      Close;
    ParamByName('Job_No').Value := edJobNo.Text;
    ParamByName('Line_No').Value := StrToInt(edLineNo.Text);
    Open;
  end;
  dgrSubJobCostUpdateFooter(Self);
end;

procedure TfmSJCost.quSubJobCostUpdateError(DataSet: TDataSet;
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

procedure TfmSJCost.quSubJobCostPostError(DataSet: TDataSet;
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

procedure TfmSJCost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quSumBalance do
  begin
    if Active then
      Close;
    if Prepared then
      UnPrepare;
  end;
  quItemNo.Active := False;
end;

procedure TfmSJCost.dbCBLKCostCatCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if (quSubJobCost.State = dsInsert) or
     (quSubJobCost.State = dsEdit) then
  begin
    dgrSubJobCost.Fields[0].AsString := quItemNoQUOT_SECT.AsString;
    if trim(quItemNoITEM_SUMRY_CAT.AsString) <> '' then
      dgrSubJobCost.Fields[3].AsString := quItemNoITEM_SUMRY_CAT.AsString;
    if trim(quItemNoQUOT_CAT.AsString) <> '' then
      dgrSubJobCost.Fields[2].AsString := quItemNoQUOT_CAT.AsString;
    if trim(quItemNoLIBRARY_CAT.AsString) <> '' then
      dgrSubJobCost.Fields[1].AsString := quItemNoLIBRARY_CAT.AsString;
    if trim(quItemNoDESCRIPTION.AsString) <> '' then
      dgrSubJobCost.Fields[4].AsString := quItemNoDESCRIPTION.AsString;
    if trim(quItemNoQUOT_UNIT.AsString) <> '' then
    dgrSubJobCost.Fields[5].AsString := quItemNoQUOT_UNIT.AsString;
  end
end;

procedure TfmSJCost.mmCostCatSumClick(Sender: TObject);
begin
  Application.CreateForm(TfmSumRpSlt, fmSumRpSlt);
  try
    fmSumRpSlt.showmodal;
  finally
    fmSumRpSlt.release;
  end;
end;

procedure TfmSJCost.pmPreRecClick(Sender: TObject);
var
  wJobNo : string;
  wLineNo : Integer;
begin
  with dmCost.quSubJob do
  begin
    if not Bof then
    begin
      Prior;
      if Bof then
        pmPreRec.Enabled := False
      else
        pmPreRec.Enabled := True;
      if Eof then
        pmNextRec.Enabled := False
      else
        pmNextRec.Enabled := True;
    end;
  end;
  with dmCost.quSubjob do
  begin
    wJobNo := FieldByName('Job_No').Value;
    wLineNo := Fieldbyname('Line_No').asInteger;
    with quSumBalance do
    begin
      if Active then
        Close;
      ParamByName('Job_No').Value := wJobNo;
      ParamByName('Line_No').Value := wLineNo;
      Open;
    end;
    edJobNo.Text := wJobNo;
    edSubJobNo.Text := FieldByName('Sub_Job_No').value;
    edSubJobDesc.Text := Fieldbyname('Description').value;
    edDimension.Text := FieldByName('JLength').asString
                      + '長 x '
                      + FieldByName('JWidth').asString
                      + '闊 x '
                      + FieldByName('JHeight').asString
                      + '高(mm)';
    edQty.Text := FieldByName('Qty').asString;
    edUnit.Text := FieldByName('Unit').asString;
    edLineNo.Text := IntToStr(wLineNo);
  end;
  if dmCost.quSubJobSTATUS.AsString = 'C' then
  begin
    dgrSubJobCost.ReadOnly := True;
    naSJCost.VisibleButtons := naSJCost.VisibleButtons -
                               [nbDelete] -
                               [nbInsert] -
                               [nbPost] -
                               [nbCancel];
  end
  else
  begin
    dgrSubJobCost.ReadOnly := False;
    naSJCost.VisibleButtons := naSJCost.VisibleButtons +
                               [nbDelete] +
                               [nbInsert] +
                               [nbPost] +
                               [nbCancel];
  end;
end;

procedure TfmSJCost.pmNextRecClick(Sender: TObject);
var
  wJobNo : string;
  wLineNo : Integer;
begin
  with dmCost.quSubJob do
  begin
    if not Eof then
    begin
      Next;
      if Eof then
        pmNextRec.Enabled := False
      else
        pmNextRec.Enabled := True;
      if Bof then
        pmPreRec.Enabled := False
      else
        pmPreRec.Enabled := True;
    end;
  end;
  with dmCost.quSubjob do
  begin
    wJobNo := FieldByName('Job_No').Value;
    wLineNo := Fieldbyname('Line_No').asInteger;
    with quSumBalance do
    begin
      if Active then
        Close;
      ParamByName('Job_No').Value := wJobNo;
      ParamByName('Line_No').Value := wLineNo;
      Open;
    end;
    edJobNo.Text := wJobNo;
    edSubJobNo.Text := FieldByName('Sub_Job_No').value;
    edSubJobDesc.Text := Fieldbyname('Description').value;
    edDimension.Text := FieldByName('JLength').asString
                      + '長 x '
                      + FieldByName('JWidth').asString
                      + '闊 x '
                      + FieldByName('JHeight').asString
                      + '高(mm)';
    edQty.Text := FieldByName('Qty').asString;
    edUnit.Text := FieldByName('Unit').asString;
    edLineNo.Text := IntToStr(wLineNo);
  end;
  if dmCost.quSubJobSTATUS.AsString = 'C' then
  begin
    dgrSubJobCost.ReadOnly := True;
    naSJCost.VisibleButtons := naSJCost.VisibleButtons -
                               [nbDelete] -
                               [nbInsert] -
                               [nbPost] -
                               [nbCancel];
  end
  else
  begin
    dgrSubJobCost.ReadOnly := False;
    naSJCost.VisibleButtons := naSJCost.VisibleButtons +
                               [nbDelete] +
                               [nbInsert] +
                               [nbPost] +
                               [nbCancel];
  end;
end;

procedure TfmSJCost.quSubJobCostBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete Record?',
     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Abort;
end;

procedure TfmSJCost.mmPatCCRepClick(Sender: TObject);
begin
  Application.CreateForm(TfmCCRepDlg, fmCCRepDlg);
  try
    fmCCRepDlg.showmodal;
  finally
    fmCCRepDlg.release;
  end;
end;

end.
