unit CTCostDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwdatsrc, Wwtable, Wwquery;

type
  TdmCost = class(TDataModule)
    usJob: TUpdateSQL;
    dbCommon: TDatabase;
    dsSelServer: TDataSource;
    quSelServer: TQuery;
    dsSelFuncApproved: TDataSource;
    quSelFuncApproved: TQuery;
    dbQuote: TDatabase;
    dbCTData: TDatabase;
    quSJLineNo: TQuery;
    quSJCCostcat: TQuery;
    dbJCData: TDatabase;
    quQSServer: TQuery;
    quLBServer: TQuery;
    quCompany: TQuery;
    spQSImport: TStoredProc;
    spCostImport: TStoredProc;
    quLibCatDesc: TQuery;
    quJobDesc: TQuery;
    quCostRep: TQuery;
    quCostRepJob_Desc: TStringField;
    quCostRepLibCatDesc: TStringField;
    quCostRepJOB_NO: TStringField;
    quCostRepLINE_NO: TIntegerField;
    quCostRepQTY: TBCDField;
    quCostRepJLENGTH: TBCDField;
    quCostRepJWIDTH: TBCDField;
    quCostRepJHEIGHT: TBCDField;
    quCostRepLAST_UPD_DATE: TDateTimeField;
    quCostRepSTATUS: TStringField;
    quCostRepAUTHORIED_BY: TStringField;
    quCostRepCOMMENT: TBlobField;
    quCostRepSUB_JOB_CAT: TStringField;
    quCostRepPHOTO: TBlobField;
    quCostRepDESCRIPTION: TStringField;
    quCostRepSUB_JOB_NO: TStringField;
    quCostRepQUOT_LINE_NO: TStringField;
    quCostRepUNIT: TStringField;
    quCostRepJOB_NO_1: TStringField;
    quCostRepLINE_NO_1: TIntegerField;
    quCostRepCOST_CAT: TStringField;
    quCostRepBUDGET_QTY: TBCDField;
    quCostRepBUDGET_AMT: TBCDField;
    quCostRepACTUAL_QTY: TBCDField;
    quCostRepACTUAL_AMT: TBCDField;
    quCostRepSTD_QTY: TBCDField;
    quCostRepSTD_AMOUNT: TBCDField;
    quCostRepSECTION_NO: TStringField;
    quCostRepQUOT_ITEM_NO: TStringField;
    quCostRepQTY_UNIT: TStringField;
    quCostRepDESCRIPTION_1: TStringField;
    quJobDescDESCRIPTION: TStringField;
    taCategory: TwwTable;
    dsCategory: TwwDataSource;
    taCategoryCATEGORY: TStringField;
    taCategoryDESCRIPTION: TStringField;
    quSubJob: TwwQuery;
    dsSubJob: TwwDataSource;
    quSubJobJOB_NO: TStringField;
    quSubJobLINE_NO: TIntegerField;
    quSubJobQTY: TBCDField;
    quSubJobJLENGTH: TBCDField;
    quSubJobJWIDTH: TBCDField;
    quSubJobJHEIGHT: TBCDField;
    quSubJobLAST_UPD_DATE: TDateTimeField;
    quSubJobSTATUS: TStringField;
    quSubJobAUTHORIED_BY: TStringField;
    quSubJobCOMMENT: TBlobField;
    quSubJobSUB_JOB_CAT: TStringField;
    quSubJobPHOTO: TBlobField;
    quSubJobDESCRIPTION: TStringField;
    quSubJobSUB_JOB_NO: TStringField;
    quSubJobQUOT_LINE_NO: TStringField;
    quSubJobUNIT: TStringField;
    taSubJobCost: TwwTable;
    taJob: TwwTable;
    taJobJOB_NO: TStringField;
    taJobDESCRIPTION: TStringField;
    taJobQUOT_NO: TStringField;
    taJobKEYWORD: TStringField;
    taSubJob: TwwTable;
    quJob: TwwQuery;
    dsJob: TwwDataSource;
    quJobJOB_NO: TStringField;
    quJobDESCRIPTION: TStringField;
    quJobQUOT_NO: TStringField;
    quJobKEYWORD: TStringField;
    taSubJobCostJOB_NO: TStringField;
    taSubJobCostLINE_NO: TIntegerField;
    taSubJobCostCOST_CAT: TStringField;
    taSubJobCostBUDGET_QTY: TBCDField;
    taSubJobCostBUDGET_AMT: TBCDField;
    taSubJobCostACTUAL_QTY: TBCDField;
    taSubJobCostACTUAL_AMT: TBCDField;
    taSubJobCostSTD_QTY: TBCDField;
    taSubJobCostSTD_AMOUNT: TBCDField;
    taSubJobCostSECTION_NO: TStringField;
    taSubJobCostQUOT_ITEM_NO: TStringField;
    taSubJobCostQTY_UNIT: TStringField;
    taSubJobCostDESCRIPTION: TStringField;
    quLibCatDescDESCRIPTION: TStringField;
    taSubJobCostCATEGORY: TStringField;
    quSJCCostcatJOB_NO: TStringField;
    quSJCCostcatLINE_NO: TIntegerField;
    quSJCCostcatCOST_CAT: TStringField;
    quSJCCostcatBUDGET_QTY: TBCDField;
    quSJCCostcatBUDGET_AMT: TBCDField;
    quSJCCostcatACTUAL_QTY: TBCDField;
    quSJCCostcatACTUAL_AMT: TBCDField;
    quSJCCostcatSTD_QTY: TBCDField;
    quSJCCostcatSTD_AMOUNT: TBCDField;
    quSJCCostcatSECTION_NO: TStringField;
    quSJCCostcatQUOT_ITEM_NO: TStringField;
    quSJCCostcatQTY_UNIT: TStringField;
    quSJCCostcatDESCRIPTION: TStringField;
    quSJCCostcatCATEGORY: TStringField;
    quSJLineNoLINE_NO: TIntegerField;
    quCostRepCATEGORY: TStringField;
    dbIECTData: TDatabase;
    quSumRep: TwwQuery;
    quSumRepJOB_NO: TStringField;
    quSumRepCOST_CAT: TStringField;
    quSumRepBUDGET_QTY: TBCDField;
    quSumRepBUDGET_AMT: TBCDField;
    quSumRepACTUAL_QTY: TBCDField;
    quSumRepACTUAL_AMT: TBCDField;
    quSumRepSTD_QTY: TBCDField;
    quSumRepSTD_AMT: TBCDField;
    quSumRepJob_Desc: TStringField;
    quSumRepLibCatDesc: TStringField;
    quSumRepUNIT: TStringField;
    quLibCatDescQUOT_UNIT: TStringField;
    quSumRepSECTION_NO: TStringField;
    usCategory: TUpdateSQL;
    usSubJob: TUpdateSQL;
    quSltCostCatQtyRep: TwwQuery;
    quSltCostCatAmtRep: TwwQuery;
    quSltCostCatAmtRepJOB_NO: TStringField;
    quSltCostCatAmtRepDESCRIPTION: TStringField;
    quSltCostCatAmtRepDESCRIPTION_1: TStringField;
    quSltCostCatAmtRepOJOBNO: TStringField;
    quSltCostCatAmtRepOLINENO: TIntegerField;
    quSltCostCatAmtRepOQTY: TIntegerField;
    quSltCostCatAmtRepOCOST_CAT1_BUD_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT1_ACT_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT1_STD_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT2_BUD_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT2_ACT_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT2_STD_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT3_BUD_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT3_ACT_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT3_STD_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT4_BUD_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT4_ACT_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT4_STD_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT5_BUD_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT5_ACT_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT5_STD_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT6_BUD_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT6_ACT_AMT: TBCDField;
    quSltCostCatAmtRepOCOST_CAT6_STD_AMT: TBCDField;
    quSltCostCatQtyRepJOB_NO: TStringField;
    quSltCostCatQtyRepDESCRIPTION: TStringField;
    quSltCostCatQtyRepDESCRIPTION_1: TStringField;
    quSltCostCatQtyRepOJOBNO: TStringField;
    quSltCostCatQtyRepOLINENO: TIntegerField;
    quSltCostCatQtyRepOQTY: TIntegerField;
    quSltCostCatQtyRepOCOST_CAT1_BUD_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT1_ACT_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT1_STD_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT2_BUD_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT2_ACT_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT2_STD_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT3_BUD_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT3_ACT_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT3_STD_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT4_BUD_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT4_ACT_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT4_STD_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT5_BUD_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT5_ACT_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT5_STD_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT6_BUD_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT6_ACT_QTY: TBCDField;
    quSltCostCatQtyRepOCOST_CAT6_STD_QTY: TBCDField;
    quCostRepCREATED_BY: TStringField;
    quRepSeleJob: TwwQuery;
    dsRepSeleJob: TwwDataSource;
    quRepSeleJobJOB_NO: TStringField;
    quRepSeleJobDESCRIPTION: TStringField;
    quRepSeleSubJob: TwwQuery;
    quRepSeleSubJobJOB_NO: TStringField;
    quRepSeleSubJobLINE_NO: TIntegerField;
    quRepSeleSubJobDESCRIPTION: TStringField;
    dsRepSeleSubJob: TwwDataSource;
    quRepSeleSubJobCOMMENT: TBlobField;
    quRepJob: TwwQuery;
    dsRepJob: TwwDataSource;
    quRepJobJOB_NO: TStringField;
    quRepJobDESCRIPTION: TStringField;
    quRepWorkDone: TwwQuery;
    quSelectItemSumryCat: TwwQuery;
    quRepWorkDoneCALCU_PRE: TStringField;
    quRepWorkDoneBUDGET_PRE: TStringField;
    quRepWorkDoneDescription: TStringField;
    quRepWorkDoneQTY_Unit: TStringField;
    quRepJobCOMMENT: TMemoField;
    quRepJobSTATUS: TStringField;
    quSelectItemSumryCatITEM_SUMRY_CAT: TStringField;
    quSelectItemSumryCatDESCRIPTION: TStringField;
    quSelectItemSumryCatITEM_SUMRY_UNIT: TStringField;
    dsSeleItemSumryCat: TwwDataSource;
    quSJCCostcatITEM_SUMRY_CAT: TStringField;
    taSubJobCostITEM_SUMRY_CAT: TStringField;
    quRepWorkDoneOJOB_NO: TStringField;
    quRepWorkDoneOSECTION_NO: TStringField;
    quRepWorkDoneOITEM_SUMRY_CAT: TStringField;
    quRepWorkDoneOSUM_BUG_QTY: TBCDField;
    quRepWorkDoneOSUM_BUG_AMT: TBCDField;
    quRepWorkDoneOSUM_ACT_QTY: TBCDField;
    quRepWorkDoneOSUM_ACT_AMT: TBCDField;
    quRepWorkDoneOSUM_STD_QTY: TBCDField;
    quRepWorkDoneOSUM_STD_AMT: TBCDField;
    quRepItemSryCat: TwwQuery;
    quRepItemSryCatITEM_SUMRY_CAT: TStringField;
    quRepItemSryCatDESCRIPTION: TStringField;
    quRepItemSryCatITEM_SUMRY_UNIT: TStringField;
    quJobSTATUS: TStringField;
    quJobCOMMENT: TMemoField;
    procedure quCostRepCalcFields(DataSet: TDataSet);
    procedure quSubJobAfterInsert(DataSet: TDataSet);
    procedure quSubJobBeforePost(DataSet: TDataSet);
    procedure quSubJobPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure quSubJobUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure quJobAfterPost(DataSet: TDataSet);
    procedure quSubJobAfterPost(DataSet: TDataSet);
    procedure quSumRepCalcFields(DataSet: TDataSet);
    procedure quRepWorkDoneCalcFields(DataSet: TDataSet);
    procedure quSelectItemSumryCatAfterPost(DataSet: TDataSet);
    procedure quSelectItemSumryCatAfterDelete(DataSet: TDataSet);
    procedure quSelectItemSumryCatBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    UserID : string;
    { Public declarations }
  end;

var
  dmCost: TdmCost;

implementation

uses Subjobct, subjob,  category, ctmain, SJEdit;


{$R *.DFM}

procedure TdmCost.quCostRepCalcFields(DataSet: TDataSet);
begin
  with quJobDesc do
  begin
    if Active then
       Active := False;
    ParamByName('iJobNo').Value := quCostRep.FieldValues['Job_No'];
    Active := True;
    if RecordCount > 1 then
      quCostRep.FieldByName('Job_Desc').Value := FieldValues['Description'];
  end;
  with quLibCatDesc do
  begin
    if Active then
       Active := False;
    ParamByName('iCostCat').Value := quCostRep.FieldValues['Cost_Cat'];
    Active := True;
    if RecordCount > 1 then
      quCostRep.FieldByName('LibCatDesc').Value := FieldValues['Description'];
  end;
end;

procedure TdmCost.quSubJobAfterInsert(DataSet: TDataSet);
begin
  with  qusubjob do
  begin
    Fieldbyname('Job_No').value := trim(fmSubJob.dejobno.text);
    FieldByName('Status').Value := 'W';
  end;
end;

procedure TdmCost.quSubJobBeforePost(DataSet: TDataSet);
begin
  with quSubjob do
  begin
    if fmSJEdit.dbrgStatus.Value = 'C' then
    begin
      if (quSubJobLAST_UPD_DATE.IsNull) then
      begin
        showmessage('<确認日期>錯誤');
        Abort;
      end;
      FieldByName('AUTHORIED_BY').Value := wUser;
    end
    else
    begin
      FieldByName('AUTHORIED_BY').Value := '';
      FieldByName('Last_Upd_Date').Value := Null;
    end;
  end;
end;

procedure TdmCost.quSubJobPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
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

procedure TdmCost.quSubJobUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
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

procedure TdmCost.quJobAfterPost(DataSet: TDataSet);
begin
  with quJob do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    ShowMessage('未能夠更新記錄');
  end;
end;

procedure TdmCost.quSubJobAfterPost(DataSet: TDataSet);
begin
  with quSubJob do
  begin
    try
      ApplyUpdates;
      CommitUpdates;
    except
      showmessage('未能更新記錄');
    end;
  end;
end;

procedure TdmCost.quSumRepCalcFields(DataSet: TDataSet);
begin
  with quJobDesc do
  begin
    if Active then
       Active := False;
    ParamByName('iJobNo').Value := trim(quSumRepJOB_NO.AsString);
    Active := True;
    if RecordCount > 0 then
    begin
      First;
      if trim(quJobDescDESCRIPTION.AsString) <> '' then
        quSumRepJob_Desc.AsString := trim(quJobDescDESCRIPTION.AsString);
    end;
  end;
  with quLibCatDesc do
  begin
    if Active then
       Active := False;
    ParamByName('iCostCat').Value := trim(quSumRepCOST_CAT.AsString);
    Active := True;
    if RecordCount > 0 then
    begin
      First;
      if trim(quLibCatDescDESCRIPTION.AsString) <> '' then
        quSumRepLibCatDesc.AsString := trim(quLibCatDescDESCRIPTION.AsString);
      if trim(quLibCatDescQUOT_UNIT.AsString) <> '' then
        quSumRepUNIT.AsString := trim(quLibCatDescQUOT_UNIT.AsString);
    end;
  end;
end;

procedure TdmCost.quRepWorkDoneCalcFields(DataSet: TDataSet);
begin
  if quRepWorkDoneOSUM_BUG_QTY.AsFloat = 0 then
    quRepWorkDoneCALCU_PRE.AsString := '不能計算'
  else
  begin
    quRepWorkDoneCALCU_PRE.AsString :=
      FloatToStr(round(((quRepWorkDoneOSUM_ACT_QTY.AsFloat -
      quRepWorkDoneOSUM_BUG_QTY.AsFloat)/quRepWorkDoneOSUM_BUG_QTY.AsFloat) *1000)/10);
  end;
  if quRepWorkDoneOSUM_STD_QTY.AsFloat = 0 then
    quRepWorkDoneBUDGET_PRE.AsString := '不能計算'
  else
  begin
    quRepWorkDoneBUDGET_PRE.AsString :=
      FloatToStr(round(((quRepWorkDoneOSUM_ACT_QTY.AsFloat -
      quRepWorkDoneOSUM_STD_QTY.AsFloat)/quRepWorkDoneOSUM_STD_QTY.AsFloat) *1000)/10);
  end;
end;

procedure TdmCost.quSelectItemSumryCatAfterPost(DataSet: TDataSet);
begin
  Try
    with quSelectItemSumryCat do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    ShowMessage('不能更新數据!');
  end;
end;

procedure TdmCost.quSelectItemSumryCatAfterDelete(DataSet: TDataSet);
begin
  Try
    with quSelectItemSumryCat do
    begin
      CommitUpdates;
      ApplyUpdates;
    end;
  except
    ShowMessage('不能刪除');
  end;
end;

procedure TdmCost.quSelectItemSumryCatBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('証實刪除.  刪除么?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Abort;
end;

end.

