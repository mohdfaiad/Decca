unit JOB_C_T;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, ComCtrls, wwSpeedButton, wwDBNavigator, Grids,
  Wwdbigrd, Wwdbgrid,db, StdCtrls, wwdblook;

type
  TfmCostType = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    mmJob_cost_type: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    printSetup: TPrinterSetupDialog;
    dnaJob_cost_type: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    StatusBar1: TStatusBar;
    gbJob_cost_file: TGroupBox;
    dbgJob_cost_type: TwwDBGrid;
    dlcbCost_cat_system: TwwDBLookupCombo;
    sbPrintscreen: TSpeedButton;
    procedure mmExitClick(Sender: TObject);
    procedure mmPrintsetupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgJob_cost_typeDblClick(Sender: TObject);
    procedure dbgJob_cost_typeColEnter(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCostType: TfmCostType;

implementation
  uses JCdatadm,JOB_C_F,JCmain;
{$R *.DFM}

procedure TfmCostType.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCostType.mmPrintsetupClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmCostType.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
//  Funcs[1] := 'All';
  //=====================
//  fmJCmain.TestProgram( Funcs );
  with dmJCdata do
  begin
    with quJob_cost_type do
    begin
      if NOT Active then
        Open;
    end;
    with quProg_desc do
    begin
      if NOT Active then
        Open;
    end;
  end;
end;

procedure TfmCostType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmJCdata do
  begin
    with quJob_cost_type do
    begin
      if Active then
        Close;
      Open;  
    end;
  end;
end;

procedure TfmCostType.dbgJob_cost_typeDblClick(Sender: TObject);
begin
  Application.CreateForm(TfmJob_cost_file,fmJob_cost_file);
  Try
    fmJob_cost_file.ShowModal;
  finally
    fmJob_cost_file.Release;
  end;
end;

procedure TfmCostType.dbgJob_cost_typeColEnter(Sender: TObject);
begin
  with dmJCdata do
  begin
    if ((quJob_cost_type.State = dsedit)
      or (quJob_cost_type.State = dsinsert)) then
    begin
      if dbgJob_cost_type.SelectedField.FieldName = 'JOB_COST_CAT_TYPE' then
        quJob_cost_typeJOB_COST_CAT_TYPE.AsString
        := UpperCase(quJob_cost_typeJOB_COST_CAT_TYPE.AsString);
      if dbgJob_cost_type.SelectedField.FieldName = 'COST_CAT_SYSTEM' then
        quJob_cost_typeCOST_CAT_SYSTEM.AsString
          := UpperCase(quJob_cost_typeCOST_CAT_SYSTEM.AsString);
    end;
  end;
end;

procedure TfmCostType.sbPrintscreenClick(Sender: TObject);
begin
  print;
end;

end.
