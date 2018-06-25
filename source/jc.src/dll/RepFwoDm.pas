unit RepFwoDm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwquery;

type
  TdmRepFwo = class(TDataModule)
    quRepSelSt: TwwQuery;
    dbRepJcFwo: TDatabase;
    quRepSelStJOB_NO_1: TStringField;
    quRepSelStJOB_NO_2: TStringField;
    quRepSelStDESCRIPTION: TStringField;
    quRepSelStJob_No: TStringField;
    dsRepSel: TDataSource;
    quRepFwoPrint: TQuery;
    quRepFwoPrintJOB_NO_1: TStringField;
    quRepFwoPrintJOB_NO_2: TStringField;
    quRepFwoPrintJOB_DESCRIPTION: TStringField;
    quRepFwoPrintFWO_NO: TStringField;
    quRepFwoPrintFWO_DESCRIPTION: TStringField;
    quRepFwoPrintORDER_DATE: TDateTimeField;
    quRepFwoPrintCOMPLETION_DATE: TDateTimeField;
    quRepFwoPrintFWO_LENGTH: TBCDField;
    quRepFwoPrintFWO_WIDTH: TBCDField;
    quRepFwoPrintFWO_HEIGHT: TBCDField;
    quRepFwoPrintFWO_UNIT: TStringField;
    quRepFwoPrintJOB_NO: TStringField;
    quRepSelFwo: TwwQuery;
    quRepSelEd: TwwQuery;
    quRepSelEdJOB_NO_1: TStringField;
    quRepSelEdJOB_NO_2: TStringField;
    quRepSelEdDESCRIPTION: TStringField;
    quRepSelEdJob_No: TStringField;
    quRepSelFwoFWO_CAT: TStringField;
    quRepSelFwoDESCRIPTION: TStringField;
    quRepFwoCat: TwwQuery;
    quJCStatus: TwwQuery;
    quJCStatusOJOB_NO_1: TStringField;
    quJCStatusOJOB_NO_2: TStringField;
    quJCStatusOJOB_COST_CAT: TStringField;
    quJCStatusOJOB_COST_CAT_UNIT: TStringField;
    quJCStatusR_DETAIL_AMT: TBCDField;
    quJCStatusR_DETAIL_QTY: TBCDField;
    quJCStatusP_DETAIL_AMT: TBCDField;
    quJCStatusP_DETAIL_QTY: TBCDField;
    quJCStatusOJOB_DESCRIPTION: TStringField;
    quJCStatusOJOB_COST_CAT_DESC: TStringField;
    quJCStatusJOB_NO: TStringField;
    dbCommon: TDatabase;
    quSelFuncApproved: TQuery;
    quJCStatusAMT_TOT: TBCDField;
    quJCStatusQTY_TOT: TBCDField;
    quJCControl: TwwQuery;
    quJCControlCONTROL_KEY: TIntegerField;
    quJCControlCURR_PERIOD: TDateTimeField;
    quJCControlUSE_JOB_NO_2: TStringField;
    quJCControlJOB_NO_1_LEN: TIntegerField;
    quJCControlJOB_NO_2_LEN: TIntegerField;
    quJCControlSUB_JOB_NO_LEN: TIntegerField;
    quJCControlFWO_NO_LEN: TIntegerField;
    quJCControlLST_PERIOD: TDateTimeField;
    quJCControlUSE_RETAIN_AP: TStringField;
    quJCControlUSE_RETAIN_AR: TStringField;
    quJCControlUSER_DEF_TITLE01: TStringField;
    quJCControlUSER_DEF_TITLE02: TStringField;
    quJCControlUSER_DEF_TITLE03: TStringField;
    quJCControlUSER_DEF_TITLE04: TStringField;
    quJCControlUSER_DEF_TITLE05: TStringField;
    quJCControlUSER_DEF_TITLE06: TStringField;
    quJCControlUSER_DEF_TITLE07: TStringField;
    quJCControlUSER_DEF_TITLE08: TStringField;
    quJCControlUSER_DEF_TITLE09: TStringField;
    quJCControlUSER_DEF_TITLE10: TStringField;
    quJCControlUSE_BILL_AC_BY_JOB: TStringField;
    quJCControlBILL_AC: TStringField;
    quJCControlBILL_PROFIT_CTR_1: TStringField;
    quJCControlBILL_PROFIT_CTR_2: TStringField;
    quJCControlUSE_FIELDS: TIntegerField;
    quJCControlSITE_ID: TStringField;
    quJCControlMS_USER: TStringField;
    quJCControlMS_SITE_ID: TStringField;
    quJCControlSETUP_MODE: TStringField;
    quModule: TwwQuery;
    quModuleCOMPANY_ID: TStringField;
    quModuleMODULE_ID: TStringField;
    quModuleDATABASE_ALIAS: TStringField;
    quModuleSERVER: TStringField;
    quModulePROG_PATH: TStringField;
    quModulePROG_PATH_2: TStringField;
    quCompany: TwwQuery;
    quCompanyCOMPANY_ID: TStringField;
    quCompanyC_NAME: TStringField;
    quCompanyE_NAME: TStringField;
    quCompanyADDRESS: TStringField;
    quCompanyACTIVE_SECURITY: TStringField;
    quCompanyCOMPANY_ANIMATION: TStringField;
    quCompanyFAX: TStringField;
    quCompanyPHONE: TStringField;
    quCompanyCURRENCY: TStringField;
    quCompanyAC_LENGTH: TIntegerField;
    quCompanyUSE_PFT_CTR_1: TStringField;
    quCompanyPFT_CTR_1_LEN: TIntegerField;
    quCompanyUSE_PFT_CTR_2: TStringField;
    quCompanyPFT_CTR_2_LEN: TIntegerField;
    quCompanySITE_NO: TStringField;
    quJobFile: TwwQuery;
    quJobFileJob_No: TStringField;
    quJobFileDESCRIPTION: TStringField;
    quJobFileJOB_NO_1: TStringField;
    quJobFileJOB_NO_2: TStringField;
    quSubContract: TwwQuery;
    quSubContractSUBCONTRACT_NO: TStringField;
    quSubContractCONTRACT_TITLE: TStringField;
    quSubContractJOB_NO_1: TStringField;
    quSubContractJOB_NO_2: TStringField;
    quSubContractSUB_JOB_NO: TStringField;
    quSubContractVENDOR_NO: TStringField;
    quSubContractCONTRACT_SUM: TBCDField;
    quSubContractCONTRACT_DATE: TDateTimeField;
    quSubContractWORK_START_DATE: TDateTimeField;
    quSubContractWORK_END_DATE: TDateTimeField;
    quSubContractRETENTION_AMT: TBCDField;
    quSubContractRETENTION_LIMIT: TBCDField;
    quSubContractEST_VO_AMT: TBCDField;
    quSubContractDEPOSIT_AMT: TBCDField;
    quSubContractSTATUS: TStringField;
    quSubContractCREATED_BY: TStringField;
    quSubContractCREATE_DATE: TDateTimeField;
    quSubContractCOMMENT: TMemoField;
    quSubContractJOB_COST_CAT: TStringField;
    quSubContractTRADE: TStringField;
    quRepSubContract: TwwQuery;
    quRepSubContractSUBCONTRACT_NO: TStringField;
    quRepSubContractCERT_AMT: TBCDField;
    quRepSubContractDAYWORKS: TBCDField;
    quRepSubContractAPPLY_VO_AMT: TBCDField;
    quRepSubContractTOTAL_CUMULATIVE: TFloatField;
    quRepSubContractDEPOSIT_AMT: TBCDField;
    quRepSubContractDEDUCT_DEPOSIT: TBCDField;
    quRepSubContractTOTAL_DEDUCT: TFloatField;
    quRepSubContractRETENTION_AMT: TBCDField;
    quRepSubContractTOTAL_RETEMTION: TFloatField;
    quRepSubContractPREVISION_AMT: TBCDField;
    quRepSubContractTOTAL_CERITICATE: TFloatField;
    quSubContractJOB_NO: TStringField;
    quSubContractWORK_PERIOD: TStringField;
    quRepSubContractDate: TwwQuery;
    quCertNo: TwwQuery;
    quCertNoSUBCONTRACT_NO: TStringField;
    quCertNoAPPLY_DATE: TDateTimeField;
    quCertNoINVC_NO: TStringField;
    quCertNoCERT_NO: TStringField;
    quRepSubContractDateSUBCONTRACT_NO: TStringField;
    quRepSubContractDateAPPLY_DATE: TDateTimeField;
    quRepSubContractDateCERT_AMT: TBCDField;
    quRepSubContractDateDAYWORKS: TBCDField;
    quRepSubContractDateAPPLY_VO_AMT: TBCDField;
    quRepSubContractDateDEPOSIT_AMT: TBCDField;
    quRepSubContractDateDEDUCT_DEPOSIT: TBCDField;
    quRepSubContractDateRETENTION_AMT: TBCDField;
    quRepSubContractDatePREVISION_AMT: TBCDField;
    quRepSubContractDateTOTAL_CUMULATIVE: TFloatField;
    quRepSubContractDateTOTAL_DEDUCT: TFloatField;
    quRepSubContractDateTOTAL_RETEMTION: TFloatField;
    quRepSubContractDateTOTAL_CERITICATE: TFloatField;
    quJobCostFile: TwwQuery;
    quRepProduct: TwwQuery;
    quRepProductJOB_NO_1: TStringField;
    quRepProductJOB_NO_2: TStringField;
    quRepProductJOB_DESC: TStringField;
    quRepProductFWO_NO: TStringField;
    quRepProductFWO_DESC: TStringField;
    quRepProductFWO_QTY: TBCDField;
    quRepProductORDER_DATE: TDateTimeField;
    quRepProductORDERED_BY: TStringField;
    quRepProductCOMPLETION_DATE: TDateTimeField;
    quRepProductLAST_DATE: TDateTimeField;
    quRepProductFINISH_DATE: TDateTimeField;
    quJobCostFileJOB_COST_CAT: TStringField;
    quJobCostFileDESCRIPTION: TStringField;
    quRepProductFINISH_FLG: TStringField;
    quRepProductSUBPRODUCTION_START_DATE: TDateTimeField;
    quRepProductRECEIVE_DATE: TDateTimeField;
    quRepProductJOB_NO: TStringField;
    quRepDailyReceive: TwwQuery;
    quRepProdStatus: TwwQuery;
    quProdStatus: TwwQuery;
    quProdStatusPRODUCTION_STATUS: TStringField;
    quProdStatusDESCRIPTION: TStringField;
    quRepDailyReceiveOJOB_NO_1: TStringField;
    quRepDailyReceiveOJOB_NO_2: TStringField;
    quRepDailyReceiveOJOB_DESC: TStringField;
    quRepDailyReceiveOFWO_NO: TStringField;
    quRepDailyReceiveOFWO_DESC: TStringField;
    quRepDailyReceiveOFWO_QTY: TBCDField;
    quRepDailyReceiveOORDER_DATE: TDateTimeField;
    quRepDailyReceiveOORDERED_BY: TStringField;
    quRepDailyReceiveOCOMPLETION_DATE: TDateTimeField;
    quRepDailyReceiveOLAST_DATE: TDateTimeField;
    quRepDailyReceiveOFINISH_DATE: TDateTimeField;
    quRepDailyReceiveOSUBPRODUCTION_START_DATE: TDateTimeField;
    quRepDailyReceiveORECEIVE_DATE_1: TDateTimeField;
    quRepDailyReceiveORECEIVE_DATE_2: TDateTimeField;
    quRepDailyReceiveORECEIVE_DATE_3: TDateTimeField;
    quRepDailyReceiveORECEIVE_DATE_4: TDateTimeField;
    quRepProdStatusOJOB_NO_1: TStringField;
    quRepProdStatusOJOB_NO_2: TStringField;
    quRepProdStatusOJOB_DESC: TStringField;
    quRepProdStatusOFWO_NO: TStringField;
    quRepProdStatusOFWO_DESC: TStringField;
    quRepProdStatusOFWO_QTY: TBCDField;
    quRepProdStatusOORDER_DATE: TDateTimeField;
    quRepProdStatusOORDERED_BY: TStringField;
    quRepProdStatusOCOMPLETION_DATE: TDateTimeField;
    quRepProdStatusORECEIVE_DATE_1: TDateTimeField;
    quRepProdStatusOSUBPRODUCTION_START_DATE_1: TDateTimeField;
    quRepProdStatusOLAST_DATE_1: TDateTimeField;
    quRepProdStatusORECEIVE_DATE_2: TDateTimeField;
    quRepProdStatusOSUBPRODUCTION_START_DATE_2: TDateTimeField;
    quRepProdStatusOLAST_DATE_2: TDateTimeField;
    quRepProdStatusORECEIVE_DATE_3: TDateTimeField;
    quRepProdStatusOSUBPRODUCTION_START_DATE_3: TDateTimeField;
    quRepProdStatusOLAST_DATE_3: TDateTimeField;
    quRepProdStatusORECEIVE_DATE_4: TDateTimeField;
    quRepProdStatusOSUBPRODUCTION_START_DATE_4: TDateTimeField;
    quRepProdStatusOLAST_DATE_4: TDateTimeField;
    procedure quRepSelStCalcFields(DataSet: TDataSet);
    procedure quRepFwoPrintCalcFields(DataSet: TDataSet);
    procedure quRepSelEdCalcFields(DataSet: TDataSet);
    procedure quJCStatusCalcFields(DataSet: TDataSet);
    procedure quJobFileCalcFields(DataSet: TDataSet);
    procedure quSubContractCalcFields(DataSet: TDataSet);
    procedure quRepSubContractCalcFields(DataSet: TDataSet);
    procedure quRepSubContractDateCalcFields(DataSet: TDataSet);
    procedure quRepProductCalcFields(DataSet: TDataSet);
    procedure quRepDailyReceiveCalcFields(DataSet: TDataSet);
    procedure quRepProdStatusCalcFields(DataSet: TDataSet);
//    function DateConvert(var wDate :TDate) : string;
  private
    { Private declarations }
  public
    function DateConvert(wDate :TDate) : string;
    { Public declarations }
  end;

var
  dmRepFwo: TdmRepFwo;
  wCompanyName,
  wUserID,
  wCompanyID,
  wPassword,
  wActiveSecurity,
  wServer : String;
  gUseJobNo2 : string;
  gJobNo1Len,
  gJobNo2Len,
  gSubJobLen,
  gFWOLen : integer;
implementation
  function TdmRepFwo.DateConvert(wDate :TDate) : string;
    var wData : String;
    wMon,wDay,wYear :Word;
  begin
    DecodeDate(wdate,wYear,wMon,wDay);
    wData := IntToStr(wDay);
    if Length(Trim(wData))= 1 then
    wData := '0'+ wData ;
    if wMon <=9 then
      wData := wData + '/0'+ IntToStr(wMon)
    else
      wData := wData + '/'+ IntToStr(wMon);
    Result := wData;
  end;


{$R *.DFM}

procedure TdmRepFwo.quRepSelStCalcFields(DataSet: TDataSet);
begin
  if ((Trim(quRepSelStJOB_NO_1.AsString) ='')
   or (Trim(quRepSelStJOB_NO_2.AsString) = '')) then
   quRepSelStJob_No.AsString := quRepSelStJOB_NO_1.AsString
         + (quRepSelStJOB_NO_2.AsString)
  else
    quRepSelStJob_No.AsString := quRepSelStJOB_NO_1.AsString
         +'-'+ (quRepSelStJOB_NO_2.AsString);
end;

procedure TdmRepFwo.quRepFwoPrintCalcFields(DataSet: TDataSet);
begin
  if ((Trim(quRepFwoPrintJOB_NO_1.AsString) <> '') and (Trim(quRepFwoPrintJOB_NO_2.AsString) <>'')) then
    quRepFwoPrintJOB_NO.AsString := quRepFwoPrintJOB_NO_1.AsString +'-'+ quRepFwoPrintJOB_NO_2.AsString
  else
    quRepFwoPrintJOB_NO.AsString := quRepFwoPrintJOB_NO_1.AsString + quRepFwoPrintJOB_NO_2.AsString;
end;

procedure TdmRepFwo.quRepSelEdCalcFields(DataSet: TDataSet);
begin
  if ((Trim(quRepSelEdJOB_NO_1.AsString) ='')
   or (Trim(quRepSelEdJOB_NO_2.AsString) = '')) then
   quRepSelEdJob_No.AsString := quRepSelEdJOB_NO_1.AsString
         + (quRepSelEdJOB_NO_2.AsString)
  else
    quRepSelEdJob_No.AsString := quRepSelEdJOB_NO_1.AsString
         +'-'+ (quRepSelEdJOB_NO_2.AsString);
end;

procedure TdmRepFwo.quJCStatusCalcFields(DataSet: TDataSet);
begin
  if ((Trim(quJCStatusOJOB_NO_1.AsString) <> '')
    and (Trim(quJCStatusOJOB_NO_2.AsString) <> '')) then
    quJCStatusJOB_NO.AsString := quJCStatusOJOB_NO_1.AsString
        + '-' + quJCStatusOJOB_NO_2.AsString
  else
    quJCStatusJOB_NO.AsString := quJCStatusOJOB_NO_1.AsString
        +quJCStatusOJOB_NO_2.AsString;
end;

procedure TdmRepFwo.quJobFileCalcFields(DataSet: TDataSet);
begin
  if ((Trim(quJobFileJOB_NO_1.AsString) ='')
    or (Trim(quJobFileJOB_NO_2.AsString) = '')) then
    quJobFileJob_No.AsString := quJobFileJOB_NO_1.AsString
         + (quJobFileJOB_NO_2.AsString)
  else
    quJobFileJob_No.AsString := quJobFileJOB_NO_1.AsString
         +'-'+ (quJobFileJOB_NO_2.AsString);
end;

procedure TdmRepFwo.quSubContractCalcFields(DataSet: TDataSet);
begin
  if ((Trim(quSubContractJOB_NO_1.AsString) ='')
    or (Trim(quSubContractJOB_NO_2.AsString) = '')) then
    quSubContractJob_No.AsString := quSubContractJOB_NO_1.AsString
         + (quSubContractJOB_NO_2.AsString)
  else
    quSubContractJob_No.AsString := quSubContractJOB_NO_1.AsString
         +'-'+ (quSubContractJOB_NO_2.AsString);
  quSubContractWORK_PERIOD.AsString := quSubContractWORK_START_DATE.AsString
    +' - ' + quSubContractWORK_END_DATE.AsString
end;

procedure TdmRepFwo.quRepSubContractCalcFields(DataSet: TDataSet);
var cert_amt,dayworks,apply_vo_amt,
  deposit_amt,deduct_deposit,retention_amt,prevision_amt : real;
begin
  if (quRepSubContractCERT_AMT.IsNull) then
    cert_amt := 0.0
  else
    cert_amt := quRepSubContractCERT_AMT.AsFloat;
  if (quRepSubContractDAYWORKS.IsNull) then
    dayworks := 0.0
  else
    dayworks := quRepSubContractDAYWORKS.AsFloat;
  if (quRepSubContractAPPLY_VO_AMT.IsNull) then
    apply_vo_amt := 0.0
  else
    apply_vo_amt := quRepSubContractAPPLY_VO_AMT.AsFloat;
  if (quRepSubContractDEPOSIT_AMT.IsNull) then
    deposit_amt := 0.0
  else
    deposit_amt := quRepSubContractDEPOSIT_AMT.AsFloat;
  if (quRepSubContractDEDUCT_DEPOSIT.IsNull) then
    deduct_deposit := 0.0
  else
    deduct_deposit := quRepSubContractDEDUCT_DEPOSIT.AsFloat;
  if (quRepSubContractRETENTION_AMT.IsNull) then
    retention_amt:= 0.0
  else
    retention_amt := quRepSubContractRETENTION_AMT.AsFloat;
  if (quRepSubContractPREVISION_AMT.IsNull) then
    prevision_amt := 0.0
  else
    prevision_amt := quRepSubContractPREVISION_AMT.AsFloat;
  quRepSubContractTOTAL_CUMULATIVE.AsFloat:=CERT_AMT+DAYWORKS+APPLY_VO_AMT;
  quRepSubContractTOTAL_DEDUCT.AsFloat:=CERT_AMT+DAYWORKS+APPLY_VO_AMT
          +DEPOSIT_AMT-DEDUCT_DEPOSIT;
  quRepSubContractTOTAL_RETEMTION.AsFloat := CERT_AMT+ DAYWORKS+ APPLY_VO_AMT
         +DEPOSIT_AMT-DEDUCT_DEPOSIT-RETENTION_AMT;
  quRepSubContractTOTAL_CERITICATE.AsFloat := CERT_AMT+ DAYWORKS+ APPLY_VO_AMT
         +DEPOSIT_AMT-DEDUCT_DEPOSIT  -RETENTION_AMT-PREVISION_AMT;
end;

procedure TdmRepFwo.quRepSubContractDateCalcFields(DataSet: TDataSet);
var cert_amt,dayworks,apply_vo_amt,
  deposit_amt,deduct_deposit,retention_amt,prevision_amt : real;
begin
  if (quRepSubContractDateCERT_AMT.IsNull) then
    cert_amt := 0.0
  else
    cert_amt := quRepSubContractDateCERT_AMT.AsFloat;
  if (quRepSubContractDateDAYWORKS.IsNull) then
    dayworks := 0.0
  else
    dayworks := quRepSubContractDateDAYWORKS.AsFloat;
  if (quRepSubContractDateAPPLY_VO_AMT.IsNull) then
    apply_vo_amt := 0.0
  else
    apply_vo_amt := quRepSubContractDateAPPLY_VO_AMT.AsFloat;
  if (quRepSubContractDateDEPOSIT_AMT.IsNull) then
    deposit_amt := 0.0
  else
    deposit_amt := quRepSubContractDateDEPOSIT_AMT.AsFloat;
  if (quRepSubContractDateDEDUCT_DEPOSIT.IsNull) then
    deduct_deposit := 0.0
  else
    deduct_deposit := quRepSubContractDateDEDUCT_DEPOSIT.AsFloat;
  if (quRepSubContractDateRETENTION_AMT.IsNull) then
    retention_amt:= 0.0
  else
    retention_amt := quRepSubContractDateRETENTION_AMT.AsFloat;
  if (quRepSubContractDatePREVISION_AMT.IsNull) then
    prevision_amt := 0.0
  else
    prevision_amt := quRepSubContractDatePREVISION_AMT.AsFloat;
  quRepSubContractDateTOTAL_CUMULATIVE.AsFloat:=CERT_AMT+DAYWORKS+APPLY_VO_AMT;
  quRepSubContractDateTOTAL_DEDUCT.AsFloat:=CERT_AMT+DAYWORKS+APPLY_VO_AMT
          +DEPOSIT_AMT-DEDUCT_DEPOSIT;
  quRepSubContractDateTOTAL_RETEMTION.AsFloat := CERT_AMT+ DAYWORKS+ APPLY_VO_AMT
         +DEPOSIT_AMT-DEDUCT_DEPOSIT-RETENTION_AMT;
  quRepSubContractDateTOTAL_CERITICATE.AsFloat := CERT_AMT+ DAYWORKS+ APPLY_VO_AMT
         +DEPOSIT_AMT-DEDUCT_DEPOSIT  -RETENTION_AMT-PREVISION_AMT;
end;

procedure TdmRepFwo.quRepProductCalcFields(DataSet: TDataSet);
begin
  {if ((Trim(quRepProductJOB_NO_1.AsString)<> '')
    and (Trim(quRepProductJOB_NO_2.AsString)<> '')) then
    quRepProductJOB_NO.AsString := Trim(quRepProductJOB_NO_1.AsString)
      +'-'+Trim(quRepProductJOB_NO_2.AsString)
  else
    quRepProductJOB_NO.AsString := Trim(quRepProductJOB_NO_1.AsString)
      +Trim(quRepProductJOB_NO_2.AsString);
  if Not quRepProductFINISH_DATE.IsNull then
    quRepProductFINISH_FLG.AsString := 'Y'; }
end;

procedure TdmRepFwo.quRepDailyReceiveCalcFields(DataSet: TDataSet);
begin
 { if ((Trim(quRepDailyReceiveOJOB_NO_1.AsString)<> '')
    and (Trim(quRepDailyReceiveOJOB_NO_2.AsString)<> '')) then
    quRepDailyReceiveJOB_NO.AsString := Trim(quRepDailyReceiveOJOB_NO_1.AsString)
      +'-'+Trim(quRepDailyReceiveOJOB_NO_2.AsString)
  else
    quRepDailyReceiveJOB_NO.AsString := Trim(quRepDailyReceiveOJOB_NO_1.AsString)
      +Trim(quRepDailyReceiveOJOB_NO_2.AsString);
  if Not quRepDailyReceiveOFINISH_DATE.IsNull then
    quRepDailyReceiveFINISH_FLG.AsString := 'Y'; }
end;

procedure TdmRepFwo.quRepProdStatusCalcFields(DataSet: TDataSet);
begin
  {if ((Trim(quRepProdStatusoJOB_NO_1.AsString)<> '')
    and (Trim(quRepProdStatusoJOB_NO_2.AsString)<> '')) then
    quRepProdStatusJOB_NO.AsString := Trim(quRepProdStatusOJOB_NO_1.AsString)
      +'-'+Trim(quRepProdStatusOJOB_NO_2.AsString)
  else
    quRepProdStatusJOB_NO.AsString := Trim(quRepProdStatusoJOB_NO_1.AsString)
      +Trim(quRepProdStatusoJOB_NO_2.AsString);  }
end;

end.
