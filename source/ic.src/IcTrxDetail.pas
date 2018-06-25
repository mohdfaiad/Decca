unit IcTrxDetail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBCtrls, Buttons, ExtCtrls, StdCtrls, Mask, wwdblook,
  wwdbdatetimepicker, Wwlocate, wwDialog, wwidlg, Db, Wwdatsrc, DBTables,
  Wwquery, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TfmIcTrxDetail = class(TForm)
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
    gbTrx: TGroupBox;
    dedTrxLineNo: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    gbLodStatus: TGroupBox;
    Label3: TLabel;
    laLocCode: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    laOldLocQty: TLabel;
    laOldLocQtyRes: TLabel;
    Label22: TLabel;
    dedWhsDesc: TDBEdit;
    dedLocDesc: TDBEdit;
    dlcWhsCode: TwwDBLookupCombo;
    dlcLocNo: TwwDBLookupCombo;
    dedOldItemQty: TDBEdit;
    dedOldAvgCost: TDBEdit;
    dedOldItemQtyRes: TDBEdit;
    dedOldWhsQtyRes: TDBEdit;
    dedOldWhsQty: TDBEdit;
    dedOldLocQty: TDBEdit;
    dedOldLocQtyRes: TDBEdit;
    dedOldRplcCost: TDBEdit;
    paTrx: TPanel;
    laToWhsCode: TLabel;
    laToLocCode: TLabel;
    laJobNO: TLabel;
    laFwoNo: TLabel;
    Label11: TLabel;
    dedJobNo1: TDBEdit;
    dedFwoNo: TDBEdit;
    dedCostCat: TDBEdit;
    dedJobNo2: TDBEdit;
    dedToWhsCode: TDBEdit;
    dedToLocDesc: TDBEdit;
    dlcToWhsCode: TwwDBLookupCombo;
    dlcToLocNo: TwwDBLookupCombo;
    Label6: TLabel;
    Label5: TLabel;
    dedTrxQty: TDBEdit;
    dedStockUnit: TDBEdit;
    dedTrxCost: TDBEdit;
    gbNewStatus: TGroupBox;
    Label24: TLabel;
    dedNewLocQty: TDBEdit;
    laNewLocQtyRes: TLabel;
    dedNewWhsQty: TDBEdit;
    Label27: TLabel;
    dedNewQtyOnHand: TDBEdit;
    paPhoto: TPanel;
    dimPhoto: TDBImage;
    dedJobDesc: TDBEdit;
    laPhoto: TLabel;
    dedFwoDesc: TDBEdit;
    dedCostCatDesc: TDBEdit;
    dedItemStockUnit: TDBEdit;
    Label29: TLabel;
    dedItemMinQty: TDBEdit;
    Label30: TLabel;
    dedItemMaxQty: TDBEdit;
    sbFind: TSpeedButton;
    quItemWhsCode: TwwQuery;
    dsItemWhsCode: TwwDataSource;
    quItemWhsCodeWHS_CODE: TStringField;
    quItemWhsCodeWHS_DESC: TStringField;
    quItemLocCode: TwwQuery;
    dsItemLocCode: TwwDataSource;
    quItemWhsCodeITEM_NO: TStringField;
    quItemLotFil: TwwQuery;
    dsItemLotFil: TwwDataSource;
    quItemLotFilLOT_NO: TStringField;
    quItemLotFilRECV_DATE: TDateTimeField;
    quItemLotFilLST_USE_DATE: TDateTimeField;
    quItemLotFilEXPIRE_DATE: TDateTimeField;
    quItemLotFilRECV_QTY: TBCDField;
    quItemLotFilQTY_ON_HAND: TBCDField;
    quItemLotFilQTY_RESERVED: TBCDField;
    quItemLotFilLOT_COST: TBCDField;
    quItemLotFilRPLC_COST: TBCDField;
    dedTrxDocNo: TDBEdit;
    Label4: TLabel;
    gbFunction: TGroupBox;
    btLot: TButton;
    btKit: TButton;
    dcbItemNo: TwwDBComboDlg;
    dedItemDesc: TDBEdit;
    procedure sbExitClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dlcWhsCodeExit(Sender: TObject);
    procedure dlcWhsCodeChange(Sender: TObject);
    procedure dlcToWhsCodeExit(Sender: TObject);
    procedure dlcToWhsCodeChange(Sender: TObject);
    procedure dedTrxQtyExit(Sender: TObject);
    procedure dedTrxCostExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure dlcLocNoExit(Sender: TObject);
    procedure dlcLotNoClick(Sender: TObject);
    procedure dcbItemNoChange(Sender: TObject);
    procedure dcbItemNoExit(Sender: TObject);
    procedure dedJobNo1Change(Sender: TObject);
    procedure dedJobNo2Change(Sender: TObject);
    procedure dedFwoNoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dnaDeptClick(Sender: TObject; Button: TNavigateBtn);
    procedure dcbItemNoCustomDlg(Sender: TObject);
    procedure dedTrxDocNoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmIcTrxDetail: TfmIcTrxDetail;
  wNewAvgCost ,
  wNewQtyOnHand ,
  wNewWhsQty,
  wNewLocQty ,
  wNewLotQty ,
  wCost,
  wQty ,
  wAmount : Single;

implementation
uses IcData, FindItem, IcTrxFil, IcTrxLot, ICTrxCom;

{$R *.DFM}



procedure TfmIcTrxDetail.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmIcTrxDetail.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TfmIcTrxDetail.FormCreate(Sender: TObject);
begin
  with dmICData do
  begin
    with quItemWhsCode do
      if not Active then
        Open;
    with quItemLocCode do
      if not Active then
        Open;
    if quIcTrxFil.FieldByName('Trx_Type').AsString = 'X' then
    begin
      with quWareHouse do
        if  not  Active then
          Open;
      with quLocation do
        if not Active then
          Open;
      laToWhsCode.Enabled := True;
      laToLocCode.Enabled := True;
      dlcToWhsCode.Enabled := True;
      dlcToLocNo.Enabled := True;
    end
    else
    begin
      with quWareHouse do
        if Active then
          Close;
      with quLocation do
        if Active then
          Close;
      laToWhsCode.Enabled := False;
      laToLocCode.Enabled := False;
      dlcToWhsCode.Enabled := False;
      dlcToLocNo.Enabled := False;
    end;
    if (quIcTrxFil.FieldByName('Trx_Type').AsString = 'R') or
       (quIcTrxFil.FieldByName('Trx_Type').AsString = 'X') or
       (quIcTrxFil.FieldByName('Trx_Type').AsString = 'K') or
       (quIcTrxFil.FieldByName('Trx_Type').AsString = 'D') or
       (quIcTrxFil.FieldByName('Trx_Type').AsString = 'S')  then
    begin
      laJobNO.Enabled := False;
      laFwoNo.Enabled := False;
      dedJobNo1.Enabled := False;
      dedJobNo2.Enabled := False;
      dedFwoNo.Enabled := False;
    end
    else
    begin
      laJobNO.Enabled := True;
      laFwoNo.Enabled := True;
      dedJobNo1.Enabled := True;
      dedJobNo2.Enabled := True;
      dedFwoNo.Enabled := True;
    end;
  end;
end;

procedure TfmIcTrxDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmICData do
  begin
    with quIcTrxDetail do
    begin
      if Modified then
      begin
        Post;
      end;
    end;
    with quIcTrxLot do
    begin
      if Modified then
        Post;
    end;
    with quItemWhsCode do
      if Active then
       Close;
    with quItemLocCode do
      if Active then
        Close;

    with quWareHouse do
      if Active then
        Close;
    with quLocation do
      if Active then
        Close;
  end;
end;

procedure TfmIcTrxDetail.dlcWhsCodeExit(Sender: TObject);
begin
  if Trim(dlcWhsCode.Text) = '' then
  begin
    ShowMessage('請輸入倉號!');
    dlcWhsCode.SetFocus;
    Abort;
  end;
  with dmICData.quStockStatus do
  begin
    if Active then
      Close;
    ParamByName('Item_No').AsString  := dcbItemNo.Text;
    ParamByName('Whs_code').AsString := dlcWhsCode.Text;
    Open;
  end;
  if dlcLocNo.Text = '' then
    dmICData.quIcTrxDetail.FieldByName('Loc_code').AsString :=
      quItemLocCode.FieldByName('Loc_code').AsString;
end;

procedure TfmIcTrxDetail.dlcWhsCodeChange(Sender: TObject);
begin
  with dmICData do
  begin
    if quSelUserWhsTRACK_LOCATION.AsString = 'Y' then
    begin
      laLocCode.Enabled := True;
      dlcLocNo.Enabled := True;
      laNewLocQtyRes.Enabled := True;
      laOldLocQtyRes.Enabled := True;
      laOldLocQty.Enabled := True;
    end
    else
    begin
      laLocCode.Enabled := False;
      dlcLocNo.Enabled := False;
      laNewLocQtyRes.Enabled := False;
      laOldLocQtyRes.Enabled := False;
      laOldLocQty.Enabled := False;
    end;
  end;
end;

procedure TfmIcTrxDetail.dlcToWhsCodeExit(Sender: TObject);
begin
  if Trim(dlcToWhsCode.Text) = '' then
  begin
    ShowMessage('請輸入材料代號!');
    dlcToWhsCode.SetFocus;
    Abort;
  end;
end;

procedure TfmIcTrxDetail.dlcToWhsCodeChange(Sender: TObject);
begin
  with dmICData do
  begin
    if quWareHouseTRACK_LOCATION.AsString = 'Y' then
    begin
      laToLocCode.Enabled := True;
      dlcToLocNo.Enabled := True;
    end
    else
    begin
      laToLocCode.Enabled := False;
      dlcToLocNo.Enabled := False;
    end;
  end;
end;

procedure TfmIcTrxDetail.dedTrxQtyExit(Sender: TObject);
begin
  if Trim(dedTrxQty.Text) = '' then
  begin
    ShowMessage('請輸入處理數量!');
    dedTrxQty.SetFocus;
    Abort;
  end;
  case fmIcTrxFil.drgTrxType.ItemIndex of
  0 : begin //收料
        wNewQtyOnHand := StrToFloat(dedTrxQty.Text) + StrToFloat(dedOldItemQty.Text);
        dedNewQtyOnHand.Text := FloatToStr(wNewQtyOnHand);
        if dedOldWhsQty.Text = '' then
          wNewWhsQty := StrToFloat(dedTrxQty.Text)
        else
          wNewWhsQty := StrToFloat(dedTrxQty.Text) + StrToFloat(dedOldWhsQty.Text);
        dedNewWhsQty.Text := FloatToStr(wNewWhsQty);
        if (dlcLocNo.Text <> '') and (dedOldLocQty.Text <> '') then
        begin
          wNewLocQty := StrToFloat(dedTrxQty.Text) + StrToFloat(dedOldLocQty.Text);
          dedNewLocQty.Text := FloatToStr(wNewLocQty);
        end;
      end;
  2 : begin  //用料
        if  dmICData.quIcTrxDetailTRX_COST.IsNull then
          dmICData.quIcTrxDetail.FieldByName('Trx_Cost').AsString := dedOldAvgCost.Text;
        wNewQtyOnHand := StrToFloat(dedOldItemQty.Text) - StrToFloat(dedTrxQty.Text);
        dedNewQtyOnHand.Text := FloatToStr(wNewQtyOnHand);
        wNewWhsQty := StrToFloat(dedOldWhsQty.Text) - StrToFloat(dedTrxQty.Text);
        dedNewWhsQty.Text := FloatToStr(wNewWhsQty);
        if (dlcLocNo.Text <> '') and (dedOldLocQty.Text <> '') then
        begin
          wNewLocQty := StrToFloat(dedOldLocQty.Text) - StrToFloat(dedTrxQty.Text);
          dedNewLocQty.Text := FloatToStr(wNewLocQty);
        end;
      end;
  end;
end;

procedure TfmIcTrxDetail.dedTrxCostExit(Sender: TObject);
begin
  case fmIcTrxFil.drgTrxType.ItemIndex of
  0 : begin //收料
        wNewAvgCost := (StrToFloat(dedOldAvgCost.Text)*StrToFloat(dedOldItemQty.Text) +
                       StrToFloat(dedTrxCost.Text)*StrToFloat(dedTrxQty.Text)) /
                       (StrToFloat(dedTrxQty.Text) + StrToFloat(dedOldWhsQty.Text));
        //dedNewAvgCost.Text := FloatToStr(wNewAvgCost);
      end;
  //2 : dedNewAvgCost.Text := dedOldAvgCost.Text;
  end;
end;

procedure TfmIcTrxDetail.SpeedButton4Click(Sender: TObject);
begin
  showmessage(FloatToStr(dmICData.quStockStatus.FieldByName('Qty_On_hand').OldValue));
  showmessage(FloatToStr(dmICData.quStockStatus.FieldByName('Qty_On_hand').NewValue));
  showmessage(dmICData.quStockStatus.FieldByName('Qty_On_hand').AsString);
end;

procedure TfmIcTrxDetail.dlcLocNoExit(Sender: TObject);
begin
  with dmICData.quStockLoc do
  begin
    if Active then
      Close;
    ParamByName('Item_No').AsString  := dcbItemNo.Text;
    ParamByName('Whs_code').AsString := dlcWhsCode.Text;
    ParamByName('Loc_code').AsString := dlcLocNO.Text;
    Open;
  end;
end;

procedure TfmIcTrxDetail.dlcLotNoClick(Sender: TObject);
begin
  ShowMessage('Click');
end;

procedure TfmIcTrxDetail.dcbItemNoChange(Sender: TObject);
begin
  if (dmICData.quIcTrxDetail.State <> dsInsert) and
     (dmICData.quIcTrxDetail.State <> dsEdit) then
  begin
    with dmICData.quTrxItem do
    begin
      if  Active then
        Close;
      ParamByName('Item_No').AsString := dcbItemNo.Text;
      Open;
      if (FieldByName('Item_Type').AsString = 'L') or
         (FieldByName('Item_Type').AsString = 'S') then
      begin
        if btKit.Enabled then
          btLot.Enabled := False
        else
          btLot.Enabled := True;
      end
      else
        btLot.Enabled := False;
    end;
  end;
end;

procedure TfmIcTrxDetail.dcbItemNoExit(Sender: TObject);
begin
  if Trim(dcbItemNo.Text) = '' then
  begin
    ShowMessage('請輸入材料代號!');
    dcbItemNo.SetFocus;
    Abort;
  end;
  with quItemWhsCode do
  begin
    if  Active then
      Close;
    ParamByName('Item_No').AsString := dcbItemNo.Text;
    Open;
  end;
  
  if dlcWhsCode.Text = '' then
  begin
    dmICData.quIcTrxDetail.FieldByName('Whs_code').AsString :=
      quItemWhsCode.FieldByName('Whs_code').AsString;
  end;

  with dmICData do
  begin
    with quTrxItemPhoto do
    begin
      if Active then
        Close;
      ParamByName('Item_No').AsString := dcbItemNo.Text;
      Open;
    end;
    with quTrxItem do
    begin
      if Active then
        Close;
      ParamByName('Item_No').AsString := dcbItemNo.Text;
      Open;
      if Modified then
        quIcTrxDetail.FieldByName('Job_Cost_cat').AsString :=
          FieldByName('Job_Cost_cat').AsString;
      if (FieldByName('Item_Type').AsString = 'L') or
         (FieldByName('Item_Type').AsString = 'S') then
      begin
        if btKit.Enabled then
          btLot.Enabled := False
        else
          btLot.Enabled := True;
      end
      else
        btLot.Enabled := False;
    end;
  end;
end;

procedure TfmIcTrxDetail.dedJobNo1Change(Sender: TObject);
begin
  if dmICData.quIcTrxDetail.Modified then
    if (Length(dedJobNo1.Text) = 4) and (fmIcTrxDetail.Showing) then
      dedJobNo2.SetFocus;
end;

procedure TfmIcTrxDetail.dedJobNo2Change(Sender: TObject);
begin
  if dmICData.quIcTrxDetail.Modified then
    if (Length(dedJobNo2.Text) = 2) and (fmIcTrxDetail.Showing) then
      dedFwoNo.SetFocus;
end;

procedure TfmIcTrxDetail.dedFwoNoChange(Sender: TObject);
begin
  if dmICData.quIcTrxDetail.Modified then
    if (Length(dedFwoNo.Text) = 4) and (fmIcTrxDetail.Showing) then
      dedCostCat.SetFocus;
end;

procedure TfmIcTrxDetail.FormShow(Sender: TObject);
begin
  with dmICData.quIcTrxFil do
  begin
    if (FieldByName('Trx_Type').AsString = 'D') or
       (FieldByName('Trx_Type').AsString = 'K') then
    begin
      if (FieldByName('Trx_Type').AsString = 'D') then
        btKit.Caption := '分解處理'
      else
        btKit.Caption := '合成處理';
      btKit.Enabled := True;
    end
    else
      btKit.Enabled := False;
  end;
end;

procedure TfmIcTrxDetail.dnaDeptClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  dcbItemNo.SetFocus;
end;

procedure TfmIcTrxDetail.dcbItemNoCustomDlg(Sender: TObject);
begin
  Application.CreateForm(TfmFindItem,fmFindItem);
  try
    fmFindItem.ShowModal;
    if  fmFindItem.bbCancel.Enabled then
    begin
      with dmICData.quIcTrxDetail do
      begin
        if not Modified then
          Edit;
        FieldByName('Item_No').AsString :=
          fmFindItem.quFindItem.FieldByName('Item_No').AsString;
      end;
    end;
  finally
    fmFindItem.Release;
  end;
end;

procedure TfmIcTrxDetail.dedTrxDocNoChange(Sender: TObject);
begin
  with dmICData.quIcTrxDetail  do
    if ((not IsEmpty) and  fmIcTrxDetail.Showing) then
      if (State <> dsInsert) and
         (State <> dsEdit) then
      dedTrxQtyExit(Self);

end;

end.
