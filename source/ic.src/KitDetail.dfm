�
 TFMKITDETAIL 0~  TPF0TfmKitDetailfmKitDetailLeftMToprWidth�Height�Caption���ƦX���t��Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight 	TwwDBGriddgrWareHouseLeft Top� Width�Height=Selected.StringsCOMP_ITEM_NO	18	��ƥN��	FComp_Desc	42	�W��	FCOMP_QTY	14	�ƶq	FFILL_REQ_FLAG	10	���ݥR��	FMOD_FLAG	8	�ק���	FQTY_MOD_FLAG	8	�ק�ƶq	F 
TitleColor	clBtnFace	FixedCols ShowHorzScrollBar	AlignalClient
DataSourcedmICData.dsKitDetailTabOrder TitleAlignmenttaCenterTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
TitleLinesTitleButtons
UseTFieldsIndicatorColoricBlack  TPanelpaDeptLeft Top Width�Height&AlignalTop
BevelInnerbvRaisedBorderStylebsSingleLocked	TabOrder TSpeedButtonSpeedButton4Left\TopWidthHeightCaption?Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TSpeedButtonsbExitLeft TopWidthHeightHint�h�X�t��
Glyph.Data
�  �  BM�      v   (   "            ,  �  �               �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� ����������������   �� �������������   ��0������������   �0�������3�����    30   ��3    ��   �30�����3�����   �3 �����0���O�   �30��D��3���O�   �30��DD�3��DDO   �30�DDD�3��DDO   �30��DD�3��DDO   �3��D��0����O�   �0����������O�   ������� �������   �   ����    ����   	NumGlyphsParentShowHintShowHint	OnClicksbExitClick  TSpeedButtonsbPrintLeft=TopWidthHeight
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�ss3330�� 33337��w33330  33337wws333	NumGlyphs  TSpeedButtonsbPrintSetupLeftTopWidthHeight
Glyph.Data
z  v  BMv      v   (                   �  �               �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww333333333333333333333>��33333>��33333�3333333�33>����333>����33333333�3333333�3333333>��33333>��33333333333333333333333333333333	NumGlyphs  TDBNavigatordnaDeptLeft�TopWidth Height
DataSourcedmICData.dsKitFilVisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbDeletenbPostnbCancel AlignalRightFlat	ParentShowHintConfirmDeleteShowHint	TabOrder    TPanelPanel1Left Top&Width�Height[AlignalTopBorderStylebsSingleTabOrder TLabelLabel1Left TopWidth0HeightCaption�X���N��  TLabelLabel2LeftTopWidthHeightCaption�W��  TLabelLabel3Left Top2Width0HeightCaption�X���ƶq  TLabelLabel4LeftTop2WidthHeightCaption�ƪ`  TDBEditdedItemDescLeft@TopWidth1Height	DataField	Item_Desc
DataSourcedmICData.dsKitFilEnabledTabOrder  TDBMemo
dmeCommentLeft@Top2Width1Height	DataFieldCOMMENT
DataSourcedmICData.dsKitFilTabOrder  TDBEdit	dedKitQtyLeft`Top2Width� Height	DataFieldKIT_QTY
DataSourcedmICData.dsKitFilTabOrder  TwwDBLookupCombo	dlcItemNoLeft`TopWidth� HeightDropDownAlignmenttaLeftJustifySelected.StringsITEM_NO	16	���ƥN��	FDESCRIPTION	60	�W��	FITEM_STOCK_UNIT	6	���	FITEM_PROD_CAT	6	���O	FITEM_SUBCAT	6	����	F 	DataFieldITEM_NO
DataSourcedmICData.dsKitFilLookupTable	quKitItemLookupFieldITEM_NOOptions
loColLines
loRowLinesloTitles TabOrder AutoDropDown
ShowButton	AllowClearKey   TwwDBLookupCombodlcCompItemLeftpTop� Width� HeightDropDownAlignmenttaLeftJustifySelected.StringsITEM_NO	16	���ƥN��	FDESCRIPTION	60	�W��	FITEM_STOCK_UNIT	6	���	FITEM_PROD_CAT	6	���O	FITEM_SUBCAT	6	����	F 	DataFieldCOMP_ITEM_NO
DataSourcedmICData.dsKitDetailLookupTable
quCompItemLookupFieldITEM_NOOptions
loColLines
loRowLinesloTitles TabOrderAutoDropDown
ShowButton	AllowClearKey  TPrinterSetupDialogps_PrintSetupLeft� Top�   	TMainMenu	MainMenu1LeftHTop�  	TMenuItem	MenuItem1Caption��� 	TMenuItem	MenuItem2Caption���L�]�m  	TMenuItem	MenuItem3Caption-  	TMenuItem	MenuItem4Caption�h�X   	TMenuItem	MenuItem5Caption���U 	TMenuItem	MenuItem6Caption�t�λ���ShortCutp  	TMenuItem	MenuItem7Caption���جd��  	TMenuItem	MenuItem8Caption-  	TMenuItem	MenuItem9Caption�����H��    TwwQuery	quKitItemActive	DatabaseNamedbIcDataSQL.StringsselectF    Item_no, Description, Item_prod_cat, item_subcat, Item_stock_unit from     item_fil'where kit_type = 'K' or kit_type = 'B' order by item_no ValidateWithMask	Left Top�  TStringFieldquKitItemITEM_NODisplayLabel���ƥN��DisplayWidth	FieldNameITEM_NOSize  TStringFieldquKitItemDESCRIPTIONDisplayLabel�W��DisplayWidth<	FieldNameDESCRIPTIONSize<  TStringFieldquKitItemITEM_STOCK_UNITDisplayLabel���DisplayWidth	FieldNameITEM_STOCK_UNITSize  TStringFieldquKitItemITEM_PROD_CATDisplayLabel���ODisplayWidth	FieldNameITEM_PROD_CATSize  TStringFieldquKitItemITEM_SUBCATDisplayLabel����DisplayWidth	FieldNameITEM_SUBCATSize   TwwDataSource	dsKitItemDataSet	quKitItemLeft(Top  TwwQuery
quCompItemActive	DatabaseNamedbIcDataSQL.StringsselectF    Item_no, Description, Item_prod_cat, item_subcat, Item_stock_unit from     item_fil&where kit_type = 'C' or kit_type = 'B'order by item_no ValidateWithMask	LeftpTop TStringFieldquCompItemITEM_NODisplayLabel���ƥN��DisplayWidth	FieldNameITEM_NOSize  TStringFieldquCompItemDESCRIPTIONDisplayLabel�W��DisplayWidth<	FieldNameDESCRIPTIONSize<  TStringFieldquCompItemITEM_PROD_CATDisplayLabel���ODisplayWidth	FieldNameITEM_PROD_CATSize  TStringFieldquCompItemITEM_SUBCATDisplayLabel����DisplayWidth	FieldNameITEM_SUBCATSize  TStringFieldquCompItemITEM_STOCK_UNITDisplayLabel���DisplayWidth	FieldNameITEM_STOCK_UNITSize   TwwDataSource
dsCompItemDataSet
quCompItemLeftpTopP   