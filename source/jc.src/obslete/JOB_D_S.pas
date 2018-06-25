unit JOB_D_S;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Menus, ComCtrls, wwSpeedButton, wwDBNavigator,
  Buttons, ExtCtrls, StdCtrls,db, wwdblook;

type
  TfmDailySmy = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaJOB_daily_summary: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    StatusBar1: TStatusBar;
    mmJOB_DAILY_SUMMARY: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    printSetup: TPrinterSetupDialog;
    dgrJOB_DAILY_SMRY: TwwDBGrid;
    dlcbJob_cost_cat: TwwDBLookupCombo;
    dlcbJob_no_1: TwwDBLookupCombo;
    procedure mmExitClick(Sender: TObject);
    procedure mmPrintsetupClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dgrJOB_DAILY_SMRYCheckValue(Sender: TObject;
      PassesPictureTest: Boolean);
    procedure dlcbJob_no_1CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDailySmy: TfmDailySmy;

implementation
  uses jcdatadm,JCmain;
{$R *.DFM}

procedure TfmDailySmy.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDailySmy.mmPrintsetupClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmDailySmy.sbPrintscreenClick(Sender: TObject);
begin
  print;
end;

procedure TfmDailySmy.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
//  Funcs[1] := 'All';
  //=====================
//  fmJCmain.TestProgram( Funcs );
  with dmJCdata do
  begin
    with quJOB_DAILY_SUMMARY do
    begin
      if not Active then
        Open;
    end;

    with quJob_cost_type do
    begin
      if Not Active then
        Open;
    end;

    with quJob_cost_file_VIEW do
    begin
      if Not Active then
        Open;
    end;

    with quJOB_FWO_VIEW do
    begin
      if Not Active then
        Open;
    end;
    
  end;
end;

procedure TfmDailySmy.dgrJOB_DAILY_SMRYCheckValue(Sender: TObject;
  PassesPictureTest: Boolean);
begin
  with dmJCdata do
  begin
    if quJCcontrolUSE_JOB_NO_2.AsString = 'N' then
      dgrJOB_DAILY_SMRY.Columns[1].ReadOnly:= true
    else
      dgrJOB_DAILY_SMRY.Columns[1].ReadOnly := false;
  end;
end;

procedure TfmDailySmy.dlcbJob_no_1CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  with dmJCdata do
  begin
    if not quJOB_DAILY_SUMMARY.IsEmpty then
    begin
      if ((quJOB_DAILY_SUMMARY.State = dsedit)
        or (quJOB_DAILY_SUMMARY.State = dsinsert)) then
      begin
        quJOB_DAILY_SUMMARYJOB_NO_2.AsString
          := quJOB_FWO_VIEWJOB_NO_2.AsString;
        quJOB_DAILY_SUMMARYSUB_JOB_NO.AsString
          := quJOB_FWO_VIEWSUB_JOB_NO.AsString;
        quJOB_DAILY_SUMMARYFWO_NO.AsString
          := quJOB_FWO_VIEWFWO_NO.AsString;
      end;
    end;    
  end;
end;

end.
