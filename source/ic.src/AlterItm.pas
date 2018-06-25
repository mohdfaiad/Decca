unit AlterItm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Menus, DBCtrls, Buttons, ExtCtrls, StdCtrls,
  Mask;

type
  TfmAlterItm = class(TForm)
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
    dgrWareHouse: TwwDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    dedItemNo: TDBEdit;
    dedItemDesc: TDBEdit;
    Label2: TLabel;
    mdlComment: TwwMemoDialog;
    procedure MenuItem4Click(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgrWareHouseDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAlterItm: TfmAlterItm;

implementation
uses IcData;
{$R *.DFM}

procedure TfmAlterItm.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TfmAlterItm.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAlterItm.FormCreate(Sender: TObject);
begin
  with  dmICData.quAlter  do
  begin
    if not Active then
      Open;
  end;
end;

procedure TfmAlterItm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with  dmICData.quProfitCtr  do
  begin
    if Active then
      Close;
  end;
end;

procedure TfmAlterItm.dgrWareHouseDblClick(Sender: TObject);
begin
  mdlComment.Execute;
end;

end.
