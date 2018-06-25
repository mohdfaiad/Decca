unit CostFile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,DB,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Menus, wwSpeedButton, wwDBNavigator,
  Buttons, ExtCtrls, StdCtrls, wwdblook, DBTables, Wwquery;

type
  TfmCostFile = class(TForm)
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
    ps_PrinterSetup: TPrinterSetupDialog;
    StatusBar1: TStatusBar;
    dgrJob_cost_file: TwwDBGrid;
    sbPrintscreen: TSpeedButton;
    lucbCostCatType: TwwDBLookupCombo;
    dlcProdCat: TwwDBLookupCombo;
    quProdCat: TwwQuery;
    quProdCatDESCRIPTION: TStringField;
    quProdCatPRODUCTION_CAT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure mmPrintsetupClick(Sender: TObject);
    procedure dgrJob_cost_fileColExit(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCostFile: TfmCostFile;

implementation
  USES JCdatadm,JCmain;
{$R *.DFM}

procedure TfmCostFile.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  with quProdCat do
    if not Active  then
      Open;
  //=====================
//  Funcs[1] := 'All';
  //=====================
//  fmJCmain.TestProgram( Funcs );
end;

procedure TfmCostFile.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCostFile.mmPrintsetupClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmCostFile.dgrJob_cost_fileColExit(Sender: TObject);
begin
  with dmJCdata do
  begin
    if ((quJob_cost_file.State = dsedit)
      or ( quJob_cost_file.State = dsinsert)) then
    begin
      if dgrJob_cost_file.SelectedField.FieldName = 'JOB_COST_CAT' then
        quJob_cost_fileJOB_COST_CAT.AsString :=
          UpperCase(quJob_cost_fileJOB_COST_CAT.AsString);

      if dgrJob_cost_file.SelectedField.FieldName = 'JOB_COST_TYPE' then
        quJob_cost_fileJOB_COST_TYPE.AsString :=
          UpperCase(quJob_cost_fileJOB_COST_TYPE.AsString);

{      if dgrJob_cost_file.SelectedField.FieldName = 'JOB_COST_CAT_UNIT' then
        quJob_cost_fileJOB_COST_CAT_UNIT.AsString :=
          UpperCase(quJob_cost_fileJOB_COST_CAT_UNIT.AsString);}
    end;
  end;
end;

procedure TfmCostFile.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmCostFile.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with dmJCdata do
  begin
    with quJob_cost_file do
      if Active then
        Close;
    with quJob_cost_type do
      if Active then
        Close;
  end;
end;

procedure TfmCostFile.FormShow(Sender: TObject);
begin
  with dmJCdata do
  begin
    with quJob_cost_file do
      if not Active then
        Open;
    with quJob_cost_type do
      if not Active then
        Open;
  end;
end;

procedure TfmCostFile.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   with quProdCat do
    if  Active  then
      Close;
end;

end.
