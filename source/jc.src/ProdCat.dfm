�
 TFMPRODCAT 0�  TPF0
TfmProdCat	fmProdCatLeft� Top� Width0HeightwCaption�Ͳ�����Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style MenummJob_cost_filePositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight 	TwwDBGriddgrJob_cost_fileLeft Top)Width(Height Selected.StringsPRODUCTION_CAT	31	�Ͳ�����DESCRIPTION	54	���� 
TitleColor	clBtnFace	FixedCols ShowHorzScrollBar	AlignalClient
DataSource	dsProdCatOptions	dgEditingdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgCancelOnExit
dgWordWrap TabOrder TitleAlignmenttaCenterTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
TitleLinesTitleButtonsIndicatorColoricBlack  TPanelpaToolsLeft Top Width(Height)AlignalTop
BevelInnerbvRaisedBorderStylebsSingleCaptionpaToolsTabOrder TSpeedButtonsbExitLeftTop Width%Height%Hint�h�X
AllowAllUp	
Glyph.Data
�  �  BM�      v   (   "            ,                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� ����������������   �� �������������   ��0������������   �0�������3�����    30   ��3    ��   �30�����3�����   �3 �����0���O�   �30��D��3���O�   �30��DD�3��DDO   �30�DDD�3��DDO   �30��DD�3��DDO   �3��D��0����O�   �0����������O�   ������� �������   �   ����    ����   	NumGlyphsParentShowHintShowHint	OnClicksbExitClick  TSpeedButtonsbPSLeft&Top Width%Height%Hint
���L��]�m
Glyph.Data
z  v  BMv      v   (                   �  �               �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww333333333333333333333>��33333>��33333�3333333�33>����333>����33333333�3333333�3333333>��33333>��33333333333333333333333333333333	NumGlyphsParentShowHintShowHint	  TSpeedButtonsbPrintscreenLeftKTop Width%Height%Hint�̹����L
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      7wwwwwws�������3333337��������������        wwwwwwww�������333333��������3333377��������������        wwwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�3s3330�� 33337��w33330  33337wws333	NumGlyphsParentShowHintShowHint	  TwwDBNavigatordnaJob_cost_fileLeft� TopWidth0Height!
DataSource	dsProdCatOptions ShowHint	RepeatInterval.InitialDelay�RepeatInterval.IntervaldAlignalRightParentShowHint TwwNavButtonwwDBNavigator1FirstLeft Top Width&Height%Hint�Ĥ@��
ImageIndex�	NumGlyphsSpacingCaptionwwDBNavigator1FirstEnabledIndex StylenbsFirst  TwwNavButtonwwDBNavigator1PriorLeft&Top Width&Height%Hint�e�@��
ImageIndex�	NumGlyphsSpacingCaptionwwDBNavigator1PriorEnabledIndexStylenbsPrior  TwwNavButtonwwDBNavigator1NextLeftLTop Width&Height%Hint�U�@��
ImageIndex�	NumGlyphsSpacingCaptionwwDBNavigator1NextIndexStylenbsNext  TwwNavButtonwwDBNavigator1LastLeftrTop Width&Height%Hint�̦Z�@��
ImageIndex�	NumGlyphsSpacingCaptionwwDBNavigator1LastIndexStylenbsLast  TwwNavButtonwwDBNavigator1InsertLeft� Top Width&Height%Hint
���J(�W�[)
ImageIndex�	NumGlyphsSpacingCaptionwwDBNavigator1InsertIndexStyle	nbsInsert  TwwNavButtonwwDBNavigator1DeleteLeft� Top Width&Height%Hint�R��
ImageIndex�	NumGlyphsSpacingCaptionwwDBNavigator1DeleteIndexStyle	nbsDelete  TwwNavButtonwwDBNavigator1PostLeft� Top Width&Height%Hint�O�s
ImageIndex�	NumGlyphsSpacingCaptionwwDBNavigator1PostEnabledIndexStylenbsPost  TwwNavButtonwwDBNavigator1CancelLeft
Top Width&Height%Hint����
ImageIndex�	NumGlyphsSpacingCaptionwwDBNavigator1CancelEnabledIndexStyle	nbsCancel    	TMainMenummJob_cost_fileLeftHTop�  	TMenuItemN1Caption��� 	TMenuItemmmPrintsetupCaption
���L��]�m  	TMenuItemN3Caption-  	TMenuItemmmExitCaption�h�X   	TMenuItemmmJChelpCaption���U 	TMenuItemmmHelpCaption���U    TPrinterSetupDialogps_PrinterSetupLeft�Top�   TwwQuery	quProdCatActive	CachedUpdates		AfterPostquProdCatAfterPostBeforeDeletequProdCatBeforeDeleteAfterDeletequProdCatAfterPostDatabaseNamedbJCdataRequestLive	SQL.Strings!select * from production_cat_fileorder by production_cat UpdateObject	usProdCatValidateWithMask	LeftpTopx TStringFieldquProdCatPRODUCTION_CATDisplayLabel�Ͳ�����DisplayWidth	FieldNamePRODUCTION_CATOrigin"PRODUCTION_CAT_FILE.PRODUCTION_CATSize  TStringFieldquProdCatDESCRIPTIONDisplayLabel����DisplayWidth6	FieldNameDESCRIPTIONOriginPRODUCTION_CAT_FILE.DESCRIPTIONSize   TwwDataSource	dsProdCatDataSet	quProdCatLeftpTop�   
TUpdateSQL	usProdCatModifySQL.Stringsupdate production_cat_fileset#  PRODUCTION_CAT = :PRODUCTION_CAT,  DESCRIPTION = :DESCRIPTIONwhere&  PRODUCTION_CAT = :OLD_PRODUCTION_CAT InsertSQL.Stringsinsert into production_cat_file  (PRODUCTION_CAT, DESCRIPTION)values!  (:PRODUCTION_CAT, :DESCRIPTION) DeleteSQL.Stringsdelete from production_cat_filewhere&  PRODUCTION_CAT = :OLD_PRODUCTION_CAT LeftpTop�    