�
 TFMEXPFILE 0�  TPF0
TfmExpFile	fmExpFileLeftTop� BorderStylebsDialogCaption
��X���  ClientHeight� ClientWidth7Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelLabel1Left0Top Width8HeightCaption�}�l���Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel2Left0TopHWidth8HeightCaption�I����Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel3Left0ToppWidth8HeightCaption���W��Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDateTimePickerdtpStartDateLeftpTop Width� HeightCalAlignmentdtaLeftDate      ��@Time      ��@
DateFormatdfShortDateMode
dmComboBoxFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style KinddtkDate
ParseInput
ParentFont  TDateTimePicker
dtpEndDateLeftpTopHWidth� HeightCalAlignmentdtaLeftDate      ��@Time      ��@
DateFormatdfShortDateMode
dmComboBoxFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style KinddtkDate
ParseInput
ParentFont  TBitBtnbnOKLeftHTop� WidthKHeightCaption�̩wEnabledTabOrderOnClick	bnOKClickKindbkOK  TBitBtnbnCancelLeft� Top� WidthKHeightCaption����TabOrderKindbkCancel  TwwDBComboDlg
dclExpFileLeftpToppWidth� HeightOnCustomDlgdclExpFileCustomDlg
ShowButton	Style
csDropDownTabOrderUnboundDataType	wwDefaultOnChangedclExpFileChange  TListBoxlbFileLeftTop0WidthHeightTabStop
ItemHeightTabOrderVisible  TSaveDialogsdlFileName
DefaultExt.TxtFileNameExClockFilter%Text files (*.txt)|*.TXT|All File|*.*Left Top  TwwQuery	quExpFileDatabaseNamedbJCdataSQL.Stringsselect * from job_detail"where hist_date >= :Start_date and"           hist_date < :End_date  ;order by Job_no_1,job_no_2, Fwo_no,Job_cost_cat, hist_date  Params.Data
,     
Start_date 	 Z�
   End_date 	 Z�
   ValidateWithMask	LeftTopX TStringFieldquExpFileJOB_NO_1	FieldNameJOB_NO_1OriginJOB_DETAIL.JOB_NO_1Size  TStringFieldquExpFileJOB_NO_2	FieldNameJOB_NO_2OriginJOB_DETAIL.JOB_NO_2Size  TStringFieldquExpFileFWO_NO	FieldNameFWO_NOOriginJOB_DETAIL.FWO_NOSize  TStringFieldquExpFileJOB_COST_CAT	FieldNameJOB_COST_CATOriginJOB_DETAIL.JOB_COST_CATSize  TStringFieldquExpFileSUB_JOB_NO	FieldName
SUB_JOB_NOOriginJOB_DETAIL.SUB_JOB_NOSize  TDateTimeFieldquExpFileHIST_DATE	FieldName	HIST_DATEOriginJOB_DETAIL.HIST_DATE  TIntegerFieldquExpFileSITE_NO	FieldNameSITE_NOOriginJOB_DETAIL.SITE_NO  TDateTimeFieldquExpFileHIST_SEQ	FieldNameHIST_SEQOriginJOB_DETAIL.HIST_SEQ  TStringFieldquExpFileDOC_NO	FieldNameDOC_NOOriginJOB_DETAIL.DOC_NOSize
  TStringFieldquExpFileDETAIL_TYPE	FieldNameDETAIL_TYPEOriginJOB_DETAIL.DETAIL_TYPESize  	TBCDFieldquExpFileDETAIL_AMT	FieldName
DETAIL_AMTOriginJOB_DETAIL.DETAIL_AMTSize  	TBCDFieldquExpFileRETAIN_AMT	FieldName
RETAIN_AMTOriginJOB_DETAIL.RETAIN_AMTSize  	TBCDFieldquExpFileDETAIL_QTY	FieldName
DETAIL_QTYOriginJOB_DETAIL.DETAIL_QTY  TStringFieldquExpFileITEM_NO	FieldNameITEM_NOOriginJOB_DETAIL.ITEM_NOSize  TStringFieldquExpFileWHS_CODE	FieldNameWHS_CODEOriginJOB_DETAIL.WHS_CODESize  	TBCDFieldquExpFileITEM_UNIT_COST	FieldNameITEM_UNIT_COSTOriginJOB_DETAIL.ITEM_UNIT_COST  TStringFieldquExpFileITEM_UNIT	FieldName	ITEM_UNITOriginJOB_DETAIL.ITEM_UNITSize  TStringFieldquExpFileINVC_NO	FieldNameINVC_NOOriginJOB_DETAIL.INVC_NOSize
  TDateTimeFieldquExpFileINVC_DATE	FieldName	INVC_DATEOriginJOB_DETAIL.INVC_DATE  TStringFieldquExpFileCHQ_NO	FieldNameCHQ_NOOriginJOB_DETAIL.CHQ_NOSize
  TDateTimeFieldquExpFileCHQ_DATE	FieldNameCHQ_DATEOriginJOB_DETAIL.CHQ_DATE  TStringFieldquExpFileUSER_ID	FieldNameUSER_IDOriginJOB_DETAIL.USER_IDSize  TStringFieldquExpFileACCT_NO	FieldNameACCT_NOOriginJOB_DETAIL.ACCT_NOSize  TStringFieldquExpFilePFT_CTR_1	FieldName	PFT_CTR_1OriginJOB_DETAIL.PFT_CTR_1Size  TStringFieldquExpFilePFT_CTR_2	FieldName	PFT_CTR_2OriginJOB_DETAIL.PFT_CTR_2Size  
TMemoFieldquExpFileCOMMENT	FieldNameCOMMENTOriginJOB_DETAIL.COMMENTBlobTypeftMemoSize  TStringFieldquExpFileQTY_TYPE	FieldNameQTY_TYPEOriginJOB_DETAIL.QTY_TYPESize    