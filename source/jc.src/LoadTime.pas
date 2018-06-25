unit LoadTime;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Wwquery, DBTables, Db, Gauges;

type
  TfmLoadTime = class(TForm)
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    quJobDtl: TQuery;
    usJobDtl: TUpdateSQL;
    quImpCost: TwwQuery;
    quJobCostFile: TQuery;
    quUpdateHist: TQuery;
    quJobDtlJOB_NO_1: TStringField;
    quJobDtlJOB_NO_2: TStringField;
    quJobDtlFWO_NO: TStringField;
    quJobDtlJOB_COST_CAT: TStringField;
    quJobDtlSUB_JOB_NO: TStringField;
    quJobDtlHIST_DATE: TDateTimeField;
    quJobDtlSITE_NO: TIntegerField;
    quJobDtlHIST_SEQ: TDateTimeField;
    quJobDtlDOC_NO: TStringField;
    quJobDtlDETAIL_TYPE: TStringField;
    quJobDtlDETAIL_AMT: TBCDField;
    quJobDtlRETAIN_AMT: TBCDField;
    quJobDtlDETAIL_QTY: TBCDField;
    quJobDtlITEM_NO: TStringField;
    quJobDtlWHS_CODE: TStringField;
    quJobDtlITEM_UNIT_COST: TBCDField;
    quJobDtlITEM_UNIT: TStringField;
    quJobDtlINVC_NO: TStringField;
    quJobDtlINVC_DATE: TDateTimeField;
    quJobDtlCHQ_NO: TStringField;
    quJobDtlCHQ_DATE: TDateTimeField;
    quJobDtlUSER_ID: TStringField;
    quJobDtlACCT_NO: TStringField;
    quJobDtlPFT_CTR_1: TStringField;
    quJobDtlPFT_CTR_2: TStringField;
    quJobDtlCOMMENT: TMemoField;
    quJobDtlQTY_TYPE: TStringField;
    quJobCostFileJOB_COST_CAT: TStringField;
    quJobCostFileDESCRIPTION: TStringField;
    quJobCostFileJOB_COST_TYPE: TStringField;
    quJobCostFileJOB_COST_CAT_UNIT: TStringField;
    quJobCostFileREG_RATE: TBCDField;
    quJobCostFilePREM_RATE: TBCDField;
    quImpCostJOB_NO_1: TStringField;
    quImpCostJOB_NO_2: TStringField;
    quImpCostFWO_NO: TStringField;
    quImpCostJOB_COST_CAT_FLD: TStringField;
    quImpCostWORK_DATE: TDateTimeField;
    quImpCostWORK_HOURS: TBCDField;
    quImpCostWORK_TYPE: TStringField;
    gaLoadTime: TGauge;
    procedure FormCreate(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLoadTime: TfmLoadTime;

implementation
uses JcMain, JcDatadm;
{$R *.DFM}

procedure TfmLoadTime.FormCreate(Sender: TObject);
begin
  Caption := wCompanyName + ' == ' + Caption;
  dtpStartDate.Date := Date;
  dtpEndDate.Date := Date;
end;

procedure TfmLoadTime.bbOKClick(Sender: TObject);
var
  wJobCostCat, tJobCostCat, wUnit, wSubJobCostCat, wType : String;
  wRegRate, wPremRate : Single;

  i : Integer;
begin
  i := 0;
  with dmJCdata do
  begin
    with dbTcData do
    begin
      with quSelServer do
      begin
        if Active then
          Close;
        ParamByName('iCompanyID').AsString := wCompanyID;
        ParamByName('iModuleID').AsString := 'TC';
        Open;
        First;
        wServer := FieldByName('Server').AsString;
        close;
      end;
      Params.Values['SERVER NAME']:= wServer;
      Params.Values['USER NAME']:= wUserID;
      Params.Values['PASSWORD'] := wPassword;
      if not Connected then
        Connected := True ;
    end;
    with quJobDtl do
      if not Active then
        Open;
    dmJCData.dbJCdata.StartTransaction;

    with quImpCost do
    begin
      if Active then
        Close;
      ParamByName('Start_date').AsDate := dtpStartDate.Date;
      ParamByName('End_date').AsDate := dtpEndDate.Date;
      Open;
      gaLoadTime.MaxValue := RecordCount;
      First;
      tJobCostCat := '';
      while not eof do
      begin
        gaLoadTime.Progress := gaLoadTime.Progress + 1;
        if (FieldByName('Job_Cost_cat_fld').AsString <> tJobCostCat) then
        begin
          with quJobCostFile do
          begin
            if Active then
              Close;
            ParamByName('Job_cost_cat').AsString := quImpCostJOB_COST_CAT_FLD.AsString;
            Open;
            wJobCostCat := quJobCostFile.FieldByName('Job_cost_Cat').AsString;
            wUnit := quJobCostFile.FieldByName('Job_cost_cat_unit').AsString;
            wRegRate := quJobCostFile.FieldByName('Reg_rate').AsFloat;
            wPremRate := quJobCostFile.FieldByName('Prem_Rate').AsFloat;
           // wSubJobCostCat := quJobCostFile.FieldByName('Sub_Job_cost_cat').AsString;
            wType := quJobCostFile.FieldByName('Job_cost_Type').AsString;
            Close;
          end;
        end;
        try
          i := i + 1;
          quJobDtl.Insert;
          quJobDtl.FieldByName('Job_no_1').AsString :=
            quImpCost.FieldByName('Job_No_1').AsString;
          quJobDtl.FieldByName('Job_no_2').AsString := ' ';
          quJobDtl.FieldByName('Fwo_no').AsString :=
            quImpCost.FieldByName('Fwo_no').AsString;
          quJobDtl.FieldByName('Job_cost_cat').AsString := wJobCostCat;
          quJobDtl.FieldByName('Sub_job_no').AsString :=
           Copy(quImpCost.FieldByName('Job_No_1').AsString, 5, 3);
          //quJobDtl.FieldByName('sub_job_cost_cat').AsString := wSubJobCostCat;
          quJobDtl.FieldByName('Hist_date').AsDateTime :=
            quImpCost.FieldByName('Work_date').AsDateTime;
          quJobDtl.FieldByName('Site_no').AsString := '1';//wSiteNo;
          quJobDtl.FieldByName('Hist_seq').AsDateTime := Now + i * 0.00002;
          quJobDtl.FieldByName('Detail_type').AsString := wType;
          quJobDtl.FieldByName('Item_unit').AsString := wUnit;
          quJobDtl.FieldByName('User_id').AsString := wUserID;
          quJobDtl.FieldByName('detail_qty').AsFloat :=
            quImpCost.FieldByName('work_hours').AsFloat;
          //quJobDtl.FieldByName('Retain_Amt').AsFloat :=
          if quImpCost.FieldByName('Work_type').AsString = 'R' then
          begin
            quJobDtl.FieldByName('Item_unit_cost').AsFloat :=  wRegRate;
            quJobDtl.FieldByName('Detail_Amt').AsFloat :=
              quImpCost.FieldByName('work_hours').AsFloat * wRegRate;
            quJobDtl.FieldByName('Qty_type').AsString := 'R';
          end
          else
          begin
            quJobDtl.FieldByName('Item_unit_cost').AsFloat :=  wPremRate;
            quJobDtl.FieldByName('Detail_Amt').AsFloat :=
              quImpCost.FieldByName('work_hours').AsFloat * wPremRate;
            quJobDtl.FieldByName('Qty_type').AsString := 'P';
          end;
          quJobDtl.Post;
        except
          ShowMessage('更ア毖!');
          Abort;
        end;
        tJobCostCat := '0' + wJobCostCat;
        Next;
      end;
      with quJobDtl do
      begin
        dmJCData.dbJCdata.Commit;
        try
          ApplyUpdates;
          CommitUpdates;
        except
          CancelUpdates;
          ShowMessage('更ア毖!');
          Abort;
        end;
      end;
      with quUpdateHist do
      begin
        ParamByName('Start_date').AsDate := dtpStartDate.Date;
        ParamByName('End_date').AsDate := dtpEndDate.Date + 1;
        try
          ExecSQL;
        except
          CancelUpdates;
          ShowMessage('更ア毖!');
          Abort;
        end;
      end;
    end;
  end;
  with dmJCData do
    with quJCcontrol do
    begin
      if not Active then Open;
      First;
      if (quJCcontrolLAST_TC_DATE.AsDateTime < dtpEndDate.Date) or
         (quJCcontrolLAST_TC_DATE.IsNull) then
      begin
        Edit;
        quJCcontrolLAST_TC_DATE.AsDateTime := dtpEndDate.Date;
        Post;
      end;
      if Active then Close;
    end;
  ShowMessage('更Θ!');
  with dmJCdata.dbTcData do
    if Connected then
      Connected := False;
end;

end.
