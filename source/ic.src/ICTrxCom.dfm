�
 TFMICTRXCOM 0.$  TPF0TfmICTrxCom
fmICTrxComLeft� ToplWidthdHeight�Caption�X��Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TPanelpaDeptLeft Top Width\Height%AlignalTop
BevelInnerbvRaisedBorderStylebsSingleLocked	TabOrder  TSpeedButtonSpeedButton4Left]TopWidthHeightCaption?Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TSpeedButtonsbExitLeftTopWidthHeightHint�h�X�t��
Glyph.Data
�  �  BM�      v   (   "            ,  �  �               �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� ����������������   �� �������������   ��0������������   �0�������3�����    30   ��3    ��   �30�����3�����   �3 �����0���O�   �30��D��3���O�   �30��DD�3��DDO   �30�DDD�3��DDO   �30��DD�3��DDO   �3��D��0����O�   �0����������O�   ������� �������   �   ����    ����   	NumGlyphsParentShowHintShowHint	OnClicksbExitClick  TSpeedButtonsbPrintLeft>TopWidthHeight
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�ss3330�� 33337��w33330  33337wws333	NumGlyphs  TSpeedButtonsbPrintSetupLeftTopWidthHeight
Glyph.Data
z  v  BMv      v   (                   �  �               �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww333333333333333333333>��33333>��33333�3333333�33>����333>����33333333�3333333�3333333>��33333>��33333333333333333333333333333333	NumGlyphs  TDBNavigatordnaDeptLeftVTopWidth Height
DataSourcedmICData.dsIcTrxCompVisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbDeletenbPostnbCancel AlignalRightFlat	ParentShowHintConfirmDeleteShowHint	TabOrder    TPanelPanel1Left Top%Width\Height\AlignalTopBorderStylebsSingleTabOrder TLabelLabel1LeftTopWidth0HeightCaption���N��  TLabelLabel2Left� TopWidthHeightCaption�Ǹ�  TLabelLabel3LeftTop0Width0HeightCaption���ƥN��  TLabelLabel4Left� Top0WidthHeightCaption�W��  TDBEditdedTrxDocNoLeftPTopWidthQHeightTabStop	DataField
TRX_DOC_NO
DataSourcedmICData.dsIcTrxDetailReadOnly	TabOrder   TDBEditdedTrxLineNoLeft� TopWidthYHeightTabStop	DataFieldTRX_LINE_NO
DataSourcedmICData.dsIcTrxDetailReadOnly	TabOrder  TDBEdit	dedItemNoLeftPTop0WidthQHeightTabStop	DataFieldITEM_NO
DataSourcedmICData.dsIcTrxDetailReadOnly	TabOrder  TDBEditdedItemDescLeft� Top0WidthAHeightTabStop	DataField	Item_Desc
DataSourcedmICData.dsIcTrxDetailReadOnly	TabOrder   	TwwDBGrid
dgrTrxCompLeft Top� Width\HeightSelected.StringsCOMP_LINE_NO	8	�Ǹ�COMP_ITEM_NO	16	��ƥN��Comp_Desc	17	�W��COMP_QTY	14	�ƶqWHS_CODE	9	�ܸ�LOC_CODE	8	���aLOT_NO	17	�帹 
TitleColor	clBtnFace	FixedCols ShowHorzScrollBar	AlignalClient
DataSourcedmICData.dsIcTrxCompTabOrderTitleAlignmenttaCenterTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
TitleLinesTitleButtons
OnColEnterdgrTrxCompColEnterIndicatorColoricBlack  TwwDBLookupCombodlcLotNoLeft`Top� WidthiHeightDropDownAlignmenttaLeftJustifySelected.StringsLOT_NO	16	�帹	FEXPIRE_DATE	10	���Ĥ��	FQTY_ON_HAND	10	�ܦs�q	FQTY_RESERVED	10	�ܦs�w�ζq	F 	DataFieldLOT_NO
DataSourcedmICData.dsIcTrxCompLookupTable
quSelLotNoLookupFieldLOT_NOOptions
loColLines
loRowLinesloTitles TabOrderAutoDropDown
ShowButton	AllowClearKeyOnEnterdlcLotNoEnter  TwwDBLookupCombodlcCompItemNoLeft� Top� WidthyHeightDropDownAlignmenttaLeftJustifySelected.StringsITEM_NO	16	���ƥN��	FQTY_ON_HAND	10	�ܦs�q	FItemDesc	60	�W��	F 	DataFieldCOMP_ITEM_NO
DataSourcedmICData.dsIcTrxCompLookupTablequSelItemNoLookupFieldITEM_NOOptions
loColLines
loRowLinesloTitles TabOrderAutoDropDown
ShowButton	AllowClearKey  TwwDBLookupCombo
dlcWhsCodeLeft�Top� WidthNHeightDropDownAlignmenttaLeftJustifySelected.StringsWHS_CODE	4	�ܸ�	FWHS_DESC	20	����	F 	DataFieldWHS_CODE
DataSourcedmICData.dsIcTrxCompLookupTablequItemWhsCodeLookupFieldWHS_CODEOptions
loColLines
loRowLinesloTitles TabOrderAutoDropDown
ShowButton	AllowClearKeyOnEnterdlcWhsCodeEnter  TwwDBLookupCombodlcLocNoLeft�Top� WidthNHeightDropDownAlignmenttaLeftJustifySelected.StringsLOC_CODE	4	���a	FDESCRIPTION	20	����	F 	DataFieldLOC_CODE
DataSourcedmICData.dsIcTrxCompLookupTablequItemLocCodeLookupFieldLOC_CODETabOrderAutoDropDown
ShowButton	AllowClearKeyOnEnterdlcLocNoEnter  	TMainMenu	MainMenu1Left�Top 	TMenuItem	MenuItem1Caption��� 	TMenuItem	MenuItem2Caption���L�]�m  	TMenuItem	MenuItem3Caption-  	TMenuItem	MenuItem4Caption�h�XOnClickMenuItem4Click   	TMenuItem	MenuItem5Caption���U 	TMenuItem	MenuItem6Caption�t�λ���ShortCutp  	TMenuItem	MenuItem7Caption���جd��  	TMenuItem	MenuItem8Caption-  	TMenuItem	MenuItem9Caption�����H��    TPrinterSetupDialogps_PrintSetupLeft�Top�   TwwQuery
quSelLotNoDatabaseNamedbIcDataRequestLive	SQL.Stringsselect * from Lot_filwhere whs_code = :whs_code           and item_no = :item_noorder by Lot_no Params.Data
%     whs_code  0   item_no  0   ControlType.StringsFILL_REQ_FLAG;CheckBox;Y;NMOD_FLAG;CheckBox;Y;NQTY_MOD_FLAG;CheckBox;Y;N ValidateWithMask	Left`Top�  TStringFieldquSelLotNoLOT_NODisplayLabel�帹DisplayWidth	FieldNameLOT_NOOriginLOT_FIL.LOT_NOSize  TDateTimeFieldquSelLotNoEXPIRE_DATEDisplayLabel���Ĥ��DisplayWidth
	FieldNameEXPIRE_DATEOriginLOT_FIL.EXPIRE_DATE  TDateTimeFieldquSelLotNoLST_USE_DATEDisplayWidth
	FieldNameLST_USE_DATEOriginLOT_FIL.LST_USE_DATEVisible  TDateTimeFieldquSelLotNoRECV_DATEDisplayWidth
	FieldName	RECV_DATEOriginLOT_FIL.RECV_DATEVisible  TStringFieldquSelLotNoITEM_NO	FieldNameITEM_NOOriginLOT_FIL.ITEM_NOVisibleSize  TStringFieldquSelLotNoWHS_CODE	FieldNameWHS_CODEOriginLOT_FIL.WHS_CODEVisibleSize  TFloatFieldquSelLotNoRECV_QTY	FieldNameRECV_QTYOriginLOT_FIL.RECV_QTY  TFloatFieldquSelLotNoQTY_ON_HAND	FieldNameQTY_ON_HANDOriginLOT_FIL.QTY_ON_HAND  TFloatFieldquSelLotNoQTY_RESERVED	FieldNameQTY_RESERVEDOriginLOT_FIL.QTY_RESERVED  TFloatFieldquSelLotNoLOT_COST	FieldNameLOT_COSTOriginLOT_FIL.LOT_COST  TFloatFieldquSelLotNoRPLC_COST	FieldName	RPLC_COSTOriginLOT_FIL.RPLC_COST   TwwDataSource
dsSelLotNoDataSet
quSelLotNoLeft`Top   TwwDataSourcedsSelItemNoDataSetquSelItemNoLeft� Top   TwwQueryquSelItemNoDatabaseNamedbIcData
DataSourcedmICData.dsIcTrxDetailRequestLive	SQL.Strings,select Item_No,qty_on_hand from stock_statuswhere whs_code = :whs_codeorder by Item_no Params.Data
     WHS_CODE  0  ControlType.StringsFILL_REQ_FLAG;CheckBox;Y;NMOD_FLAG;CheckBox;Y;NQTY_MOD_FLAG;CheckBox;Y;N LookupFields.Strings1ItemDesc;dbIcData;ITEM_FIL;DESCRIPTION;;ITEM_NO;Y LookupLinks.StringsITEM_NO;ITEM_NO ValidateWithMask	Left� Top�  TStringFieldquSelItemNoITEM_NODisplayLabel���ƥN��DisplayWidth	FieldNameITEM_NOSize  TStringFieldquSelItemNoItemDescDisplayLabel�W��DisplayWidth<	FieldNameItemDescSize<
Calculated	  TFloatFieldquSelItemNoQTY_ON_HAND	FieldNameQTY_ON_HAND   TwwQueryquItemLocCodeDatabaseNamedbIcData
DataSourcedsItemWhsCodeSQL.Stringsselect Loc_code from stock_Locwhere Item_no = :Item_no"          and Whs_code = :whs_codeorder by loc_code Params.Data
%     ITEM_NO  0  WHS_CODE  0  ValidateWithMask	Left� TopB TStringFieldquItemLocCodeLOC_CODE	FieldNameLOC_CODESize   TwwQueryquItemWhsCodeDatabaseNamedbIcData
DataSourcedsSelItemNoSQL.Strings*select Item_no,whs_code from Stock_Status where item_no = :Item_no8          and whs_code in (select whs_code from user_whs/          where user_id = USER)                 Params.Data
     ITEM_NO  0  LookupFields.Strings3WHS_DESC;dbIcData;WAREHOUSE;DESCRIPTION;;WHS_CODE;Y LookupLinks.StringsWHS_CODE;WHS_CODE ValidateWithMask	Left� Top> TStringFieldquItemWhsCodeWHS_CODEDisplayLabel�ܸ�DisplayWidth	FieldNameWHS_CODESize  TStringFieldquItemWhsCodeWHS_DESCDisplayLabel����DisplayWidth	FieldNameWHS_DESC
Calculated	  TStringFieldquItemWhsCodeITEM_NO	FieldNameITEM_NOSize   TwwDataSourcedsItemLocCodeDataSetquItemLocCodeLeftbTopB  TwwDataSourcedsItemWhsCodeDataSetquItemWhsCodeLeft� TopN   