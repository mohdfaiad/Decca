�
 TFMFINDITEM 0J  TPF0TfmFindItem
fmFindItemLeftdTop� WidthcHeight�Caption�d�����Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TPanelPanel1Left Top Width[HeightiAlignalTopBorderStylebsSingleTabOrder  TLabelLabel1Left TopWidth0HeightCaption���ƥN��  TLabelLabel2Left(Top8Width0HeightCaption�������O  TLabelLabel3Left Top8Width0HeightCaption���Ʋ���  TLabelLabel4Left(TopWidth0HeightCaption�ܮw�N��  TEditedItemNoLeftHTopWidthyHeightTabOrder   TwwDBLookupCombo
dlcItemCatLefthTop8WidthyHeightDropDownAlignmenttaLeftJustifyLookupTabledmICData.quItemCatFilLookupFieldITEM_PROD_CATTabOrderAutoDropDown
ShowButton	AllowClearKey  TwwDBLookupCombodlcItemSubCatLeftHTop8WidthyHeightDropDownAlignmenttaLeftJustifyLookupTabledmICData.quItemSubcatFilLookupFieldITEM_SUBCATTabOrderAutoDropDown
ShowButton	AllowClearKey  TwwDBLookupCombo
dlcWhsCodeLefthTopWidthyHeightDropDownAlignmenttaLeftJustifyLookupTablequSelWhsLookupFieldWHS_CODEReadOnly	TabOrderAutoDropDown
ShowButton	AllowClearKey  TBitBtnbbSelectLeft�TopWidthKHeightCaption�̩wDefault	Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.Style 
ParentFontTabOrderOnClickbbSelectClick
Glyph.Data
�  �  BM�      v   (   $            h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�8�3�333  2"��"C3338�3�333  :*3:"$3338�38�8�33  3�33�"C333�33�3�33  3333:"$3333338�8�3  33333�"C333333�3�3  33333:"$3333338�8�  333333�"C333333�3�  333333:"C3333338�  3333333�#3333333��  3333333:3333333383  333333333333333333  	NumGlyphs  TBitBtnbbCancelLeft�Top8WidthKHeightCaption����Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.Style 
ParentFontTabOrderOnClickbbCancelClickKindbkCancel   	TwwDBGrid	wwDBGrid1Left TopiWidth[Height9Selected.StringsITEM_NO	11	���ƥN��DESCRIPTION	27	�W��ITEM_PROD_CAT	13	���OITEM_SUBCAT	13	����QTY_ON_HAND	19	�ܦs�qITEM_STOCK_UNIT	7	��� 
TitleColor	clBtnFace	FixedCols ShowHorzScrollBar	AlignalClient
DataSource
dsFindItemTabOrderTitleAlignmenttaCenterTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
TitleLinesTitleButtons
OnDblClickwwDBGrid1DblClickIndicatorColoricBlack  TwwQuery
quFindItemDatabaseNamedbIcDataSQL.Stringsselect E         ss.Item_No, ss.qty_on_hand, it.Description,it.item_prod_Cat,;         it.item_subcat, it.item_stock_unit                 from &         Stock_status ss,  Item_fil itwhere$         ss.item_no = it.Item_no and,          ss.Whs_code = :whs_code              Params.Data
     whs_code  0   ValidateWithMask	Left� Top�  TStringFieldquFindItemITEM_NODisplayLabel���ƥN��DisplayWidth	FieldNameITEM_NOSize  TStringFieldquFindItemDESCRIPTIONDisplayLabel�W��DisplayWidth	FieldNameDESCRIPTIONSize<  TStringFieldquFindItemITEM_PROD_CATDisplayLabel���ODisplayWidth	FieldNameITEM_PROD_CATSize  TStringFieldquFindItemITEM_SUBCATDisplayLabel����DisplayWidth	FieldNameITEM_SUBCATSize  TFloatFieldquFindItemQTY_ON_HAND	FieldNameQTY_ON_HAND  TStringFieldquFindItemITEM_STOCK_UNITDisplayLabel���DisplayWidth	FieldNameITEM_STOCK_UNITSize   TwwDataSource
dsFindItemDataSet
quFindItemLeft� Top�   TwwQueryquSelWhsActive	DatabaseNamedbIcDataSQL.Stringsselect * from user_whswhere User_id = USERorder by whs_code LookupFields.Strings3Whs_Desc;dbIcData;WAREHOUSE;DESCRIPTION;;WHS_CODE;Y LookupLinks.StringsWHS_CODE;WHS_CODE ValidateWithMask	LeftHTop�  TStringFieldquSelWhsUSER_IDDisplayWidth	FieldNameUSER_IDOriginUSER_WHS.USER_IDSize  TStringFieldquSelWhsWHS_CODEDisplayWidth	FieldNameWHS_CODEOriginUSER_WHS.WHS_CODESize  TStringFieldquSelWhsWhs_DescDisplayWidth	FieldNameWhs_Desc
Calculated	    