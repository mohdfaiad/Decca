unit ItemSubCat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Grids, Wwdbigrd, Wwdbgrid, DBCtrls, Buttons, ExtCtrls;

type
  TfmItemSub = class(TForm)
    paDept: TPanel;
    SpeedButton4: TSpeedButton;
    sbExit: TSpeedButton;
    sbPrint: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    dnaDept: TDBNavigator;
    dgrWareHouse: TwwDBGrid;
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
    procedure MenuItem4Click(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmItemSub: TfmItemSub;

implementation
uses IcData;
{$R *.DFM}

procedure TfmItemSub.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TfmItemSub.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmItemSub.FormCreate(Sender: TObject);
begin
  with dmICData.quItemSubcatFil do
  begin
    if not Active then
      Open;
  end;
end;

procedure TfmItemSub.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmICData.quItemSubcatFil do
  begin
    if Active then
      Close;
  end;
end;

end.
