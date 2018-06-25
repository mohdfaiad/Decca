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
    quRepSubContractDateSUBCONTRACT_NO: TStringField;
    quRepSubContractDateAPPLY_DATE: TDateTimeField;
    quRepSubContractDateCERT_AMT: TBCDField;
    quRepSubContractDateDAYWORKS: TBCDField;
    quRepSubContractDateAPPLY_VO_AMT: TBCDField;
    quRepSubContractDateTOTAL_CUMULATIVE: TFloatField;
    quRepSubContractDateDEPOSIT_AMT: TBCDField;
    quRepSubContractDateDEDUCT_DEPOSIT: TBCDField;
    quRepSubContractDateTOTAL_DEDUCT: TFloatField;
    quRepSubContractDateRETENTION_AMT: TBCDField;
    quRepSubContractDateTOTAL_RETEMTION: TFloatField;
    quRepSubContractDatePREVISION_AMT: TBCDField;
    quRepSubContractDateTOTAL_CERITICATE: TFloatField;
    quCertNo: TwwQuery;
    quCertNoSUBCONTRACT_NO: TStringField;
    quCertNoAPPLY_DATE: TDateTimeField;
    quCertNoINVC_NO: TStringField;
    quCertNoCERT_NO: TStringField;
    procedure quRepSelStCalcFields(DataSet: TDataSet);
    procedure quRepFwoPrintCalcFields(DataSet: TDataSet);
    procedure quRepSelEdCalcFields(DataSet: TDataSet);
    procedure quJCStatusCalcFields(DataSet: TDataSet);
    procedure quJobFileCalcFields(DataSet: TDataSet);
    procedure quSubContractCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
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

end.
