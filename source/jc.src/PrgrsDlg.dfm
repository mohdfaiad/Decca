�
 TFMPRGRSDLG 0�  TPF0TfmPrgrsDlg
fmPrgrsDlgLeft�Top-BorderStylebsDialogCaption�u�{���ضi�׳���ClientHeightKClientWidthYFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelSrcLabelLeftTop@Width� HeightAutoSizeCaption��������  TLabelDstLabelLeft� Top@Width� HeightAutoSizeCaption��ܦ�������(�u���|��)  TSpeedButton
IncludeBtnLeft� TopXWidth(HeightCaption>  TSpeedButton	IncAllBtnLeft� TopxWidth(HeightCaption>>OnClickIncAllBtnClick  TSpeedButton
ExcludeBtnLeft� Top� Width(HeightCaption<EnabledOnClickExcludeBtnClick  TSpeedButtonExAllBtnLeft� Top� Width(HeightCaption<<EnabledOnClickExcAllBtnClick  TLabellaJob_noLeftTopWidth0HeightCaption�u�{�s��  TLabel	lbJobDescLeft� TopWidthHeight  TListBoxSrcListLeftTopPWidth� Height� 
ItemHeightMultiSelect	Sorted	TabOrder 
OnDblClickSrcListDblClick  TListBoxDstListLeft� TopPWidth� Height� 
ItemHeightMultiSelect	TabOrder  TwwDBComboDlg	dbdJobNo1LeftATopWidthaHeightOnCustomDlgdbdJobNo1CustomDlg
ShowButton	Style
csDropDownTabOrderUnboundDataType	wwDefault  TBitBtnbtnOKLeftNTopWidthKHeightCaption���LTabOrderOnClick
btnOKClickKindbkOK  TBitBtnBitBtn1Left� TopWidthKHeightCaption�h�XTabOrderKindbkClose  TwwTable	taJobFileDatabaseNamedbJCdata	TableNameJOB_FILESyncSQLByRangeNarrowSearchValidateWithMask	Left� Top�  TStringFieldtaJobFileJOB_NO_1DisplayLabel�u�{�s��DisplayWidth
	FieldNameJOB_NO_1Required	Size  TStringFieldtaJobFileJOB_NO_2DisplayWidth	FieldNameJOB_NO_2Size  TStringFieldtaJobFileDESCRIPTIONDisplayLabel����DisplayWidth<	FieldNameDESCRIPTIONRequired	Size<  TStringFieldtaJobFileJOB_STATUSDisplayLabel���ADisplayWidth	FieldName
JOB_STATUSRequired	Size  TStringFieldtaJobFileJOB_TYPEDisplayLabel����DisplayWidth	FieldNameJOB_TYPERequired	Size   TwwSearchDialogsdgJobNoSelected.StringsJOB_NO_1	10	�u�{�s��	FJOB_NO_2	2	JOB_NO_2	FDESCRIPTION	60	����	FJOB_STATUS	1	���A	FJOB_TYPE	1	����	F GridTitleAlignmenttaLeftJustify	GridColorclWhiteGridOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgPerfectRowFit SearchTable	taJobFileCaptionSearchMaxWidth 	MaxHeight� CharCaseecUpperCaseOnCloseDialogsdgJobNoCloseDialogLeft� Topp  TwwQuery	quCostCatDatabaseNamedbJCdataSQL.Stringsselect jcf.*   from job_cost_file jcf  where jcf.Production_Cat in%              (select Production_Cat *                   from User_Production up/                   where up.User_ID = :User_ID)  order  by job_cost_cat Params.Data
     User_ID  0   ValidateWithMask	Left Top�    