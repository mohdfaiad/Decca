�
 TFMJOBIMP 0�  TPF0	TfmJobImpfmJobImpLeft�Top� WidthFHeight� Caption�u�{�s�����JFont.CharsetCHINESEBIG5_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.Style PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelLabel1LeftTopPWidthDHeightCaption�u�{�s��(��)  TLabelLabel2LeftTop(WidthDHeightCaption�u�{�s��(�_)  TEdit
edJobNoEndLeftpTopPWidth� HeightCharCaseecUpperCaseTabOrder  TEdit	edJobNoSTLeftpTop Width� HeightCharCaseecUpperCaseTabOrder OnExitedJobNoSTExit  TBitBtnbtnOKLeft8Top� WidthKHeightCaption�̩wTabOrderOnClick
btnOKClickKindbkOK  TBitBtnbtnExitLeft� Top� WidthKHeightCaption�h�XTabOrderOnClickbtnExitClickKindbkAbort  TwwQueryquSel1SubJobDatabaseNamedbCTDataSQL.Stringsselect job_no  from sub_job  where job_no = :job_no      and line_no = :FWO_No Params.Data
$     job_no  0   FWO_No        ValidateWithMask	LeftTop  TwwQuery	quSel1JobDatabaseNamedbCTDataSQL.Stringsselect job_no
  from job  where job_no = :Job_No Params.Data
     Job_No  0   ValidateWithMask	LeftTop8   