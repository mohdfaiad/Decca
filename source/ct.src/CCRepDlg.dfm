�
 TFMCCREPDLG 0
  TPF0TfmCCRepDlg
fmCCRepDlgLeftTop� BorderStylebsDialogCaption�u�{�����������س���ClientHeightbClientWidth�Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TLabelSrcLabelLeftTopDWidth{HeightAutoSizeCaption�u�{�ҥΦ�������  TSpeedButton
IncludeBtnLeft� ToplWidthKHeightCaption>EnabledOnClickIncludeBtnClick  TSpeedButton
ExcludeBtnLeft� Top� WidthKHeightCaption<EnabledOnClickExcludeBtnClick  TSpeedButtonExAllBtnLeft� Top� WidthKHeightCaption<<EnabledOnClickExcAllBtnClick  TLabelLabel1LeftTopWidth0HeightCaption�u�{�s��  TLabelLabel2Left.TopDWidth0HeightCaption���L����  TListBoxSrcListLeftTopTWidth� Height� 
ItemHeightMultiSelect	Sorted	TabOrder 
OnDblClickIncludeBtnClick  TListBoxDstListLeft.TopTWidth� Height� 
ItemHeightMultiSelect	Sorted	TabOrder
OnDblClickExcludeBtnClick  TButtonbtPrintLeft� Top� WidthKHeightCaption���L(&P)EnabledTabOrderOnClickbtPrintClick  TButtonbtCloseLeft� TopWidthKHeightCaption����(&C)TabOrderOnClickbtCloseClick  TRadioGroup	rdgFormatLeftTopWidth� Height1Caption�������eColumns	ItemIndex Items.Strings
1.�ƶq(&Q)
2.�ȽX(&A) TabOrder  TwwDBLookupComboDlg
dbLCDJobNoLeftTop WidthyHeightGridOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgPerfectRowFit 	GridColorclWhiteGridTitleAlignmenttaCenterCaptionLookupMaxWidth 	MaxHeight� Selected.StringsJOB_NO	7	�u�{�s��	FDESCRIPTION	60	�u�{�W��	FQUOT_NO	7	��ɲ�u�{�s��	F LookupTablequJobNoLookupFieldJOB_NO	MaxLengthTabOrderAutoDropDown
ShowButton	AllowClearKey
UseTFieldsOnChangedbLCDJobNoChangeOnEnterdbLCDJobNoEnterOnExitdbLCDJobNoExit  TQueryquSelCostCatDatabaseNamedbCTDataSQL.Stringsselect &  distinct Cost_Cat  from Sub_Job_Costwhere  Job_No = :JobNo  AND     Cost_Cat <> " " order by Cost_Cat   Params.Data
     JobNo    Left� TopD  TDataSourcedsSelCostCatDataSetquSelCostCatLeft TopD  TwwQueryquJobNoDatabaseNamedbCTDataSQL.Strings!select * from job order by Job_No ValidateWithMask	Left� Top TStringFieldquJobNoJOB_NODisplayLabel�u�{�s��	FieldNameJOB_NOOrigin
JOB.JOB_NOSize  TStringFieldquJobNoDESCRIPTIONDisplayLabel�u�{�W��	FieldNameDESCRIPTIONOriginJOB.DESCRIPTIONSize<  TStringFieldquJobNoQUOT_NODisplayLabel��ɲ�u�{�s��	FieldNameQUOT_NOOriginJOB.QUOT_NOSize  TStringFieldquJobNoKEYWORD	FieldNameKEYWORDOriginJOB.KEYWORD    