�
 TFMSELREP 0�  TPF0	TfmSelRepfmSelRepLeft@TopKWidth3HeightCaption��ܭn��@�������u�{�Ψ�l�u�{Font.CharsetCHINESEBIG5_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.Style PositionpoScreenCenterOnShowFormShowPixelsPerInch`
TextHeight TLabelLabel1Left6Top$Width0HeightCaption�u�{�s��  TLabelLabel2Left6TopLWidth8HeightCaption
�ǦC��(�_)  TLabelLabel3Left6ToptWidth8HeightCaption
�ǦC��(��)  TEditedJobNoLeft~Top WidthyHeightCharCaseecUpperCaseTabOrder   TEdit
edLineNoSTLeft� TopHWidthIHeightCharCaseecUpperCaseTabOrder  TEditedLineNoENDLeft� ToppWidthIHeightCharCaseecUpperCaseTabOrder  TBitBtnbtnOkLeft>Top� WidthKHeightCaption���LDefault	ModalResultTabOrderOnClick
btnOkClick
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      7wwwwwws�������3333337��������������        wwwwwwww�������333333��������3333377��������������        wwwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�3s3330�� 33337��w33330  33337wws333	NumGlyphs  TBitBtnbtnExitLeft� Top� WidthKHeightCaption�h�XTabOrderOnClickbtnExitClickKindbkClose  TQueryquLineNoDatabaseNamedbCTDataSQL.Stringsselect  Distinct Line_Nofrom      Sub_Job_Costwhere    ( (Job_No = :iJob_No)  and  8     (Line_No >= :iLineNoST  and Line_No <= :iLineNoEND)    )  order by Line_No; Params.Data
=     iJob_No  0   	iLineNoST        
iLineNoEND        Left Top   TQuery	quCostSumDatabaseNamedbCTDataSQL.StringsCselect  sum(Actual_Amt)  as ActualSum, Sum(Budget_Amt) as BudgetSum  from Sub_Job_Cost5  where (Job_No = :iJobNo)  and  (Line_No = :iLineNo)   Params.Data
#     iJobNo  0   iLineNo  0   Left TopP   