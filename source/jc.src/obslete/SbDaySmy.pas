unit SbDaySmy;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Menus, ComCtrls, wwSpeedButton, wwDBNavigator,
  Buttons, ExtCtrls, StdCtrls,db, wwdblook, Mask, wwdbedit;

type
  TfmSbDaySmy = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    mmSubJob: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    printSetup: TPrinterSetupDialog;
    dgrSbDaySum: TwwDBGrid;
    paSelect: TPanel;
    laJob_no: TLabel;
    laSubJobNo: TLabel;
    dedJOB_NO: TwwDBEdit;
    dedSubJobNo: TwwDBEdit;
    laCostCat: TLabel;
    dedCostCat: TwwDBEdit;
    dedDescri: TwwDBEdit;
    dedCatDescri: TwwDBEdit;
    dedSubDescription: TwwDBEdit;
    procedure mmExitClick(Sender: TObject);
    procedure mmPrintsetupClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSbDaySmy: TfmSbDaySmy;

implementation
  uses jcdatadm,
       FWOdtDm, 
       JCmain;
{$R *.DFM}

procedure TfmSbDaySmy.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSbDaySmy.mmPrintsetupClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmSbDaySmy.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmSbDaySmy.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
//  Funcs[1] := 'All';
  //=====================
//  fmJCmain.TestProgram( Funcs );
  with dmJCFWO do
  begin
    with quSbDayCostCatDescr do
      if Not Active then
        Open;
    with quSbDaySumSubDescri do
      if Not Active then
        Open;
  end;
end;

procedure TfmSbDaySmy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCFWO do
  begin
    with quSbDayCostCatDescr do
      if Active then
        Close;
    with quSbDaySumSubDescri do
      if Active then
        Close;
  end;
end;

end.
