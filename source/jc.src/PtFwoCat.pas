unit PtFwoCat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, ExtCtrls, Gauges, Db,
  DBTables, Wwdatsrc, Wwquery, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook,
  quickrpt, Qrctrls,clipbrd;

type
  TfmPtFwoCat = class(TForm)
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
    laStartFwoNo: TLabel;
    dblcStartFwoNo: TwwDBLookupCombo;
    laEndFwoNo: TLabel;
    dblcEndFwoNo: TwwDBLookupCombo;
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
    laStartSub: TLabel;
    laEndSub: TLabel;
    dblcEndSub: TwwDBLookupCombo;
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
    dblcStartSub: TwwDBLookupCombo;
    Panel1: TPanel;
    cbPtSingleWork: TCheckBox;
    cbPtItem: TCheckBox;
    quSelJobNo: TwwQuery;
    procedure btnRightClick(Sender: TObject);
    procedure btnRightAllClick(Sender: TObject);
    procedure btnLeftClick(Sender: TObject);
    procedure btnLeftAllClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcEndFwoNoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dblcEndSubCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcSelJobCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcStartSubCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcStartFwoNoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure qreItemTotPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPtFwoCat: TfmPtFwoCat;
  procedure ButtonLockCal;
  procedure CloseUp;
implementation
uses JCDataDM,
     JCmain,
     FWOdtDm,
     SeJobPnt;

var FiltString : String;


{$R *.DFM}

procedure TfmPtFwoCat.btnRightClick(Sender: TObject);
begin
  if lbChoseData.Items.Count >0  then
  begin
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  end;
  buttonlockCal;
end;

procedure TfmPtFwoCat.btnRightAllClick(Sender: TObject);
begin
  if lbChoseData.Items.Count >0  then
  repeat
    guProcess.Progress := 0 ;
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  until
    lbChoseData.Items.Count =0;
  buttonlockCal;
end;

procedure TfmPtFwoCat.btnLeftClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  begin
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  end;
  buttonlockCal;
end;

procedure TfmPtFwoCat.btnLeftAllClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  repeat
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  until
    lbGetData.Items.Count =0;
  buttonlockCal;
end;

procedure TfmPtFwoCat.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfmPtFwoCat.btnPrintClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  begin
    guProcess.MaxValue :=lbGetData.Items.Count;
    guProcess.Progress :=1;
    guProcess.Visible := True;
    FiltString := '';
    repeat
      guProcess.Progress :=1 +guProcess.Progress;
      FiltString :=' (JOb_Cost_Cat= '''
                 +lbGetData.Items.Strings[lbGetData.itemindex]
                 +''') or '
                 +FiltString;
      lbGetData.Items.delete(lbGetData.itemindex);
    until lbGetData.Items.Count =0;
    FiltString :=  '('+Trim(copy(FiltString,1,length(FiltString)-4))+')';
    with quSelJobNo do
    begin
      if Active then
        Close;
      with sql do
      begin
        Clear;
        Add('Select  distinct fwo_no,JOB_NO_1,JOB_NO_2 from FWO_COST_CAT');
        add(' where ((job_no_1 = :Job_No_1) and (Job_No_2 = :Job_No_2)) and '+ FiltString);
        add(' Order by JOB_NO_1,JOB_NO_2,FWO_NO');
      end;
      Open;
    end;
    with dmJCFWO do
    begin
      with quRepFWOCost do
      begin
        if  Active then
          Close;
        with sql do
        begin
          Clear;
          Add('Select * From FWO_COST_CAT');
          Add('where ((job_no_1 = :Job_No_1) and (Job_No_2 = :Job_No_2) and  (FWO_No = :FWO_No)) and '+ FiltString);
          Add('Order by Fwo_No,Job_Cost_Cat');
        end;
        Open;
      end;
      with quRepFwoItem  do
      begin
        if Active then
          Close;
        with sql do
        begin
          Clear;
          Add('Select  JOB_NO_1,JOB_NO_2,FWO_NO,ITEM_NO,ITEM_UNIT,SUM(DETAIL_QTY) AS DETAIL_QTY,SUM(DETAIL_AMT) AS DETAIL_AMT');
          Add('From JOB_DETAIL');
          Add('where job_no_1 = :Job_No_1  and Job_No_2 = :Job_No_2 and  FWO_No = :FWO_No  and '+ FiltString);
          Add('Group by JOB_NO_1,JOB_NO_2,FWO_NO,ITEM_NO,ITEM_UNIT');
          Add('Order by JOB_NO_1,JOB_NO_2,FWO_NO,ITEM_NO,ITEM_UNIT');
        end;
        Open;
      end;
    end;
    if Not cbPtItem.Checked then
    begin
      qrsdItem.Height := 0 ;
      qrbItem.Height := 0;
      qrbItemTotal.Height := 0;
      qreItemTot.Frame.DrawTop := False;
      qrlItemTot.Caption := '';
    end else
    begin
      qrsdItem.Height := 23;
      qrbItem.Height := 23;
      qrbItemTotal.Height := 23;
      qreItemTot.Frame.DrawTop := True;
      qrlItemTot.Caption := '項目小計';
    end;
    qrlcompany.Caption := wCompanyName;
    qrlUsers.Caption := wUserID;
    qrRepCat.Prepare;
    qrRepCat.Preview;
   with quSelJobNo do
      if Active then Close;
    with dmJCFWO do
    begin
      with quRepFWOCost do
        if  Active then
          Close;
      with quRepFwoItem do
        if Active then
          Close;
    end;
    guProcess.Visible := false;
  end ;
  buttonLockCal;
end;


procedure TfmPtFwoCat.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  btnPrint.Enabled := False;
  sbtotal.Panels[1].Text := '0 (個)';
  sbtotal.Panels[3].Text := '0 (個)';
end;

procedure TfmPtFwoCat.FormShow(Sender: TObject);
begin
  jobno1 := '';
  jobno2 := '';
  with dmJCFWO do
  begin
    with quGetJobToRep do
      if Not Active then
        Open;
    with quRepSelFwoSub do
      if Not Active then
        Open;
    with quRepSelSubFwo do
      if Not Active then
        Open;
  end;
//  buttonLockCal ;
end;

procedure ButtonLockCal;
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

procedure CloseUp;
var TempFilt,StartSub,StartFwo :  String;
begin
  with fmPtFwoCat do
  if (Trim(dblcSelJob.Text) <> '') then
  begin
    lbChoseData.Clear;
    FiltString := '';
    if ((Trim(dblcStartFwoNo.Text) <> '')
      and (Trim(dblcStartSub.Text)<>'')
      and (Trim(dblcEndFwoNo.Text)<>'')
      and (Trim(dblcEndSub.Text)<>'')) then
    begin
      if (dblcStartFwoNo.Text > dblcEndFwoNo.Text) then
      begin
        StartFwo := dblcEndFwoNo.Text;
        dblcEndFwoNo.Text := dblcStartFwoNo.Text;
        dblcStartFwoNo.Text := StartFwo;
      end;
      if dblcStartSub.Text > dblcStartSub.Text then
      begin
        StartSub := dblcEndFwoNo.Text;
        dblcEndFwoNo.Text := dblcStartSub.Text;
        dblcStartFwoNo.Text := StartSub;
      end;
      FiltString := '((SUB_JOB_NO >= '''
                 +Trim(dblcStartSub.Text)
                 + ''') AND (SUB_JOB_NO <= '''
                 + Trim(dblcEndSub.Text)
                 +''') AND (FWO_NO >= '''
                 + Trim(dblcStartFwoNo.Text)
                 +''') AND  (FWO_NO <='''
                 +Trim(dblcEndFwoNo.Text)
                 +'''))';
    end
    else
    begin
      if (((Trim(dblcStartSub.Text)<>'')
        and (Trim(dblcEndSub.Text)<>''))
        and ( (Trim(dblcStartFwoNo.Text) = '')
        or (Trim(dblcEndFwoNo.Text)=''))) then
      begin
        FiltString := '((SUB_JOB_NO >= '''
                 +Trim(dblcStartSub.Text)
                 + ''') AND (SUB_JOB_NO <= '''
                 + Trim(dblcEndSub.Text)
                 +'''))';

      end;
      if ((Trim(dblcStartFwoNo.Text) <> '')
        and (Trim(dblcEndSub.Text)='')
        and (Trim(dblcStartSub.Text)='')
        and (Trim(dblcEndFwoNo.Text)<>'')) then
      begin
        if dblcStartFwoNo.Text > dblcEndFwoNo.Text then
        begin
          StartFwo := dblcEndFwoNo.Text;
          dblcEndFwoNo.Text := dblcStartFwoNo.Text;
          dblcStartFwoNo.Text := StartFwo;
        end;
        FiltString := '((FWO_NO >= '''
                 + Trim(dblcStartFwoNo.Text)
                 +''') AND (FWO_NO <='''
                 +Trim(dblcEndFwoNo.Text)
                 +'''))';
      end;
      if  ((Trim(dblcStartFwoNo.Text) = '')
          and (Trim(dblcStartSub.Text)='')
          and (Trim(dblcEndFwoNo.Text)<>'')
          and (Trim(dblcEndSub.Text)<>'')) then
      begin
        FiltString := '((SUB_JOB_NO <= '''
                 + Trim(dblcEndSub.Text)
                 +''') AND (FWO_NO <='''
                 +Trim(dblcEndFwoNo.Text)
                 +'''))';
      end;
      if  ((Trim(dblcStartFwoNo.Text) <> '')
          and (Trim(dblcStartSub.Text)<>'')
          and (Trim(dblcEndFwoNo.Text)='')
          and (Trim(dblcEndSub.Text)='')) then
      begin
        FiltString := '((SUB_JOB_NO >= '''
                 +Trim(dblcStartSub.Text)
                 + ''') AND (FWO_NO >= '''
                 + Trim(dblcStartFwoNo.Text)
                 +'''))';
      end;
      if ((Trim(dblcStartFwoNo.Text) <> '')
        and (Trim(dblcStartSub.Text)='')
        and (Trim(dblcEndFwoNo.Text)='')
        and (Trim(dblcEndSub.Text)='')) then
      begin
        FiltString := '(FWO_NO >= '''
                 + Trim(dblcStartFwoNo.Text)
                 +''')';
      end;
      if ((Trim(dblcStartFwoNo.Text) = '')
        and (Trim(dblcStartSub.Text)<>'')
        and (Trim(dblcEndFwoNo.Text)='')
        and (Trim(dblcEndSub.Text)='')) then
      begin
        FiltString := '(SUB_JOB_NO >= '''
                 +Trim(dblcStartSub.Text)
                 +''')';
      end;
      if ((Trim(dblcStartFwoNo.Text) = '')
        and (Trim(dblcStartSub.Text)='')
        and (Trim(dblcEndFwoNo.Text)<>'')
        and (Trim(dblcEndSub.Text)='')) then
      begin
        FiltString :='(FWO_NO <='''
                 +Trim(dblcEndFwoNo.Text)
                 +''')';
      end;
      if ((Trim(dblcStartFwoNo.Text) = '')
        and (Trim(dblcStartSub.Text)='')
        and (Trim(dblcEndFwoNo.Text)='')
        and (Trim(dblcEndSub.Text)<>'')) then
      begin
        FiltString := '(SUB_JOB_NO <= '''
                 + Trim(dblcEndSub.Text)
                 +''')';
      end;
      if ((Trim(dblcStartFwoNo.Text) = '')
          and (Trim(dblcStartSub.Text)='')
          and (Trim(dblcEndFwoNo.Text)='')
          and (Trim(dblcEndSub.Text)='')) then
      begin
        ShowMessage('不能得到數据');
        MessageBeep(MB_OK);
        Abort;
      end;
    end;
//    ShowMessage(FiltString);
    with dmJCFWO do
    begin
      with quRepGetFwo do
      begin
        if Active then
          Close;
        with sql do
        begin
          Clear;
          add('SELECT * FROM Job_Fwo');
          add('where ((job_no_1 = :job_no_1) and  (job_no_2 = :job_no_2)) and '+ FiltString);
        end;
        Open;
        if Not IsEmpty then
        begin
          First ;
          TempFilt :='';
          repeat
            TempFilt := '(Fwo_No ='''+quRepGetFwoFWO_NO.AsString + ''') or '+ TempFilt;
            Next;
          until eof;
          TempFilt := '(' +Trim(copy(TempFilt,1,length(TempFilt)-4))+')';
//          ShowMessage(TempFilt);
//          Abort;
          with quRepGetJobCostCat do
          begin
            if Active then
              Close;
            with sql do
            begin
              Clear;
              Add('SELECT distinct job_cost_cat ,job_no_1,job_no_2');
              add('FROM fwo_cost_cat');
              add('where ((job_no_1 = :job_no_1)  and  (job_no_2 = :job_no_2)) and '+TempFilt);
              Add('Order by job_cost_cat ');
            end;
            Open;
            if Not IsEmpty then
            begin
              First;
              repeat
                lbChoseData.Items.Add(quRepGetJobCostCatJOB_COST_CAT.AsString);
                Next;
              until eof;
              Close;
            end;
          end;
        end else
          ShowMessage('無選擇數据');
        Close;
        if lbGetData.Items.Count > 0 then
          lbGetData.Clear;
      end;
    end;
  end else
    ShowMessage('未選取工程');
  ButtonLockCal ;
end;


procedure TfmPtFwoCat.dblcEndFwoNoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
//    if (Trim(dblcEndSub.Text) <> '') then
    CloseUp;
  end;
end;

procedure TfmPtFwoCat.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with dmJCFWO do
  begin
    with quGetJobToRep do
      if Active then
        Close;
    with quRepSelFwoSub do
      if Active then
        Close;
    with quRepSelSubFwo do
      if Active then
        Close;
  end;
end;

procedure TfmPtFwoCat.dblcEndSubCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
//  if (Trim(dblcEndSub.Text) <> '') then
    CloseUp;
end;

procedure TfmPtFwoCat.dblcSelJobCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (trim(dblcSelJob.Text) <> '') then
  begin
    dblcStartFwoNo.Enabled := True;
    dblcStartSub.Enabled := True;
  end else
  begin
    dblcStartFwoNo.Enabled := False;
    dblcStartSub.Enabled := False;
  end;
end;

procedure TfmPtFwoCat.dblcStartSubCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (Trim(dblcStartSub.Text) <> '') then
    dblcEndSub.Enabled := true
  else
    dblcEndSub.Enabled := false;
  CloseUp;
end;

procedure TfmPtFwoCat.dblcStartFwoNoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (trim(dblcStartFwoNo.Text) <>'') then
    dblcEndFwoNo.Enabled := true
  else
    dblcEndFwoNo.Enabled := False;
end;

procedure TfmPtFwoCat.QRExpr2Print(sender: TObject; var Value: String);
begin
  if Value <>'' then
    Value := CurrencyString + Value;
end;

procedure TfmPtFwoCat.qreItemTotPrint(sender: TObject; var Value: String);
begin
  if Not cbPtItem.Checked then
    Value := '';
  if Value <>'' then
    Value := CurrencyString + Value;
end;

end.
