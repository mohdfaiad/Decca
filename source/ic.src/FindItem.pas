unit FindItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, wwdblook, ExtCtrls, Db, DBTables,
  Wwquery, Buttons, Wwdatsrc;

type
  TfmFindItem = class(TForm)
    Panel1: TPanel;
    edItemNo: TEdit;
    dlcItemCat: TwwDBLookupCombo;
    dlcItemSubCat: TwwDBLookupCombo;
    dlcWhsCode: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    wwDBGrid1: TwwDBGrid;
    bbSelect: TBitBtn;
    bbCancel: TBitBtn;
    quFindItem: TwwQuery;
    quFindItemITEM_NO: TStringField;
    quFindItemDESCRIPTION: TStringField;
    quFindItemITEM_PROD_CAT: TStringField;
    dsFindItem: TwwDataSource;
    quSelWhs: TwwQuery;
    quSelWhsUSER_ID: TStringField;
    quSelWhsWHS_CODE: TStringField;
    quSelWhsWhs_Desc: TStringField;
    quFindItemITEM_SUBCAT: TStringField;
    quFindItemITEM_STOCK_UNIT: TStringField;
    quFindItemQTY_ON_HAND: TFloatField;
    procedure bbSelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFindItem: TfmFindItem;

implementation
uses Icdata;

{$R *.DFM}


procedure TfmFindItem.bbSelectClick(Sender: TObject);
begin
  with quFindItem do
  begin
    if Active then
      Close;
    with sql do
    begin
      Clear;
      Add('select ss.Item_No, ss.qty_on_hand, it.Description,it.item_prod_Cat,'+
          'it.item_subcat, it.item_stock_unit');
      Add('from Stock_status ss,  Item_fil it');
      Add('where ss.item_no = it.Item_no and ss.Whs_code = :whs_code');
      if dlcItemCat.Text <> '' then
        Add('and it.Item_prod_Cat = "' + dlcItemCat.Text + '"' );
      if dlcItemSubCat.Text <> '' then
        Add('and it.Item_SubCat = "' + dlcItemSubCat.Text + '"' );
      if edItemNo.Text <> '' then
        Add('and ss.Item_NO like "%' + edItemNo.Text + '%"' );
       if (dmICData.quIcTrxFil.FieldByName('Trx_Type').AsString = 'K') or
         (dmICData.quIcTrxFil.FieldByName('Trx_Type').AsString = 'D') then
        Add('and (it.Kit_Type = "K" or it.Kit_type = "B")');
      Add('order by  ss.item_no');
    end;
    ParamByName('whs_code').AsString := dlcWhsCode.Text;
    Open;
  end;
end;

procedure TfmFindItem.FormCreate(Sender: TObject);
begin
  with dmICData do
  begin
    with quItemCatFil do
      if not Active then
        Open;
    with quItemSubcatFil do
      if not Active then
        Open;
    with quSelWhs do
    begin
      if not Active then
        Open;
      First;
      dlcWhsCode.Text := FieldByName('Whs_code').AsString;
    end;
    with quFindItem do
    begin
      if Active then
        Close;
      if (quIcTrxFil.FieldByName('Trx_Type').AsString = 'K') or
         (quIcTrxFil.FieldByName('Trx_Type').AsString = 'D') then
        Sql.Add('and (it.Kit_Type = "K" or it.Kit_type = "B")');
      Sql.Add('order by  ss.item_no');
      ParamByName('whs_code').AsString := dlcWhsCode.Text;
      Open;
    end;
  end;
end;

procedure TfmFindItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmICData do
  begin
    with quItemCatFil do
      if Active then
        Close;
    with quItemSubcatFil do
      if Active then
        Close;
    with quSelWhs do
      if Active then
        Close;
  end;
end;

procedure TfmFindItem.wwDBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFindItem.bbCancelClick(Sender: TObject);
begin
  bbCancel.Enabled := False;
end;

end.
