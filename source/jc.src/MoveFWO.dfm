�
 TFMMOVEFWO 0j  TPF0
TfmMoveFWO	fmMoveFWOLeftTop}WidthHeight� Font.CharsetCHINESEBIG5_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.Style OnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelLabel1Left	TopWidthCHeightCaption��Ӥu�{�s��  TLabelLabel2Left	TopaWidth7HeightCaption
�s�u�{�s��  TLabelLabel3Left	Top0WidthLHeightCaption��Ӥl�u�{�s��  TLabelLabel4Left	TopxWidth@HeightCaption�s�l�u�{�s��  TBitBtnbtnOkLeft;Top� WidthKHeightCaption�̩wModalResultTabOrder OnClick
btnOkClick
Glyph.Data
�  �  BM�      v   (   $            h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�8�3�333  2"��"C3338�3�333  :*3:"$3338�38�8�33  3�33�"C333�33�3�33  3333:"$3333338�8�3  33333�"C333333�3�3  33333:"$3333338�8�  333333�"C333333�3�  333333:"C3333338�  3333333�#3333333��  3333333:3333333383  333333333333333333  	NumGlyphs  TBitBtnbtnCloseLeft� Top� WidthKHeightCaption�h�XDefault	TabOrderOnClickbtnCloseClick
Glyph.Data
�  �  BM�      v   (   $            h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 8����w���������33?  DD@���DD������3��  33MP��33�����38��  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33DDDDD3333������?  33333333333�����3?  333   333333?���3?  333
��333333����3?  333   333333����3?  	NumGlyphs  TEditedOrigJobNoLeftzTopWidthxHeightEnabledTabOrder  TEditedOrigSubJobNoLeftzTop0WidthxHeightEnabledTabOrder  TwwDBLookupComboDlgdbluNewJobNoLeftzTopXWidthxHeightCharCaseecUpperCaseGridOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgPerfectRowFit 	GridColorclWhiteGridTitleAlignmenttaLeftJustifyCaptionLookupMaxWidth 	MaxHeight� Selected.StringsJobNo	20	�u�{�s��	FDESCRIPTION	60	����	F LookupTablequSelectJobLookupFieldJobNoTabOrderAutoDropDown
ShowButton	AllowClearKey  TwwDBLookupComboDlgdbluNewSubJobNoLeftzTopxWidthxHeightCharCaseecUpperCaseGridOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgPerfectRowFit 	GridColorclWhiteGridTitleAlignmenttaLeftJustifyCaptionLookupMaxWidth 	MaxHeight� LookupTablequSelectSubJobLookupField
SUB_JOB_NOTabOrderAutoDropDown
ShowButton	AllowClearKey  TwwQueryquSelectJobOnCalcFieldsquSelectJobCalcFieldsDatabaseNamedbJCdataSQL.Stringsselect  job_no_1,           job_no_2,          Description  from Job_File  order by Job_No_1, Job_No_2 ValidateWithMask	Left� Top  TStringFieldquSelectJobJobNoDisplayLabel�u�{�s��DisplayWidth	FieldNameJobNo
Calculated	  TStringFieldquSelectJobDESCRIPTIONDisplayLabel����DisplayWidth<	FieldNameDESCRIPTIONSize<  TStringFieldquSelectJobJOB_NO_1	FieldNameJOB_NO_1VisibleSize  TStringFieldquSelectJobJOB_NO_2	FieldNameJOB_NO_2VisibleSize   TwwQueryquSelectSubJobDatabaseNamedbJCdata
DataSourcedsSelectJobSQL.Stringsselect Sub_Job_No,          Description  from Sub_Job_File  where Job_No_1 = :Job_No_1      and Job_No_2 = :Job_No_2   order by Sub_Job_No Params.Data
*     JOB_NO_1  097A06   JOB_NO_2     ValidateWithMask	Left� Top` TStringFieldquSelectSubJobSUB_JOB_NO	FieldName
SUB_JOB_NOSize  TStringFieldquSelectSubJobDESCRIPTION	FieldNameDESCRIPTIONSize<   TwwDataSourcedsSelectJobDataSetquSelectJobLeft� Top@  TwwQueryquSelectJobFWODatabaseNamedbJCdataSQL.Strings	select *   from Job_Fwo  where Job_No_1 = :Job_No_1      and Job_No_2 = :Job_No_2     and FWO_No = :FWO_No Params.Data
5     Job_No_1  0   Job_No_2  0   FWO_No  0   ValidateWithMask	LeftTop�    