unit CostCat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, wwdbedit, Mask, Wwdbspin, StdCtrls, DBCtrls,
  wwdbdatetimepicker, wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, db,wwdblook;

type
  TfmCostCat = class(TForm)
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
    dgrJOB_COST_CAT: TwwDBGrid;
    mmJOB_DAILY_SMRY: TMenuItem;
    mmSummary: TMenuItem;
    sbPrintscreen: TSpeedButton;
    dlcbJob_cost_cat: TwwDBLookupCombo;
    paViewJob_no: TPanel;
    dedJOB_NO_1: TwwDBEdit;
    dedJOB_NO_2: TwwDBEdit;
    laJOB_NO_1: TLabel;
    laJOB_NO_2: TLabel;
    procedure mmPrintsetupClick(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure mmSummaryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dgrJOB_COST_CATCheckValue(Sender: TObject;
      PassesPictureTest: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dlcbJob_cost_catCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCostCat: TfmCostCat;

implementation
  uses jcdatadm, DailySmy, JCmain;
{$R *.DFM}

procedure TfmCostCat.mmPrintsetupClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmCostCat.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCostCat.sbPrintscreenClick(Sender: TObject);
begin
  print;
end;

procedure TfmCostCat.mmSummaryClick(Sender: TObject);
begin
  Application.CreateForm(TfmDailySmy,fmDailySmy);
  try
    fmDailySmy.ShowModal;
  finally
    fmDailySmy.Release;
  end;
end;

procedure TfmCostCat.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
//  Funcs[1] := 'All';
  //=====================
//  fmJCmain.TestProgram( Funcs );
  with dmJCdata do
  begin
    with quJCcontrol do
    begin
      if not Active then
        Open;
    end;

    with quJob_cost_type do
    begin
      if Not  Active then
        Open;
    end;

    with quJob_cost_file_VIEW do
    begin
      if Not Active then
        Open;
    end;

    with qusub_job_VIEW do
    begin
      if Not Active then
        Open;
    end;

    with quJOB_COST_CAT do
    begin
      if not Active then
        Open;
    end;
  end;
end;

procedure TfmCostCat.dgrJOB_COST_CATCheckValue(Sender: TObject;
  PassesPictureTest: Boolean);
begin
  with fmCostCat, dmJCdata do
  begin

//Use retainage payable
    if quJCcontrolUSE_RETAIN_AP.AsString = 'Y' then
       dgrJOB_COST_CAT.Columns[13].ReadOnly := false
    else
       dgrJOB_COST_CAT.Columns[13].ReadOnly := true;

//Use retainage receivable
    if quJCcontrolUSE_RETAIN_AR.AsString = 'Y' then
       dgrJOB_COST_CAT.Columns[14].ReadOnly := false
    else
       dgrJOB_COST_CAT.Columns[14].ReadOnly := true;

  end;
end;

procedure TfmCostCat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmJCdata do
  begin
    with quJob_cost_file_VIEW do
    begin
      if Active then
        Open;
    end;  
  end;
end;

procedure TfmCostCat.dlcbJob_cost_catCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  with dmJCdata do
  begin
    if ((quJob_cost_cat.State = dsedit)
      or (quJob_cost_cat.State = dsinsert)) then
    begin
      quJOB_COST_CATJOB_COST_CAT_UNIT.AsString
        := quJob_cost_file_VIEWJOB_COST_CAT_UNIT.AsString;
    end;    
  end;
end;

end.
