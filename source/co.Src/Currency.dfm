�
 TFMCURRENCY 0�  TPF0TfmCurrency
fmCurrencyLeftRTope
AutoScrollCaption�f��ClientHeightClientWidth2Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight 	TwwDBGriddbgCurrencyLeft Top$Width2Height� Selected.StringsCURRENCY	11	�f��BASE_CURRENCY	15	�򥻳f��FOREIGN_CURRENCY	15	�~��f�� 
TitleColor	clBtnFace	FixedCols ShowHorzScrollBar	AlignalClient
DataSource
dsCurrencyTabOrder TitleAlignmenttaCenterTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
TitleLinesTitleButtons	OnColExitdbgCurrencyColExitIndicatorColoricBlack  TPanelpaWorkerLeft Top Width2Height$AlignalTop
BevelInnerbvRaisedBorderStylebsSingleCaption Locked	TabOrder TSpeedButtonsbExitLeft TopWidthHeightHint����Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
Glyph.Data
�  �  BM�      v   (   "            ,                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� ����������������   �� �������������   ��0������������   �0�������3�����    30   ��3    ��   �30�����3�����   �3 �����0���O�   �30��D��3���O�   �30��DD�3��DDO   �30�DDD�3��DDO   �30��DD�3��DDO   �3��D��0����O�   �0����������O�   ������� �������   �   ����    ����   	NumGlyphs
ParentFontParentShowHintShowHint	OnClicksbExitClick  TSpeedButtonsbPrintSetupLeftTopWidthHeightHint���L��
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww333333333333333333333>��33333>��33333�3333333�33>����333>����33333333�3333333�3333333>��33333>��33333333333333333333333333333333	NumGlyphsParentShowHintShowHint	OnClicksbPrintSetupClick  TSpeedButtonsbPrintLeft<TopWidthHeightHint���L
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      7wwwwwws�������3333337��������������        wwwwwwww�������333333��������3333377��������������        wwwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�3s3330�� 33337��w33330  33337wws333	NumGlyphsParentShowHintShowHint	  TDBNavigatorDBNavigator1Left\TopWidth� Height
DataSource
dsCurrencyVisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbDeletenbPostnbCancel AlignalRightFlat	ConfirmDeleteTabOrder    TwwQuery
quCurrencyCachedUpdates	AfterInsertquCurrencyAfterInsert	AfterPostquCurrencyAfterPostBeforeDeletequCurrencyBeforeDeleteAfterDeletequCurrencyAfterPostOnPostErrorquCurrencyPostErrorDatabaseNamedbCommon
DataSourcedmDecca.dsSel1CompanyRequestLive	SQL.Stringsselect * from currency   where Company_ID = :Company_ID  order by currency Params.Data
     
COMPANY_ID  0  UniDirectional	
UpdateModeupWhereChangedUpdateObject
usCurrencyValidateWithMask	LeftHTop TStringFieldquCurrencyCURRENCYDisplayLabel�f��DisplayWidth	FieldNameCURRENCYOriginCURRENCY.CURRENCYSize  	TBCDFieldquCurrencyBASE_CURRENCYDisplayLabel�򥻳f��DisplayWidth	FieldNameBASE_CURRENCYOriginCURRENCY.BASE_CURRENCY  	TBCDFieldquCurrencyFOREIGN_CURRENCYDisplayLabel�~��f��DisplayWidth	FieldNameFOREIGN_CURRENCYOriginCURRENCY.BASE_CURRENCY  TStringFieldquCurrencyCOMPANY_IDDisplayWidth	FieldName
COMPANY_IDOriginCURRENCY.COMPANY_IDVisibleSize   TwwDataSource
dsCurrencyDataSet
quCurrencyLeftTop  
TUpdateSQL
usCurrencyModifySQL.Stringsupdate currencyset  COMPANY_ID = :COMPANY_ID,  CURRENCY = :CURRENCY,!  BASE_CURRENCY = :BASE_CURRENCY,&  FOREIGN_CURRENCY = :FOREIGN_CURRENCYwhere"  COMPANY_ID = :OLD_COMPANY_ID and  CURRENCY = :OLD_CURRENCY InsertSQL.Stringsinsert into currency9  (COMPANY_ID, CURRENCY, BASE_CURRENCY, FOREIGN_CURRENCY)values=  (:COMPANY_ID, :CURRENCY, :BASE_CURRENCY, :FOREIGN_CURRENCY) DeleteSQL.Stringsdelete from currencywhere"  COMPANY_ID = :OLD_COMPANY_ID and  CURRENCY = :OLD_CURRENCY LeftTopP  TPrinterSetupDialogps_PrinterSetupLeft� Top�    