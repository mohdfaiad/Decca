unit contract;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls, StdCtrls, Mask, wwdbedit,
  Menus, Wwdotdot, Wwdbcomb, wwdbdatetimepicker,db, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, wwdblook, DBTables, Wwquery;

type
  TfmContract = class(TForm)
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
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    printSetup: TPrinterSetupDialog;
    pcContract: TPageControl;
    tsContract: TTabSheet;
    tsDetail: TTabSheet;
    paViewJob_no: TPanel;
    laJOB_NO_1: TLabel;
    laJOB_NO_2: TLabel;
    dedJOB_NO_1: TwwDBEdit;
    dedJOB_NO_2: TwwDBEdit;
    gbSubContract: TGroupBox;
    gbUser: TGroupBox;
    laCreatedBy: TLabel;
    laCreateDate: TLabel;
    dedCreatedBy: TwwDBEdit;
    dtCreateDate: TwwDBDateTimePicker;
    pmGrid: TPopupMenu;
    pmGPost: TMenuItem;
    pmGCancel: TMenuItem;
    pmGDelete: TMenuItem;
    mmConTract: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    laDescrSUB: TLabel;
    dedDescrSUB: TwwDBEdit;
    GroupBox2: TGroupBox;
    dgrDetail: TwwDBGrid;
    mmReport: TMenuItem;
    mmRepConTr: TMenuItem;
    laSubCostCat: TLabel;
    gbContractNo: TGroupBox;
    laSubContract_no: TLabel;
    laSubJobNo: TLabel;
    dedContractNo: TwwDBEdit;
    dedContractTitle: TwwDBEdit;
    drgFWOStatus: TDBRadioGroup;
    dedSubDescr: TwwDBEdit;
    gbJob: TGroupBox;
    laRetentationAMT: TLabel;
    laRetentionLimit: TLabel;
    laContractSum: TLabel;
    laEstVoAMT: TLabel;
    dedRetentionLimit: TwwDBEdit;
    dedRetentationAMT: TwwDBEdit;
    dedContractSum: TwwDBEdit;
    dedEstVoAMT: TwwDBEdit;
    GroupBox1: TGroupBox;
    dmeSUBcomment: TDBMemo;
    laVendorNo: TLabel;
    laContractDate: TLabel;
    dtContractDate: TwwDBDateTimePicker;
    laWorkStartDate: TLabel;
    dtWorkStartDate: TwwDBDateTimePicker;
    Label1: TLabel;
    Label3: TLabel;
    dbdtpEndDate: TwwDBDateTimePicker;
    dbluJobCostCat: TwwDBLookupCombo;
    Bevel1: TBevel;
    dedContractTotal: TwwDBEdit;
    dbluVendor: TwwDBLookupCombo;
    quVendor: TwwQuery;
    quVendorVENDOR_NO: TStringField;
    quVendorNAME: TStringField;
    quVendorADDRESS: TMemoField;
    dedVendorName: TwwDBEdit;
    dbluSubJobNo: TwwDBLookupCombo;
    Label2: TLabel;
    dbluTrade: TwwDBLookupCombo;
    quTrade: TwwQuery;
    quTradeTRADE: TStringField;
    quTradeDESCRIPTION: TStringField;
    quSubContractSumry: TwwQuery;
    quSubContractSumryDEDUCTDEPOSIT: TBCDField;
    quSubContractSumryRETENTIONAMT: TBCDField;
    quSubContractSumryDAYWORKSAMT: TBCDField;
    quSubContractSumryAPPLYAMT: TBCDField;
    quSubContractSumryAPPLYVOAMT: TBCDField;
    quSubContractSumrycalApplyTotal: TCurrencyField;
    quSubContractSumrycalPayTotal: TCurrencyField;
    quSubContractSumryCERTAMT: TBCDField;
    quSubContractSumryDEPOSITAMT: TBCDField;
    quSubContractSumrycalNetTotal: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure pmPostClick(Sender: TObject);
    procedure pmCancelClick(Sender: TObject);
    procedure pmDeleteClick(Sender: TObject);
    procedure pmInsertClick(Sender: TObject);
    procedure pcContractChange(Sender: TObject);
    procedure pmGridPopup(Sender: TObject);
    procedure dgrDetailDblClick(Sender: TObject);
    procedure mmRepConTrClick(Sender: TObject);
    procedure dblcSubCatNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dedContractSumChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgrDetailUpdateFooter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmContract: TfmContract;

implementation
  uses JCdatadm,
       JCmain,
       SbConDtl,
       PtSubCon;
{$R *.DFM}

procedure TfmContract.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  with quVendor do
    if not Active then
      Open;
  with quTrade do
    if not Active then
      Open;
  with quSubContractSumry do
  begin
    if Active then Close;
    if not Prepared then Prepare;
    Open;
  end;
  with dmJCdata do
  begin
    if quJCcontrolUSE_JOB_NO_2.AsString = 'N' then
    begin
      dedJOB_NO_2.Visible := False;
      laJOB_NO_2.Visible := False;
    end;
    with quSubContract_detail do
      if not Active then Open;
    with quJob_cost_file do
      if not Active then Open;
  end;
  pcContract.ActivePage := tsContract;
end;

procedure TfmContract.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmContract.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmContract.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('打印屏幕么?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmContract.pmPostClick(Sender: TObject);
begin
  dmJCdata.quSubContract_detail.Post;
end;

procedure TfmContract.pmCancelClick(Sender: TObject);
begin
  dmJCdata.quSubContract_detail.Cancel;
end;

procedure TfmContract.pmDeleteClick(Sender: TObject);
begin
  dmJCdata.quSubContract_detail.Delete;
end;

procedure TfmContract.pmInsertClick(Sender: TObject);
begin
  dmJCdata.quSubContract_detail.Insert;
end;

procedure TfmContract.pcContractChange(Sender: TObject);
begin
  if pcContract.ActivePage <> tsContract then
    dnaContract.Enabled := False
  else
    dnaContract.Enabled := True;
end;

procedure TfmContract.pmGridPopup(Sender: TObject);
begin
  with dmJCdata.quSubContract_detail do
  begin
    if not IsEmpty then
    begin
      if ((state = dsedit) or (state = dsinsert)) then
      begin
        pmGPost.Enabled := True;
        pmGDelete.Enabled := False;
        pmGCancel.Enabled := True;
      end else
      begin
        pmGPost.Enabled := False;
        pmGDelete.Enabled := True;
        pmGCancel.Enabled := False;
      end;
    end else
    begin
      pmGPost.Enabled := False;
      pmGDelete.Enabled := False;
      pmGCancel.Enabled := False;
    end;
  end;
end;

procedure TfmContract.dgrDetailDblClick(Sender: TObject);
begin
  Application.CreateForm(TfmSbConDtl,fmSbConDtl);
  try
    fmSbConDtl.ShowModal;
  finally
    fmSbConDtl.Release;
  end;
end;

procedure TfmContract.mmRepConTrClick(Sender: TObject);
begin
  Application.CreateForm(TfmPtSubCon,fmPtSubCon);
  try
    fmPtSubCon.ShowModal;
  finally
    fmPtSubCon.Release;
  end;
end;

procedure TfmContract.dblcSubCatNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  ShowMessage('數据不正确');
end;

procedure TfmContract.dedContractSumChange(Sender: TObject);
begin
  with dmJCData do
    with quSubContract do
      if (quSubContract.State = dsInsert) or
         (quSubContract.State = dsEdit) then
        quSubContractcalContractTotal.Value :=
          quSubContractCONTRACT_SUM.Value + quSubContractEST_VO_AMT.Value;
end;

procedure TfmContract.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCData do
  begin
    with quJob_cost_file do
      if Active then Close;
  end;
  with quVendor do
    if Active then Close;
  with quTrade do
    if Active then Close;
  with quSubContractSumry do
  begin
    if Active then Close;
    if Prepared then Unprepare;
  end;
end;

procedure TfmContract.dgrDetailUpdateFooter(Sender: TObject);
begin
 with quSubContractSumry do
 begin
   dgrDetail.ColumnByName('Cert_Amt').FooterValue :=
      FloatToStrF(quSubContractSumryCERTAMT.AsFloat, ffCurrency, 12, 2);
   dgrDetail.ColumnByName('Deposit_Amt').FooterValue :=
      FloatToStrF(quSubContractSumryDEPOSITAMT.AsFloat, ffCurrency, 12, 2);
   dgrDetail.ColumnByName('Apply_Amt').FooterValue :=
      FloatToStrF(quSubContractSumryAPPLYAMT.AsFloat, ffCurrency, 12, 2);
   dgrDetail.ColumnByName('Apply_VO_Amt').FooterValue :=
      FloatToStrF(quSubContractSumryAPPLYVOAMT.AsFloat, ffCurrency, 12, 2);
   dgrDetail.ColumnByName('DayWorks').FooterValue :=
      FloatToStrF(quSubContractSumryDAYWORKSAMT.AsFloat, ffCurrency, 12, 2);
 end;

end;

procedure TfmContract.FormShow(Sender: TObject);
begin
  with quSubContractSumry do
  begin
    if Active then Close;
      Open;
  end;
end;

end.
