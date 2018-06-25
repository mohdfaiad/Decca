unit ItemCatFil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid;

type
  TfmItemCatFil = class(TForm)
    dgrWareHouse: TwwDBGrid;
    paDept: TPanel;
    SpeedButton4: TSpeedButton;
    sbExit: TSpeedButton;
    sbPrint: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    dnaDept: TDBNavigator;
    ps_PrintSetup: TPrinterSetupDialog;
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
    procedure sbExitClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmItemCatFil: TfmItemCatFil;

implementation
uses Icdata;
{$R *.DFM}

procedure TfmItemCatFil.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmItemCatFil.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TfmItemCatFil.FormCreate(Sender: TObject);
begin
  with dmICData.quItemCatFil do
  begin
    if not Active then
      Open;
  end;
end;

procedure TfmItemCatFil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmICData.quItemCatFil do
  begin
    if Active then
      Close;
  end;
end;

end.
