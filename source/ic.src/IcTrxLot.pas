unit IcTrxLot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Menus, StdCtrls,
  Mask, wwdblook, Db, Wwdatsrc, DBTables, Wwquery;

type
  TfmIcTrxLot = class(TForm)
    mdlComment: TwwMemoDialog;
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
    paDept: TPanel;
    SpeedButton4: TSpeedButton;
    sbExit: TSpeedButton;
    sbPrint: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    dnaDept: TDBNavigator;
    Panel1: TPanel;
    dedTrxDocNo: TDBEdit;
    dedTrxLineNO: TDBEdit;
    dedItemNo: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dedItemDesc: TDBEdit;
    quSelLotNo: TwwQuery;
    quSelLotNoLOT_NO: TStringField;
    quSelLotNoEXPIRE_DATE: TDateTimeField;
    quSelLotNoLST_USE_DATE: TDateTimeField;
    quSelLotNoRECV_DATE: TDateTimeField;
    quSelLotNoITEM_NO: TStringField;
    quSelLotNoWHS_CODE: TStringField;
    dsSelLotNo: TwwDataSource;
    dlcLotNo: TwwDBLookupCombo;
    quSelLotNoRECV_QTY: TFloatField;
    quSelLotNoQTY_ON_HAND: TFloatField;
    quSelLotNoQTY_RESERVED: TFloatField;
    quSelLotNoLOT_COST: TFloatField;
    quSelLotNoRPLC_COST: TFloatField;
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
  fmIcTrxLot: TfmIcTrxLot;

implementation
uses IcData;
{$R *.DFM}

procedure TfmIcTrxLot.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmIcTrxLot.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TfmIcTrxLot.FormCreate(Sender: TObject);
begin
  with quSelLotNo do
  begin
    if not Active then
      Open;
  end;
end;

procedure TfmIcTrxLot.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quSelLotNo do
  begin
    if  Active then
      Close;
  end;
end;

end.
