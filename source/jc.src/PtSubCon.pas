unit PtSubCon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, ExtCtrls, Gauges, Db,
  DBTables, Wwdatsrc, Wwquery, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook,
  quickrpt, Qrctrls;

type
  TfmPtSubCon = class(TForm)
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
    qrRepContract: TQuickRep;
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
    gfbTotal: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    rgOrderBy: TRadioGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrlJob_No: TQRLabel;
    qrdSubNo: TQRDBText;
    qrbSubTitle: TQRBand;
    qrlContractNo: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrsdContract: TQRSubDetail;
    qrdContractNo: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    qrlSubJob: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
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
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPtSubCon: TfmPtSubCon;
    procedure lockButton;
implementation
uses JCDataDM,
     JCmain,
     FWOdtDm,
     SeJobPnt;
var jobno1,
    jobno2 : String;

{$R *.DFM}

procedure TfmPtSubCon.btnRightClick(Sender: TObject);
begin
  if lbChoseData.Items.Count >0  then
  begin
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  end;
  lockButton;
end;

procedure TfmPtSubCon.btnRightAllClick(Sender: TObject);
begin
  if lbChoseData.Items.Count >0  then
  repeat
    guProcess.Progress := 0 ;
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  until
    lbChoseData.Items.Count =0;
  lockButton;
end;

procedure CloseUp;
begin
  with fmPtSubCon do
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
end;

procedure TfmPtSubCon.btnLeftClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  begin
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  end;
  lockButton;
end;

procedure TfmPtSubCon.btnLeftAllClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  repeat
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  until
    lbGetData.Items.Count =0;
  lockButton;
end;

procedure TfmPtSubCon.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfmPtSubCon.btnPrintClick(Sender: TObject);
var FiltString : String;
begin
  if lbGetData.Items.Count >0  then
  begin
    guProcess.MaxValue :=lbGetData.Items.Count;
    guProcess.Progress :=1;
    guProcess.Visible := True;
    FiltString :='';
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
      if rgOrderBy.ItemIndex = 0 then
      begin
         with quRepContractFather do
         begin
           if Active then
             Close;
           with sql do
           begin
             Clear;
             add('Select Job_No_1,Job_No_2,Sub_Job_No as SortName,Description');
             add('From Sub_Job_File');
             Add('where ((Job_No_1 = :Job_No_1) and (Job_No_2 = :Job_No_2)) and '+ FiltString);
             add('order by Sub_Job_No');
           end;
           quRepContractFatherSORTNAME.DisplayWidth := 4;
           quRepContractFatherSORTNAME.Size:= 4;
           Open;
         end;
         with quRepContractaSon do
         begin
           if Active then
             Close;
           with sql do
           begin
             Clear;
             add('Select Job_No_1,Job_No_2,SubContract_No As SortSubName,'
                +'Contract_Title as Description ,Vendor_No,Contract_Sum,'
                +'Retention_Amt,WorkDone_Amt,Paid_Amt' );
             add('From SubContract');
             add('where ((Job_No_1 = :Job_No_1) and (Job_No_2 = :Job_No_2) and (Sub_Job_No =:SortName)) and '+FiltString );
             add('Order by Sub_job_No,SubContract_No');
           end;
           quRepContractaSonSORTSUBNAME.DisplayWidth := 10;
           quRepContractaSonSORTSUBNAME.Size := 10;
           Open;
         end;
         qrlSubJob.Caption := '子工程';
         qrlContractNo.Caption := '外判編號';
      end else
      begin
         with quRepContractFather do
         begin
           if Active then
             Close;
           with sql do
           begin
             Clear;
             add('Select Job_No_1,Job_No_2,SubContract_No as SortName,Contract_Title as Description');
             add('From SubContract');
             Add('where ((Job_No_1 = :Job_No_1) and (Job_No_2 = :Job_No_2)) and '+ FiltString);
             add(' order by SubContract_No');
//             FieldByName('SortName').;
           end;
           quRepContractFatherSORTNAME.DisplayWidth := 10;
           quRepContractFatherSORTNAME.Size:= 10;
           Open;
         end;
         with quRepContractaSon do
         begin
           if Active then
             Close;
           with sql do
           begin
             Clear;
             add('Select Distinct SC.Job_No_1,SC.Job_No_2,SC.Sub_Job_No as SortSubName,'
                +'SJF.Description as Description ,SC.Vendor_No,SC.Contract_Sum,'
                +'SC.Retention_Amt,SC.WorkDone_Amt,SC.Paid_Amt' );
             add('From SubContract SC,Sub_Job_File SJF');
             add('where (((SC.Job_No_1 = :Job_No_1) and (SC.Job_No_2 = :Job_No_2)) and '
               +'((SJF.Job_No_1 = SC.Job_No_1) and (SJF.Job_No_2 = SC.Job_No_2) and (SJF.Sub_Job_No = SC.Sub_Job_No))'
               +' and (SC.SubContract_No =:SortName)) and ' + FiltString);
             add('Order by Sub_job_No');
           end;
           quRepContractaSonSORTSUBNAME.DisplayWidth := 4;
           quRepContractaSonSORTSUBNAME.Size := 4;
           Open;
         end;
        qrlSubJob.Caption := '外判編號';
        qrlContractNo.Caption := '子工程';
      end;
    end;
    qrlcompany.Caption := wCompanyName;
    qrlUsers.Caption := wUserID;
    qrRepContract.Prepare;
    qrRepContract.Preview;
    guProcess.Visible := false;
    with dmJCFWO do
    begin
      quRepContractaSon.Close;
      quRepContractFather.Close;
    end;
  end;
  lockButton;
end;


procedure TfmPtSubCon.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  btnPrint.Enabled := False;
  sbtotal.Panels[1].Text := '0 (個)';
  sbtotal.Panels[3].Text := '0 (個)';
end;

procedure TfmPtSubCon.dblcSelJobKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if trim(dblcSelJob.Text)<> '' then
      CloseUp;
    lockButton;
  end;
end;


procedure TfmPtSubCon.FormShow(Sender: TObject);
begin
  jobno1 := '';
  jobno2 := '';
  with dmJCFWO do
  begin
    with quGetJobToRep do
      if Not Active then
        Open;
    with quRepSubDescr do
      if Not Active  then
        Open;
  end;
end;

procedure TfmPtSubCon.dblcSelJobCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if trim(dblcSelJob.Text)<> '' then
    CloseUp;
  lockButton;
end;

procedure TfmPtSubCon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCFWO do
  begin
    with quRepSeleJob do
      if Active then
        Close;
    with quGetJobToRep do
      if Active then
        Close;
    with quGetJobToSubRep do
      if Active then
        Close;
    with quRepSubDescr do
      if Active  then
        Close;
  end;
end;

procedure Lockbutton;
begin
  with fmPtSubCon do
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

procedure TfmPtSubCon.QRExpr1Print(sender: TObject; var Value: String);
begin
  if Value <> '' then
    Value := CurrencyString + Value;
end;

procedure TfmPtSubCon.QRExpr2Print(sender: TObject; var Value: String);
begin
  if Value <> '' then
    Value := CurrencyString + Value;
end;

procedure TfmPtSubCon.QRExpr3Print(sender: TObject; var Value: String);
begin
  if Value <> '' then
    Value := CurrencyString + Value;
end;

procedure TfmPtSubCon.QRExpr4Print(sender: TObject; var Value: String);
begin
  if Value <> '' then
    Value := CurrencyString + Value;
end;

end.
