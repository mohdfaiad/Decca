�
 TFMCCREPDLG 0K  TPF0TfmCCRepDlg
fmCCRepDlgLeft� Top� BorderStylebsDialogCaption�u�{�����������س���ClientHeightbClientWidth�Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelSrcLabelLeftTopDWidth{HeightAutoSizeCaption�u�{�ҥΦ�������  TSpeedButton
IncludeBtnLeft� ToplWidthKHeightCaption>OnClickIncludeBtnClick  TSpeedButton
ExcludeBtnLeft� Top� WidthKHeightCaption<EnabledOnClickExcludeBtnClick  TSpeedButtonExAllBtnLeft� Top� WidthKHeightCaption<<EnabledOnClickExcAllBtnClick  TLabelLabel1LeftTopWidth0HeightCaption�u�{�W��  TLabelLabel2Left.TopDWidth0HeightCaption���L����  TListBoxSrcListLeftTopTWidth� Height� 
ItemHeightMultiSelect	Sorted	TabOrder OnClickSrcListClick
OnDblClickIncludeBtnClick  TListBoxDstListLeft.TopTWidth� Height� 
ItemHeightMultiSelect	Sorted	TabOrder
OnDblClickExcludeBtnClick  	TComboBoxcbQuotNoLeftTop!Width� Height
ItemHeightItems.Strings  TabOrderText OnChangecbQuotNoChange  TButtonbtPrintLeft� Top� WidthKHeightCaption���L(&P)EnabledTabOrderOnClickbtPrintClick  TButtonbtCloseLeft� TopWidthKHeightCaption����(&C)TabOrderOnClickbtCloseClick  TRadioGroup	rdgFormatLeftTopWidth� Height1Caption�������eColumns	ItemIndex Items.Strings
1.�ƶq(&Q)
2.�ȽX(&A) TabOrder  TQueryquSelCostCatDatabaseNamedbCTDataSQL.Stringsselect &  distinct Cost_Cat  from Sub_Job_Costwhere  Job_No = :JobNo  AND     Cost_Cat <> " " order by Cost_Cat   Params.Data
     JobNo    Left� Top  TDataSourcedsSelCostCatDataSetquSelCostCatLeft� Top   