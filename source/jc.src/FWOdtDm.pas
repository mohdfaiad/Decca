unit FWOdtDm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwdatsrc, Wwquery;

type
  TdmJCFWO = class(TDataModule)
    usFWO_Cost_Cat: TUpdateSQL;
    usFWO_Cost_Analysis: TUpdateSQL;
    quFWO_Cost_Cat: TwwQuery;
    dsFWO_Cost_Cat: TwwDataSource;
    quFWO_Cost_Analysis: TwwQuery;
    dsFWO_Cost_Analysis: TwwDataSource;
    quFWO_Cost_AnalysisFWO_NO: TStringField;
    quFWO_Cost_AnalysisQUOT_ITEM_NO: TStringField;
    quFWO_Cost_AnalysisDESCRIPTION: TStringField;
    quFWO_Cost_AnalysisQUOT_ITEM_UNIT: TStringField;
    quFWO_Cost_AnalysisSECTION_NO: TStringField;
    dsSeleSub_FWO: TwwDataSource;
    quSeleSub_FWO: TwwQuery;
    quSeleSub_FWOOSUB_NO: TStringField;
    quSeleSub_FWOOFWO_NO: TStringField;
    quSeleSub_FWOOSTATUS: TStringField;
    quSeleSub_FWOODESCRIPTION: TStringField;
    quSeleSub_FWOOQUOT_NO: TStringField;
    quSeleSub_FWOJOB_NO: TStringField;
    quFWO_Photo: TwwQuery;
    dsFWO_Photo: TwwDataSource;
    usFWO_Photo: TUpdateSQL;
    quFWO_PhotoFWO_NO: TStringField;
    quFWO_PhotoSTATUS: TStringField;
    quFWO_PhotoSUB_JOB_NO: TStringField;
    quFWO_PhotoDESCRIPTION: TStringField;
    quFWO_PhotoCREATED_BY: TStringField;
    quFWO_PhotoCREATE_DATE: TDateTimeField;
    quFWO_PhotoFWO_LENGTH: TBCDField;
    quFWO_PhotoFWO_WIDTH: TBCDField;
    quFWO_PhotoFWO_HEIGHT: TBCDField;
    quFWO_PhotoFWO_UNIT: TStringField;
    quFWO_PhotoCOMMENT: TMemoField;
    quFWO_PhotoFWO_CAT: TStringField;
    quFWO_PhotoPHOTO: TMemoField;
    quFWO_PhotoCHECKED_BY: TStringField;
    quFWO_PhotoCHECK_DATE: TDateTimeField;
    quFWO_PhotoQUOT_NO: TStringField;
    quFWO_PhotoUPDATE_SJ_BUDGET: TStringField;
    quFWO_PhotoPRODUCT_CODE: TStringField;
    quFWO_Cost_AnalysisBUDGET_AMT: TBCDField;
    quFWO_Cost_AnalysisACTUAL_AMT: TBCDField;
    quFWO_PhotoFWO_QTY: TBCDField;
    quRepSeleJob: TwwQuery;
    quRepSeleJobDESCRIPTION: TStringField;
    quRepSeleJobJOB_STATUS: TStringField;
    quRepSeleJobJOB_TYPE: TStringField;
    quRepSeleJobBILL_CURRENCY: TStringField;
    quRepSeleJobCOST_CURRENCY: TStringField;
    quRepSeleJobLST_EST_DATE: TDateTimeField;
    quRepSeleJobJOB_END_DATE: TDateTimeField;
    quRepSeleJobINCHARGE_PERSON: TStringField;
    quRepSeleJobCREATE_DATE: TDateTimeField;
    quRepSeleJobCREATED_BY: TStringField;
    quRepSeleJobCUSTOMER_NO: TStringField;
    quRepSeleJobBILL_AC: TStringField;
    quRepSeleJobBILL_PROFIT_CTR_1: TStringField;
    quRepSeleJobBILL_PROFIT_CTR_2: TStringField;
    quRepSeleJobCOMMENT: TMemoField;
    quRepSeleJobJob_No: TStringField;
    dsRepSeleJob: TwwDataSource;
    quGetJobToRep: TwwQuery;
    quGetJobToRepDESCRIPTION: TStringField;
    quGetJobToRepJOB_STATUS: TStringField;
    quGetJobToRepJOB_TYPE: TStringField;
    quGetJobToRepBILL_CURRENCY: TStringField;
    quGetJobToRepCOST_CURRENCY: TStringField;
    quGetJobToRepLST_EST_DATE: TDateTimeField;
    quGetJobToRepJOB_END_DATE: TDateTimeField;
    quGetJobToRepINCHARGE_PERSON: TStringField;
    quGetJobToRepCREATE_DATE: TDateTimeField;
    quGetJobToRepCREATED_BY: TStringField;
    quGetJobToRepCUSTOMER_NO: TStringField;
    quGetJobToRepBILL_AC: TStringField;
    quGetJobToRepBILL_PROFIT_CTR_1: TStringField;
    quGetJobToRepBILL_PROFIT_CTR_2: TStringField;
    quGetJobToRepCOMMENT: TMemoField;
    quGetJobToRepJob_No: TStringField;
    dsGetJobToRep: TwwDataSource;
    quGetJobToSubRep: TwwQuery;
    quGetJobToSubRepSUB_JOB_NO: TStringField;
    quGetJobToSubRepJOB_COST_CAT_UNIT: TStringField;
    quGetJobToSubRepREG_RATE: TBCDField;
    quGetJobToSubRepPREM_RATE: TBCDField;
    quGetJobToSubRepBUDGET_AMT: TBCDField;
    quGetJobToSubRepJOB_PREM_AMT: TBCDField;
    quGetJobToSubRepJOB_REG_AMT: TBCDField;
    quRepSubDescr: TwwQuery;
    dsGetJobToSubRep: TwwDataSource;
    quRepSubDescrSUB_JOB_NO: TStringField;
    quRepSubDescrDESCRIPTION: TStringField;
    quRepContractaSon: TwwQuery;
    quRepSelCostCat: TwwQuery;
    quRepSelCostCatFWO_NO: TStringField;
    quRepSelCostCatJOB_COST_CAT: TStringField;
    quRepSelCostCatlcJobCostCat: TStringField;
    quRepJobFWO: TwwQuery;
    dsRepJobFWO: TwwDataSource;
    quRepFWOCost: TwwQuery;
    quRepFWOCostFWO_NO: TStringField;
    quRepFWOCostJOB_COST_CAT: TStringField;
    quRepFWOCostJOB_COST_CAT_UNIT: TStringField;
    quRepFWOCostREG_RATE: TBCDField;
    quRepFWOCostPREM_RATE: TBCDField;
    quRepFWOCostBUDGET_AMT: TBCDField;
    quRepFWOCostBUDGET_QTY: TBCDField;
    quRepFWOCostJOB_REG_QTY: TFloatField;
    quRepFWOCostJOB_PREM_QTY: TFloatField;
    quRepFWOCostJOB_REG_AMT: TBCDField;
    quRepFWOCostJOB_PREM_AMT: TBCDField;
    quRepGetCostCat: TwwQuery;
    quRepSelFwoSub: TwwQuery;
    quRepSelFwoSubSUB_JOB_NO: TStringField;
    quRepSelFwoSubcalSubDescr: TStringField;
    quRepSelSubFwo: TwwQuery;
    quRepSelSubFwoFWO_NO: TStringField;
    quRepSelSubFwoJOB_NO_1: TStringField;
    quRepSelSubFwoJOB_NO_2: TStringField;
    quRepSelSubFwocalFwoDescr: TStringField;
    quRepGetFwo: TwwQuery;
    quRepFwoItem: TwwQuery;
    quRepFwoItemFWO_NO: TStringField;
    quRepFwoItemITEM_NO: TStringField;
    quRepFwoItemITEM_UNIT: TStringField;
    quRepFwoItemDETAIL_QTY: TFloatField;
    quRepFwoItemDETAIL_AMT: TBCDField;
    quRepGetSubNo: TwwQuery;
    quRepGetSubNoSUB_JOB_NO: TStringField;
    quRepGetSubNoDESCRIPTION: TStringField;
    quRepSubCat: TwwQuery;
    quRepSubCatSUB_JOB_NO: TStringField;
    quRepSubCatJOB_COST_CAT_UNIT: TStringField;
    quRepSubCatREG_RATE: TBCDField;
    quRepSubCatPREM_RATE: TBCDField;
    quRepSubCatBUDGET_AMT: TBCDField;
    quRepSubCatDRAFT_BUDGET_AMT: TBCDField;
    quRepSubCatDRAFT_BUDGET_QTY: TBCDField;
    quRepSubCatJOB_PREM_AMT: TBCDField;
    quRepSubCatJOB_REG_AMT: TBCDField;
    quRepJobCostFather: TwwQuery;
    quRepJobCostSon: TwwQuery;
    dsRepJobCostFather: TwwDataSource;
    quRepGetFwoFWO_NO: TStringField;
    quRepGetFwoSUB_JOB_NO: TStringField;
    quRepGetCostCatList: TwwQuery;
    quRepGetCostCatListJOB_COST_CAT: TStringField;
    quRepFwoTotal: TwwQuery;
    quRepFwoNoTotal: TwwQuery;
    quRepGetJobCostCat: TwwQuery;
    quRepGetJobCostCatJOB_COST_CAT: TStringField;
    quRepJobFatherCat: TwwQuery;
    dsRepJobFatherCat: TwwDataSource;
    quRepJobSunCat: TwwQuery;
    quRepJobCostFatherSUB_JOB_NO: TStringField;
    quRepJobCostSonSUB_JOB_NO: TStringField;
    quRepJobCostSonSUB_JOB_COST_CAT: TStringField;
    quRepJobCostSonJOB_COST_CAT_UNIT: TStringField;
    quRepJobCostSonREG_RATE: TBCDField;
    quRepJobCostSonPREM_RATE: TBCDField;
    quRepJobCostSonBUDGET_AMT: TBCDField;
    quRepJobCostSonBUDGET_QTY: TFloatField;
    quRepJobCostSonJOB_REG_QTY: TFloatField;
    quRepJobCostSonJOB_PREM_QTY: TFloatField;
    quRepJobCostSonDRAFT_BUDGET_AMT: TBCDField;
    quRepJobCostSonDRAFT_BUDGET_QTY: TBCDField;
    quRepJobCostSonJOB_PREM_AMT: TBCDField;
    quRepJobCostSonJOB_REG_AMT: TBCDField;
    quRepJobSunCatSUB_JOB_NO: TStringField;
    quRepJobSunCatSUB_JOB_COST_CAT: TStringField;
    quRepJobSunCatJOB_COST_CAT_UNIT: TStringField;
    quRepJobSunCatREG_RATE: TBCDField;
    quRepJobSunCatPREM_RATE: TBCDField;
    quRepJobSunCatBUDGET_AMT: TBCDField;
    quRepJobSunCatBUDGET_QTY: TFloatField;
    quRepJobSunCatJOB_REG_QTY: TFloatField;
    quRepJobSunCatJOB_PREM_QTY: TFloatField;
    quRepJobSunCatDRAFT_BUDGET_AMT: TBCDField;
    quRepJobSunCatDRAFT_BUDGET_QTY: TBCDField;
    quRepJobSunCatJOB_PREM_AMT: TBCDField;
    quRepJobSunCatJOB_REG_AMT: TBCDField;
    dsRepGetSubNo: TwwDataSource;
    dsRepContractFather: TwwDataSource;
    quRepContractFather: TwwQuery;
    quRepContractFatherDESCRIPTION: TStringField;
    quRepContractaSonDESCRIPTION: TStringField;
    quRepContractaSonVENDOR_NO: TStringField;
    quRepContractaSonCONTRACT_SUM: TBCDField;
    quRepContractaSonRETENTION_AMT: TBCDField;
    quRepContractaSonWORKDONE_AMT: TBCDField;
    quRepContractaSonPAID_AMT: TBCDField;
    quRepContractaSonSORTSUBNAME: TStringField;
    quRepContractFatherSORTNAME: TStringField;
    quSeleSub_FWOOJOB_NO_1: TStringField;
    quSeleSub_FWOOJOB_NO_2: TStringField;
    quFWO_Cost_AnalysisJOB_NO_1: TStringField;
    quFWO_Cost_AnalysisJOB_NO_2: TStringField;
    quFWO_PhotoJOB_NO_1: TStringField;
    quFWO_PhotoJOB_NO_2: TStringField;
    quGetJobToRepJOB_NO_1: TStringField;
    quGetJobToRepJOB_NO_2: TStringField;
    quGetJobToRepTERRITORY: TStringField;
    quRepSeleJobJOB_NO_1: TStringField;
    quRepSeleJobJOB_NO_2: TStringField;
    quRepSeleJobTERRITORY: TStringField;
    quGetJobToSubRepJOB_NO_1: TStringField;
    quGetJobToSubRepJOB_NO_2: TStringField;
    quRepGetSubNoJOB_NO_1: TStringField;
    quRepGetSubNoJOB_NO_2: TStringField;
    quRepContractFatherJOB_NO_1: TStringField;
    quRepContractFatherJOB_NO_2: TStringField;
    quRepSelFwoSubJOB_NO_1: TStringField;
    quRepSelFwoSubJOB_NO_2: TStringField;
    quRepJobFatherCatJOB_NO_1: TStringField;
    quRepJobFatherCatJOB_NO_2: TStringField;
    quRepJobCostFatherJOB_NO_1: TStringField;
    quRepJobCostFatherJOB_NO_2: TStringField;
    quRepSubDescrJOB_NO_1: TStringField;
    quRepSubDescrJOB_NO_2: TStringField;
    quRepFwoNoTotalJOB_NO_1: TStringField;
    quRepFwoNoTotalJOB_NO_2: TStringField;
    quRepFwoNoTotalFWO_NO: TStringField;
    quRepFwoNoTotalJOB_REG_AMT: TBCDField;
    quRepFwoNoTotalJOB_PREM_AMT: TBCDField;
    quRepJobCostSonJOB_NO_1: TStringField;
    quRepJobCostSonJOB_NO_2: TStringField;
    quRepSubCatJOB_NO_1: TStringField;
    quRepSubCatJOB_NO_2: TStringField;
    quRepContractaSonJOB_NO_1: TStringField;
    quRepContractaSonJOB_NO_2: TStringField;
    quRepSelCostCatJOB_NO_1: TStringField;
    quRepSelCostCatJOB_NO_2: TStringField;
    quRepGetCostCatJOB_COST_CAT: TStringField;
    quRepGetCostCatJOB_NO_1: TStringField;
    quRepGetCostCatFWO_NO: TStringField;
    quRepGetCostCatJOB_NO_2: TStringField;
    quRepFwoItemJOB_NO_1: TStringField;
    quRepFwoItemJOB_NO_2: TStringField;
    quRepGetFwoJOB_NO_1: TStringField;
    quRepGetFwoJOB_NO_2: TStringField;
    quRepFWOCostJOB_NO_1: TStringField;
    quRepFWOCostJOB_NO_2: TStringField;
    quRepGetJobCostCatJOB_NO_1: TStringField;
    quRepGetJobCostCatJOB_NO_2: TStringField;
    quRepGetJobCostCatFWO_NO: TStringField;
    quRepJobSunCatJOB_NO_1: TStringField;
    quRepJobSunCatJOB_NO_2: TStringField;
    quRepJobFatherCatJOB_COST_CAT: TStringField;
    quRepSubCatJOB_COST_CAT: TStringField;
    quFWO_Cost_AnalysisSTD_AMT: TBCDField;
    quFWO_Cost_AnalysisBUDGET_QTY: TBCDField;
    quFWO_Cost_AnalysisACTUAL_QTY: TBCDField;
    quFWO_Cost_AnalysisSTD_QTY: TBCDField;
    quGetJobToSubRepBUDGET_QTY: TBCDField;
    quGetJobToSubRepJOB_REG_QTY: TBCDField;
    quGetJobToSubRepJOB_PREM_QTY: TBCDField;
    quRepFwoNoTotalJOB_REG_QTY: TBCDField;
    quRepFwoNoTotalJOB_PREM_QTY: TBCDField;
    quRepSubCatJOB_REG_QTY: TBCDField;
    quRepSubCatJOB_PREM_QTY: TBCDField;
    quRepSubCatBUDGET_QTY: TBCDField;
    quFWO_Cost_CatJOB_NO_1: TStringField;
    quFWO_Cost_CatJOB_NO_2: TStringField;
    quFWO_Cost_CatFWO_NO: TStringField;
    quFWO_Cost_CatJOB_COST_CAT: TStringField;
    quFWO_Cost_CatJOB_COST_CAT_UNIT: TStringField;
    quFWO_Cost_CatREG_RATE: TBCDField;
    quFWO_Cost_CatPREM_RATE: TBCDField;
    quFWO_Cost_CatBUDGET_AMT: TBCDField;
    quFWO_Cost_CatBUDGET_QTY: TBCDField;
    quFWO_Cost_CatJOB_REG_AMT: TBCDField;
    quFWO_Cost_CatJOB_PREM_AMT: TBCDField;
    quFWO_Cost_CatFIRST_DATE: TDateTimeField;
    quFWO_Cost_CatCOMPLETE_PERCENT: TBCDField;
    quFWO_Cost_CatCOMPLETE_DATE: TDateTimeField;
    quFWO_Cost_CatSUB_JOB_NO: TStringField;
    quFWO_Cost_CatJOB_REG_QTY: TBCDField;
    quFWO_Cost_CatJOB_PREM_QTY: TBCDField;
    quFWO_Cost_CatLAST_DATE: TDateTimeField;
    procedure quFWO_Cost_AnalysisNewRecord(DataSet: TDataSet);
    procedure quFWO_Cost_AnalysisBeforeDelete(DataSet: TDataSet);
    procedure quSeleSub_FWOBeforeOpen(DataSet: TDataSet);
    procedure quSeleSub_FWOCalcFields(DataSet: TDataSet);
    procedure quFWO_Cost_AnalysisBeforePost(DataSet: TDataSet);
    procedure quFWO_Cost_AnalysisAfterPost(DataSet: TDataSet);
    procedure quFWO_PhotoAfterPost(DataSet: TDataSet);
    procedure quFWO_PhotoNewRecord(DataSet: TDataSet);
    procedure quFWO_Cost_CatAfterPost(DataSet: TDataSet);
    procedure quRepSeleJobCalcFields(DataSet: TDataSet);
    procedure quGetJobToRepCalcFields(DataSet: TDataSet);
    procedure quFWO_Cost_CatNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmJCFWO: TdmJCFWO;

implementation
  uses jcdatadm, JCMain;
{$R *.DFM}

procedure TdmJCFWO.quFWO_Cost_AnalysisNewRecord(DataSet: TDataSet);
begin
  quFWO_Cost_AnalysisJOB_NO_1.AsString := quSeleSub_FWOOJOB_NO_1.AsString ;
  quFWO_Cost_AnalysisJOB_NO_2.AsString := quSeleSub_FWOOJOB_NO_2.AsString;
  quFWO_Cost_AnalysisFWO_NO.AsString := quSeleSub_FWOOFWO_NO.AsString;
  quFWO_Cost_AnalysisBUDGET_QTY.AsFloat := 0.0;
  quFWO_Cost_AnalysisBUDGET_AMT.AsFloat := 0.0;
  quFWO_Cost_AnalysisACTUAL_QTY.AsFloat := 0.0;
  quFWO_Cost_AnalysisACTUAL_AMT.AsFloat := 0.0;
  quFWO_Cost_AnalysisSTD_QTY.AsFloat := 0.0;
end;

procedure TdmJCFWO.quFWO_Cost_AnalysisBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('确實要刪除么?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Abort;
end;

procedure TdmJCFWO.quSeleSub_FWOBeforeOpen(DataSet: TDataSet);
begin
  with dmJCdata do
  begin
    with quSeleSub_FWO do
    begin
      ParamByName('iJobNo1').AsString := quSelectJobOJOB_NO_1.AsString;
      ParamByName('iJobNo2').AsString := quSelectJobOJOB_NO_2.AsString;
    end;
  end;
end;

procedure TdmJCFWO.quSeleSub_FWOCalcFields(DataSet: TDataSet);
begin
  if (gUseJobNo2 = 'Y') and
     (trim(quSeleSub_FWOOJOB_NO_2.AsString) <> '') then
    quSeleSub_FWOJOB_NO.AsString := quSeleSub_FWOOJOB_NO_1.AsString
                                  + '-' + quSeleSub_FWOOJOB_NO_2.AsString
  else
    quSeleSub_FWOJOB_NO.AsString := quSeleSub_FWOOJOB_NO_1.AsString;

end;

procedure TdmJCFWO.quFWO_Cost_AnalysisBeforePost(DataSet: TDataSet);
begin
  quFWO_Cost_AnalysisQUOT_ITEM_NO.AsString :=
    UpperCase(quFWO_Cost_AnalysisQUOT_ITEM_NO.AsString);
  quFWO_Cost_AnalysisSECTION_NO.AsString :=
    UpperCase(quFWO_Cost_AnalysisSECTION_NO.AsString);
  quFWO_Cost_AnalysisQUOT_ITEM_UNIT.AsString :=
    UpperCase(quFWO_Cost_AnalysisQUOT_ITEM_UNIT.AsString);
end;

procedure TdmJCFWO.quFWO_Cost_AnalysisAfterPost(DataSet: TDataSet);
begin
  try
    with quFWO_Cost_Analysis do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TdmJCFWO.quFWO_PhotoAfterPost(DataSet: TDataSet);
begin
  try
    with quFWO_Photo do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TdmJCFWO.quFWO_PhotoNewRecord(DataSet: TDataSet);
begin
  quFWO_PhotoJOB_NO_1.AsString
    := quSeleSub_FWOOJOB_NO_1.AsString;
  quFWO_PhotoJOB_NO_2.AsString
    := quSeleSub_FWOOJOB_NO_2.AsString;
  quFWO_PhotoCREATED_BY.AsString
    := dmJCdata.dbJCdata.Params.Values['USER NAME'];
  quFWO_PhotoCREATE_DATE.AsDateTime := date;
  quFWO_PhotoSUB_JOB_NO.AsString
    := quSeleSub_FWOOSUB_NO.AsString;
  quFWO_PhotoFWO_NO.AsString := ' ';
  quFWO_PhotoSTATUS.AsString := 'A';
  quFWO_PhotoFWO_QTY.AsFloat := 1.0;
  quFWO_PhotoFWO_LENGTH.AsFloat := 0.0;
  quFWO_PhotoFWO_WIDTH.AsFloat := 0.0;
  quFWO_PhotoFWO_HEIGHT.AsFloat := 0.0;
end;

procedure TdmJCFWO.quFWO_Cost_CatAfterPost(DataSet: TDataSet);
begin
  try
    with quFWO_Cost_Cat do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('編號重复,記錄不能更新,數据無效');
  end;
end;

procedure TdmJCFWO.quRepSeleJobCalcFields(DataSet: TDataSet);
begin
  qurepselejobjob_no.AsString
    :=quRepSeleJobJOB_NO_1.AsString
      +'-'
      + quRepSeleJobJOB_NO_2.AsString;  
end;

procedure TdmJCFWO.quGetJobToRepCalcFields(DataSet: TDataSet);
begin
  quGetJobToRepjob_no.AsString := quGetJobToRepJOB_NO_1.asstring
                         +'-'
                         + quGetJobToRepJOB_NO_2.AsString;
end;

procedure TdmJCFWO.quFWO_Cost_CatNewRecord(DataSet: TDataSet);
begin
  quFWO_Cost_CatREG_RATE.AsFloat := 0.0;
  quFWO_Cost_CatPREM_RATE.AsFloat := 0.0;
  quFWO_Cost_CatBUDGET_AMT.AsFloat := 0.0;
  quFWO_Cost_CatBUDGET_QTY.AsFloat := 0.0;
  quFWO_Cost_CatJOB_REG_QTY.AsFloat := 0.0;
  quFWO_Cost_CatJOB_PREM_QTY.AsFloat := 0.0;
  quFWO_Cost_CatJOB_REG_AMT.AsFloat := 0.0;
  quFWO_Cost_CatJOB_PREM_AMT.AsFloat := 0.0;
  quFWO_Cost_CatFWO_NO.AsString
    := dmJCdata.quJOB_FWOFWO_NO.AsString;
  quFWO_Cost_CatJOB_NO_1.AsString
    :=dmJCdata.quJOB_FWOJOB_NO_1.AsString;
  quFWO_Cost_CatJOB_NO_2.AsString
    := dmJCdata.quJOB_FWOJOB_NO_2.AsString;
end;

end.
