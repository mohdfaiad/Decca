unit PtJobFwo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, ExtCtrls, Gauges, Db,
  DBTables, Wwdatsrc, Wwquery, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook,
  quickrpt, Qrctrls,clipbrd;

type
  TfmPtJobFwo = class(TForm)
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
    guProcess: TGauge;
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
    qrsdFWOCost: TQRSubDetail;
    qrdTradeDescr: TQRDBText;
    QRDBText4: TQRDBText;
    qrdbtAmt: TQRDBText;
    qrdbtPremAmt: TQRDBText;
    QRDBText6: TQRDBText;
    gfbTotal: TQRBand;
    qrlSubTot: TQRLabel;
    qreRemAmt: TQRExpr;
    qrePremAmt: TQRExpr;
    GroupHeaderBand1: TQRBand;
    cbPntAmt: TCheckBox;
    Label1: TLabel;
    dblcStartCat: TwwDBLookupCombo;
    Label2: TLabel;
    dblcEndCat: TwwDBLookupCombo;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrlJob_No: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    qrlSubJob: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlAmt: TQRLabel;
    QRLabel4: TQRLabel;
    qrlPremAmt: TQRLabel;
    qrbSummary: TQRBand;
    qrlJobTot: TQRLabel;
    qreTotRegAmt: TQRExpr;
    qreTotPremAmt: TQRExpr;
    quSelJobNo: TwwQuery;
    procedure btnRightClick(Sender: TObject);
    procedure btnRightAllClick(Sender: TObject);
    procedure btnLeftClick(Sender: TObject);
    procedure btnLeftAllClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcEndCatCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcEndCatKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dblcSelJobCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcStartCatCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qrdbtTotRegPrint(sender: TObject; var Value: String);
    procedure dblcStartCatKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPtJobFwo: TfmPtJobFwo;
  procedure ButtonLock;
  procedure CloseUp;
implementation
uses JCDataDM,
     JCmain,
     FWOdtDm, SeJobPnt;
  var FiltString:String;
{$R *.DFM}

procedure TfmPtJobFwo.btnRightClick(Sender: TObject);
begin
  if lbChoseData.Items.Count >0  then
  begin
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  end;
  buttonlock;
end;

procedure TfmPtJobFwo.btnRightAllClick(Sender: TObject);
begin
  if lbChoseData.Items.Count >0  then
  repeat
    guProcess.Progress := 0 ;
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  until
    lbChoseData.Items.Count =0;
  buttonlock;
end;

procedure TfmPtJobFwo.btnLeftClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  begin
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  end;
  buttonlock;
end;

procedure TfmPtJobFwo.btnLeftAllClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  repeat
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  until
    lbGetData.Items.Count =0;
  buttonlock;
end;

procedure TfmPtJobFwo.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfmPtJobFwo.btnPrintClick(Sender: TObject);
var TempFilt : String;
begin
  if lbGetData.Items.Count >0  then
  begin
    guProcess.MaxValue :=lbGetData.Items.Count;
    guProcess.Progress :=1;
    guProcess.Visible := True;
    TempFilt := FiltString;
    FiltString := '';
    repeat
      guProcess.Progress :=1 +guProcess.Progress;
      FiltString :=' (FWO_NO = '''
                 +lbGetData.Items.Strings[lbGetData.itemindex]
                 +''' ) or '
                 +FiltString;
      lbGetData.Items.delete(lbGetData.itemindex);
    until lbGetData.Items.Count =0;
    FiltString := Trim(copy(FiltString,1,length(FiltString)-4));
    FiltString := '(( ' + FiltString + ' ) '
                 + ' and (' + TempFilt+ '))';
    with quSelJobNo do
    begin
      if Active then Close;
      with sql do
      begin
        Clear;
        Add('Select  distinct fwo_no,JOB_NO_1,JOB_NO_2');
        Add('From FWO_COST_CAT');
        Add('where ((job_no_1 = :Job_No_1 and Job_No_2 = :Job_No_2) and ('+ FiltString +'))');
        Add('Order by JOB_NO_1,JOB_NO_2,FWO_NO');
      end;
      Open;
    end;
    with dmJCFWO do
    begin
      with quRepFWOCost do
      begin
        if Active then
          Close;
        with sql do
        begin
          Clear;
          add('Select * From FWO_COST_CAT');
          add('where (((job_no_1 = :Job_No_1) and (Job_No_2 = :Job_No_2) and  (FWO_No = :FWO_No)) and (' + FiltString +'))');
        end;
        Open;
      end;
    end;
    //Check AMT
    if Not cbPntAmt.Checked then
    begin
      gfbTotal.Height := 0;
      qrbSummary.Height := 0;
      qrlAmt.Caption := '';
      qrlPremAmt.Caption := '';
      qrdbtPremAmt.DataField := '';
      qrdbtAmt.DataField := '';
      qrlJobTot.Caption := '';
      qrlSubTot.Caption :='';
      qreRemAmt.Frame.DrawTop := False;
      qrePremAmt.Frame.DrawTop := False;
      qreTotRegAmt.Frame.DrawTop := False;
      qreTotPremAmt.Frame.DrawTop := False;
    end else
    begin
      gfbTotal.Height := 24;
      qrbSummary.Height := 24;
      qrlAmt.Caption := '金額';
      qrlPremAmt.Caption := '金額';
      qrdbtPremAmt.DataField := 'JOB_PREM_AMT';
      qrdbtAmt.DataField := 'JOB_REG_AMT';
      qrlSubTot.Caption :='小計';
      qrlJobTot.Caption := '工程總計';
      qreRemAmt.Frame.DrawTop := True;
      qrePremAmt.Frame.DrawTop := True;
      qreTotRegAmt.Frame.DrawTop := True;
      qreTotPremAmt.Frame.DrawTop := True;
    end;
    qrlcompany.Caption := wCompanyName;
    qrlUsers.Caption := wUserID;
    qrRepCat.Prepare;
    qrRepCat.Preview;
    with quSelJobNo do
    begin
      if Active then Close;
    end;
    with dmJCFWO do
    begin
      with quRepFWOCost do
      begin
        if Active then
          Close;
      end;
    end;
    guProcess.Visible := false;
  end ;
  buttonLock;
end;


procedure TfmPtJobFwo.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  ButtonLock;
end;

procedure TfmPtJobFwo.FormShow(Sender: TObject);
begin
  with dmJCFWO do
  begin
    with quGetJobToRep do
      if Not Active then
        Open;
    with quRepGetCostCatList do
      if Not Active then
        Open;
  end;
end;

procedure ButtonLock;
begin
  with fmPtJobFwo do
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

procedure TfmPtJobFwo.dblcEndCatCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (trim(dblcEndCat.Text) <> '') then
  begin
    CloseUp;
    ButtonLock;
  end;
end;

procedure CloseUp;
begin
  with fmPtJobFwo do
  if (Trim(dblcSelJob.Text) <> '') then
  begin
    if  ((Trim(dblcStartCat.Text)<>'')
        and (Trim(dblcEndCat.Text)<>'')) then
      FiltString := '((JOB_COST_CAT >= '''
                 +Trim(dblcStartCat.Text)
                 + ''') AND (JOB_COST_CAT <= '''
                 +Trim(dblcEndCat.Text)
                 +'''))'
    else
    begin
      if  ((Trim(dblcStartCat.Text)<>'')
        and (Trim(dblcEndCat.Text)='')) then
        FiltString := '(JOB_COST_CAT >= '''
                 +Trim(dblcStartCat.Text)
                 +''')';
      if  ((Trim(dblcStartCat.Text)='')
        and (Trim(dblcEndCat.Text)<>'')) then
        FiltString :='(JOB_COST_CAT <= '''
                 +Trim(dblcEndCat.Text)
                 +''')';
      if  ((Trim(dblcStartCat.Text)='')
        and (Trim(dblcEndCat.Text)='')) then
        Abort;
    end;
    lbChoseData.Clear;
    with dmJCFWO do
    begin
      with quRepGetCostCat do
      begin
        if Active then
          Close;
        with sql do
        begin
          Clear;
          Add('Select distinct fwo_no,job_no_1,job_no_2');
          Add('From fwo_COST_CAT ');
          Add('where ((job_no_1 = :Job_No_1)  and (Job_No_2 = :Job_No_2)) and ('+FiltString+')');
          Add(' order by fwo_no');
        end;
//        ShowMessage(SQL.Text);
        Open;
        if Not IsEmpty then
        begin
          First ;
          repeat
            lbChoseData.Items.Add(quRepGetCostCat.FieldByName('FWO_NO').AsString);
            Next;
          until eof;
        end else
          ShowMessage('無選擇數据');
        Close;
        if lbGetData.Items.Count > 0 then
          lbGetData.Clear;
      end;
    end;
  end else
    ShowMessage('未選取工程');
end;

procedure TfmPtJobFwo.dblcEndCatKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if (trim(dblcEndCat.Text) <> '') then
    begin
      CloseUp;
      buttonLock;
    end;
  end;
end;

procedure TfmPtJobFwo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with dmJCFWO do
  begin
    with quGetJobToRep do
      if Not Active then
        Open;
    with quRepGetCostCatList do
      if Not Active then
        Open;
  end;
end;

procedure TfmPtJobFwo.dblcSelJobCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if dblcSelJob.Text <> '' then
  begin
    dblcStartCat.Enabled := True;
    dblcEndCat.Enabled := True;
  end
  else
  begin
    dblcStartCat.Enabled := False;
    dblcEndCat.Enabled := False;
  end;
end;

procedure TfmPtJobFwo.dblcStartCatCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (trim(dblcStartCat.Text) <> '') then
  begin
    CloseUp;
    buttonLock;
  end;
end;

procedure TfmPtJobFwo.qrdbtTotRegPrint(sender: TObject; var Value: String);
begin
  if Value <>'' then
  begin
    if cbPntAmt.Checked then
      Value := CurrencyString +Value
    else Value :='';
  end;
end;

procedure TfmPtJobFwo.dblcStartCatKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if (trim(dblcStartCat.Text) <> '') then
    begin
      CloseUp;
      buttonLock;
    end;
  end;
end;


end.
