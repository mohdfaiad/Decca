�
 TFMEVERYPRD 0~  TPF0TfmEveryPrd
fmEveryPrdLeftTopOWidth"Height�BorderIconsbiSystemMenu
biMinimize Caption�C�Ѧ������Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterScaledOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanelpacancelLeft Top WidthHeight�AlignalClient
BevelInnerbvRaisedBorderStylebsSingleCaptionpacancelTabOrder  TPanelpabottomLeftTopjWidthHeight$AlignalClientTabOrder  TSpeedButtonbtnRightLeftqTopWidth2HeightCaption>EnabledOnClickbtnRightClick  TSpeedButtonbtnRightAllLeftqTop.Width2HeightCaption>>EnabledOnClickbtnRightAllClick  TSpeedButtonbtnLeftLeftqTopPWidth2HeightCaption<EnabledOnClickbtnLeftClick  TSpeedButton
btnLeftAllLeftqTopsWidth2HeightCaption<<EnabledOnClickbtnLeftAllClick  TSpeedButtonbtnPrintLeftqTop� Width2HeightCaption���LOnClickbtnPrintClick  TSpeedButtonbtnExitLeftqTop� Width2HeightCaption�h�XOnClickbtnExitClick  TListBox	lbGetDataLeft� TopWidthZHeight"AlignalRight
ItemHeightMultiSelect	Sorted	TabOrder 
OnDblClickbtnLeftClick  TListBoxlbChoseDataLeftTopWidthZHeight"AlignalLeft
ItemHeightMultiSelect	Sorted	TabOrder
OnDblClickbtnRightClick   TPanelpatitleLeftTopQWidthHeightAlignalTop	AlignmenttaLeftJustifyBorderStylebsSingleCaptionpatitleTabOrder TLabellaSetSubJobLeftTopWidth=HeightAlignalLeftCaption	 �i�ﶵ��Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabellaGetSubJobLeft� TopWidth9HeightAlignalRightCaption�w�ﶵ��Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont   
TStatusBarsbtotalLeftTop�WidthHeightPanelsBevelpbNoneText�{���`��Width< WidthP BevelpbNoneText�w���`��Width< Width2  SimplePanel  TPanelpaWatchLeftTopWidthHeightOAlignalTop
BevelInner	bvLoweredBorderStylebsSingleTabOrder TLabel	laDevelopLeftTopWidth0Height	AlignmenttaRightJustifyCaption�Ͳ�����Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabellaReceiveDateLeftTop*Width0Height	AlignmenttaRightJustifyCaption������Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TwwDBLookupCombodblcDevelopLeftVTopWidthZHeightCharCaseecUpperCaseDropDownAlignmenttaLeftJustifySelected.StringsPRODUCTION_CAT	4	�Ͳ�����	FDESCRIPTION	30	����	F LookupTable	quSeleCatLookupFieldPRODUCTION_CATOptions
loColLines
loRowLinesloTitles TabOrder AutoDropDown
ShowButton	AllowClearKeyOnChangedblcDevelopChange  TDateTimePickerdtpCompleteLeftVTop(WidthZHeightCalAlignmentdtaLeftDate      ��@Time      ��@
DateFormatdfShortDateMode
dmComboBoxKinddtkDate
ParseInput  TRadioGrouprgLineLeft� TopWidthAHeightGAlignalRightCaption����u��	ItemIndex Items.Strings���L TabOrder    TwwQuery	quSeleCatDatabaseName
dbRepJcFwoSQL.Strings	Select  *  from PRODUCTION_CAT_FILE  Order by PRODUCTION_CAT ValidateWithMask	Left� Top. TStringFieldquSeleCatPRODUCTION_CATDisplayLabel�Ͳ�����DisplayWidth	FieldNamePRODUCTION_CATOrigin"PRODUCTION_CAT_FILE.PRODUCTION_CATSize  TStringFieldquSeleCatDESCRIPTIONDisplayLabel����DisplayWidth	FieldNameDESCRIPTIONOriginPRODUCTION_CAT_FILE.DESCRIPTIONSize   TwwQuery	quCostCatDatabaseName
dbRepJcFwoSQL.Strings select job_cost_cat ,descriptionfrom Job_Cost_File&where PRODUCTION_CAT = :PRODUCTION_CATorder by job_Cost_Cat Params.Data
     PRODUCTION_CAT  0   ValidateWithMask	Left$Top�  TStringFieldquCostCatJOB_COST_CAT	FieldNameJOB_COST_CATOriginJOB_COST_FILE.JOB_COST_CATSize  TStringFieldquCostCatDESCRIPTION	FieldNameDESCRIPTION    