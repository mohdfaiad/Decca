unit PtSubCat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, ExtCtrls, Gauges, Db,
  DBTables, Wwdatsrc, Wwquery, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook,
  quickrpt,clipbrd, Qrctrls, Grids, Wwdbigrd, Wwdbgrid;

type
  TfmPtSubCat = class(TForm)
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
    qrsdCostCatSun: TQRSubDetail;
    qrdSubDetail: TQRDBText;
    qrdbtRegQty: TQRDBText;
    qrdbtAmt: TQRDBText;
    qrdbtPremAmt: TQRDBText;
    qrdbtPremQty: TQRDBText;
    gfbTotal: TQRBand;
    qrlJobTotSmal: TQRLabel;
    qreRemAmt: TQRExpr;
    qrePremAmt: TQRExpr;
    GroupHeaderBand1: TQRBand;
    cbPtAmt: TCheckBox;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrlJob_No: TQRLabel;
    qrdbtDetail: TQRDBText;
    qrlDetail: TQRLabel;
    qrlGroupHead: TQRLabel;
    QRLabel2: TQRLabel;
    qrlAmt: TQRLabel;
    QRLabel4: TQRLabel;
    qrlPremAmt: TQRLabel;
    qrbSumm: TQRBand;
    qrlJobTotTitle: TQRLabel;
    laStartSub: TLabel;
    laEndSub: TLabel;
    dblcStartSub: TwwDBLookupCombo;
    dblcEndSub: TwwDBLookupCombo;
    rgOrderBy: TRadioGroup;
    qreTotRegAmt: TQRExpr;
    qreTotPremAmt: TQRExpr;
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
    procedure qrePremAmtPrint(sender: TObject; var Value: String);
    procedure dblcSelJobNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPtSubCat: TfmPtSubCat;
  procedure ButtonLock;
  procedure CloseUp;
implementation
uses JCDataDM,
     JCmain,
     FWOdtDm, SeJobPnt, PtFwoCat;

var FiltString:String;

{$R *.DFM}

procedure TfmPtSubCat.btnRightClick(Sender: TObject);
begin
  if lbChoseData.Items.Count >0  then
  begin
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  end;
  buttonlock;
end;

procedure TfmPtSubCat.btnRightAllClick(Sender: TObject);
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

procedure TfmPtSubCat.btnLeftClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  begin
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  end;
  buttonlock;
end;

procedure TfmPtSubCat.btnLeftAllClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  repeat
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  until
    lbGetData.Items.Count =0;
  buttonlock;
end;

procedure TfmPtSubCat.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfmPtSubCat.btnPrintClick(Sender: TObject);
var FiltSubNo : String;
begin
  if lbGetData.Items.Count >0  then
  begin
    guProcess.MaxValue :=lbGetData.Items.Count;
    guProcess.Progress :=1;
    guProcess.Visible := True;
    if ((dblcStartSub.Text <> '')
      and (dblcEndSub.Text <>'')) then
    begin
      FiltSubNo := '((Sub_Job_No >='''
        +trim(dblcStartSub.Text)+''') and  (Sub_Job_No <='''
        +Trim(dblcEndSub.Text)+'''))';
    end else
    begin
      if ((dblcStartSub.Text ='')
        and (dblcEndSub.Text ='')) then
        FiltSubNo := '((Sub_Job_No =''%''';
      if ((dblcStartSub.Text <> '')
        and (dblcEndSub.Text ='')) then
        FiltSubNo := '(Sub_Job_No >='''
          +trim(dblcStartSub.Text)+''')';
      if ((dblcStartSub.Text = '')
        and (dblcEndSub.Text <>'')) then
        FiltSubNo := '(Sub_Job_No <='''
          +trim(dblcEndSub.Text)+''')';
    end;
    FiltString := '';
    repeat
      guProcess.Progress :=1 +guProcess.Progress;
      FiltString :='(SUB_JOB_COST_CAT = '
                 +''''
                 +lbGetData.Items.Strings[lbGetData.itemindex]
                 +''''
                 +') or '
                 +FiltString;
      lbGetData.Items.delete(lbGetData.itemindex);
    until lbGetData.Items.Count =0;
    FiltString := '('+Trim(copy(FiltString,1,length(FiltString)-4))+')';
    //Check AMT
    if Not cbPtAmt.Checked then
    begin
      qrdbtAmt.DataField := '';
      qrdbtPremAmt.DataField :='';
      qrlAmt.Caption := '';
      qrlPremAmt.Caption :='';
      qrbSumm.Height := 0;
      gfbTotal.Height := 0;
      qreRemAmt.Frame.DrawTop := False;
      qrePremAmt.Frame.DrawTop := False;
      qreTotRegAmt.Frame.DrawTop := False;
      qreTotPremAmt.Frame.DrawTop := False;
      qrlJobTotTitle.Caption := '';
      qrlJobTotSmal.Caption := '';
    end else
    begin
      qrdbtAmt.DataField := 'JOB_REG_AMT';
      qrdbtPremAmt.DataField :='JOB_PREM_AMT';
      qrlAmt.Caption := '金額';
      qrlPremAmt.Caption :='金額';
      qrbSumm.Height := 20;
      gfbTotal.Height := 20;
      qreRemAmt.Frame.DrawTop := True;
      qrePremAmt.Frame.DrawTop := True;
      qreTotRegAmt.Frame.DrawTop := True;
      qreTotPremAmt.Frame.DrawTop := True;
      qrlJobTotTitle.Caption := '工程總計:';
      qrlJobTotSmal.Caption := '小計:';
    end;
    if rgOrderBy.ItemIndex = 0  then
    begin
      with dmJCFWO do
      begin
        with quRepJobCostFather do
        begin
          if Active then
            Close;
          with sql do
          begin
            Clear;
            Add('Select  distinct Sub_Job_No,JOB_NO_1,JOB_NO_2');
            Add(' from Job_Cost_Cat');
            Add(' Where (((job_no_1 = :job_no_1) and (job_no_2 =:Job_No_2)) and  '+FiltSubNo+' and '+ FiltString+')');
            Add('order by  sub_job_no');
          end;
          Open;
        end;
        with quRepJobCostSon do
        begin
          if Active then
            Close;
          with sql do
          begin
            Clear;
            Add('select *');
            Add(' from Job_Cost_Cat');
            Add(' Where (((job_no_1 = :job_no_1) and (job_no_2 =:Job_No_2) and  (sub_job_no = :sub_job_no)) and ' +FiltString +')');
            Add('order by  job_no_1,job_no_2, sub_job_no');
          end;
//          DataSource := dsRepJobCostFather;
          Open;
        end;
        qrlDetail.Caption := '子工程:';
        qrlGroupHead.Caption := '子工程類別';
        qrdbtDetail.DataField := 'SUB_JOB_NO';
        qrdSubDetail.DataField :='SUB_JOB_COST_CAT';
        qrdbtDetail.DataSet := dmJCFWO.quRepJobCostFather;
        qrdSubDetail.DataSet := dmJCFWO.quRepJobCostSon;
        qrdbtRegQty.DataSet :=dmJCFWO.quRepJobCostSon;
        qrdbtPremAmt.DataSet := dmJCFWO.quRepJobCostSon;
        qrdbtAmt.DataSet := dmJCFWO.quRepJobCostSon;
        qrdbtPremQty.DataSet := dmJCFWO.quRepJobCostSon;
        qreRemAmt.Expression := 'SUM(quRepJobCostSon.JOB_REG_AMT)';
        qrePremAmt.Expression := 'SUM(quRepJobCostSon.JOB_PREM_AMT)';
        qrsdCostCatSun.DataSet := dmJCFWO.quRepJobCostSon;
        qrRepCat.DataSet := dmJCFWO.quRepJobCostFather;
        qreTotRegAmt.Expression := 'SUM(quRepJobCostSon.JOB_REG_AMT)';
        qreTotPremAmt.Expression := 'SUM(quRepJobCostSon.JOB_PREM_AMT)';
      end;
    end else
    begin
      with dmJCFWO do
      begin
        with quRepJobFatherCat do
        begin
          if Active then
            Close;
          with sql do
          begin
            Clear;
            Add('select distinct JOB_NO_1,JOB_NO_2, Sub_Job_Cost_Cat');
            Add(' from Job_Cost_Cat');
            Add(' Where (((job_no_1 = :job_no_1) and (job_no_2 =:Job_No_2)) and '+FiltSubNo+' and '+ FiltString +')');
            Add('order by  job_no_1,job_no_2, sub_Job_Cost_Cat');
          end;
          open;
        end;
        with quRepJobSunCat do
        begin
          if Active then
            Close;
          with sql do
          begin
            Clear;
            Add('select *');
            Add(' from Job_Cost_Cat');
            Add(' Where (((job_no_1 = :job_no_1) and (job_no_2 =:Job_No_2) and  (Sub_Job_Cost_Cat =:Sub_Job_Cost_Cat)) and '+ FiltSubNo+ ')');
            Add('order by  job_no_1,job_no_2, sub_job_no');
          end;
//          DataSource := dsRepJobCostFather;
          open;
        end;
        qrlDetail.Caption := '子工程類別:';
        qrlGroupHead.Caption := '子工程';
        qrdbtDetail.DataField := 'SUB_JOB_COST_CAT';
        qrdSubDetail.DataField :='SUB_JOB_NO';
        qrdbtDetail.DataSet := dmJCFWO.quRepJobFatherCat;
        qrdSubDetail.DataSet := dmJCFWO.quRepJobSunCat;
        qrdbtRegQty.DataSet :=dmJCFWO.quRepJobSunCat;
        qrdbtPremAmt.DataSet := dmJCFWO.quRepJobSunCat;
        qrdbtAmt.DataSet := dmJCFWO.quRepJobSunCat;
        qrdbtPremQty.DataSet := dmJCFWO.quRepJobSunCat;
        qreRemAmt.Expression := 'SUM(quRepJobSunCat.JOB_REG_AMT)';
        qrePremAmt.Expression := 'SUM(quRepJobSunCat.JOB_PREM_AMT)';
        qrsdCostCatSun.DataSet := dmJCFWO.quRepJobSunCat;
        qrRepCat.DataSet := dmJCFWO.quRepJobFatherCat;
        qreTotRegAmt.Expression := 'SUM(quRepJobSunCat.JOB_REG_AMT)';
        qreTotPremAmt.Expression := 'SUM(quRepJobSunCat.JOB_PREM_AMT)';
      end;
    end;
    qrlcompany.Caption := wCompanyName;
    qrlUsers.Caption := wUserID;
    qrRepCat.Prepare;
    qrRepCat.Preview;
    with dmJCFWO do
    begin
      with quRepJobCostSon do
        if Active then
          Close;
      with quRepJobCostFather do
        if Active then
          Close;
    end;
    guProcess.Visible := false;
  end ;
  buttonLock;
end;


procedure TfmPtSubCat.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  btnPrint.Enabled := False;
  sbtotal.Panels[1].Text := '0 (個)';
  sbtotal.Panels[3].Text := '0 (個)';
end;

procedure TfmPtSubCat.FormShow(Sender: TObject);
begin
  jobno1 := '';
  jobno2 := '';
  with dmJCFWO do
  begin
    with quGetJobToRep do
      if Not Active then
        Open;
    with quRepGetSubNo do
      if Not Active then
        Open;
  end;
end;

procedure ButtonLock;
begin
  with fmPtSubCat do
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
var TempFilt :String;
begin
  with fmPtSubCat do
  if (Trim(dblcSelJob.Text) <> '') then
  begin
    lbChoseData.Clear;
    FiltString := '';
    if ((Trim(dblcStartSub.Text)<>'')
      and (Trim(dblcEndSub.Text)<>'')) then
      FiltString := '((SUB_JOB_NO >= '
                 +''''
                 +Trim(dblcStartSub.Text)
                 +''''
                 + ') AND ('
                 +'SUB_JOB_NO <= '
                 +''''
                 + Trim(dblcEndSub.Text)
                 +''''
                 +'))'
    else
    begin
      if ((Trim(dblcStartSub.Text)<>'')
        and (Trim(dblcEndSub.Text)='')) then
        FiltString := '(SUB_JOB_NO >= '
                 +''''
                 +Trim(dblcStartSub.Text)
                 +'''' +')';
      if ((Trim(dblcStartSub.Text)='')
        and (Trim(dblcEndSub.Text)<>'')) then
        FiltString := '(SUB_JOB_NO <= '
                 +''''
                 + Trim(dblcEndSub.Text)
                 +''''
                 +')';
      if ((Trim(dblcStartSub.Text)='')
        and (Trim(dblcEndSub.Text)='')) then
      begin
        ShowMessage('不能得到數据');
        MessageBeep(MB_OK);
        Abort;
      end;
    end;
    with dmJCFWO do
    begin
      with quRepGetFwo do
      begin
        if Active then
          Close;
        if Filtered  then
          Filtered := False;
        Filter := FiltString;
        Filtered := True;
        Open;
        if Not IsEmpty then
        begin
          First ;
          TempFilt :='';
          repeat
            TempFilt := '(Fwo_No =' +''''+quRepGetFwoFWO_NO.AsString +''''+ ') or '+ TempFilt;
            Next;
          until eof;
          TempFilt := Trim(copy(TempFilt,1,length(TempFilt)-4));
          TempFilt := '(' + TempFilt+')';
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
        Filtered := False;
        Filter := '';
        if lbGetData.Items.Count > 0 then
          lbGetData.Clear;
      end;
    end;
  end else
    ShowMessage('未選取工程');
  ButtonLock;
end;


procedure TfmPtSubCat.dblcEndFwoNoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
     CloseUp;
end;

procedure TfmPtSubCat.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with dmJCFWO do
  begin
    with quGetJobToRep do
      if Active then
        Close;
    with quRepGetSubNo do
      if Active then
        Close;
  end;
end;

procedure TfmPtSubCat.dblcEndSubCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  CloseUp;
end;

procedure TfmPtSubCat.dblcSelJobCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (Trim(dblcSelJob.Text) <> '') then
  begin
    dblcStartSub.Enabled := True;
    dblcEndSub.Enabled := True;
  end
  else
  begin
    dblcStartSub.Enabled := False;
    dblcEndSub.Enabled := False;
  end;
end;

procedure TfmPtSubCat.dblcStartSubCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (Trim(dblcStartSub.Text) <> '') then
  begin
    dblcEndSub.Enabled := True;
    CloseUp;
  end
  else
    dblcEndSub.Enabled :=False;
end;

procedure TfmPtSubCat.qrePremAmtPrint(sender: TObject; var Value: String);
begin
  if Not cbPtAmt.Checked then
     Value :='';
  if Value <> '' then
    Value := CurrencyString + Value;
end;

procedure TfmPtSubCat.dblcSelJobNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  MessageBeep(MB_OK);
  ShowMessage('未選取工程');
end;

end.
