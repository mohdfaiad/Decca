unit Location;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Menus, DBCtrls, Buttons, ExtCtrls;

type
  TfmLocation = class(TForm)
    paDept: TPanel;
    SpeedButton4: TSpeedButton;
    sbExit: TSpeedButton;
    sbPrint: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    dnaDept: TDBNavigator;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    ps_PrintSetup: TPrinterSetupDialog;
    dgrWareHouse: TwwDBGrid;
    mdlComment: TwwMemoDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbExitClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure dgrWareHouseTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLocation: TfmLocation;

implementation
uses IcData;
{$R *.DFM}

procedure TfmLocation.FormCreate(Sender: TObject);
begin
  with dmICData.quLocation do
  begin
    if not Active then
      Open;
  end;
end;

procedure TfmLocation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmICData.quLocation do
  begin
    if Active then
      Close;
  end;
end;

procedure TfmLocation.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLocation.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TfmLocation.dgrWareHouseTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  if AFieldName = 'COMMENT' then
  begin
    mdlComment.Execute;
  end;
end;

end.
