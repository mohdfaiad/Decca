�
 TFMSELECT 0   TPF0	TfmselectfmselectLeft9Top:WidthKHeight�Caption����D��s��Font.CharsetCHINESEBIG5_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.Style Menu	MainMenu1OnCreate
FormCreatePixelsPerInch`
TextHeight TLabellaNoLeft TopxWidth2HeightCaption�D��s��  TLabel	laPrintNoLeft� TopxWidthFHeightCaption���L�D��s��  TLabelLabel2Left� Top`Width4HeightCaption���L�ƶqFont.CharsetCHINESEBIG5_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.Style 
ParentFont  TButtonbtnSiAddLeft� Top� Width(HeightCaption>TabOrderOnClickbtnSiAddClick  TButtonbtnAlAddLeft� Top� Width(HeightCaption>>TabOrderOnClickbtnAlAddClick  TButtonbtnSiDelLeft� Top� Width(HeightCaption<TabOrderOnClickbtnSiDelClick  TButtonbtnAlDelLeft� Top Width(HeightCaption<<TabOrderOnClickbtnAlDelClick  TButtonbtnPrintLeft� Top0Width(HeightCaption���LTabOrderOnClickbtnPrintClick  TButtonbtnPrintExitLeft� Top`Width(HeightCaption�h�XTabOrderOnClickbtnPrintExitClick  TListBoxlbNoLeftTop� WidthdHeight
ItemHeightTabOrder
OnDblClickbtnSiAddClick  TListBox	lbPrintNoLeft� Top� WidthdHeight
ItemHeightTabOrder	
OnDblClickbtnSiDelClick  TPanelpaLabelLeft Top WidthCHeight$AlignalTop
BevelInnerbvRaisedBorderStylebsSingleCaption Locked	TabOrder
 TSpeedButtonsbPrintSetupLeftTop WidthHeightHint���L��
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww333333333333333333333>��33333>��33333�3333333�33>����333>����33333333�3333333�3333333>��33333>��33333333333333333333333333333333	NumGlyphsParentShowHintShowHint	OnClicksbPrintSetupClick  TSpeedButtonsbExitLeft Top WidthHeightHint����Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
Glyph.Data
�  �  BM�      v   (   "            ,                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� ����������������   �� �������������   ��0������������   �0�������3�����    30   ��3    ��   �30�����3�����   �3 �����0���O�   �30��D��3���O�   �30��DD�3��DDO   �30�DDD�3��DDO   �30��DD�3��DDO   �3��D��0����O�   �0����������O�   ������� �������   �   ����    ����   	NumGlyphs
ParentFontParentShowHintShowHint	OnClicksbExitClick  TSpeedButtonsbBrowseLeft;Top WidthHeightHint�M��s��
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 3333333333333?3333330 333333�w333333 33333?ws333330 333333�w333333 333?�?ws337 ;p333?ws�w333ww �333w37ws330��p3337�337�33w����s3373337?33����33333333����33333333����33s�333s33w����s337�337�330��p3337?�3�3333ww3333w?�s33337 333333ws3333	NumGlyphsParentShowHintShowHint	OnClickedNoExit   	TSpinEditsePrintCountLeft� Top\Width1HeightFont.CharsetCHINESEBIG5_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.Style MaxValue�MinValue
ParentFontTabOrderValue  TPanelPanel1Left Top$WidthCHeight3AlignalTopTabOrder  TLabelLabel1Left(TopWidth0HeightCaption�s�����  TEditedNoLeft`TopWidthIHeightCharCaseecUpperCaseTabOrder 
OnDblClickedNoDblClickOnExitedNoExit  TRadioButtonrbJobNoLeft� TopWidthQHeightCaption�u�{�s��Checked	TabOrderTabStop	OnClickrbJobNoClick  TRadioButtonrbFwoNoLeft� TopWidthIHeightCaption�D��s��TabOrderOnClickrbFwoNoClick   TDataSourcedsFwoSelectDataSetquFwoSelectLeft� Toph  TQueryquFwoSelectActive	DatabaseNamedbLabelSQL.Stringsselect * from Job    where Job_No = :iJob_No    order by Fwo_No desc; Params.Data
     iJob_No  0   Left� Toph  TTable
taLbSelectActive	DatabaseNamedbLabel	TableNameJOBLeft Toph  TPrinterSetupDialogps_PrintSetupLeft� Top@  	TMainMenu	MainMenu1Left� Top@ 	TMenuItemN1Caption��� 	TMenuItemmmPrintSetupCaption
���L��]�mOnClickmmPrintSetupClick  	TMenuItemN3Caption����OnClickN3Click   	TMenuItemN6Caption�u�� 	TMenuItemmmImportCaption�W��OnClickmmImportClick  	TMenuItemN2Caption-  	TMenuItem	mmEditJobCaption��s�u�{���OnClickmmEditJobClick    	TDatabasedbLabel	AliasNamelbData	Connected	DatabaseNamedbLabelParams.Strings.SERVER NAME=\\deccant\d:\decca\label\label.gdbUSER NAME=labelPASSWORD=label01 SessionNameDefaultLeft Top8  TDataSourcedsJobSelectDataSetquJobSelectLeft� Top  TQueryquJobSelectDatabaseNamedbLabelSQL.Stringsselect *    from Job   where Fwo_No = :iFwo_No   order by Fwo_No, Job_No Params.Data
     iFwo_No  0   Left Top   