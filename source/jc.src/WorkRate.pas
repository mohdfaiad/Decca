unit WorkRate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, wwdblook, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls;

type
  TfmWorkRate = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaWorkRT: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    StatusBar1: TStatusBar;
    mmWorkRT: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    printSetup: TPrinterSetupDialog;
    dbgWorkR: TwwDBGrid;
    procedure sbPrintscreenClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmWorkRate: TfmWorkRate;

implementation
  uses JCdatadm,JCmain; 
{$R *.DFM}

procedure TfmWorkRate.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmWorkRate.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmWorkRate.sbExitClick(Sender: TObject);
begin
  with dmJCdata.quWorkGroup do
  begin
    if Active then
      Close;
  end;
  Close;
end;

procedure TfmWorkRate.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;

end;

procedure TfmWorkRate.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with dmJCdata do
  begin
    with quWorkGroup do
    begin
      if Active then
        Close;
      Open;
    end;  
  end;
end;

procedure TfmWorkRate.FormShow(Sender: TObject);
begin
  with dmJCdata do
  begin
    with quWorkGroup do
      if not Active then
        Open;
  end;
end;

end.
