�
 TFMICTRXLOT 0{  TPF0TfmIcTrxLot
fmIcTrxLotLeft� TopkWidthJHeight�Caption�帹�B�zFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight 	TwwDBGriddgrWareHouseLeft TopyWidthBHeight� Selected.StringsLOT_NO	16	�帹	FLOT_QTY	14	�B�z�ƶq	FEXPIRE_DATE	19	���Ĥ��	FPO_NO	13	�q�f�s��	FCOMMENT	24	�ƪ`	F 
TitleColor	clBtnFace	FixedCols ShowHorzScrollBar	AlignalClient
DataSourcedmICData.dsIcTrxLotTabOrder TitleAlignmenttaCenterTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
TitleLinesTitleButtons
UseTFieldsIndicatorColoricBlack  TPanelpaDeptLeft Top WidthBHeight%AlignalTop
BevelInnerbvRaisedBorderStylebsSingleLocked	TabOrder TSpeedButtonSpeedButton4Left]TopWidthHeightCaption?Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TSpeedButtonsbExitLeftTopWidthHeightHint�h�X�t��
Glyph.Data
�  �  BM�      v   (   "            ,  �  �               �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� ����������������   �� �������������   ��0������������   �0�������3�����    30   ��3    ��   �30�����3�����   �3 �����0���O�   �30��D��3���O�   �30��DD�3��DDO   �30�DDD�3��DDO   �30��DD�3��DDO   �3��D��0����O�   �0����������O�   ������� �������   �   ����    ����   	NumGlyphsParentShowHintShowHint	OnClicksbExitClick  TSpeedButtonsbPrintLeft>TopWidthHeight
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�ss3330�� 33337��w33330  33337wws333	NumGlyphs  TSpeedButtonsbPrintSetupLeftTopWidthHeight
Glyph.Data
z  v  BMv      v   (                   �  �               �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww333333333333333333333>��33333>��33333�3333333�33>����333>����33333333�3333333�3333333>��33333>��33333333333333333333333333333333	NumGlyphs  TDBNavigatordnaDeptLeft<TopWidth Height
DataSourcedmICData.dsIcTrxLotVisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbDeletenbPostnbCancel AlignalRightFlat	ParentShowHintConfirmDeleteShowHint	TabOrder    TPanelPanel1Left Top%WidthBHeightTAlignalTopBorderStylebsSingleTabOrder TLabelLabel1LeftTopWidth0HeightCaption���N��  TLabelLabel2Left� TopWidthHeightCaption�Ǹ�  TLabelLabel3LeftTop0Width0HeightCaption���ƥN��  TLabelLabel4Left� Top0WidthHeightCaption�W��  TDBEditdedTrxDocNoLeftPTopWidthQHeight	DataField
TRX_DOC_NO
DataSourcedmICData.dsIcTrxDetailTabOrder   TDBEditdedTrxLineNOLeft� TopWidthYHeight	DataFieldTRX_LINE_NO
DataSourcedmICData.dsIcTrxDetailTabOrder  TDBEdit	dedItemNoLeftPTop0WidthQHeight	DataFieldITEM_NO
DataSourcedmICData.dsIcTrxDetailTabOrder  TDBEditdedItemDescLeft� Top0WidthAHeight	DataField	Item_Desc
DataSourcedmICData.dsIcTrxDetailTabOrder   TwwDBLookupCombodlcLotNoLeft� Top� WidthyHeightDropDownAlignmenttaLeftJustifySelected.StringsLOT_NO	16	�帹	FEXPIRE_DATE	10	���Ĥ��	FQTY_ON_HAND	10	�ܦs�q	FQTY_RESERVED	10	�ܦs�w�ζq	F 	DataFieldLOT_NO
DataSourcedmICData.dsIcTrxLotLookupTable
quSelLotNoLookupFieldLOT_NOOptions
loColLines
loRowLinesloTitles TabOrderAutoDropDown
ShowButton	AllowClearKey  TwwMemoDialog
mdlComment	DataFieldCOMMENTFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style DlgLeft DlgTop DlgWidth1	DlgHeight�Left@Top�   	TMainMenu	MainMenu1Left�Top 	TMenuItem	MenuItem1Caption��� 	TMenuItem	MenuItem2Caption���L�]�m  	TMenuItem	MenuItem3Caption-  	TMenuItem	MenuItem4Caption�h�XOnClickMenuItem4Click   	TMenuItem	MenuItem5Caption���U 	TMenuItem	MenuItem6Caption�t�λ���ShortCutp  	TMenuItem	MenuItem7Caption���جd��  	TMenuItem	MenuItem8Caption-  	TMenuItem	MenuItem9Caption�����H��    TPrinterSetupDialogps_PrintSetupLeft�Top�   TwwQuery
quSelLotNoDatabaseNamedbIcData
DataSourcedmICData.dsIcTrxDetailRequestLive	SQL.Stringsselect * from Lot_filwhere whs_code = :whs_code           and item_no = :item_noorder by Lot_no Params.Data
%     WHS_CODE  0  ITEM_NO  0  ControlType.StringsFILL_REQ_FLAG;CheckBox;Y;NMOD_FLAG;CheckBox;Y;NQTY_MOD_FLAG;CheckBox;Y;N ValidateWithMask	Left� Top�  TStringFieldquSelLotNoLOT_NODisplayLabel�帹DisplayWidth	FieldNameLOT_NOOriginLOT_FIL.LOT_NOSize  TDateTimeFieldquSelLotNoEXPIRE_DATEDisplayLabel���Ĥ��DisplayWidth
	FieldNameEXPIRE_DATEOriginLOT_FIL.EXPIRE_DATE  TDateTimeFieldquSelLotNoLST_USE_DATEDisplayWidth
	FieldNameLST_USE_DATEOriginLOT_FIL.LST_USE_DATEVisible  TDateTimeFieldquSelLotNoRECV_DATEDisplayWidth
	FieldName	RECV_DATEOriginLOT_FIL.RECV_DATEVisible  TStringFieldquSelLotNoITEM_NO	FieldNameITEM_NOOriginLOT_FIL.ITEM_NOVisibleSize  TStringFieldquSelLotNoWHS_CODE	FieldNameWHS_CODEOriginLOT_FIL.WHS_CODEVisibleSize  TFloatFieldquSelLotNoRECV_QTY	FieldNameRECV_QTYOriginLOT_FIL.RECV_QTY  TFloatFieldquSelLotNoQTY_ON_HAND	FieldNameQTY_ON_HANDOriginLOT_FIL.QTY_ON_HAND  TFloatFieldquSelLotNoQTY_RESERVED	FieldNameQTY_RESERVEDOriginLOT_FIL.QTY_RESERVED  TFloatFieldquSelLotNoLOT_COST	FieldNameLOT_COSTOriginLOT_FIL.LOT_COST  TFloatFieldquSelLotNoRPLC_COST	FieldName	RPLC_COSTOriginLOT_FIL.RPLC_COST   TwwDataSource
dsSelLotNoDataSet
quSelLotNoLeft� Top    