unit fwocstdt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdblook, StdCtrls, Mask, wwdbedit, wwSpeedButton, wwDBNavigator,
  Buttons, ExtCtrls, Db, DBTables, Wwquery, TestPrg, wwdbdatetimepicker;

type
  TfmFWOCstDt = class(TForm)
    laJobNo: TLabel;
    dedJobNo1: TwwDBEdit;
    dedJobDesc: TwwDBEdit;
    laFWONo: TLabel;
    dedFWONo: TwwDBEdit;
    laJobCostCat: TLabel;
    dbluJobCostCat: TwwDBLookupCombo;
    dedFWODesc: TwwDBEdit;
    dedJobCostCatDesc: TwwDBEdit;
    dedUnit: TwwDBEdit;
    laUnit: TLabel;
    laRegRate: TLabel;
    dedRegRate: TwwDBEdit;
    Label1: TLabel;
    dedPremRate: TwwDBEdit;
    gbFWO: TGroupBox;
    dedJobRegAmt: TwwDBEdit;
    dedJobPremAmt: TwwDBEdit;
    dedJobRegQty: TwwDBEdit;
    dedJobPremQty: TwwDBEdit;
    laQty: TLabel;
    laAmt: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    laCompleteDate: TLabel;
    dedCompleteDate: TwwDBEdit;
    laCompletePct: TLabel;
    dedCompletePct: TwwDBEdit;
    laBudget: TLabel;
    dedBudgetQty: TwwDBEdit;
    dedBudgetAmt: TwwDBEdit;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaFWOCostCat: TwwDBNavigator;
    dnaFWOCostFirst: TwwNavButton;
    dnaFWOCostPrior: TwwNavButton;
    dnaFWOCostNext: TwwNavButton;
    dnaFWOCostLast: TwwNavButton;
    dnaFWOCostInsert: TwwNavButton;
    dnaFWOCostDelete: TwwNavButton;
    dnaFWOCostPost: TwwNavButton;
    dnaFWOCostCancel: TwwNavButton;
    quJobCostFile: TwwQuery;
    quJobCostFileJOB_COST_CAT: TStringField;
    quJobCostFileDESCRIPTION: TStringField;
    quJobCostFileJOB_COST_TYPE: TStringField;
    quJobCostFileJOB_COST_CAT_UNIT: TStringField;
    quJobCostFileREG_RATE: TBCDField;
    quJobCostFilePREM_RATE: TBCDField;
    TestPrg: TTestPrg;
    dbdtpFirstDate: TwwDBDateTimePicker;
    dbdtpLastDate: TwwDBDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbluJobCostCatChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFWOCstDt: TfmFWOCstDt;

implementation

uses JCDatadm, JCMain;
{$R *.DFM}

procedure TfmFWOCstDt.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  TestPrg.TestProgram('JC', wCompanyID, wUserID, wActiveSecurity);
  if not laJobNo.Enabled then
  begin
    laJobNo.Enabled := true;
    with dmJCData do
      with quFWOCostCat do
      begin
        RequestLive := false;
        CachedUpdates := false;
      end;
  end;
  dedFWONo.MaxLength := gFWOLen;
  with quJobCostFile do
    if not Active then
      Open;
end;

procedure TfmFWOCstDt.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFWOCstDt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quJobCostFile do
    if Active then
      Close;
end;

procedure TfmFWOCstDt.dbluJobCostCatChange(Sender: TObject);
begin
  with dmJCData do
    with quFWOCostCat do
      if ((not quJobCostFile.IsEmpty) and
         (quFWOCostCat.State = dsInsert)) then
        with quJobCostFile do
        begin
          quFWOCostCatJOB_COST_CAT_UNIT.Value :=
            quJobCostFileJOB_COST_CAT_UNIT.Value;
          quFWOCostCatREG_RATE.Value := quJobCostFileREG_RATE.Value;
          quFWOCostCatPREM_RATE.Value := quJobCostFilePREM_RATE.Value;
        end;
end;

end.
