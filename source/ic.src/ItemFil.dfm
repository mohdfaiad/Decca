�
 TFMITEMFIL 0TO  TPF0
TfmItemFil	fmItemFilLeft=Top/Width�Height"Caption���ƶ���Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style MenummICMainPositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TDBText Left Top� WidthyHeight  TPageControl	pcItemFilLeft Top&Width�Height�
ActivePage	tsItemDefAlignalClientTabOrder  	TTabSheet	tsItemFilCaption���� TBevelBevel1Left Top Width�Height�AlignalClientShapebsFrame  TLabelLabel1LeftTopWidth0HeightCaption���ƥN��  TLabelLabel2Left� TopWidthHeightCaption�W��  TLabellaPhotoLeftTopWidthHeightHint�ˤW�Ӥ�Caption[�ۤ�]FocusControldimPhoto  TLabelLabel3LeftTop4Width0HeightCaption�������O  TLabelLabel4Left� Top4WidthHeightCaption����  TLabelLabel23LeftTop`WidthHeightCaption�ƪ`  TDBEdit	dedItemNoLeftPTopWidthiHeightCharCaseecUpperCase	DataFieldITEM_NO
DataSourcedmICData.dsItemFilTabOrder OnChangededItemNoChange  TDBEditdedItemDescLeft� TopWidthHeight	DataFieldDESCRIPTION
DataSourcedmICData.dsItemFilTabOrder  TPanelpaPhotoLeft
Top Width� Height� 
BevelInner	bvLoweredCaptionpaPhotoTabOrder TDBImagedimPhotoLeftTopWidth� Height� Hint�ˤW�Ӥ�AlignalClient	DataFieldPHOTO
DataSourcedmICData.dsItemPhotoStretch	TabOrder 
OnDblClickdimPhotoDblClick   TwwDBLookupCombodlcItmProdCatLeftPTop4WidthiHeightDropDownAlignmenttaLeftJustifySelected.StringsITEM_PROD_CAT	6	�������O	FDESCRIPTION	20	����	F 	DataFieldITEM_PROD_CAT
DataSourcedmICData.dsItemFilLookupTabledmICData.quItemCatFilLookupFieldITEM_PROD_CATOptions
loColLines
loRowLinesloTitles TabOrderAutoDropDown
ShowButton	AllowClearKey  TwwDBLookupCombodlcItmSubCatLeft� Top4WidthqHeightDropDownAlignmenttaLeftJustifySelected.StringsITEM_SUBCAT	6	����	FDESCRIPTION	20	����	F 	DataFieldITEM_SUBCAT
DataSourcedmICData.dsItemFilLookupTabledmICData.quItemSubcatFilLookupFieldITEM_SUBCATOptions
loColLines
loRowLinesloTitles TabOrderAutoDropDown
ShowButton	AllowClearKey  TDBRadioGroupdrgItemTypeLeftTopPWidth�Height1Caption�s������Columns	DataField	ITEM_TYPE
DataSourcedmICData.dsItemFilItems.Strings���ݦs���Э�s���帹�s���f���s�� TabOrderValues.StringsNRLS   TDBRadioGroup
drgKitTypeLeftTop� Width�Height1Caption�X����������Columns	DataFieldKIT_TYPE
DataSourcedmICData.dsItemFilItems.Strings�@������X�������X�������ƩM�X������ TabOrderValues.StringsNKCB   TDBMemo	dmeComentLeft8Top`WidthYHeight!	DataFieldCOMMENT
DataSourcedmICData.dsItemFilTabOrder  	TGroupBoxgbDimLeftTop� Width� Height� Caption���nTabOrder	 TLabelLabel7LeftTopWidthHeightCaption����  TLabelLabel8LeftTop4WidthHeightCaption�e��  TLabelLabel9LeftTopTWidthHeightCaption����  TLabelLabel10LeftToptWidthHeightCaption���  TDBEditdedItemLengthLeft0TopWidthHHeight	DataFieldITEM_LENGTH
DataSourcedmICData.dsItemFilTabOrder   TDBEditdedItemWidthLeft0Top0WidthHHeight	DataField
ITEM_WIDTH
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedItemHeightLeft0TopPWidthHHeight	DataFieldITEM_HEIGHT
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedDimensionUnitLeft0ToppWidthHHeight	DataFieldDIMENSION_UNIT
DataSourcedmICData.dsItemFilTabOrder   	TGroupBoxgbUnitLeft@Top� Width� Height� Caption����ഫTabOrder
 TLabelLabel24LeftTop,Width<HeightCaption
��L���@  TLabelLabel25LeftTopDWidth0HeightCaption����v  TLabelLabel26LeftTop\Width<HeightCaption
��L���G  TLabelLabel27LeftToptWidth0HeightCaption����v  TLabelLabel5LeftTopWidth0HeightCaption�s�ܳ��  TDBEditdedAltUnit1Left[Top,WidthAHeight	DataField
ALT_UNIT_1
DataSourcedmICData.dsItemFilTabOrder   TDBEditdedConvFactor1Left[TopDWidthAHeight	DataFieldCONV_FACTOR_1
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedAltUnit2Left[Top\WidthAHeight	DataField
ALT_UNIT_2
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedConvFactor2Left[ToptWidthAHeight	DataFieldCONV_FACTOR_2
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedStockUnitLeft[TopWidthAHeight	DataFieldITEM_STOCK_UNIT
DataSourcedmICData.dsItemFilTabOrder   TPanelPanel1LeftTop� Width!Height� TabOrder TLabelLabel11Left� Top<Width0HeightCaption�w�s���  TLabelLabel12LeftTop<Width$HeightCaption�`�s�q  TLabelLabel13Left	TopdWidth0HeightCaption�w�w�ζq  TLabelLabel29Left� TopWidth0HeightCaption�̤p�s�q  TLabelLabel30Left	TopWidth0HeightCaption�̤j�s�q  TLabelLabel31Left� TopdWidthHHeightCaption�̦Z�ϥΤ��  TDBEditdedItemPiecesLeft� Top<WidthIHeight	DataFieldITEM_PIECES
DataSourcedmICData.dsItemFilReadOnly	TabOrder  TDBEdit	dedMinQtyLeft� TopWidthIHeight	DataFieldMIN_QTY
DataSourcedmICData.dsItemFilTabOrder   TDBEdit	dedMaxQtyLeft>TopWidth?Height	DataFieldMAX_QTY
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedQtyonHandLeft>Top<Width?Height	DataFieldQTY_ON_HAND
DataSourcedmICData.dsItemFilReadOnly	TabOrder  TDBEditdedQtyReservedLeft>TopdWidth?Height	DataFieldQTY_RESERVED
DataSourcedmICData.dsItemFilReadOnly	TabOrder  TDBEditdedLastUseDateLeft� TopdWidthIHeight	DataFieldLAST_USE_DATE
DataSourcedmICData.dsItemFilEnabledReadOnly	TabOrder   TDBCheckBoxdcbBocontrolLeft�Top5WidthHHeight	AlignmenttaLeftJustifyCaption�q�f����	DataField
BO_CONTROL
DataSourcedmICData.dsItemFilTabOrderValueCheckedYValueUncheckedN   	TTabSheet	tsItemDefCaption���[ TBevelBevel2Left Top Width�Height�AlignalClientShapebsFrame  TDBTextDBText1LeftTopWidthyHeight	DataFieldUSER_DEF_TITLE01
DataSourcedmICData.dsICControl  TDBTextDBText2LeftTop?WidthyHeight	DataFieldUSER_DEF_TITLE02
DataSourcedmICData.dsICControl  TDBTextDBText3LeftTop_WidthyHeight	DataFieldUSER_DEF_TITLE03
DataSourcedmICData.dsICControl  TDBTextDBText4LeftTopWidthyHeight	DataFieldUSER_DEF_TITLE04
DataSourcedmICData.dsICControl  TDBTextDBText5LeftTop� WidthyHeight	DataFieldUSER_DEF_TITLE05
DataSourcedmICData.dsICControl  TDBTextDBText6LeftTop� WidthyHeight	DataFieldUSER_DEF_TITLE06
DataSourcedmICData.dsICControl  TDBTextDBText7LeftTop� WidthyHeight	DataFieldUSER_DEF_TITLE07
DataSourcedmICData.dsICControl  TDBTextDBText8LeftTop� WidthyHeight	DataFieldUSER_DEF_TITLE08
DataSourcedmICData.dsICControl  TDBTextDBText9LeftTopWidthyHeight	DataFieldUSER_DEF_TITLE09
DataSourcedmICData.dsICControl  TDBTextDBText10LeftTop?WidthyHeight	DataFieldUSER_DEF_TITLE10
DataSourcedmICData.dsICControl  TDBEditdedDefFld01Left� TopWidth�Height	DataFieldUSER_DEF_FLD01
DataSourcedmICData.dsItemFilTabOrder   TDBEditdedDefFld02Left� Top?Width�Height	DataFieldUSER_DEF_FLD02
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedDefFld03Left� Top_Width�Height	DataFieldUSER_DEF_FLD03
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedDefFld04Left� TopWidth�Height	DataFieldUSER_DEF_FLD04
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedDefFld05Left� Top� Width�Height	DataFieldUSER_DEF_FLD05
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedDefFld06Left� Top� Width�Height	DataFieldUSER_DEF_FLD06
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedDefFld07Left� Top� Width�Height	DataFieldUSER_DEF_FLD07
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedDefFld08Left� Top� Width�Height	DataFieldUSER_DEF_FLD08
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedDefFld09Left� TopWidth�Height	DataFieldUSER_DEF_FLD09
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedDefFld10Left� Top?Width�Height	DataFieldUSER_DEF_FLD10
DataSourcedmICData.dsItemFilTabOrder	   	TTabSheettsItemAcCaption�b�� TBevelBevel3Left Top Width�Height�AlignalClientShapebsFrame  TLabelLabel21Left Top,Width0HeightCaption�������O  TLabelLabel14Left� Top,Width0HeightCaption������ɲ  TLabelLabel28LeftvTop,Width0HeightCaption�W����ɲ  TLabelLabel18Left TopPWidth0HeightCaption��ƽs��  TLabelLabel32Left� TopPWidth0HeightCaption�M�Χ���  	TGroupBox	GroupBox3Left TopWidthYHeight� TabOrder  TLabelLabel20Left TopWidth0HeightCaption���J�b��  TLabelLabel6Left Top>Width0HeightCaption�t�űb��  TLabelLabel22Left Top^Width0HeightCaption�P��b��  TLabelLabel15Left Top~Width0HeightCaption�U�ڱb��  TLabelLabel17Left Top� Width0HeightCaption�馩�b��  TLabelLabel16Left Top� Width0HeightCaption��X�b��  TLabelLabel19Left� TopWidth	HeightCaption---  TLabelLabel33Left� Top>Width	HeightCaption---  TLabelLabel34Left� Top^Width	HeightCaption---  TLabelLabel35Left� Top~Width	HeightCaption---  TLabelLabel36Left� Top� Width	HeightCaption---  TLabelLabel37Left� Top� Width	HeightCaption---  TLabelLabel38Left� TopWidth	HeightCaption---  TLabelLabel39Left� Top>Width	HeightCaption---  TLabelLabel40Left� Top^Width	HeightCaption---  TLabelLabel41Left� Top~Width	HeightCaption---  TLabelLabel42Left� Top� Width	HeightCaption---  TLabelLabel43Left� Top� Width	HeightCaption---  TDBEditdedInventoryAcLeft^TopWidthPHeightCharCaseecUpperCase	DataFieldINVENTORY_AC
DataSourcedmICData.dsItemFilTabOrder   TDBEditdedLiablityAcLeft^Top=WidthPHeightCharCaseecUpperCase	DataFieldLIABILITY_AC
DataSourcedmICData.dsItemFilTabOrder  TDBEdit
dedSalesAcLeft^Top]WidthPHeightCharCaseecUpperCase	DataFieldSALES_AC
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedCrMemoAcLeft^Top}WidthPHeightCharCaseecUpperCase	DataField
CR_MEMO_AC
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedDiscountAcLeft^Top� WidthPHeightCharCaseecUpperCase	DataFieldDISCOUNT_AC
DataSourcedmICData.dsItemFilTabOrder  TDBEdit
dedExpenseLeft^Top� WidthPHeightCharCaseecUpperCase	DataField
EXPENSE_AC
DataSourcedmICData.dsItemFilTabOrder  TDBEditDBEdit1Left� TopWidth+HeightCharCaseecUpperCase	DataFieldINV_PROFIT_CTR_1
DataSourcedmICData.dsItemFilTabOrder  TDBEditDBEdit2Left� Top=Width+HeightCharCaseecUpperCase	DataFieldLIA_PROFIT_CTR_1
DataSourcedmICData.dsItemFilTabOrder  TDBEditDBEdit3Left� Top]Width+HeightCharCaseecUpperCase	DataFieldSAL_PROFIT_CTR_1
DataSourcedmICData.dsItemFilTabOrder  TDBEditDBEdit4Left� Top}Width+HeightCharCaseecUpperCase	DataFieldCRM_PROFIT_CTR_1
DataSourcedmICData.dsItemFilTabOrder	  TDBEditDBEdit5Left� Top� Width+HeightCharCaseecUpperCase	DataFieldDIS_PROFIT_CTR_1
DataSourcedmICData.dsItemFilTabOrder
  TDBEditDBEdit6Left� Top� Width+HeightCharCaseecUpperCase	DataFieldEXP_PROFIT_CTR_1
DataSourcedmICData.dsItemFilTabOrder  TDBEditDBEdit7Left� TopWidth+HeightCharCaseecUpperCase	DataFieldINV_PROFIT_CTR_2
DataSourcedmICData.dsItemFilTabOrder  TDBEditDBEdit8Left� Top=Width+HeightCharCaseecUpperCase	DataFieldLIA_PROFIT_CTR_2
DataSourcedmICData.dsItemFilTabOrder  TDBEditDBEdit9Left� Top]Width+HeightCharCaseecUpperCase	DataFieldSAL_PROFIT_CTR_2
DataSourcedmICData.dsItemFilTabOrder  TDBEditDBEdit10Left� Top}Width+HeightCharCaseecUpperCase	DataFieldCRM_PROFIT_CTR_1
DataSourcedmICData.dsItemFilTabOrder  TDBEditDBEdit11Left� Top� Width+HeightCharCaseecUpperCase	DataFieldDIS_PROFIT_CTR_2
DataSourcedmICData.dsItemFilTabOrder  TDBEditDBEdit12Left� Top� Width+HeightCharCaseecUpperCase	DataFieldEXP_PROFIT_CTR_2
DataSourcedmICData.dsItemFilTabOrder   TDBEditdedJobCostCatLeftXTop,WidthQHeightCharCaseecUpperCase	DataFieldJOB_COST_CAT
DataSourcedmICData.dsItemFilTabOrder  TDBEdit
dedAvgCostLeft
Top,WidthOHeight	DataFieldAVG_COST
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedRplcCostLeft�Top,WidthOHeight	DataField	RPLC_COST
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedLibraryItemNoLeftXTopLWidthQHeightCharCaseecUpperCase	DataFieldLIBRARY_ITEM_NO
DataSourcedmICData.dsItemFilTabOrder  TDBEditdedItemJobNoLeft
TopLWidthOHeightCharCaseecUpperCase	DataFieldITEM_JOB_NO
DataSourcedmICData.dsItemFilTabOrder   	TTabSheettsStockStatusCaption���p 	TGroupBox	GroupBox1Left Top Width�Height� AlignalTopCaption�ܮw���pTabOrder  	TwwDBGrid	wwDBGrid1LeftTopWidth�Height� Selected.StringsWHS_CODE	8	�ܸ�WHS_DESC	16	����MIN_QTY	9	�̤p�s�qMAX_QTY	9	�̤j�s�qQTY_ON_HAND	8	�s�qQTY_RESERVED	9	�w�ζqSTOCK_COST	10	��ɲRPLC_COST	11	�W����ɲLAST_USE_DATE	13	�̦Z�ϥΤ��COMMENT	6	�ƪ` 
TitleColor	clBtnFace	FixedCols ShowHorzScrollBar	AlignalClient
DataSourcedmICData.dsItemStockStatusTabOrder TitleAlignmenttaCenterTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
TitleLinesTitleButtons
OnDblClickwwDBGrid1DblClickIndicatorColoricBlack  TwwDBLookupCombo
dlcWhsCodeLeftKTop=WidthBHeightDropDownAlignmenttaLeftJustifySelected.StringsWHS_CODE	4	�ܸ�	FWHS_DESC	20	����	F 	DataFieldWHS_CODE
DataSourcedmICData.dsItemStockStatusLookupTabledmICData.quSelUserWhsLookupFieldWHS_CODEOptions
loColLines
loRowLinesloTitles TabOrderAutoDropDown
ShowButton	AllowClearKey  TwwDBLookupCombodlcLocNoLeftKTopkWidthBHeightDropDownAlignmenttaLeftJustifySelected.StringsLOC_CODE	4	���a	FDESCRIPTION	20	����	F 	DataFieldLOC_CODE
DataSourcedmICData.dsItemStockLocLookupTabledmICData.quSelLocLookupFieldLOC_CODETabOrderAutoDropDown
ShowButton	AllowClearKey   	TGroupBox	GroupBox2Left Top� Width�Height� AlignalClientCaption���a���pTabOrder 	TwwDBGrid	wwDBGrid2LeftTopWidth�Height� Selected.StringsLOC_CODE	20	���aLoc_Desc	46	����QTY_ON_HAND	16	�s�qQTY_RESERVED	21	�w�ζq 
TitleColor	clBtnFace	FixedCols ShowHorzScrollBar	AlignalClient
DataSourcedmICData.dsItemStockLocTabOrder TitleAlignmenttaCenterTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
TitleLinesTitleButtonsIndicatorColoricBlack    	TTabSheettsLotCaption�帹 	TGroupBoxgbLotLeft Top Width�Height�AlignalClientCaption�ӳf���pTabOrder  	TwwDBGrid	wwDBGrid3LeftTopWidth�Height�Selected.StringsLOT_NO	8	�帹WHS_CODE	7	�ܸ�RECV_DATE	12	���Ƥ��RECV_QTY	10	���ƼƶqLOT_COST	8	��ɲRPLC_COST	10	�W����ɲEXPIRE_DATE	12	���Ĥ��LST_USE_DATE	13	�̦Z�ϥΤ��QTY_ON_HAND	8	�s�qQTY_RESERVED	11	�w�ζq 
TitleColor	clBtnFace	FixedCols ShowHorzScrollBar	AlignalClient
DataSourcedmICData.dsItemLotFilReadOnly	TabOrder TitleAlignmenttaCenterTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
TitleLinesTitleButtonsIndicatorColoricBlack    	TTabSheettsAlterItemCaption�N�Ϋ~ 	TwwDBGriddgrWareHouseLeft Top Width�Height�Selected.StringsALTER_SEQ_NO	17	�Ǹ�	TALTER_ITEM_NO	26	�N������	FAlter_Desc	33	�N�����ƦW��	FCOMMENT	24	�ƪ`	F 
TitleColor	clBtnFace	FixedCols ShowHorzScrollBar	AlignalClient
DataSourcedmICData.dsAlterItemTabOrder TitleAlignmenttaCenterTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
TitleLinesTitleButtons
UseTFields
OnDblClickdgrWareHouseDblClickIndicatorColoricBlack    TPanelpaWorkerLeft Top Width�Height&AlignalTop
BevelInnerbvRaisedBorderStylebsSingleLocked	TabOrder TSpeedButtonsbExitLeftTopWidthHeightHint�h�X�t��
Glyph.Data
�  �  BM�      v   (   "            ,                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� ����������������   �� �������������   ��0������������   �0�������3�����    30   ��3    ��   �30�����3�����   �3 �����0���O�   �30��D��3���O�   �30��DD�3��DDO   �30�DDD�3��DDO   �30��DD�3��DDO   �3��D��0����O�   �0����������O�   ������� �������   �   ����    ����   	NumGlyphsParentShowHintShowHint	OnClicksbExitClick  TSpeedButtonsbHelpLeft�TopWidthHeightCaption?Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TSpeedButtonsbPrintSetupLeft!TopWidthHeightHint
�L����]�m
Glyph.Data
z  v  BMv      v   (                   �  �               �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww333333333333333333333>��33333>��33333�3333333�33>����333>����33333333�3333333�3333333>��33333>��33333333333333333333333333333333	NumGlyphs  TSpeedButtonspFindLeft@TopWidthHeightHint
���L��]�m
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 3333333333333?3333330 333333�w333333 33333?ws333330 333333�w333333 333?�?ws337 ;p333?ws�w333ww �333w37ws330��p3337�337�33w����s3373337?33����33333333����33333333����33s�333s33w����s337�337�330��p3337?�3�3333ww3333w?�s33337 333333ws3333	NumGlyphsParentShowHintShowHint	OnClickspFindClick  TDBNavigator
dnaItemFilLeft�TopWidth Height
DataSourcedmICData.dsItemFilVisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbDeletenbPostnbCancel AlignalRightFlat	ParentShowHintConfirmDeleteShowHint	TabOrder    
TStatusBar	sbItemFilLeft Top�Width�HeightPanels SimplePanel	  	TMainMenummICMainLeft�Top��   	TMenuItemN1Caption��� 	TMenuItem
mmPrtSetupCaption���L�]�m  	TMenuItemN5Caption-  	TMenuItemmmExitCaption�h�X�t��   	TMenuItemN2Caption�]�m 	TMenuItemmmProfitCtrCaption�Q���b��  	TMenuItemN7Caption-  	TMenuItemmmDeptCaption�ܮw�N��  	TMenuItemmmOccuptionCaption�Τ�ܮw  	TMenuItemN3Caption-  	TMenuItemmmShiftCaption�������O  	TMenuItem	mmPayCodeCaption���Ʋ���  	TMenuItemN12Caption-  	TMenuItemN4Caption���ƥN������  	TMenuItemN6Caption-  	TMenuItem	mmControlCaption�t�ξޱ��O��   	TMenuItemU1Caption���U 	TMenuItemt1Caption�t�λ���  	TMenuItemd1Caption���جd��  	TMenuItemN14Caption-  	TMenuItemH2Caption�����H��    TPrinterSetupDialogps_PrintSetupLeft8Top��    TOpenDialogOpenDialog2
DefaultExtBMPFilterBmp File|*.BMP|All Files|*.*Left�  TwwMemoDialog
mdlComment
DataSourcedmICData.dsStockStatus	DataFieldCOMMENTFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style DlgLeft DlgTop DlgWidth1	DlgHeight�Left@Top  TwwMemoDialogmdlAlterComment
DataSourcedmICData.dsAlterItem	DataFieldCOMMENTFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style DlgLeft DlgTop DlgWidth1	DlgHeight�Left8Top�    