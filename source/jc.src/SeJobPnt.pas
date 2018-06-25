unit SeJobPnt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, ExtCtrls, Gauges, Db,
  DBTables, Wwdatsrc, Wwquery, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook,
  quickrpt, Qrctrls;

type
  TfmSeJobPnt = class(TForm)
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
    qrRepJob: TQuickRep;
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
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrlJob_No: TQRLabel;
    qrbTitle: TQRBand;
    qrbTotal: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrdSubJobNo: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel13: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    qrsdSub: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    qrlSubJob: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    procedure btnRightClick(Sender: TObject);
    procedure btnRightAllClick(Sender: TObject);
    procedure btnLeftClick(Sender: TObject);
    procedure btnLeftAllClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcSelJobKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dblcSelJobCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRExpr4Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSeJobPnt: TfmSeJobPnt;
  procedure   CloseUp;
  procedure ButtonLock;
implementation
uses JCDataDM,
     JCmain,
     FWOdtDm;

{$R *.DFM}

procedure TfmSeJobPnt.btnRightClick(Sender: TObject);
begin
  if lbChoseData.Items.Count >0  then
  begin
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  end;
  buttonlock;
end;

procedure CloseUp;
begin
  with fmSeJobPnt do
  if Trim(dblcSelJob.Text) <> '' then
  begin
    if lbChoseData.Items.Count > 0 then
      lbChoseData.Clear;
    with dmJCFWO do
    begin
      with quRepGetSubNo do
      begin
        if Active then
          Close;
        with sql do
        begin
          Clear;
          add('select  Job_No_1,Job_No_2,Sub_Job_No,Description');
          add('from Sub_Job_File');
          add('where ((Job_No_1 = :Job_No_1) and  (Job_No_2 = :Job_No_2))');
          add('order by  job_no_1,job_no_2,sub_job_no');
        end;
        Open;
        if Not IsEmpty then
        begin
          First ;
          repeat
            lbChoseData.Items.Add(quRepGetSubNoSUB_JOB_NO.AsString);
            Next;
          until eof;
          if lbGetData.Items.Count > 0 then
            lbGetData.Clear;
        end else
          ShowMessage('無選擇數据');
        Close;
      end;
    end;
  end else
    ShowMessage('未選取工程');
    buttonLock;
end;

procedure TfmSeJobPnt.btnRightAllClick(Sender: TObject);
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

procedure TfmSeJobPnt.btnLeftClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  begin
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  end;
  buttonlock;
end;

procedure TfmSeJobPnt.btnLeftAllClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  repeat
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  until
    lbGetData.Items.Count =0;
  buttonlock;
end;

procedure TfmSeJobPnt.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfmSeJobPnt.btnPrintClick(Sender: TObject);
var FiltString : String;
begin
  if lbGetData.Items.Count >0  then
  begin
    guProcess.MaxValue :=lbGetData.Items.Count;
    guProcess.Progress :=1;
    guProcess.Visible := True;
    repeat
      guProcess.Progress :=1 +guProcess.Progress;
      FiltString :='(SUB_JOB_NO = '''
                 +lbGetData.Items.Strings[lbGetData.itemindex]
                 +''') or '
                 +FiltString;
      lbGetData.Items.delete(lbGetData.itemindex);
    until lbGetData.Items.Count =0;
    FiltString := '('+Trim(copy(FiltString,1,length(FiltString)-4))+')';
    with dmJCFWO do
    begin
      with quRepGetSubNo do
      begin
        if Active then
          Close;
        with sql do
        begin
          Clear;
          add('select  Job_No_1,Job_No_2,Sub_Job_No,Description');
          add('from Sub_Job_File');
          add('where ((Job_No_1 = :Job_No_1) and  (Job_No_2 = :Job_No_2)) and ' +FiltString);
          add('order by  job_no_1,job_no_2,sub_job_no');
        end;
        Open;
      end;
      with quGetJobToSubRep do
      begin
        if Active then
          Close;
        with sql do
        begin
          Clear;
          add('Select job_no_1, job_no_2, sub_job_no,job_cost_cat_unit ,sum(reg_rate) as reg_rate,'
              +'sum(prem_rate) as prem_rate,'
              +'sum(budget_amt) as budget_amt,'
              +'sum(budget_qty) as budget_qty,sum(job_reg_qty) as job_reg_qty,'
              +'sum(Job_reg_amt) as job_reg_amt,'
              +'sum(job_prem_qty) as job_prem_qty,'
              +'sum(job_prem_amt) as job_prem_amt');
          add('From Job_Cost_Cat');
          add('where ((Job_No_1 = :Job_No_1) and (Job_No_2 = :Job_No_2) and Sub_Job_No = :Sub_Job_No) and '+ FiltString);
          add('group by Job_No_1,Job_No_2,Sub_Job_No,Job_Cost_Cat_Unit');
          add('order by  job_no_1,job_no_2,sub_job_no,job_cost_cat_unit');
        end;
{        if Filtered  then
           Filtered := False;
        Filter := FiltString;
        Filtered := True;}
        Open;
      end;
    end;
    qrlcompany.Caption := wCompanyName;
    qrlUsers.Caption := wUserID;
    qrRepJob.Prepare;
    qrRepJob.Preview;
    with dmJCFWO do
    begin
      with quGetJobToSubRep do
      if Active then
        Close;
      with quRepGetSubNo do
        if Active then
          Close;
    end;
    guProcess.Visible := false;
  end;
  buttonLock;
end;


procedure TfmSeJobPnt.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  btnPrint.Enabled := False;
  sbtotal.Panels[1].Text := '0 (個)';
  sbtotal.Panels[3].Text := '0 (個)';
end;

procedure TfmSeJobPnt.dblcSelJobKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if Trim(dblcSelJob.Text) <>'' then
      CloseUp;
    buttonLock;
  end;
end;


procedure TfmSeJobPnt.FormShow(Sender: TObject);
begin
  with dmJCFWO do
  begin
    with quGetJobToRep do
      if Not Active then
        Open;
  end;
  buttonLock;
end;

procedure TfmSeJobPnt.dblcSelJobCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if Trim(dblcSelJob.Text) <>'' then
    CloseUp;
  buttonLock;
end;

procedure TfmSeJobPnt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCFWO do
  begin
    with quGetJobToRep do
      if Active then
        Close;
  end;
end;

procedure ButtonLock;
begin
  with fmSeJobPnt do
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

procedure TfmSeJobPnt.QRExpr4Print(sender: TObject; var Value: String);
begin
  if Value <> '' then
    Value := CurrencyString + Value
  else
    Value := CurrencyString + '0.00';
end;

end.
