unit EveryPrd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, ExtCtrls, Gauges, Db,
  DBTables, Wwdatsrc, Wwquery, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook,
  quickrpt, Qrctrls,clipbrd, TestPrg;

type
  TfmEveryPrd = class(TForm)
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
    laDevelop: TLabel;
    dblcDevelop: TwwDBLookupCombo;
    laReceiveDate: TLabel;
    dtpComplete: TDateTimePicker;
    quSeleCat: TwwQuery;
    quCostCat: TwwQuery;
    quCostCatJOB_COST_CAT: TStringField;
    quSeleCatPRODUCTION_CAT: TStringField;
    quSeleCatDESCRIPTION: TStringField;
    rgLine: TRadioGroup;
    quCostCatDESCRIPTION: TStringField;
    procedure btnRightClick(Sender: TObject);
    procedure btnRightAllClick(Sender: TObject);
    procedure btnLeftClick(Sender: TObject);
    procedure btnLeftAllClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonLockCal;
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure dblcDevelopChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEveryPrd: TfmEveryPrd;

implementation

uses RepFwoDm, RpPdEvey,RpPdStat;

{$R *.DFM}

procedure TfmEveryPrd.btnRightClick(Sender: TObject);
begin
  if (lbChoseData.Items.Count >0) and (lbGetData.Items.Count <4)  then
  begin
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  end;
  buttonlockCal;
end;

procedure TfmEveryPrd.btnRightAllClick(Sender: TObject);
begin
  if lbChoseData.Items.Count >0  then
  repeat
    lbGetData.Items.Add(lbChoseData.Items.Strings[lbChoseData.itemindex] );
    lbChoseData.Items.delete(lbChoseData.itemindex);
  until
    lbGetData.Items.Count =4;
  buttonlockCal;
end;

procedure TfmEveryPrd.btnLeftClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  begin
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  end;
  buttonlockCal;
end;

procedure TfmEveryPrd.btnLeftAllClick(Sender: TObject);
begin
  if lbGetData.Items.Count >0  then
  repeat
    lbChoseData.Items.Add(lbGetData.Items.Strings[lbGetData.itemindex] );
    lbGetData.Items.delete(lbGetData.itemindex);
  until
    lbGetData.Items.Count =0;
  buttonlockCal;
end;

procedure TfmEveryPrd.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfmEveryPrd.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  dtpComplete.Date := Date;
  sbtotal.Panels[1].Text := '0 (個)';
  sbtotal.Panels[3].Text := '0 (個)';
end;

procedure TfmEveryPrd.ButtonLockCal;
begin
  if ((lbGetData.Items.Count + lbChoseData.Items.Count) > 0) then
  begin
    if ((lbGetData.Items.Count >= 0) and (lbGetData.Items.Count <=3)) then
    begin
      lbChoseData.Enabled := True;
      btnRight.Enabled := True;
      btnRightAll.Enabled := True;
    end else
    begin
      lbChoseData.Enabled := False;
      btnRight.Enabled := False;
      btnRightAll.Enabled := False;
    end;
    if (lbGetData.Items.Count <> 0) then
    begin
      btnLeft.Enabled := True;
      btnLeftAll.Enabled := True;
      btnPrint.Enabled := True;
    end else
    begin
      btnLeft.Enabled := False;
      btnLeftAll.Enabled := False;
      btnPrint.Enabled := False;
    end;
  end else
  begin
    btnLeft.Enabled := False;
    btnLeftAll.Enabled := False;
    btnPrint.Enabled := False;
    lbChoseData.Enabled := False;
    btnRight.Enabled := false;
    btnRightAll.Enabled := false;
    lbGetData.Enabled := False;
  end;
  sbtotal.Panels[1].Text := inttostr(lbChoseData.Items.Count) + '(個)';
  sbtotal.Panels[3].Text := inttostr(lbGetData.Items.Count) + '(個)';
  fmEveryPrd.Refresh;
end;

procedure TfmEveryPrd.QRExpr2Print(sender: TObject; var Value: String);
begin
  if Value <>'' then
    Value := CurrencyString + Value;
end;

procedure TfmEveryPrd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quSeleCat do
    if Active then
      Close;
end;

procedure TfmEveryPrd.FormShow(Sender: TObject);
begin
  with quSeleCat do
    if Not Active then
      Open;
end;

procedure TfmEveryPrd.btnPrintClick(Sender: TObject);
var i : Integer;
begin
  if lbGetData.Items.Count >0 then
  begin
    if (laReceiveDate.Caption = '收單日期') then
    begin
      with dmRepFwo do
      begin
        with  quRepDailyReceive do
        begin
          if Active then
            Close;
          ParamByName('iJOB_COST_CAT_1').AsString := lbGetData.Items.Strings[0];
          if lbGetData.Items.Count >=2 then
            ParamByName('iJOB_COST_CAT_2').AsString := lbGetData.Items.Strings[1]
          else
            ParamByName('iJOB_COST_CAT_2').AsString := '';
          if lbGetData.Items.Count >=3 then
            ParamByName('iJOB_COST_CAT_3').AsString := lbGetData.Items.Strings[2]
          else
            ParamByName('iJOB_COST_CAT_3').AsString := '';
          if lbGetData.Items.Count >=4 then
            ParamByName('iJOB_COST_CAT_4').AsString := lbGetData.Items.Strings[3]
          else
            ParamByName('iJOB_COST_CAT_4').AsString := '';
          ParamByName('iFINISH_DATE').AsDate := dtpComplete.Date;
          Open;
        end;
      end;
      Application.CreateForm(TfmRpPdEvey,fmRpPdEvey);
      with fmRpPdEvey do
      begin
        if rgLine.ItemIndex = 0 then
        begin
          qrdbtFwoNo.Frame.Style := psSolid;
          qrdbtFwoDesc.Frame.Style := psSolid;
          qrdbtFinishDate.Frame.Style := psSolid;
          qrlFinishFlg.Frame.Style := psSolid;
          qrdbtLastDate.Frame.Style := psSolid;
          qrdbtProdDate.Frame.Style := psSolid;
          qrdbtOrderDate.Frame.Style := psSolid;
          qrdbtOrderBy.Frame.Style := psSolid;
          qrdbtCompleteDate.Frame.Style := psSolid;
          qrdbtReceiveDate.Frame.Style := psSolid;
          qrlComment.Frame.Style := psSolid;
          qrdbtReceiveDate4.Frame.Style := psSolid;
          qrdbtQty.Frame.Style := psSolid;
          qrlFoot1.Frame.Style := psSolid;
        end else
        begin
          qrdbtFwoNo.Frame.Style := psClear;
          qrdbtFwoDesc.Frame.Style := psClear;
          qrdbtFinishDate.Frame.Style := psClear;
          qrlFinishFlg.Frame.Style := psClear;
          qrdbtLastDate.Frame.Style := psClear;
          qrdbtProdDate.Frame.Style := psClear;
          qrdbtOrderDate.Frame.Style := psClear;
          qrdbtOrderBy.Frame.Style := psClear;
          qrdbtCompleteDate.Frame.Style := psClear;
          qrdbtReceiveDate.Frame.Style := psClear;
          qrdbtReceiveDate4.Frame.Style := psClear;
          qrlComment.Frame.Style := psClear;
          qrdbtQty.Frame.Style := psClear;
          qrlFoot1.Frame.Style := psClear;
        end;
        qrlUserName.Caption := wUserID;
        qrlcompany.Caption := wCompanyName;
        qrlSeleDate.Caption := '收單日期 :'+ DateToStr(dtpComplete.Date);        
        qrlCostCat.Caption := ' ';
        qrlCostCat2.Caption := ' ';
        qrlCostCat3.Caption := ' ';
        qrlCostCat4.Caption := ' ';
        For i := 0 to lbGetData.Items.Count-1 do
        begin
          with quCostCat do
          begin
            if Active then
              Close;
            with Sql do
            begin
              Clear;
              Add(' select job_cost_cat ,description ');
              Add(' from Job_Cost_File ');
              Add(' where PRODUCTION_CAT = :PRODUCTION_CAT ');
              Add(' and  job_cost_cat = "' + lbGetData.Items.Strings[i] + '"');
              Add(' order by job_Cost_Cat ');
            end;
            ParamByName('PRODUCTION_CAT').AsString := dblcDevelop.Text;
            Open;
            if i = 0 then
              qrlCostCat.Caption := copy(Trim(quCostCatDESCRIPTION.AsString),1,4);
            if i = 1 then
              qrlCostCat2.Caption := copy(Trim(quCostCatDESCRIPTION.AsString),1,4);
            if i = 2 then
              qrlCostCat3.Caption := copy(Trim(quCostCatDESCRIPTION.AsString),1,4);
            if i = 3 then
              qrlCostCat4.Caption := copy(Trim(quCostCatDESCRIPTION.AsString),1,4);
            Close;
          end;
        end;
        Try
          qrProdEvey.Prepare;
          qrProdEvey.Preview;
        finally
          Release;
        end;
      end;
      with dmRepFwo do
      begin
        with  quRepDailyReceive do
        begin
          if Active then
            Close;
        end;
      end;
    end else
    begin
      with dmRepFwo do
      begin
        with  quRepProdStatus do
        begin
          if Active then
            Close;
          ParamByName('iJOB_COST_CAT_1').AsString := lbGetData.Items.Strings[0];
          if lbGetData.Items.Count >=2 then
            ParamByName('iJOB_COST_CAT_2').AsString := lbGetData.Items.Strings[1]
          else
            ParamByName('iJOB_COST_CAT_2').AsString := '';
          if lbGetData.Items.Count >=3 then
            ParamByName('iJOB_COST_CAT_3').AsString := lbGetData.Items.Strings[2]
          else
            ParamByName('iJOB_COST_CAT_3').AsString := '';
          if lbGetData.Items.Count >=4 then
            ParamByName('iJOB_COST_CAT_4').AsString := lbGetData.Items.Strings[3]
          else
            ParamByName('iJOB_COST_CAT_4').AsString := '';
          ParamByName('iDate').AsDate := dtpComplete.Date;
          Open;
        end;
      end;
      Application.CreateForm(TfmRpPdStat,fmRpPdStat);
      with fmRpPdStat do
      begin
        if rgLine.ItemIndex = 0 then
        begin
          qrdbtFwoNo.Frame.Style := psSolid;
          qrdbtFwoDesc.Frame.Style := psSolid;
          qrdbtReceiveDate1.Frame.Style := psSolid;
          qrdbtReceiveDate2.Frame.Style := psSolid;
          qrdbtReceiveDate3.Frame.Style := psSolid;
          qrdbtReceiveDate4.Frame.Style := psSolid;
          qrdbtLastDate1.Frame.Style := psSolid;
          qrdbtLastDate2.Frame.Style := psSolid;
          qrdbtLastDate3.Frame.Style := psSolid;
          qrdbtLastDate4.Frame.Style := psSolid;
          qrdbtProdStartDate1.Frame.Style := psSolid;
          qrdbtProdStartDate2.Frame.Style := psSolid;
          qrdbtProdStartDate3.Frame.Style := psSolid;
          qrdbtProdStartDate4.Frame.Style := psSolid;
          qrlFinishFlg.Frame.Style := psSolid;
          qrdbtCompleteDate.Frame.Style := psSolid;
          qrlComment.Frame.Style := psSolid;
          qrdbtReceiveDate4.Frame.Style := psSolid;
          qrdbtQty.Frame.Style := psSolid;
          qrlFoot1.Frame.Style := psSolid;
          qrdbtFinishDate.Frame.Style := psSolid;
        end else
        begin
          qrdbtFwoNo.Frame.Style := psClear;
          qrdbtFwoDesc.Frame.Style := psClear;
          qrdbtReceiveDate1.Frame.Style := psClear;
          qrdbtReceiveDate2.Frame.Style := psClear;
          qrdbtReceiveDate3.Frame.Style := psClear;
          qrdbtReceiveDate4.Frame.Style := psClear;
          qrdbtLastDate1.Frame.Style := psClear;
          qrdbtLastDate2.Frame.Style := psClear;
          qrdbtLastDate3.Frame.Style := psClear;
          qrdbtLastDate4.Frame.Style := psClear;
          qrdbtProdStartDate1.Frame.Style := psClear;
          qrdbtProdStartDate2.Frame.Style := psClear;
          qrdbtProdStartDate3.Frame.Style := psClear;
          qrdbtProdStartDate4.Frame.Style := psClear;
          qrlFinishFlg.Frame.Style := psClear;
          qrdbtCompleteDate.Frame.Style := psClear;
          qrlComment.Frame.Style := psClear;
          qrdbtReceiveDate4.Frame.Style := psClear;
          qrdbtQty.Frame.Style := psClear;
          qrdbtFinishDate.Frame.Style := psClear;
          qrlFoot1.Frame.Style := psClear;
        end;
        qrlUserName.Caption := wUserID;
        qrlcompany.Caption := wCompanyName;
        qrlCostCat.Caption := ' ';
        qrlCostCat2.Caption := ' ';
        qrlCostCat3.Caption := ' ';
        qrlCostCat4.Caption := ' ';
        qrlSeleDate.Caption := '選擇日期 :'+ DateToStr(dtpComplete.Date);
        For i := 0 to lbGetData.Items.Count-1 do
        begin
          with quCostCat do
          begin
            if Active then
              Close;
            with Sql do
            begin
              Clear;
              Add(' select job_cost_cat ,description ');
              Add(' from Job_Cost_File ');
              Add(' where PRODUCTION_CAT = :PRODUCTION_CAT ');
              Add(' and  job_cost_cat = "' + lbGetData.Items.Strings[i] + '"');
              Add(' order by job_Cost_Cat ');
            end;
            ParamByName('PRODUCTION_CAT').AsString := dblcDevelop.Text;
            Open;
            if i = 0 then
              qrlCostCat.Caption := copy(Trim(quCostCatDESCRIPTION.AsString),1,4) ;
            if i = 1 then
              qrlCostCat2.Caption := copy(Trim(quCostCatDESCRIPTION.AsString),1,4);
            if i = 2 then
              qrlCostCat3.Caption := copy(Trim(quCostCatDESCRIPTION.AsString),1,4);
            if i = 3 then
              qrlCostCat4.Caption := copy(Trim(quCostCatDESCRIPTION.AsString),1,4);
            Close;
          end;
        end;
        Try
          qrProdStat.Prepare;
          qrProdStat.Preview;
        finally
          Release;
        end;
      end;
      with dmRepFwo do
      begin
        with  quRepProdStatus do
        begin
          if Active then
            Close;
        end;
      end;
    end;
  end;
end;

procedure TfmEveryPrd.dblcDevelopChange(Sender: TObject);
begin
  lbChoseData.Clear;
  with quCostCat do
  begin
    if Active then
      Close;
    with Sql do
    begin
      Clear;
      Add(' select job_cost_cat ,description ');
      Add(' from Job_Cost_File ');
      Add(' where PRODUCTION_CAT = :PRODUCTION_CAT ');
      Add(' order by job_Cost_Cat ');
    end;
    ParamByName('PRODUCTION_CAT').AsString := dblcDevelop.Text;
    Open;
    if recordcount > 0 then
    begin
      First ;
      repeat
        lbChoseData.Items.Add( quCostCatJOB_COST_CAT.AsString );
        Next ;
      until eof;
      buttonlockCal;      
    end;
    Close;
  end;
end;

end.
