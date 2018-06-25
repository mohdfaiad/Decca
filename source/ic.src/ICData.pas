unit ICData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwdatsrc, Wwquery;

type
  TdmICData = class(TDataModule)
    dbICData: TDatabase;
    quICControl: TwwQuery;
    dsICControl: TwwDataSource;
    quProfitCtr: TwwQuery;
    dsProfitCtr: TwwDataSource;
    usProfitCtr: TUpdateSQL;
    quWareHouse: TwwQuery;
    dsWareHouse: TwwDataSource;
    usWareHouse: TUpdateSQL;
    quLocation: TwwQuery;
    dsLocation: TwwDataSource;
    usLocation: TUpdateSQL;
    quItemCatFil: TwwQuery;
    dsItemCatFil: TwwDataSource;
    usItemCatFil: TUpdateSQL;
    quItemSubcatFil: TwwQuery;
    dsItemSubcatFil: TwwDataSource;
    usItemSubcatFil: TUpdateSQL;
    quAlter: TwwQuery;
    dsAlter: TwwDataSource;
    usAlter: TUpdateSQL;
    quSelAlter: TwwQuery;
    dsSelAlter: TwwDataSource;
    usSelAlter: TUpdateSQL;
    quUserWhs: TwwQuery;
    dsUserWhs: TwwDataSource;
    usUserWhs: TUpdateSQL;
    quProfitCtrPROFIT_CTR_SEG: TIntegerField;
    quProfitCtrPROFIT_CTR: TStringField;
    quProfitCtrDESCRIPTION: TStringField;
    quLocationWHS_CODE: TStringField;
    quLocationLOC_CODE: TStringField;
    quLocationDESCRIPTION: TStringField;
    quLocationPROFIT_CTR: TStringField;
    quLocationCOMMENT: TBlobField;
    quWareHouseWHS_CODE: TStringField;
    quWareHouseDESCRIPTION: TStringField;
    quWareHousePROFIT_CTR: TStringField;
    quWareHouseTRACK_LOCATION: TStringField;
    quWareHouseCOMMENT: TBlobField;
    quItemCatFilITEM_PROD_CAT: TStringField;
    quItemCatFilDESCRIPTION: TStringField;
    quSelAlterITEM_NO: TStringField;
    quSelAlterItem_Desc: TStringField;
    quAlterITEM_NO: TStringField;
    quAlterALTER_SEQ_NO: TIntegerField;
    quAlterALTER_ITEM_NO: TStringField;
    quAlterCOMMENT: TBlobField;
    quAlterAlter_Desc: TStringField;
    dbCommon: TDatabase;
    quSelUser: TwwQuery;
    quUserWhsUSER_ID: TStringField;
    quUserWhsWHS_CODE: TStringField;
    quUserWhswhs_desc: TStringField;
    quItemFil: TwwQuery;
    dsItemFil: TwwDataSource;
    usItemFil: TUpdateSQL;
    quItemFilITEM_NO: TStringField;
    quItemFilDESCRIPTION: TStringField;
    quItemFilITEM_PROD_CAT: TStringField;
    quItemFilITEM_SUBCAT: TStringField;
    quItemFilITEM_TYPE: TStringField;
    quItemFilKIT_TYPE: TStringField;
    quItemFilUSE_PIECE_FLAG: TStringField;
    quItemFilITEM_PIECES: TIntegerField;
    quItemFilITEM_LENGTH: TBCDField;
    quItemFilITEM_WIDTH: TBCDField;
    quItemFilITEM_HEIGHT: TBCDField;
    quItemFilDIMENSION_UNIT: TStringField;
    quItemFilALT_UNIT_1: TStringField;
    quItemFilALT_UNIT_2: TStringField;
    quItemFilINVENTORY_AC: TStringField;
    quItemFilLIABILITY_AC: TStringField;
    quItemFilSALES_AC: TStringField;
    quItemFilCR_MEMO_AC: TStringField;
    quItemFilEXPENSE_AC: TStringField;
    quItemFilDISCOUNT_AC: TStringField;
    quItemFilBO_CONTROL: TStringField;
    quItemFilLAST_USE_DATE: TDateTimeField;
    quItemFilJOB_COST_CAT: TStringField;
    quItemFilUSER_DEF_FLD01: TStringField;
    quItemFilUSER_DEF_FLD02: TStringField;
    quItemFilUSER_DEF_FLD03: TStringField;
    quItemFilUSER_DEF_FLD04: TStringField;
    quItemFilUSER_DEF_FLD05: TStringField;
    quItemFilUSER_DEF_FLD06: TStringField;
    quItemFilUSER_DEF_FLD07: TStringField;
    quItemFilUSER_DEF_FLD08: TStringField;
    quItemFilUSER_DEF_FLD09: TStringField;
    quItemFilUSER_DEF_FLD10: TStringField;
    quItemFilCOMMENT: TBlobField;
    quItemPhoto: TwwQuery;
    dsItemPhoto: TwwDataSource;
    usItemPhoto: TUpdateSQL;
    quItemPhotoITEM_NO: TStringField;
    quItemPhotoPHOTO: TBlobField;
    quKitFil: TwwQuery;
    dsKitFil: TwwDataSource;
    usKitFil: TUpdateSQL;
    quKitDetail: TwwQuery;
    dsKitDetail: TwwDataSource;
    usKitDetail: TUpdateSQL;
    quKitFilITEM_NO: TStringField;
    quKitFilCOMMENT: TBlobField;
    quKitDetailITEM_NO: TStringField;
    quKitDetailCOMP_ITEM_NO: TStringField;
    quKitDetailFILL_REQ_FLAG: TStringField;
    quKitDetailQTY_MOD_FLAG: TStringField;
    quKitDetailMOD_FLAG: TStringField;
    quKitFilItem_Desc: TStringField;
    quKitDetailComp_Desc: TStringField;
    quIcTrxFil: TwwQuery;
    dsIcTrxFil: TwwDataSource;
    usIcTrxFil: TUpdateSQL;
    quIcTrxDetail: TwwQuery;
    dsIcTrxDetail: TwwDataSource;
    usIcTrxDetail: TUpdateSQL;
    quIcTrxLot: TwwQuery;
    dsIcTrxLot: TwwDataSource;
    usIcTrxLot: TUpdateSQL;
    quIcTrxFilTRX_DOC_NO: TStringField;
    quIcTrxFilTRX_DATE: TDateTimeField;
    quIcTrxFilTRX_TYPE: TStringField;
    quIcTrxFilDOC_NO: TStringField;
    quIcTrxFilVENDOR_NO: TStringField;
    quIcTrxFilCREATE_DATE: TDateTimeField;
    quIcTrxFilCREATED_BY: TStringField;
    quIcTrxFilCOMMENT: TBlobField;
    quIcTrxDetailTRX_DOC_NO: TStringField;
    quIcTrxDetailTRX_LINE_NO: TIntegerField;
    quIcTrxDetailITEM_NO: TStringField;
    quIcTrxDetailWHS_CODE: TStringField;
    quIcTrxDetailLOC_CODE: TStringField;
    quIcTrxDetailTO_WHS_CODE: TStringField;
    quIcTrxDetailTO_LOC_CODE: TStringField;
    quIcTrxDetailJOB_NO_1: TStringField;
    quIcTrxDetailJOB_NO_2: TStringField;
    quIcTrxDetailFWO_NO: TStringField;
    quIcTrxLotTRX_DOC_NO: TStringField;
    quIcTrxLotTRX_LINE_NO: TIntegerField;
    quIcTrxLotLOT_NO: TStringField;
    quIcTrxLotPO_NO: TStringField;
    quIcTrxLotEXPIRE_DATE: TDateTimeField;
    quIcTrxLotCOMMENT: TBlobField;
    quIcTrxDetailJobNo: TStringField;
    quIcTrxDetailItem_Desc: TStringField;
    quIcTrxDetailWhs_Desc: TStringField;
    quIcTrxDetailLoc_Desc: TStringField;
    quIcTrxDetailTo_Whs_Desc: TStringField;
    quIcTrxDetailTo_Loc_Desc: TStringField;
    quItemStockStatus: TwwQuery;
    dsItemStockStatus: TwwDataSource;
    usItemStockStatus: TUpdateSQL;
    dsItemStockLoc: TwwDataSource;
    usItemStockLoc: TUpdateSQL;
    dsItemLotFil: TwwDataSource;
    usItemLotFil: TUpdateSQL;
    dsItemHist: TwwDataSource;
    usItemHist: TUpdateSQL;
    quItemStockStatusWHS_CODE: TStringField;
    quItemStockStatusITEM_NO: TStringField;
    quItemStockStatusLAST_USE_DATE: TDateTimeField;
    quItemStockStatusCOMMENT: TBlobField;
    quItemSubcatFilITEM_SUBCAT: TStringField;
    quItemSubcatFilDESCRIPTION: TStringField;
    quSelUserWhs: TwwQuery;
    quSelUserWhsUSER_ID: TStringField;
    quSelUserWhsWHS_CODE: TStringField;
    quSelUserWhsWHS_DESC: TStringField;
    quSelLoc: TwwQuery;
    deSelUserWhs: TwwDataSource;
    quSelLocLOC_CODE: TStringField;
    quSelLocDESCRIPTION: TStringField;
    quItemLotFil: TwwQuery;
    quItemLotFilITEM_NO: TStringField;
    quItemLotFilWHS_CODE: TStringField;
    quItemLotFilLOT_NO: TStringField;
    quItemLotFilRECV_DATE: TDateTimeField;
    quItemLotFilLST_USE_DATE: TDateTimeField;
    quItemLotFilEXPIRE_DATE: TDateTimeField;
    quItemStockLoc: TwwQuery;
    quItemStockLocWHS_CODE: TStringField;
    quItemStockLocITEM_NO: TStringField;
    quItemStockLocLOC_CODE: TStringField;
    quItemHist: TwwQuery;
    quTrxItem: TwwQuery;
    dsTrxItem: TwwDataSource;
    usTrxItem: TUpdateSQL;
    quTrxItemPhoto: TwwQuery;
    StringField32: TStringField;
    BlobField2: TBlobField;
    dsTrxItemPhoto: TwwDataSource;
    quIcTrxDetailJOB_COST_CAT: TStringField;
    quIcTrxDetailWHS_QTY_ON_HAND: TBCDField;
    quIcTrxDetailLOC_QTY_ON_HAND: TBCDField;
    quSelUserWhsTRACK_LOCATION: TStringField;
    quStockStatus: TwwQuery;
    dsStockStatus: TwwDataSource;
    usStockStatus: TUpdateSQL;
    dsStockLoc: TwwDataSource;
    usStockLoc: TUpdateSQL;
    quStockLoc: TwwQuery;
    quLotFil: TwwQuery;
    dsLotFil: TwwDataSource;
    usLotFil: TUpdateSQL;
    quItemStockStatusWHS_DESC: TStringField;
    quItemStockLocLoc_Desc: TStringField;
    quLotFilITEM_NO: TStringField;
    quLotFilWHS_CODE: TStringField;
    quLotFilLOT_NO: TStringField;
    quLotFilRECV_DATE: TDateTimeField;
    quLotFilLST_USE_DATE: TDateTimeField;
    quLotFilEXPIRE_DATE: TDateTimeField;
    quItemFilINV_PROFIT_CTR_1: TStringField;
    quItemFilINV_PROFIT_CTR_2: TStringField;
    quItemFilLIA_PROFIT_CTR_1: TStringField;
    quItemFilLIA_PROFIT_CTR_2: TStringField;
    quItemFilSAL_PROFIT_CTR_1: TStringField;
    quItemFilSAL_PROFIT_CTR_2: TStringField;
    quItemFilCRM_PROFIT_CTR_1: TStringField;
    quItemFilCRM_PROFIT_CTR_2: TStringField;
    quItemFilEXP_PROFIT_CTR_1: TStringField;
    quItemFilEXP_PROFIT_CTR_2: TStringField;
    quItemFilDIS_PROFIT_CTR_1: TStringField;
    quItemFilDIS_PROFIT_CTR_2: TStringField;
    quAlterItem: TwwQuery;
    StringField12: TStringField;
    IntegerField2: TIntegerField;
    StringField13: TStringField;
    BlobField1: TBlobField;
    StringField14: TStringField;
    dsAlterItem: TwwDataSource;
    usAlterItem: TUpdateSQL;
    quICControlCONTROL_KEY: TIntegerField;
    quICControlCOST_METHOD: TStringField;
    quICControlUSE_PROFIT_CTR: TStringField;
    quICControlPROFIT_CTR_BY: TStringField;
    quICControlDFLT_PROFIT_CTR: TStringField;
    quICControlPROFIT_CTR_POS: TIntegerField;
    quICControlUSE_COST_BY_WHS: TStringField;
    quICControlAUTO_JOB_COST_CAT: TStringField;
    quICControlPOST_BY_USER: TStringField;
    quICControlLST_END_PERIOD: TDateTimeField;
    quICControlCURR_END_PERIOD: TDateTimeField;
    quICControlLST_XFER_DATE: TDateTimeField;
    quICControlLST_JRNL_DOC_NO: TStringField;
    quICControlNO_OF_USER_FLDS: TIntegerField;
    quICControlINVENTORY_AC: TStringField;
    quICControlINV_PFT_CTR_1: TStringField;
    quICControlINV_PFT_CTR_2: TStringField;
    quICControlLIABILITY_AC: TStringField;
    quICControlLIAB_PFT_CTR_1: TStringField;
    quICControlLIAB_PFT_CTR_2: TStringField;
    quICControlSALES_AC: TStringField;
    quICControlSALES_PFT_CTR_1: TStringField;
    quICControlSALES_PFT_CTR_2: TStringField;
    quICControlCR_MEMO_AC: TStringField;
    quICControlCR_MEMO_PFT_CTR_1: TStringField;
    quICControlCR_MEMO_PFT_CTR_2: TStringField;
    quICControlEXPENSE_AC: TStringField;
    quICControlEXPENSE_PFT_CTR_1: TStringField;
    quICControlEXPENSE_PFT_CTR_2: TStringField;
    quICControlDISCOUNT_AC: TStringField;
    quICControlDISC_PFT_CTR_1: TStringField;
    quICControlDISC_PFT_CTR_2: TStringField;
    quICControlUSER_DEF_TITLE01: TStringField;
    quICControlUSER_DEF_TITLE02: TStringField;
    quICControlUSER_DEF_TITLE03: TStringField;
    quICControlUSER_DEF_TITLE04: TStringField;
    quICControlUSER_DEF_TITLE05: TStringField;
    quICControlUSER_DEF_TITLE06: TStringField;
    quICControlUSER_DEF_TITLE07: TStringField;
    quICControlUSER_DEF_TITLE08: TStringField;
    quICControlUSER_DEF_TITLE09: TStringField;
    quICControlUSER_DEF_TITLE10: TStringField;
    quIcTrxComp: TwwQuery;
    dsIcTrxComp: TwwDataSource;
    usIcTrxComp: TUpdateSQL;
    quIcTrxCompTRX_DOC_NO: TStringField;
    quIcTrxCompTRX_LINE_NO: TIntegerField;
    quIcTrxCompCOMP_LINE_NO: TIntegerField;
    quIcTrxCompCOMP_ITEM_NO: TStringField;
    quIcTrxCompLOT_NO: TStringField;
    quIcTrxCompComp_Desc: TStringField;
    quTrxItemITEM_NO: TStringField;
    quTrxItemDESCRIPTION: TStringField;
    quTrxItemITEM_TYPE: TStringField;
    quIcTrxDetailQTY_ON_HAND: TBCDField;
    quTrxItemLAST_USE_DATE: TDateTimeField;
    quTrxItemITEM_PIECES: TIntegerField;
    quIcTrxCompWHS_CODE: TStringField;
    quIcTrxCompLOC_CODE: TStringField;
    quIcTrxCompItem_Cost: TBCDField;
    quIcTrxCompWhs_Cost: TBCDField;
    quIcTrxCompLot_cost: TBCDField;
    quIcTrxDetailItem_Cost: TBCDField;
    quIcTrxDetailWhs_cost: TBCDField;
    dbJcData: TDatabase;
    quJobDailySmry: TwwQuery;
    dsJobDailySmry: TwwDataSource;
    usJobDailySmry: TUpdateSQL;
    quFwoCostAnalysis: TwwQuery;
    dsFwoCostAnalysis: TwwDataSource;
    usFwoCostAnalysis: TUpdateSQL;
    quFwoCostCat: TwwQuery;
    dsFwoCostCat: TwwDataSource;
    usFwoCostCat: TUpdateSQL;
    quJobFwo: TwwQuery;
    quIcTrxDetailLibrary_Item_No: TStringField;
    quIcTrxDetailItem_Job_no: TStringField;
    quItemFilITEM_JOB_NO: TStringField;
    quItemFilLIBRARY_ITEM_NO: TStringField;
    quICControlOVER_FLAG: TStringField;
    quItemFilCONV_FACTOR_1: TFloatField;
    quItemFilCONV_FACTOR_2: TFloatField;
    quItemFilQTY_ON_HAND: TFloatField;
    quItemFilAVG_COST: TFloatField;
    quItemFilMIN_QTY: TFloatField;
    quItemFilMAX_QTY: TFloatField;
    quItemFilRPLC_COST: TFloatField;
    quItemStockStatusQTY_ON_HAND: TFloatField;
    quItemStockStatusQTY_RESERVED: TFloatField;
    quItemStockStatusSTOCK_COST: TFloatField;
    quItemStockStatusRPLC_COST: TFloatField;
    quItemStockStatusMIN_QTY: TFloatField;
    quItemStockStatusMAX_QTY: TFloatField;
    quItemStockLocQTY_ON_HAND: TFloatField;
    quItemStockLocQTY_RESERVED: TFloatField;
    quKitFilKIT_QTY: TFloatField;
    quKitDetailCOMP_QTY: TFloatField;
    quJobDailySmryJOB_NO_1: TStringField;
    quJobDailySmryJOB_NO_2: TStringField;
    quJobDailySmrySUB_JOB_NO: TStringField;
    quJobDailySmryJOB_SMRY_DATE: TDateTimeField;
    quJobDailySmryJOB_COST_CAT: TStringField;
    quJobDailySmryFWO_NO: TStringField;
    quJobDailySmryJOB_SMRY_TYPE: TStringField;
    quJobDailySmryJOB_REG_QTY: TFloatField;
    quJobDailySmryJOB_REG_AMT: TFloatField;
    quJobDailySmryJOB_RETAIN_AP: TFloatField;
    quJobDailySmryJOB_RETAIN_AR: TFloatField;
    quJobDailySmryJOB_PREM_QTY: TFloatField;
    quJobDailySmryJOB_PREM_AMT: TFloatField;
    quFwoCostAnalysisJOB_NO_1: TStringField;
    quFwoCostAnalysisJOB_NO_2: TStringField;
    quFwoCostAnalysisSUB_JOB_NO: TStringField;
    quFwoCostAnalysisFWO_NO: TStringField;
    quFwoCostAnalysisQUOT_ITEM_NO: TStringField;
    quFwoCostAnalysisDESCRIPTION: TStringField;
    quFwoCostAnalysisQUOT_ITEM_UNIT: TStringField;
    quFwoCostAnalysisSECTION_NO: TStringField;
    quFwoCostAnalysisBUDGET_QTY: TFloatField;
    quFwoCostAnalysisBUDGET_AMT: TFloatField;
    quFwoCostAnalysisACTUAL_QTY: TFloatField;
    quFwoCostAnalysisACTUAL_AMT: TFloatField;
    quFwoCostAnalysisSTD_QTY: TFloatField;
    quFwoCostAnalysisSTD_AMOUNT: TFloatField;
    quFwoCostCatJOB_NO_1: TStringField;
    quFwoCostCatJOB_NO_2: TStringField;
    quFwoCostCatFWO_NO: TStringField;
    quFwoCostCatJOB_COST_CAT: TStringField;
    quFwoCostCatJOB_COST_CAT_UNIT: TStringField;
    quFwoCostCatREG_RATE: TBCDField;
    quFwoCostCatPREM_RATE: TBCDField;
    quFwoCostCatBUDGET_AMT: TBCDField;
    quFwoCostCatBUDGET_QTY: TBCDField;
    quFwoCostCatJOB_REG_QTY: TFloatField;
    quFwoCostCatJOB_REG_AMT: TFloatField;
    quFwoCostCatJOB_PREM_QTY: TFloatField;
    quFwoCostCatJOB_PREM_AMT: TFloatField;
    quItemLotFilRECV_QTY: TFloatField;
    quItemLotFilQTY_ON_HAND: TFloatField;
    quItemLotFilQTY_RESERVED: TFloatField;
    quItemLotFilLOT_COST: TFloatField;
    quItemLotFilRPLC_COST: TFloatField;
    quItemFilQTY_RESERVED: TFloatField;
    quTrxItemQTY_RESERVED: TFloatField;
    quTrxItemITEM_JOB_NO: TStringField;
    quIcTrxDetailTRX_QTY: TFloatField;
    quIcTrxDetailTRX_COST: TFloatField;
    quIcTrxLotLOT_QTY: TFloatField;
    quStockStatusWHS_CODE: TStringField;
    quStockStatusITEM_NO: TStringField;
    quStockStatusLAST_USE_DATE: TDateTimeField;
    quStockStatusCOMMENT: TBlobField;
    quStockStatusQTY_ON_HAND: TFloatField;
    quStockStatusQTY_RESERVED: TFloatField;
    quStockStatusSTOCK_COST: TFloatField;
    quStockStatusRPLC_COST: TFloatField;
    quStockStatusMIN_QTY: TFloatField;
    quStockStatusMAX_QTY: TFloatField;
    quStockLocWHS_CODE: TStringField;
    quStockLocITEM_NO: TStringField;
    quStockLocLOC_CODE: TStringField;
    quStockLocQTY_ON_HAND: TFloatField;
    quStockLocQTY_RESERVED: TFloatField;
    quLotFilRECV_QTY: TFloatField;
    quLotFilQTY_ON_HAND: TFloatField;
    quLotFilQTY_RESERVED: TFloatField;
    quLotFilLOT_COST: TFloatField;
    quLotFilRPLC_COST: TFloatField;
    quIcTrxCompCOMP_QTY: TFloatField;
    quTrxItemQTY_ON_HAND: TFloatField;
    quTrxItemAVG_COST: TFloatField;
    quTrxItemRPLC_COST: TFloatField;
    quTrxItemMIN_QTY: TFloatField;
    quTrxItemMAX_QTY: TFloatField;
    quItemHistITEM_NO: TStringField;
    quItemHistWHS_CODE: TStringField;
    quItemHistHIST_DATE: TDateTimeField;
    quItemHistSITE_NO: TIntegerField;
    quItemHistHIST_SEQ: TDateTimeField;
    quItemHistHIST_TYPE: TStringField;
    quItemHistTRX_DOC_NO: TStringField;
    quItemHistLOT_NO: TStringField;
    quItemHistTO_WHS_CODE: TStringField;
    quItemHistCREATED_BY: TStringField;
    quItemHistCREATE_DATE: TDateTimeField;
    quItemHistJOB_NO_1: TStringField;
    quItemHistJOB_NO_2: TStringField;
    quItemHistJOB_COST_CAT: TStringField;
    quItemHistSUB_JOB_NO: TStringField;
    quItemHistFWO_NO: TStringField;
    quItemHistKIT_ITEM_NO: TStringField;
    quItemHistKIT_HIST_SEQ: TDateTimeField;
    quItemHistCOMMENT: TStringField;
    quItemHistLST_MS_DATE: TDateTimeField;
    quItemHistLST_UPD_DATE: TDateTimeField;
    quItemHistHIST_QTY: TFloatField;
    quItemHistHIST_COST: TFloatField;
    quItemHistHIST_PRICE: TFloatField;
    quItemFilRep: TwwQuery;
    quItemFilRepITEM_NO: TStringField;
    quItemFilRepDESCRIPTION: TStringField;
    quItemFilRepITEM_PROD_CAT: TStringField;
    quItemFilRepITEM_TYPE: TStringField;
    quItemFilRepITEM_STOCK_UNIT: TStringField;
    quItemFilRepDIMENSION_UNIT: TStringField;
    quItemFilRepQTY_ON_HAND: TFloatField;
    quItemFilRepAVG_COST: TFloatField;
    quItemFilRepJOB_COST_CAT: TStringField;
    quItemFilRepItemCatDesc: TStringField;
    quItemFilRepCRM_PROFIT_CTR_2: TStringField;
    quItemFilRepEXP_PROFIT_CTR_1: TStringField;
    quItemFilRepEXP_PROFIT_CTR_2: TStringField;
    quItemFilRepDIS_PROFIT_CTR_1: TStringField;
    quItemFilRepDIS_PROFIT_CTR_2: TStringField;
    quItemFilRepITEM_JOB_NO: TStringField;
    quItemFilRepLIBRARY_ITEM_NO: TStringField;
    quItemFilRepCONV_FACTOR_1: TFloatField;
    quItemFilRepCONV_FACTOR_2: TFloatField;
    quItemFilRepMIN_QTY: TFloatField;
    quItemFilRepMAX_QTY: TFloatField;
    quItemFilRepRPLC_COST: TFloatField;
    quItemFilRepQTY_RESERVED: TFloatField;
    quItemFilRepITEM_SUBCAT: TStringField;
    quItemFilRepKIT_TYPE: TStringField;
    quItemFilRepUSE_PIECE_FLAG: TStringField;
    quItemFilRepITEM_PIECES: TIntegerField;
    quItemFilRepITEM_LENGTH: TBCDField;
    quItemFilRepITEM_WIDTH: TBCDField;
    quItemFilRepITEM_HEIGHT: TBCDField;
    quItemFilRepALT_UNIT_1: TStringField;
    quItemFilRepALT_UNIT_2: TStringField;
    dsSelServer: TDataSource;
    quCompany: TQuery;
    quSelServer: TQuery;
    quProg_desc: TwwQuery;
    quProg_descMODULE_ID: TStringField;
    quProg_descPROGRAM_ID: TStringField;
    quProg_descDESCRIPTION: TStringField;
    quSelFuncApproved: TQuery;
    dsSelFuncApproved: TDataSource;
    quJobDetail: TwwQuery;
    quJobDetailJOB_NO_1: TStringField;
    quJobDetailJOB_NO_2: TStringField;
    quJobDetailFWO_NO: TStringField;
    quJobDetailJOB_COST_CAT: TStringField;
    quJobDetailSUB_JOB_NO: TStringField;
    quJobDetailSUB_JOB_COST_CAT: TStringField;
    quJobDetailHIST_DATE: TDateTimeField;
    quJobDetailSITE_NO: TIntegerField;
    quJobDetailHIST_SEQ: TDateTimeField;
    quJobDetailDOC_NO: TStringField;
    quJobDetailDETAIL_TYPE: TStringField;
    quJobDetailDETAIL_AMT: TBCDField;
    quJobDetailRETAIN_AMT: TBCDField;
    quJobDetailDETAIL_QTY: TFloatField;
    quJobDetailITEM_NO: TStringField;
    quJobDetailWHS_CODE: TStringField;
    quJobDetailITEM_UNIT_COST: TFloatField;
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
    dsJobDetail: TwwDataSource;
    usJobDetail: TUpdateSQL;
    quItemFilITEM_STOCK_UNIT: TStringField;
    quTrxItemITEM_STOCK_UNIT: TStringField;
    procedure quProfitCtrBeforeDelete(DataSet: TDataSet);
    procedure quProfitCtrAfterPost(DataSet: TDataSet);
    procedure quWareHouseBeforeDelete(DataSet: TDataSet);
    procedure quWareHouseAfterPost(DataSet: TDataSet);
    procedure quLocationAfterPost(DataSet: TDataSet);
    procedure quLocationNewRecord(DataSet: TDataSet);
    procedure quItemCatFilAfterPost(DataSet: TDataSet);
    procedure quItemSubcatFilAfterPost(DataSet: TDataSet);
    procedure quAlterAfterPost(DataSet: TDataSet);
    procedure quAlterNewRecord(DataSet: TDataSet);
    procedure quItemFilAfterPost(DataSet: TDataSet);
    procedure quItemPhotoAfterPost(DataSet: TDataSet);
    procedure quItemPhotoNewRecord(DataSet: TDataSet);
    procedure quKitFilAfterPost(DataSet: TDataSet);
    procedure quKitDetailAfterPost(DataSet: TDataSet);
    procedure quKitDetailNewRecord(DataSet: TDataSet);
    procedure quIcTrxDetailNewRecord(DataSet: TDataSet);
    procedure quIcTrxLotNewRecord(DataSet: TDataSet);
    procedure quIcTrxFilNewRecord(DataSet: TDataSet);
    procedure quIcTrxDetailAfterPost(DataSet: TDataSet);
    procedure quIcTrxFilAfterPost(DataSet: TDataSet);
    procedure quIcTrxLotAfterPost(DataSet: TDataSet);
    procedure quItemStockStatusAfterPost(DataSet: TDataSet);
    procedure quItemStockLocAfterPost(DataSet: TDataSet);
    procedure quItemStockStatusNewRecord(DataSet: TDataSet);
    procedure quItemStockLocNewRecord(DataSet: TDataSet);
    procedure quIcTrxDetailBeforeInsert(DataSet: TDataSet);
    procedure quIcTrxDetailAfterCancel(DataSet: TDataSet);
    procedure quAlterItemAfterPost(DataSet: TDataSet);
    procedure quAlterItemNewRecord(DataSet: TDataSet);
    procedure quIcTrxCompAfterPost(DataSet: TDataSet);
    procedure quIcTrxCompNewRecord(DataSet: TDataSet);
    procedure quIcTrxFilBeforePost(DataSet: TDataSet);
    procedure quIcTrxFilBeforeEdit(DataSet: TDataSet);
    procedure quKitDetailBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmICData: TdmICData;

implementation
uses IcMain , IcTrxDetail, KitDetail;
{$R *.DFM}

procedure TdmICData.quProfitCtrBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('刪除該記錄?',
     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
     Abort;
end;

procedure TdmICData.quProfitCtrAfterPost(DataSet: TDataSet);
begin
  with quProfitCtr do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quWareHouseBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('刪除該記錄?',
     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
     Abort;
end;

procedure TdmICData.quWareHouseAfterPost(DataSet: TDataSet);
begin
  with quWareHouse do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quLocationAfterPost(DataSet: TDataSet);
begin
  with quLocation do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quLocationNewRecord(DataSet: TDataSet);
begin
  with dmICData do
  begin
    quLocation.FieldByName('Whs_code').AsString :=
      quWareHouse.FieldByName('whs_code').AsString;
  end;
end;

procedure TdmICData.quItemCatFilAfterPost(DataSet: TDataSet);
begin
  with quItemCatFil do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quItemSubcatFilAfterPost(DataSet: TDataSet);
begin
  with quItemSubcatFil do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quAlterAfterPost(DataSet: TDataSet);
begin
  with quAlter do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quAlterNewRecord(DataSet: TDataSet);
begin
  quAlter.FieldByName('Item_No').AsString :=
    quSelAlter.FieldByName('Item_No').AsString;
  quAlter.FieldByName('Alter_seq_no').AsInteger :=
    quSelAlter.RecordCount + 1;
end;

procedure TdmICData.quItemFilAfterPost(DataSet: TDataSet);
begin
  with quItemFil do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quItemPhotoAfterPost(DataSet: TDataSet);
begin
  with quItemPhoto do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quItemPhotoNewRecord(DataSet: TDataSet);
begin
  quItemPhoto.FieldByName('Item_No').AsString :=
    quItemFil.FieldByName('Item_No').ASString;
end;

procedure TdmICData.quKitFilAfterPost(DataSet: TDataSet);
begin
  with quKitFil do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quKitDetailAfterPost(DataSet: TDataSet);
begin
  with qukitDetail do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quKitDetailNewRecord(DataSet: TDataSet);
begin
  quKitDetail.FieldByName('Item_No').AsString :=
    quKitFil.FieldByName('Item_No').AsString;
  quKitDetail.FieldByName('Fill_Req_Flag').AsString := 'Y';
  quKitDetail.FieldByName('Qty_Mod_Flag').AsString := 'Y';
end;

procedure TdmICData.quIcTrxDetailNewRecord(DataSet: TDataSet);
begin
  quIcTrxDetail.FieldByName('Trx_Doc_No').AsString :=
    quIcTrxFil.FieldByName('Trx_Doc_No').AsString ;
  quIcTrxDetail.FieldByName('Trx_Line_No').AsInteger :=
    quIcTrxDetail.RecordCount + 1 ;

end;

procedure TdmICData.quIcTrxLotNewRecord(DataSet: TDataSet);
begin
  quIcTrxLot.FieldByName('Trx_Doc_no').AsString :=
    quIcTrxDetail.FieldByName('Trx_Doc_No').AsString;
  quIcTrxLot.FieldByName('Trx_Line_no').AsString :=
    quIcTrxDetail.FieldByName('Trx_Line_No').AsString;
  quIcTrxLot.FieldByName('Lot_qty').Value :=
    quIcTrxDetail.FieldByName('Trx_Qty').Value;
end;

procedure TdmICData.quIcTrxFilNewRecord(DataSet: TDataSet);
begin
  quIcTrxFil.FieldByName('Create_date').Value := Date;
  quIcTrxFil.FieldByName('Trx_date').Value := Date;
  quIcTrxFil.FieldByName('Created_By').AsString := wUser;
  quIcTrxFil.FieldByName('Trx_Type').AsString := 'J';
end;

procedure TdmICData.quIcTrxDetailAfterPost(DataSet: TDataSet);
begin
  ShowMessage(fmIcTrxDetail.dedNewWhsQty.Text);
  with quIcTrxDetail do
  begin
    ApplyUpdates;
    CommitUpdates ;
  end;
  {with quStockStatus do
  begin
    Edit;
    if quIcTrxFil.FieldByName('Trx_Type').AsString = 'R' then
    begin
      FieldByName('Rplc_cost').Value := FieldByName('Stock_cost').Value;
      FieldByName('Stock_cost').Value := wNewAvgCost;
    end
    else
      FieldByName('Last_use_Date').Value := Date;
    FieldByName('Qty_on_hand').Value := wNewWhsQty;
    Post;
  end;
  if fmIcTrxDetail.dlcLocNo.Text <> '' then
  begin
    with quStockLoc do
    begin
      Edit;
      FieldByName('Qty_on_hand').Value := wNewLocQty;
      Post;
    end;
  end;
  with quTrxItem  do
  begin
    Edit;
    if quIcTrxFil.FieldByName('Trx_Type').AsString = 'R' then
    begin
      FieldByName('Rplc_Cost').Value := FieldByName('Avg_Cost').Value;
      FieldByName('Avg_Cost').Value := wNewAvgCost;
    end
    else
      FieldByName('Last_use_Date').Value := Date;
    FieldByName('Qty_On_Hand').Value := wNewQtyOnHand;
    Post;
  end; }
end;

procedure TdmICData.quIcTrxFilAfterPost(DataSet: TDataSet);
begin
  with quIcTrxFil  do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quIcTrxLotAfterPost(DataSet: TDataSet);
begin
  with quIcTrxLot  do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quItemStockStatusAfterPost(DataSet: TDataSet);
begin
  with quItemStockStatus do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quItemStockLocAfterPost(DataSet: TDataSet);
begin
  with quItemStockLoc do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quItemStockStatusNewRecord(DataSet: TDataSet);
begin
  quItemStockStatus.FieldByName('Item_No').AsString :=
    quItemFil.FieldByName('Item_No').AsString;
  quItemStockStatus.FieldByName('Qty_on_hand').Value := 0;
  quItemStockStatus.FieldByName('Qty_Reserved').Value := 0;
  quItemStockStatus.FieldByName('Stock_cost').Value := 0;
  quItemStockStatus.FieldByName('Rplc_Cost').Value := 0;
end;

procedure TdmICData.quItemStockLocNewRecord(DataSet: TDataSet);
begin
  quItemStockLoc.FieldByName('Item_No').AsString  :=
    quItemStockStatus.FieldByName('Item_No').AsString;
  quItemStockLoc.FieldByName('whs_code').AsString  :=
    quItemStockStatus.FieldByName('Whs_code').AsString;
  quItemStockLoc.FieldByName('Qty_on_hand').Value  :=  0;
  quItemStockLoc.FieldByName('Qty_Reserved').Value  :=  0;
end;

procedure TdmICData.quIcTrxDetailBeforeInsert(DataSet: TDataSet);
begin
  with quTrxItem do
    if Active then
      Close;
  with quStockStatus do
    if Active then
      Close;
  with quStockLoc do
    if Active then
      Close; 
end;

procedure TdmICData.quIcTrxDetailAfterCancel(DataSet: TDataSet);
begin
  {with quTrxItem do
    if not Active then
      Open;
  with quStockStatus do
    if not Active then
      Open;
  with quStockLoc do
    if not Active then
      Open; }
end;

procedure TdmICData.quAlterItemAfterPost(DataSet: TDataSet);
begin
  with quAlterItem do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quAlterItemNewRecord(DataSet: TDataSet);
begin
  quAlterItem.FieldByName('Item_No').AsString :=
    quItemFil.FieldByName('Item_no').AsString;
  quAlterItem.FieldByName('Alter_Seq_No').AsInteger :=
    quAlterItem.RecordCount + 1;
end;

procedure TdmICData.quIcTrxCompAfterPost(DataSet: TDataSet);
begin
  with quIcTrxComp do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TdmICData.quIcTrxCompNewRecord(DataSet: TDataSet);
begin
  quIcTrxComp.FieldByName('Trx_Doc_no').AsString :=
    quIcTrxDetail.FieldByName('Trx_Doc_no').AsString ;
  quIcTrxComp.FieldByName('Trx_Line_no').AsString :=
    quIcTrxDetail.FieldByName('Trx_Line_no').AsString ;
  quIcTrxComp.FieldByName('Comp_Line_no').AsInteger :=
    quIcTrxComp.RecordCount + 1;
end;

procedure TdmICData.quIcTrxFilBeforePost(DataSet: TDataSet);
begin
  with quIcTrxFil  do
  begin
    if quIcTrxFilTRX_DOC_NO.IsNull then
    begin
      with quICControl do
      begin
        if not Active then
          Open;
        First;
        Edit;
        FieldByName('Lst_Jrnl_Doc_No').AsInteger :=
          FieldByName('Lst_Jrnl_Doc_No').AsInteger + 1;

        Post;
      end;
      FieldByName('Trx_Doc_No').AsString :=
        quICControl.FieldByName('Lst_Jrnl_Doc_No').AsString;
      quICControl.Close;
    end;
  end;
end;


procedure TdmICData.quIcTrxFilBeforeEdit(DataSet: TDataSet);
begin
  if quIcTrxDetail.RecordCount > 0 then
  begin
    ShowMessage('已經存有資料,不能更改!');
    Abort;
  end;
end;

procedure TdmICData.quKitDetailBeforeInsert(DataSet: TDataSet);
begin
  with quKitFil do
  begin
    if FieldByName('Item_no').Asstring = '' then
    begin
      ShowMessage('請填寫合成代號!');
      fmKitDetail.dlcItemNo.SetFocus;
      Abort;
    end
    else
    begin
      if (state = dsInsert) or (State = dsEdit) then
        Post;
    end;
  end;
end;

end.
