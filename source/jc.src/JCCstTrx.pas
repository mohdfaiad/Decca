unit JCCstTrx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBTables, Wwtable, wwDialog, wwidlg, Wwquery, Menus, Grids,
  Wwdbigrd, Wwdbgrid, wwdblook, StdCtrls, Mask, wwdbedit, Wwdotdot,
  wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls;

type
  TfmJCCstTrx = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    spPost: TSpeedButton;
    dnaJob_cost_file: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    paSelect: TPanel;
    laJob_no: TLabel;
    dgrAdj: TwwDBGrid;
    mmJob_cost_file: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    quFwoNo: TwwQuery;
    quFwoNoFWO_NO: TStringField;
    quFwoNoDESCRIPTION: TStringField;
    quCostCat: TwwQuery;
    quCostCatJOB_COST_CAT: TStringField;
    quCostCatDESCRIPTION: TStringField;
    quCostCatJOB_COST_CAT_UNIT: TStringField;
    taJobFile: TwwTable;
    taJobFileJOB_NO_1: TStringField;
    taJobFileJOB_NO_2: TStringField;
    taJobFileDESCRIPTION: TStringField;
    taJobFileJOB_STATUS: TStringField;
    taJobFileJOB_TYPE: TStringField;
    quAdjJobDtl: TwwQuery;
    dsAdjJobDtl: TwwDataSource;
    usAdjJobDtl: TUpdateSQL;
    dlcJobCostCat: TwwDBLookupCombo;
    dlcFwoNo: TwwDBLookupCombo;
    dbdJobNo1: TwwDBComboDlg;
    dlcDocNo: TwwDBLookupCombo;
    quDocNo: TwwQuery;
    sdgJobNo: TwwSearchDialog;
    quCostCatJOB_COST_TYPE: TStringField;
    quCostCatREG_RATE: TBCDField;
    quCostCatPREM_RATE: TBCDField;
    quAdjJobDtlJOB_NO_1: TStringField;
    quAdjJobDtlJOB_NO_2: TStringField;
    quAdjJobDtlFWO_NO: TStringField;
    quAdjJobDtlJOB_COST_CAT: TStringField;
    quAdjJobDtlSUB_JOB_NO: TStringField;
    quAdjJobDtlHIST_DATE: TDateTimeField;
    quAdjJobDtlSITE_NO: TIntegerField;
    quAdjJobDtlHIST_SEQ: TDateTimeField;
    quAdjJobDtlDOC_NO: TStringField;
    quAdjJobDtlDETAIL_TYPE: TStringField;
    quAdjJobDtlDETAIL_AMT: TBCDField;
    quAdjJobDtlRETAIN_AMT: TBCDField;
    quAdjJobDtlDETAIL_QTY: TBCDField;
    quAdjJobDtlITEM_NO: TStringField;
    quAdjJobDtlWHS_CODE: TStringField;
    quAdjJobDtlITEM_UNIT_COST: TBCDField;
    quAdjJobDtlITEM_UNIT: TStringField;
    quAdjJobDtlINVC_NO: TStringField;
    quAdjJobDtlINVC_DATE: TDateTimeField;
    quAdjJobDtlCHQ_NO: TStringField;
    quAdjJobDtlCHQ_DATE: TDateTimeField;
    quAdjJobDtlUSER_ID: TStringField;
    quAdjJobDtlACCT_NO: TStringField;
    quAdjJobDtlPFT_CTR_1: TStringField;
    quAdjJobDtlPFT_CTR_2: TStringField;
    quAdjJobDtlCOMMENT: TMemoField;
    quAdjJobDtlQTY_TYPE: TStringField;
    quAdjJobDtlPOST_FLAG: TStringField;
    bmAdjDtl: TBatchMove;
    taJobDetail: TTable;
    quUpdateAdj: TQuery;
    quSelCostCat: TwwQuery;
    quSelCostCatJOB_COST_CAT: TStringField;
    quSelCostCatDESCRIPTION: TStringField;
    quSelCostCatJOB_COST_TYPE: TStringField;
    quSelCostCatJOB_COST_CAT_UNIT: TStringField;
    quSelCostCatREG_RATE: TBCDField;
    quSelCostCatPREM_RATE: TBCDField;
    quSelJobFwo: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbdJobNo1CustomDlg(Sender: TObject);
    procedure spPostClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure dlcDocNoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure quAdjJobDtlNewRecord(DataSet: TDataSet);
    procedure quAdjJobDtlAfterPost(DataSet: TDataSet);
    procedure quAdjJobDtlBeforeDelete(DataSet: TDataSet);
    procedure quAdjJobDtlBeforePost(DataSet: TDataSet);
    procedure dbdJobNo1Exit(Sender: TObject);
    procedure dlcJobCostCatExit(Sender: TObject);
    procedure dgrAdjColExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJCCstTrx: TfmJCCstTrx;

implementation
uses JcMain;
{$R *.DFM}

procedure TfmJCCstTrx.FormCreate(Sender: TObject);
begin
  Caption := wCompanyName + ' == ' + Caption;
  with taJobFile do
    if not Active then
      Open;
  with quCostCat do
    if not Active then
      Open;
  with quDocNo do
    if not Active then
      Open;
  with quAdjJobDtl do
    if not Active then
      Open;
end;

procedure TfmJCCstTrx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with taJobFile do
    if Active then
      Close;
  with quCostCat do
    if Active then
      Close;
  with quDocNo do
    if Active then
      Close;
  with quAdjJobDtl do
    if Active then
      Close;
end;

procedure TfmJCCstTrx.dbdJobNo1CustomDlg(Sender: TObject);
begin
  if sdgJobNo.Execute then
  begin
    quAdjJobDtlJOB_NO_1.AsString := taJobFileJOB_NO_1.AsString;
    
  end;
end;

procedure TfmJCCstTrx.spPostClick(Sender: TObject);
begin
  if MessageDlg('确實要更改成本?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Abort;
  try
    bmAdjDtl.Execute;
  except
    ShowMessage('更改失敗');
    Abort;
  end;
  with quUpdateAdj do
  begin
    ParamByName('Doc_no').AsString := dlcDocNo.Text;
    ExecSQL;
  end;
  ShowMessage('更改成功');
  quDocNo.Close;
  quDocNo.Open;
end;

procedure TfmJCCstTrx.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJCCstTrx.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJCCstTrx.dlcDocNoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  with quAdjJobDtl do
  begin
    if Active then
      Close;
    ParamByName('Doc_no').AsString := dlcDocNo.Text;
    Open;
  end;
end;

procedure TfmJCCstTrx.quAdjJobDtlNewRecord(DataSet: TDataSet);
begin
  with quAdjJobDtl do
  begin
    FieldByName('Job_no_2').AsString := ' ';
    FieldByName('Site_No').AsString := '1';
    FieldByName('Hist_date').AsDateTime := Date;
    FieldByName('Doc_no').AsString := dlcDocNo.Text;
    FieldByName('qty_Type').AsString := 'R';
    FieldByName('HIST_SEQ').AsDateTime := Now;
    FieldByname('User_id').AsString := wUserId;
    FieldByName('sub_job_no').AsString := Copy(FieldByName('Job_no_1').AsString, 5, 3);
  end;
end;

procedure TfmJCCstTrx.quAdjJobDtlAfterPost(DataSet: TDataSet);
begin
  with quAdjJobDtl do
  begin
    try
      ApplyUpdates;
      CommitUpdates;
    except
      CancelUpdates;
      showmessage('記錄不能更新,數据無效');
    end;
  end;
end;

procedure TfmJCCstTrx.quAdjJobDtlBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('确實要刪除?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Abort;
end;

procedure TfmJCCstTrx.quAdjJobDtlBeforePost(DataSet: TDataSet);
begin
  quAdjJobDtlDETAIL_AMT.AsCurrency := quAdjJobDtlDETAIL_QTY.AsCurrency *
                                        quAdjJobDtlITEM_UNIT_COST.AsCurrency;
  with quSelJobFwo do
  begin
    if Active then
      Close;
    ParamByName('Job_no_1').AsString := quAdjJobDtlJOB_NO_1.AsString;
    ParamByName('Fwo_no').AsString := quAdjJobDtlFWO_NO.AsString;
    Open;
    quAdjJobDtlSUB_JOB_NO.AsString := FieldByname('Sub_job_no').AsString;
    Close;
  end;
end;

procedure TfmJCCstTrx.dbdJobNo1Exit(Sender: TObject);
begin
  with quFwoNo do
  begin
    if Active then
      Close;
    ParamByName('Job_no_1').AsString := dbdJobNo1.Text;
    Open;
  end;
end;

procedure TfmJCCstTrx.dlcJobCostCatExit(Sender: TObject);
begin
  with quSelCostCat  do
  begin
    if Active then
      Close;
    ParamByName('Job_cost_cat').AsString := dlcJobCostCat.Text;
    Open;
    if quAdjJobDtlQTY_TYPE.AsString = 'R' then
      quAdjJobDtlITEM_UNIT_COST.AsCurrency := quSelCostCatREG_RATE.AsCurrency
    else
      quAdjJobDtlITEM_UNIT_COST.AsCurrency := quSelCostCatPREM_RATE.AsCurrency;
    quAdjJobDtlITEM_UNIT.AsString := quSelCostCatJOB_COST_CAT_UNIT.Asstring;
    quAdjJobDtlDETAIL_TYPE.AsString := quSelCostCatJOB_COST_TYPE.AsString;
    
  end;
end;

procedure TfmJCCstTrx.dgrAdjColExit(Sender: TObject);
begin
 // ShowMessage(dgrAdj.SelectedField.Name);
  if dgrAdj.SelectedField.Name = 'quAdjJobDtlDETAIL_QTY' then
  begin
     quAdjJobDtlDETAIL_AMT.AsCurrency := quAdjJobDtlDETAIL_QTY.AsCurrency *
                                        quAdjJobDtlITEM_UNIT_COST.AsCurrency;
  end;
end;

end.
