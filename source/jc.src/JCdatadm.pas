unit JCdatadm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwquery, Wwdatsrc;

type
  TdmJCData = class(TDataModule)
    dbJCdata: TDatabase;
    quJCcontrol: TwwQuery;
    quJCcontrolCONTROL_KEY: TIntegerField;
    quJCcontrolCURR_PERIOD: TDateTimeField;
    quJCcontrolUSE_JOB_NO_2: TStringField;
    quJCcontrolJOB_NO_1_LEN: TIntegerField;
    quJCcontrolJOB_NO_2_LEN: TIntegerField;
    quJCcontrolSUB_JOB_NO_LEN: TIntegerField;
    quJCcontrolFWO_NO_LEN: TIntegerField;
    quJCcontrolLST_PERIOD: TDateTimeField;
    quJCcontrolUSE_RETAIN_AP: TStringField;
    quJCcontrolUSE_RETAIN_AR: TStringField;
    quJCcontrolUSER_DEF_TITLE01: TStringField;
    quJCcontrolUSER_DEF_TITLE02: TStringField;
    quJCcontrolUSER_DEF_TITLE03: TStringField;
    quJCcontrolUSER_DEF_TITLE04: TStringField;
    quJCcontrolUSER_DEF_TITLE05: TStringField;
    quJCcontrolUSER_DEF_TITLE06: TStringField;
    quJCcontrolUSER_DEF_TITLE07: TStringField;
    quJCcontrolUSER_DEF_TITLE08: TStringField;
    quJCcontrolUSER_DEF_TITLE09: TStringField;
    quJCcontrolUSER_DEF_TITLE10: TStringField;
    quJCcontrolBILL_AC: TStringField;
    quJCcontrolBILL_PROFIT_CTR_1: TStringField;
    quJCcontrolBILL_PROFIT_CTR_2: TStringField;
    dsJCcontrol: TwwDataSource;
    usJCcontrol: TUpdateSQL;
    quJob_cost_type: TwwQuery;
    dsJob_cost_type: TwwDataSource;
    usJob_cost_type: TUpdateSQL;
    dbCommon: TDatabase;
    dsSelServer: TDataSource;
    dsSelFuncApproved: TDataSource;
    quSelFuncApproved: TQuery;
    quCompany: TQuery;
    quSelServer: TQuery;
    quProg_desc: TwwQuery;
    quProg_descMODULE_ID: TStringField;
    quProg_descPROGRAM_ID: TStringField;
    quProg_descDESCRIPTION: TStringField;
    quJob_cost_file: TwwQuery;
    dsJob_cost_file: TwwDataSource;
    usJob_cost_file: TUpdateSQL;
    quJob_file: TwwQuery;
    dsJob_file: TwwDataSource;
    usJob_file: TUpdateSQL;
    quJob_fileJOB_STATUS: TStringField;
    quJob_fileJOB_TYPE: TStringField;
    quJob_fileBILL_CURRENCY: TStringField;
    quJob_fileCOST_CURRENCY: TStringField;
    quJob_fileLST_EST_DATE: TDateTimeField;
    quJob_fileJOB_END_DATE: TDateTimeField;
    quJob_fileINCHARGE_PERSON: TStringField;
    quJob_fileCREATE_DATE: TDateTimeField;
    quJob_fileCREATED_BY: TStringField;
    quJob_fileCUSTOMER_NO: TStringField;
    quJob_fileBILL_AC: TStringField;
    quJob_fileBILL_PROFIT_CTR_1: TStringField;
    quJob_fileBILL_PROFIT_CTR_2: TStringField;
    quJob_fileCOMMENT: TMemoField;
    quSub_job: TwwQuery;
    dsSub_job: TwwDataSource;
    usSub_job: TUpdateSQL;
    quSub_jobSUB_JOB_NO: TStringField;
    quSub_jobDESCRIPTION: TStringField;
    quSub_jobSUB_JOB_STATUS: TStringField;
    quSub_jobSUB_JOB_END_DATE: TDateTimeField;
    quSub_jobCREATE_DATE: TDateTimeField;
    quSub_jobCREATED_BY: TStringField;
    quSub_jobLST_BILL_DATE: TDateTimeField;
    quSub_jobLST_PMT_DATE: TDateTimeField;
    quSub_jobUSER_DEF_FLD01: TStringField;
    quSub_jobUSER_DEF_FLD02: TStringField;
    quSub_jobUSER_DEF_FLD03: TStringField;
    quSub_jobUSER_DEF_FLD04: TStringField;
    quSub_jobUSER_DEF_FLD05: TStringField;
    quSub_jobUSER_DEF_FLD06: TStringField;
    quSub_jobUSER_DEF_FLD07: TStringField;
    quSub_jobUSER_DEF_FLD08: TStringField;
    quSub_jobUSER_DEF_FLD09: TStringField;
    quSub_jobUSER_DEF_FLD10: TStringField;
    quJOB_FWO: TwwQuery;
    dsJOB_FWO: TwwDataSource;
    usJOB_FWO: TUpdateSQL;
    quJOB_FWOFWO_NO: TStringField;
    quJOB_FWOSTATUS: TStringField;
    quJOB_FWOSUB_JOB_NO: TStringField;
    quJOB_FWODESCRIPTION: TStringField;
    quJOB_FWOCREATED_BY: TStringField;
    quJOB_FWOCREATE_DATE: TDateTimeField;
    quJOB_FWOFWO_UNIT: TStringField;
    quJOB_FWOCOMMENT: TMemoField;
    quJobCostCat: TwwQuery;
    dsJobCostCat: TwwDataSource;
    usJobCostCat: TUpdateSQL;
    quJobCostCatSUB_JOB_NO: TStringField;
    quJobCostCatJOB_COST_CAT_UNIT: TStringField;
    quJob_cost_file_VIEW: TwwQuery;
    quJob_cost_file_VIEWJOB_COST_CAT: TStringField;
    quJob_cost_file_VIEWDESCRIPTION: TStringField;
    quJob_cost_file_VIEWJOB_COST_CAT_UNIT: TStringField;
    quJCcontrolUSE_BILL_AC_BY_JOB: TStringField;
    quSubContract: TwwQuery;
    quSubContractSUB_JOB_NO: TStringField;
    dsSubContract: TwwDataSource;
    usSubContract: TUpdateSQL;
    quSubContractSUBCONTRACT_NO: TStringField;
    quSubContractCONTRACT_TITLE: TStringField;
    quSubContractVENDOR_NO: TStringField;
    quSubContractCONTRACT_DATE: TDateTimeField;
    quSubContractWORK_START_DATE: TDateTimeField;
    quSubContractWORK_END_DATE: TDateTimeField;
    quSubContractSTATUS: TStringField;
    quSubContractCREATED_BY: TStringField;
    quSubContractCREATE_DATE: TDateTimeField;
    quSubContract_detail: TwwQuery;
    dsSubContract_detail: TwwDataSource;
    usSubContract_detail: TUpdateSQL;
    quSubContractCOMMENT: TMemoField;
    quJCcontrolUSE_FIELDS: TIntegerField;
    quJobClaim: TwwQuery;
    dsJobClaim: TwwDataSource;
    usJobClaim: TUpdateSQL;
    quJOB_FWO_VIEW: TwwQuery;
    quJOB_FWO_VIEWSUB_JOB_NO: TStringField;
    quJOB_FWO_VIEWFWO_NO: TStringField;
    quJOB_FWO_VIEWSTATUS: TStringField;
    quJOB_FWO_VIEWDESCRIPTION: TStringField;
    quJOB_FWO_VIEWCREATED_BY: TStringField;
    quJOB_FWO_VIEWCREATE_DATE: TDateTimeField;
    quJOB_FWO_VIEWFWO_UNIT: TStringField;
    quJOB_FWO_VIEWCOMMENT: TMemoField;
    quCurrency: TwwQuery;
    quCurrencyCOMPANY_ID: TStringField;
    quSelectJob: TwwQuery;
    dsSelectJob: TwwDataSource;
    quSelectJobODESCRIPTION: TStringField;
    quSelectJobOINCHARGE_PERSON: TStringField;
    quSelectJobOJOB_STATUS: TStringField;
    quSelectJobJOB_NO: TStringField;
    quWorkGroup: TwwQuery;
    dsWorkGroup: TwwDataSource;
    usWorkGroup: TUpdateSQL;
    quWorkGroupDESCRIPTION: TStringField;
    quJOB_FWOFWO_LENGTH: TBCDField;
    quJOB_FWOFWO_WIDTH: TBCDField;
    quJOB_FWOFWO_HEIGHT: TBCDField;
    quSub_jobCOMPLETED_PCT: TBCDField;
    quSub_jobJOB_RETAIN_AP: TBCDField;
    quSub_jobJOB_RETAIN_AR: TBCDField;
    quSub_jobJOB_AMT_PAID: TBCDField;
    quWorkGroupREG_RATE: TBCDField;
    quWorkGroupPREM_RATE: TBCDField;
    quSubContractRETENTION_LIMIT: TBCDField;
    quSubContractEST_VO_AMT: TBCDField;
    quSubContractDEPOSIT_AMT: TBCDField;
    quSubContractRETENTION_AMT: TBCDField;
    quSubContractCONTRACT_SUM: TBCDField;
    quJobCostCatREG_RATE: TBCDField;
    quJobCostCatPREM_RATE: TBCDField;
    quJob_cost_file_VIEWREG_RATE: TBCDField;
    quJob_cost_file_VIEWPREM_RATE: TBCDField;
    quJOB_FWO_VIEWFWO_LENGTH: TBCDField;
    quJOB_FWO_VIEWFWO_WIDTH: TBCDField;
    quJOB_FWO_VIEWFWO_HEIGHT: TBCDField;
    quCurrencyBASE_CURRENCY: TBCDField;
    quCurrencyFOREIGN_CURRENCY: TBCDField;
    quJob_fileJOB_NO: TStringField;
    quSub_jobJOB_NO: TStringField;
    quJOB_FWOFWO_CAT: TStringField;
    quJOB_FWOCHECKED_BY: TStringField;
    quJOB_FWOCHECK_DATE: TDateTimeField;
    quJOB_FWOQUOT_NO: TStringField;
    quFWO_Cat: TwwQuery;
    dsFWO_Cat: TwwDataSource;
    usFWO_Cat: TUpdateSQL;
    quFWO_CatFWO_CAT: TStringField;
    quFWO_CatDESCRIPTION: TStringField;
    quSub_jobQUOT_NO: TStringField;
    quJOB_FWOUPDATE_SJ_BUDGET: TStringField;
    quJOB_FWOPRODUCT_CODE: TStringField;
    quJOB_FWOPHOTO: TBlobField;
    quCurrencyCURRENCY: TStringField;
    quJob_fileDESCRIPTION: TStringField;
    quSub_jobcalTotalAmt: TCurrencyField;
    quSel1SubJob: TwwQuery;
    dsSel1SubJob: TwwDataSource;
    dsClaimSubDescri: TwwDataSource;
    quClaimSubDescri: TwwQuery;
    quClaimSubDescriSUB_JOB_NO: TStringField;
    quClaimSubDescriDESCRIPTION: TStringField;
    quJOB_FWOcalSubDescription: TStringField;
    quFWOSubDescr: TwwQuery;
    quFWOSubDescrSUB_JOB_NO: TStringField;
    quFWOSubDescrDESCRIPTION: TStringField;
    quJobClaimcalSubDescr: TStringField;
    quSelFWOSubDescr: TwwQuery;
    quSelFWOSubDescrSUB_JOB_NO: TStringField;
    quSelFWOSubDescrDESCRIPTION: TStringField;
    dsSelFWOSubDescr: TwwDataSource;
    dbQuote: TDatabase;
    quJob_cost_typeJOB_COST_CAT_TYPE: TStringField;
    quJob_cost_typeDESCRIPTION: TStringField;
    quJob_cost_typeCOST_CAT_SYSTEM: TStringField;
    quJob_cost_fileJOB_COST_CAT: TStringField;
    quJob_cost_fileDESCRIPTION: TStringField;
    quJob_cost_fileJOB_COST_CAT_UNIT: TStringField;
    quJob_cost_fileREG_RATE: TBCDField;
    quJob_cost_filePREM_RATE: TBCDField;
    quJob_cost_fileJOB_COST_TYPE: TStringField;
    quJob_cost_file_VIEWJOB_COST_TYPE: TStringField;
    quSub_jobSITE_LOCATION: TStringField;
    quSub_jobSUB_JOB_TYPE: TStringField;
    quSub_jobREQ_BUDGET: TStringField;
    quJobCostCatDRAFT_BUDGET_AMT: TBCDField;
    quJobCostCatDRAFT_BUDGET_QTY: TBCDField;
    quJobDetail: TwwQuery;
    dsJobDetail: TwwDataSource;
    usJobDetail: TUpdateSQL;
    quJobDetailFWO_NO: TStringField;
    quJobDetailJOB_COST_CAT: TStringField;
    quJobDetailSUB_JOB_NO: TStringField;
    quJobDetailHIST_DATE: TDateTimeField;
    quJobDetailSITE_NO: TIntegerField;
    quJobDetailHIST_SEQ: TDateTimeField;
    quJobDetailDOC_NO: TStringField;
    quJobDetailDETAIL_TYPE: TStringField;
    quJobDetailDETAIL_AMT: TBCDField;
    quJobDetailRETAIN_AMT: TBCDField;
    quJobDetailITEM_NO: TStringField;
    quJobDetailWHS_CODE: TStringField;
    quJobDetailITEM_UNIT: TStringField;
    quJobDetailINVC_NO: TStringField;
    quJobDetailINVC_DATE: TDateTimeField;
    quJobDetailCHQ_NO: TStringField;
    quJobDetailCHQ_DATE: TDateTimeField;
    quJobDetailUSER_ID: TStringField;
    quJobDetailACCT_NO: TStringField;
    quJobDetailPFT_CTR_1: TStringField;
    quJobDetailPFT_CTR_2: TStringField;
    quJobDetailQTY_TYPE: TStringField;
    quJobDetailCOMMENT: TBlobField;
    quDetailFwoDescr: TwwQuery;
    quJobDetailclFwoDescr: TStringField;
    quDetailFwoDescrDESCRIPTION: TStringField;
    quDetailSubDescr: TwwQuery;
    quDetailSubDescrDESCRIPTION: TStringField;
    quJobDetailclSubNoDescr: TStringField;
    quWorkGroupWORK_GROUP: TStringField;
    quJOB_FWOFWO_QTY: TBCDField;
    quSel1SubJobSUB_JOB_NO: TStringField;
    quSel1SubJobDESCRIPTION: TStringField;
    quSel1SubJobSUB_JOB_STATUS: TStringField;
    quSel1SubJobCONTRACT_AMT: TBCDField;
    quSel1SubJobCOMPLETED_PCT: TBCDField;
    quSel1SubJobSUB_JOB_END_DATE: TDateTimeField;
    quSel1SubJobCREATE_DATE: TDateTimeField;
    quSel1SubJobCREATED_BY: TStringField;
    quSel1SubJobJOB_RETAIN_AP: TBCDField;
    quSel1SubJobJOB_RETAIN_AR: TBCDField;
    quSel1SubJobJOB_BILL_AMT: TBCDField;
    quSel1SubJobJOB_AMT_PAID: TBCDField;
    quSel1SubJobLST_BILL_DATE: TDateTimeField;
    quSel1SubJobLST_PMT_DATE: TDateTimeField;
    quSel1SubJobUSER_DEF_FLD01: TStringField;
    quSel1SubJobUSER_DEF_FLD02: TStringField;
    quSel1SubJobUSER_DEF_FLD03: TStringField;
    quSel1SubJobUSER_DEF_FLD04: TStringField;
    quSel1SubJobUSER_DEF_FLD05: TStringField;
    quSel1SubJobUSER_DEF_FLD06: TStringField;
    quSel1SubJobUSER_DEF_FLD07: TStringField;
    quSel1SubJobUSER_DEF_FLD08: TStringField;
    quSel1SubJobUSER_DEF_FLD09: TStringField;
    quSel1SubJobUSER_DEF_FLD10: TStringField;
    quSel1SubJobQUOT_NO: TStringField;
    quSel1SubJobSITE_LOCATION: TStringField;
    quSel1SubJobSUB_JOB_TYPE: TStringField;
    quSel1SubJobFINAL_CONT_AMT: TBCDField;
    quSel1SubJobREQ_BUDGET: TStringField;
    quSel1SubJobVO_TO_SUB_JOB_NO: TStringField;
    quSel1SubJobJOB_REG_AMT: TBCDField;
    quSel1SubJobJOB_PREM_AMT: TBCDField;
    quJobCostCatJOB_REG_AMT: TBCDField;
    quJobCostCatJOB_PREM_AMT: TBCDField;
    quJobCostCatBUDGET_AMT: TBCDField;
    quJOB_FWO_VIEWFWO_QTY: TBCDField;
    quSub_jobVO_TO_SUB_JOB_NO: TStringField;
    quSub_jobJOB_PREM_AMT: TBCDField;
    quSub_jobFINAL_CONT_AMT: TBCDField;
    quSub_jobJOB_REG_AMT: TBCDField;
    quSub_jobJOB_BILL_AMT: TBCDField;
    quSub_jobCONTRACT_AMT: TBCDField;
    quSelectJobOJOB_NO_1: TStringField;
    quSelectJobOJOB_NO_2: TStringField;
    quJob_fileJOB_NO_1: TStringField;
    quJob_fileJOB_NO_2: TStringField;
    quJob_fileTERRITORY: TStringField;
    quJob_fileOLD_JOB_NO: TStringField;
    quSub_jobJOB_NO_1: TStringField;
    quSub_jobJOB_NO_2: TStringField;
    quSel1SubJobJOB_NO_1: TStringField;
    quSel1SubJobJOB_NO_2: TStringField;
    quJobDetailJOB_NO_1: TStringField;
    quJobDetailJOB_NO_2: TStringField;
    quSubContractJOB_NO_1: TStringField;
    quSubContractJOB_NO_2: TStringField;
    quJobCostCatJOB_NO_1: TStringField;
    quJobCostCatJOB_NO_2: TStringField;
    quJOB_FWOJOB_NO_1: TStringField;
    quJOB_FWOJOB_NO_2: TStringField;
    quClaimSubDescriJOB_NO_1: TStringField;
    quClaimSubDescriJOB_NO_2: TStringField;
    quFWOSubDescrJOB_NO_1: TStringField;
    quFWOSubDescrJOB_NO_2: TStringField;
    quJOB_FWO_VIEWJOB_NO_1: TStringField;
    quJOB_FWO_VIEWJOB_NO_2: TStringField;
    quSelFWOSubDescrJOB_NO_1: TStringField;
    quSelFWOSubDescrJOB_NO_2: TStringField;
    quJCcontrolSITE_ID: TStringField;
    quJCcontrolMS_USER: TStringField;
    quJCcontrolMS_SITE_ID: TStringField;
    quJCcontrolSETUP_MODE: TStringField;
    dbTcData: TDatabase;
    quJOB_FWOORDER_DATE: TDateTimeField;
    quJOB_FWOORDERED_BY: TStringField;
    quJOB_FWOCOMPLETION_DATE: TDateTimeField;
    quJobCostCatJOB_COST_CAT: TStringField;
    quJobCostCatcalCostCatDesc: TStringField;
    quJobDetailDETAIL_QTY: TBCDField;
    quJobDetailITEM_UNIT_COST: TBCDField;
    quJobCostCatBUDGET_QTY: TBCDField;
    quJobCostCatJOB_REG_QTY: TBCDField;
    quJobCostCatJOB_PREM_QTY: TBCDField;
    quFWOCostCat: TwwQuery;
    dsFWOCostCat: TwwDataSource;
    usFWOCostCat: TUpdateSQL;
    quFWOCostCatJOB_NO_1: TStringField;
    quFWOCostCatJOB_NO_2: TStringField;
    quFWOCostCatFWO_NO: TStringField;
    quFWOCostCatJOB_COST_CAT: TStringField;
    quFWOCostCatJOB_COST_CAT_UNIT: TStringField;
    quFWOCostCatREG_RATE: TBCDField;
    quFWOCostCatPREM_RATE: TBCDField;
    quFWOCostCatBUDGET_AMT: TBCDField;
    quFWOCostCatBUDGET_QTY: TBCDField;
    quFWOCostCatJOB_REG_AMT: TBCDField;
    quFWOCostCatJOB_PREM_AMT: TBCDField;
    quFWOCostCatFIRST_DATE: TDateTimeField;
    quFWOCostCatCOMPLETE_DATE: TDateTimeField;
    quFWOCostCatSUB_JOB_NO: TStringField;
    quFWOCostCatJOB_REG_QTY: TBCDField;
    quFWOCostCatJOB_PREM_QTY: TBCDField;
    quFWOCostCatJobCostCatDesc: TStringField;
    quSub_jobCOMMENT: TMemoField;
    quFWOCostCatcalAmtTotal: TCurrencyField;
    quFWOCostCatCOMPLETE_PERCENT: TBCDField;
    quFWOCostCatLAST_DATE: TDateTimeField;
    quFWOCostCatcalAmtVarPct: TFloatField;
    quJobCostCatcalAmtTotal: TCurrencyField;
    quJobCostCatcalAmtVarPct: TFloatField;
    quFWOCostCatcalQtyTotal: TFloatField;
    quFWOCostCatcalQtyVarPct: TFloatField;
    quJobCostCatcalQtyTotal: TFloatField;
    quJobCostCatcalQtyVarPct: TFloatField;
    quFWOCostCatFWODesc: TStringField;
    quFWOCostCatJobDesc: TStringField;
    quSubContract_detailSUBCONTRACT_NO: TStringField;
    quSubContract_detailLINE_NO: TIntegerField;
    quSubContract_detailCERT_NO: TStringField;
    quSubContract_detailCERT_DATE: TDateTimeField;
    quSubContract_detailINVC_NO: TStringField;
    quSubContract_detailAPPLY_DATE: TDateTimeField;
    quSubContract_detailAPPLY_AMT: TBCDField;
    quSubContract_detailDAYWORKS: TBCDField;
    quSubContract_detailAPPLY_VO_AMT: TBCDField;
    quSubContract_detailCERT_AMT: TBCDField;
    quSubContract_detailCOMMENT: TMemoField;
    quSubContract_detailDEDUCT_DEPOSIT: TBCDField;
    quSubContract_detailRETENTION_AMT: TBCDField;
    quSubContractJOB_COST_CAT: TStringField;
    quSubContractcalContractTotal: TCurrencyField;
    quSubContractcalSubJobDesc: TStringField;
    quSubContract_detailcalPayTotal: TCurrencyField;
    quSubContract_detailcalApplyTotal: TCurrencyField;
    quSubContract_detailDEPOSIT_AMT: TBCDField;
    quSubContract_detailcalNetPay: TCurrencyField;
    quSubContractcalVendorName: TStringField;
    quSubContractTRADE: TStringField;
    quVendor: TwwQuery;
    dsVendor: TwwDataSource;
    usVendor: TUpdateSQL;
    quVendorVENDOR_NO: TStringField;
    quVendorNAME: TStringField;
    quVendorADDRESS: TMemoField;
    quTrade: TwwQuery;
    quTradeTRADE: TStringField;
    quTradeDESCRIPTION: TStringField;
    dsTrade: TwwDataSource;
    usTrade: TUpdateSQL;
    quJob_cost_filePRODUCTION_CAT: TStringField;
    quSubContractPayment: TwwQuery;
    dsSubContractPayment: TwwDataSource;
    usSubContractPayment: TUpdateSQL;
    quSubContract_detailPREPAYMENT: TBCDField;
    quSubContractPaymentSUBCONTRACT_NO: TStringField;
    quSubContractPaymentLINE_NO: TIntegerField;
    quSubContractPaymentVOUCHER_NO: TStringField;
    quSubContractPaymentPAID_DATE: TDateTimeField;
    quSubContractPaymentPAID_AMT: TBCDField;
    quJOB_FWOJobNo: TStringField;
    quFWOCostCatJobNo: TStringField;
    quJobClaimJOB_NO_1: TStringField;
    quJobClaimJOB_NO_2: TStringField;
    quJobClaimLINE_NO: TIntegerField;
    quJobClaimSUB_JOB_NO: TStringField;
    quJobClaimAPPLY_AMT: TBCDField;
    quJobClaimAPPLY_DOC_NO: TStringField;
    quJobClaimAPPLY_DATE: TDateTimeField;
    quJobClaimCERT_AMT: TBCDField;
    quJobClaimCERT_NO: TStringField;
    quJobClaimCERT_DATE: TDateTimeField;
    quJobClaimRECV_AMT: TBCDField;
    quJobClaimRECV_DOC_NO: TStringField;
    quJobClaimRECV_DATE: TDateTimeField;
    quJobClaimCLAIM_STATUS: TStringField;
    quJobClaimCOMMENT: TMemoField;
    quJobClaimJobNo: TStringField;
    quJobClaimcalJobDesc: TStringField;
    quJobClaimcalApplyAmt: TCurrencyField;
    quJCcontrolLAST_TC_DATE: TDateTimeField;
    quFWOCostCatcalBudgetQty: TBCDField;
    quFWOCostCatcalBudgetAmt: TCurrencyField;
    quFWOCostCatcalRegAmt: TCurrencyField;
    quFWOCostCatcalPremAmt: TCurrencyField;
    quFWOCostCatcalRegQty: TBCDField;
    quFWOCostCatcalPremQty: TBCDField;
    procedure quJob_cost_typeBeforeDelete(DataSet: TDataSet);
    procedure quJob_cost_typeBeforePost(DataSet: TDataSet);
    procedure quJob_cost_fileNewRecord(DataSet: TDataSet);
    procedure quSub_jobNewRecord(DataSet: TDataSet);
    procedure quJOB_FWONewRecord(DataSet: TDataSet);
    procedure quJob_fileNewRecord(DataSet: TDataSet);
    procedure quJobCostCatNewRecord(DataSet: TDataSet);
    procedure quJob_fileAfterOpen(DataSet: TDataSet);
    procedure quJobClaimNewRecord(DataSet: TDataSet);
    procedure quSubContractNewRecord(DataSet: TDataSet);
    procedure quSelectJobCalcFields(DataSet: TDataSet);
    procedure quWorkGroupAfterPost(DataSet: TDataSet);
    procedure quWorkGroupNewRecord(DataSet: TDataSet);
    procedure quJob_fileBeforeClose(DataSet: TDataSet);
    procedure quContractViewBeforeOpen(DataSet: TDataSet);
    procedure quJob_cost_fileBeforeOpen(DataSet: TDataSet);
    procedure quSubContractAfterOpen(DataSet: TDataSet);
    procedure quSubContract_detailNewRecord(DataSet: TDataSet);
    procedure quJob_fileBeforeOpen(DataSet: TDataSet);
    procedure quJob_fileAfterClose(DataSet: TDataSet);
    procedure quJob_fileCalcFields(DataSet: TDataSet);
    procedure quSub_jobCalcFields(DataSet: TDataSet);
    procedure quJob_fileBeforePost(DataSet: TDataSet);
    procedure quFWO_CatBeforePost(DataSet: TDataSet);
    procedure quJOB_FWOAfterPost(DataSet: TDataSet);
    procedure quSub_jobAfterPost(DataSet: TDataSet);
    procedure quJob_fileAfterPost(DataSet: TDataSet);
    procedure quJob_cost_typeAfterPost(DataSet: TDataSet);
    procedure quJob_cost_fileAfterPost(DataSet: TDataSet);
    procedure quJobClaimAfterPost(DataSet: TDataSet);
    procedure quJobCostCatAfterPost(DataSet: TDataSet);
    procedure quSubContractAfterPost(DataSet: TDataSet);
    procedure quSubContract_detailAfterPost(DataSet: TDataSet);
    procedure quFWO_CatAfterPost(DataSet: TDataSet);
    procedure quJOB_FWOCalcFields(DataSet: TDataSet);
    procedure quJOB_FWOBeforeOpen(DataSet: TDataSet);
    procedure quJOB_FWOAfterClose(DataSet: TDataSet);
    procedure quJCcontrolAfterPost(DataSet: TDataSet);
    procedure quJobDetailCalcFields(DataSet: TDataSet);
    procedure quJobDetailBeforeClose(DataSet: TDataSet);
    procedure quJobDetailNewRecord(DataSet: TDataSet);
    procedure quJobDetailAfterPost(DataSet: TDataSet);
    procedure quJCcontrolUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure quJCcontrolPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure quJOB_FWOAfterInsert(DataSet: TDataSet);
    procedure quJobCostCatCalcFields(DataSet: TDataSet);
    procedure quFWOCostCatAfterPost(DataSet: TDataSet);
    procedure quFWOCostCatAfterInsert(DataSet: TDataSet);
    procedure quFWOCostCatCalcFields(DataSet: TDataSet);
    procedure quFWOCostCatBeforeDelete(DataSet: TDataSet);
    procedure quJobCostCatBeforeDelete(DataSet: TDataSet);
    procedure quJob_fileBeforeDelete(DataSet: TDataSet);
    procedure quSubContractCalcFields(DataSet: TDataSet);
    procedure quSubContract_detailCalcFields(DataSet: TDataSet);
    procedure quVendorAfterPost(DataSet: TDataSet);
    procedure quTradeAfterPost(DataSet: TDataSet);
    procedure quSubContractPaymentAfterPost(DataSet: TDataSet);
    procedure quSubContractPaymentNewRecord(DataSet: TDataSet);
    procedure quSubContractAfterClose(DataSet: TDataSet);
    procedure quSubContract_detailAfterClose(DataSet: TDataSet);
    procedure quSubContract_detailAfterOpen(DataSet: TDataSet);
    procedure quSubContractPaymentBeforeDelete(DataSet: TDataSet);
    procedure quSubContract_detailBeforeDelete(DataSet: TDataSet);
    procedure quJobClaimCalcFields(DataSet: TDataSet);
    procedure quJobClaimBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmJCData: TdmJCData;
    SubNo ,
    FWONo ,
    JobNo1,
    JobNo2: String;

implementation
  uses JCCstCat,SelecJob,JCcontro,JCmain;
{$R *.DFM}

procedure TdmJCData.quJob_cost_typeBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('确實要刪除么?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Abort;
end;

procedure TdmJCData.quJob_cost_typeBeforePost(DataSet: TDataSet);
begin
  quJob_cost_typeJOB_COST_CAT_TYPE.AsString :=
    UpperCase(quJob_cost_typeJOB_COST_CAT_TYPE.AsString);
  quJob_cost_typeCOST_CAT_SYSTEM.AsString :=
     UpperCase(quJob_cost_typeCOST_CAT_SYSTEM.AsString);
end;

procedure TdmJCData.quJob_cost_fileNewRecord(DataSet: TDataSet);
begin
  quJob_cost_fileJOB_COST_TYPE.AsString
    :=UpperCase(quJob_cost_typeJOB_COST_CAT_TYPE.AsString);
end;

procedure TdmJCData.quSub_jobNewRecord(DataSet: TDataSet);
begin
  quSub_jobJOB_NO_1.AsString
    := quJob_fileJOB_NO_1.AsString;
  quSub_jobJOB_NO_2.AsString
    := quJob_fileJOB_NO_2.AsString;
  quSub_jobSUB_JOB_NO.AsString := ' ';
  quSub_jobSUB_JOB_STATUS.AsString := 'A';
  quSub_jobCREATED_BY.AsString
    := dbJCdata.Params.Values['USER NAME'];
  quSub_jobCREATE_DATE.AsDateTime := date;
  quSub_jobCONTRACT_AMT.AsFloat :=0.0;
  quSub_jobCOMPLETED_PCT.AsFloat := 0.0;
  quSub_jobJOB_REG_AMT.AsFloat := 0.0;
  quSub_jobJOB_PREM_AMT.AsFloat := 0.0;
  quSub_jobJOB_RETAIN_AP.AsFloat := 0.0;
  quSub_jobJOB_RETAIN_AR.AsFloat := 0.0;
  quSub_jobJOB_BILL_AMT.AsFloat := 0.0;
  quSub_jobJOB_AMT_PAID.AsFloat := 0.0;
end;

procedure TdmJCData.quJOB_FWONewRecord(DataSet: TDataSet);
begin
  quJOB_FWOJOB_NO_1.AsString
    := quJob_fileJOB_NO_1.AsString;
  quJOB_FWOJOB_NO_2.AsString
    := quJob_fileJOB_NO_2.AsString;
  quJOB_FWOCREATED_BY.AsString
    := dbJCdata.Params.Values['USER NAME'];
  quJOB_FWOCREATE_DATE.AsDateTime := date;
  quJOB_fwoSUB_JOB_NO.AsString := ' ';
  quJOB_fwoFWO_NO.AsString := ' ';
  quJOB_fwoSTATUS.AsString := 'A';
  quJOB_fwoFWO_QTY.AsFloat := 1.0;
  quJOB_fwoFWO_LENGTH.AsFloat := 0.0;
  quJOB_fwoFWO_WIDTH.AsFloat := 0.0;
  quJOB_fwoFWO_HEIGHT.AsFloat := 0.0;
end;

procedure TdmJCData.quJob_fileNewRecord(DataSet: TDataSet);
begin
  quJob_fileJOB_NO_2.AsString := ' ' ;
  quJob_fileJOB_STATUS.AsString :='A';
  quJob_fileCREATE_DATE.AsDateTime := date;
  quJob_fileCREATED_BY.AsString
    := dbJCdata.Params.Values['USER NAME'];
  if (gBillACByJob = 'N') then
  begin
    quJob_fileBILL_AC.AsString := quJCcontrolBILL_AC.AsString;
    quJob_fileBILL_PROFIT_CTR_1.AsString := quJCcontrolBILL_PROFIT_CTR_1.AsString;
    quJob_fileBILL_PROFIT_CTR_2.AsString := quJCcontrolBILL_PROFIT_CTR_2.AsString;
  end;
end;

procedure TdmJCData.quJobCostCatNewRecord(DataSet: TDataSet);
begin
  quJobCostCatJOB_NO_1.AsString := quSub_jobJOB_NO_1.AsString;
  quJobCostCatSUB_JOB_NO.AsString := quSub_jobSUB_JOB_NO.AsString;
  quJobCostCatJOB_NO_2.AsString := quSub_jobJOB_NO_2.AsString;
  quJobCostCatREG_RATE.AsFloat := 0.0;
  quJobCostCatPREM_RATE.AsFloat := 0.0;
  quJobCostCatBUDGET_AMT.AsFloat := 0.0;
  quJobCostCatBUDGET_QTY.AsFloat := 0.0;
  quJobCostCatJOB_REG_QTY.AsFloat := 0.0;
  quJobCostCatJOB_REG_AMT.AsFloat := 0.0;
  quJobCostCatJOB_PREM_QTY.AsFloat := 0.0;
  quJobCostCatJOB_PREM_AMT.AsFloat := 0.0;
  quJobCostCatDRAFT_BUDGET_AMT.AsFloat := 0.0;
  quJobCostCatDRAFT_BUDGET_QTY.AsFloat := 0.0;
end;

procedure TdmJCData.quJob_fileAfterOpen(DataSet: TDataSet);
begin
  with quJOB_FWO do
  begin
    if Not Active then
      Open;
  end;
  with quSub_job do
  begin
    if not Active then
      Open;
  end;
  with quWorkGroup do
    if Not Active then
      Open;

  with quCurrency do
  begin
    if Active then
      Close;
    ParamByName('iCompany').AsString := wCompanyID;
    Open;
  end;
end;

procedure TdmJCData.quJobClaimNewRecord(DataSet: TDataSet);
begin
  quJobClaimJOB_NO_1.AsString := quJob_fileJOB_NO_1.AsString;
  quJobClaimJOB_NO_2.AsString := quJob_fileJOB_NO_2.AsString;
  quJobClaimLINE_NO.AsInteger := 0 ;
  quJobClaimAPPLY_AMT.AsFloat := 0.0;
  quJobClaimCERT_AMT.AsFloat := 0.0 ;
  quJobClaimRECV_AMT.AsFloat := 0.0;
end;

procedure TdmJCData.quSubContractNewRecord(DataSet: TDataSet);
begin
  quSubContractJOB_NO_1.AsString := quSub_jobJOB_NO_1.AsString;
  quSubContractJOB_NO_2.AsString := quSub_jobJOB_NO_2.AsString;
  quSubContractSUB_JOB_NO.AsString := quSub_jobSUB_JOB_NO.AsString;
  quSubContractCREATED_BY.AsString := dbJCdata.Params.Values['USER NAME'];
  quSubContractCREATE_DATE.AsDateTime := date;
  quSubContractSTATUS.AsString := 'A';
  quSubContractCONTRACT_DATE.AsDateTime := date;
  quSubContractCONTRACT_SUM.AsFloat := 0.0;
  quSubContractRETENTION_AMT.AsFloat := 0.0;
  quSubContractRETENTION_LIMIT.AsFloat := 0.0;
  quSubContractEST_VO_AMT.AsFloat := 0.0;
  quSubContractDEPOSIT_AMT.AsFloat := 0.0;
end;

procedure TdmJCData.quSelectJobCalcFields(DataSet: TDataSet);
begin
  if (gUseJobNo2 = 'Y') and
     (trim(quSelectJobOJOB_NO_2.AsString) <> '') then
    quSelectJobJOB_NO.AsString := quSelectJobOJOB_NO_1.AsString
                                + '-' + quSelectJobOJOB_NO_2.AsString
  else
    quSelectJobJOB_NO.AsString := quSelectJobOJOB_NO_1.AsString;
end;

procedure TdmJCData.quWorkGroupAfterPost(DataSet: TDataSet);
begin
  quWorkGroupWORK_GROUP.AsString := UpperCase(quWorkGroupWORK_GROUP.AsString);
  try
    with quWorkGroup do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TdmJCData.quWorkGroupNewRecord(DataSet: TDataSet);
begin
  quWorkGroupREG_RATE.AsFloat := 0.0;
  quWorkGroupPREM_RATE.AsFloat := 0.0;
end;

procedure TdmJCData.quJob_fileBeforeClose(DataSet: TDataSet);
begin
  with quSub_job do
    if Active then
      Close;
  with quJOB_FWO do
    if Active then
      Close;
  with quSubContract do
    if Active then
      Close;
  with quSubContract_detail do
    if Active then
      Close;
  with quJobClaim do
    if Active then
      Close;
end;

procedure TdmJCData.quContractViewBeforeOpen(DataSet: TDataSet);
begin
  with quSubContract do
    if Active then
      Close;
end;

procedure TdmJCData.quJob_cost_fileBeforeOpen(DataSet: TDataSet);
begin
  with quWorkGroup do
    if Not Active then
      Open;
end;

procedure TdmJCData.quSubContractAfterOpen(DataSet: TDataSet);
begin
  with quSubContract_detail do
    if Not Active then
      Open;
end;

procedure TdmJCData.quSubContract_detailNewRecord(DataSet: TDataSet);
begin
  quSubContract_detailSUBCONTRACT_NO.AsString :=
    quSubContractSUBCONTRACT_NO.AsString;
  quSubContract_detailLINE_NO.AsInteger := 0;
  quSubContract_detailAPPLY_DATE.AsDateTime := date;
  quSubContract_detailAPPLY_AMT.Value := 0;
  quSubContract_detailAPPLY_VO_AMT.Value := 0;
  quSubContract_detailDAYWORKS.Value := 0;
  quSubContract_detailRETENTION_AMT.Value := 0;
  quSubContract_detailDEDUCT_DEPOSIT.Value := 0;
end;

procedure TdmJCData.quJob_fileBeforeOpen(DataSet: TDataSet);
begin
  with quJob_cost_type do
  begin
    if not Active then
      Open;
  end;
end;

procedure TdmJCData.quJob_fileAfterClose(DataSet: TDataSet);
begin
  with quWorkGroup do
    if Active then
      Close;
end;

procedure TdmJCData.quJob_fileCalcFields(DataSet: TDataSet);
begin
  if (gUseJobNo2 = 'Y') and
     (trim(quJob_FileJOB_NO_2.AsString) <> '') then
    quJob_fileJOB_NO.AsString := quJob_fileJOB_NO_1.AsString
                               + '-' + quJob_fileJOB_NO_2.AsString
  else
    quJob_fileJOB_NO.AsString := quJob_fileJOB_NO_1.AsString;
end;

procedure TdmJCData.quSub_jobCalcFields(DataSet: TDataSet);
begin
  if (gUseJobNo2 = 'Y') and
     (trim(quSub_jobJOB_NO_2.AsString) <> '') then
    quSub_jobJOB_NO.AsString := quSub_jobJOB_NO_1.AsString
                              + '-' + quSub_jobJOB_NO_2.AsString
  else
    quSub_jobJOB_NO.AsString := quSub_jobJOB_NO_1.AsString;
  quSub_jobcalTotalAmt.Value := quSub_jobJOB_REG_AMT.Value
                              + quSub_jobJOB_PREM_AMT.Value;
end;

procedure TdmJCData.quJob_fileBeforePost(DataSet: TDataSet);
begin
  if gBillACByJob = 'N' then
  begin
    quJob_fileBILL_AC.AsString := quJCcontrolBILL_AC.AsString;
    quJob_fileBILL_PROFIT_CTR_1.AsString := quJCcontrolBILL_PROFIT_CTR_1.AsString;
    quJob_fileBILL_PROFIT_CTR_2.AsString := quJCcontrolBILL_PROFIT_CTR_2.AsString;
  end;
end;

procedure TdmJCData.quFWO_CatBeforePost(DataSet: TDataSet);
begin
  quFWO_CatFWO_CAT.AsString
    :=UpperCase(quFWO_CatFWO_CAT.AsString);
end;

procedure TdmJCData.quJOB_FWOAfterPost(DataSet: TDataSet);
begin
  try
    with quJOB_FWO do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('編號重复,記錄不能更新,數据無效');
  end;
end;

procedure TdmJCData.quSub_jobAfterPost(DataSet: TDataSet);
begin
  try
    with quSub_job do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
    quSub_job.Cancel;
  end;
end;

procedure TdmJCData.quJob_fileAfterPost(DataSet: TDataSet);
begin
  try
    with quJob_file do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TdmJCData.quJob_cost_typeAfterPost(DataSet: TDataSet);
begin
  try
    with quJob_cost_type do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TdmJCData.quJob_cost_fileAfterPost(DataSet: TDataSet);
begin
  try
    with quJob_cost_file do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TdmJCData.quJobClaimAfterPost(DataSet: TDataSet);
begin
  try
    with quJobClaim do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TdmJCData.quJobCostCatAfterPost(DataSet: TDataSet);
begin
  try
    with quJobCostCat do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TdmJCData.quSubContractAfterPost(DataSet: TDataSet);
begin
  try
    with quSubContract do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('編號重复,記錄不能更新,數据無效');
  end;
end;

procedure TdmJCData.quSubContract_detailAfterPost(DataSet: TDataSet);
begin
  try
    with quSubContract_detail do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TdmJCData.quFWO_CatAfterPost(DataSet: TDataSet);
begin
  try
    with quFWO_Cat do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TdmJCData.quJOB_FWOCalcFields(DataSet: TDataSet);
begin
  quJob_FWOJobNo.AsString := quJob_FWOJOB_NO_1.AsString;
  if (trim(quJob_FWOJOB_NO_2.AsString) <> '') then
    quJob_FWOJobNo.AsString := trim(quJob_FWOJobNo.AsString)
                             + '-' + trim(quJOB_FWOJOB_NO_2.AsString);
end;

procedure TdmJCData.quJOB_FWOBeforeOpen(DataSet: TDataSet);
begin
  with quFWOSubDescr do
    if Not Active then
      Open;
end;

procedure TdmJCData.quJOB_FWOAfterClose(DataSet: TDataSet);
begin
  with quFWOSubDescr do
    if Active then
      Close;
end;

procedure TdmJCData.quJCcontrolAfterPost(DataSet: TDataSet);
begin
  try
    with quJCcontrol do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TdmJCData.quJobDetailCalcFields(DataSet: TDataSet);
begin
  with quDetailFwoDescr do
    if Not Active then
      Open;
  quJobDetailclFwoDescr.AsString := quDetailFwoDescrDESCRIPTION.AsString;
  with quDetailSubDescr do
    if Not Active then
      Open;
  quJobDetailclSubNoDescr.AsString := quDetailSubDescrDESCRIPTION.AsString;
end;

procedure TdmJCData.quJobDetailBeforeClose(DataSet: TDataSet);
begin
  with quDetailFwoDescr do
    if Active then
      Close;
  with quDetailSubDescr do
    if Active then
      Close;
end;

procedure TdmJCData.quJobDetailNewRecord(DataSet: TDataSet);
begin
  quJobDetailJOB_NO_1.AsString := quJob_fileJOB_NO_1.AsString;
  quJobDetailJOB_NO_2.AsString := quJob_fileJOB_NO_2.AsString;
  quJobDetailFWO_NO.AsString := ' ';
  quJobDetailJOB_COST_CAT.AsString := ' ';
  quJobDetailSITE_NO.AsInteger := 0;
  quJobDetailDETAIL_AMT.AsFloat :=0.0;
  quJobDetailDETAIL_QTY.AsFloat :=0.0;
  quJobDetailRETAIN_AMT.AsFloat := 0.0;
  quJobDetailITEM_UNIT_COST.AsFloat := 0.0;
  quJobDetailQTY_TYPE.AsString := 'R';
end;

procedure TdmJCData.quJobDetailAfterPost(DataSet: TDataSet);
begin
  try
    with quJobDetail do
    begin
      CommitUpdates;
      ApplyUpdates;
    end;
  except
    showmessage('不能更新數据!');
  end;
end;

procedure TdmJCData.quJCcontrolUpdateError(DataSet: TDataSet;
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

procedure TdmJCData.quJCcontrolPostError(DataSet: TDataSet;
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

procedure TdmJCData.quJOB_FWOAfterInsert(DataSet: TDataSet);
begin
  quJOB_FWOQUOT_NO.Value := trim(quJOB_FWOJOB_NO_1.Value)
                          + trim(quJOB_FWOJOB_NO_2.Value);
end;

procedure TdmJCData.quJobCostCatCalcFields(DataSet: TDataSet);
begin
  quJobCostCatcalAmtTotal.Value :=
    quJobCostCatJob_Reg_Amt.Value + quJobCostCatJob_Prem_Amt.Value;
  if quJobCostCatBUDGET_AMT.Value <> 0 then
    quJobCostCatcalAmtVarPct.Value :=
      (quJobCostCatcalAmtTotal.Value / quJobCostCatBUDGET_AMT.Value) * 100;
  quJobCostCatcalQtyTotal.Value :=
    quJobCostCatJob_Reg_Qty.Value + quJobCostCatJob_Prem_Qty.Value;
  if quJobCostCatBUDGET_QTY.Value <> 0 then
    quJobCostCatcalQtyVarPct.Value :=
      (quJobCostCatcalQtyTotal.Value / quJobCostCatBUDGET_QTY.Value) * 100;
end;

procedure TdmJCData.quFWOCostCatAfterPost(DataSet: TDataSet);
begin
  with quFWOCostCat do
    try
      ApplyUpdates;
      CommitUpdates;
    except
      ShowMessage('未能更新記錄');
    end;
end;

procedure TdmJCData.quFWOCostCatAfterInsert(DataSet: TDataSet);
begin
  quFWOCostCatJOB_NO_1.AsString := quJOB_FWOJOB_NO_1.AsString;
  quFWOCostCatJOB_NO_2.AsString := quJOB_FWOJOB_NO_2.AsString;
  quFWOCostCatFWO_NO.AsString := quJOB_FWOFWO_NO.AsString;
end;

procedure TdmJCData.quFWOCostCatCalcFields(DataSet: TDataSet);
begin
  if (gCalcQty = 0) then
    gCalcQty := 1;
  quFWOCostCatJobNo.Value := trim(quFWOCostCatJOB_NO_1.Value);
  if trim(quFWOCostCatJOB_NO_2.Value) <> '' then
    quFWOCostCatJobNo.Value := quFWOCostCatJobNo.Value
                             + '-' + trim(quFWOCostCatJOB_NO_2.Value);
  quFWOCostCatcalBudgetQty.Value := quFWOCostCatBUDGET_QTY.Value / gCalcQty;
  quFWOCostCatcalBudgetAmt.Value := quFWOCostCatBUDGET_AMT.Value / gCalcQty;
  quFWOCostCatcalRegQty.Value := quFWOCostCatJOB_REG_QTY.Value / gCalcQty;
  quFWOCostCatcalRegAmt.Value := quFWOCostCatJOB_REG_AMT.Value / gCalcQty;
  quFWOCostCatcalPremQty.Value := quFWOCostCatJOB_PREM_QTY.Value / gCalcQty;
  quFWOCostCatcalPremAmt.Value := quFWOCostCatJOB_PREM_AMT.Value / gCalcQty;
  quFWOCostCatcalAmtTotal.Value :=
    quFWOCostCatcalRegAmt.Value + quFWOCostCatcalPremAmt.Value;
  if quFWOCostCatcalBudgetAmt.Value <> 0 then
    quFWOCostCatcalAmtVarPct.Value :=
      (quFWOCostCatcalAmtTotal.Value / quFWOCostCatcalBudgetAmt.Value) * 100;
  quFWOCostCatcalQtyTotal.Value :=
    quFWOCostCatcalRegQty.Value + quFWOCostCatcalPremQty.Value;
  if quFWOCostCatcalBudgetQty.Value <> 0 then
    quFWOCostCatcalQtyVarPct.Value :=
      (quFWOCostCatcalQtyTotal.Value / quFWOCostCatcalBudgetQty.Value) * 100;
end;

procedure TdmJCData.quFWOCostCatBeforeDelete(DataSet: TDataSet);
begin
  if ((quFWOCostCatJOB_REG_AMT.Value <> 0) or
     (quFWOCostCatJOB_REG_QTY.Value <> 0) or
     (quFWOCostCatJOB_PREM_AMT.Value <> 0) or
     (quFWOCostCatJOB_PREM_QTY.Value <> 0)) then
  begin
    ShowMessage('數量或金額不相等零, 記錄未能刪除');
    Abort;
  end
  else
    if MessageDlg('确實要刪除么?',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Abort;
end;

procedure TdmJCData.quJobCostCatBeforeDelete(DataSet: TDataSet);
begin
  if ((quJobCostCatJOB_REG_AMT.Value <> 0) or
     (quJobCostCatJOB_REG_QTY.Value <> 0) or
     (quJobCostCatJOB_PREM_AMT.Value <> 0) or
     (quJobCostCatJOB_PREM_QTY.Value <> 0)) then
  begin
    ShowMessage('數量或金額不相等零, 記錄未能刪除');
    Abort;
  end
  else
    if MessageDlg('确實要刪除么?',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Abort;
end;

procedure TdmJCData.quJob_fileBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('确實要刪除么?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Abort;
end;

procedure TdmJCData.quSubContractCalcFields(DataSet: TDataSet);
begin
  quSubContractcalContractTotal.Value :=
    quSubContractCONTRACT_SUM.Value + quSubContractEST_VO_AMT.Value;
end;

procedure TdmJCData.quSubContract_detailCalcFields(DataSet: TDataSet);
begin
  quSubContract_detailcalPayTotal.Value :=
    quSubContract_detailCERT_AMT.Value +
    quSubContract_detailDEPOSIT_AMT.Value -
    quSubContract_detailDEDUCT_DEPOSIT.Value -
    quSubContract_detailRETENTION_AMT.Value;
  quSubContract_detailcalApplyTotal.Value :=
    quSubContract_detailAPPLY_AMT.Value +
    quSubContract_detailAPPLY_VO_AMT.Value +
    quSubContract_detailDAYWORKS.Value;
  quSubContract_detailcalNetPay.Value :=
    quSubContract_detailcalPayTotal.Value -
    quSubContract_detailPREPAYMENT.Value;
end;

procedure TdmJCData.quVendorAfterPost(DataSet: TDataSet);
begin
  with quVendor do
    try
      ApplyUpdates;
      CommitUpdates;
    except
      ShowMessage('未能更新記錄');
    end;
end;

procedure TdmJCData.quTradeAfterPost(DataSet: TDataSet);
begin
  with quTrade do
    try
      ApplyUpdates;
      CommitUpdates;
    except
      ShowMessage('未能更新記錄');
    end;
end;

procedure TdmJCData.quSubContractPaymentAfterPost(DataSet: TDataSet);
begin
  with quSubContractPayment do
    try
      ApplyUpdates;
      CommitUpdates;
    except
      ShowMessage('未能更新記錄');
    end;
end;

procedure TdmJCData.quSubContractPaymentNewRecord(DataSet: TDataSet);
begin
  quSubContractPaymentSUBCONTRACT_NO.AsString :=
    quSubContract_detailSUBCONTRACT_NO.AsString;
  quSubContractPaymentLINE_NO.AsInteger :=
    quSubContract_detailLINE_NO.AsInteger;
  quSubContractPaymentPAID_DATE.AsDateTime := date;
  quSubContractPaymentPAID_AMT.Value := 0;

end;

procedure TdmJCData.quSubContractAfterClose(DataSet: TDataSet);
begin
  with quSubContract_detail do
    if Active then Close;
end;

procedure TdmJCData.quSubContract_detailAfterClose(DataSet: TDataSet);
begin
  with quSubContractPayment do
    if Active then Close;
end;

procedure TdmJCData.quSubContract_detailAfterOpen(DataSet: TDataSet);
begin
  with quSubContractPayment do
    if not Active then Open;
end;

procedure TdmJCData.quSubContractPaymentBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('确實要刪除<' + quSubContractPaymentVOUCHER_NO.AsString + '>么?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Abort;
end;

procedure TdmJCData.quSubContract_detailBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('确實要刪除<' + quSubContract_detailINVC_NO.AsString + '>么?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Abort;

end;

procedure TdmJCData.quJobClaimCalcFields(DataSet: TDataSet);
begin
  quJobClaimJobNo.Value := trim(quJobClaimJOB_NO_1.Value);
  if trim(quJobClaimJOB_NO_2.Value) <> '' then
    quJobClaimJobNo.Value := quJobClaimJobNo.Value
                           + '-' + trim(quJobClaimJOB_NO_2.Value);
end;

procedure TdmJCData.quJobClaimBeforePost(DataSet: TDataSet);
begin
  if quJobClaimAPPLY_AMT.Value < 0 then
  begin
    ShowMessage('申報金額錯誤');
    Abort;
  end;
end;

end.
