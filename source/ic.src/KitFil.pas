unit KitFil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Grids, Wwdbigrd, Wwdbgrid, DBCtrls, Buttons, ExtCtrls, StdCtrls;

type
  TfmKitFil = class(TForm)
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
    GroupBox1: TGroupBox;
    dgrWareHouse: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgrWareHouseDblClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmKitFil: TfmKitFil;

implementation
uses IcData, KitDetail;
{$R *.DFM}

procedure TfmKitFil.FormCreate(Sender: TObject);
begin
  with dmICData do
  begin
    with quKitFil do
      if not Active then
        Open;
  end;
end;

procedure TfmKitFil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmICData do
  begin
    with quKitFil do
      if Active then
        Close;
  end;
end;

procedure TfmKitFil.dgrWareHouseDblClick(Sender: TObject);
begin
  Application.CreateForm(TfmKitDetail,fmKitDetail);
  try
    fmKitDetail.ShowModal;
  finally
    fmKitDetail.Release;
  end;
end;

procedure TfmKitFil.sbExitClick(Sender: TObject);
begin
  Close;
end;

end.
