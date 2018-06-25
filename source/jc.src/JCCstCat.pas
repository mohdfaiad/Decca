unit JCCstCat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, wwdbedit, Mask, Wwdbspin, StdCtrls, DBCtrls,
  wwdbdatetimepicker, wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, db,wwdblook, TestPrg;

type
  TfmJCCstCat = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    mmJOB_COST_CAT: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    printSetup: TPrinterSetupDialog;
    StatusBar1: TStatusBar;
    dnaJOB_COST_CAT: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    sbPrintscreen: TSpeedButton;
    paViewJob_no: TPanel;
    dedJobNo1: TwwDBEdit;
    laJobNo1: TLabel;
    paEdit: TPanel;
    laSubJobNo: TLabel;
    dedSubJobNo: TwwDBEdit;
    laCostCat: TLabel;
    laUnit: TLabel;
    laREG_RATE: TLabel;
    laPREM_RATE: TLabel;
    dlcbJobCostCat: TwwDBLookupCombo;
    dedJobCostCatUnit: TwwDBEdit;
    dedPremRate: TwwDBEdit;
    dedJobDesc: TwwDBEdit;
    dedREG_RATE: TwwDBEdit;
    dedSUBdescr: TwwDBEdit;
    beShape: TBevel;
    laBUDGET_QTY: TLabel;
    laJOB_REG_QTY: TLabel;
    laJOB_PREM_AMT: TLabel;
    laQTY: TLabel;
    laAmt: TLabel;
    dedBudgetQty: TwwDBEdit;
    dedBudgetAmt: TwwDBEdit;
    dedJobRegQty: TwwDBEdit;
    dedJobRegAmt: TwwDBEdit;
    dedJobPremQty: TwwDBEdit;
    dedJobPremAmt: TwwDBEdit;
    Label2: TLabel;
    dedDraftBudgetQty: TwwDBEdit;
    dedDraftBudgetAmt: TwwDBEdit;
    TestPrg: TTestPrg;
    procedure mmPrintsetupClick(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dlcbJobCostCatCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJCCstCat: TfmJCCstCat;

implementation
  uses jcdatadm,
     JCmain;
{$R *.DFM}

procedure TfmJCCstCat.mmPrintsetupClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmJCCstCat.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJCCstCat.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmJCCstCat.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
{=====================
  Funcs[1] := 'All';
  Funcs[2] := 'dedDraftBudgetAmt|dedBudgetAmt|dedJobRegAmt|dedJobPremAmt|laAmt';
 =====================
fmJCmain.TestProgram( Funcs );}

  TestPrg.TestProgram('JC', wCompanyID, wUserID, wActiveSecurity);

  if not dedDraftBudgetAmt.Enabled then
    dedDraftBudgetAmt.Visible := False;
  if not dedBudgetAmt.Enabled then
    dedBudgetAmt.Visible := False;
  if not dedJobRegAmt.Enabled then
    dedJobRegAmt.Visible := False;
  if not dedJobPremAmt.Enabled then
    dedJobPremAmt.Visible := False;
  if not laAmt.Enabled then
    laAmt.Visible := False;
end;

procedure TfmJCCstCat.dlcbJobCostCatCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  with dmJCdata do
  begin
    with quJobCostCat do
    begin
      if ((State = dsedit) or (State = dsinsert)) then
      begin
        quJobCostCatJOB_COST_CAT_UNIT.AsString :=
          quJob_cost_file_VIEWJOB_COST_CAT_UNIT.AsString;
        quJobCostCatREG_RATE.AsString :=
          quJob_cost_file_VIEWREG_RATE.AsString;
        quJobCostCatPREM_RATE.AsString :=
          quJob_cost_file_VIEWPREM_RATE.AsString;
      end;
    end;
  end;
end;

procedure TfmJCCstCat.FormShow(Sender: TObject);
begin
  with dmJCdata do
  begin
    with quJob_cost_file_VIEW  do
      if not Active then
        Open;
    with quSel1SubJob do
      if Not Active then
        Open;
    with quJob_cost_type do
    begin
      if Not  Active then
        Open;
    end;
  end;
end;

procedure TfmJCCstCat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCdata do
  begin
    with quJob_cost_file_VIEW do
    begin
      if not Active then
        Open;
    end;
  end;
end;

end.
