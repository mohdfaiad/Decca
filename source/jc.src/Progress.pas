unit Progress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, wwdbedit, Menus, wwSpeedButton, wwDBNavigator, Buttons,
  ExtCtrls, Wwdotdot, Grids, Wwdbigrd, Wwdbgrid, wwdblook, wwDialog, wwidlg,
  DBTables, Db, Wwdatsrc, Wwquery, Wwtable, ComCtrls, TestPrg, Wwdbdlg;

type
  TfmProgress = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaProgress: TwwDBNavigator;
    dnaProgressFirst: TwwNavButton;
    dnaProgressPrior: TwwNavButton;
    dnaProgressNext: TwwNavButton;
    dnaProgressLast: TwwNavButton;
    dnaProgressInsert: TwwNavButton;
    dnaProgressDelete: TwwNavButton;
    dnaProgressPost: TwwNavButton;
    dnaProgressCancel: TwwNavButton;
    mmJob_cost_file: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    paSelect: TPanel;
    dlcJobCostCat: TwwDBLookupCombo;
    sdgJobNo: TwwSearchDialog;
    Label2: TLabel;
    quProgress: TwwQuery;
    dsProgress: TwwDataSource;
    usProgress: TUpdateSQL;
    quProgressJOB_NO_1: TStringField;
    quProgressJOB_NO_2: TStringField;
    quProgressFWO_NO: TStringField;
    quProgressJOB_COST_CAT: TStringField;
    quFwoNo: TwwQuery;
    quCostCat: TwwQuery;
    quFwoNoFWO_NO: TStringField;
    quFwoNoDESCRIPTION: TStringField;
    quCostCatJOB_COST_CAT: TStringField;
    quCostCatDESCRIPTION: TStringField;
    quCostCatJOB_COST_CAT_UNIT: TStringField;
    N2: TMenuItem;
    mmProgress: TMenuItem;
    Label1: TLabel;
    dtpCompleteDate: TDateTimePicker;
    btnOK: TBitBtn;
    quProgressJobDesc: TStringField;
    quProgressFwoDesc: TStringField;
    quProgressFwoQty: TBCDField;
    TestPrg: TTestPrg;
    quProgressCOMPLETE_DATE: TDateTimeField;
    quProgressCOMPLETE_PERCENT: TBCDField;
    dgrProgress: TwwDBGrid;
    quProgressBUDGET_QTY: TBCDField;
    quFWOCostCat: TwwQuery;
    quFWOCostCatBUDGET_QTY: TBCDField;
    dbluJobFile: TwwDBLookupComboDlg;
    taJobFile: TwwTable;
    taJobFileJOB_NO_1: TStringField;
    taJobFileJOB_NO_2: TStringField;
    taJobFileDESCRIPTION: TStringField;
    taJobFileJobNo: TStringField;
    dnaProgressFilter: TwwNavButton;
    quProgressJobNo: TStringField;
    sbSetProgress: TSpeedButton;
    quFWOCostCatCOMPLETE_PERCENT: TBCDField;
    quProgresscalQty: TFloatField;
    quProgresscalRegQty: TFloatField;
    quProgresscalPremQty: TFloatField;
    dbluFWONo: TwwDBLookupCombo;
    sbJobFwo: TSpeedButton;
    sbSubJob: TSpeedButton;
    quProgresssubJobNO: TStringField;
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure quProgressBeforeDelete(DataSet: TDataSet);
    procedure quProgressNewRecord(DataSet: TDataSet);
    procedure mmProgressClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure dbluJobFileCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure taJobFileCalcFields(DataSet: TDataSet);
    procedure quProgressCalcFields(DataSet: TDataSet);
    procedure sbSetProgressClick(Sender: TObject);
    procedure dgrProgressColExit(Sender: TObject);
    procedure dbluJobFileExit(Sender: TObject);
    procedure quProgressBeforePost(DataSet: TDataSet);
    procedure sbJobFwoClick(Sender: TObject);
    procedure sbSubJobClick(Sender: TObject);
    procedure quProgressAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProgress: TfmProgress;

implementation

uses PrgrsDlg, ShortPrg, JCdatadm, jcMain, JobFWO, JCSubJob;

{$R *.DFM}

procedure TfmProgress.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmProgress.FormCreate(Sender: TObject);
begin
  Caption := wCompanyName + ' == ' + Caption;
  if gUseJobNo2 <> 'Y' then
  begin
    with quProgress do
      quProgressJOB_NO_2.Visible := False;
    with taJobFile do
      taJobFileJOB_NO_2.Visible := False;
  end;
  with quFWOCostCat do
  begin
    if Active then Close;
    if not Prepared then Prepare;
  end;
  with taJobFile do
    if not Active then
      Open;
  with quFwoNo do
  begin
    if Active then Close;
    if not Prepared then Prepare;
    Open;
  end;
  with quCostCat do
  begin
    if Active then
      Close;
    ParamByName('User_ID').Value := wUserID;
    Open;
  end;
  with quProgress do
    if not Active then
      Open;
  dtpCompleteDate.Date := Date;
end;

procedure TfmProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quFWOCostCat do
  begin
    if Active then Close;
    if Prepared then Unprepare;
  end;
  with taJobFile do
    if Active then
      Close;
  with quProgress do
    if Active then
      Close;
  with quFwoNo do
  begin
    if Active then Close;
    if Prepared then Unprepare;
  end;
end;

procedure TfmProgress.quProgressBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('确實要刪除<' + quProgressJobNo.Value +' > 么?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Abort;
end;

procedure TfmProgress.quProgressNewRecord(DataSet: TDataSet);
begin
  with quProgress do
  begin
    quProgressJOB_NO_2.AsString := ' ';
    quProgressCOMPLETE_DATE.AsDateTime := dtpCompleteDate.Date;
    quProgressJOB_COST_CAT.AsString := trim(dlcJobCostCat.Text);
    quProgressCOMPLETE_PERCENT.Value := 0;
    quProgressBUDGET_QTY.Value := 0;
    //FieldByName('Job_no_1').AsString := Trim(dbdJobNo1.Text);
  end;
end;

procedure TfmProgress.mmProgressClick(Sender: TObject);
begin
  Application.CreateForm(TfmPrgrsDlg, fmPrgrsDlg);
  try
    fmPrgrsDlg.ShowModal;
  finally
    fmPrgrsDlg.Free;
  end;
end;

procedure TfmProgress.btnOKClick(Sender: TObject);
begin
  if (dlcJobCostCat.Text <> '') then
  begin
    with quProgress do
    begin
      if Active then
        Close;
      ParamByName('JOb_cost_cat').AsString := dlcJobCostCat.Text;
      ParamByName('CompleteDate').AsDate := dtpCompleteDate.Date;
      Open;
    end;
  end
  else
  begin
    ShowMessage('請選擇成本!');
    dlcJobCostCat.SetFocus;
  end;
end;

procedure TfmProgress.dbluJobFileCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  with quProgress do
    with taJobFile do
      if not taJobFile.IsEmpty then
      begin
        quProgressJOB_NO_1.Value := taJobFileJOB_NO_1.Value;
        quProgressJOB_NO_2.Value := taJobFileJOB_NO_2.Value;
      end;
end;

procedure TfmProgress.taJobFileCalcFields(DataSet: TDataSet);
begin
  taJobFileJobNo.Value := taJobFileJOB_NO_1.Value;
  if (trim(taJobFileJOB_NO_2.Value) <> '') then
    taJobFileJobNo.Value := taJobFileJobNo.Value + trim(taJobFileJOB_NO_2.Value);

end;

procedure TfmProgress.quProgressCalcFields(DataSet: TDataSet);
begin
  quProgressJobNo.Value := trim(quProgressJOB_NO_1.Value);
  if (trim(quProgressJOB_NO_2.Value) <> '') then
    quProgressJobNo.Value := quProgressJobNo.Value
                           + '-' + trim(quProgressJOB_NO_2.Value);
  quProgresscalQty.Value := quProgresscalRegQty.Value
                          + quProgresscalPremQty.Value;
end;

procedure TfmProgress.sbSetProgressClick(Sender: TObject);
begin
  Application.CreateForm(TfmShortPrg, fmShortPrg);
  try
    fmShortPrg.ShowModal;
  finally
    fmShortPrg.Free;
  end;
end;

procedure TfmProgress.dgrProgressColExit(Sender: TObject);
begin
  with dgrProgress.SelectedField do
  begin
    with quProgress do
      if state = dsInsert then
      begin
        if FieldName = 'Job_No_1' then
          if gUseJobNo2 <> 'Y' then
            quProgressJOB_NO_2.AsString := ' ';
        if FieldName = 'FWO_NO' then
        begin
          with quFWOCostCat do
          begin
            if Active then Close;
            ParamByName('Job_No_1').Value := quProgressJOB_NO_1.Value;
            ParamByName('Job_No_2').Value := quProgressJOB_NO_2.Value;
            ParamByName('FWO_No').Value := quProgressFWO_NO.Value;
            ParamByName('Job_Cost_Cat').Value := quProgressJOB_COST_CAT.Value;
            Open;
            quProgressBUDGET_QTY.Value := quFWOCostCatBUDGET_QTY.Value;
            quProgressCOMPLETE_PERCENT.Value := quFWOCostCatCOMPLETE_PERCENT.Value;
            Close;
          end;
        end;
      end;
  end;
end;

procedure TfmProgress.dbluJobFileExit(Sender: TObject);
begin
  if gUseJobNo2 <> 'Y' then
    with quProgress do
    begin
      quProgressJOB_NO_1.Value := dbluJobFile.Text;
      quProgressJOB_NO_2.Value := ' ';
    end;
end;

procedure TfmProgress.quProgressBeforePost(DataSet: TDataSet);
begin
  with quProgress do
  begin
    if trim(quProgressJOB_NO_1.AsString) = '' then
    begin
      ShowMessage('工程編號不能為空');
      Abort;
    end;
    if trim(quProgressFWO_NO.AsString) = '' then
    begin
      ShowMessage('厂單編號不能為空');
      Abort;
    end;
  end;
end;

procedure TfmProgress.sbJobFwoClick(Sender: TObject);
begin
  with dmJCData do
  begin
    with quJob_file do
    begin
      if Active then
        Close;
      ParamByName('ojob_no_1').AsString := quProgressJOB_NO_1.AsString;
      ParamByName('ojob_no_2').AsString := quProgressJOB_NO_2.AsString;
      Open;
    end;
    with quJOB_FWO  do
    begin
      if not Active then
        Open;
      Locate('JOB_NO_1;JOB_NO_2;FWO_NO', VarArrayOf([quProgressJOB_NO_1.AsString,
                                                     quProgressJOB_NO_2.AsString,
                                                     quProgressFWO_NO.AsString]),
                                                     [loPartialKey]);
    end;
    Application.CreateForm(TfmJobFwo, fmJobFwo);
    try
      fmJobFwo.ShowModal;
    finally
      fmJobFwo.Free;
    end;
    with quJob_Fwo do
      if Active then
        Close;
    with quJob_file do
      if Active then
        Close;
  end;
end;

procedure TfmProgress.sbSubJobClick(Sender: TObject);
begin
  with dmJCData do
  begin
    with quJob_file do
    begin
      if Active then
        Close;
      ParamByName('ojob_no_1').AsString := quProgressJOB_NO_1.AsString;
      ParamByName('ojob_no_2').AsString := quProgressJOB_NO_2.AsString;
      Open;
    end;
    with quSub_job do
    begin
      if not Active then
        Open;
      Locate('JOB_NO_1;JOB_NO_2;SUB_JOB_NO', VarArrayOf([quProgressJOB_NO_1.AsString,
                                                     quProgressJOB_NO_2.AsString,
                                                     quProgresssubJobNO.AsString]),
                                                     [loPartialKey]);
    end;
    Application.CreateForm(TfmJcSubJob, fmJcSubJob);
    try
      fmJcSubJob.ShowModal;
    finally
      fmJcSubJob.Free;
    end;
    with quJob_file do
      if Active then
        Close;
    with quSub_job do
      if Active then
        Close;
  end;
end;

procedure TfmProgress.quProgressAfterPost(DataSet: TDataSet);
begin
  with quProgress do
    try
      ApplyUpdates;
      CommitUpdates;
    except
      ShowMessage('未能更新記錄');
    end;
end;

end.
