unit ItemFil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Buttons, ExtCtrls, Menus, StdCtrls, DBCtrls, wwdblook, Mask,
  wwdbdatetimepicker, Grids, Wwdbigrd, Wwdbgrid, Db;

type
  TfmItemFil = class(TForm)
    pcItemFil: TPageControl;
    tsItemFil: TTabSheet;
    tsItemDef: TTabSheet;
    mmICMain: TMainMenu;
    N1: TMenuItem;
    mmPrtSetup: TMenuItem;
    N5: TMenuItem;
    mmExit: TMenuItem;
    N2: TMenuItem;
    mmProfitCtr: TMenuItem;
    N7: TMenuItem;
    mmDept: TMenuItem;
    mmOccuption: TMenuItem;
    N3: TMenuItem;
    mmShift: TMenuItem;
    mmPayCode: TMenuItem;
    N12: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    mmControl: TMenuItem;
    U1: TMenuItem;
    t1: TMenuItem;
    d1: TMenuItem;
    N14: TMenuItem;
    H2: TMenuItem;
    ps_PrintSetup: TPrinterSetupDialog;
    paWorker: TPanel;
    sbExit: TSpeedButton;
    sbHelp: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    sbItemFil: TStatusBar;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBText1: TDBText;
    dedDefFld01: TDBEdit;
    DBText2: TDBText;
    dedDefFld02: TDBEdit;
    DBText3: TDBText;
    dedDefFld03: TDBEdit;
    DBText4: TDBText;
    dedDefFld04: TDBEdit;
    dedDefFld05: TDBEdit;
    DBText5: TDBText;
    DBText6: TDBText;
    dedDefFld06: TDBEdit;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    dedDefFld07: TDBEdit;
    dedDefFld08: TDBEdit;
    dedDefFld09: TDBEdit;
    dedDefFld10: TDBEdit;
    tsItemAc: TTabSheet;
    dedItemNo: TDBEdit;
    dedItemDesc: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    paPhoto: TPanel;
    dimPhoto: TDBImage;
    laPhoto: TLabel;
    dlcItmProdCat: TwwDBLookupCombo;
    dlcItmSubCat: TwwDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    drgItemType: TDBRadioGroup;
    drgKitType: TDBRadioGroup;
    Label23: TLabel;
    dmeComent: TDBMemo;
    gbDim: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dedItemLength: TDBEdit;
    dedItemWidth: TDBEdit;
    dedItemHeight: TDBEdit;
    dedDimensionUnit: TDBEdit;
    gbUnit: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    dedAltUnit1: TDBEdit;
    dedConvFactor1: TDBEdit;
    dedAltUnit2: TDBEdit;
    dedConvFactor2: TDBEdit;
    Panel1: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    dedItemPieces: TDBEdit;
    dedMinQty: TDBEdit;
    dedMaxQty: TDBEdit;
    dedQtyonHand: TDBEdit;
    dedQtyReserved: TDBEdit;
    dnaItemFil: TDBNavigator;
    Bevel3: TBevel;
    OpenDialog2: TOpenDialog;
    tsStockStatus: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    tsLot: TTabSheet;
    gbLot: TGroupBox;
    wwDBGrid3: TwwDBGrid;
    dlcWhsCode: TwwDBLookupCombo;
    dlcLocNo: TwwDBLookupCombo;
    mdlComment: TwwMemoDialog;
    tsAlterItem: TTabSheet;
    dgrWareHouse: TwwDBGrid;
    mdlAlterComment: TwwMemoDialog;
    GroupBox3: TGroupBox;
    Label20: TLabel;
    Label6: TLabel;
    Label22: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    dedInventoryAc: TDBEdit;
    dedLiablityAc: TDBEdit;
    dedSalesAc: TDBEdit;
    dedCrMemoAc: TDBEdit;
    dedDiscountAc: TDBEdit;
    dedExpense: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label19: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    dedStockUnit: TDBEdit;
    Label5: TLabel;
    Label21: TLabel;
    dedJobCostCat: TDBEdit;
    Label14: TLabel;
    dedAvgCost: TDBEdit;
    Label28: TLabel;
    dedRplcCost: TDBEdit;
    dedLastUseDate: TDBEdit;
    Label18: TLabel;
    Label32: TLabel;
    dedLibraryItemNo: TDBEdit;
    dedItemJobNo: TDBEdit;
    dcbBocontrol: TDBCheckBox;
    spFind: TSpeedButton;
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dimPhotoDblClick(Sender: TObject);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure dgrWareHouseDblClick(Sender: TObject);
    procedure dedItemNoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmItemFil: TfmItemFil;

implementation
uses IcData, FindItem;
{$R *.DFM}

procedure TfmItemFil.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmItemFil.FormCreate(Sender: TObject);
begin
  with dmICData do
  begin
    with quItemFil do
    begin
      if not Active then
        Open;
    end;
    with quItemPhoto do
    begin
      if not Active then
        Open;
    end;
    with quICControl do
    begin
      if not Active then
        Open;
    end;
    with quAlterItem do
    begin
      if not Active then
        Open;
    end;
    with quItemCatFil do
    begin
      if not Active then
        Open;
    end;
    with quItemSubcatFil do
    begin
      if not Active then
        Open;
    end;
    with quItemStockStatus do
    begin
      if not Active then
        Open;
    end;
    with quItemStockLoc do
    begin
      if not Active then
        Open;
    end;
    with quItemLotFil do
    begin
      if not Active then
        Open;
    end;
    with quSelUserWhs  do
    begin
      if not Active then
        Open;
    end;
    with quSelLoc  do
    begin
      if not Active then
        Open;
    end;
  end;
end;

procedure TfmItemFil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmICData do
  begin
    with quAlterItem do
    begin
      if Active then
        Close;
    end;
    with quItemFil do
    begin
      if Active then
        Close
    end;
    with quItemPhoto do
    begin
      if Active then
        Close;
    end;
    with quICControl do
    begin
      if Active then
        Close;
    end;
    with quItemCatFil do
    begin
      if Active then
        Close;
    end;
    with quItemSubcatFil do
    begin
      if Active then
        Close;
    end;
    with quItemStockStatus do
    begin
      if Active then
        Close;
    end;
    with quItemStockLoc do
    begin
      if Active then
        Close;
    end;
    with quItemLotFil do
    begin
      if Active then
        Close;
    end;
     with quSelUserWhs  do
    begin
      if Active then
        Close;
    end;
    with quSelLoc  do
    begin
      if Active then
        Close;
    end;
  end;
end;

procedure TfmItemFil.dimPhotoDblClick(Sender: TObject);
begin
  with opendialog2 do
  if execute then
  begin
    With dimPhoto.datasource.dataset do
    Begin
      if RecordCount = 1 then
      begin
        edit;
        dimPhoto.Picture.LoadFromFile(FileName);
        Post;
      end
      else
      begin
        Insert;
        dimPhoto.Picture.LoadFromFile(FileName);
        Post;
      end;
    end
  end;
end;

procedure TfmItemFil.wwDBGrid1DblClick(Sender: TObject);
begin
  mdlComment.Execute;
end;

procedure TfmItemFil.dgrWareHouseDblClick(Sender: TObject);
begin
  mdlAlterComment.Execute;
end;

procedure TfmItemFil.dedItemNoChange(Sender: TObject);
begin
  with dmICData.quItemFil do
    sbItemFil.SimpleText := '材料代號 : ' + FieldByName('Item_No').AsString +
                            '    名稱 : ' + FieldByName('Description').AsString;
  if dmICData.quItemFilITEM_TYPE.AsString = 'L' then
  begin
    tsLot.TabVisible := True ;
  end
  else
  begin
    tsLot.TabVisible := False ;
  end;
end;

procedure TfmItemFil.FormShow(Sender: TObject);
begin
  pcItemFil.ActivePage :=  tsItemFil ;
end;

procedure TfmItemFil.spFindClick(Sender: TObject);
begin
  Application.CreateForm(TfmFindItem,fmFindItem);
  try
    fmFindItem.ShowModal;
    if fmFindItem.bbCancel.Enabled then
    begin
      with dmICData.quItemFil do
      begin
        Locate('Item_No',fmFindItem.quFindItem.FieldByName('Item_No').AsString,
          [loCaseInsensitive]);
      end;
    end;
  finally
    fmFindItem.Release;
  end;
end;

end.
