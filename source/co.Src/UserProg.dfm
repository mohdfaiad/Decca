�
 TFMUSERPROG 0S  TPF0TfmUserProg
fmUserProgLeft,Top;
AutoScrollCaption�s��Τ�\��ClientHeightClientWidthFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanelpaHeaderLeft Top WidthHeight$AlignalTop
BevelInnerbvRaisedBorderStylebsSingleCaption Locked	TabOrder  TSpeedButtonsbExitLeft TopWidthHeightHint����Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
Glyph.Data
�  �  BM�      v   (   "            ,                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� ����������������   �� �������������   ��0������������   �0�������3�����    30   ��3    ��   �30�����3�����   �3 �����0���O�   �30��D��3���O�   �30��DD�3��DDO   �30�DDD�3��DDO   �30��DD�3��DDO   �3��D��0����O�   �0����������O�   ������� �������   �   ����    ����   	NumGlyphs
ParentFontParentShowHintShowHint	OnClicksbExitClick  TSpeedButtonsbPrintSetupLeftTopWidthHeightHint���L��
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww333333333333333333333>��33333>��33333�3333333�33>����333>����33333333�3333333�3333333>��33333>��33333333333333333333333333333333	NumGlyphsParentShowHintShowHint	  TSpeedButtonsbPrintLeft<TopWidthHeightHint���L
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      7wwwwwws�������3333337��������������        wwwwwwww�������333333��������3333377��������������        wwwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�3s3330�� 33337��w33330  33337wws333	NumGlyphsParentShowHintShowHint	   TCheckListBoxclbFuncLeft Top� Width�Height�OnClickCheckclbFuncClickCheckAlignalLeft
ItemHeightTabOrder  TPanelPanel1Left Top$WidthHeightuAlignalTop
BevelOuter	bvLoweredTabOrder TLabelLabel1LeftTopWidth8HeightCaption�Τ�b��Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel2LeftTop8WidthHeightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontVisible  TLabelLabel3Left TopWidth8HeightCaption���q�N��Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel4Left TopPWidth8HeightCaption�{�ǽs��Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel5Left Top0Width8HeightCaption�t�ΥN��Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBEditdedCompanyIDLeft`TopWidth� Height	DataField
COMPANY_ID
DataSourcedmDecca.dsUserProg	MaxLengthReadOnly	TabOrder   TDBEditdedProgramIDLeft`TopPWidth� Height	DataField
PROGRAM_ID
DataSourcedmDecca.dsUserProgReadOnly	TabOrder  TDBEdit	dedUserIDLeft`TopWidth� Height	DataFieldUSER_ID
DataSourcedmDecca.dsUserProg	MaxLengthTabOrder  TDBEdit
dedFuncAppLeftTopPWidth� Height	DataFieldFUNC_APPROVED
DataSourcedmDecca.dsUserProgEnabledTabOrderVisible  TDBEditdedModuleIDLeft`Top0Width9Height	DataField	MODULE_ID
DataSourcedmDecca.dsUserProgReadOnly	TabOrder   TButtonbtnSelectAllLeft�Top� WidthKHeightCaption��  ��TabOrderOnClickbtnSelectAllClick  TButtonbtnUnselectAllLeft�Top� WidthKHeightCaption��  ��TabOrderOnClickbtnUnselectAllClick  TButton	btnDeleteLeft�Top8WidthKHeightCaption�R  ��TabOrderOnClickbtnDeleteClick  TBitBtn	bbConfirmLeft�ToprWidthKHeightCaption�̩wTabOrderOnClickbbConfirmClickKindbkOK  TBitBtnbbCancelLeft�Top�WidthKHeightCaption����TabOrderOnClickbbCancelClickKindbkCancel  TQueryquSelProgramIDDatabaseNamedbCommonSQL.Strings'select  distinct Program_ID, Module_ID    from PROG_PWD   where Module_ID = :Module_ID!   order by program_id, module_id Params.Data
     	Module_ID  0   
UpdateModeupWhereChangedLeftxToph TStringFieldquSelProgramIDPROGRAM_ID	FieldName
PROGRAM_IDSize  TStringFieldquSelProgramIDMODULE_ID	FieldName	MODULE_IDSize   TDataSourcedsSelProgramIDDataSetquSelProgramIDLeftxTop�   