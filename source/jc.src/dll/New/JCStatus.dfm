�
 TFMJCSTATUS 0�  TPF0TfmJCStatus
fmJCStatusLeft�TopVWidth"Height�BorderIconsbiSystemMenu
biMinimize Caption�u�{���س���Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterScaledOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanelpacancelLeft Top WidthHeight�AlignalClient
BevelInnerbvRaisedBorderStylebsSingleCaptionpacancelTabOrder  TPanelpabottomLeftTop� WidthHeightAlignalClientTabOrder  TSpeedButtonbtnRightLeftqTopWidth2HeightCaption>EnabledOnClickbtnRightClick  TSpeedButtonbtnRightAllLeftqTop.Width2HeightCaption>>EnabledOnClickbtnRightAllClick  TSpeedButtonbtnLeftLeftqTopPWidth2HeightCaption<EnabledOnClickbtnLeftClick  TSpeedButton
btnLeftAllLeftqTopsWidth2HeightCaption<<EnabledOnClickbtnLeftAllClick  TSpeedButtonbtnPrintLeftqTop� Width2HeightCaption���LOnClickbtnPrintClick  TSpeedButtonbtnExitLeftqTop� Width2HeightCaption�h�XOnClickbtnExitClick  TListBox	lbGetDataLeft� TopWidthZHeight
AlignalRight
ItemHeightMultiSelect	Sorted	TabOrder 
OnDblClickbtnLeftClick  TListBoxlbChoseDataLeftTopWidthZHeight
AlignalLeft
ItemHeightMultiSelect	Sorted	TabOrder
OnDblClickbtnRightClick   TPanelpatitleLeftTopiWidthHeightAlignalTop	AlignmenttaLeftJustifyBorderStylebsSingleCaptionpatitleTabOrder TLabellaSetSubJobLeftTopWidth=HeightAlignalLeftCaption	 �i�ﶵ��Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabellaGetSubJobLeft� TopWidth9HeightAlignalRightCaption�w�ﶵ��Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont   
TStatusBarsbtotalLeftTop�WidthHeightPanelsBevelpbNoneText�{���`��Width< WidthP BevelpbNoneText�w���`��Width< Width2  SimplePanel  TPanelpaWatchLeftTopWidthHeightgAlignalTop
BevelInner	bvLoweredBorderStylebsSingleTabOrder TLabel	laSeleJobLeft&TopWidthHeightCaption�u�{Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabellaStartDateLeftTop*Width*HeightCaption���(�_)Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabel	laEndDateLeft,TopEWidthHeightCaption(��)Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabellaJobNo2Left� TopWidth	HeightCaption---Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TwwDBLookupCombo
dblcSelJobLeftNTopWidthZHeightCharCaseecUpperCaseDropDownAlignmenttaLeftJustifySelected.StringsJOB_NO_1	8	�u�{�s��	FJOB_NO_2	2	�u�{�s��(2)	FDESCRIPTION	60	����	F LookupTable	quSelePrjLookupFieldJOB_NO_1Options
loColLines
loRowLinesloTitles TabOrder AutoDropDown
ShowButton	AllowClearKeyOnChangedblcSelJobChange  	TCheckBox
cbPrintAmtLeft� TopEWidthDHeight	AlignmenttaLeftJustifyCaption���L���BTabOrder  TDateTimePickerdtpStartDateLeftNTop(WidthZHeightCalAlignmentdtaLeftDate      ��@Time      ��@
DateFormatdfShortDateMode
dmComboBoxKinddtkDate
ParseInput  TDateTimePicker
dtpEndDateLeftNTopCWidthZHeightCalAlignmentdtaLeftDate ��=����@Time ��=����@
DateFormatdfShortDateMode
dmComboBoxKinddtkDate
ParseInput	OnCloseUpdtpEndDateCloseUp  TEditedJobNo2Left� TopWidth1HeightCharCaseecUpperCaseTabOrder    TwwQuery	quSelePrjDatabaseName
dbRepJcFwoSQL.Strings'Select  job_no_1, Job_No_2, Description  from JOB_FILE  Order by Job_No_1, Job_No_2 ValidateWithMask	Left� Top�  TStringFieldquSelePrjJOB_NO_1DisplayLabel�u�{�s��DisplayWidth	FieldNameJOB_NO_1Size  TStringFieldquSelePrjJOB_NO_2DisplayLabel�u�{�s��(2)DisplayWidth	FieldNameJOB_NO_2Size  TStringFieldquSelePrjDESCRIPTIONDisplayLabel����DisplayWidth<	FieldNameDESCRIPTIONSize<   TwwQuery	quCostCatDatabaseName
dbRepJcFwoSQL.Strings	select * from Job_Cost_Fileorder by job_Cost_Cat ValidateWithMask	LeftTop�  TStringFieldquCostCatJOB_COST_CAT	FieldNameJOB_COST_CATOriginJOB_COST_FILE.JOB_COST_CATSize  TStringFieldquCostCatDESCRIPTION	FieldNameDESCRIPTIONOriginJOB_COST_FILE.DESCRIPTION  TStringFieldquCostCatJOB_COST_TYPE	FieldNameJOB_COST_TYPEOriginJOB_COST_FILE.JOB_COST_TYPESize  TStringFieldquCostCatJOB_COST_CAT_UNIT	FieldNameJOB_COST_CAT_UNITOriginJOB_COST_FILE.JOB_COST_CAT_UNITSize   TTestPrgTestPrgItems.StringsAllcbPrintAmt.Visible DataSetdmRepFwo.quSelFuncApprovedLeft� TopU   