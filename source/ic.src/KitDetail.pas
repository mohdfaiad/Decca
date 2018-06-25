unit KitDetail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Buttons, ExtCtrls, Menus, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  Mask, Db, Wwdatsrc, DBTables, Wwquery, wwdblook;

type
  TfmKitDetail = class(TForm)
    dgrWareHouse: TwwDBGrid;
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
    paDept: TPanel;
    SpeedButton4: TSpeedButton;
    sbExit: TSpeedButton;
    sbPrint: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    dnaDept: TDBNavigator;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dedItemDesc: TDBEdit;
    dmeComment: TDBMemo;
    dedKitQty: TDBEdit;
    quKitItem: TwwQuery;
    dsKitItem: TwwDataSource;
    quKitItemITEM_NO: TStringField;
    quKitItemDESCRIPTION: TStringField;
    quKitItemITEM_PROD_CAT: TStringField;
    quKitItemITEM_SUBCAT: TStringField;
    quKitItemITEM_STOCK_UNIT: TStringField;
    dlcItemNo: TwwDBLookupCombo;
    dlcCompItem: TwwDBLookupCombo;
    quCompItem: TwwQuery;
    dsCompItem: TwwDataSource;
    quCompItemITEM_NO: TStringField;
    quCompItemDESCRIPTION: TStringField;
    quCompItemITEM_PROD_CAT: TStringField;
    quCompItemITEM_SUBCAT: TStringField;
    quCompItemITEM_STOCK_UNIT: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmKitDetail: TfmKitDetail;

implementation
uses IcData;
{$R *.DFM}

procedure TfmKitDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmICData do
  begin
    with quKitDetail do
    begin
      if Active then
        Close;
    end;
  end;
  with quKitItem do
    if Active then
      Close;
  with quCompItem do
    if Active then
      Close;
end;

procedure TfmKitDetail.FormCreate(Sender: TObject);
begin
  with dmICData do
  begin
    with quKitDetail do
    begin
      if not Active then
        Open;
    end;
  end;
  with quKitItem do
    if not Active then
      Open;
  with quCompItem do
    if not Active then
      Open;
end;

procedure TfmKitDetail.sbExitClick(Sender: TObject);
begin
  Close;
end;

end.
