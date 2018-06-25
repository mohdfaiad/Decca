unit JOB_C_F;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,DB,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Menus, wwSpeedButton, wwDBNavigator,
  Buttons, ExtCtrls;

type
  TfmJob_cost_file = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    dnaJob_cost_file: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    mmJob_cost_file: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    printSetup: TPrinterSetupDialog;
    StatusBar1: TStatusBar;
    dbgJob_cost_file: TwwDBGrid;
    sbPrintscreen: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mmExitClick(Sender: TObject);
    procedure mmPrintsetupClick(Sender: TObject);
    procedure dbgJob_cost_fileColExit(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJob_cost_file: TfmJob_cost_file;

implementation
  USES JCdatadm,JCmain;
{$R *.DFM}

procedure TfmJob_cost_file.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
//  Funcs[1] := 'All';
  //=====================
//  fmJCmain.TestProgram( Funcs );
  with dmJCdata.quJob_cost_file do
  if not Active then
    Open;
end;

procedure TfmJob_cost_file.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmJCdata.quJob_cost_file do
  begin
    if Active then
      Close;
    Open;
  end;
end;

procedure TfmJob_cost_file.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJob_cost_file.mmPrintsetupClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmJob_cost_file.dbgJob_cost_fileColExit(Sender: TObject);
begin
  with dmJCdata do
  begin
    if ((quJob_cost_file.State = dsedit)
      or ( quJob_cost_file.State = dsinsert)) then
    begin
      if dbgJob_cost_file.SelectedField.FieldName = 'JOB_COST_CAT' then
        quJob_cost_fileJOB_COST_CAT.AsString
          :=UpperCase(quJob_cost_fileJOB_COST_CAT.AsString);

      if dbgJob_cost_file.SelectedField.FieldName = 'JOB_COST_TYPE' then
        quJob_cost_fileJOB_COST_TYPE.AsString
          :=UpperCase(quJob_cost_fileJOB_COST_TYPE.AsString);

      if dbgJob_cost_file.SelectedField.FieldName = 'JOB_COST_CAT_UNIT' then
        quJob_cost_fileJOB_COST_CAT_UNIT.AsString
          :=UpperCase(quJob_cost_fileJOB_COST_CAT_UNIT.AsString);
    end;
  end;
end;

procedure TfmJob_cost_file.sbPrintscreenClick(Sender: TObject);
begin
  print;
end;

end.
