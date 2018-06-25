unit JCStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, ExtCtrls, Gauges, Db,
  DBTables, Wwdatsrc, Wwquery, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook,
  quickrpt, Qrctrls,clipbrd, TestPrg;

type
  TfmJCStatus = class(TForm)
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
    cbPrintAmt: TCheckBox;
    laStartDate: TLabel;
    laEndDate: TLabel;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    quSelePrj: TwwQuery;
    quSelePrjJOB_NO_1: TStringField;
    quCostCat: TwwQuery;
    quCostCatJOB_COST_CAT: TStringField;
    quCostCatDESCRIPTION: TStringField;
    quCostCatJOB_COST_TYPE: TStringField;
    quCostCatJOB_COST_CAT_UNIT: TStringField;
    TestPrg: TTestPrg;
    laJobNo2: TLabel;
    quSelePrjJOB_NO_2: TStringField;
    quSelePrjDESCRIPTION: TStringField;
    edJobNo2: TEdit;
    procedure btnRightClick(Sender: TObject);
    procedure btnRightAllClick(Sender: TObject);
    procedure btnLeftClick(Sender: TObject);
    procedure btnLeftAllClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonLockCal;
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure qreItemTotPrint(sender: TObject; var Value: String);
    procedure dtpEndDateCloseUp(Sender: TObject);
    procedure dblcSelJobChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJCStatus: TfmJCStatus;

implementation

uses RepFwoDm, qrItem;

{$R *.DFM}

procedure TfmJCStatus.btnRightClick(Sender: TObject);
begin
  if lbChoseData.Items.Count >0  then
  begin
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  end;
  buttonlockCal;
end;

procedure TfmJCStatus.btnRightAllClick(Sender: TObject);
begin
  if lbChoseData.Items.Count >0  then
  repeat
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  until
    lbChoseData.Items.Count =0;
  buttonlockCal;
end;

procedure TfmJCStatus.btnLeftClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  begin
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  end;
  buttonlockCal;
end;

procedure TfmJCStatus.btnLeftAllClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  repeat
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  until
    lbGetData.Items.Count =0;
  buttonlockCal;
end;

procedure TfmJCStatus.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfmJCStatus.btnPrintClick(Sender: TObject);
var wGetCat : String ;
  wJobNo1 : String[8];
  wJobNo2 : String[2];
  i : Integer ;
begin
  if lbGetData.Items.Count >0  then
  begin
    lbGetData.ItemIndex := 0;
    wGetCat := '"'+ lbGetData.Items.Strings[0] +'"';
    if lbGetData.Items.Count >1 then
    for i := 1 to lbGetData.Items.Count -1 do
      wGetCat := wGetCat + ',"'+ lbGetData.Items.Strings[i] +'"';
    with dmRepFwo.quJCStatus do
    begin
      if Active then
        Close;
      with sql do
      begin
        Clear ;
        Add('Select * '
            +' From REPORT_PROJECT_ITEM(:iJob_No_1,:iJob_No_2,:StartDate,:EndDate) '
            + ' where  ojob_cost_cat in ('+ wGetCat +')' );
        Add(' Order by ojob_no_1,ojob_no_2,ojob_cost_cat_unit,ojob_cost_cat');
      end;
      wJobNo1 := Trim(dblcSelJob.Text);
      for i:= Length(Trim(dblcSelJob.Text))+1 to gJobNo1Len do
        wJobNo1 := wJobNo1 + '%';
      ParamByName('iJob_no_1').AsString := wJobNo1;
      wJobNo2 :=Trim(edJobNo2.Text);
      for i := Length(Trim(edJobNo2.Text))+ 1 to gJobNo2Len do
        wJobNo2 := wJobNo2 + '%';
      ParamByName('iJob_no_2').AsString := wJobNo2;
      ParamByName('StartDate').AsDate := dtpStartDate.Date ;
      ParamByName('EndDate').AsDate :=  dtpEndDate.Date;
      Open;
      if RecordCount =0 then
      begin
        Close;
        ShowMessage('無請求打印數据!');
        buttonLockCal;
        Abort;
      end;
    end;
  end ;
  buttonLockCal;
  Application.CreateForm(TfmqrItem ,fmqrItem);
  {if cbPtAMT.Checked  then
  begin
    with fmqrItem do
    begin
      qrdbtPDetailAmt.DataField := 'P_DETAIL_AMT';
      qrdbtRDetailAmt.DataField := 'R_DETAIL_AMT';
      qrbFoot.Height := 28;
      sbTotal.Height :=20;
    end;
  end else
  begin
    with fmqrItem do
    begin
      qrdbtPDetailAmt.DataField := '';
      qrdbtRDetailAmt.DataField := '';
      qrbFoot.Height := 3;
      sbTotal.Height :=0;
    end;
  end;}
  fmqrItem.qrlcompany.Caption := wCompanyName;
  fmqrItem.qrlUserName.Caption := wUserID;
  if ((Trim(dblcSelJob.Text)<>'') and (Trim(edJobNo2.Text)<> '')) then
  begin
    if length(Trim(edJobNo2.Text)) <2 then
      fmqrItem.qrlSelectJobNo.Caption := '工程 :'+ Trim(dblcSelJob.Text)
        +'*-'+Trim(edJobNo2.Text) +'*'
    else
      fmqrItem.qrlSelectJobNo.Caption := '工程 :'+ Trim(dblcSelJob.Text)
        +'*-'+Trim(edJobNo2.Text) ;
  end else
  begin
    if (Trim(dblcSelJob.Text)='') then
    begin
      if length(Trim(edJobNo2.Text)) <2 then
        fmqrItem.qrlSelectJobNo.Caption := '工程 :*-'+Trim(edJobNo2.Text)+'*'
      else
        fmqrItem.qrlSelectJobNo.Caption := '工程 :*-'+Trim(edJobNo2.Text);
    end else
      fmqrItem.qrlSelectJobNo.Caption := '工程 :'+ Trim(dblcSelJob.Text) +'*-*'
  end;
  fmqrItem.qrlSelectDate.Caption := ' 日期 :' + DateToStr(dtpStartDate.Date ) +' -> '+ DateToStr(dtpEndDate.Date);
  Try
    fmqrItem.qrJob.Prepare;
    fmqrItem.qrJob.Preview;
  finally
    fmqrItem.Release;
    dmRepFwo.quJCStatus.Close;
  end;
end;


procedure TfmJCStatus.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  TestPrg.TestProgram('JC', wCompanyID, wUserID, wActiveSecurity);
  btnPrint.Enabled := False;
  sbtotal.Panels[1].Text := '0 (個)';
  sbtotal.Panels[3].Text := '0 (個)';
  if gUseJobNo2 <> 'Y' then
  begin
    edJobNo2.Visible := false;
    laJobNo2.Visible := false;
    with quSelePrj do
      quSelePrjJOB_NO_2.Visible := false;
  end
  else
    edJobNo2.MaxLength := gJobNo2Len;
end;

procedure TfmJCStatus.FormShow(Sender: TObject);
begin
  with quSelePrj do
    if Not Active then
      Open;
  with quCostCat do
  begin
    if Not Active then
      Open;
    if recordcount > 0 then
    begin
      First ;
      repeat
        lbChoseData.Items.Add( quCostCatJOB_COST_CAT.AsString );
        Next ;
      until eof;
    end;
    Close;
  end;
  ButtonLockCal;
  dtpStartDate.Date := date-1;
  dtpEndDate.Date := Date;
end;

procedure TfmJCStatus.ButtonLockCal;
begin
//  with fmPtFwoCat do
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

procedure TfmJCStatus.QRExpr2Print(sender: TObject; var Value: String);
begin
  if Value <>'' then
    Value := CurrencyString + Value;
end;

procedure TfmJCStatus.qreItemTotPrint(sender: TObject; var Value: String);
begin
{  if Not cbPtItem.Checked then
    Value := '';
  if Value <>'' then
    Value := CurrencyString + Value;}
end;

procedure TfmJCStatus.dtpEndDateCloseUp(Sender: TObject);
begin
  if dtpEndDate.Date < dtpStartDate.Date then
  begin
    dtpEndDate.Date := dtpStartDate.Date ;
    ShowMessage('<截止日期>必須大于等于<起始日期>!');
  end;
end;

procedure TfmJCStatus.dblcSelJobChange(Sender: TObject);
begin
  if gUseJobNo2 = 'Y' then
    with quSelePrj do
      edJobNo2.Text := quSelePrjJOB_NO_2.AsString;
end;

procedure TfmJCStatus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quSelePrj do
    if Active then
      Close;
  with dmRepFwo.quSelFuncApproved do
    if Active then
      Close;
end;

end.
