unit SbConDtl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, Mask, wwdbedit, StdCtrls, ExtCtrls, DBCtrls,
  wwSpeedButton, wwDBNavigator, Buttons, Menus, Db, DBTables, Wwquery,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid;

type
  TfmSbConDtl = class(TForm)
    gbDetail: TGroupBox;
    paEdit: TPanel;
    mmConTract: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    printSetup: TPrinterSetupDialog;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaContract: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    Panel1: TPanel;
    dedCertAmt: TwwDBEdit;
    dedCertNo: TwwDBEdit;
    Bevel1: TBevel;
    dedSubContractNo: TwwDBEdit;
    dedLineNo: TwwDBEdit;
    Bevel2: TBevel;
    laApply: TLabel;
    laApplyVO: TLabel;
    laDayWorks: TLabel;
    laInvcNo: TLabel;
    dedInvcNo: TwwDBEdit;
    dedApplyAmt: TwwDBEdit;
    dedVOAmt: TwwDBEdit;
    dedDayWorks: TwwDBEdit;
    laAmt: TLabel;
    laApplyAmt: TLabel;
    laCertNo: TLabel;
    laDate: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    gbComment: TGroupBox;
    dmeComment: TDBMemo;
    dedContractSum: TwwDBEdit;
    dedEstVOAmt: TwwDBEdit;
    laContractSum: TLabel;
    laVO: TLabel;
    laContractAmt: TLabel;
    Bevel9: TBevel;
    laDeductDeposit: TLabel;
    dedDeductDeposit: TwwDBEdit;
    laRetentionAmt: TLabel;
    Bevel10: TBevel;
    dedRetention: TwwDBEdit;
    laLineNo: TLabel;
    Label1: TLabel;
    Bevel11: TBevel;
    quSubcontractSumry: TwwQuery;
    dsSubcontractSumry: TwwDataSource;
    quSubcontractSumryDEDUCTDEPOSIT: TBCDField;
    quSubcontractSumryRETENTIONAMT: TBCDField;
    dedPayTotal: TwwDBEdit;
    dedContractTotal: TwwDBEdit;
    dedApplyTotal: TwwDBEdit;
    dedAccumDeductAmt: TwwDBEdit;
    dedAccumRetentionAmt: TwwDBEdit;
    dedAccumCertAmt: TwwDBEdit;
    dedAccumApplyTotal: TwwDBEdit;
    dedAccumDayWorks: TwwDBEdit;
    dedAccumVOAmt: TwwDBEdit;
    dedAccumApplyAmt: TwwDBEdit;
    Label3: TLabel;
    quSubcontractSumryDAYWORKSAMT: TBCDField;
    quSubcontractSumryAPPLYAMT: TBCDField;
    quSubcontractSumryAPPLYVOAMT: TBCDField;
    quSubcontractSumrycalApplyTotal: TCurrencyField;
    Label4: TLabel;
    dbdtpCertDate: TwwDBDateTimePicker;
    dbdtpApplyDate: TwwDBDateTimePicker;
    dedAccumPayTotal: TwwDBEdit;
    quSubcontractSumrycalPayTotal: TCurrencyField;
    quSubcontractSumryCERTAMT: TBCDField;
    laSubContractNo: TLabel;
    dedDeposit: TwwDBEdit;
    dedAccumDeposit: TwwDBEdit;
    Bevel12: TBevel;
    laDeposit: TLabel;
    Bevel13: TBevel;
    dedPrevisionAmt: TwwDBEdit;
    dedAccumPrevision: TwwDBEdit;
    Label2: TLabel;
    quSubcontractSumryDEPOSITAMT: TBCDField;
    dedNetAmt: TwwDBEdit;
    dedAccumNetAmt: TwwDBEdit;
    Bevel14: TBevel;
    Label5: TLabel;
    quSubcontractSumrycalNetTotal: TCurrencyField;
    quSubcontractSumryPREPAYMENTAMT: TBCDField;
    gbPayment: TGroupBox;
    dgrPayment: TwwDBGrid;
    quPaymentSumry: TwwQuery;
    quPaymentSumryPAIDAMT: TBCDField;
    quPaymentSumryRECCOUNT: TIntegerField;
    puPayment: TPopupMenu;
    puPost: TMenuItem;
    N1: TMenuItem;
    puDelete: TMenuItem;
    puCancel: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dedCertAmtChange(Sender: TObject);
    procedure dedApplyAmtChange(Sender: TObject);
    procedure quSubcontractSumryCalcFields(DataSet: TDataSet);
    procedure dgrPaymentUpdateFooter(Sender: TObject);
    procedure puPaymentPopup(Sender: TObject);
    procedure puPostClick(Sender: TObject);
    procedure puDeleteClick(Sender: TObject);
    procedure puCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSbConDtl: TfmSbConDtl;

implementation
  uses JCdatadm,JCmain;
{$R *.DFM}

procedure TfmSbConDtl.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  with quPaymentSumry do
  begin
    if Active then
      Close;
    Prepare;
  end;
  with quSubcontractSumry do
  begin
    if not Active then
      Open;
  end;
end;

procedure TfmSbConDtl.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSbConDtl.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmSbConDtl.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmSbConDtl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quSubcontractSumry do
    if Active then Close;
  with quPaymentSumry do
    if Active then Close;
end;

procedure TfmSbConDtl.dedCertAmtChange(Sender: TObject);
begin
  with dmJCData do
    with quSubContract_detail do
      if (quSubContract_detail.State = dsInsert) or
         (quSubContract_detail.State = dsEdit) then
      begin
       quSubContract_detailcalPayTotal.Value :=
         quSubContract_detailCERT_AMT.Value +
         quSubContract_detailDEPOSIT_AMT.Value -
         quSubContract_detailDEDUCT_DEPOSIT.Value -
         quSubContract_detailRETENTION_AMT.Value;
       quSubContract_detailcalNetPay.Value :=
         quSubContract_detailcalPayTotal.Value -
         quSubContract_detailPREPAYMENT.Value;
      end;
end;

procedure TfmSbConDtl.dedApplyAmtChange(Sender: TObject);
begin
  with dmJCData do
    with quSubContract_detail do
      if (quSubContract_detail.State = dsInsert) or
         (quSubContract_detail.State = dsEdit) then
        quSubContract_detailcalApplyTotal.Value :=
          quSubContract_detailAPPLY_AMT.Value +
          quSubContract_detailAPPLY_VO_AMT.Value +
          quSubContract_detailDAYWORKS.Value;
end;

procedure TfmSbConDtl.quSubcontractSumryCalcFields(DataSet: TDataSet);
begin
  quSubcontractSumrycalApplyTotal.Value :=
    quSubcontractSumryAPPLYAMT.Value +
    quSubcontractSumryAPPLYVOAMT.Value +
    quSubcontractSumryDAYWORKSAMT.Value;
  quSubcontractSumrycalPayTotal.Value :=
    quSubcontractSumryCERTAMT.Value +
    quSubcontractSumryDEPOSITAMT.Value -
    quSubcontractSumryRETENTIONAMT.Value -
    quSubcontractSumryDEDUCTDEPOSIT.Value;
  quSubcontractSumrycalNetTotal.Value :=
    quSubcontractSumrycalPayTotal.Value -
    quSubcontractSumryPREPAYMENTAMT.Value;
end;

procedure TfmSbConDtl.dgrPaymentUpdateFooter(Sender: TObject);
begin
 with dmJCData, quSubContract_detail do
   with quPaymentSumry do
   begin
     if Active then Close;
     begin
       ParamByName('Subcontract_No').Value := quSubContract_detailSUBCONTRACT_NO.Value;
       ParamByName('Line_No').Value := quSubContract_detailLINE_NO.Value;
     end;
     Open;
     dgrPayment.ColumnByName('Voucher_No').FooterValue :=
       quPaymentSumryRECCOUNT.AsString;
     dgrPayment.ColumnByName('Paid_Amt').FooterValue :=
       FloatToStrF(quPaymentSumryPAIDAMT.AsFloat, ffCurrency, 12, 2);
   end;
end;

procedure TfmSbConDtl.puPaymentPopup(Sender: TObject);
begin
  with dmJCData.dsSubContractPayment do
  begin
    if (DataSet.State = dsInsert) or
       (DataSet.State = dsEdit) then
    begin
      puPost.Enabled := True;
      puCancel.Enabled := True;
    end
    else
    begin
      puPost.Enabled := False;
      puCancel.Enabled := False;
    end;
    if ((DataSet.State = dsInsert) or
       (DataSet.State = dsEdit) or
       (DataSet.State = dsBrowse)) and
       (DataSet.RecordCount > 0) then
      puDelete.Enabled := True
    else
      puDelete.Enabled := False;
  end;
end;

procedure TfmSbConDtl.puPostClick(Sender: TObject);
begin
  with dmJCData do
    with quSubContractPayment do
      Post;
end;

procedure TfmSbConDtl.puDeleteClick(Sender: TObject);
begin
  with dmJCData do
    with quSubContractPayment do
      Delete;
end;

procedure TfmSbConDtl.puCancelClick(Sender: TObject);
begin
  with dmJCData do
    with quSubContractPayment do
      Cancel;
end;

end.
