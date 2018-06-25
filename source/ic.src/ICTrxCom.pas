unit ICTrxCom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Wwdbgrid, Grids, Wwdbigrd, StdCtrls, Mask, DBCtrls, Buttons,
  ExtCtrls, wwdblook, Db, Wwdatsrc, DBTables, Wwquery;

type
  TfmICTrxCom = class(TForm)
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
    dedTrxDocNo: TDBEdit;
    dedTrxLineNo: TDBEdit;
    dedItemNo: TDBEdit;
    dedItemDesc: TDBEdit;
    dgrTrxComp: TwwDBGrid;
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
    quSelLotNo: TwwQuery;
    quSelLotNoITEM_NO: TStringField;
    quSelLotNoWHS_CODE: TStringField;
    quSelLotNoLOT_NO: TStringField;
    quSelLotNoRECV_DATE: TDateTimeField;
    quSelLotNoLST_USE_DATE: TDateTimeField;
    quSelLotNoEXPIRE_DATE: TDateTimeField;
    dsSelLotNo: TwwDataSource;
    dlcLotNo: TwwDBLookupCombo;
    dlcCompItemNo: TwwDBLookupCombo;
    dsSelItemNo: TwwDataSource;
    quSelItemNo: TwwQuery;
    quSelItemNoITEM_NO: TStringField;
    quSelItemNoItemDesc: TStringField;
    dlcWhsCode: TwwDBLookupCombo;
    dlcLocNo: TwwDBLookupCombo;
    quItemLocCode: TwwQuery;
    quItemWhsCode: TwwQuery;
    quItemWhsCodeWHS_CODE: TStringField;
    quItemWhsCodeWHS_DESC: TStringField;
    quItemWhsCodeITEM_NO: TStringField;
    dsItemLocCode: TwwDataSource;
    dsItemWhsCode: TwwDataSource;
    quSelLotNoRECV_QTY: TFloatField;
    quSelLotNoQTY_ON_HAND: TFloatField;
    quSelLotNoQTY_RESERVED: TFloatField;
    quSelLotNoLOT_COST: TFloatField;
    quSelLotNoRPLC_COST: TFloatField;
    quItemLocCodeLOC_CODE: TStringField;
    quSelItemNoQTY_ON_HAND: TFloatField;
    procedure MenuItem4Click(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgrTrxCompColEnter(Sender: TObject);
    procedure dlcLotNoEnter(Sender: TObject);
    procedure dlcWhsCodeEnter(Sender: TObject);
    procedure dlcLocNoEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmICTrxCom: TfmICTrxCom;

implementation
uses ICdata;
{$R *.DFM}

procedure TfmICTrxCom.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TfmICTrxCom.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmICTrxCom.FormCreate(Sender: TObject);
begin
  with quSelItemNo do
  begin
    if not Active then
      Open;
  end;
  with quItemWhsCode do
    if not Active then
      Open;
  with quItemLocCode do
    if not Active then
      Open;
end;

procedure TfmICTrxCom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quSelItemNo do
  begin
    if Active then
      Close;
  end;
  with quSelLotNo do
  begin
    if Active then
      Close;
  end;
end;

procedure TfmICTrxCom.dgrTrxCompColEnter(Sender: TObject);
begin
 // ShowMessage(dgrTrxComp.SelectedField.DisplayName);
  
end;

procedure TfmICTrxCom.dlcLotNoEnter(Sender: TObject);
begin
  with quSelLotNo do
  begin
    if Active then
      Close;
    ParamByName('Item_No').AsString :=
      dmICData.quIcTrxComp.FieldByName('Comp_Item_no').AsString;
    ParamByName('whs_Code').AsString :=
      dmICData.quIcTrxComp.FieldByName('Whs_code').AsString;
    Open;
  end;
end;

procedure TfmICTrxCom.dlcWhsCodeEnter(Sender: TObject);
begin
  with quItemWhsCode do
  begin
    if Active then
      Close;
    ParamByName('Item_No').AsString :=
      dmICData.quIcTrxComp.FieldByName('Comp_Item_No').AsString ;
    Open;
  end;
end;

procedure TfmICTrxCom.dlcLocNoEnter(Sender: TObject);
begin
  with quItemLocCode do
  begin
    if Active then
      Close;
    ParamByName('Item_No').AsString :=
      dmICData.quIcTrxComp.FieldByName('Comp_Item_No').AsString ;
    ParamByName('Whs_Code').AsString :=
      dmICData.quIcTrxComp.FieldByName('whs_code').AsString ;
    Open;
  end;
end;

end.
