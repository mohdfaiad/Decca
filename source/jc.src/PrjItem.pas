unit PrjItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, ExtCtrls, Gauges, Db,
  DBTables, Wwdatsrc, Wwquery, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook,
  quickrpt, Qrctrls,clipbrd;

type
  TfmPrjItem = class(TForm)
    pacancel: TPanel;
    pabottom: TPanel;
    btnRight: TSpeedButton;
    btnRightAll: TSpeedButton;
    btnLeft: TSpeedButton;
    btnLeftAll: TSpeedButton;
    lbGetData: TListBox;
    lbChoseData: TListBox;
    patitle: TPanel;
    laSetSubJob: TLabel;
    laGetSubJob: TLabel;
    sbtotal: TStatusBar;
    btnPrint: TSpeedButton;
    btnExit: TSpeedButton;
    paWatch: TPanel;
    laSeleJob: TLabel;
    dblcSelJob: TwwDBLookupCombo;
    qrRepCat: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    qrlTitle: TQRLabel;
    QRLabel19: TQRLabel;
    QRSysData4: TQRSysData;
    qrlcompany: TQRLabel;
    QRLabel28: TQRLabel;
    QRSysData1: TQRSysData;
    qrltime: TQRLabel;
    qrstime: TQRSysData;
    QRLabel20: TQRLabel;
    qrlUsers: TQRLabel;
    qrsdFwoCostCat: TQRSubDetail;
    qrdTradeDescr: TQRDBText;
    QRDBText4: TQRDBText;
    qrdbtAmt: TQRDBText;
    qrdbtPremAmt: TQRDBText;
    QRDBText6: TQRDBText;
    GroupFooterBand1: TQRBand;
    QRLabel13: TQRLabel;
    qreRemAmt: TQRExpr;
    QRExpr4: TQRExpr;
    GroupHeaderBand1: TQRBand;
    cbPtAMT: TCheckBox;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrlJob_No: TQRLabel;
    QRDBText9: TQRDBText;
    qrlSubJob: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlAmt: TQRLabel;
    QRLabel4: TQRLabel;
    qrlPremAmt: TQRLabel;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    qrsdItem: TQRSubDetail;
    qrbItem: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr5: TQRExpr;
    qrbItemTotal: TQRBand;
    qrlItemTot: TQRLabel;
    qreItemTot: TQRExpr;
    laStartDate: TLabel;
    laEndDate: TLabel;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    quSelePrj: TwwQuery;
    quSelePrjJOB_NO_1: TStringField;
    dsSelePrj: TwwDataSource;
    quRepPrjItem: TwwQuery;
    quRepPrjItemJOB_NO_1: TStringField;
    quRepPrjItemJOB_NO_2: TStringField;
    quRepPrjItemFWO_NO: TStringField;
    quRepPrjItemJOB_COST_CAT: TStringField;
    quRepPrjItemSUB_JOB_NO: TStringField;
    quRepPrjItemHIST_DATE: TDateTimeField;
    quRepPrjItemSITE_NO: TIntegerField;
    quRepPrjItemHIST_SEQ: TDateTimeField;
    quRepPrjItemDOC_NO: TStringField;
    quRepPrjItemDETAIL_TYPE: TStringField;
    quRepPrjItemDETAIL_AMT: TBCDField;
    quRepPrjItemRETAIN_AMT: TBCDField;
    quRepPrjItemDETAIL_QTY: TBCDField;
    quRepPrjItemITEM_NO: TStringField;
    quRepPrjItemWHS_CODE: TStringField;
    quRepPrjItemITEM_UNIT_COST: TBCDField;
    quRepPrjItemITEM_UNIT: TStringField;
    quRepPrjItemINVC_NO: TStringField;
    quRepPrjItemINVC_DATE: TDateTimeField;
    quRepPrjItemCHQ_NO: TStringField;
    quRepPrjItemCHQ_DATE: TDateTimeField;
    quRepPrjItemUSER_ID: TStringField;
    quRepPrjItemACCT_NO: TStringField;
    quRepPrjItemPFT_CTR_1: TStringField;
    quRepPrjItemPFT_CTR_2: TStringField;
    quRepPrjItemCOMMENT: TMemoField;
    quRepPrjItemQTY_TYPE: TStringField;
    quRepPrjItemJOB_NO: TStringField;
    dblcSeleJob2: TwwDBLookupCombo;
    quSelePrjNo2: TwwQuery;
    dsSelePrjNo2: TwwDataSource;
    quSelePrjNo2JOB_NO_1: TStringField;
    quSelePrjNo2JOB_NO_2: TStringField;
    quSelePrjNo2DESCRIPTION: TStringField;
    quCostCat: TwwQuery;
    quCostCatJOB_COST_CAT: TStringField;
    quCostCatDESCRIPTION: TStringField;
    quCostCatJOB_COST_TYPE: TStringField;
    quCostCatJOB_COST_CAT_UNIT: TStringField;
    procedure btnRightClick(Sender: TObject);
    procedure btnRightAllClick(Sender: TObject);
    procedure btnLeftClick(Sender: TObject);
    procedure btnLeftAllClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonLockCal;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure qreItemTotPrint(sender: TObject; var Value: String);
    procedure quRepPrjItemCalcFields(DataSet: TDataSet);
    procedure dtpEndDateCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrjItem: TfmPrjItem;
implementation
uses JCDataDM,
     JCmain,
     FWOdtDm,
     SeJobPnt, PtFwoCat;

var FiltString : String;


{$R *.DFM}

procedure TfmPrjItem.btnRightClick(Sender: TObject);
begin
  if lbChoseData.Items.Count >0  then
  begin
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  end;
  buttonlockCal;
end;

procedure TfmPrjItem.btnRightAllClick(Sender: TObject);
begin
{  if lbChoseData.Items.Count >0  then
  repeat
    guProcess.Progress := 0 ;
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  until
    lbChoseData.Items.Count =0;
  buttonlockCal;}
end;

procedure TfmPrjItem.btnLeftClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  begin
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  end;
  buttonlockCal;
end;

procedure TfmPrjItem.btnLeftAllClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  repeat
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  until
    lbGetData.Items.Count =0;
  buttonlockCal;
end;

procedure TfmPrjItem.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfmPrjItem.btnPrintClick(Sender: TObject);
var wGetCat : String ;
begin
  if lbGetData.Items.Count >0  then
  begin
    lbGetData.ItemIndex := 0;
    wGetCat := '"'+ lbGetData.Items.Strings[lbGetData.itemindex] +'"';
    if lbGetData.Items.Count >1 then
    repeat
      lbGetData.ItemIndex :=     lbGetData.ItemIndex +1;
      wGetCat := wGetCat + ',"'+ lbGetData.Items.Strings[lbGetData.itemindex] +'"'
    until (lbGetData.ItemIndex = lbGetData.Items.Count -1);
    with quRepPrjItem do
    begin
      if Active then
        Close;
      with sql do
      begin
        Clear ;
        Add('Select * From Job_Detail '
             +' where (HIST_DATE >=:StartDate  and HIST_DATE <=:EndDate)'
             + ' JOB_NO_1 like ''' + Trim(dblcSelJob.Text) +'%'''
             + ' JOB_NO_2 like ''' + Trim(dblcSeleJob2.Text) +'%'''
             + ' and job_cost_cat in ('+ wGetCat +')' );
        Add(' Order by job_no_1,job_no_2,job_cost_cat');
      end;
      ParamByName('StartDate').AsDate := dtpStartDate.Date ;
      ParamByName('EndDate').AsDate :=  dtpEndDate.Date;
      Open;
    end;
  end ;
  buttonLockCal;
end;


procedure TfmPrjItem.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  btnPrint.Enabled := False;
  sbtotal.Panels[1].Text := '0 (個)';
  sbtotal.Panels[3].Text := '0 (個)';
end;

procedure TfmPrjItem.FormShow(Sender: TObject);
begin
  with quSelePrj do
  begin
    if Not Active then
      Open;
  end;
  with quSelePrjNo2  do
  begin
    if Not Active then
      Open;
  end;
  with quCostCat do
  begin
    if Not Active then
      Open;
    if recordcount > 0 then
    begin
      First ;
      repeat
        lbGetData.Items.Add( quCostCatJOB_COST_CAT.AsString );
        Next ;
      until eof;
    end;
  end;
//  buttonLockCal ;
end;

procedure TfmPrjItem.ButtonLockCal;
begin
  with fmPtFwoCat do
  begin
    if lbChoseData.Items.Count >0  then
    begin
      if Not btnRight.Enabled then
        btnRight.Enabled := True;
      if Not btnRightAll.Enabled then
        btnRightAll.Enabled := True;
    end else
    begin
      if btnRight.Enabled then
        btnRight.Enabled := false;
      if btnRightAll.Enabled then
        btnRightAll.Enabled := false;
    end;

    if lbGetData.Items.Count > 0 then
    begin
      if Not btnLeft.Enabled then
        btnLeft.Enabled := True;
      if Not btnLeftAll.Enabled then
        btnLeftAll.Enabled := true;
      if Not btnPrint.Enabled then
        btnPrint.Enabled := True;
    end else
    begin
      if btnLeft.Enabled then
        btnLeft.Enabled := False;
      if btnLeftAll.Enabled then
        btnLeftAll.Enabled := False;
      if btnPrint.Enabled then
        btnPrint.Enabled := False;
    end; 
    sbtotal.Panels[1].Text := inttostr(lbChoseData.Items.Count) + '(個)';
    sbtotal.Panels[3].Text := inttostr(lbGetData.Items.Count) + '(個)';
  end;
end;

procedure TfmPrjItem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with quSelePrj do
    if Active then
      Close;
  with quSelePrjNo2  do
  begin
    if Active then
      Close;
  end;
  with quCostCat   do
  begin
    if Active then
      Close;
  end;
end;

procedure TfmPrjItem.QRExpr2Print(sender: TObject; var Value: String);
begin
  if Value <>'' then
    Value := CurrencyString + Value;
end;

procedure TfmPrjItem.qreItemTotPrint(sender: TObject; var Value: String);
begin
{  if Not cbPtItem.Checked then
    Value := '';
  if Value <>'' then
    Value := CurrencyString + Value;}
end;

procedure TfmPrjItem.quRepPrjItemCalcFields(DataSet: TDataSet);
begin
  if ((Trim(quRepPrjItemJOB_NO_1.AsString)<>'')
    and (Trim(quRepPrjItemJOB_NO_2.AsString) <> '')) then
    quRepPrjItemJOB_NO.AsString := quRepPrjItemJOB_NO_1.AsString
      + '-' + quRepPrjItemJOB_NO_2.AsString
  else
    quRepPrjItemJOB_NO.AsString := quRepPrjItemJOB_NO_1.AsString
      + quRepPrjItemJOB_NO_2.AsString;
end;

procedure TfmPrjItem.dtpEndDateCloseUp(Sender: TObject);
begin
  if dtpEndDate.Date < dtpStartDate.Date then
  begin
    dtpEndDate.Date := dtpStartDate.Date ;
    ShowMessage('<截止日期>必須大于等于<起始日期>!'
  end;
end;

end.
